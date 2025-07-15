Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF708C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=618tBsP8+IuJgTKE3mRpRskhn0ekdTiWo3PqXAUnzZg=; b=dofwSdyDm5fpbHopX075bCeizi
	KspK7T5mM654cJ/eIzpeYsSlW4BQScf1B84nGA9NwfSY1UzcaDCJmXH3s0NEuOO47rUubBfiI+io8
	vVrqI8tNPUtWItIXqFg1tIW7as858zotKYCb7/jkYg65OCziIpG5xoTT3n3x29J8gmuCuGK1LZETi
	CiUr/jhTtoY6t8WX01fpDPXSLhPHg1EZJfSp4KcibH673CrQ6kPGHjvrde8VmRtSW+vzDTWrD62wO
	MXf06UMH9itKNS9hhc1d9Ub15JJXBKIKCpKkL6O84y6DjpHBu9hhc/2JTtCdZ8t39H8uo3qkTIsQx
	DM0aihgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublCM-000000062pS-0mn7;
	Tue, 15 Jul 2025 19:20:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkPq-00000005uA3-2UBT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 18:30:11 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0e0271d82so1038232466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604209; x=1753209009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=618tBsP8+IuJgTKE3mRpRskhn0ekdTiWo3PqXAUnzZg=;
        b=YBP4qDRjirB40uKfjE4DFsCpsmR9j5Vi01+fTmAbdY4L+k7sZsPAIrYiqFc9HTM+cm
         19uQRliJ0dCv2KBASIbCXq9iaiwds0nYquuz6kvsTKoeqTO4ynbukz5Kus4Llwyc/Tef
         RsUqgtjqi5D6aplTipt1M/aqM9zL3XYdc0WR+/UGRiqeXyrbLl7Q25VsnDueA/bymu+B
         +oKRZ6er/lZtnBis/3DbWsCve/3ZXCHm1beEWsEfxhGUks372ab676aTUW3A7aqdqQ1o
         u4Mgzl9pi4NsnOw6cNBkLXcH2fYMw5/E+OxcocPYYuzbYQ3ue1OCndK64nY55jTpj06Q
         rOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604209; x=1753209009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=618tBsP8+IuJgTKE3mRpRskhn0ekdTiWo3PqXAUnzZg=;
        b=p5p87AtZCPFHcHRV8jkXfo5AFuSxMt5vreTbPbgCo+3xUnm2MQG2D8Mi5lmQ0ocSG6
         U9c++fi/4mR+ex+tYZB71SalYTE7pFeDBtWjQu8ByVhZtjM0SXdVbmQtmslOBbShJSF3
         /uQ/UPQmxvNxdEbeLVZl2XffsFvcidwBKzG2nTGXkjU3umqHfzmQkHsdpKAA8gh0oP6O
         +oHPjEj2Zq7yd+zi7xtqYB4MtITNbPTmVPssFxivioAK38WeyisR3JuNIjDqMj0aFxZy
         fPmNSeOzBnY+kv2dyG2ud90z1ECU/KqMlWtxpvTI5HTc8PA833SpttxXodLfikXfbCpU
         ZV3g==
X-Forwarded-Encrypted: i=1; AJvYcCVftoQGGjYv7qBAPy9FXz+ID+vlaWLfc1NiQSS3jO/7ByhAk53MGBm6BwaxDpXm24cwaLelJfCcHnfZ59Egnhb/@lists.infradead.org
X-Gm-Message-State: AOJu0YzPH83wr2xj3Vt29u3iIara4vjQgQa3cvJgRe84cZJxgHGiPGfJ
	JhFenxDFmWTC+Ner7xo81omgjKlD35ihnXnt0ny6AFEb3IufJ9xY6f6nWq9BSuJGgqw=
