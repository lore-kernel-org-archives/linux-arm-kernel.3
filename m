Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9565CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQcBjCnOuHYG+l1tmZJq0ANml4aVyybZgww+09zyHFo=; b=jyQb7wafL6xD8HD69/BdZuQvRB
	xL3/SmJTu8kIb2PAYxbc+hlAenEXC/9qFywDh+HWPO2Bq0nKLJPEAUXHvuKH0sGAWHm2NSJRKA/oi
	oax6MYAo5b8VokaRmAbdP7l1Jo6JFAlLtZp1DOrC5YI/uq2x5M69BOPgeuk0TYTrq/J13Y50fKv3q
	djxBhoJpTqPQQ/L+lXgnQj/GNGAYCuSuvjPIkCCig0RNxU+/ozy5OkwMnnAbLxoNOpPdLJWi6Z26Z
	LYpdpe7nUWRJSila1koJbsG28gbA6JbbhK/vuB0/mB4OdZIspVTmitCMTLZ+bJcP4FaZtpr3DowN+
	ArEt4bkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJLX-0000000F4tm-24Hv;
	Wed, 13 Aug 2025 21:49:23 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEE-0000000F3en-18Fn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:41:52 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfgZ81737106;
	Wed, 13 Aug 2025 16:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121302;
	bh=ZQcBjCnOuHYG+l1tmZJq0ANml4aVyybZgww+09zyHFo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k2jaOzW0eX1Q9Lh1Jg+5ql5U2GDt6e1QDt+kaPPCTFvdR2o1jyNv9UVaqVKwWQmXQ
	 JGyZJOUhqG10nwoarENrF8+Nzk50CZ6WxRHAAyRinTmsaJv90JgCJJ2X/Phfv/Uw6B
	 4Teq74wPC4KX2n3lIDF8cWQAIOQCHTgr4YrUsr4s=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfgum1253263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:42 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNL2611079;
	Wed, 13 Aug 2025 16:41:41 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 6/6] reset: sunplus: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:38 -0500
Message-ID: <20250813214138.477659-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_144150_437855_FD77127D 
X-CRM114-Status: GOOD (  13.89  )
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
 drivers/reset/reset-sunplus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-sunplus.c b/drivers/reset/reset-sunplus.c
index df58decab64da..58b0874337598 100644
--- a/drivers/reset/reset-sunplus.c
+++ b/drivers/reset/reset-sunplus.c
@@ -100,7 +100,6 @@ static const u32 sp_resets[] = {
 
 struct sp_reset {
 	struct reset_controller_dev rcdev;
-	struct notifier_block notifier;
 	void __iomem *base;
 };
 
@@ -154,10 +153,9 @@ static const struct reset_control_ops sp_reset_ops = {
 	.status   = sp_reset_status,
 };
 
-static int sp_restart(struct notifier_block *nb, unsigned long mode,
-		      void *cmd)
+static int sp_restart(struct sys_off_data *data)
 {
-	struct sp_reset *reset = container_of(nb, struct sp_reset, notifier);
+	struct sp_reset *reset = data->cb_data;
 
 	sp_reset_assert(&reset->rcdev, 0);
 	sp_reset_deassert(&reset->rcdev, 0);
@@ -189,10 +187,8 @@ static int sp_reset_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	reset->notifier.notifier_call = sp_restart;
-	reset->notifier.priority = 192;
-
-	return register_restart_handler(&reset->notifier);
+	return devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
+					     192, sp_restart, reset);
 }
 
 static const struct of_device_id sp_reset_dt_ids[] = {
-- 
2.39.2


