Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD75CD3446
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 19:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDfEIJgDQeH/y63Yprb/YwjwhKgmsTJz5ThcKnGEnPQ=; b=DMTiRLzSLqC1z4376dVap2dUMz
	O2K2JVg1JOUcU6vcdHQ0d4zQ35ZwEkYmr98tigxdzw2KzPQh5WSTJF1wmqjXyDpiBN4q+FELD3rp4
	vsLJusf6h36XBrOEfxGSiTueV8p3nDvmng6Ga/DQFwR1gw+qn/jbXX6LjBCmIq1hyci58G7aF34av
	zMYDSNWoZGgvDjEoBhnPu0US8k/38Tgy9lA3hLbH9T2YwGbuyYEpm/7kF9O07e+MW19V9UoT5ehPt
	qmy+S6tFGkrNNH4cBuhF0KxWpdblHfxxCHI0N2j3yP+WoRF5/GR2ibFPqgaxHy3zoJKj6Pq74i9J1
	IX60l4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49I-00000004gGP-1Kk1;
	Thu, 07 May 2026 19:12:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49E-00000004gE4-3HWq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 19:12:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99C103572;
	Thu,  7 May 2026 12:12:29 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC8833F836;
	Thu,  7 May 2026 12:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778181154; bh=jC69MN56j+dDhWLZA9FfhagiJUqk0pWPdGmzX5/344s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KO31acVSxOQs33/X1jolqA08ZBjuY+j8YfgHM+my3dY0IbqIUE15x0Z+ESZaNLcyY
	 2d4/kK40qoe/ZLcPpFyhxt/1kx4AjLMDctCcnZAshn4MiU3jaNipLK+4s2rwyA12EB
	 l1QvoMvlzoTo2yYhMA3eTBtBO4m63AbiYAjWfyNw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: etm4x: Correct TRCVMIDCCTLR1 save and restore
Date: Thu,  7 May 2026 20:12:19 +0100
Message-ID: <177818106098.834828.1400248440598042029.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408-arm_cs_fix_trcvmidcctlr1_typo-v1-1-6a5695363b46@arm.com>
References: <20260408-arm_cs_fix_trcvmidcctlr1_typo-v1-1-6a5695363b46@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_121236_857671_CDA02143 
X-CRM114-Status: UNSURE (   6.05  )
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


On Wed, 08 Apr 2026 13:31:43 +0100, Leo Yan wrote:
> It is a typo to use trcvmidcctlr0 to save and restore TRCVMIDCCTLR1.
> Use trcvmidcctlr1 instead.
> 
> 

Applied, thanks!

[1/1] coresight: etm4x: Correct TRCVMIDCCTLR1 save and restore
      https://git.kernel.org/coresight/c/0ec0a8785d21

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

