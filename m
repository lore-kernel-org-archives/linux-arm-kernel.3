Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3A2C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pC89xsTA3P9IUFJRwEIvyPFg1dVGPyboyapluIQiVZ8=; b=g7RfcGLxL0BXFFB5B/OYmHEBbV
	R+92sr8amAix26/xMSUmc46vPH9hHr5PI6uR3/gx1/WopAu6jAkoULzFVDVVGFze9DjU7aGGYRLQl
	DBbG3s42VpJBx5FEp6gdtmB01Mq514lYlZmuCBKOtFe+lqjpXNrksW5oJVDuwJKdQetNFg+8rRG3G
	SyMtRwQ2rr0D6CO0FNA6EoDwsHGju2lxocMn/PBJdQWDjWJOeg8s6yhrqKsp6sToMk7LwdWHUfEow
	0y8+SHElGvqp8hgYk3IeEqEKZy3CTKRItzxFFU95Yv9Nnm4dmHAGU744j7R7vQxfO/xcSD0d2+zuG
	PgaLRB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsST-0000000BmEQ-1e6E;
	Thu, 27 Mar 2025 19:00:05 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsP0-0000000Blm0-2m5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 18:56:32 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-601fcbff303so636666eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 11:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743101789; x=1743706589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC89xsTA3P9IUFJRwEIvyPFg1dVGPyboyapluIQiVZ8=;
        b=CO7PGZ1GTGWKFpNOJ8lJ6+W3Rd+72bShl8qSfZHxHa/eyHy/7+HUPN/0qTtRa72Afg
         ZWKtGWM9D7TCKGX5IR0Zz+VrXVUqGEsXr13TMvbHbLa8dP6M1B0aKngJ8yBwtLfll942
         DiZyWC1G0eHNzFrM23QJxHzaRgPwe9YFMzXEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743101789; x=1743706589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC89xsTA3P9IUFJRwEIvyPFg1dVGPyboyapluIQiVZ8=;
        b=gQWr7g7bpnmdwbJ7Mg0mWfbKFklkOoOarfDpDQ+smPqn0JUKp3j64XywqA8BMl0jio
         WO065ZpsyT6I06qHDGX/W4HE+03QgUwobw6rVSW2ZzoR0Dolhv8xkQmbTx7nyafxGP1d
         gO4uOlmCMDTNBDe0umceFlxkA24wiL7KNQbKTjHHUH/1DgfCKjOFJPadMkN/Zunctvt1
         81DSWfLSyHz1DAntoj0JOZOChv9/JpgVa1BFATTKihkJl0l1b1ZZ1e2PxrdsHuDwazN/
         nDQd3nvIl4GpoDudpx4fH2WO2AvxniV8fjjoXjuN2r0YMjQGn4zUmWoj4xp2QajwjVTH
         nPGw==
X-Gm-Message-State: AOJu0YxTTqR6+PGicRhz4Whj3lkrKSxluUHpOdXnZ9Rz/bV7mlVn4UgT
	VqH6pDCw1XHGRo1C4+7lUSXzEha3wvo2k6T+ZboRTlPPcgeGvtTQzXfBvcE9EkIxB+DiP8RyE7L
	wq6gf/R2jOUGHOntZRJNnfM6QwsSq54kD9ivQSuGRUuzHT793bIwhghLhFLkJcPa0TwdDs/N5ez
	XwBxT6W4LpiWJxfmUCc0ejibWAsT19hDWHESFOvWGhJ5KINOPrOlVTxQQvyQ==
X-Gm-Gg: ASbGnct8eUYAby87Qgguuhn1r+l06suIHW+3c0g5CbkE9QQhhNEb1qpHipD/KuOhpT/
	eZrZOvt6Kj+gOobPO7SBhb1HlpbKZo8hPRXih+GaK24Ag2kMLSwkUnvoYfvCdz20sMOYowgsKRm
	cTxW+1kooGwCyKRaxdolmQRBK01lForyh9Fp2C1ESGSqbFR1WeXRFKLaiuVwbP5ohq638CaJEku
	iCthdxMO+/ISlLZrbLGFHh96ZoRyv3Rjb4Nb86AkX8ioIQl9w7WIEJRkn5j+NlT5XNAvmAVFzra
	K0lfLb49IG32xSEZxfqLE97HORcX9r+84ZfD1d02rqoY2pfBWTBsND7fVwl1wIDO4338VJNBdj+
	0vMUhparMMcb0VqSc3kiMe0f4ig3DuJLl
X-Google-Smtp-Source: AGHT+IFu0LUc532MnKu8ZBSXV1P9eFadHQau51Efxxv+U2s09qdxwjmqdbL/5GnIxfJ2bMZFSFmNoA==
X-Received: by 2002:a05:6870:5150:b0:2c1:6948:d57c with SMTP id 586e51a60fabf-2c8481d6cabmr3067699fac.28.1743101789220;
        Thu, 27 Mar 2025 11:56:29 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a3f3db1sm77997fac.4.2025.03.27.11.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 11:56:28 -0700 (PDT)
