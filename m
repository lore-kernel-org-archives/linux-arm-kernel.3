Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5BAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+h9xdmVtN8apGvD2fwppBr/rzlO/iwPyapASKqAoIo=; b=AtC+tEvt6/cYl31qki0ERmvNxg
	oMW8Y10G7YLc7QqzORk9UDGNjc+k4UtscM+umk+u06UIUkJaGBzlePQbdrfBZbZ90dhqGHeP6oBTE
	tAt/0Iatx+LufdywoE1yQaGLLDeDh7sINiIVzG6bFjzkyWGDhailpJaiZOmWHbtAQxAEMkFYrjnMA
	IIGMlJ1FLxs7s3cjYXC7JbUWnxBupL0+ACX3iMZWuveD5URBCqEASQRZGtvNTbA9v1C13OubtKcBa
	v0vu3+ycTUjU6dP8/lWur+pIzq+WZLkAbBakqypT+rHYgsfvxdbznoTG21P+k5FrjwJOGsW+XAUpV
	tAmfPxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublCN-000000062ri-3Qmq;
	Tue, 15 Jul 2025 19:20:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkPr-00000005uAU-283w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 18:30:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso9416466a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604210; x=1753209010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+h9xdmVtN8apGvD2fwppBr/rzlO/iwPyapASKqAoIo=;
        b=CCfnvsgdg+3tHZZw5V+Qc7CtBD/LpfxOvyw8IxfONrGmpIk8QyFa7SGuJXkDVghv2r
         GkxbvfkIJ6KDDPSaeEOQZXzoWUBLqxmadIbm0cFOUVabgObHL+69NDB+A3pc3/Xo8unj
         Z/YVvoxcoVYl2Awvk/b4YHKOsd5HDLdIVcZEZdSA+qk97bgw+DJK6FuvSJr9l1AuFF15
         V0grovgmfEg00WQ9833HKEtcpHyUng1v/ubQV/vzuPAc8+Lr2K9p1GTexiQRpUv+ETZw
         o5lar9q03wuKVmn1jbChDWmUYQIWIE4f0zFwJXvUTGvmTyJnXhcYwPOS14OtbdyfvYOc
         dfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604210; x=1753209010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+h9xdmVtN8apGvD2fwppBr/rzlO/iwPyapASKqAoIo=;
        b=sO8sMNKofJRp2+bZnLz37Nusq8as6xXJDFCaU74qt3zBHs9H6eph7LW1i7L9j82PiT
         a5LGWDANITywnb4lTWpoqjY7CF6qpRjNaLJyqtTDZpdu6X4J8kVnCbhNd5tWUSA5h4i9
         Ur4KQ2C8P7OXp5sMDLzmpzSnmzK+arx+2F2kCCDYa+XjTizOFrQ4coHP4qAvOZlm/cTf
         zXhF1WhNpYTDH2EFzIDCUYGW+kXL495ISlIY14QzwV7Yh5q/0iA7RDMvWUIFqeyeoi4q
         9+YP08TJ1P7MLfl2SJHQSGkTGF9yZMYY6I0wIcFIDw3Nak6es7CrDmj5JBh9K1j9P4p0
         rM4w==
X-Forwarded-Encrypted: i=1; AJvYcCWVCbLfzb9J7eun1Fmcd8dwklv+iad463fRBU6N9Cxvp4GDPnJG2+batzcBBeHsGrhG1wePQe256yKX6HwYnrHl@lists.infradead.org
X-Gm-Message-State: AOJu0YxGW5aXHcbFQL5PRN4Hhr/dpoH1iAlE923jtE+GqoEEONK2QlgO
	G5nyiVc9J4gB9/vrV1omuDP78abG1dvBwKRky03tMnkKafBfoPwKv1ieI2UT5yw6vIo=
X-Gm-Gg: ASbGnctGKd1xT5LanZkbclMudrO9HVMO2fYKoz5Z7QLDlEYOcmRy82Ag1QV7N4jefen
	0Ob29KB0hLPnO82b0mi7DmCAf8O/hvGNT7EsZPwWtuK0+0i1gmthMqf/r8DkuYwCl8BeedrBK7Z
	swwK7tvoF+PMF5B8TFExKW5ldyMBnC6YieKA6N6QmLUp9thM8iNJSYQzVdoGnGtBQaMPWWFxxh6
	GvISi3MN3rjyBUCF3YPmzKVh9YrOoymvowKW7Aq/IgiRsS3TmJdO9ge9MGBobO0yrQuWl4xCFAD
	FoLqSrAcdZi+2WCQvhaapNWVZSLxEhYt/vnxbXs5FUP/tdcg9j3K6vQav3+/K4VKL8fqDhikoNe
	0gcW0oi99EKzXsffROvy8ckgP7KEg44IRUIj+keAAEEK6vQFP9dfOnTaJo5bchIiUNjaY
X-Google-Smtp-Source: AGHT+IFCdfj/N/QSmKoz1idrwHiCdXZBpEWZQgqG6diApksw+uigpgY7MjvOB4GYk5GKnJVs8sBmFw==
X-Received: by 2002:a05:6402:2710:b0:608:6734:7744 with SMTP id 4fb4d7f45d1cf-61281ea3216mr374571a12.7.1752604209875;
        Tue, 15 Jul 2025 11:30:09 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61253b999b7sm2257990a12.2.2025.07.15.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:09 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Tue, 15 Jul 2025 20:31:43 +0200
Message-ID: <afd4b7c31aa11471e8f79f5fa6edcd2c93dbc8e5.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_113011_547786_59652DD8 
X-CRM114-Status: GOOD (  11.69  )
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
This patch is based on linux-next/master

 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 43 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 411b58c1dddf..f869554fd8e9 100644
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
@@ -188,6 +216,21 @@ power: power {
 	};
 };
 
+/* uarta communicates with the BT module */
+&uarta {
+	uart-has-rtscts;
+	auto-flow-control;
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
index 871537366e96..43cc4ee2a363 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -260,6 +260,17 @@ gio: gpio@7d508500 {
 			brcm,gpio-bank-widths = <32 22>;
 		};
 
+		uarta: serial@7d50c000 {
+			compatible = "brcm,bcm7271-uart";
+			reg = <0x7d50c000 0x20>;
+			reg-names = "uart";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <96000000>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


