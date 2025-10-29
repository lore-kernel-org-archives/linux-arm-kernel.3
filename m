Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C98CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0zuCkqo/yYV3kQ7MqBUgd3ahReWAttM1hFVGag3dBs=; b=vpCMWrq+EHa1kwiPN7qXCScExu
	seJqOh/Fblo7kWVCvaDrI3oR6H1Vcluhh+APictn1yocrJz4pg7fEbLThnuHr/UUN0+mF2C2Qwup5
	RVAOIiw+FXom35TvX6iZ2FY0RJ/FpfITqyvuNznzye/LmTEMjAoG3CLleGp/9kqTSV0tIHM4zYqOE
	4k8eU7TOfuNpuVS9X2/CkWNk9cpWsQlI2c9UbcVhJawrcMJSlQKIzW7J+fLtGv57TSFUBZIXxkNFN
	V87LtbehUYM+YUfdsrq0lvGQASYtur0A+C38A/UJGH3CfwxES5yzEKdqqnS2XyyNizBmFeTJWJi86
	wd67oauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6f1-00000001Spr-3fEv;
	Wed, 29 Oct 2025 13:56:23 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6es-00000001Sjt-35zv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:56:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b6d3effe106so1613257766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746172; x=1762350972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0zuCkqo/yYV3kQ7MqBUgd3ahReWAttM1hFVGag3dBs=;
        b=HRHHGqxX+zsb0Fvp4xp3gZdp7hPE/X0BS1icCC+Qj1JhDslUCdN/6TYrbdbRrA+xo/
         Kknxe9xqTfHbnj8Y3llfq62g+V0vZljv4vLz3Qd1+FCEZf72UU1BC1GcMQK7A7U2YMS6
         DBFJ/QQcSd0u7rvIDyW3FlnJbfmxdtoiH89FYAJGo+MC1wwTrv4I5GU/FAq2f+EPl4RC
         MRjD0DDjXqmJZPy8KQdNdHXfilPq62SoHjRpfUIVOjye1hE8asWcQMTxYFF5hjXXblVq
         1iQukzW/W8Yuszd3ViJ/ASinhxkwDJ+9vi/AOv5neYoOdWUgqIfn/Q1HZzgOmrt6V6JP
         4V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746172; x=1762350972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0zuCkqo/yYV3kQ7MqBUgd3ahReWAttM1hFVGag3dBs=;
        b=FoHeVzX5H2lyF3WJkPGb8SHEgjdxyajtEOESjhR75l4hAmYwk74lET0slRm2qz3rKg
         IxIxIo7qjbbdpPdwxU9dGnLCxhlJb9PE8US09X9skrNQCARU42aAaPa8BLbxzMSU2401
         SvW8TDlkI/mjb0M1+HvlMDvUDblp2vTUHvKaMplw3r4QyFNMZch6yFEm7nQV0rDomdL4
         ZapX8cDKXsTwyensCTiszyDj9GPNK7rm6jesE533pmqQXh7AMcRX5AP8fQuOMoSoeGvW
         OEjSKQoPm87GAs2aWGEW5yffkYRsA+fAFK6RDSRfufJ7pBvywxXM46k+L05vaBLQvzDg
         0z4A==
X-Forwarded-Encrypted: i=1; AJvYcCWVbZUmdjHyeLcHBEXieJzblL7MaHZ5ge5hRnFgCSX7Ck3tSHuneyeKANrJ/zpVKwiXIEGNXWECaRXFI88OpAI0@lists.infradead.org
X-Gm-Message-State: AOJu0YzptLMIbMeoy0KXKxKr8AyiT7dWf6d/0kOI7RXM8j8uUUkSvTKA
	GvHKuqxL/fQxiht4E+QHdvm36WGsuZ5QSQV0/cCOp42FdUmnWfeZyMgf
