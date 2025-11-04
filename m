Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0438ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aafw4HLBs7KDKvmUtk2iQQvLgZcs98N6FosFfKLOmF4=; b=jVt6F65PhP2wQNN1wMTLdKerwC
	OBihkeggFfvhi+Z+SR4MjTeYNcyarW9M8x2sYzLMkIeyfnVUdezylNZ4J4XyUSKsRsP814NWTQywA
	+2oEngeXe2ir9QXtju2u+9/aRRaaJHzrhPNa4e3O73bxxihrDmU9zt/6QQnUB+afItCek1hC68O7S
	6NEeVXgJssBw3M4Jdhr6py9yFOLW/bX+TifIJ7Gy37JA4Jg2fQxbZzzcLxw6oOcGNg6CXwxwZ0kw1
	is5L52rgBlhrgI0p09jh11FCvyIhk4+9vutbPwx+2AREDT9eLAFxkfWSnRs0sEiX4Vn54+c+IAXCe
	P4Z4sDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlh-0000000Bkx0-3e5D;
	Tue, 04 Nov 2025 12:04:09 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlf-0000000BkuK-3wH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b70fb7b531cso325189866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257846; x=1762862646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aafw4HLBs7KDKvmUtk2iQQvLgZcs98N6FosFfKLOmF4=;
        b=jsJhaRcqOzQjmRZZGkBWtx9ZMEr5Ypul0eARXqDv7GQbfHK1KNLi9ozemyiXnloav7
         Xt3Po2fS37rbuejFuP04UXpybeSogF7GvNN0Haprgs8jGd8JX/JdqXIZAEXgeMV3uxdq
         QUrIWK4QgqAIPoZyqqyJdBX1MRLH63tes2VTVka8BVhPnUGuYGIIBtcJVmcxdj1bfEnv
         zlKFZ/C4lu3t/NEzecoNrx7AqgtTX595/VHlYu8hNts9YUuAOPSyMEAAY2kBLBqtdDld
         qMzzL/QkzmiRofYl6Wru/AwJzflYdffD8sjsyOOdXlN27Ip/Al5llr5DnyY+g2ih4Pun
         n9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257846; x=1762862646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aafw4HLBs7KDKvmUtk2iQQvLgZcs98N6FosFfKLOmF4=;
        b=XCu797k40GiSaY0cQe32KyMsDc66GM2ylEpu78cveyz8tptbppzHnf7vywFaSSrxS4
         bugByDhNl0hkUD/f0VSkQggmhipM5nSqQLD6d0ax0A94Jv/03rhzWKxQ7lVymuU8ofsD
         i2+TnHTv5wtJ7mKQWo1LWGMdJrYB6MmX+kmaBXV/ae6x+jVAmUUxOq2NZsL62fRqiciR
         ALCSMh6H8hCaKL0/n3O2RH8xOn5hP/vFmJETpkw3GO4Bk11T+FmLDDeldUiayCNRMTko
         ke7V7OPlPqKru4XBS5GPG7Gz0NcdybIwABfwF1NXzW7mcPKmJSkgrxb6TGebS3Les1Bx
         4rDA==
X-Forwarded-Encrypted: i=1; AJvYcCVsR61k/gBD4xG+jvlr86cM13JTkyFchjGPpM76A9bY6X1FfqiPslMKdyTGKjefsa96g47BIILUBcT2aAg9NElQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkc74DVEIMfqNaY8QhZCMlMMIbm//IphyZ3cNXzrh4Z7uJZ/XC
	VSOSQzBQfT7IJ6+yXbYCf3irZlXvCq0y4CC1CTsmJbf4wgChX0NQh21W
X-Gm-Gg: ASbGnctHP7AhVmZMZJLzLf2TFmre3/g/MnpXYlNAGBd3zuAqxlqcc3Gsj5F0XrkCFAZ
	Fvda3Xxa+kWYq7Fdoc9lzEgC5AOmgHEbsU/GsXQKVEfo2y43RErE0UJTHzEoiJur8XUwi+53Ueq
	f7unyog0AoGic9DlHOxGooHhWCLWX7fwPj5vcaCfOrMwrPLkocZUsHtBCpcAxfJ7AaCb0ikIuel
	sp+ZfX7QUm7sZNLDek9t90Rqr4SCU3Ewj4V50Rshm+g8gnD/CdotYIygRQHsb3brWsemZAjeeCN
	rIl404MIo2A0wIWtP/GDnVKQ+AJplmfIbi86MYGLuCggQyKUl69V4eIhu/SZ6A42Skoq6BIlWRO
	giRxhqxyvlyG04pZ9clgS4r08Si+cMRvnWG1MfEa/oGstcxio8c2U98Sxp+6X+OlO05rar58rlz
	ErsGXaaErKgV/on/j84sriXPlIuA==
X-Google-Smtp-Source: AGHT+IHeD+7pAL1LN+vGwVw7YenhruMsQ1qqYloFn0IzgJZ0tjNxTI+ZA1fCBUoZtXsnijqYIZ4NdA==
X-Received: by 2002:a17:907:da5:b0:b72:51fd:5a5f with SMTP id a640c23a62f3a-b7251fd62a9mr192609166b.1.1762257845988;
        Tue, 04 Nov 2025 04:04:05 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:05 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 5/8] reset: imx8mp-audiomix: Switch to using regmap API
Date: Tue,  4 Nov 2025 04:02:58 -0800
Message-ID: <20251104120301.913-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040408_008936_766E8F8F 
X-CRM114-Status: GOOD (  19.33  )
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
 drivers/reset/reset-imx8mp-audiomix.c | 93 +++++++++++++++++----------
 1 file changed, 58 insertions(+), 35 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index e9643365a62c..18a7f68aa59f 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -42,8 +43,7 @@ static const struct imx8mp_reset_map reset_map[] = {
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
-	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,26 +55,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
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
@@ -94,6 +83,52 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
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
@@ -105,36 +140,25 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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
@@ -147,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0


