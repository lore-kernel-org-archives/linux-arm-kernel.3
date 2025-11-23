Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84ECCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYDXRDC7BF3mjO2jbXpNUEIaCR4fosllXoL7yD9gxs4=; b=eQplSvatG8tvh3StrBOKxyCjbd
	JDPBYLsyqJ/0rrwk0bCI8Nf/9XDVnjQmBWCw0/Nfsrr/ow3zyWa1lCp6uZAcoDd8J8FVMBOHm5Ukm
	YfNqTy1Kb4firmVH52v+zioe2BwYSyUo4axQUrvBoeq/k72ytO4O7v39JXy++qMkqfYQN1icGVYZi
	C0ZPr2XsEiYd4ArQNuNBKD1IPX8DuZqW6kn3Gx7GOG1K5sgUo99G9k5Ax0+1sKm5+FYulvyeedUMZ
	pSUE/KD45OQ1pavQivu0vbeuJceMX1LsXfJi9aqVR71JRiOIE3/bGSuVp0kjvsEFZz49err+szf61
	E1JB6KKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a9-0000000AFkJ-3tXE;
	Sun, 23 Nov 2025 08:36:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a6-0000000AFhq-0X2H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 08:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8568443C3;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9161EC2BC9E;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763886984;
	bh=XywpMBorThuIKgeGhgmqKn4VVOL6JzS6r+Dw3Lm+3d4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V/QC1nEcPQTwG9JdsiEwRV0U1JqdLDptZqAMBYHB41kEtyX3L2fYB6kUwlPgaKzuv
	 hGm05S2fVwgOU/FJNUz6usHvdAEp99DiRqTGm4QciJftBSkuH5we9RhCdOylSXokkj
	 RJ/7/hTKxxwJHNMwys0y+vuAat6uguT+jc94V5YZAGgxVve2VOUGfNc726P8OlcDMC
	 MqujKW1zAKq1bAL04pECILC8ebsP8LS1/5DMNKDkbt/rULH5QcwmppN45kHUYTs680
	 Jyi9YRy786cco16qnjR7HCWbwy/pVoUKrf21bINyH2qS6YFEmp3+3Kvfvg4Ak2YDzo
	 GKwR7bq83sLFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86336CFD313;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 23 Nov 2025 08:35:51 +0000
Subject: [PATCH 4/6] mfd: max77759: modify irq configs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
In-Reply-To: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763886983; l=4037;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=ydOm266hojKPbD6WEKQRUV3ZGSm1ejU3wNAfglGRhno=;
 b=V5F8mWlubDiqVeB/Qx2PXvLfFRy1bZXHPRhI1RFtIE+oJ0pFc2cLyPkBnE4Kufu8NvwJsgyWT
 q5sdtKQKd+JDkFRFS2KdOYsKLKdNAoQm0EpFjoOIr8sEAt7k5C0bEGV
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_003626_211016_F318F330 
X-CRM114-Status: GOOD (  12.39  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Define specific bit-level masks for charger's registers and modify the
irq mask for charger irq_chip. Also, configure the max77759 interrupt
lines as active low to all interrupt registrations to ensure the
interrupt controllers are configured with the correct trigger type.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 drivers/mfd/max77759.c       | 24 +++++++++++++++++-------
 include/linux/mfd/max77759.h |  9 +++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 6cf6306c4a3b..5fe22884f362 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_irqs[] = {
 };
 
 static const struct regmap_irq max77759_chgr_irqs[] = {
-	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
-	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
+	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
+		       MAX77759_CHGR_REG_CHG_INT_AICL |
+		       MAX77759_CHGR_REG_CHG_INT_CHGIN |
+		       MAX77759_CHGR_REG_CHG_INT_CHG |
+		       MAX77759_CHGR_REG_CHG_INT_INLIM),
+	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
+		       MAX77759_CHGR_REG_CHG_INT2_BAT_OILO |
+		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC |
+		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV |
+		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO |
+		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE),
 };
 
 static const struct regmap_irq_chip max77759_pmic_irq_chip = {
@@ -486,8 +495,8 @@ static int max77759_add_chained_irq_chip(struct device *dev,
 				     "failed to get parent vIRQ(%d) for chip %s\n",
 				     pirq, chip->name);
 
-	ret = devm_regmap_add_irq_chip(dev, regmap, irq,
-				       IRQF_ONESHOT | IRQF_SHARED, 0, chip,
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT |
+				       IRQF_SHARED | IRQF_TRIGGER_LOW, 0, chip,
 				       data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add %s IRQ chip\n",
@@ -519,8 +528,9 @@ static int max77759_add_chained_maxq(struct i2c_client *client,
 
 	ret = devm_request_threaded_irq(&client->dev, apcmdres_irq,
 					NULL, apcmdres_irq_handler,
-					IRQF_ONESHOT | IRQF_SHARED,
-					dev_name(&client->dev), max77759);
+					IRQF_ONESHOT | IRQF_SHARED |
+					IRQF_TRIGGER_LOW, dev_name(&client->dev),
+					max77759);
 	if (ret)
 		return dev_err_probe(&client->dev, ret,
 				     "MAX77759_MAXQ_INT_APCMDRESI failed\n");
@@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -EINVAL,
 				     "invalid IRQ: %d\n", client->irq);
 
-	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
+	irq_flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;
 	irq_flags |= irqd_get_trigger_type(irq_data);
 
 	ret = devm_regmap_add_irq_chip(&client->dev, max77759->regmap_top,
diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
index c6face34e385..0ef29a48deec 100644
--- a/include/linux/mfd/max77759.h
+++ b/include/linux/mfd/max77759.h
@@ -62,7 +62,16 @@
 #define MAX77759_CHGR_REG_CHG_INT               0xb0
 #define MAX77759_CHGR_REG_CHG_INT2              0xb1
 #define MAX77759_CHGR_REG_CHG_INT_MASK          0xb2
+#define MAX77759_CHGR_REG_CHG_INT_AICL          BIT(7)
+#define MAX77759_CHGR_REG_CHG_INT_CHGIN         BIT(6)
+#define MAX77759_CHGR_REG_CHG_INT_CHG           BIT(4)
+#define MAX77759_CHGR_REG_CHG_INT_INLIM         BIT(2)
 #define MAX77759_CHGR_REG_CHG_INT2_MASK         0xb3
+#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO     BIT(4)
+#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC   BIT(3)
+#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV   BIT(2)
+#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO   BIT(1)
+#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)
 #define MAX77759_CHGR_REG_CHG_INT_OK            0xb4
 #define MAX77759_CHGR_REG_CHG_DETAILS_00        0xb5
 #define MAX77759_CHGR_REG_CHG_DETAILS_01        0xb6

-- 
2.52.0.rc2.455.g230fcf2819-goog



