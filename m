Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75B7D73E88
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vE00hYmdx7o3sIjFZ3v1tLzNU2nzuRyEF3Cy9MfR8U=; b=qbYW+WdrmT6RpLvhqY3hk3EXaz
	rGAl8X9/zZGGyU1NFvlbYKzT47CO7wUac39XMG1HScf93XL40+l9o+HbDnz91+Rrt/Z6Vpnc3RQgo
	j3YEnWOR3zU1qOQbXJ0EvGLrCFdw9QT/lMjmoQddz/ZJzIGuZqvs+2Rz5w/0GEc5xkWxFT7WpoJ7f
	4WxSntuQCuVWLxddCNMMFb2roAIm8dY+INTipVtG1zNK0hEe3MjMlDyrsUOWQPa/iA9G5KOzLhJ96
	ukl1QcTwQERY70AhY907OFQWW+DeM+mS78Z6iLnquR4eT034GbhJnH4WhRDhY/FRpDHOLHEDP0t94
	hqJVRykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYOM-00000000b0b-2weW;
	Thu, 29 Jan 2026 20:13:26 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYOD-00000000axp-2HyO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 20:13:20 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9131FC0005C8;
	Thu, 29 Jan 2026 12:13:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9131FC0005C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769717594;
	bh=et6N4cfzJ8iJ8J+J11kDsR+6my789ik2p+vGUxsWPSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdzi/GbZnS912paBPttXXNbhACqeFD5DeXLBYBi2M/ZMiaZUsYJx3x1M0LKzPNPVS
	 2/K/OLZ8wTjNb3QMekgujuJsNWIu3Atwo7A3Y7Sf5IcAWG3A9b6rzXENeljPcjE44F
	 CbPtFj6O7Xf/oqxu9Zii54ih9vpJ7pJzx9DXp80M=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 39FA522D76;
	Thu, 29 Jan 2026 12:13:14 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v3 2/2] gpio: brcmstb: allow parent_irq to wake
Date: Thu, 29 Jan 2026 12:13:12 -0800
Message-ID: <20260129201312.634819-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129201312.634819-1-florian.fainelli@broadcom.com>
References: <20260129201312.634819-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_121317_703413_45F73818 
X-CRM114-Status: GOOD (  23.03  )
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

From: Doug Berger <opendmb@gmail.com>

The classic parent_wake_irq can only occur after the system has
been placed into a hardware managed power management state. This
prevents its use for waking from software managed suspend states
like s2idle.

By allowing the parent_irq to be enabled for wake enabled GPIO
during suspend, these GPIO can now be used to wake from these
states. The 'suspended' boolean is introduced to support wake
event accounting.

Signed-off-by: Doug Berger <opendmb@gmail.com>
[florian: port changes after generic gpio chip conversion]
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 85 +++++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 42588196ce65..d4317dba66e5 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -54,6 +54,7 @@ struct brcmstb_gpio_priv {
 	int parent_irq;
 	int num_gpios;
 	int parent_wake_irq;
+	bool suspended;
 };
 
 #define MAX_GPIO_PER_BANK       32
