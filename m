Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D62C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy3YdWqFJNy5sq/10GkOJns1Ey6MZ1hFJo9OWJ642IY=; b=uxfol8NJ+mC4QDJ+IXvjZAt7Fb
	+zc7BRfbnn+hjypcSfmnBjgznA7/jH07N8sB5cmu5GCohijwEyZQCvtEog0vjW6zskzIlLTKeIHUH
	RoPxgg7kURBebLOSNsL7BDDg5BUJNtFP2LefQuPz4unYhgkl8dEzV+Egi4zjyTXsIyeWWWS1DOQAU
	kE47T+smEPJj0jzV8COwPPD0ZtNpq3wlE/UYVAsJCW2agHnWSem10hx//aJvY3Tehyk3zfZJl2RuU
	iLz7tDXOQEp5V1YoCynSLhGKEqqdeoAgJbe/Bxd3XOk3V+a3peio8KpEgTSSwsacSdEQBkXVXKugP
	8LqWV72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJO3-0000000F5FR-12up;
	Wed, 13 Aug 2025 21:51:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEQ-0000000F3hN-1VWH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sy3YdWqFJNy5sq/10GkOJns1Ey6MZ1hFJo9OWJ642IY=; b=D8u1enH1Q5erKhpk1XcVfEciXE
	MEorL+6SYQt4clFhuyjquv0ah02M4NupKUi1DfgddFBcqHjCoBh71+7BDW2u/NjBrSc0dSYQR4Vgq
	imuw/sgnCNY+IUH5FOUHBJvjf+kgXMdjcvCLRHkb2eZ+SX/r8BJVO5d+rUXL5NpCrqjNCw+9C4qGr
	TcjpnUCbrMHHWfXATjMMMjMt+QXapkpuEAf7b9YhU2j/gTVZKV6iKkkgMeSmMJT0iYH35OCE2IShv
	az08KDHJRs16ZBn5sqBOz+OkDACOhlqKhH9qTVvWw9syxFZ4elBU7IaRBOf/YglpCHhh/+kp1yuqK
	/ncEiPUw==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEK-0000000GCxD-1DFg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:42:01 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLffL42163419;
	Wed, 13 Aug 2025 16:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121301;
	bh=Sy3YdWqFJNy5sq/10GkOJns1Ey6MZ1hFJo9OWJ642IY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U1HO0dmyEYwzxhovy+KOhdLitTxaFYBnevJmW0unu5e72iliHDh44gU+PxiD6AuyQ
	 zBV59VfcqfKo+Df24XE33qB4PXEu2PC4SYUkxoj9ewn8o7kGo9c6M1AYghCp5TKRhC
	 Sdk4i0VY528fg8BKpzMyhc2IBjlP2j6yBrKSNplI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLffcm1253252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:41 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNI2611079;
	Wed, 13 Aug 2025 16:41:40 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 3/6] reset: lpc18xx: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:35 -0500
Message-ID: <20250813214138.477659-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224157_832603_FF4A3342 
X-CRM114-Status: GOOD (  13.65  )
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

Function register_restart_handler() is deprecated. Using this new API
removes our need to keep and manage a struct notifier_block and to
later unregister the handler.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/reset/reset-lpc18xx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-lpc18xx.c b/drivers/reset/reset-lpc18xx.c
index e42b2f24a93da..8ac9f237e1ceb 100644
--- a/drivers/reset/reset-lpc18xx.c
+++ b/drivers/reset/reset-lpc18xx.c
@@ -31,7 +31,6 @@
 
 struct lpc18xx_rgu_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	struct clk *clk_delay;
 	struct clk *clk_reg;
 	void __iomem *base;
@@ -41,11 +40,9 @@ struct lpc18xx_rgu_data {
 
 #define to_rgu_data(p) container_of(p, struct lpc18xx_rgu_data, rcdev)
 
-static int lpc18xx_rgu_restart(struct notifier_block *nb, unsigned long mode,
-			       void *cmd)
+static int lpc18xx_rgu_restart(struct sys_off_data *data)
 {
-	struct lpc18xx_rgu_data *rc = container_of(nb, struct lpc18xx_rgu_data,
-						   restart_nb);
+	struct lpc18xx_rgu_data *rc = data->cb_data;
 
 	writel(BIT(LPC18XX_RGU_CORE_RST), rc->base + LPC18XX_RGU_CTRL0);
 	mdelay(2000);
@@ -178,9 +175,8 @@ static int lpc18xx_rgu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "unable to register device\n");
 
-	rc->restart_nb.priority = 192,
-	rc->restart_nb.notifier_call = lpc18xx_rgu_restart,
-	ret = register_restart_handler(&rc->restart_nb);
+	ret = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART, 192,
+					    lpc18xx_rgu_restart, rc);
 	if (ret)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
-- 
2.39.2


