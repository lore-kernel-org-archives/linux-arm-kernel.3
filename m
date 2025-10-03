Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6CCCD182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IZoiErPJ/Pg70gKqGC9T9EhwBHZBMlbbY6bGBGZt7o=; b=kyXoRsCR7pnKRKwfG9ApgfQMVT
	kEnIfEju9IkZA58hQ8AgWAFpqMa+k8uDuTmcDMm1rmIHqrVI5GJqih/cANZZQHXqReD6i/768YInh
	NIXyAgNzLCmXcEaGorPw5ELWZrafb9ibUTUAdVeD5gVt47CTChuR1dIo46dUbWh+hucOMX+DHDLj5
	xysKXbgPj1ynLEMzxdTNUksuExdKCOvSTAHpO8UoiSWxDkR0rFNWKeEvvi3165Zcc+r2IKdVROu5X
	m3wdXOvVOvedUe45LIKMJDv5YYHHVoVwShHTNvN0cixzw8P+jcxnSSBvR11tPOl7F0vds+b2i8Mls
	UFSP4wiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFb-0000000CIjZ-1JAo;
	Fri, 03 Oct 2025 12:51:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFY-0000000CIi2-2ajd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:51:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so24881925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759495863; x=1760100663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IZoiErPJ/Pg70gKqGC9T9EhwBHZBMlbbY6bGBGZt7o=;
        b=hPKLMUIF+7mERZ6ixFuzVdDoOfwTu4qsvgioUN/PaD6Hh5uXOvX3XxL9vnoIIxtm6u
         obnHRNyvcOCqfbXKYuju5aQW2OiYzuygv4rDP7llK4IsMeqjZQDhjIEu325oN26i4MC4
         4MBzLelYf01ih8t6elZiFwKTecEBfnyhHlU3yfDkNiwvIq1Ki2eVS9NQ0xQ7FF83+njS
         SpQ/kV0kIFjybFaZfAyMp8WSSbRAozIjPBwRRGMuDn65ktqSvOz+pBQTVVNqMNDx2kao
         M7Ma3QqdfQDkbpJyJzfud48sB5UgT1N3vGnYGZdvpZS6sSW2F5Frhdb+1y5xGSTwKJlZ
         mrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759495863; x=1760100663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IZoiErPJ/Pg70gKqGC9T9EhwBHZBMlbbY6bGBGZt7o=;
        b=fyYygYAVSIF3hzI45CsnuJKJnwfbCVMZ5OjPY8A2eVZN56uNeym9a2eHSHyTy27Dhf
         JQ/8c7u1f0oTqAaJqNyqLCoE8jczrybMCH/vSIiYScPJHBm7bPg/8ree1+4DCZI86udL
         Zwa+OE/hwH9UmN1jBmIAnkf6QpKBjtKoALp6U6bPEA8nQjcY95r77IagWMfjN9tZpYVy
         dAxszA2OUivsSHEKDMWO+MnNdrKVzqXbv/XLfNTOcrnuXZfD5BNwU8dat4LCHFdXRx6h
         x4KwKmW9wLQMy3hr5uU6gHy6rJOgyuEvGo6N/rmKtWv/b55S6ccAyWJyd+5yvkWhCUum
         DlVA==
X-Forwarded-Encrypted: i=1; AJvYcCWRBOTVUODbqgrSsdX4hbk0u0ASNgbiERcLItJsogWO8bCjgT3NmVoCAd/CFzJESVlrTi9Sj6L7EH7/t0J3SeqH@lists.infradead.org
X-Gm-Message-State: AOJu0YxX1f6CUL3qoSRoYt1nA5JVxR+aspQMwQgzRFZGaHqf9Z0a+7VN
	A2Oec091yl8VfgAdWIZJ6nyruBjvMEEeOZLWDDYBUPayavDQQpFK5mww
