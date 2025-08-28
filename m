Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A019C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDbzDzint4NdSMjZoYKjKWKdFOvKafCGzOB2IyJMsjI=; b=LnRJpl7A1tOVYD9I6qFwNe4b1u
	OfDfRmSAKxh+/pYofRkgX7nUeV64BdG4w+9BZWeQ/pEIjr4zxaRqPIkmXEhjOH9so/Wl+51WzdDNg
	kpBRoV19hBjMy4Be12wRtnM+set1EbThigxiPnP+DF3cjpi3rhVG6Oybv3uDIrwTykl3puq4p4+kT
	jP62ypdD+sIBTtVemaeU6dQugdn+gFRcOUf9H/Dv+Pv8O6S2H2gmzfIb1qYkPKRkjCiRiUIObi8N5
	mskA8tjSkTzJmzvGIg6BLFbhPtIxyU47IZ5vVgt3FSfyRl/mwtDfRcfR0Wkz50+1SuUjPMQUZWlQb
	w779MmWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWJ-00000002o9o-141O;
	Thu, 28 Aug 2025 18:38:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcTV-00000001hLk-1y2n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:15:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so1106058a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386932; x=1756991732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDbzDzint4NdSMjZoYKjKWKdFOvKafCGzOB2IyJMsjI=;
        b=C488WMOrDkAMkZCvi9L4fP7KxyWlptJl4JcsXMkjdkMWySz0hPNufk6tTRcNff9hEh
         33s99TmoHIAJdSudau/CU13cZz/wVt093gjHyamk1Ldu9ucFgGkfZTG4PT36w4hSmEo2
         S7JOtsXyHLdDB7SR5AIo5aZuzB0yvWpVUh87xpqehqXHnH4ee5cCVCnthQ9gKROrBpwN
         9jfG3T2YzBcTVZW5JY45Tr+qT0hWYY8YVa4xh/Wt5yLlSWHZcoJjofZRGWv02CaE5j9a
         D1k7u7ZZGxnVlp9OEXEON3ajFaDWlwwmu5DZaPsJoWR5Ef3nVHYchp1gHvctW3kTlCic
         4hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386932; x=1756991732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDbzDzint4NdSMjZoYKjKWKdFOvKafCGzOB2IyJMsjI=;
        b=ajaOvNTl09Ms20yzIGCvrldc1Ytz5FHoa86ODQuj8IIw05NWHeGM7h5srb6YC9Y9kc
         PBayLztAR3xfSIVVMbipPcWoFwW5DF6dDoWAZNn/vNV4baKZNIDoilnWLodR6VoVFox3
         KhoZmzp1ndu4PVqu9wgTQR4l052ueU/CxITtdxq+sLZoiU+P+36EXEl27SO+nBMVbqGB
         bdiCAh//CSl7ksFq3hMSfVhxn1W7f0t6fSKAN6rQGjkkLlxUyFJ/Zekdl/02skqKwY3J
         T3SlzZZOoDIahL7lTkDQr8HaSMiKYtN71oahgreBx6pEZr3Jy9JcvtaA3xPnEo3L+Bz0
         sh+w==
X-Forwarded-Encrypted: i=1; AJvYcCV2IH4tYO2NL3RzI+A0X2b2gJ8JV9+rFwV/mJzPBwxIfbKAdQXNQXbNJFax59oNPnmxRvY+izVNwwcSqvOtS94q@lists.infradead.org
X-Gm-Message-State: AOJu0YyTkd0gDm3DuNf0qm+eQjx8jIpxR8qPBid8weNdA1l3ywavclm/
	/HGBWoOClhCprXMEGcuppIdRxRyjOsoSQJF6YNLMP0F/QE899HS6MmkNBSn+Df7kzuY=
