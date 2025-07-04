Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE17C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 01:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8+iCOuTihJeiwPkhhbjsp9DCgzmpIJwxn9DIeybNWM=; b=rfumtTTffJ0i/n/ORkUsF8Dz/w
	3yixqopTvnoo5QP0kN2hrnciNOND28jzOg2EewmVOxRGRnjFFjx3yxJ+IbtV18n0FLdlOgnPX9qUm
	xagQ9+UmtV+fKLIQhJknYKjm6Muk7+e++zW3kqWnyBFXhaiwRJNqpVKS1+BbYlt6Km2AFV27QRNLn
	d70a3bCa1daLsOW7h29F/DIjyCI04fdxuzK019hFTJ3N/W3VYWw6EhbXD1WYAtoOoptDVCxS61Rzq
	YviuLh+TKjLQ422zA1BzscbapjvI0vAKf+PCOsLQrWPk6cny3ulXFth4uTBoyhLad1lnzTKpqB7vU
	5X6W0Hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXVAq-0000000CzIx-1Fwf;
	Fri, 04 Jul 2025 01:25:08 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXV6U-0000000CysS-17pV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 01:20:39 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-408d14c7e92so408920b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 18:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592037; x=1752196837; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8+iCOuTihJeiwPkhhbjsp9DCgzmpIJwxn9DIeybNWM=;
        b=XQyoP1XNC9uH2YyipCO4frER4ToVS26WOf/eUrV8EVz1qrhebWbnw12YQQUhffEVIC
         S5+ywVR6EsUr7EtgGXFl5+84UQNHmLN+u20w4J/V/xPruuvhIpMyBhWtJQqGNn/yj/LE
         a2KsWTnoxlClLNTg8yUz1M1JzT1AYkAIeAkZmFS2fim/sTV7KDsGfpCl1km8UD2mvRH0
         Sg6drmetfA/hQMFx4pwr6k+oTcx/BqnkuJ1wo8932YAY8PDb3qGXpc15FK6swW8NwxtG
         9a+k9R1Cevm+Zgi0KYyyaewzgMOTLU1raqvYfjV8wgx9dy1l+tnNd1JfvljzjW+tACNJ
         krqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592037; x=1752196837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8+iCOuTihJeiwPkhhbjsp9DCgzmpIJwxn9DIeybNWM=;
        b=n0Nz4ByOVcSgXuE1ukXpi+HCnx9Gtl5MhFhJt/4QlmJxOtB9LeaILVpt+ctE4VKKgu
         LDiM+scQusgPMzXk9KodQ/6R4Fg2B1dytTUF+OF1vvKKpkJTL+h5Ikr6B9J7mL7TLc+5
         4OixE8pG+6Q0pOwt/nrwORcyvEKG5i6QIGOO3yA0nWgOB1tiai1+rbxRdm4FvQPUV3V9
         6atzjY/zxfckTAxrm1bEUIUFbiYS0eTabK8ZDP7/KBXp9A0Do2M7eZCYha9o006DZ47b
         3dARLI8CJ8BI5TszDt7206RxkkfX2wbB2Swkjn96vVUbz+KswD4I7S5Vz4LhCeyWTLeo
         asLA==
X-Forwarded-Encrypted: i=1; AJvYcCUxNG01MSyDoSNKoPY/bScy2qPYC9rinOXStBVY+6xEgHh6cI5jvKZhEikP9rm9lfXZMA+kPtyox76HlT0FHpr4@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFbdeX1To7j/D2tfs7UR8VIW6fJbivpz274qPSuBslVUU22La
	xVzUCatXnTirLSFQkkfXcnPsNJAe/YL2CaO2sCXLXZzx9QwNSPmxiHLx17k8i1e0LbI=
X-Gm-Gg: ASbGnctifVbZ8dMoxJ41y1ck6Qn9/M+GOCgpM3nBvWAj8PrhybVsS2O2rgmnGbhuDSk
	N5pgEfkV8dh7FYmVmUslLPnX5Ob9w5aZhBsdzgLrZdAecfbKK0Zn0F1RRfogXpjLgIifvFAuCln
	QycouD64i51WCdfGxEqf1+YnKW517uUXpWLRtAkitrfh3DOeEjvwKcRlASGysWtvtGPFpMMs8rK
	sZ9YZ1zOnxgX6hIp15OX48v4IjwkSLnaNdX6Ib47HtQrGQwNrNqLawXbzcEu+1JvDUp86dQqMIa
	22baV9chW+QOGbDDEoq6GkanASW9VVblwWeCW42SlIFTbLAy/vvQr9Oe7SlNMgm2DGTcY8ujKx4
	v9qhc
X-Google-Smtp-Source: AGHT+IEvAKaFLRrXiJ2vNvkYk/bsSqagV089+dY3iwgVhXHBkkjAFStvvEN26+imHealtouRRZ3DJg==
X-Received: by 2002:a05:6808:6d8f:b0:3fc:7e1:a455 with SMTP id 5614622812f47-40d07277abcmr89734b6e.2.1751592037340;
        Thu, 03 Jul 2025 18:20:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40d02ac77e9sm147118b6e.36.2025.07.03.18.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:33 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 2/4] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <abb2ed5d-f01a-48f6-b1ae-6f8f39ae40fa@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_182038_311174_17D4F724 
X-CRM114-Status: GOOD (  21.57  )
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

Enable USB driver for s32g2.  This chip has an errata ERR050474[1]
so we need to set S32G_UCMALLBE to avoid some memory corruption.  I
have include the description below:

ERR050474: USB : USB data may be corrupted if transaction size is
non-multiple of 32bits

Description
When USB issues narrow length transfers i.e. AHB transaction size is less
than 4bytes, data for that transaction will get corrupted. Narrow length
transactions can occur if the transaction size is non-multiple of four
bytes, error scenarios terminate the transactions early or if the address
offset programmed in QTD is 4 Byte unaligned.  This happens because the
SoC NOC is not able to handle the byte strobes generated by USB controller
and is dependent on its internally generates byte strobes.

Workaround
Narrow transfers work properly on bypassing USB controller’s byte
generation logic. This can be done by setting UCMALLBE (bit 15, USB Core
Master All Byte Enable) bit of UOTGNC_CR.

Link: https://www.nxp.com/webapp/Download?colCode=S32G2_1P77B
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Add the errata to the commit message

 drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
 drivers/usb/chipidea/usbmisc_imx.c | 73 ++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

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
index 118b9a68496b..27a3127db4f6 100644
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
@@ -1032,6 +1091,10 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 	else
 		return 0;
 }
+static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
+{
+	return 1;
+}
 
 static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
 {
@@ -1131,6 +1194,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
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
@@ -1356,6 +1425,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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


