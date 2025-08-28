Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C91C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=; b=4yCzNu+pQI198TAeoK3jruEBjI
	4AJHIaFM32SdLg0Sgnar76eiDyJXyUTZnnDX0w4fEmcoan0n8atX+cNqQ2pU5GOsaU32lPZDNHPs/
	ygCkWVVUhGD7Bf/KNrGsyPFqcPR2gIUqPhCX0pZ0/MTo8MxUS5Iq6jsw6k/zIVtj8DvxrV3a5XEyA
	QeneUEt95S8aNH5/rIIcdoS1f+NeeV3wIOgtnh42nofa8nM6Bdr7itOKeTuTIL+9oHEExC857f+8h
	HcrMgvJeCNhKV8SGARwO01GPiJ5/QREQXSOtg1Rm/qw1Omz/UQ3EVNbkBDCk+wbQiA5dFkSwXh6ba
	ZcNyzPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOP-00000002TQo-3FgA;
	Thu, 28 Aug 2025 17:26:33 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcTT-00000001hLN-3afR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:15:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb7ae31caso163539566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386930; x=1756991730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=VmV78ibcvr5F9Lb7BjtI1ScYRzNDJ+HR0xA5Z6/gFYZRZ+S1WO6vyH2IVgZZqUpJ8J
         XMJkGdoq0WMAZKvwmzYeU5YGdxyO8cGxQQEogVPK9oqCfNrZYg3vrYyBKOpZkptwHkLH
         K09SU9h5KOZfySLJVdengSOU/5iMIFlzUGz4n6qCKZSyBRKXwEj8NrEIX4eU4CSTM4TU
         7KlZPaU/6Q8qAedanIptO2I+TUkRNA3LDtXfOxcDqUL+22e/urbAk4ntGcXtfj9XG1N5
         NiuYAJQFicz9WFzJm7q4EAl7WArSx/HfKS61K7UDLoRjx8dt5WHOQue3IOCeT8yTOdmv
         H5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386930; x=1756991730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=IWqPxW0L6VSjJnz7iwCSRFQgbtrpRJ5YeFilVFm/p54IZmCG4Oc7aWAaYrqUeXEJqJ
         kXrYwrSJJH/pva0C32zZ1aRtFEuGJzOtVAtK0XpHv7Wdg5W7dPD1FW5qZvytBwN8d7jf
         LP1DOANh+4YJnNxDXAixOHhtsG8RgvwkUaAEpVv4uvGF1hmnLlEcpiSK7y4jV3y/4xtg
         8qf6RCD+NnLktkm8Bx7wpBnSy/nBCEqsE6vGjFaQ31ADHqVU+6IguWUgWrrOb4CEFOqC
         momFxszsm9ZCoGca3IRt8KRG5sdv3J+D82AGt0WjP/fBMNiTKvEZjac9ZZQ+cWKSOOVp
         kcFw==
X-Forwarded-Encrypted: i=1; AJvYcCW/XejXe0jQHeflCsDMoOI8iVTI32/yQq0ofc1Y4SxgTPFmr87dcgUv/MBaH0N0csS+wUIqAFKKQ2Ez255LW4dm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3UFxLaoXjWaKNSmnuebVgJjSBUUjy695dOuQa1jH7oBda1IPp
	DFVo0Rj2Ln9QAPautW8pYmo5hG6Ur7gLY21nr4+xAStnU+EZ8xTOd0/GzFTI/Jqh5FY=
X-Gm-Gg: ASbGncuRS79F4O+V1d329mwb9DMCqo1xLjXyWAnhY/MWUbWeOgGVuKKTEMky4Vlp9jw
	qqlgmNZwvzXkyIdnjqlUeSr68rBWl4yw36EC3UbOlAFZiCFnJs9PXqMPSLXGtmYrYgmqO3vEdFB
	xFc2HpVuX/xG2OZALDffbunOgczvqTANboH2Ot0od5C0cicPBYY4sR/G1zcSD2rEmm/dQVVtx5a
	Tt7vDBTa4dR8T2CvCEIFApnxw1NKRFYfNGoWnfy2teInFurGiLdXLviRd8ouJg2m353QjyjWtmd
	8Ds8JP59SkJR1nHgE8exN4UYa6Sj17fC0uK73YpvYRUIily08hQd0MojMb7OC8MVWXfjbnjlEDd
	bSB3AMMdXpq22D3HQ2TctGZNpuUcbrMIwm2KF1LmwnzVLD8pA4LBxW/NNxr6/Kl5oLUK3gbY7zH
	2lFlFbZRa8ZBdEaU4PUqNpAHI+aoQ=
X-Google-Smtp-Source: AGHT+IFH1vLiPwLLOjWdncMu9CzzMSagWLiPnUFX55dhZYQCF06QAZ/tGnpnN+tm8vZ99g4CY7S5og==
X-Received: by 2002:a17:907:a47:b0:afe:ec74:2e2a with SMTP id a640c23a62f3a-afeec747f62mr156302566b.5.1756386930209;
        Thu, 28 Aug 2025 06:15:30 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe48fae316sm1222206166b.28.2025.08.28.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 4/5] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Thu, 28 Aug 2025 15:17:13 +0200
Message-ID: <4ff3a58e98d90a43deb2448b23754808afc7153b.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061531_898064_996470FB 
X-CRM114-Status: GOOD (  10.63  )
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


