Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F985C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pC89xsTA3P9IUFJRwEIvyPFg1dVGPyboyapluIQiVZ8=; b=vUyuUeccBte3U8gC3mucr72p4E
	gbotvxMq2Wqu51mlq/RqmXoRaM9BkT9WHtiEzf0C6it6qETpbt/EwpzNHCcDMmHl4lorKRB8MWVgN
	ZvphnPAhOuPgpqvhwPH4MUymM/kH3Exs2X4X4Ra3ORkHNmu47QhQllHCA80S0i4/su847C3S58HcB
	3BlSPsQzXD3gLBqBhpf2/ZUiCHF+34xLMIWsBvCHFf7DZS2ISdShis3D/OHDJVcwI266RbzZHMfeA
	Ve/XF+9+UcKzLw0eag8z/B6jvZ+MdUyo+rEC2i9Ahvx793grz6K0IY//gCYvvxpNfXduyojxv0cM9
	VCcLGBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03HJ-00000006zFS-3m4t;
	Wed, 02 Apr 2025 18:57:33 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03C9-00000006yXc-3cXc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 18:52:15 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3f6a92f234dso65637b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 11:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743619932; x=1744224732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC89xsTA3P9IUFJRwEIvyPFg1dVGPyboyapluIQiVZ8=;
        b=g2N9vS/uTpTGQWzaexw0Zypl9r0Lbsm/t2aIUpPApuNlvaneZGO0EY5GYm5OFh/Dib
         CMov2JS7w8hNQ3qBfhG9ToSR75wWnAIBuCDCg/9Bs+iOxxMEV9yHDlIxYWSVSAUwGkx7
         e0GOpvBoETmcAChlBKcGhvHuL78JP7Pd9A9Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619932; x=1744224732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC89xsTA3P9IUFJRwEIvyPFg1dVGPyboyapluIQiVZ8=;
        b=HmqVOe5buMqGU0d47hD2CTGUtid7UWo9llGm/PktzRomDxjQ/gyAeMqTjGR2qN7pXI
         IAEzgTOz4Y72z/aBqba+lcia71j4vstcN1J/+eYY6mBlERAJr7pARFox9M4Sc+js78sk
         twkOMDTLDehq5bUx4a+WBQsnfvgWOg+jeNMRvV9zmVps+zWQy1oeajGAKNAX/Ypq1n9T
         JirKJvbwTGZOj4JBewWBPxnWimwcuwGWmfiv3mPcRj2pndesbYr33d+bw5+bnkhJdLvv
         qDbHwxboqvXSvsfgy7R+w8XQNzPjUkWNcF8J8Fkm1+T8qLfcBGx77LzHllpCC29syqgU
         +IFQ==
X-Gm-Message-State: AOJu0YymJ/qbxzd9c3vZRfoFy6Wcn/MNU2uYQQiZ/AuqMHB/ZXq0nMlR
	84tVfv66stqmIy7akPFJoFmZKTtYL4ojmLKdI/0rhrDJG3MOsSVqmi6mZop3bS5VOQnmI5DI7XR
	twWxmxpwWWFlwDlLVDoz1dIQl3gWbs0NHq5C7YAb+DpNGAhMd20vGbRzfw/yfbQRm8Alvabqak8
	rCo88TryNlml5C1r6imCK5mcBlWXwR/9qAZ0TQNqfA+79YJ6WJ5PcXWgsEZg==
X-Gm-Gg: ASbGnctlbUbiEs7aMp1D3IhY782S4TFUTyeP6J2JMm9cFLS1GgbZG5Txl7m9nLMbZwN
	ROMbQAgJKKNIT5910HpPtT8k49JeyDGXiWgX+ao9tWllZ3+QMp+6y447ayqGXXN8xfy/8f/+8fS
	/cw3DwNNhyx94tl1dGF4LSZk0cSDrwEEDilItGOTCuds3llQrpLUmziVAJL3BU0fIFUQFz2xYBX
	sq8wLfYz7SrT+GX56mm+xAMGhwzrNPJs4JSyjIsJkdK155j2nVsKIs+9Cw9hR9G9/9GpbBcoccw
	dOdH1F4+m6jcftDr3PL+OrhRhFZy/iPFXEjwm+qNGZ5MHmpBhzY8Qe/7Z5sEUWAtMjlFAgUB34p
	vpXJ+nB5geuq+vxMYfAA7uA==
X-Google-Smtp-Source: AGHT+IEsmqOHB5gS1eO00vX+adpCsduyiPqTQoQz9A0b9vatapqVYnqJpz+KZ7UBWUUYEebCPIuu+A==
X-Received: by 2002:a05:6808:2e45:b0:3f6:a400:8216 with SMTP id 5614622812f47-3ff0f500249mr11232579b6e.13.1743619932128;
        Wed, 02 Apr 2025 11:52:12 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff051aaf60sm2470462b6e.28.2025.04.02.11.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:52:11 -0700 (PDT)
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
Subject: [PATCH v3 2/2] phy: usb: add support for bcm74110
Date: Wed,  2 Apr 2025 11:51:59 -0700
Message-Id: <20250402185159.2976920-3-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402185159.2976920-1-justin.chen@broadcom.com>
References: <20250402185159.2976920-1-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_115213_895375_AC566935 
X-CRM114-Status: GOOD (  15.24  )
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


