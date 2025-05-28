Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E01C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 20:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GKc4b0imfgOxaE41XqyuXMz1AcDIj93rLftfhbVsUB0=; b=HXLOxDn1xuKrua
	jtKJGGM0GRggOiEB373Nq00UFsqDbUxU2kRjXdaZZExM3y+NaFsHW+WAK4+wn3NlXWsiqfED3zfgf
	Z20/IUKtxlTaWQNn2Paz3LGZJme1xpZ9WX+XdEDj+H8o8UPRSV6upcr1TCQEDeyd+HpxVBtb1KXtN
	J4iMB/VjdRk2pQ7oIi1t/s2bVJTqSaqsgq9Xjc208BI6O3SB3dVfH9+fT4/uYrM7rGeWCGSpR+TRk
	zy3hRIErGErShkeBXFSUS/bMJ4rud1MqAE8avHjbTY/+wfNUZ8zKSjmesy3n+yAOpn8u7z+nJh/B6
	VIXEbLoT9ceYDwoqje3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKN06-0000000E2c9-3r82;
	Wed, 28 May 2025 20:03:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMu7-0000000E1vV-21qx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:57:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so2080415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462254; x=1749067054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKc4b0imfgOxaE41XqyuXMz1AcDIj93rLftfhbVsUB0=;
        b=cuV/FfFCZRu0zczEU80i79f3URc2Mpwx7XuQs6zMEHpTiRSTVq28IV05P+FVDX/Fjd
         412lx8b57eKHjPYEDeKYtiebyGVgWVLzBCoG/sgl8ixaaavLRPgpn2jZdIvi1D+Ad73W
         2DihdBpMrq9q0+eDxrh0M9mfVfZq4L7oDoEXGJEtZv8Kbu7LCU05fIQS01gMXWk+HFI/
         G6HNVycaKLnyCDICnfsnnXGQZxzO3KJro6+igTCgq/3tlNZ41uyKMY9lsDZS/LdkSB+h
         DEZMGmR5t57ITYQfWgcoWBTFNTNW6e9aEaJETenVD0gD1sFZrsgi59h8BQq/dKt1gc6B
         VBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462254; x=1749067054;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKc4b0imfgOxaE41XqyuXMz1AcDIj93rLftfhbVsUB0=;
        b=rugNTZN91Gu6tPf/t7xEqKmgIK7amSA+z6qFSYaRu8x0iD/jI4HuYugRCANqOOTOJg
         Uq0c3uCghVF7grGq14ucUKEasmf4wF268Et98glz5NCVcjC6SYJGS/QGPyUAGwjlItsY
         YpkiR5xltO1l43eRmG98chdjvTmSY6SR3wIxoEv0BVyi9QqC+terc9YsutQo2auVpCkJ
         LH+UA+E0dDzvsJUGeF4BEoJoAhFnJCrTizY81bZ6G8Anx85bl8cBWtUerCSifjHoi4UU
         VRDyRjvgvF1+VkgDRtgujWcAIHCTi1g9QZFo+WPEyg1/ioGGI47SrOlq6AxXDkQjNzQI
         gOAg==
X-Forwarded-Encrypted: i=1; AJvYcCWX4nzw9iSHZ9SUvtYWfjrAWM0oaeUPmXllFB/gHW1nT+soDvtw/+lycgn2u607RQI8JarMa917Xs1JamPX1bwp@lists.infradead.org
X-Gm-Message-State: AOJu0YygxZSEL5NRJwi0ZFWfvx6kr3OUXELVsrBj3NiAckFN4A0bZ4om
	0WnQ0Sh1lNkhLUitAXBTxoeD1dIlAW6pQRB4s1b5OjfrjgSvr0gNe0l2HE094xduOj0=
