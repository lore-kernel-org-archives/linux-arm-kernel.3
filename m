Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C752DFCC06B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tXjij1D9KtsqrCPi7i7680wT/H004NOdFpzApfvwok=; b=krEgv8QNceapd7njzJ1jmzONb4
	P2sFtqGG/QhAVHWE0xpUpC6tdjo++70rjfvqBwFFEOENNcKu2wFOkFCLPSz3d7U3PahsViD1dYeHg
	Qj0D1E6twTYg+pm7jevIjf9wZ3Vf7WKu0LNYGiKzM656PJG4nN7aug9CxOXFt+pDrtye//5z64YEB
	o0UnjeO9/nEdhmPyjQQLMB3wFHJ7Hu+F9sogleqcMSCyFk1yQs2OZJtmDOeQeQEaCtX9jke/A4AM1
	Wv4PtX0TI0wDjhLSwpP0Im3iNatc1YMBlx44jKVKWJlIYSbWPF6HKkaar28+hbo24eg5dWzjFktmy
	Sn/jEF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybK6-00000004Qmn-2WYh;
	Fri, 06 Mar 2026 19:58:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJw-00000004Qcy-3siz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-483703e4b08so93979455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827127; x=1773431927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tXjij1D9KtsqrCPi7i7680wT/H004NOdFpzApfvwok=;
        b=A1J1cjjy0/sQS41h936IFlpY3PGLRbPdUmj3sS1Lg7xZDLYw+mjzVrXOuijSFlCrGR
         TOf+vR70Crf7ajF4TxsMrVvQIZVocaCVJfuRvR5dJ6sxXfbinKjB6m7q4oqqkMfh6Elk
         +LPesXol0iNXE1bHTvS9Y0avKJoar1zz6GSIxUlVFV8vBM6qrpidFSOXA3/wG6P1jIFv
         i/XTE0okXYEuQneGPF6qE+r4f8kc8+JwXQ5dZlyGrwNFlNKCc4Vtvzr8e59MyFgDOVj7
         Rgm6g28zSDvF3UP4ouEHNDyKQw6NP2b4B9uHPvmynQ2+X9I23sxS/mmbdn3hTO2aOTdy
         PZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827127; x=1773431927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9tXjij1D9KtsqrCPi7i7680wT/H004NOdFpzApfvwok=;
        b=Jj3qIft6boJ+laWOVxRyMVdwOd0e5hnXvtDcEoa3LZstyo4XSKfKNFfdkqELq500CE
         Md6zEh1mqAHlJCZX01AWLtsxPFWfrDUohqiz4T3ZfhVAZ1f22V8UQIh3AF7y036qoP3s
         w/gEDAUOUPPn0ksf9YiuPQr07/DulscCGdYN/4eShwswgdKHLuuHWrfM14hNcbFL5OmZ
         OR+e5e2CZimqsSw9XqVfZzc9sitX8wfTCsR/ynQ6BOmPfrGMyNhORhb4y/ZXgV3AnViQ
         ewuaIVVkbXG2xR6LLebe9eq88aXEGrS+Vg0EuShxL32lIbGAOlOmwFFv+L62jOJG0d77
         Nytg==
X-Forwarded-Encrypted: i=1; AJvYcCVOyEZ0QlnwD/VCNQV/3sM+P92RtD1+qzdKjj678Wpl7NoPxJYjHDIQIsDw8XJggsZTIPPqvk3bdcTLZiEJgNc1@lists.infradead.org
X-Gm-Message-State: AOJu0YyelOcZNF9B67Jlp//ri/zPQkfpcZx9w+mqmdBRDr2rI4JF3La+
	bFIdW+61fRkrM7R2z8Zy3xy0WaDG1A1MtCEz5/N0WxLuoPjOZzW7iONt
