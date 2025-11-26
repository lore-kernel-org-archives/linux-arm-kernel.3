Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76020D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=; b=iQ6YfhYejqjCgL/l11WOnwwtio
	QcA3OaeCXMpxBXCLN9voOGmyPJyR4bUgg5+22lGsncF4Vf6My/qx0fVsFWDwO8pS3WoQmhdEKELIr
	tOnIg81+yiebQBnsVLPBYy4JYDRi+FNj5q9TTIDPN6vO1gVIQmnNCh9TOpx6srD912XvdPjB/XBGS
	k2jwqXsK6gY+oW0rLRbykkq8YkS0ciiC40fhlLWDS/hpNZXRi/Jp8fYIcUiDAouiVEn22iJ0QWFzs
	Fbpq1k5GkKlCOmDKnq3Mk7ltg3RB9wAS5v0CAYRccmyq+VIksdCWpn7+24iOpjuustu0ur1XpNCs8
	2HcSfJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErY-0000000Ezlr-3txl;
	Wed, 26 Nov 2025 12:43:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErS-0000000Ezix-2W0h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:43:09 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso1702783a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 04:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160985; x=1764765785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=Io7ejkkpZNyEmn7vJArFVokAaTSjKnO06ChTRMXq8qBjHu7tc4AkrHs7sSH4BXpot3
         r4D3XyYP3tt1Iw2UgicfcZNXQFy4f6+/OCiR6mz/5gemqp4nQqwasa6sxT3s78Jd8HPI
         LHVnKTSBxrDWEJgsrHj33tZx4SO8qqY38d4N0HIoKhFV6nL1gmIuKaCLFEsTXhjgP39y
         n5VxR8Jdp15amkmZYGJcH5+qx/DOBl8WPlaq8hSTj2x5jrAl6T5NHbembxgkZBy3Ikcz
         SkGSpG6XfMrw7wB1+7RtrklaKJ6B8yCI6/Ode4VFafz5J7d+BxtDNlYEcuAaaL0gQ6CR
         A1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160985; x=1764765785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=fthLTyyUaan6xO9DLbSRo7MhXie1x/GEEHOhe4CtABEi/hkIY935+YxKdB/442+v/x
         d3bLNVQny1qq8cpzzu0zKMhnmIWry4ZeNc6NEO5oomF1K9OpLvgNURRK5FzVfdxTEuaG
         eyHk2HN3Wga7NDSSo7pVxjZrht5/4qqINWwowIJnc2MVAordpF4Gpaqz53XZy+1mnCas
         HegEG3a97Xr24RfZsdRXkJYeZtI7GTntT+Q7Rgr4zb8TufbZmtYXcUvq15vegYFO/9bT
         KVXveJXwEijWa0P7DlKnF05EhHVg/r8DiTRUROkOk1zHGdamGIYWf9GeRMymvQ8jRhfH
         wNcw==
X-Forwarded-Encrypted: i=1; AJvYcCVHJsXo1LMTPUY/kZI9uJJBncjyfE8qNSpTMMHgUH71Axj/VNjAw1V+ndSkdZFpXmMuLSySAOsm+MZAXv7VDLed@lists.infradead.org
X-Gm-Message-State: AOJu0YxmMMW4Uehc83wag6Tfwle/oT0uwL+R6cfm2I0gxLywDmzurDUr
	1K66a7kN4ge7Q8sfEl2Swki5iKPMyDmMXzGnyUhyEqXxlTfGPcrVxuRB
X-Gm-Gg: ASbGnctLJqF1eES9RQLaWi7fr/7RFNXm6JWkKcwTx+j/6mbhpJWdd2gk01/e5pG3p+9
	ifIJeX1+52bNci+qYc9T9NAySI46zHJdgcqdG1uf+9f/9hpl+eeo1Dgw5jf4WwmdXzhYjFn/Ud9
	AouqCBudD42dJf4P33Xfmb3lHBgWMFEuBDiQALDyJLZWKYIZ4npqmq1QbEcKdVKjhn3EorzdZZZ
	yKBkYOFSu4r/5vHyAl+LWWO1uRsTBI6de8s6/PnHKZJkHpZJi45ScXu4cigGb1ij9evd1aeJ9va
	BxZ8VZrSE03MBsMbM3J8GxbEKPirybfNqS9p2qXxq7VX3sGqxO9hyYcIfY6+jlRen/vSliAKP06
	9FWOw8TI5wJJtpr/rfbLiafRsCWVmx3BSLLWf0Ox9dIOyYAE2CawekHkI9ELwDDwylyTdT73oo+
	iatj1soT5siDuNfQCPgaHWx5MeBYZhRx0/Od3a