X-Gm-Gg: ASbGncuboeh5Ks1XeRr4yfl9Eel0LAKt9lE+0zGFZbht1zMJG5mXw0t7pFhGz0heWgK
	rYsQOpO9C2LbfiALykAHtH0ksnc3Uy18c2djM1NIZakKYiQKhSidSpIEcWSOt2OVvGHm08bK6/V
	1eFNelkF3EoVvb8gnsj0K8cg4qFR7edIu4a2XfhAEO7sQ6NTS07U7NEeFVjJDsd/5telg96Sl5S
	Y+fyJee35gbQWwAi0X/IIDDsGd24S5bcypGcYZepMcWBolT4qMkAtxzvP84g3UOIsc8Ucvq/1FS
	1XBKtTpfhKKMpdNtxMrYszuMScqzm9vbQ2cv1bWTkL8FXbx+g1WBag4=
X-Google-Smtp-Source: AGHT+IGn7oYiU84+Os9KZ1JyFhYBfIsC6UZXONKWGrt/yYdV1Jw5Q48vqbVCHgdSg+N6FNSblY8qrw==
X-Received: by 2002:a05:600c:a00e:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-45077d424bbmr33816665e9.21.1748462253763;
        Wed, 28 May 2025 12:57:33 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eacd7909sm2308059f8f.78.2025.05.28.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:32 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 3/4] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <7407d9e557bfce2a5541fd002d36c15a041c0cc2.1748461536.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_125735_530838_71A94933 
X-CRM114-Status: GOOD (  17.54  )
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

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for s32g2.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
 drivers/usb/chipidea/usbmisc_imx.c | 69 ++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 780f4d151345..ce207f8566d5 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2020 NXP
  * Copyright (C) 2012 Marek Vasut <marex@denx.de>
  * on behalf of DENX Software Engineering GmbH
  */
@@ -78,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
 		CI_HDRC_HAS_PORTSC_PEC_MISSED,
 };
 
+static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
+	.flags = CI_HDRC_DISABLE_HOST_STREAMING,
+};
+
 static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
 	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
@@ -89,6 +94,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
+	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 95759a4ec60c..43098a150e83 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2020 NXP
  */
 
 #include <linux/module.h>
@@ -158,6 +159,18 @@
 /* Flags for 'struct imx_usbmisc' */
 #define REINIT_DURING_RESUME	BIT(1)
 
+#define S32G_WAKEUP_IE		BIT(0)
+#define S32G_CORE_IE		BIT(1)
+#define S32G_PWRFLTEN		BIT(7)
+#define S32G_WAKEUPCTRL		BIT(10)
+#define S32G_WAKEUPEN		BIT(11)
+
+/* Workaround errata ERR050474 (handle packages that aren't 4 byte aligned) */
+#define S32G_UCMALLBE		BIT(15)
+
+#define S32G_WAKEUP_BITS (S32G_WAKEUP_IE | S32G_CORE_IE | S32G_WAKEUPEN | \
+			  S32G_WAKEUPCTRL)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -618,6 +631,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int usbmisc_s32g_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
+	reg = readl(usbmisc->base);
+	if (enabled)
+		reg |= S32G_WAKEUP_BITS;
+	else
+		reg &= ~S32G_WAKEUP_BITS;
+
+	writel(reg, usbmisc->base);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
+static int usbmisc_s32g_init(struct imx_usbmisc_data *data, u32 extra_flags)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
+	reg = readl(usbmisc->base);
+
+	reg |= S32G_PWRFLTEN;
+	reg |= extra_flags;
+
+	writel(reg, usbmisc->base);
+
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+	usbmisc_s32g_set_wakeup(data, false);
+
+	return 0;
+}
+
+static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
+{
+	return usbmisc_s32g_init(data, S32G_UCMALLBE);
+}
+
 static int usbmisc_imx7d_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
@@ -1135,6 +1194,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
+static const struct usbmisc_ops s32g2_usbmisc_ops = {
+	.init = usbmisc_s32g2_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.flags = REINIT_DURING_RESUME,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1363,6 +1428,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx95-usbmisc",
 		.data = &imx95_usbmisc_ops,
 	},
+	{
+		.compatible = "nxp,s32g2-usbmisc",
+		.data = &s32g2_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.47.2