From: justin.chen@broadcom.com
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: rafal@milecki.pl,
	alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH 1/2] phy: usb: add support for bcm74110
Date: Thu, 27 Mar 2025 11:56:22 -0700
Message-Id: <20250327185623.3047893-2-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327185623.3047893-1-justin.chen@broadcom.com>
References: <20250327185623.3047893-1-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_115630_690674_E32F6B03 
X-CRM114-Status: GOOD (  14.49  )
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

From: Justin Chen <justin.chen@broadcom.com>

bcm74110 adds a freerun utmi/ref clock that saves further power during
suspend states. A tune is also necessary to pass USB compliance test.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 .../phy/broadcom/phy-brcm-usb-init-synopsys.c | 61 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-usb-init.h      |  1 +
 drivers/phy/broadcom/phy-brcm-usb.c           | 14 +++++
 3 files changed, 76 insertions(+)

diff --git a/drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c b/drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c
index dc452610934a..8a5ed50f2da0 100644
--- a/drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c
+++ b/drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c
@@ -43,6 +43,8 @@
 #define   USB_CTRL_SETUP_tca_drv_sel_MASK		BIT(24)
 #define   USB_CTRL_SETUP_STRAP_IPP_SEL_MASK		BIT(25)
 #define USB_CTRL_USB_PM			0x04
+#define   USB_CTRL_USB_PM_REF_S2_CLK_SWITCH_EN_MASK	BIT(1)
+#define   USB_CTRL_USB_PM_UTMI_S2_CLK_SWITCH_EN_MASK	BIT(2)
 #define   USB_CTRL_USB_PM_XHC_S2_CLK_SWITCH_EN_MASK	BIT(3)
 #define   USB_CTRL_USB_PM_XHC_PME_EN_MASK		BIT(4)
 #define   USB_CTRL_USB_PM_XHC_SOFT_RESETB_MASK		BIT(22)
@@ -61,6 +63,13 @@
 #define   USB_CTRL_CTLR_CSHCR_ctl_pme_en_MASK		BIT(18)
 #define USB_CTRL_P0_U2PHY_CFG1		0x68
 #define   USB_CTRL_P0_U2PHY_CFG1_COMMONONN_MASK		BIT(10)
+#define USB_CTRL_P0_U2PHY_CFG2		0x6c
+#define   USB_CTRL_P0_U2PHY_CFG2_TXVREFTUNE0_MASK	GENMASK(20, 17)
+#define   USB_CTRL_P0_U2PHY_CFG2_TXVREFTUNE0_SHIFT	17
+#define   USB_CTRL_P0_U2PHY_CFG2_TXRESTUNE0_MASK	GENMASK(24, 23)
+#define   USB_CTRL_P0_U2PHY_CFG2_TXRESTUNE0_SHIFT	23
+#define   USB_CTRL_P0_U2PHY_CFG2_TXPREEMPAMPTUNE0_MASK	GENMASK(26, 25)
+#define   USB_CTRL_P0_U2PHY_CFG2_TXPREEMPAMPTUNE0_SHIFT	25
 
 /* Register definitions for the USB_PHY block in 7211b0 */
 #define USB_PHY_PLL_CTL			0x00
@@ -369,6 +378,42 @@ static void usb_uninit_common_7216(struct brcm_usb_init_params *params)
 	}
 }
 
