Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD08CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=; b=si4bEWcOInbeGoQO+adz+liuXq
	QphiOyLjNYEsWsto8PASk0nXSp+8sGMukGPxM0B0i/cUhEdZhDWWFtzyv8Tdsvm1b4cGp10sLjgmC
	9wV/70rXNBOpAajIpZkWgXrD2ssGNI/55Jhb5a71M58jjWmeXqS075uIXquORFn5o7r3fj9K8Nwon
	9GzIyOb80I0nfn0VObccAb/1ZUGcRGwU7TAp8iphaJwJCqalBPXmdqTCuAoiANGZFowOOVludJ+eW
	QhLPmmqqfDL7nia7KsGbyRsdvvyk3cB890uW/H6sn9qNzBCFo3ovIGN3sernLL8wP942BXcLTYSiM
	JThv0LWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvQ-00000008CFu-0W3w;
	Wed, 01 Oct 2025 14:35:24 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvN-00000008CCY-3av5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:35:23 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so10268086a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329320; x=1759934120; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=;
        b=yhRcl3i+LiIjZhwmXuh5AIzklLv4mKRZlc0wircW/tDsnoiBNJRJR5u+dzoY/+28v5
         Xh6nESBCRgidzqEH5bsvHpo8OuWAgu7wBz6jd3fsGX2tOTIK3h3m8gSYH2/1qb4I3IHK
         wDC1Pwm/VF9aqkFXtCWLjxT8iw8QzZQzKyFMyAGkfIoYvjyI9WYP01qPUPZH8pvKrARO
         ydaXL1ObeDvyT5YV+2khgXxn3OoHroFgejTrAfGpI2M5vyBqLUuf1KXwv2aEWGbPFMMh
         yLozf/CUopGCIqaCTBW9naVsR+7+vWS20Cy9DBFBVCNE3uY7P/Z/RBzj5E2kCLO+oLNk
         u18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329320; x=1759934120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=;
        b=fnw3UiQZ5YNoITEDX2QO/y+Ls/4Fh3sUGxIhDDXqcyble1k2j/Zc9OJPPE94l1RyYR
         ALpskhbKJ1+rDt7wkLh5Kgbqhw3jCS2/mutmArgHtbkbbY9CFaeq4oUAARRUKFOIUxxG
         gS/iH5MpvLia7flz4XkwvcLntZNHB/ZdubcMW0qiKDuubzZ2K95XFomB+BFE8SahbCQ2
         vAacaU8Nc++SfTJe6RTUzWGyLtuKT/mDzi0Vrkf9RIF3FhOl6kKhrD/GpyuQpL9Ha4Xy
         5uy2BOJ3QQCIea0bIceVLzXzEQNXsZeDhpAAYhhdaxVIvkBIu77t1QwFm2W/MSZlIpN7
         TgSA==
X-Gm-Message-State: AOJu0YxDKbREEP4kv2FeoF/wGapvKZY4wCp/wfmoeg1k0lCKjQ0n86c1
	9/wZX8HAGKasA+TosjI4wh6yM1ZJEnCdc9f/drWHTC8mzDj9oHZcPhFh+OWonyvUy1c=
X-Gm-Gg: ASbGncvEJH6uLL3kg4A+u11nj5CbxqVn0B0kNB+sD/SWQbFKpBpUMPoUBT3Zm6Z6UMQ
	he0z5fC1ALSPypzHw5EvlCpdq3eEzrGDzon0cq/8ZwRn7pNrbgw63qvhWIovnwL0UsIlCBt/tTv
	28/M3U2VW1LgLcfuUcNIlKI1hx0u25MIJVo+TldtFbKcYdJ3khW60n/oh0e7GRs5PsxjQPWK/GZ
	mjYG4/BRpjrqFetF1EdJZ7P5MbDfckJ5B1INV7fgMT5qf8jiCx+K1BkQeDNrdQKsqvDL9efNHn3
	tzK3Vq1hxjYrbniHhYK0utNZfI8lfSWpgwSMa7TRv6xuKpl1uBifMqbdJbEbeCszFNB3z8JWzt0
	o0EQY0Xf5b/txocUjsAdCWMB30QcnbEqQKGdSAv9HDhUB6ItcCvYxN+4=
X-Google-Smtp-Source: AGHT+IEZUYVIvFu9zpdz0keZRQuEBQW5QOdn5tY5CYPn4Dka+wn1atmEY0ABuMidlHZ1MNIekIAUhA==
X-Received: by 2002:a17:907:1c84:b0:b3e:dbbc:4e16 with SMTP id a640c23a62f3a-b46e88953abmr482484566b.41.1759329320038;
        Wed, 01 Oct 2025 07:35:20 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b353f772528sm1389698266b.37.2025.10.01.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:35:19 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:34:16 +0200
Subject: [PATCH v3 4/6] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-dt-partialio-v6-15-v3-4-7095fe263ece@baylibre.com>
References: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
In-Reply-To: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978; i=msp@baylibre.com;
 h=from:subject:message-id; bh=My+67m3RKIYhTGgscnRK/PbLhWzY3WuuDDNXstUgd64=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy7NjyJt1vjOv8UL9JSfKsjwqTOxPHHwVCjSd7Nftq32
 U0S3692lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwETiVjP8M9jp2v3+/WENaQ6j
 T9XTzrwy3b5v+Y11b67aR9399EiiR5+RodlMU/fNha0HjolppMo/CjFcGzc72L/fMrBFV9Zlgsx
 URgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073521_928370_330F1011 
X-CRM114-Status: GOOD (  13.26  )
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

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and I/O Only + DDR and are capable of waking
up the system in these states. Specify the states in which these units
can do a wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO. As I/O
Only + DDR is not supported on AM62x, the UARTs are not added in this
patch.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index ecfba05fe5c273c671cd0968f3eceaf54d22ac7d..cb63db337b2bc4c83b48dde693b95dd9fd93cd26 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -276,3 +276,63 @@ &main_gpio1 {
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_pmx0 {
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT | PIN_WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+};

-- 
2.51.0


