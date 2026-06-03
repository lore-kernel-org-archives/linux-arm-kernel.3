Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85216CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L+XCOUCzdHOAi6HIhPFjvoFV9l5V9yicUXKuwNTGww=; b=MHojORkHIO5wjTx37kiDL2mFOO
	khFIwTuCgAqxMFDWunEzlt+zrlNPDFoxzbMZXqmsil4zIz2ofueAxnXDDA9X+eODRvZGbA/bv6enU
	uHYeO7FZp1CGuT+bfwmjiRYj312ACqz1ANTWxC/+RzTUv5TPZmHJRRfxfx6RiJAr3O7mzYHvH0pQU
	FCES8GItvW0Xdxh3UldayWmtt+Gdk+Zxf55sfeAkVW6q55I5229yx6cqjLHYmKroZB1K2sEoaqmUj
	fzt5JJmBFk51EIyETmXzmuSwz5XCv65BjI7ePKTK6D9gbY2VG6M5nu38q0xiLMQIzPIJ5wNpdJ88v
	dDSWJENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP4-0000000F8db-0Hz6;
	Wed, 03 Jun 2026 13:13:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlOz-0000000F8ZK-2LSr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:00 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ebafde87cso8656995f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492376; x=1781097176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L+XCOUCzdHOAi6HIhPFjvoFV9l5V9yicUXKuwNTGww=;
        b=KrsIwRo8a/eODI1dO6rKrE1CBfcTwxAKE5SzZPaRH4JGWx7fFmLitfoLPvpPLm6Mdw
         aNIqjfON1H0TUYcYBHxMBGpJov4kcMwdB8v8p5u7lcr/N9ikQ470Q4ZlqYOufyTLWfJg
         nEa4U4lBfyw7jsCQDFuNBoc/w8I1k1oe04Emu0MVxBusM50EUaZtb4P+hIHhvckmF27c
         xX3IhIrq12OcrFiy4Ciq5C40b5Jp0UzyfbEqWUXCczQ3+zI0KJQPLJ1/5sDYPclwcREe
         fM2KPOMAXt8DGnBanqR65a/gXuKWWDmvKvn77fSelaBhRAhy0OR++v3yaLjTsZJXN4x3
         RYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492376; x=1781097176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6L+XCOUCzdHOAi6HIhPFjvoFV9l5V9yicUXKuwNTGww=;
        b=tJnh0ZZHWnrW+CKvam2cLPQKAna5rANDhuYnXPiBZW9dRtw8m7Y7QcCT16QM1h5/Mx
         cNfSfAtqTIWaN979ckZ0LrmkTSP6BarYwMPPe79P5npjnH4y6ve2wn85l0QsAxXUuDwk
         TSFM0yhdFYDEs2FwFpZtlcCCtRKSJ/Y0SW3wWh74g9wowZWV5KR0jUAkF12xbSpQupxi
         RYdv6Q44vB8k10VqHuGTnCA2b/nXqIQSx0uv6XxLKYKfQnSM6LvPqpFi2be4rPlF3x/M
         9uHA9+3gLsOGIHvGWAzgVh4ZtHkWt/cweMhXygkaCrLZhSXvyJDCVeMo3r56fwkdPd6s
         qKuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HCJxYoa8s/tYOwmxJK/fZ+t8CUsmdYGzjrcIJ0S08ycdSLGOPfHoB7o2N18G3mJc1XZ6sJopK03/SoBonSI89@lists.infradead.org
X-Gm-Message-State: AOJu0YzGNF9oPuSMDLtMYlGutpzL4XZhnk8skufyTLZKUnf4GBOSTa57
	Lq3UG5zoOQWOjbnRcEi3d6mclyUwB9YfUrLVEKjJ+avV8+X0JmXHgoMc
X-Gm-Gg: Acq92OEhAF+YizwbECzyI7VpQGKv8+gp5+dGOibbeaUf/Fug2ICDUJdQWyZQpOgra2f
	l/aOdFStkeHVFB2GX+ViiSPnZG4tGAFk8hx+tkB/eWv5DYdC0mwXBP8NFS4zbhSrmUgBUarJnCr
	+JvaIY1YVoiGPJ5xHMhRuC5ooxBZtJVQSxBk8YWyCSn0VEXWjvYZ5bzgRjOtkwVN7iE9iqZJD+h
	AxTzouhqLPBPnGI/S2pMsFA2WNugL6Z2yzlPTRN7vgEu1+aOx8Fsx/kUe+WAGBwicft8+btL15Y
	NSJFDiWCpbU/aqSZwFUqcq4gqeYaATmax8giSOBfWYrybt6kFXajjBi3+9JGp2VftYu2uEiuj8I
	XM2tyyNjFTM1ZY9WFgNzoWw4V8K0XA9jRZgE+5NCXgJRGabfT2hsWWgqegqk8d/l3rabN9net+3
	BvDeIBnmWIRLonlAXqt9QPUarAajQlVmsTn9Ys5mnRRlK6LWoor5vwx8aP/zs5Jg3OVzJlc4jiO
	l4wpovFkD/PrH7+M3BZ+uGY5uJukTyxYKJbvq0FIIN6xZ7R
X-Received: by 2002:a05:6000:4b11:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-46021726505mr4743494f8f.20.1780492375917;
        Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
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
Subject: [PATCH v2 02/12] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 15:12:40 +0200
Message-ID: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061257_623457_F42255FF 
X-CRM114-Status: GOOD (  15.06  )
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
v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..76928b005826 100644
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
+		interrupts = <5 IRQ_TYPE_NONE>;
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


