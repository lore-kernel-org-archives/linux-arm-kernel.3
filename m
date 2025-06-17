Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367F3C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtW5JtQayEuGFuLB8bwS6fi5taZNSc9e/Z9Cc1Nt+Y0=; b=l8/KUlle4xpZYUf9YPbloy07Pg
	vu2/7Fb33koGrncPY1Akfk8ScTSN1h3cRgkmPEaa5xjzPg+Y+QqSOrE5wTDEdBlSb5MkrU/Jmdstr
	hPynJMDLaLFKcqpnPVzRY3N+I2iZkWv+Dp+gWbjsvCmvWuTqpuHTtxJF/XMpqE72Ru3044bMSoiom
	aH+o2OFWGFIDQ7/GJ9dRElKR/ppafKooDVHAHkFpJEbM+S+B8WJld2A/KyvdGuJgu/IDsz46zWK89
	Rh3aLhfLo3pzvI0EAf9pPEPh0InC2FQr2QGSObKYdKM7rM1dMb/Hi28TjpFcqI+i64BloVwyUa90Z
	6Qkk+3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYsB-00000007q2V-4BbW;
	Tue, 17 Jun 2025 16:09:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXgK-00000007eI5-01DT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:53:01 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ade5b8aab41so1235904066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171978; x=1750776778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtW5JtQayEuGFuLB8bwS6fi5taZNSc9e/Z9Cc1Nt+Y0=;
        b=jil2F5VTzQEOdSUrnUvncKB0iO+rfmhXWQWmCB1TL/do2qRhOb8TOylJbqJb9RijmC
         FmKREwyPCWcfNiGY2CxrgwtMhrnhWq1WrqwgcuYLrf1g45l4GI5PnIvQGs++bqsXf2DK
         uUM9iqDUmlZrvg8RwvZxvvWQetj1t1fB0gNJC5rVOaGVBN0uOqL/9xbQFxMx0KgtwXg6
         l9Vu9K/QcpUiW+AgQBFlHkQTfpIFidaxOliKAuNEAEEVfKQYB9jAv258V0J4GMmnhUHq
         ILEhWV/K1ZeIXmdDORnvM6pT0sKDaAXjiXXdTWSWukBiWqgEDKN9k9T5a3q3BO7ThbFw
         7/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171978; x=1750776778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtW5JtQayEuGFuLB8bwS6fi5taZNSc9e/Z9Cc1Nt+Y0=;
        b=uBOIvmdex5K+UecCK4kgZo55qpl2Kt219V7Y2Y9EL5jDq0dFmMh4aEqz1t6E8iCWmS
         jbhinKLYNr7whifEcCj2W4L3DAFnNg/JYOtMj+l64pYq8+yN50mUMyQ1ywcCv2bNGupf
         0KYNU9TUST4rPu2r2K7upDmKRFCqtlOSdFutqEDVUWtaSCJ2pbisG0Eb0X0MoD5/Vhy7
         c3acmw9cOcoUh4k7klop7fnqtNEy36IIda7P9ejPNzkl/Zzx+BK5Omjk2I4iUAT2QnFm
         1L2eYbS/lMhb40c+St77Ho0g+1QZ3/6waduCT1gAlPaAaEw7fjYFEkvchkE2R62DVLug
         mcjA==
X-Forwarded-Encrypted: i=1; AJvYcCUgGTroxcEOcxfbB45VI0kqXF4vdKY1hM6qQu/zlVZMjzaC3Zc6CIUJ6np8TnnoixjV2o/dmbBayLBmu6N4MNTG@lists.infradead.org
X-Gm-Message-State: AOJu0YzTb4ammYecJ+HttKZGxVoB9eRQHSL58KX8zbobsF8kak3XwfiU
	cZBLqSuLZvUeln1nuESRDS5rNujbSeI3c9CBg7qwuXl2wafPqOvRB0BI
