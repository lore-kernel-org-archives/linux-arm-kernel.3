Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E73FFCC06B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvM/p0ei/4Q87LGneFYY4Bf76uB4N3gLQRtuf5Hkp24=; b=rrQHOOuO/iF9t4GV0rcnig35do
	7yw0aEQbazkLswVx2VZ/sFEkhkCUNSYWsI9Doai1Civa6oeKAIasn29GN/S6TENrDnvW8XwWlbFHo
	g/0QZLiAR9ZlBTk6asRpHAwHFHr7h6XvKT93xznOAfX+UG6hr2HfwZiwq4xnEumRlDpJiiw8Fhu0T
	3R2xPJxh74igZFBsQM5Okk6+IB77dgQsx4SISzcYV3muabxMZZtfdzOp72pyqX9/i464ZZ0FJqhOe
	boewE+AciCuvMF+juKsxWKYcjkh1bYe5rkmVIzIBVrUNaMM1dTV59vXLZ8hH1DRDEU0I4h4r/CEqf
	1SUliJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJr-00000004QZv-2jxX;
	Fri, 06 Mar 2026 19:58:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJp-00000004QYw-3Q15
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso2002743f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827120; x=1773431920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvM/p0ei/4Q87LGneFYY4Bf76uB4N3gLQRtuf5Hkp24=;
        b=kx2JMpSTqSnTh9OOZ254XJPSeDL8aQbWJehZl/8nLSciT9L6ptBzMxf0lFlWF6d0ib
         J2BUIqkk9H90LxBl+DgAyMQY9Q5ldbkHZ7Jb717mPxNrQvmZlcH9jbXI537yBruvM44I
         nBdT2S5gYZSsZzbaAEO8ez7lChHsVQ1bCtDH2MwWgdNytbJVg0tusYBkPL9VbXF0m06I
         eSfKyDB4Ss8qxFa6tzR5Oolla1DFhKQKWg2S9wGc42abBYMAnfbDA4//KJKMFZUCG1Uo
         66IvvV/x7V+G0PxNpFoB3pBbUZBpj3SC7DVjlbwnRzxg3v63HWc9Kvt4q6WGbYSno6vD
         +w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827120; x=1773431920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvM/p0ei/4Q87LGneFYY4Bf76uB4N3gLQRtuf5Hkp24=;
        b=vbNG47Dvq2FB/PgsQb49asQUJM558N+J4w53ySDD/Bk2JnyhV8OsNgyx9UqdI9mUbY
         Y7c2a09LvHd6A2LBStGuQsu2382+dvlt1f/Ubz8Faom8Gb/MZba4ogCYn55IokZ0pTDN
         B8vUeW0BNs14DaIU1bjmlx85j9YV5nM+8n7H48CoLnUtg3DrrWFmh39atTSB7oH26YdQ
         5NrPjCkw/rdd2x33VZjeRBNUytzORcSq7LYvTJYFTRr+6jLwTt2m9LdaNFOeDME2Hb1A
         QcFt5YuLnJ3qDkcWPGCGm9N4Nt6t0XZXu6D9Uad7bEqHCR1LrSThx06obJQVM3HNy5H/
         HxwA==
X-Forwarded-Encrypted: i=1; AJvYcCUy2StKTbrKf8XciKAhLWx0LqE9bmIQXoleyu6oIezJ/ioXOckECjYgonMmYeYekFCF9bcqc9Q7WGtfDvoEIsNv@lists.infradead.org
X-Gm-Message-State: AOJu0YxQAqjwV4poK3qTSn/K/zu8ERtJfnhvdnMu2pcsASlu8Ad+41Lo
	T5xApan6qELCpD4rJgXYOnKpqUusan7lyPxJgmFE5wIYdTuisfRvrSG4
X-Gm-Gg: ATEYQzz2+doHQLuJ/kkWy8Om/NqtZz+NDBVQ/YESAbScGOjIZ8I1M4ZBIwmFiLcD3ci
	XVskLvvIp+3wV3H1u9SeYie5xi1D8jrqNftPl3rWC7kWl54kzpN8Cm1cIt2pTit1WJg+hh0kNDx
	By8ne+ESSAze3eonRoa3qNN9UiMeAKz/UhvgMwMSvo6uOePpZPh/kmC74xdljxKfmX9rtBSBwhL
	DObvNNU9f0oo3/cu/ZBOwlZDcS5cvI1fIvA1H2KUCgP8nM37WKRwND23kYlnHZbmV4RyBGqII78
	xcOZ7gRmMvzcvHywkQ7M4GQrD9VSQXAeClWr/eLGmW2xOJWPKPgg+NE91+yP/6TEWG+XqKq63YU
	k6Of5nTkAX+mZo8eoEn8AAyh4k+YHVZz+GNLT/DKokBL1TPaZRsVdBpPWnqXBYd1t8Yxd4nOdsc
	eNSPockuDkTSsOF5L0uY8v4JQwW8TwiIu+3h2abLaIj8+pnhYZPxZWWJpfvhcJy7sp1LoHmb/TB
	BtpUJLOEi/6IdW6cOn6rKmYA8dOXOUhXH2aV5U=
X-Received: by 2002:a05:600c:5253:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-4852692c99bmr54384485e9.14.1772827119887;
        Fri, 06 Mar 2026 11:58:39 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:38 -0800 (PST)
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
Subject: [PATCH v2 01/11] arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
Date: Fri,  6 Mar 2026 20:58:20 +0100
Message-ID: <b2ac5175ec9ddb308261746b967d13557958ba0a.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115841_868708_085967CB 
X-CRM114-Status: GOOD (  12.92  )
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


