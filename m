Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FF4CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xzm/FgKGwWcjtUv18XH1u/v0xKsrXzejWZqgQud6hqM=; b=YJ2Iml4Z96PFD+AGpGjYh15Ncj
	7LsDTcK+oca//Eh4JLxcaMOccN2UxCcHvlxBH+am2TmK1rrwLMYhJQZtghrr1jGkw4rBKRbG2dVoZ
	/j4wqWiNZ+DmiR9E9Wbhnu+CALgO+7/zo+jitfcApseBCxBf9f2hJ8GDjoatnOlc0fv+VDb0Fo5ci
	jmjahUcjRFHfTEjPDiji/P2D3kvpDG1ECw5F7NcrghErC18MiuBNx1rpswjgRXNyS4zgHDA1kyVot
	HqMoP7IvKZkHfG6Vv7A8aZyrSaSnxHKshUO6STi0bEOe+s32o3FnH7IXK0MY4Cz/e9UtGwG1ERF0B
	YhIwxarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iX2-00000007eoj-37W4;
	Fri, 17 Oct 2025 11:22:00 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWz-00000007eks-0l7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:21:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b472842981fso230985666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700115; x=1761304915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzm/FgKGwWcjtUv18XH1u/v0xKsrXzejWZqgQud6hqM=;
        b=Uvg4XmoLGUod18AlI4lDinbsNsQUmeH7phfeXJGUFq12/5Dy058EY9SgeIKkSNYmMx
         ZUDmCet7iuN2+6C+Gt6d3O8eLeZynpDDIMWbnGXIBnM4yaRarV5y5V/BU3c6P4m9WtFI
         5T9GIex0FNLtHyIlYWqfA7oIsghbboKusovLvesaGplmQ8EEgOqAXJlhshps2kfiN+p3
         SFTz8ZcP5scIL4w0Uamay+jOyHzhECragmATfNHBNxri0OjMk7p78vKOrhj2BrG1ar7L
         s3mYpdDpZjWYXCmGSU0XHmSiHg9E2HnVnHvhnuTDS+8t94DD8TqVQGG0oovGH2RfgA1c
         541w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700115; x=1761304915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzm/FgKGwWcjtUv18XH1u/v0xKsrXzejWZqgQud6hqM=;
        b=j6IY1rCHrpbLJ9YWLNcDEBn5I7UkAoJnhJ0EfkXxOC+EZlWR7wlCXtdSC86g1bEJFT
         fc4JJ5pP317KCR6ySg1s2RthHdyCVrgohOhku+cYQGorwhckKCrDu9IzBbAwdxEUQx9P
         B2NXgV68TVDW/jWD3NdEPt3nnXzItmcog+M7of0gT0DrDojHi+G4yT7U4n4zZdkPw5Xv
         KmH8N6CJbVAinM/AOtJdbGqAlbtiimbc2+lj9ydEA8bZCxEKs70q8v5iEwQfyVxI1+Xy
         0QxrSvLMmbLR6k8ljAfR0t8yYYpl6c+2rXUR0lIl1a0JEGwF49AfhbFAbmEuNoOmGGYY
         eFkA==
X-Forwarded-Encrypted: i=1; AJvYcCUM+y3XJJazsJKFMudoRwkX+sMsxpZVJ9FrzZZY7poNZ/HnZt6ok+a11fbM2XaLQ98K6n4JBBK/rO08byvujfn8@lists.infradead.org
X-Gm-Message-State: AOJu0YxaxqJ1wER0143Z15XwaeNqon334G2mbo4qLOsecGGqbgZqni9X
	P89aeffsrIJJ1qHX3QCGc5Xj8YsMf707VVJgRziKLcgSYVr6367liFBO
X-Gm-Gg: ASbGnctJNKOfd/AnhrcZY7UvtHRn4MZrxuoj0Kv+ChJNjL5+yTGCR1KUuvrus3oupCy
	biw9V2jvujmjezZnYDrtyv6TFt91fDwSKO8ukdIQF9CJG4gnZoWhwxiJoktsHQBuqssHNy0r0ql
	pb2JGaEgCLSQNL4eqLgvJhsBDydX/r3v5q3kUYYwRR6N+0EPJU56SalCKCfDB5AVJfWtH0Rg2df
	VQt0InJ0bPYlyNMa+2JLdnBDV8j7NGx9W3Fotm4ietX2YYrdvrq0Cb0pQpIL6RrWGSITOs10NG1
	iLQJ1RRr+n12NTixbRrAf+Jk2ropyk2q+DtUPwjKGXMDtAbYqkLXU+rgJbh3m0m6FyZ5FOzWLMp
	jGwH5NBHcNX4NjpvrZ/Jv6EMM2l5pMRvr+/ZHVcyw0IAGKUAWKNbNNsxoZ8mZDSoag7Kh3Gc7KE
	CbRWUjMHss6DkwSsB8/AiP12x+21rh/KpJF8VGOA==
X-Google-Smtp-Source: AGHT+IHbOMwzwvv5nUDzrBEiBFccEUf8uDKJMJplrGe4Op1dHXqciaqfLUTbrWYo3IymF5T3YQroCg==
X-Received: by 2002:a17:907:fd17:b0:b5b:3ab0:a5b7 with SMTP id a640c23a62f3a-b6473952023mr381066566b.42.1760700115096;
        Fri, 17 Oct 2025 04:21:55 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:54 -0700 (PDT)
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
Subject: [PATCH v2 5/8] reset: imx8mp-audiomix: Switch to using regmap API
Date: Fri, 17 Oct 2025 04:20:22 -0700
Message-ID: <20251017112025.11997-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042157_278063_766075E6 
X-CRM114-Status: GOOD (  25.65  )
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
 drivers/reset/reset-imx8mp-audiomix.c | 95 +++++++++++++++++----------
 1 file changed, 61 insertions(+), 34 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index e9643365a62c..c74ce6e04177 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -19,6 +20,7 @@
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
+	unsigned int shift;
 	bool active_low;
 };
 
@@ -26,24 +28,27 @@ static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(0),
+		.shift = 0,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(1),
+		.shift = 1,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
 		.mask = BIT(5),
+		.shift = 5,
 		.active_low = false,
 	},
 };
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
 	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,26 +60,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
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
+	shift = reset_map[id].shift;
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
@@ -94,6 +88,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
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
@@ -105,36 +143,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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
@@ -147,7 +175,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0