X-Gm-Gg: ASbGncvB/6WamjnWPgMKGw5y8wJ7I/SfW59rGjC3tIv7gl/jSZcf1U6jx2ph2EJeeHf
	Unz9dewKZOUKJjLD3IgtMt5+igkIOcImxIp+tu/BXVjxPaWC6hOmWmX7NoXMpxqUeCV2yAtBlkZ
	K/lOKq+T7ICQjSfmXFMfP2P61zqv+ZMsOZS/7gnXSulAfylSYcQiFA+HapppYaDR041JycZQYO6
	xnrg+OkHBhxmVXVb/RLn1uZJPdXMBnnWSfciUyTAldP23yqst5THdx7Pxx7dUMQAQQSj5P9DtPn
	UZuaZt54LTHuysrMJeORmQ1gE+yHx97fQQYwNIvpndeW/RWMgO4BHQCYa+qTjwrLQ9HJM2s7tRV
	7Ia2Pt0mZoLXGk3up7CFr8oqASe/2b+BFRBH+AZNorjBQNf3AkCYkL8oqVdDEwjG+Zgy6uw==
X-Google-Smtp-Source: AGHT+IHs8dFUCY+WdReUoM1aWDsIS9GNN231DHH3c/6nXzIw+XZO5N/Hg3PQQ7yZp2JlTomt4pJKHg==
X-Received: by 2002:a05:600c:4e94:b0:46e:1d01:11dd with SMTP id 5b1f17b1804b1-46e7110436bmr21072345e9.2.1759495862813;
        Fri, 03 Oct 2025 05:51:02 -0700 (PDT)
Received: from localhost.localdomain ([37.159.33.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c40983asm80598605e9.3.2025.10.03.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 05:51:02 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/3] arm64: dts: ti: var-som-am62p: Add support for WM8904 audio codec
Date: Fri,  3 Oct 2025 14:50:28 +0200
Message-ID: <20251003125031.30539-3-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
References: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_055104_673934_C8D9936B 
X-CRM114-Status: GOOD (  14.56  )
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

The VAR-SOM-AM62P can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the McASP1 peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index b93372f22732..aba72d0b767c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -112,6 +112,38 @@ reg_3v3_phy: regulator-3v3-phy {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp1>;
+		};
+	};
+};
+
+&audio_refclk1 {
+	assigned-clock-rates = <100000000>;
 };
 
 &cpsw3g {
@@ -149,6 +181,19 @@ &main_i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_refclk1>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_1v8>;
+		CPVDD-supply = <&reg_1v8>;
+		DBVDD-supply = <&reg_3v3>;
+		DCVDD-supply = <&reg_1v8>;
+		MICVDD-supply = <&reg_1v8>;
+	};
 };
 
 &main_i2c3 {
@@ -179,6 +224,16 @@ AM62PX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (C22) UART0_RTSn.I2C3_SDA */
 		>;
 	};
 
+	pinctrl_mcasp1: main-mcasp1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0090, PIN_INPUT, 2) /* (U24) GPMC0_BE0n_CLE.MCASP1_ACLKX */
+			AM62PX_IOPAD(0x0098, PIN_INPUT, 2) /* (AA24) GPMC0_WAIT0.MCASP1_AFSX */
+			AM62PX_IOPAD(0x008c, PIN_OUTPUT, 2) /* (T25) GPMC0_WEn.MCASP1_AXR0 */
+			AM62PX_IOPAD(0x0084, PIN_INPUT, 2) /* (R25) GPMC0_ADVn_ALE.MCASP1_AXR2 */
+			AM62PX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (P24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+
 	pinctrl_mdio1: main-mdio1-default-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
@@ -280,6 +335,23 @@ bluetooth {
 	};
 };
 
+&mcasp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcasp1>;
+	op-mode = <0>;  /* MCASP_IIS_MODE */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		1 0 2 0
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+	tdm-slots = <2>;
+	tx-num-evt = <0>;
+	rx-num-evt = <0>;
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
 &sdhci0 {
 	/* On-module eMMC */
 	ti,driver-strength-ohm = <50>;
-- 
2.47.3


