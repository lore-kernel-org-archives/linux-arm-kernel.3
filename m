Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB3FFEA83F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPBXxnt46yKYRfcxb6dOkKkkhDI9ZyG+pcJC//3JKGU=; b=zpYKcWL24qcLt64d2ZEf7U8U/M
	4D7fZVGdPGa7T13ctrG0S78TpSEEmEp6gBu2TlssDagHfbmukkdF22Xa8BPlpKLU+n0gSr3ytUOGY
	bGeSCBKglfJHMWRMlBp/0E3PvZ+rIIC+DioV/YrBIMr/kY8Cg3JtglMKG2umNNvuXHwJz/Sna22p+
	UoBfCKXisakZ0qN63U+XuqFW8iubquTLENeARRaPF9NvuGw6WSnG3J3NMVxTwlX//1L7/FusOB8ZJ
	AP5s+kqXK2Qj5waDLivHj419hfETEUZLNwnBKqrkoPEUe8d7wcOci2E729L/FMrghWNTYQNsbxVAr
	rn0jctoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kt2-000000034yh-0uHM;
	Wed, 25 Mar 2026 09:50:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ksq-000000034ug-3yle
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:50:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso21262465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432239; x=1775037039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPBXxnt46yKYRfcxb6dOkKkkhDI9ZyG+pcJC//3JKGU=;
        b=B/p03swSOvSqKEGBGiYb2vkHTNma/zrIFec1vnF7mE7N6x4BqgvT+DaGCCOGPrbCVr
         Lggr8gqjUNNW/qRSl8hjvW7KsYxwMONsg6weYd5kkzTMxFqNgSvKPqab+opOhDo/oapp
         8DVDGsS1ME+iJSPIxd35/1nKQ74zJ9IQMak/8O7a+qq6YaRJSa237PIbM/KyRvV/F+aq
         7SYfw/KzYYGKWl7QfiWkapm9dybysL+h741hrxMwBPbvStnyPsEq0gZiG2cKniDDBeSC
         qBnFMYNdt29PDmQF1+cylfu4IW96c43wYstGiWw3uyN1Z7HYkX9len8RtQ1G1TO1ZBOb
         K47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432239; x=1775037039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPBXxnt46yKYRfcxb6dOkKkkhDI9ZyG+pcJC//3JKGU=;
        b=sU6pvsN5K5KIB23qxwGYwrqmk8y+zROeMW5sWn0wXCjfZGlcBF76KwZQPAy2JnPFx4
         fzHwkqW2hf5k1ql2Vu4IZe09IUd+oW6k+01daXkeKfem9Dp7RAII5MglNjNyOWnk93Np
         vHwSXXOFSrkbmwOeCyCb1sNghPrZhsfYnoYoYhgmh16JAhL+26unlZrX0+301e0yZkLl
         j3kn7cfxEJV8gjyCavFxBPCmFhK4MujYQfER9iW9bMGHUPtPJvBcadypz6u1G+grG+c4
         91KhuxbtNgVSiWvKRXBc8FxU+xHMGurBkDFRpaxRpwQF4KISiexLB78gFpVIb0TD3eTW
         f0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUmDC/Oe/dCCC8wDzW6qwzo7B4oDmcuId7Z/tvjUaXW4xmhrcSzDdgRTnrlngRP3W87rCmqAwCa9gYRi4HxtLEz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+KEM5PanKywvWInl+RVGsjHWKrvBHIySspg9Tyt/HFKo8wPmV
	DTSwRqzItFPbBTdyoYeEIz6LTz3CTMWjeKj9o4t8BK1IWI2gSivIaB1i
X-Gm-Gg: ATEYQzxTKH+jIyszqu+quY4A7Zwk9m+2E0552iGqNu9nKsFiN44rOgKK/30c4z98Ywx
	ETPLo1KdZElAPOFAFivIu5h0QI16Hv+nm6D20AktcD1QN7R8xk+jhCdxt2hCL0zqseZjwXbkX3J
	VWZOqCI0vHvyD9PT3z/3Uil+BGenGlAzUwS/bVe/yVsOaJQDr7SsyGTVXh3X/QUXaCqdec0eXfv
	CdnkArV5Okr1a3e/tqhRtK/vUd+vpKc7rKdAVzE1yMQOLCOFEyH/ZsfeWGzi/WWE1R56udRltKQ
	oBvkKUQ6JDiDka5hfgzejoN/LQ1GdXmzXxXvQWhTiUEsmAKp8KbQczc0GWLkwk7AYBJtHbxTI3T
	hs3lqTNI108/PVSMHyFxCfj+jR8ux6zKTPlGeCGzDFMTqoOXr1dZ/XdgS1TiVooP5wdnmW53vhz
	BMjEyjmJ7jar/Gnt/kr1pAxSvMYZte+bcHAqZkGSzjiHzvgCEBp4fNA77uI04TvPmcm285lGfNx
	2psZ3BB8tzbYzKFM/lSMfrqNQ0w1Kcd9bitRL2PLhK4mDpDcBki1XmSLtRMEO27GlMwAm8OFrxh
X-Received: by 2002:a05:600c:3b12:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4871607a3c5mr45415425e9.25.1774432238789;
        Wed, 25 Mar 2026 02:50:38 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:38 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 25 Mar 2026 10:50:20 +0100
Subject: [PATCH 1/3] arm64: dts: freescale: imx95-toradex-smarc: Add SER2
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mainline-update-imx95-v1-1-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_025041_043326_5C8EE86E 
X-CRM114-Status: GOOD (  11.89  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 has four exposed serial interfaces, one of these
is SER2, which supports RTS/CTS.

Add UART support for SMARC SER2.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 .../arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 5b05f256fd52..7437e523ff63 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -210,6 +210,11 @@ &lpuart3 {
 	status = "okay";
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7a73958f6eec..1d369983cf7d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -22,6 +22,7 @@ aliases {
 		rtc1 = &scmi_bbm;
 		serial0 = &lpuart2;
 		serial1 = &lpuart1;
+		serial2 = &lpuart6;
 		serial3 = &lpuart3;
 	};
 
@@ -615,6 +616,13 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	uart-has-rtscts;
+};
+
 &mu7 {
 	status = "okay";
 };
@@ -1105,6 +1113,14 @@ pinctrl_uart3: uart3grp {
 			   <IMX95_PAD_GPIO_IO15__LPUART3_RX	0x31e>; /* SMARC P141 - SER3_RX */
 	};
 
+	/* SMARC SER2 */
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO34__LPUART6_CTS_B	0x31e>, /* SMARC P139 - SER2_CTS# */
+			   <IMX95_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e>, /* SMARC P138 - SER2_RTS# */
+			   <IMX95_PAD_GPIO_IO05__LPUART6_RX	0x31e>, /* SMARC P137 - SER2_RX   */
+			   <IMX95_PAD_GPIO_IO04__LPUART6_TX	0x31e>; /* SMARC P136 - SER2_TX   */
+	};
+
 	/* On-module eMMC */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>, /* SD1_CLK    */

-- 
2.43.0


