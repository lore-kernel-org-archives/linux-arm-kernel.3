Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8E4109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt+R8rdhnMH0JxLkvpX/7AhCeFXaCuhgwgruVNrcyX4=; b=t/bZBurQbB1gB2xWomcQk+FWbl
	Z4vQj3tH5dyE1WEDD4rJuOos+tuW2oVyL3CychcM8sWb24bc0cXeGu6WuB9xIDoqlwDU9dAS5bE7w
	ACizPMyjBMKHgffHvZlxboXs8tWPawJ7s8RTPO4DQM53CQPDiLw0KIW5ZJSt0ETQHUMRmuxULAm+K
	Plw6ooB73gkJd5vBVPPWXf+Wb7mHH68c1vy0ToY3EVClAvte2FYH9q3KoeTuZVt/1i+omVVO9xXFJ
	k+WeB1+slBCSUj0ENrl4XnBEDj3QLL2jsIrZaODlcNBOXTFpTZYITusRoDqyrMf8+J1ksjzRM29tp
	Lu63GFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJi-0000000BNKk-1Izs;
	Thu, 19 Mar 2026 18:41:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJd-0000000BNGl-1MZ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-485392de558so8362935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945711; x=1774550511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt+R8rdhnMH0JxLkvpX/7AhCeFXaCuhgwgruVNrcyX4=;
        b=TkKabaHoZwCxOhcHmBNv40wGGVYZxykUSn5mw8HWdWBvswN2vi38F+kRfoRScwGYEh
         VAi7KA9FamriHZ1Ncqx8n2kdNY40pZSx9L1g0MEVPNFuWbURxn10lLLQgJQwiW8erqr1
         w7Q9syLymSVdIWX/JtOpefymDiRielpZwpoaX9VbteVEGgg8i+kUUS0gXzqRiRTO1QT8
         Zrl1uo8rfEehKIAzHHyzrQOS7kXa7iE+FjhYl9pLOVQjhRhWFmEId3YXvN1ULmqnCUCx
         e8SSZOPcELcU25KK20aAI9QQVnLoPE7qAC1/8bE6aFUumMyKHKQuxcM18mYrEsKo6PoF
         yNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945711; x=1774550511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt+R8rdhnMH0JxLkvpX/7AhCeFXaCuhgwgruVNrcyX4=;
        b=kSD2K/BDnHBLB850RcZk8EZau8ezTF6VyJBZJBTSf34gSRamZnOTTXnoTfiFcVOm8o
         +LwnozOWEhUQf+K/dXw9f7khzlCJB7FZrSabXPAVxuO6RugPoKySzYWCfuaNI5DHb0kF
         k6FBkB4pjqTcGk1CkUsEo3PMy9sePvEGwjoVFgdn6SCDaSbhmniF3yI7sC3eZU0PJM05
         KES+4h8QHSrdcxWPGts3riABklownm0t+3b+ptHlUZ16b5CvRyK50R7e60LH5OzkhYO6
         zNDL9dzRqPQyqCtJZmhDl72MQyo9TjBAMG3KKLULJWyAfzIoBX9d4JV09sn64PUrD4Cd
         Qz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmF0Gw+Af81eCTTPLAB6nW1S57ty/8jQnz9ciFHQFgv6k91i+lyBoFac8itqFDD5O04qO4eaj8Tj8YIDZT8Y4O@lists.infradead.org
X-Gm-Message-State: AOJu0YxWhyAhh5ytpSARsSphjMLw3QzoR4x71L5ZdhDNuWRLbaG3eaXd
	Qmmgl1IY3GeD7O0qXg/iYbP7MQhsbvga9ZUBj24YnP3n51n/F12CgEqv
X-Gm-Gg: ATEYQzzKyyeGwYs70oAOpcMiUzm74hOdUPY9kHFhHMyk+A0OMwaRK5NOcg8hYW8HrZh
	/M0fSRhCsBYi+9wKUJfmB7Yn7wroO3FHeUQ8r0Orj+KmJ40N7r+jBy3/yuXsi2UKK7XM5pp08v+
	Qyg/INUiU0XTxszKxrEnvlXXPqjx0fG3+Sc/7WXnFk1+LXPZw/uKHiwckSE5nmdo9kd13/5LCWr
	dQDQADbwQTxVPzUiVxgNNMjTwdFdk64paqWCVOuMtqg/ab80I1ur3D10ImHF772JBvgzppfFOBb
	FhzjWO6LDz+iexmhWdRgK4wHNrKZWZVUVO07acSM9+lQMDD/mijHkKWCFRO+TyaWz5rwzx+ItcA
	y6rmBeZ73QIG6ECnLzrhL1cQdx6q+MzXTJlZlwWVJTu4JJoFbw81EI0orTm1hEWygkYb0hi0jcr
	eIXNIX2/2+moUQngSIbtSrLJ0VMjGkrU/c1TkwIhpu0NRcoDg1GVHOlN3Abfy0iviwNvjTI+/7V
	d/ldV7a2HaIcnwdHWsQyNm6zgP8fDsLfhHHh5EfyEcCYD9UwA==
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr2852815e9.5.1773945710872;
        Thu, 19 Mar 2026 11:41:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 01/11] arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
Date: Thu, 19 Mar 2026 19:40:21 +0100
Message-ID: <d3fbc6a0d5782e86a2294f28786b415a7b072d19.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114153_380793_96B4B2A2 
X-CRM114-Status: GOOD (  13.44  )
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

The VAR-SOM-MX8MM module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mm-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index affbc67c2ef6..819707e6f3bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,6 +11,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -156,6 +160,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	disable-over-current;
 	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
@@ -251,4 +262,11 @@ MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 190bde4edcd7..b6560c03639e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -9,10 +9,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8MM module";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x80000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -418,13 +407,6 @@ MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3


