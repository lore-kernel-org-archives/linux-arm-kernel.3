Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAFEC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8N11Ts4OI8OSIhgRC8BJfLiXkW853aqkGdyNUQ2y80=; b=rlTmrzzzharq5Pp9OOgIKAoqWx
	CedJn+72U7SdqUZuC+8lZBSH8hxuk35f+gYkdfnUX7gvKbeCTGzWTDSc+Q84UyHMv4LpqGdLAELzV
	OcB7Mn6BDy9FGII/qmTSErDcyKmOhuVX4lxSG0zlmDPejPhMLNk76DHnJNSyjweFpjuFdZl56iRZ1
	Q4BUE2Qo/T03XmG52zxcr7xvnwKzxl/VzBZbyU0CNG68DpJnAvy0NH9uq+aDc1TdeuojQCDgzVSXS
	XyMPaIBrYwoD2ERA9puwY+ns2V0Q6Ga8Oioxsk9phO2SZ5ENOC2vjWCjyYYD8SMqsKBry7wcHF+DQ
	lqoD2syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhM-00000001jBI-3r3i;
	Mon, 07 Apr 2025 18:59:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qwV-00000001TzF-0HfG;
	Mon, 07 Apr 2025 18:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82D0FA484AD;
	Mon,  7 Apr 2025 18:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CD6C4CEE7;
	Mon,  7 Apr 2025 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049489;
	bh=ubgTwErU6Nlpq6QQ7KcF793k4I1W9vkMulHQMS8rMqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQqHxKrxynEPRsyRKmiDop40+e3PWtu2k7BcsjCJaqyLBE7h5vrNTi5wEDfFjtHWH
	 uMuF08PjR6snNFa/S25PFxE0JjMBcPBvwB2MlD1HSSgc+6LmgJ2lpNj9umcOkOIdUw
	 mxe6zihCEoAMJaIxJi0LQJmMfj1g9lOnuNj6K2+dUzuyWiS2+Ob5TXF5uNot6kGGWN
	 CCBjQ1Xnp9T8Qv+jaDnsSRmxbMHVw9WAWXuo6j10NF3+rc3NL2EeUWvyX/S+ikpiD/
	 DpY897GZXRtUACtxxR/aAyrqawkrdlelXdwUIuR8NYH63kfVQfqpJCfMWkH7J/cIB4
	 0MGVOsdX4h7Pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	kernel test robot <lkp@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 12/31] dmaengine: bcm2835-dma: fix warning when CONFIG_PM=n
Date: Mon,  7 Apr 2025 14:10:28 -0400
Message-Id: <20250407181054.3177479-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181054.3177479-1-sashal@kernel.org>
References: <20250407181054.3177479-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111131_172920_B8E420FE 
X-CRM114-Status: GOOD (  11.68  )
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

From: Stefan Wahren <wahrenst@gmx.net>

[ Upstream commit 95032938c7c9b2e5ebb69f0ee10ebe340fa3af53 ]

The old SET_LATE_SYSTEM_SLEEP_PM_OPS macro cause a build warning
when CONFIG_PM is disabled:

warning: 'bcm2835_dma_suspend_late' defined but not used [-Wunused-function]

Change this to the modern replacement.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501071533.yrFb156H-lkp@intel.com/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Link: https://lore.kernel.org/r/20250222095028.48818-1-wahrenst@gmx.net
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/bcm2835-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 20b10c15c6967..0117bb2e8591b 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -893,7 +893,7 @@ static int bcm2835_dma_suspend_late(struct device *dev)
 }
 
 static const struct dev_pm_ops bcm2835_dma_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
+	LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
 };
 
 static int bcm2835_dma_probe(struct platform_device *pdev)
-- 
2.39.5


