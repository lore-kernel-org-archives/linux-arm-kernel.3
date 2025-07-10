Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3788CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 14:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eL6EO0AfkcKU5FQQnAqrLHBs8BIYbz1s1C2eqF9MYVE=; b=uYTtVqgCUANrlTH9bNmdJsIgIp
	Fgj3/TkXWBGnXUpGQDDH4VGkr9uEtAzK59KOIN7SUbTEXR9Hg0ndxI5cW8nfI2Mx56T2ZIu2qbRCq
	VEhuFoHGYNiweOTuGRSxrJRPLhF1Y9cP63yrokkSXrhvo4238WMGJp9pHmIH7lWY9X+GUXzOtd/Ht
	QKsX0GxRrK39P4MdW5+pCQhZUmdzAXvw7uoS0GN5G14xMe2c3BNP4w4NEdwPj2NCmAVsxNS0HYf7K
	2syGv2tqpjPCZsIaqkOOGTHcLb4WBT9MABCrj/LOBoW1PFXbFmoIf++KhcQkL+H3ARteYfXBlLVo4
	EUZUc0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsCG-0000000C6fF-1EZS;
	Thu, 10 Jul 2025 14:24:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqVG-0000000Bn9d-0GrV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:35:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27F181C0A;
	Thu, 10 Jul 2025 05:35:40 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D7733F738;
	Thu, 10 Jul 2025 05:35:50 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] coresight: Dismiss smatch warnings
Date: Thu, 10 Jul 2025 13:35:41 +0100
Message-ID: <175215088453.336221.17041410862781124219.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_053554_144552_47FD7E19 
X-CRM114-Status: UNSURE (   9.30  )
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


On Wed, 11 Jun 2025 15:44:00 +0100, Leo Yan wrote:
> This series polishes the code to address warnings reported by the smatch
> static checker.
> 
> Smatch reports a error "Function too hairy" for etm4x_sysreg_read() and
> etm4x_sysreg_write(). This is a trade off to avoid large code blocks,
> the implementation encapsulates logic using nested macros. But this is
> not friendly to static checker. For now, the code will be kept as is.
> 
> [...]

Applied, thanks!

[1/2] coresight: stm: Remove redundant NULL checks
      https://git.kernel.org/coresight/c/c33c8fc1
[2/2] coresight: perf: Use %px for printing pointers
      https://git.kernel.org/coresight/c/7b8584a4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

