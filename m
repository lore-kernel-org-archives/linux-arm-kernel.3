Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CE4CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=; b=Zh1KCzunq9P9gNDsKG8wFncBIh
	z8tMGS/6HSB5QT1gE5XoPjjsdpUsZcsGYpsxUTV8WUbgu3hl2dM1BUZ1QEiSvPPWfXLP1RvH5IJme
	uzjrhc4/slaGjyUiPsNQEEbYVRTxq77tRCC/T68fqNAnbnzEFvQfKGNRo+IJEJI0/Y57uueWgMkW0
	fnh174qL1xDy3V/fN/g/A0DogTzDVvXsRZa2UU3HRXMRX8VJOPCjZTTBoFAbM3nZbv22u9LWkkKx7
	CGN4+vNdEuAcmksDvJXSlLsyMI7tdnvfkkTyTt2kwiZWO5IAEjN2KL30ermWT3SMMBPGjBSehfXUu
	p4kiaLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWqW-00000008caW-4BMS;
	Mon, 11 Aug 2025 18:02:09 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUHr-00000008ARM-3Pnf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:12 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61592ff5ebbso6903673a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925490; x=1755530290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=R1YRCg3WRggqlyG1ZYJJ717cLIk8PgtwLb34QIjFvU8XV5wUbrWT8qvL8EkKASREu5
         4IBdVXKcCRKaREdcLjKb5RHEM2oy+pd5LZXYL9Oaa1AtaIMygHp3BfIEhss+vdqeOY4B
         qM4+/qb+Aa08jv9oWtO6IC18jRxzgJyZqs7SfC3IVa6Qb/HvcRacVGPipAY2Ne1V7nXE
         en7Mmz3qKVcMLA/knl5WV+ZSJRuQdZABVMrrXzsUyJD7fEyqt9wIXuM5A8cnOiqvJWjy
         k+4Hvo+F2OoKr05SYLM47EzrFyNr2PGCZ6J6Rsk2KLIuOL0zxNT4lH41fDU2T4cuA/Cu
         Xsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925490; x=1755530290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=Z77cqrIvR/xsWsjbz2cA/HCCDRRja9iVIxmRfvQT2J0B2iJO0qAJOeoUnHAuR27J43
         ZHNtq8etw8Y13ydupxabtsMqgMHc4gO1dZXHzt4/haDWmixiu+05AYWiDXnzi+JcU/le
         ekCl9kFakEgPZb5Ku8X1TiTEJGOtWKYhUtRH0nebsi48PobpRO9McgFlJIrp72cFnL8j
         EANWUDgiNm2yjIxlGfWamr2P0AncnElIBWHmSBukA79bHLS/whURIkj61bb0pZTBcg16
         DFY9MPWnlh6B3yNOiARESwmx/8QGJLB15oju7C6ZIsx44XXQUfLrYCSjGJMr6RYOG/sx
         Ij5g==
X-Forwarded-Encrypted: i=1; AJvYcCX8HgpYW2L23lIzYoKq0jXG35u+d6Tb75kBhBY0Bm+V4tCYRgbJItGCAs/BtuoHPd5MfS0MYjo7aDGyQOUNctWr@lists.infradead.org
X-Gm-Message-State: AOJu0YxK3Al4jItav7/zmANc7Zw+Y6L6QbC/Xkl9mcAB4NYmE7+IoDNg
	h/yFpG8CRNAPWiPwmBrKOCyPwWex2bscTqwcMLmX5lQ4g+HqZov38fdyX7Jr1nfoBtg=
X-Gm-Gg: ASbGncsgDV6xnn5pJOR8f13JPgoNDZHm82N/A0a59/vLCasqAlMP0gFFnOeJsADnF1i
	WUI6iU3c7NVzI0xS1i6X7KHhS/lF+8zxAQZhsZqKG5um8oshxAkZHbjwIU+eUQn00/A6BrvRCLP
	7CRT8qabW7Ze/MWqsIValb0qMo5LS39WWQlP3uaf9XWN7Osy/dYxGAvg1AD7TTgb1rWGS0meOw9
	Nsr4sVFdtv4nJ71ywyR8GwD9m52hRb/cIHAI04LlZK2g/rPiOQaVcKo0sKaGZWLtWnseYWzwlL0
	ufwHUd3zevjlnoUr3HN4sBk1tbUWAqxbCv9+pxni5JjvLyzXEnNdPpZTqxtZPIsN39yytEF0X1U
	gzO/LDIMC3XpDv4V6s/W+fQ2KegRh1+D20NTBc50aA06TTwdOoWkk1JJbaLF5u+FjreooOdXP9O
	1W
X-Google-Smtp-Source: AGHT+IGLYy3TQkH/3UhAMhNCt2Tp94AsM9dBQJ1xNBWsLvENOx4hXDkAR8wy7Smqj1yqAlol91Adqw==
X-Received: by 2002:a17:907:9705:b0:ad8:9c97:c2e5 with SMTP id a640c23a62f3a-af9c606d956mr1287835366b.0.1754925490087;
        Mon, 11 Aug 2025 08:18:10 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c039sm2046620266b.110.2025.08.11.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:09 -0700 (PDT)
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
Subject: [PATCH 5/6] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Mon, 11 Aug 2025 17:19:49 +0200
Message-ID: <79b48fbeb009460fd2c03b910a0412b8facab9a8.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081811_874323_C9826184 
X-CRM114-Status: GOOD (  10.70  )
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