X-Google-Smtp-Source: AGHT+IE/BZ0ev8jczVI6ig5ZypcAIr/hIiYi2tdzGsQKsQ4dJMO7/o1MUW3qqxHJXJn1yXPjYPs2Yg==
X-Received: by 2002:a05:6402:4499:b0:643:130b:c615 with SMTP id 4fb4d7f45d1cf-64539639594mr18794499a12.6.1764160984613;
        Wed, 26 Nov 2025 04:43:04 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:04 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 2/5] reset: imx8mp-audiomix: Switch to using regmap API
Date: Wed, 26 Nov 2025 04:42:15 -0800
Message-ID: <20251126124218.803-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_044306_737378_7F349A6E 
X-CRM114-Status: GOOD (  19.34  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Switch to using the regmap API to allow performing register operations
under the same lock. This is needed for cases such as i.MX8ULP's SIM LPAV
where clock gating, reset control and MUX-ing is performed via the same
register (i.e. SYSCTRL0) and different subsystem APIs.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 92 +++++++++++++++++----------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index acfa92b15329..f6152c0cc5ff 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -43,8 +44,7 @@ static const struct imx8mp_reset_map reset_map[] = {
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
-	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,26 +56,14 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, active_low;
-	unsigned long reg, flags;
+	unsigned int mask, offset, active_low, val;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
+	val = (active_low ^ assert) ? mask : ~mask;
 
-	spin_lock_irqsave(&priv->lock, flags);
-
-	reg = readl(reg_addr + offset);
-	if (active_low ^ assert)
-		reg |= mask;
-	else
-		reg &= ~mask;
-	writel(reg, reg_addr + offset);
-
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
+	return regmap_update_bits(priv->regmap, offset, mask, val);
 }
 
 static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
@@ -95,6 +83,52 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
 	.deassert = imx8mp_audiomix_reset_deassert,
 };
 
+static const struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+/* assumption: registered only if not using parent regmap */
+static void imx8mp_audiomix_reset_iounmap(void *data)
+{
+	void __iomem *base = (void __iomem *)data;
+
+	iounmap(base);
+}
+
+static int imx8mp_audiomix_reset_get_regmap(struct imx8mp_audiomix_reset *priv)
+{
+	void __iomem *base;
+	struct device *dev;
+	int ret;
+
+	dev = priv->rcdev.dev;
+
+	/* try to use the parent's regmap */
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (priv->regmap)
+		return 0;
+
+	/* ... if that's not possible then initialize the regmap right now */
+	base = of_iomap(dev->parent->of_node, 0);
+	if (!base)
+		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
+
+	ret = devm_add_action_or_reset(dev,
+				       imx8mp_audiomix_reset_iounmap,
+				       (void __force *)base);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register action\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to initialize regmap\n");
+
+	return 0;
+}
+
 static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 				       const struct auxiliary_device_id *id)
 {
@@ -106,36 +140,25 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	if (!priv)
 		return -ENOMEM;
 
-	spin_lock_init(&priv->lock);
-
 	priv->rcdev.owner     = THIS_MODULE;
 	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
 	priv->rcdev.of_reset_n_cells = 1;
-	priv->base            = of_iomap(dev->parent->of_node, 0);
-	if (!priv->base)
-		return -ENOMEM;
 
 	dev_set_drvdata(dev, priv);
 
+	ret = imx8mp_audiomix_reset_get_regmap(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regmap\n");
+
 	ret = devm_reset_controller_register(dev, &priv->rcdev);
 	if (ret)
-		goto out_unmap;
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
 
 	return 0;
-
-out_unmap:
-	iounmap(priv->base);
-	return ret;
-}
-
-static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
-{
-	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(&adev->dev);
-
-	iounmap(priv->base);
 }
 
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
@@ -148,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0


