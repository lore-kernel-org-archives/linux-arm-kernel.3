Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93D6CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOqrt+X1MgrX06YG0uRc9BpYNXl9q+Neu4iKdp93TPs=; b=JVPz/H7KvCW08GsltY4p/weKEw
	HW7R62CDu2+oWdDIb0fZ/rdeJqbliqjdJWq5QFhi21X7mQsb+xBDLWn6vDNReWwxG/B/QMbZGsVmt
	XGekNCNrZqnnCYMNJqovlJFB3RbsBilF3ZcR6qS450ot2gEVUw+WHr0TIW84i88igNfEVSNvUsw7P
	gipbSx4svpgJOhE8+Y88GXrOE8SV1i8Gb8GV4XjYfzBtIu9pc6Pje8MOtNiftpLRssOmjeDh6+BmJ
	LNBX1IOGv7Gmd3S7qzRO8LLd8Yxba0Mhl//U0K9shhOS+OXb8eulNzdcTkhZpTevqSKbruULqw1e6
	xL9bBZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJJ0-0000000F4Tl-2avX;
	Wed, 13 Aug 2025 21:46:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEE-0000000F3em-186z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:41:51 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfgo61737102;
	Wed, 13 Aug 2025 16:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121302;
	bh=MOqrt+X1MgrX06YG0uRc9BpYNXl9q+Neu4iKdp93TPs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ovbl1XAW3oxAOCnxOLJJawfik+Re7PN5hgQVSC5cPx8urcpiiNm9OENX5sPkqshwq
	 a+Kqi4Wr6+KhqlPHiV0kMFyve/SFkLiDxVH/mgVr796BqxITnt+uERDw41y3gQGH41
	 JTlDJaAc8q9O2fuR66Dm1HUxrWhNgvAfkA8wlLIs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfgut1253257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:41 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNK2611079;
	Wed, 13 Aug 2025 16:41:41 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 5/6] reset: npcm: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:37 -0500
Message-ID: <20250813214138.477659-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_144150_439914_CF52386F 
X-CRM114-Status: GOOD (  14.28  )
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
 drivers/reset/reset-npcm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index e5b6127783a76..6939bb3eb1507 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -89,7 +89,6 @@ static const struct npcm_reset_info npxm8xx_reset_info[] = {
 
 struct npcm_rc_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	const struct npcm_reset_info *info;
 	struct regmap *gcr_regmap;
 	u32 sw_reset_number;
@@ -100,11 +99,9 @@ struct npcm_rc_data {
 
 #define to_rc_data(p) container_of(p, struct npcm_rc_data, rcdev)
 
-static int npcm_rc_restart(struct notifier_block *nb, unsigned long mode,
-			   void *cmd)
+static int npcm_rc_restart(struct sys_off_data *data)
 {
-	struct npcm_rc_data *rc = container_of(nb, struct npcm_rc_data,
-					       restart_nb);
+	struct npcm_rc_data *rc = data->cb_data;
 
 	writel(NPCM_SWRST << rc->sw_reset_number, rc->base + NPCM_SWRSTR);
 	mdelay(1000);
@@ -472,9 +469,8 @@ static int npcm_rc_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "nuvoton,sw-reset-number",
 				  &rc->sw_reset_number)) {
 		if (rc->sw_reset_number && rc->sw_reset_number < 5) {
-			rc->restart_nb.priority = 192;
-			rc->restart_nb.notifier_call = npcm_rc_restart;
-			ret = register_restart_handler(&rc->restart_nb);
+			ret = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART, 192,
+							    npcm_rc_restart, rc);
 			if (ret) {
 				dev_warn(&pdev->dev, "failed to register restart handler\n");
 				return ret;
-- 
2.39.2