X-Gm-Gg: ASbGncsb8FvU8+SoECKZ3aNgJGpXqpe7OFNSB65EILzXto4xXwsrW+yYmT77JFrmfYo
	V0v/GRLWnRzISZrQq7icZVcBdbHJ6tdM1vYCrUV/VwD7imqbH4iSoQxUXbw6AZRI1o9MtaahY4X
	fG/juQqETW8SaNh+b92VMWBHfpAmdPp4JyYYM8Gq1lV7JIQd1ieuiLEDQRyAgh0tB15LHeREceX
	iBpLTxqyTYnVxQsgqcKuSolqk8V6kyqLkjpX7tSSNP6ijiLTSTvbeenmSHJHcgfVPvAhaWllUhV
	1ot7x6oQDb0pcaAqOoMivW3pq9n6SfwoAGidXQX5ND+rjvQ8Q4DJnrpAX+TQ10mKsaWg9evZtJC
	rQ8BTlAMh6pGmD1isDXEUDwo=
X-Google-Smtp-Source: AGHT+IH4znlknzxjUuzAcuPGkxhqPfS4ORXrTA1d31lol12/rKTAlx/Bqtho85nLPCL5G4FiwkKZNA==
X-Received: by 2002:a17:906:f584:b0:ad5:3a7b:de91 with SMTP id a640c23a62f3a-adfad34ae98mr1370234266b.27.1750171978175;
        Tue, 17 Jun 2025 07:52:58 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:57 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: imx8qm-mek: support revd board's wm8962 codec
Date: Tue, 17 Jun 2025 10:52:20 -0400
Message-Id: <20250617145220.1131165-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
References: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_075300_044169_6A16B331 
X-CRM114-Status: GOOD (  12.01  )
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

The i.MX8QM MEK RevD board is a reworked version of the i.MX8QM MEK
board, which includes some sensor and component changes. One of these
components is the WM8962 codec, which is meant to replace the WM8960
codec present on i.MX8QM MEK. To avoid having to introduce a devicetree
overlay or another DTS, the WM8962 can be supported by using a virtual
I2C MUX since both of the codecs share the same I2C address.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 101 +++++++++++++++----
 1 file changed, 81 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 353f825a8ac5..e1023ca55929 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -131,6 +131,72 @@ lvds_backlight1: backlight-lvds1 {
 		default-brightness-level = <80>;
 	};
 
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		mux-gpios = <&lsio_gpio5 3 GPIO_ACTIVE_HIGH>; /* needs to be an unused GPIO */
+		i2c-parent = <&i2c1>;
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
+
+	};
+
 	mux-controller {
 		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
 		pinctrl-names = "default";
@@ -314,6 +380,21 @@ sound-wm8960 {
 				"Mic Jack", "MICB";
 	};
 
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		model = "wm8962-audio";
+		audio-cpu = <&sai1>;
+		audio-codec = <&wm8962>;
+		hp-det-gpios = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		audio-routing = "Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR",
+				"Ext Spk", "SPKOUTL",
+				"Ext Spk", "SPKOUTR",
+				"AMIC", "MICBIAS",
+				"IN1R", "AMIC",
+				"IN3R", "AMIC";
+	};
+
 	imx8qm-cm4-0 {
 		compatible = "fsl,imx8qm-cm4";
 		clocks = <&clk_dummy>;
@@ -511,26 +592,6 @@ &i2c1 {
 	scl-gpios = <&lsio_gpio0 14 GPIO_ACTIVE_HIGH>;
 	sda-gpios = <&lsio_gpio0 15 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	wm8960: audio-codec@1a {
-		compatible = "wlf,wm8960";
-		reg = <0x1a>;
-		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "mclk";
-		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
-		wlf,shared-lrclk;
-		wlf,hp-cfg = <2 2 3>;
-		wlf,gpio-cfg = <1 3>;
-		AVDD-supply = <&reg_audio_3v3>;
-		DBVDD-supply = <&reg_audio_1v8>;
-		DCVDD-supply = <&reg_audio_1v8>;
-		SPKVDD1-supply = <&reg_audio_5v>;
-		SPKVDD2-supply = <&reg_audio_5v>;
-	};
 };
 
 &i2c1_lvds0 {
-- 
2.34.1