X-Gm-Gg: ASbGnct8XHKeZHYvvXTfUcd0K4ocpzwvHBIU+RaKtsRMVgOSGfF4akpWcEvfbuqMPhD
	eplLiiHkw85fAzEPrBPzaMKzgdHeZ4Ty3MI0jTWDLkzDVRO/r2wj5FuGlgzTnid7+vlAYeeaDQk
	5LtJNvwIxAZG3wmCjGsPAohxu+o3DT09gGjZtz3TWAZmJcYvJZ3eXJ366YTd8YxRHE2swVi1SCU
	RcqSev7jTL7pF+R5iH6vrohton5nCnxXH0jZ3QHtPgkoKBGU0SoLVMyVriNZ/5AWj4q2TQ05RRO
	jOxLDMvb1Xx6CNowJ0Hkju4eYqbcJqyts9FGFDmWtb3Tiln2cczI5d8h7QjiyK2qVa0OEMv7eTw
	02KG5YQzil5WKopgCdvcyTqrQ7IrepNgE02WKUNAQta4ae4/ODSeCr7btDcKEEAshfADr
X-Google-Smtp-Source: AGHT+IHRNkalwwVztrQaJho64YzctIwHuAGK/cCl6dKnZ8rFmjfc9HeuD+awU1Jzf7RXVNYqFjgJlg==
X-Received: by 2002:a17:907:8e8e:b0:ae0:da2d:1a53 with SMTP id a640c23a62f3a-ae9c9b23338mr48885466b.42.1752604208948;
        Tue, 15 Jul 2025 11:30:08 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82669b5sm1052376566b.77.2025.07.15.11.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:08 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 5/7] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Tue, 15 Jul 2025 20:31:42 +0200
Message-ID: <5eab612fa761a5c936918b64263f2455c4bc91bc.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_113010_643216_C2A5525F 
X-CRM114-Status: GOOD (  10.65  )
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

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add SDIO2 node. On RPi5 it is connected to WiFi chip.
Add related pin, gpio and regulator definitions and
add WiFi node. With this and firmware already provided by
distributions, at least on openSUSE Tumbleweed, this is
sufficient to make WiFi operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 52 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 15 ++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index f0883c903527..411b58c1dddf 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -66,6 +66,18 @@ sd_vcc_reg: sd-vcc-reg {
 		enable-active-high;
 		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
 	};
+
+	wl_on_reg: wl-on-reg {
+		compatible = "regulator-fixed";
+		regulator-name = "wl-on-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-0 = <&wl_on_default>;
+		pinctrl-names = "default";
+		gpio = <&gio 28 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <150000>;
+		enable-active-high;
+	};
 };
 
 &pinctrl {
@@ -79,6 +91,29 @@ pwr_button_default: pwr-button-default-state {
 		pins = "gpio20";
 		bias-pull-up;
 	};
+
+	sdio2_30_default: sdio2-30-default-state {
+		clk-pins {
+			function = "sd2";
+			pins = "gpio30";
+			bias-disable;
+		};
+		cmd-pins {
+			function = "sd2";
+			pins = "gpio31";
+			bias-pull-up;
+		};
+		dat-pins {
+			function = "sd2";
+			pins = "gpio32", "gpio33", "gpio34", "gpio35";
+			bias-pull-up;
+		};
+	};
+
+	wl_on_default: wl-on-default-state {
+		function = "gpio";
+		pins = "gpio28";
+	};
 };
 
 &pinctrl_aon {
@@ -109,6 +144,23 @@ &sdio1 {
 	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
 };
 
+&sdio2 {
+	pinctrl-0 = <&sdio2_30_default>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	vmmc-supply = <&wl_on_reg>;
+	sd-uhs-ddr50;
+	non-removable;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
 &soc {
 	firmware: firmware {
 		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f70ec8d3dc4d..871537366e96 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -285,6 +285,21 @@ gio_aon: gpio@7d517c00 {
 			 */
 		};
 
+		sdio2: mmc@1100000 {
+			compatible = "brcm,bcm2712-sdhci",
+				     "brcm,sdhci-brcmstb";
+			reg = <0x01100000  0x260>,
+			      <0x01100400  0x200>;
+			reg-names = "host", "cfg";
+			interrupts = <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_emmc2>;
+			clock-names = "sw_sdio";
+			sdhci-caps-mask = <0x0000C000 0x0>;
+			sdhci-caps = <0x0 0x0>;
+			mmc-ddr-3_3v;
+			status = "disabled";
+		};
+
 		gicv2: interrupt-controller@7fff9000 {
 			compatible = "arm,gic-400";
 			reg = <0x7fff9000 0x1000>,
-- 
2.35.3


