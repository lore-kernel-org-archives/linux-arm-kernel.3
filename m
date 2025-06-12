Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC84C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItSlMM/wBlLoKev8FS4kVPMptl6b/7qaX2G05ZNLbgo=; b=OYRseUA/fLQ361uDrluOt104/D
	2NQLiqE68M7N1vt2KBNB5Ws4JKPdy0mGb8Kp4eTY/49n56aJ0oHRI0loYeLcbBGnsa8ZuShq/AMvT
	WOQ33kM9w17gxV2vFiqkokM4BFoZeU6Z7kwPhhnrYDOfzGgO/ZLA9RYBqX40drNz1RlopiojUUrKV
	QcVOGgUFX4c9yCm9d8Bfjh1nY+wgBKPuq4dD34p+mqkPHQZkDCkAvn/BmficWiX+WkqZb2H/PRONK
	oOiKBHz9lY7hzKf3NgunMipGjFZCdczejxGufmT82gS6+dZJX4kRp2KFBAwznsJwrT4sONQknOhMP
	6U9whzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntk-0000000EO4P-31iy;
	Thu, 12 Jun 2025 19:47:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPn0y-0000000E9KN-1hB1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 18:51:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a365a6804eso824225f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754263; x=1750359063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItSlMM/wBlLoKev8FS4kVPMptl6b/7qaX2G05ZNLbgo=;
        b=G2Ic/UG9nmWLxIEGpgzSPhXt5x4Kiw/+1KQ/OhUUbrgcMBx8EOCYWBYOBAbV/KLhDi
         r1zbVpTFFRbe3e6Q1PcpoYO3F7dl58TttznGvcHLIhwYVpNjrJ3/DpTEXBZQBmvo34ZT
         gaBSKJ6IIy4pWvumSquDONTPFhaxeol/doABEaV1Viz5aroPhB0gR6fTt/38HAbyJCfo
         DMeohL481WdIJNkyl5rcm63UyW9uV5qFg0ujq9xaLvvyNS2JeT8/rIgo2vTbDVLJPq51
         MoL3DeclXRrCvYmxnR4xZfmoGnrdoiiZLClIbznGyS/umX47PJFC+84nVmO0swNsg/3+
         MLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754263; x=1750359063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItSlMM/wBlLoKev8FS4kVPMptl6b/7qaX2G05ZNLbgo=;
        b=omMxtIgw6IK9RF5JrPBv9euW7W2uP8FR30WHVIQub3MMVoJyRxFUjPNRU6qmyDL49E
         smWMNpUJAcrY+lrPYWd5kKVmibK9Dt+BjGYrnPW78mCVnwLv7k0K4CCZb9PDY3WPQcUp
         6CysQx7nLo2uKxduTKKNOMCg66ZnAtcijH8EM1WP+cKx/XUEoujFTGwNNdYr2A2tc2On
         uEsEtsyYQJyEeqCOgAorPeG1/bn+aD7iT0x4FCMDVTU4ltGSGTvVzxgbd4bZ31NVZynj
         RfIi8qUJSGnx32nrRBPAwGG7HJ8fU/EjRzdd3eh4r4Y1uZouOWpjHkiH2TOhq9VKN/KA
         qN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfJAa0l1P/1HKDFn/KH4Zl3REgdbxiiZJV3lEtxBWL38VKtRWu93zY9SB2whpoGSMqBGBWt3YYbIDjpLKP0bVl@lists.infradead.org
X-Gm-Message-State: AOJu0YxUGxpxCwXC6nyLwBazjSTDBjyJM0YtQawmmfjTwXk3IjAU9Ef6
	V2MyXhZX7m0nWVCnybvpj7eK3TL9yMLywOSihdmOOfnRDxGmZQUi0XCT3g71Rbpvlpk=
X-Gm-Gg: ASbGncvpsv7llU0edVy6QdeWUCqdWNruAtVHHaVWcxSnq9/nhh41kWNU2xCoYrAhuSj
	nY39Ngz89Swx8o4NwN6MUeTI2CoQEE9YtM9LeZO46bOpTwIcR3t6nA6sgsFxTwZWllv/Sph+hqX
	42Q9hq/RHQe4p6980A9OyjPAGbOg0mWhMMiVyiB5NknW8R2uatLS/LFbhR6ypNYLoa/vdx59pa/
	56rO30l1LWDlSd9b2iRVVbgfvml3viS3o5dPQDbQ3C9VJgiEwdCOLdQGRNTqqPlpqLMA+cBO6xs
	A/VOnazteJpFNhhhg9Ll8w5kHJA1KapXrt/bnEs3hkfk55qPjVD5NT+esjzT6f9i4v4=
X-Google-Smtp-Source: AGHT+IFHEWRA4DAg4P06P/t5PYCVCvOd5SOHz1nqZMsAIFIkiNf1r1XzzAQzITnujTOEyRBzX0R3lw==
X-Received: by 2002:a05:6000:420b:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a5686f59c8mr300638f8f.37.1749754262777;
        Thu, 12 Jun 2025 11:51:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e2446b0sm28363045e9.21.2025.06.12.11.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:51:02 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:50:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 2/3 v2] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <b5da1cf4e5813d60fdbd9dd5952cd1908ee880e5.1749747898.git.dan.carpenter@linaro.org>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_115104_446980_5A934880 
X-CRM114-Status: GOOD (  18.05  )
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

Enable USB driver for s32g2.  This chip has an errata ERR050474,
so we need to set S32G_UCMALLBE for it to handle packages which
aren't 4 byte aligned correctly.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes since v1:
* Update the copyright
* Use the .power_lost_check callback.

 drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
 drivers/usb/chipidea/usbmisc_imx.c | 74 ++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 780f4d151345..e8c847eab8e3 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2025 NXP
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
index 118b9a68496b..67ff073ad806 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2025 NXP
  */
 
 #include <linux/module.h>
@@ -155,6 +156,18 @@
 					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
 					 BLKCTL_OTG_DPDM_WAKEUP_EN)
 
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
@@ -614,6 +627,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
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
@@ -1033,6 +1092,11 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 		return 0;
 }
 
+static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
+{
+	return 1;
+}
+
 static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
 {
 	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
@@ -1131,6 +1195,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
+static const struct usbmisc_ops s32g2_usbmisc_ops = {
+	.init = usbmisc_s32g2_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.power_lost_check = usbmisc_s32g_power_lost_check,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1356,6 +1426,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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


