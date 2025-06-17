Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CD3C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/y6UpSCNA62dZIucPryUmUTc08c/RNFpCO7PPFXPF4=; b=FXrs7W2RC+oJJeFG+ZbqG7H16w
	kIWTA5i9Fwxa6ys2xoyvZtymte6qG7NcCoRWPmkgQr/VrwpLa54byD9qKv/OaMk3arPWuIDWRmlFx
	I3+Xvc3ZTYoKMVfchXFWKXSaETfHoCYoCF3xVBrMStJiBZ1XiEMMgZskuyOrovQkuuaRo3EF0hK3l
	Fk4/De79+trVLLT9fDt+snyt3MpYEE9ED3rmMaYKPwJegCilX2dHMoj6/VBeC7e52qZTHt4m+M0AP
	pMKVXcLIUdMLwFSmE+KcRqCiGbWyhOkjPksNalmNzSqDXKycHVYUk7BGtCykRKctb/GbaSswaGsSR
	Wb1uo1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYpw-00000007piX-18ng;
	Tue, 17 Jun 2025 16:07:00 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXgI-00000007eHR-0UNX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:52:59 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso10176536a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171976; x=1750776776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/y6UpSCNA62dZIucPryUmUTc08c/RNFpCO7PPFXPF4=;
        b=UPOAZvo64ZdYtfj/q1bNYxlXhn15qqvCfzWbekqJUTeAaGOQXUpYjeBHId6h5XqmbP
         K3p3osdybu4TWuG2KRieBtCMsxd9aNOW74oC3g06+GNA50FYx3QGoxHaIO1t+WZyODGE
         dl3s7Gi+DqQjOrE8z3yxY8rlrViDMkv53zwWZL1ij12TTMexaTVvw2ag9PNVTSrpFktN
         Piun61Z70/LzOvZwVVLhWvJrpr1DKq7kgRoiT+a9wu4Xw3WpgD+UwRj8sppv+71f5DF+
         vQV5XqdGa9z+rS8bumeJZdqMMCihG6Te70K5x34f1UA/1fEXGXetWN6In1Gd0arjQnoy
         aMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171976; x=1750776776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/y6UpSCNA62dZIucPryUmUTc08c/RNFpCO7PPFXPF4=;
        b=Qk6aRkNAsuVAZ+jZfZki46nF4dtYJpL/wiUG1O+7any98k+Yy1BZ6sqUhDPLEuraNM
         t+/NggqJlMg6VIaGbW2J+Fo/0AmzR9bG2uvdlwkiOEf/uWd9/BFrj9Yf8NqqOxevZS7C
         v7jsHaoo/CDzaXpcLHjRddQNXpaO3XHPQcumUHHOTZs+soCN6DhqkqISHjGhQA5an1XB
         aEW/vdvUqaIzI/QcVwH5ZDjIKfG8+B/aqczv5wjo7fWhiGg4TCjuCVDYgpsAINnmCPJ5
         xEMb/IFTvE8T9Te61pLD9aYFJMItLbsiYyfIgmZV4yVBitNN6HFdAM3qWe5vtdJpoPWQ
         150g==
X-Forwarded-Encrypted: i=1; AJvYcCWxT2IS9sBgqltwf5Mw00suZplPlUH4P04dpcdIvuYyTY++clwMMAd8adYz/aR18jiwdRpTRaJaU51sLpucZpX9@lists.infradead.org
X-Gm-Message-State: AOJu0YzLBXMZ8y4IzXF56WcOYEG/miR1Jx48G44q/czUNo4nukhMYCsG
	tWaE1wRqOc/+vkb2b9RUiWopCsMKV9x2IDCo/vomGsT2XkMRGV7Wo1j/
X-Gm-Gg: ASbGncupgH/Xm6SbLbGy6iSPN4QDYcg9Vo0QHUUFsmy+AVrp2S+j69SHGPvwZ1uAspz
	FgISIHQTASjEoQ93QRZ++a69b+jI0sXps0NCq0xWxD6giaGWAk+bcO74K2n7bzSDzwNMABkqTAf
	w/F5rKjBUYDDOJnAboqRnJKxIKZvm3P7gTFbeg61kyBXSVanJAmgObJHjZ5LxjJas2iVazmpDSo
	F3ZEnPQc9IE1nB9KEBv95ISpS9EiVc3qfef7hr8YQGeHzT6+SHYGvNmRY2j4yLmYmWT1qbakSTd
	JnA4TR5DYRBGdxucKgOhi7Uf61egfzdc3ylxEmzA7Y4bL1O/H+go7FsZFXP8jqMmkYV6o1gwkmx
	bvV3gPweKwkyaw8Z0o5a4E/A=
