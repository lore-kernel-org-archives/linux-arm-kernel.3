Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4845D19503
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=; b=A4C1WtOHnGX5mRRDN/NoGxAY73
	xr7bJuOxOEsu8f3iqHFfrQBDtXwCs0PWfolVfPw883jBeo9Pz1tsY/Kgd+TCtBLVh1BEMJtNlGkqF
	4jt/s+wVEDDyjEeorlY5g3S/eScBbf58aY0Njiu7AcYGNdaDmuWj/M5L40htsCgQ0xNh+i9gNo6uQ
	S8Ih/Qr0dhTLkM7WBNEJOpy+i8+FjWOABGyyUlFieyJRhEz2icx4b9+GnlkoaeaWPdo6UUGe4rMEE
	ocFxObwupKUGnD12wvJGV2MXqVD8At/orn40RHRxfGB8EXmg/50WdrPB08FqWXuubZXOSs/AZuhLf
	g2AZ/AdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPM3-0000000Cr4D-0aCd;
	Mon, 26 Jan 2026 16:22:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPLz-0000000Cr2M-1WiM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:22:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso24821415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444533; x=1770049333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=VXDcDtpJ/4Hdw9xfYpp4SNxPmZyFo42ZccSvUlBOHv5rveJvzRlI1NOpv10EID1KZM
         jkFrZ2WRgPNjrIG6d/NarKdtIkAOt0LVFK5YvgdkuwPT37JE5YINafu2JUXcgbPTZ2+U
         0FIsi5+YVBBt7u33fo5bLJ5dbfe8CklrPlqD2BJsafhoZpsBrlNN8vMCZJo2cv984DBg
         YLHGysb8JKj3eP7EncUvlSQMnsv37PhRlloXLk5V3+No0u5bPdcbX1fCZMt848MwxL33
         BG6sL8wsAqQqHwF6A59+PRHt3eRXlB7XKgayIEnjVtouCPT6JZpLdb9RrzqTDTB029wa
         z3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444533; x=1770049333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=jtIjkVNTAz8M6/hR9x8Lkcoi6zej+fxtg24Kn6u7PC6N6Cw138vQ+qdlM5mh4/ygtd
         cWmYDozOSzqkwZN4RaPxrMDxv6KDPlUD4yz1TkbU8oN7/t9w4BJEZrvgKaRLG2Y5mTkM
         t1y3ASTO8yTdFSX3PFYqV+4g/AcTJGEv1zK7dCQhQqI9v48a8C+k6EXSHtFHWVC4QI4I
         /CXHEdumZNxLm91UiMK2fnHriN6mBdKuMI6xbHR8zV6lH3oYvLA99NYrFeOWDMxXhLX+
         Ds1hPYUTdzS1EeloJyRwkk67wbX8HlPM0IkZSTSYD0UPWPYP90HP/pKPuZw4JpFS9KlD
         SeXA==
X-Forwarded-Encrypted: i=1; AJvYcCXXIeynt/0rOv0oNfNeueOmFVR1A3MmO+YBfcHf6uJ7VwqEeQlggMt4ENzz+U3iTsgnZmzk0dx7EcQHyT/wpZqi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpf5QqbhXjFObwdSwGptsFIPNva5qXxnEM0uAZfvgtcrvpVDbg
	Je+kfomaZKxzkLCgd32p7L8G38dcTX79PCUThylqCot/J4irLChUoJ3V
X-Gm-Gg: AZuq6aIbwrxPlg7kmKh2ZEKYvWPvKiKRffItQQhiG2EEU19YlqLMwxTKGI4X7CaqNs6
	Js4iaMTHU2d0e0zjWfnCHAMcvZe2ECAcRIvvINQqgiFXtjwmupfL70sz3h4ZyzBgRafgWVRc0WC
	2VMxq99iUeaPqZuXWkDgsPGqkNxy7ZFIn6FFn5yASS3eIpcj0ErSXHBfM5nVEIXB6Drbz5RmQtB
	5SfZPIENyfmcTr9Q9TM385gV3/ChUSF5gY1E4UL98sWdCM354Uis/A4wS1N+X57p0IEtHZjllgv
	SdbVr30dIIoVIGjUONJlikOG1CK+422aqHQrIZeu0wmC7L8cW97P39qVYPM0KILnb41GHeAUHTt
	06TfyLqWtS6WNO+kKABHm/dy6y6f1hdn9FfEQdBVspXl1gdk9CPEw0fB523yjLkiMfGzVEMnTQo
	0uHk/kmSymOlhNw/BufP/vzsXh2B9lsJk8gDyOWg==
X-Received: by 2002:a05:600c:6748:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-4805ce4e654mr79695865e9.14.1769444533295;
        Mon, 26 Jan 2026 08:22:13 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:12 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 2/4] reset: imx8mp-audiomix: Switch to using regmap API
Date: Mon, 26 Jan 2026 08:22:01 -0800
Message-ID: <20260126162203.708-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_082215_430079_2559E25A 
X-CRM114-Status: GOOD (  18.81  )
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