X-Gm-Gg: ATEYQzwobSAIzY8NAjggymM7KC/ucgq1DWAn/RGZFk/QLTkit+pIU4lCZttj40ITlzB
	ZU8TXzvG6fTnyZI18lZ8yBb0VFn+HSdszQZhY3XXuB4TrBip3LO6lu570Iliu8B+0nk0PTEy7kf
	mNtTpXmu1P5twj42kyhmJi77Vi5eJkKWIAuP2okoJbnhf3z6x0LG/C4vGfLf1A7Xomsrs6zo9pZ
	eWz9CJaFrHfQ58/ZC8eS9c22aHRGVuJUQ8AxFiafJFG0vmjRdBCuXU9+6Mx1IFI3V4X3ewQBc1y
	hDDue6NFg2KonqfMiFDHz2bRpTa14WKk3US9l5CEzXfqq/z+hoO/WAo1mJV8nG6/D/OkRAFbMz/
	lfI4tlZa2rEtRr/0W+Y6hlQ5ZUwPB0jTnoe/IlXqw3KMkVcHerh94W3Z2CXN6reQd32/jfTbSbX
	FCebaLlGcTnA80OdVR3Hx+G/BmaNTHDZNyafOnn5j37N3yzhX1wBcGKobkLwFSv+br4luRnASgO
	5SB/fvLeIShun18OAjqeGqy0tpVFg1eRdiUzbEu4pjfYUTenQ==
X-Received: by 2002:a05:600c:8705:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4852674e8camr56209175e9.9.1772827127154;
        Fri, 06 Mar 2026 11:58:47 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:46 -0800 (PST)
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
Subject: [PATCH v2 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Fri,  6 Mar 2026 20:58:26 +0100
Message-ID: <04b20cb1abdea86c551a851a19eba8fce1640c87.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115848_995050_1E008BF9 
X-CRM114-Status: GOOD (  15.30  )
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

Move the USB controller configuration out of the i.MX8MM VAR-SOM dtsi
and into the VAR-SOM Symphony carrier board dts.

The SOM does not provide any USB connectors and carrier boards may
choose whether and how to route USB, therefore USB should be described
in the carrier-specific device tree instead of the SOM include.

While moving the nodes, align the Symphony USB description with the
carrier design by enabling both USB controllers, wiring USB1 to the
PTN5150 Type-C controller for dual-role operation, and updating the
PHY tuning and VBUS regulator pinctrl (including a sleep state).

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 52 ++++++++++++-------
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 12 -----
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 51ac8ee34c3b..86246de8f36f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -32,6 +32,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_usb_otg2_vbus>;
+		pinctrl-1 = <&pinctrl_reg_usb_otg2_vbus_sleep>;
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -140,13 +141,20 @@ enet-sel-hog {
 		};
 	};
 
-	extcon_usbotg1: typec@3d {
+	/* USB Type-C Controller */
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <11 IRQ_TYPE_NONE>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
 	};
 };
 
@@ -194,27 +202,29 @@ &uart4 {
 };
 
 &usbotg1 {
-	disable-over-current;
-	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
 };
 
 &usbotg2 {
 	dr_mode = "host";
 	vbus-supply = <&reg_usb_otg2_vbus>;
-	srp-disable;
-	hnp-disable;
-	adp-disable;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	disable-over-current;
-	/delete-property/ usb-role-switch;
-	/*
-	 * FIXME: having USB2 enabled hangs the boot just after:
-	 * [    1.943365] ci_hdrc ci_hdrc.1: EHCI Host Controller
-	 * [    1.948287] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
-	 * [    1.971006] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
-	 * [    1.977203] hub 1-0:1.0: USB hub found
-	 * [    1.980987] hub 1-0:1.0: 1 port detected
-	 */
-	status = "disabled";
+	status = "okay";
 };
 
 &pinctrl_fec1 {
@@ -269,6 +279,12 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x16
 		>;
 	};
 
+	pinctrl_reg_usb_otg2_vbus_sleep: regusbotg2vbus-sleepgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index c37badc4cf27..75f56dc89b8e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -378,18 +378,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
-&usbotg2 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.47.3