X-Google-Smtp-Source: AGHT+IEZSDzyRtxrQnGm2AhPyrRTVzxmewbBOlwTyNq6Rp9877ZwBnTJ1HhbQpt/6K73DqX77rkvHQ==
X-Received: by 2002:a17:907:96a4:b0:ade:3dc4:e67f with SMTP id a640c23a62f3a-adfad29b8b8mr1173387366b.9.1750171976516;
        Tue, 17 Jun 2025 07:52:56 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:56 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8qxp-mek: support wcpu board's wm8962 codec
Date: Tue, 17 Jun 2025 10:52:19 -0400
Message-Id: <20250617145220.1131165-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
References: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_075258_156413_18CF71BB 
X-CRM114-Status: GOOD (  12.15  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The i.MX8QXP WCPU MEK board is a reworked version of the i.MX8QXP MEK
board, which includes some sensor and component changes. One of these
components is the WM8962 codec, which is meant to replace the WM8960
codec present on i.MX8QXP MEK. To avoid having to introduce a devicetree
overlay or another DTS, the WM8962 can be supported by using a virtual
I2C MUX since both of the codecs share the same I2C address.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 103 ++++++++++++++----
 1 file changed, 80 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index c93d123670bd..38ebf06f2c40 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -64,6 +64,71 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		mux-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_HIGH>; /* needs to be an unused GPIO */
+		i2c-parent = <&cm40_i2c>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wm8960: audio-codec@1a {
+				compatible = "wlf,wm8960";
+				reg = <0x1a>;
+				clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				clock-names = "mclk";
+				assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+						  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clock-rates = <786432000>,
+						       <49152000>,
+						       <12288000>,
+						       <12288000>;
+				wlf,shared-lrclk;
+				wlf,hp-cfg = <2 2 3>;
+				wlf,gpio-cfg = <1 3>;
+				AVDD-supply = <&reg_audio_3v3>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
+			};
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wm8962: wm8962@1a {
+				compatible = "wlf,wm8962";
+				reg = <0x1a>;
+				clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+						  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clock-rates = <786432000>,
+						       <49152000>,
+						       <12288000>,
+						       <12288000>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				AVDD-supply = <&reg_audio_1v8>;
+				CPVDD-supply = <&reg_audio_1v8>;
+				MICVDD-supply = <&reg_audio_3v3>;
+				PLLVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
+			};
+		};
+	};
+
 	reg_pcieb: regulator-pcie {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -248,6 +313,21 @@ sound-wm8960 {
 				"LINPUT1", "Mic Jack",
 				"Mic Jack", "MICB";
 	};
+
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		model = "wm8962-audio";
+		audio-cpu = <&sai1>;
+		audio-codec = <&wm8962>;
+		hp-det-gpios = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
+		audio-routing = "Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR",
+				"Ext Spk", "SPKOUTL",
+				"Ext Spk", "SPKOUTR",
+				"AMIC", "MICBIAS",
+				"IN3R", "AMIC",
+				"IN1R", "AMIC";
+	};
 };
 
 &amix {
@@ -427,29 +507,6 @@ &cm40_i2c {
 	sda-gpios = <&lsio_gpio1 9 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	wm8960: audio-codec@1a {
-		compatible = "wlf,wm8960";
-		reg = <0x1a>;
-		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "mclk";
-		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		assigned-clock-rates = <786432000>,
-				       <49152000>,
-				       <12288000>,
-				       <12288000>;
-		wlf,shared-lrclk;
-		wlf,hp-cfg = <2 2 3>;
-		wlf,gpio-cfg = <1 3>;
-		AVDD-supply = <&reg_audio_3v3>;
-		DBVDD-supply = <&reg_audio_1v8>;
-		DCVDD-supply = <&reg_audio_1v8>;
-		SPKVDD1-supply = <&reg_audio_5v>;
-		SPKVDD2-supply = <&reg_audio_5v>;
-	};
-
 	pca6416: gpio@20 {
 		compatible = "ti,tca6416";
 		reg = <0x20>;
-- 
2.34.1