X-Gm-Gg: ASbGncuWmbYK2RDTxGkk7hIJaKbG885qR8/yNiY1nJc/X+1KpRrzg0QvYC+D1nHQQwV
	0yMKV84/wyg4OnOinlUjLZuEMkd2ylLjmwjxx3353QuTpgBBQp/K9NbNFveIdJbarIgdeLkkCFd
	uPMurU+ZI4tNS/pZg+ADxy5yamMjYW8lmhchud433epiPHnN4h/P4Q0YEJO5a7yHUmpieERTT1u
	0/yoTwD1fFvctiNy+7y/V4ViqA2b09txSPczJpc6l6VHP8G0xmo8OFyVRVJddRQo/5ZhZWHhsSq
	hbc2ejpd9MI+Yno83Ym6rWwq3MibKDIFIXMA/gn9tuhFKpQWN8a6gWDlSXAYKs5dnymo/Ehljnk
	EVAgduGxSBAHATB9U56e3rIl6PjtOxAeepMNVtqbVqrP3NX94PgZzIeAB0qPSxL6iq9PO2+UU9e
	7U90ukESDM8Z7Xi1nk
X-Google-Smtp-Source: AGHT+IH9+QbGR9aSDPrFBVItl1A1m4Ivh6TYBQXMoc7xdFCVadOMpEbe4v00/Pyx674AUhPZjWsNLA==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id 4fb4d7f45d1cf-61c1b453182mr21153103a12.6.1756386931753;
        Thu, 28 Aug 2025 06:15:31 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cd8ce1cc9sm1302435a12.42.2025.08.28.06.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:31 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Thu, 28 Aug 2025 15:17:14 +0200
Message-ID: <35c0da6a741019efefc3c8e405e210a3a8156830.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061533_511950_A71EE2B5 
X-CRM114-Status: GOOD (  12.05  )
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

On RPi5 device Bluetooth chips is connected to UARTA
port. Add Bluetooth chips and related pin definitions.

With this and firmware already provided by distributions,
at least on openSUSE Tumbleweed, this is sufficient to make
Bluetooth operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 42 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 18 ++++++++
 2 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 411b58c1dddf..04738bf281eb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -81,6 +81,11 @@ wl_on_reg: wl-on-reg {
 };
 
 &pinctrl {
+	bt_shutdown_default: bt-shutdown-default-state {
+		function = "gpio";
+		pins = "gpio29";
+	};
+
 	emmc_sd_default: emmc-sd-default-state {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
@@ -110,6 +115,29 @@ dat-pins {
 		};
 	};
 
+	uarta_24_default: uarta-24-default-state {
+		rts-pins {
+			function = "uart0";
+			pins = "gpio24";
+			bias-disable;
+		};
+		cts-pins {
+			function = "uart0";
+			pins = "gpio25";
+			bias-pull-up;
+		};
+		txd-pins {
+			function = "uart0";
+			pins = "gpio26";
+			bias-disable;
+		};
+		rxd-pins {
+			function = "uart0";
+			pins = "gpio27";
+			bias-pull-up;
+		};
+	};
+
 	wl_on_default: wl-on-default-state {
 		function = "gpio";
 		pins = "gpio28";
@@ -188,6 +216,20 @@ power: power {
 	};
 };
 
+/* uarta communicates with the BT module */
+&uarta {
+	uart-has-rtscts;
+	pinctrl-0 = <&uarta_24_default &bt_shutdown_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gio 29 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 871537366e96..8ff254c35b0c 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_sw_baud: clk-sw-baud {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <96000000>;
+			clock-output-names = "sw-baud";
+		};
 	};
 
 	cpus: cpus {
@@ -260,6 +267,17 @@ gio: gpio@7d508500 {
 			brcm,gpio-bank-widths = <32 22>;
 		};
 
+		uarta: serial@7d50c000 {
+			compatible = "brcm,bcm7271-uart";
+			reg = <0x7d50c000 0x20>;
+			reg-names = "uart";
+			clocks = <&clk_sw_baud>;
+			clock-names = "sw_baud";
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart";
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


