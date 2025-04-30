Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F75AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yi48UEdrlYG1MKx6ek9lxCC8DQd1piRBM7J6gtIu36U=; b=Fi6kD583OOdSmix+wcTTotGrBe
	Dh7cTmABk91WkbRt0I9fLKwTM54l1kUYBs1q4n/+s/ie0xae7oUYtu+qMsMXDyb42riUgogTa5iJr
	PaADwe1ZoSzZav2O5ll5vNtclOO/6X1BWty+MDG7Uvvs6ltxnTxpe2YPw1eP8b9g8spRr9q7Oi0DQ
	1rS39pQCZJ0qW+PnyOLOfcBra8ZWugceqJQAoB4AgQmwc63+q4biFTP4XQVRt990h/1hRVaQN4Nc+
	jiDko74qd6aaI7b/jaWbFoufdYsxu6RFvCoiALOyhRzXHUyiSqmnrw9aHJUzgBziuGNdU78TcEy/o
	tQygDENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9ug-0000000DMbR-0Nzv;
	Wed, 30 Apr 2025 16:03:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9ff-0000000DKlN-1uIT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:48:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38DB01063;
	Wed, 30 Apr 2025 08:48:17 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C61703F5A1;
	Wed, 30 Apr 2025 08:48:22 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Suzuki.Poulose@arm.com,
	leo.yan@arm.com,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v4 0/7] coresight: Clear self hosted claim tag on probe
Date: Wed, 30 Apr 2025 16:48:14 +0100
Message-ID: <174602806438.102450.17012321873232714214.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_084827_537018_C88C1D63 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 25 Mar 2025 11:58:45 +0000, James Clark wrote:
> I've gotten stuck a few times with unusable Coresight after a warm boot
> due to lingering claim tags, especially when testing the Coresight
> panic patchsets.
> 
> This change does some tidy ups, adds some debug messages and clears the
> self hosted claim tag on probe. The last two commits are unrelated
> tidyups but they touch some of the same functions so to avoid extra
> conflicts I'm including them here.
> 
> [...]

Applied, thanks!

[1/7] coresight: Convert tag clear function to take a struct csdev_access
      https://git.kernel.org/coresight/c/fc7fed6f
[2/7] coresight: Only check bottom two claim bits
      https://git.kernel.org/coresight/c/a4e65842
[3/7] coresight: Add claim tag warnings and debug messages
      https://git.kernel.org/coresight/c/a244a18c
[4/7] coresight: etm3x: Convert raw base pointer to struct coresight access
      https://git.kernel.org/coresight/c/a1b0e77c
[5/7] coresight: Clear self hosted claim tag on probe
      https://git.kernel.org/coresight/c/7cd63686
[6/7] coresight: Remove inlines from static function definitions
      https://git.kernel.org/coresight/c/48a5126b
[7/7] coresight: Remove extern from function declarations
      https://git.kernel.org/coresight/c/e6e6b692

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