@@ -239,6 +240,9 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
 {
 	int ret = 0;
 
+	if (priv->parent_wake_irq == priv->parent_irq)
+		return ret;
+
 	if (enable)
 		ret = enable_irq_wake(priv->parent_wake_irq);
 	else
@@ -289,6 +293,11 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
 	while ((status = brcmstb_gpio_get_active_irqs(bank))) {
 		unsigned int offset;
 
+		if (priv->suspended && bank->wake_active & status) {
+			priv->suspended = false;
+			pm_wakeup_event(&priv->pdev->dev, 0);
+		}
+
 		for_each_set_bit(offset, &status, 32) {
 			if (offset >= bank->width)
 				dev_warn(&priv->pdev->dev,
@@ -464,18 +473,18 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	}
 
 	if (of_property_read_bool(np, "wakeup-source")) {
+		/*
+		 * Set wakeup capability so we can process boot-time
+		 * "wakeups" (e.g., from S5 cold boot).
+		 */
+		device_set_wakeup_capable(dev, true);
+		device_wakeup_enable(dev);
 		priv->parent_wake_irq = platform_get_irq(pdev, 1);
 		if (priv->parent_wake_irq < 0) {
-			priv->parent_wake_irq = 0;
+			priv->parent_wake_irq = priv->parent_irq;
 			dev_warn(dev,
 				"Couldn't get wake IRQ - GPIOs will not be able to wake from sleep");
 		} else {
-			/*
-			 * Set wakeup capability so we can process boot-time
-			 * "wakeups" (e.g., from S5 cold boot)
-			 */
-			device_set_wakeup_capable(dev, true);
-			device_wakeup_enable(dev);
 			err = devm_request_irq(dev, priv->parent_wake_irq,
 					       brcmstb_gpio_wake_irq_handler,
 					       IRQF_SHARED,
@@ -486,6 +495,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 				goto out_free_domain;
 			}
 		}
+		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
 	}
 
 	priv->irq_chip.name = dev_name(dev);
@@ -496,9 +506,6 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
 
-	if (priv->parent_wake_irq)
-		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
-
 	irq_set_chained_handler_and_data(priv->parent_irq,
 					 brcmstb_gpio_irq_handler, priv);
 	irq_set_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
@@ -521,16 +528,11 @@ static void brcmstb_gpio_bank_save(struct brcmstb_gpio_priv *priv,
 					priv->reg_base + GIO_BANK_OFF(bank->id, i));
 }
 
-static void brcmstb_gpio_quiesce(struct device *dev, bool save)
+static void brcmstb_gpio_quiesce(struct brcmstb_gpio_priv *priv, bool save)
 {
-	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
 	struct brcmstb_gpio_bank *bank;
 	u32 imask;
 
-	/* disable non-wake interrupt */
-	if (priv->parent_irq >= 0)
-		disable_irq(priv->parent_irq);
-
 	list_for_each_entry(bank, &priv->bank_list, node) {
 		if (save)
 			brcmstb_gpio_bank_save(priv, bank);
@@ -548,8 +550,13 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 
 static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 {
+	struct brcmstb_gpio_priv *priv = dev_get_drvdata(&pdev->dev);
+
+	if (priv->parent_irq > 0)
+		disable_irq(priv->parent_irq);
+
 	/* Enable GPIO for S5 cold boot */
-	brcmstb_gpio_quiesce(&pdev->dev, false);
+	brcmstb_gpio_quiesce(priv, false);
 }
 
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
@@ -565,7 +572,30 @@ static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 
 static int brcmstb_gpio_suspend(struct device *dev)
 {
-	brcmstb_gpio_quiesce(dev, true);
+	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->parent_irq > 0)
+		priv->suspended = true;
+
+	return 0;
+}
+
+static int brcmstb_gpio_suspend_noirq(struct device *dev)
+{
+	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
+
+	/* Catch any wakeup sources occurring between suspend and noirq */
+	if (!priv->suspended)
+		return -EBUSY;
+
+	if (priv->parent_irq > 0)
+		disable_irq(priv->parent_irq);
+
+	brcmstb_gpio_quiesce(priv, true);
+
+	if (priv->parent_wake_irq)
+		enable_irq(priv->parent_irq);
+
 	return 0;
 }
 
@@ -573,25 +603,24 @@ static int brcmstb_gpio_resume(struct device *dev)
 {
 	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
 	struct brcmstb_gpio_bank *bank;
-	bool need_wakeup_event = false;
 
-	list_for_each_entry(bank, &priv->bank_list, node) {
-		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
-		brcmstb_gpio_bank_restore(priv, bank);
-	}
+	if (priv->parent_wake_irq)
+		disable_irq(priv->parent_irq);
 
-	if (priv->parent_wake_irq && need_wakeup_event)
-		pm_wakeup_event(dev, 0);
+	priv->suspended = false;
+
+	list_for_each_entry(bank, &priv->bank_list, node)
+		brcmstb_gpio_bank_restore(priv, bank);
 
-	/* enable non-wake interrupt */
-	if (priv->parent_irq >= 0)
+	if (priv->parent_irq > 0)
 		enable_irq(priv->parent_irq);
 
 	return 0;
 }
 
 static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
-	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
+	.suspend = pm_sleep_ptr(brcmstb_gpio_suspend),
+	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend_noirq),
 	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
 };
 
-- 
2.43.0


