Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAE5CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZtDd2dpRTbBih32m/3kw3VCO4DN79CIvfv0d4AZ5vY=; b=H/9T3xU+5SW23zAWxO5E6VIwmn
	uXMqUQqzM3rhxiVOQlOf1iteKlU5aUW6WDD0r82kcBNDNPhsiS8GY/qBnHBiOh2Ed2pmrhPo3HKkt
	nYEiAiR23ilzWk5abpQdE9tvwm92lVjXhCOWLpnuxvUxAuOmvIfZglILLNxe6Tpv5lsNRAQ1TnsDV
	fhXaqRF8If6oJk81lAtTIbanmHvf59RzhzFo0Jyp+gZP4TtnKZKykOzsrROO8oVJq/YfDcqkx8nzm
	3jDSj1x0zow7gV+xyRW5zi9j1XoWoY7MVXdM3oFFmCLsTK2LfrWQ0g5AnE0zEjavuDoO78/yynhF2
	5oqZXKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAR-00000003o83-2M9s;
	Mon, 08 Jun 2026 14:41:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAN-00000003o4l-2dhU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4905529b933so47797075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929686; x=1781534486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZtDd2dpRTbBih32m/3kw3VCO4DN79CIvfv0d4AZ5vY=;
        b=sg7SHHOjXoe98FkG6CBv0UsRqRYbDHRayOyY2VNtYz6VmSwF4RXnH5+nFBItF7zrAu
         z8cV8KNJgqY/yGdteC6uI3cphPpAU7uwgDgA0f13B8/TbVwsbd+oMf5dW16WDzA8n7T6
         zMNvLsOFXYlc175VbZUWoWV4qhqUCzpJtJghUuFa3njB9UFZ0j1vFu9nnFmEOo0h8gGw
         jjTarcb87B+QxVhv670YIfHaSLzMz4NyMFysTTxYiQrIY5ae2nM65aA19QJsv/ExcpLC
         LPrQgbGVZZ76MLFuZ3GyWz3fwJjAhiWTxZExj9bFzJVyutQmtOJmHjfKEvShT1LoS/1/
         dh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929686; x=1781534486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZtDd2dpRTbBih32m/3kw3VCO4DN79CIvfv0d4AZ5vY=;
        b=JSvJGzZso6eet2MWixlXCyqssPa4TIuQVZ0JNvz5nIDyWD8z0Z81uYmejIVz+G0suO
         9VH7kC0Q4125UhRjsFL78FFEOhvHf5OrMseYe02OgJLvAdKbFVMrpbo4eLPLbbFVXtqO
         bNgkT9sKbypIBVnMqPRlmQy/fENs6Rqx1wZbidZdDxnQgldFLqiOeBXbc6iBXdak2YGT
         UCZarfMPrBSHlcs48jgczHPE0/zUh3wEHD/omnYZMM9t5Xew5BjD4sNXZe0piotos31X
         p25NUX1coDZyK0MOx/FH5uht0euw02jrcicMOEFLAZ/p+WAVg1Q/uOpDJeHS/DMONjDX
         caIw==
X-Forwarded-Encrypted: i=1; AFNElJ/LRCaQBul8ESZFY/0YQ0yNpkuXG1sO2PW+BF8ewxKvXW7+t1Y874m+sOFghe8onVWxlhA09C3jbYWMgn5n9d+x@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs8Su6MF0ZqguXwYpPrzqjKzT+E+hkMlJc+rGoC6w1CmWTS4Ld
	RDu8oGj4lwGj+0ewMAbeQqN1mUTsxCTxfpmYNrJGewKmuCTIhABTF9zM
X-Gm-Gg: Acq92OGuq8P++4dNO91F63uzU1/zBr6mNRBZcdtXQdYjYDzuE4CnmEUXsyX409/dXW/
	TTme2KHh2D6pF9uIvpBsMmrbydxc0BshPwU7do8HafH8vhCJo5Z7ca7hvilYexaIPtI5fcPYjeT
	GBjT9zM0R3ZVhoogL1cW8E7uo4dLq5hZfra/V8P5nbC7zaSNioyIhbZDLEXb3bI1cjqtBwdkiqF
	UmHyvu4GIYU/RAEw18a+98xLSgM02U6rQ8ERKYFudtf9mNytfeuT1v5EzEwByxhZ5Qzty3lcYos
	mElEUwhcM6QdMZsCYIqPBMv+VtWy+8Bsb2IMsCN3mYlkXQY73T6LRMbYRy6d9GwmLxtjoRHb7Yf
	IwzuYk22vDfDX4VfYOAYw8jsJIfROuOnMhS7gIovgqqNMWyRrCjFjOh2QTSrr6vQb8gMAZU9U01
	efAAQvln3L8gkO/4BupTCgh3hS711MdqO8vXTaLx7c0nJo3Kic9UE4oTIZZjBpSwl7Q1zXjopD6
	VUsSrFS8/NNkSHzbUxMZ6TYBuys1qvuJLawEORSaWOZy2Pg
X-Received: by 2002:a05:600c:528a:b0:490:7136:ad05 with SMTP id 5b1f17b1804b1-490c25d5d3amr273239015e9.31.1780929685726;
        Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
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
Subject: [PATCH v5 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Mon,  8 Jun 2026 16:41:03 +0200
Message-ID: <5646fd0a05093822d25bc358c53a08735b16a300.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074127_695985_F20D4ECC 
X-CRM114-Status: GOOD (  15.02  )
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
v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins

v3->v4:
 - Fixed USB irq edge type

v2->v3:
 - 

v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..cb27853ba281 100644
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
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x400001c2
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


