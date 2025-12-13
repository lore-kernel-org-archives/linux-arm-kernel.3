Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672B6D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 23:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=; b=t4nhV97CGwXPj2ctIAWGtVB+aN
	XYCfNBmJtCIfiF7mFApUUVICFPb+sJ2VRMsCaAWIecnZJC3RMqGvytYF1wAMOzMxLgTIOmOgTSRBC
	+mwGVFTxPuMvUWQv7aD+4WtnX1HnTevv8RgxXHOGd4yRCxEowXJYmAgE1EdSaqY5Vq6nx/S1+O5mC
	1G1qLv976fUDntS4kd8plV61kkDmDuwibyE/jDcS8aI0O0RDrWTGYv5DS/Fe9cH4GJ86l3a92VQvT
	ga7q+HL3t4o9q6PGM/aE9Eig034CBNk6uj6XssNitNB8PY+YEepbYeyoD7fYWbiYmN3JiHfXVyVu5
	k6gyhImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk5-00000001yoN-2YJk;
	Sat, 13 Dec 2025 23:09:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk1-00000001ykr-3DI7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 23:09:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso28648245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 15:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667372; x=1766272172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=kf+UC+gq7ihsGi+BiJaPy6xzzkYtX/QiAVUnYfPMV42mUPSlrMQ4LeR6Nw90VuUwG3
         o4sLbeur6S7yTPC70Db0D8rcZXSRiqh8qM4LqV7XGh8HbG8rsN3ytGm0UuENpXV8sWxC
         2F3Dqgek4XbTYYPVC09HtCb1nTiFW0GDLMYG2lgs4SDjqxLF8jAwrnaSA0sT1RMFtL9Y
         WZ812auYmSZM/79bb5lPlf/zslBQrrpCjnXaiRlWYpToU+2pqaqoZT/oTzS0DGmpiENf
         zK52tZERB6WOrm0U1qEFxFaSvxokwAj3w41n5JVKJuVMFaL6E3OIdTqm3jW8jAF/YaYF
         4Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667372; x=1766272172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=aXfrSOnvuGI052mznM7DMvFFQox5axYZdkUnCuV5Bci7Rxsro+dYsvRRFqdESejGZF
         py4PqL+TNm8Hc1/P6F7tgtwrM3mfsbcVJQB6x78jSm0eaj/Cet0UX8C1ZhO3FZNyS5uE
         FBV8W4R8vsDi+M7AcuZFBlkWp6AWAgn1wEGevvTR18VvmPxGWrFozR6ePyAB5NnVvqH8
         kdNZy2EDtCFfOJAs1ZSuhnsnh7CncN1yYtZMRS4BlZfC+JdOsPPGD/yqsawcIQtiX4iI
         ovXNID0cfk4qLvRnrasLzh5h1Gi42DD+yFOq4cptAIzAoyaojnDaekEyItMs8u+7vwwi
         aGEg==
X-Forwarded-Encrypted: i=1; AJvYcCWAI53iGzY28N8yrrWSOwOOzh+zydsfy2DStyObULI468lsk54v52u/sOLEf0zeC4AhPBl8zUgKPSAO1qxFzow/@lists.infradead.org
X-Gm-Message-State: AOJu0YxXEZRAo84GbLAEx+1lglxcDl6vMEohZBERASbQ/97CwVSqlniv
	LBdcFEK6bH6SYlHH/CkLNjtmd/D1BtGClasvRzRR2XZ9vMurNAYNOE6r
X-Gm-Gg: AY/fxX53MvE/S6JXPcCe2Gsd+yPkdGhE3F4GWHHYI1jeaozovKxdm+Yq8bvR+qyZs5H
	uZm38JXbbsKmftIDwYT132RDhfIGYDRvm5DbiU/fNksKkd9MyAlBJTHHlry5Q1nPFtLHQAOdnIw
	7ykw8uohNrAtvdr1rI/XIz+IOuKoSeu5FEH6yBAj9PEy6i+q5MYv/wsaTWZ3SJh4oCELvbugcni
	T4WZ5W0Zh7VI3vcJ68zBYo2f5uatGgSLonx04CPx+NcFWv3cnUHPfPBiMighnhWd/b37Q5Orngv
	LBruvR8U4fP8mFRah3fFkky3ISPDdFwEfUgR9jHSij50oqj1eo5fp/ir/6Lz5BbiiiNmSyALPAu
	K42HUVb2QbdAdCX3S8AZCcVU5HdT3L1N2MkxLIO5XfBaTukpRTuiA64Y4t3SGnNOF7YofVMWbeX
	osrlpkQWjUHQhAyMu9smVb2h1rg57x8lRbyvdLu8K+mCmDqPixr39Ql9VwJD45JUPs40xYhGZBe
	kcvU2pJedExnyo=
X-Google-Smtp-Source: AGHT+IEuZVWIoOyBxLuO48JvlC/oup4uLYj7VhSXl/tQFEXAA4+Lht97mT0YBRv8y//K617sSM8eUQ==
X-Received: by 2002:a05:600c:8b62:b0:477:abea:901c with SMTP id 5b1f17b1804b1-47a953da53fmr30130495e9.11.1765667371709;
        Sat, 13 Dec 2025 15:09:31 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:31 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/6] arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
Date: Sun, 14 Dec 2025 00:09:03 +0100
Message-ID: <20251213230909.16810-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213230909.16810-1-stefano.r@variscite.com>
References: <20251213230909.16810-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_150933_825925_721E8E8F 
X-CRM114-Status: GOOD (  12.66  )
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

The VAR-SOM-MX8MP module does not provide an onboard debug console.
UART2 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART2 node from the SOM device tree to the
imx8mp-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 361e6122bdc3..291f65e36865 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -9,6 +9,10 @@ / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
 
+	chosen {
+		stdout-path = &uart2;
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -68,6 +72,13 @@ usb3-sata-sel-hog {
 	};
 };
 
+/* Console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -95,6 +106,13 @@ MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 158a78ec9656..5bba91dcef17 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -15,10 +15,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8M Plus module";
 
-	chosen {
-		stdout-path = &uart2;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -206,13 +202,6 @@ ldo5: LDO5 {
 	};
 };
 
-/* Console */
-&uart2 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_uart2>;
-        status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -267,13 +256,6 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
-	pinctrl_uart2: uart2grp {
-	        fsl,pins = <
-		        MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-- 
2.47.3


