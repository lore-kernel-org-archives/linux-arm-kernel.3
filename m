Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FDFCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9onXniPIM0BFv5kDhXCuEWqOXXqSqeWgy1dwP69TYg=; b=CFLFo2gh96N9XAhIlStQZP66SC
	5vFxyFZ+P6Rtq+e+Cnjz8kWj3LpTSa/Lre8X6x7cEN2ZnaCctN/A4q31Rffy0E0CloJ2UxEmmMGHm
	QH/hFVsbabnOxzMmCSaLEPrOfD421QGwVLtsjHr5dnRqJHIHXx5R7cIOKc12wQG35HszIq5jP35IM
	wPmT8LKrrVTosy/GlJpyH/RQjptCWpyOKgjKVH/Am9OZJ7FeDS1cL/pA2zXV1IdthIGwBBdotTIVQ
	Pk+2YuWVSaJ/T+ko6cJmZw9CNhqMwzmaSOvudRqc8ahgDWEa3SWPLXdasQbH+7BY1DFTeluEK6JYb
	7kmnqFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvP-00000003HYh-1OZ2;
	Mon, 08 Jun 2026 10:09:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvM-00000003HWW-1eFV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45fd45e596cso1933711f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913378; x=1781518178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9onXniPIM0BFv5kDhXCuEWqOXXqSqeWgy1dwP69TYg=;
        b=Hml7SJLDeI21/uZxHOhcR3CNi71F1tfYhv1VwPIfJCLZLTLVbDhlBr8NT24Hzs4Ep1
         oxHnbWEcHDGikUgQ0VFN8CrkgQGayZqCVpOadRT5tQr90DA54J11uTqK7yTcdNoXd+4g
         J71b3ULMYHeLLQXwQNxDZ9DNdzyCuJZ10RzcPB4SFJEQNGucJCfnklVhsb37h7uXbEH7
         ypB0OB19vZ8sJBX40jUX55LlVODgfV4Zu4HBM+ExJre/bI+DHEiFxCSdHgW7xgi2jLXQ
         RB4SK3d6lbGZzIzzMT+Ekz9KW6m0Ru7zdBAzPrhTVKVO95uVh62x8tihsdUFk1xgkddR
         GL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913378; x=1781518178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9onXniPIM0BFv5kDhXCuEWqOXXqSqeWgy1dwP69TYg=;
        b=hfpPsiO3ImskAdf4upQag2UkGVi35js/KZCUE5FjWlj1NhHd9xNGESS8/sIWM2VoiF
         eziTjjv1pse5HPQbj4uRs4e5MKS+WrruI5N3S4NGoCprQGUK1ZqPx2vTt8EBKfeNC0UW
         nXL/XgdPr5n00UHpYOdRMHEHzKxTDLI0lkO/ltLlS12ae8qL79zpif0D6wwQBG5/wg61
         t0zQDdac74TT4T4Hf0Ci0c8inY/5oO/9o6sNRQzUopzi2CSfbLCOwe8ZGaREYX1ogxNP
         eIVVlx8qYD8VcNsc8FKfL8ef85EgEJlFh5/lmObIAV3Q8E4ax7atWGkpYou/Utue57/x
         V9ag==
X-Forwarded-Encrypted: i=1; AFNElJ/FxvZQujftdac25uVgOngvApyup8Imt0babAyOBCTREx57nABU91SVvK3SWgag1Z88LeqXgcZFpM9H8pfFB3lv@lists.infradead.org
X-Gm-Message-State: AOJu0YyFLEo0gjy8XPT906Mt31qVFuWZXRGxZ/yLQBj0PobAbm5htrUm
	F4BAie8bvORQw50hWZwPXN8qWa3dyQ3HrfJ3ZIU2aQDgtf6wS2DHy9KR
X-Gm-Gg: Acq92OETi+e+17f85kMoTTXsc5JbJXN7rWdXWuP+OD8ctRArEt+6xzbeKDNuHPilcVj
	8SArvkSr6sqMyHPWeZVxDXExd+O9FTOpT1lt16uaj3100U36NaFih7p8diMzoHbP3fO5+oNiXmt
	Fpibvwv4x0VLRb2XDxOpaq3ulCLi966z9RL/UBgOu8s5qCGzKu/CC87viZXQZgVIyV5Eee8ADLm
	4r0zy0Vw6nq/R2Cc9EIS/oIN7hhvDN7TTkFRPHnhMKvBzNL+oidfCIomR8Bp9eo/9kJzUNbgbla
	/MvFF2c8P6Z1WDeXm1NJ8kUYqQg+019oBeMqsheRUQpObMnabrVQieBU/4c6Isorw+7co9zq8Qq
	RfylMcIbmxPBgCwQc/OqbGyal0Zg1Ql2CKKwTEyxFVpGfxZ+JinGOgajkNXKxedL8Eppn5p8+hP
	h66CcV//M+b2BCxcQ3ZDRF2H8zo0IH7HJwDJ325y2FyIwtcRPGTDFyZI9NVRrnrOnPGkr7alGxQ
	me9vpwNqZln+BvJyAo9TG+SnS6zNPL39P0unLRG3bY3GKCF
X-Received: by 2002:a5d:448f:0:b0:45e:fa7b:a7db with SMTP id ffacd0b85a97d-460304eb421mr16635918f8f.8.1780913378451;
        Mon, 08 Jun 2026 03:09:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:38 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Mon,  8 Jun 2026 12:09:20 +0200
Message-ID: <69418a0a09103d0982e474d3d5ca8a3543fb39ea.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030940_457744_8D163B65 
X-CRM114-Status: GOOD (  14.83  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Fixed USB irq edge type

v2->v3:
 - 

v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..2b04c9027125 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -72,8 +72,11 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	/* GPIO expander */
@@ -95,6 +98,22 @@ usb3-sata-sel-hog {
 			line-name = "usb3_sata_sel";
 		};
 	};
+
+	/* USB Type-C Controller */
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
 };
 
 &snvs_pwrkey {
@@ -108,6 +127,52 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <122>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -129,12 +194,25 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-- 
2.47.3


