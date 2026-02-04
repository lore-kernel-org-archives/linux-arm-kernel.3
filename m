Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA5EE9D410
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VSYhD/JIXXAZ4/KPI8L3v3LKwgnFjCcjBlWk8x9IOo=; b=U4uEoPDTAzPvUUji3Q6Vg4xynR
	4vmAUQeg0aZOfjZBxHH3KKUf8eLNRY0CKIyb6vhJjj6MYRCMj3bU2GixDybeY6KwC9TQoa8qfQsb1
	qaodB1+MeT1Bk+m1me89RAFhGKtbJ2K+14Ej9V7TM4/afFAg+NHPVDwsuCPgG/oGtgrhwdiVXKxvR
	XS1D0i1JwwDldinFt9znB1MN4EtP6CIzHnu8EVsxSV2HKBVZyB7wDxDFPRl7koV4AZFX8vkndx7Xn
	xmMLZjlXPkyqCnQ1QzWVkwooctdWECb0ZLWzV8urfWQHsSev3NY650lHozVm+qx7XiORfLjbR1UCE
	KkUI8Wzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfyf-00000008mZk-1vTy;
	Wed, 04 Feb 2026 16:43:41 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfyZ-00000008mWs-44yj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 16:43:39 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 19153C0292A8;
	Wed,  4 Feb 2026 08:43:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 19153C0292A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770223415;
	bh=JBbhEQai7vXlNMQlXwouGGF4noGDFT06JCoE/vH6uLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UeOdtCqrIeAkOVVnKX2KgiSfngZ8JurPrzsA3IUv22CjsWz0C0vzNbMrT7ytBkVqz
	 twZiOILbcu0Ig1csfaF+MOogsRlDs9rmifguV/byDDlst9b46XnQ3RCSW7DzXwO/oU
	 RA8P7J/zd/sQp2ufgaGofHXefE0gN7hRBl3qmma4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EB5551B869;
	Wed,  4 Feb 2026 08:43:34 -0800 (PST)
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
Subject: [PATCH v5 3/3] gpio: brcmstb: allow parent_irq to wake
Date: Wed,  4 Feb 2026 08:43:33 -0800
Message-ID: <20260204164333.1146039-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
References: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_084336_098593_45CC4034 
X-CRM114-Status: GOOD (  23.17  )
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
index 7ebf1217f383..44ca798cf832 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -54,6 +54,7 @@ struct brcmstb_gpio_priv {
 	int parent_irq;
 	int num_gpios;
 	int parent_wake_irq;
+	bool suspended;
 };
 
 #define MAX_GPIO_PER_BANK       32
@@ -240,6 +241,9 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
 {
 	int ret = 0;
 
+	if (priv->parent_wake_irq == priv->parent_irq)
+		return ret;
+
 	if (enable)
 		ret = enable_irq_wake(priv->parent_wake_irq);
 	else
@@ -290,6 +294,11 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
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
@@ -463,18 +472,18 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
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
@@ -485,6 +494,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 				goto out_free_domain;
 			}
 		}
+		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
 	}
 
 	priv->irq_chip.name = dev_name(dev);
@@ -495,9 +505,6 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
 
-	if (priv->parent_wake_irq)
-		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
-
 	irq_set_chained_handler_and_data(priv->parent_irq,
 					 brcmstb_gpio_irq_handler, priv);
 	irq_set_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
@@ -520,16 +527,11 @@ static void brcmstb_gpio_bank_save(struct brcmstb_gpio_priv *priv,
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
@@ -547,8 +549,13 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 
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
@@ -564,7 +571,30 @@ static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 
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
 
@@ -572,25 +602,24 @@ static int brcmstb_gpio_resume(struct device *dev)
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


