Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A09CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70uSNHFwKkHfItFomOduAZmxqjyWJiVQ8AWJNM6Iaws=; b=MisT6/IlAOOBGLQZ45JJ+bAqpD
	HlYoCqN6AsHNjLz9VhmJIUVxX3gxJHNSEfR5i0v9fo3CuIfNBb/h5yCl8veaVsGSN85YbAht+asX2
	Wpc7KEWcSXj5h8r9JneooCCALWYq4WtSxfHDeF4+JFLaDEJvVX5E4P2rB5j4FPRNdymXY6JqD/gWd
	sFPZ7IwPEiqW7nC2nQsDMUk6VI6k/HPCwpmGWzFLHpxsm1VkNrn7XcpbAKfWGzGS0Awc6RRL7howm
	fhVysVlIIP/UOzYwh1smh4YESqeyk/7stm+HkoFTSGrDHj6aAK+sFiAbK7Xg63gX1EE/Rmw1S5esZ
	/bqp+GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiq-0000000FGnd-2uHE;
	Wed, 03 Jun 2026 14:37:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmio-0000000FGkl-2yVX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b3e03939so7467995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497449; x=1781102249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70uSNHFwKkHfItFomOduAZmxqjyWJiVQ8AWJNM6Iaws=;
        b=BzLZYtu423nO9gU8G+90tDxWPGReHA8EKyKtV0vjPzaKqDB/jpMHZYIJHnFKihFqFS
         lz+PJgSak0aW5tXsTlV5MCZW4AQ9wgg+pX2kb/G6AvSUJn10m/m0hv0NfuRVve/cUFKm
         6VYcdkQRklv33xz8mKGx0mV47x6/NsIw8pOa2l6pIsozqxpst3VmrUoqIIi1PcjURJBf
         d8BVkwfhRLT97Vg6g638VgNqOruwHqum6w+bn41tWgZ3m/WeBA5Ku4AjRHHozH0htzev
         8K04NBnUiUSupE902a0Xi+uuUq3O+OoxUp+GR6qjvNpTSMLyrLpZIjHvNvL67LJv8ppd
         wD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497449; x=1781102249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70uSNHFwKkHfItFomOduAZmxqjyWJiVQ8AWJNM6Iaws=;
        b=V8uLTP03NFVoVLK/lqL4MbuHpdHyEu2GxG3TN69rhOUmMYjDwjmc7yhaM3Rg6nzGEm
         t+0SHzYm2S6LT8pEmfmPkzROkZzn/KJCy+7y7Y3LCS6R1+YNUtg/cTDwRERMyI06TVxT
         MUvTl1aXtVtafrl++kw+40geILj+T+v8eBg4pEsV3cmO7IjgL7MjUXgN3LyWO2Wx4Opu
         Orc+kOx9HmSx96d3dCw8gRhN7PDBUbkB60Dh/pe7snnSAgNwhxE5NrgtT4MVihp6FS/H
         8IsLhH+jRujvJtTz+m/9El0PLv9xhdN0e5oNShqcX/WyH3vY3A0uoAFpFbQu3JUOTkJB
         pNUg==
X-Forwarded-Encrypted: i=1; AFNElJ/T1yGc4nqM42Pk12E6TE9QTeuuzRvq2mKMrBJ77Aj7l8pIiyC34Wh2gzWLiV/ARh+6HT36+inXN5iWW8KhdfxQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwYDBw2KYPJbh3KriHyQaUCtYVGAbYmUTudERqfK0ALQkcNCEHk
	Tr6hDRSOt265khIIM91Vz4/gmXipulYRZHmWtNN9G9xQ3Er7Fjc6/oTd
X-Gm-Gg: Acq92OH4TQD5PUQ8oEHf+/wPO1iboLyonkHxzlannih9rmZrDjxlQRk+e17cpuPHU/b
	y1YsMnQ+cyG8W6sWmOqCDBY05aGW46IWjPbJ1BwfGJdPzFDzUjLG6Wtm11tmPWEJlCCkX8MhkFR
	dgiG1AAuFato2/LTXEjoZiyjAt75Zlbc0etxmmcgpEfO6dKMxXEGa8ODqKJ7LKou6+wBAig1IXK
	/FWrHzjdaF4l6GFTRSCYSiDU7huxVS0RUqN/svP7AqfU6iCWdlFCNsIbU+/1+y+dyyapOk1dHIQ
	xkNyySXqnGl4xsoeHtftEelYyCs5TIYBvOlKexFhyNlDNph57wLOuKCQUbva6iAesjDOEzQkeiw
	2FPYlE8VOv0fWno047pyvkqyXtHkfyJU8oDuToZ63jTQaePGoHWGgSFMGzTUPbxMp5O38xrWPPI
	4tks8HXrlgfOeEEzJETbondGzYKsDS8TNhEw8/6JksY79voP8xqm3NYZcFmq0tYk5Skoz2NlOI3
	Mb1MFAgbz08iug1MmPKUlIMP5AJH3uDyIDppPVKuWtXGuUcGzonL4usm38=
X-Received: by 2002:a05:600c:8184:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490b613f158mr44573345e9.9.1780497448722;
        Wed, 03 Jun 2026 07:37:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:28 -0700 (PDT)
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
Subject: [PATCH v3 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 16:37:09 +0200
Message-ID: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073730_775965_D94DB2B0 
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

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


