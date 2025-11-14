Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F41CE7B08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tunUdZ+Uo3TFHtZ2y2DxEuFXtR8sw55m1IPZhLEhl+o=; b=X5n2qyX2xtpoB1Qxf/ATZ0zE3i
	2TXjskakDgPdP8Dy1w0qU5riR98IKdkrEbPQUvzFdd9AVFi/ukQn43u2oVP6BH1NH7N5FaASeCeDT
	1VjotE46K2iNMXRXGcMi+YVxg2LRVk5jueQM3eQkU3mSVkwchpU9XjWcTZ6KpwuudbnttZ81ocU0g
	1sIIIeWWCmdg/oflnhvoFeTkbKh/LF6CmNLyhbSHXdhtUy7wpVpTeCOk32ElUCyH1uE/2sN0icB2K
	s7DQWOOdrHOyjxW7hhs8qStFom0egBD4+MsmojzyzAfzCZW5WpA0JfblEVkDgfG6MF/I7+TeunuSB
	IJCOSd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0U-0000000CHBF-0dF0;
	Fri, 14 Nov 2025 13:38:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0Q-0000000CH8K-2Aus
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:38:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so3211796a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127505; x=1763732305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tunUdZ+Uo3TFHtZ2y2DxEuFXtR8sw55m1IPZhLEhl+o=;
        b=bt1cHerIRWlDp2h1JBso9oB42azbsN9hc7s3KHNkZoGT9+NesTaoqwp060b0laHAgS
         hgqx5xAZWQV8wuj7RPz+rOaZWdTQyD7yy9cG+RE+jujwln+UrS+VdCMu+KWdcEK5jbsN
         +HOD1p0g7zlk0vuvCYEC4TJYUE7yl0JeJD5r0h/YukNhU/5fNbcnOTIk5xkC3w30Sqor
         z2mmobjYzJZPPRENbtef4UZ/VYZUbE4AHKLZPJuiWYIFGtLiH6vx7Y1ktEr741zixx9v
         XDV4ttTi4vKTbyJRBy1OvsBoA1ofocFN7pKB0vwhPwNMOvYjAZGIKdysBbPihhWTrBTG
         tVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127505; x=1763732305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tunUdZ+Uo3TFHtZ2y2DxEuFXtR8sw55m1IPZhLEhl+o=;
        b=F2wj4EM1TyiKqbHa0d54iQgonAklh8wEteAG8w51v/qK6yJJ/ZSYTNMeBsqLNvEko3
         8GoCtK3kwms8fwKdsHhqQq6ClOGMJwkFsy/372ZrYobl4HjI6C2+igjPjWyL4zy7kp+j
         PB4WnQIiqau3AmTxaV/97SZLiLI1fg/L/1sIwCwWxZFZb+yYLrD1M0eyqHJZtIggacQO
         +GDVNFsunhUjGW8Ul/3HxA/rNJYXRPYfWz8plvryYrvCssorD7f63wQt4a1sMbjvEdIy
         T9BcAcy1ObRzZIrPSiO0lvbasTuGoO9R7enMniDHw7YOxQTfxr6VwQRc8Wn2+6rmZROT
         cIUw==
X-Forwarded-Encrypted: i=1; AJvYcCWJFSYLw+jMi3aCVKZ0OPtlOsbDYczytjvcSYkeKgvDQJBxaooV6tp2Q6wknNmTSP8BNr45zMcUCgWGtcn4z7fJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yym/11RScuxZJ4Wim4BuxHqr4Kijv3rvo0WLD2JohL07iUOVmg1
	yAh8sglrmZGQGTHw2lJS/i2JqtYuMTZVFhYfMdr9T+P/BNqbi71Wn7P+
X-Gm-Gg: ASbGncsR748k9QzdQwedPTCoq6Y6QxyAjZx2SyrqCDNQxhPucTkPOVmCE3IlJBbESV3
	ZJHgApMnBm1wqVgZBtB48XW/bza1NTcqtdwUQfUXfi2tK7RVg3YaVhwhDcf6xGp76cZ+nmaBzFJ
	uwtpbSQYxr632HSnGiA58iivy/dhWemGpRqQ5imPhlR4Sw++bqJsni/1AqsdPvxKdTaWGHGhEBv
	X46rUedubHdDLGhq9/iVgTE/q2pRul5vPA/KZjATrp1lx7eJurNBI6VSJGg8pzX+3ct3LA+fec+
	HPtItnjMISk9AA4wtKUS0E9qtXSNwC5sGvfcx2yE3hDwmFeSFXt81U/1aHABc7NFvrnQ7Q7yvnG
	39IWj3ea/F+RR0gcYePCaZBnzubS31efmWhk9NoHTC3KRCpPcfRT07JPHYLnS53vPyXf9L8GcKq
	RwVcX5NQViqO+9dL27gcsNb5Nanjw=
X-Google-Smtp-Source: AGHT+IFL+db8xrLuL7QGFf6oOiM4PGKjgJRPl7rpZxY6Gpc3+rpth3N0E++6rvqNnt7UZ+YGTI57Qg==
X-Received: by 2002:a17:906:7307:b0:b73:5146:8b7b with SMTP id a640c23a62f3a-b73678e9981mr238611666b.36.1763127504345;
        Fri, 14 Nov 2025 05:38:24 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:24 -0800 (PST)
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
Subject: [PATCH v5 3/6] reset: imx8mp-audiomix: Switch to using regmap API
Date: Fri, 14 Nov 2025 05:37:35 -0800
Message-ID: <20251114133738.1762-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053826_591144_0862C57C 
X-CRM114-Status: GOOD (  18.60  )
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 92 +++++++++++++++++----------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index d993c294c548..35df9bd5f71a 100644
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
 
 	mask = BIT(reset_map[id].bit);
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
+	val = (active_low ^ assert) << reset_map[id].bit;
 
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