X-Gm-Gg: ASbGncsOaHVSxpcNFvTS/CzkCWWBraS+5aD8w4BQo6mUSoTQY2OkCtbFAHZFeenNT4I
	eNB3a3cZBOEFgjsPo9HATbV7f7VaCJxA0zxLBVp4vfBDqPYDUcB8soJ53f5fZk9uqLuqejDfHlA
	uSI+JgiLXODYsh9Fat0ODUhlRAe13mpqC0wyokeDKCoUY9TmVcPejZMQ/LZue/NTZOxSqxso+jP
	Xb+Yk4qjtTI/p3brOyVgeoQAU1vaZWiQiwFheuKl3nUJP7o72VOWIqJZODBmz4KfLkPUKh7fC05
	HnQ2ilKzrIsRuYojnCdfSyCvXw/E/BjiHuNNs3XVFzm8o5g2uhsPHsLx47kbdjG9wj+U95mOxAW
	dPvhYy1z64tEOsJrij0ZFJgvQvMX8LxVVpvQCU7A441GvfjSdw7Pye7JjSbcFtr4mYTnDlstiij
	9xJoDq858XNDHi4J1+Te4PfwlGPw==
X-Google-Smtp-Source: AGHT+IGpy31yKKECPj1bORsOgXUH7I+UUx6roxhBJ/s8FggZAtznwZBysb24BP9NWSkwCSGcK2OCoA==
X-Received: by 2002:a17:907:96ab:b0:b46:8bad:6972 with SMTP id a640c23a62f3a-b703d492f2cmr271816166b.38.1761746172314;
        Wed, 29 Oct 2025 06:56:12 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:12 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
Date: Wed, 29 Oct 2025 06:52:26 -0700
Message-ID: <20251029135229.890-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065614_823938_1BD677C2 
X-CRM114-Status: GOOD (  25.96  )
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

As far as the Linux kernel is concerned, block devices such as i.MX8MP's
AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
clock controllers, reset controllers or mux controllers. Since these IPs
offer different functionalities through different subsystem APIs, it's
important to make sure that the register R-M-W cycles are performed under
the same lock across all subsystem APIs. This will ensure that registers
will not end up with the wrong values because of race conditions (e.g.
clock consumer tries to update block control register A, while, at the
same time, reset consumer tries to update the same block control register).

However, the aforementioned race conditions will only impact block control
IPs which use the same register for multiple functionalities. For example,
i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
and reset control functionalities through different registers. This is why
the current approach (i.e. clock control and reset control work using
different locks) has worked well so far.

Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
block control IP, we need to make sure that clock control, reset control,
and mux control APIs use the same lock since all of these functionalities
are performed using the SYSCTRL0 register.

To do so, we need to switch to the regmap API and, if possible, use the
parent device's regmap, which, in the case of i.MX8ULP, will be the clock
controller. This way, we can make sure that the clock gates and the reset
controller will use the same lock to perform the register R-M-W cycles.

This change will also work fine for cases where we don't really need to
share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
control) since regmap will take care of the locking we were previously
explicitly performing in the driver.

The transition to the regmap API also involves some cleanup. Specifically,
we can make use of devres to unmap the device's memory and get rid of the
memory mapping-related error paths and the remove() function altogether.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 91 +++++++++++++++++----------
 1 file changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index e9643365a62c..3f6d11270918 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -42,8 +43,8 @@ static const struct imx8mp_reset_map reset_map[] = {
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
 	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,26 +56,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, active_low;
-	unsigned long reg, flags;
+	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
+	shift = ffs(mask) - 1;
+	val = (active_low ^ assert) << shift;
 
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
@@ -94,6 +84,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
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
+	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
+
+	iounmap(priv->base);
+}
+
+/* assumption: dev_set_drvdata() is called before this */
+static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
+{
+	struct imx8mp_audiomix_reset *priv;
+	int ret;
+
+	priv = dev_get_drvdata(dev);
+
+	/* try to use the parent's regmap */
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (priv->regmap)
+		return 0;
+
+	/* ... if that's not possible then initialize the regmap right now */
+	priv->base = of_iomap(dev->parent->of_node, 0);
+	if (!priv->base)
+		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
+
+	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register action\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, priv->base, &regmap_config);
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
@@ -105,36 +139,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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
 
+	/* keep before call to imx8mp_audiomix_reset_init_regmap() */
 	dev_set_drvdata(dev, priv);
 
+	ret = imx8mp_audiomix_reset_get_regmap(dev);
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
@@ -147,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0