+static void usb_init_common_74110(struct brcm_usb_init_params *params)
+{
+	void __iomem *ctrl = params->regs[BRCM_REGS_CTRL];
+	u32 reg;
+
+	reg = brcm_usb_readl(USB_CTRL_REG(ctrl, USB_PM));
+	reg &= ~(USB_CTRL_MASK(USB_PM, REF_S2_CLK_SWITCH_EN) |
+		USB_CTRL_MASK(USB_PM, UTMI_S2_CLK_SWITCH_EN));
+	brcm_usb_writel(reg, USB_CTRL_REG(ctrl, USB_PM));
+
+	usb_init_common_7216(params);
+
+	reg = brcm_usb_readl(USB_CTRL_REG(ctrl, P0_U2PHY_CFG2));
+	reg &= ~(USB_CTRL_P0_U2PHY_CFG2_TXVREFTUNE0_MASK |
+		 USB_CTRL_P0_U2PHY_CFG2_TXRESTUNE0_MASK |
+		 USB_CTRL_P0_U2PHY_CFG2_TXPREEMPAMPTUNE0_MASK);
+	reg |= (0x6 << USB_CTRL_P0_U2PHY_CFG2_TXVREFTUNE0_SHIFT) |
+		(0x3 << USB_CTRL_P0_U2PHY_CFG2_TXRESTUNE0_SHIFT) |
+		(0x2 << USB_CTRL_P0_U2PHY_CFG2_TXPREEMPAMPTUNE0_SHIFT);
+	brcm_usb_writel(reg, USB_CTRL_REG(ctrl, P0_U2PHY_CFG2));
+}
+
+static void usb_uninit_common_74110(struct brcm_usb_init_params *params)
+{
+	void __iomem *ctrl = params->regs[BRCM_REGS_CTRL];
+	u32 reg;
+
+	if (params->wake_enabled) {
+		reg = brcm_usb_readl(USB_CTRL_REG(ctrl, USB_PM));
+		reg |= (USB_CTRL_MASK(USB_PM, REF_S2_CLK_SWITCH_EN) |
+		       USB_CTRL_MASK(USB_PM, UTMI_S2_CLK_SWITCH_EN));
+		brcm_usb_writel(reg, USB_CTRL_REG(ctrl, USB_PM));
+	}
+	usb_uninit_common_7216(params);
+}
+
 static void usb_uninit_common_7211b0(struct brcm_usb_init_params *params)
 {
 	void __iomem *ctrl = params->regs[BRCM_REGS_CTRL];
@@ -426,6 +471,16 @@ static void usb_set_dual_select(struct brcm_usb_init_params *params)
 	brcm_usb_writel(reg, USB_CTRL_REG(ctrl, USB_DEVICE_CTL1));
 }
 
+static const struct brcm_usb_init_ops bcm74110_ops = {
+	.init_ipp = usb_init_ipp,
+	.init_common = usb_init_common_74110,
+	.init_xhci = usb_init_xhci,
+	.uninit_common = usb_uninit_common_74110,
+	.uninit_xhci = usb_uninit_xhci,
+	.get_dual_select = usb_get_dual_select,
+	.set_dual_select = usb_set_dual_select,
+};
+
 static const struct brcm_usb_init_ops bcm7216_ops = {
 	.init_ipp = usb_init_ipp,
 	.init_common = usb_init_common_7216,
@@ -446,6 +501,12 @@ static const struct brcm_usb_init_ops bcm7211b0_ops = {
 	.set_dual_select = usb_set_dual_select,
 };
 
+void brcm_usb_dvr_init_74110(struct brcm_usb_init_params *params)
+{
+	params->family_name = "74110";
+	params->ops = &bcm74110_ops;
+}
+
 void brcm_usb_dvr_init_7216(struct brcm_usb_init_params *params)
 {
 
diff --git a/drivers/phy/broadcom/phy-brcm-usb-init.h b/drivers/phy/broadcom/phy-brcm-usb-init.h
index c1a88f5cd4cd..4c7be78d0b14 100644
--- a/drivers/phy/broadcom/phy-brcm-usb-init.h
+++ b/drivers/phy/broadcom/phy-brcm-usb-init.h
@@ -72,6 +72,7 @@ struct  brcm_usb_init_params {
 	bool wake_enabled;
 };
 
+void brcm_usb_dvr_init_74110(struct brcm_usb_init_params *params);
 void brcm_usb_dvr_init_4908(struct brcm_usb_init_params *params);
 void brcm_usb_dvr_init_7445(struct brcm_usb_init_params *params);
 void brcm_usb_dvr_init_7216(struct brcm_usb_init_params *params);
diff --git a/drivers/phy/broadcom/phy-brcm-usb.c b/drivers/phy/broadcom/phy-brcm-usb.c
index 6362ca5b7fb6..0666864c2f77 100644
--- a/drivers/phy/broadcom/phy-brcm-usb.c
+++ b/drivers/phy/broadcom/phy-brcm-usb.c
@@ -283,6 +283,16 @@ static const struct attribute_group brcm_usb_phy_group = {
 	.attrs = brcm_usb_phy_attrs,
 };
 
+static const struct match_chip_info chip_info_74110 = {
+	.init_func = &brcm_usb_dvr_init_74110,
+	.required_regs = {
+		BRCM_REGS_CTRL,
+		BRCM_REGS_XHCI_EC,
+		BRCM_REGS_XHCI_GBL,
+		-1,
+	},
+};
+
 static const struct match_chip_info chip_info_4908 = {
 	.init_func = &brcm_usb_dvr_init_4908,
 	.required_regs = {
@@ -325,6 +335,10 @@ static const struct match_chip_info chip_info_7445 = {
 };
 
 static const struct of_device_id brcm_usb_dt_ids[] = {
+	{
+		.compatible = "brcm,bcm74110-usb-phy",
+		.data = &chip_info_74110,
+	},
 	{
 		.compatible = "brcm,bcm4908-usb-phy",
 		.data = &chip_info_4908,
-- 
2.34.1


