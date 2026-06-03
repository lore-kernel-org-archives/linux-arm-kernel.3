Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAE5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOAXMQJRInvRkdYBQodwzb/O3fe/WllfMF2583czUuU=; b=n7gK/lX5S4C+lbNj2pPigd4A9P
	dWPbAjlYqTkj2GMOLfKjkaefBp7qYjwfLbeQTs03+PHgLGIl0ZDnYHxgd+TcPosKScnMwt+MiXxOS
	FQUVjXby5rgz9/bjXstYg6TSGBwqeBQSYfHa+hCS59ZN7vDAIipeV1iR52hgn6ZQ/5mhWjLGvr51s
	IbbhDN4mKnfl3uCkJlX+sHsfQ7CCvxNyq3Xt257AgCDhVz9rdCOfRnGiLLnYgVAouZa84N3Iu7I1Q
	AinDCsGKvBmujlho0UTmT4WFlK945ef9nr8R2nCmB2XS2ilm5uzPK471pH9XQDh5a/MEtFWVFneNc
	r2xaxA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGU-0000000F0Ji-3Hor;
	Wed, 03 Jun 2026 12:00:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGR-0000000F0Hc-3QIB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4600ddc4017so3046812f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488002; x=1781092802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOAXMQJRInvRkdYBQodwzb/O3fe/WllfMF2583czUuU=;
        b=lHKW0N9WhVnFlDQvwjQiVfSqhzkVUs+Xbp/fu14LWbj+fOAYPzQRGYK+FezaWFKWZ0
         DD9cjtCbslIzfSYrX6yIeDV92xW48sWVxkezI9hpAT1D7hksPetHzMhCB7IgAKzN2BA1
         YURLvW0zeeG9YyZ+/QnIpNrb/9M+RQTqo+muQhXRapvjPmcNv2uRDfJguuF1D4qOs16O
         LIbhnCbtAKp3IizSrsoHgfJR6AGEs1C8hD+NKOrUlJDPZjqVvsrYRwgwU/1uUoqp9xj4
         vNZ0gVlLu1BgERm3tIBlkxdR9sKn6GJV98xV/j93oF8V7GPqesT/f2XND1CIoR80cEVZ
         DetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488002; x=1781092802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOAXMQJRInvRkdYBQodwzb/O3fe/WllfMF2583czUuU=;
        b=XANAm6VDs3Z+npAd0sDytjJebopV6h1uSHxacLSqAbJBlvjGHpPJS//y8Sodq82x6O
         yf3A9kbLO6gZII5nhBvpTfA1PR6Rmvr1UmQwZiglaYJq2LnS9opEeBiNEYg4opOrIhNN
         Fyrgh4RKcaL1IgIhK7ysxDWatoYK+hyK8BlFVXoApTtaOZBhdGXikw++j9+Np0rRtG3F
         tpH94ZtWmBoMwtgpEw6No27B5ST34tKqCYB9ruupXLbktAFdDaW9kr5/Wn6WB2EsqxZA
         uDZpvyEDI9yBmW992iTds0jos8wQSY/ttOeJtRy8jx5neAQTYs7sd5D2bzFaNdfp7Tth
         Ptcg==
X-Forwarded-Encrypted: i=1; AFNElJ+MP7cbne2J6ocKxzQsfB6YdrU8vUxsLE/vx7cXfs3miYqGNijTPUOOWb8H7+5pFzOBJJFNqrIC13+ZjFk980mW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Lp1ohMK3s7PGbdN0uIEWKZBgX/aCzTe0Q4n095wjVJp6ZR0a
	rjZgLVLzNtLa0dz7JdOyX6X1qXI6dll+GcZlh2TKL4QYiJb8e8B6EcEl
X-Gm-Gg: Acq92OEHUm3aFflePd5RAwvoJnL/jsh4U9Vg+TXjY/+HWdcGnL00cj9HIjIzmZ8z1ze
	QOK8FkKTRokWix69flJplh9AU0eN35y5I1nqFVjKZ1WvUY/fAnXlTceXnMtI9q7fc2XRLHjVsNB
	70tz7QE028mY4Sc56DHfY75iuIdQbQN2Xdmo6FFmSLtq9JX8Ipw9Owe/69Mgxes8yrumDW5GLvF
	H1ekXlFkYQEtUqPT+Jec1NM5yUC+A9e52BJl8lLOWX3BhvX+rtUgyMp/XJa1nkfAPlT8oSe8xBa
	NsxouV17G6HP1X1WqRiBbpqzIZBo8wYxuGkgTkkPitamb7O9/OsfThQ1vJmBXNVOMJYAenLOpEw
	4niv9yEl/e2n7vl15QAZ5HlRO7JkUMNp8ksdUuZ9GKxK00FwwCcvUwHh8n5aEf2CpAJI2PJ0wKF
	TKOXcBEK/4Mzxlbm58aRLCRsQsUlv5KgPEIwqu3g6Se2rRb8yNGwWQkoAEA+kSSjc1y4GN0c3Dh
	ArqBkCovHKv/qnwzyKZFJNm8qAAt0ChWxoMR2xweLQtGofi
X-Received: by 2002:a05:6000:18ab:b0:45e:a0ab:8bcb with SMTP id ffacd0b85a97d-460217de189mr4934181f8f.15.1780488002109;
        Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
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
Subject: [PATCH v1 02/12] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 13:55:40 +0200
Message-ID: <36b7fad5b7cc932f502449cf4082e57f732e8bb2.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050003_875227_88CCF68C 
X-CRM114-Status: GOOD (  15.16  )
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
 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..de1b8b842848 100644
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
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
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


