Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18210C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGzrQTM25YzeF6Zl6z9UWlYe4efLXilZQQjl4hlshtg=; b=fIAhttKjlesTFpf/lmUzbdjO14
	HQSQVVmfH8NNZGu7x2eP02r4E7bHd+Qs+flDwJyLOxNwBJ7Br1TyYxUclUpjmKZsDs4gsP05XwwTE
	hEJvDFU1T8uvgnu/PxLY8upouoFJLxGIbn6Hb7yKkz4OqeGQbPWYcumPQxyRXbtSw1R/9f/+ptGzU
	cfV/e6xjHEU9iKcU96H0tmOPBcHaROVkDH9LcqMzT0+8JpLt0ku+ZP91WC46OrrrrVCaH5mt3Jwag
	fVmzQTknowD1WXADdckpUn28usZabrJ3Bs1I0OiaBveo4v4ykcOVlc5+QwQG298bLRLeMuwaKL4kT
	va1dbeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KpM-0000000801Z-0McV;
	Wed, 23 Sep 2026 11:07:52 +0000
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KpD-00000007zxr-2l6M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:07:44 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a49c068e85so5503081fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161661; x=1790766461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGzrQTM25YzeF6Zl6z9UWlYe4efLXilZQQjl4hlshtg=;
        b=Jh04EBCE/3CZtVbASMdBq8cghfBXvqiXbSKPZ8JsdvIycY3Kuvwl20RukpFt5uAwqv
         GnO2Kyhm1DvCqDpIgrqMi5qQQWtxjPTSXRojgoJPIeo8wZmEdRhUgMDobZin4yre3u+J
         gTQCmdHfsYY2vOH6oglv7nMgJCDfYXe/esQxbPbAkCoWzdLuTIVSZ6dmQRFF4h84LJXM
         YcYUS+dHtniN09WQj1Qgua4YpRkMv9RPQBGU704CzzI7x9KowHGi/Lv1sAvbXpGGdiBd
         DBfZMvszkSF9QH4+Bg0xFFP4pOG5ynCGM5SWtOYnUh8m6sCmrpmmH63mYiyFjsup3BMx
         FCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161661; x=1790766461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGzrQTM25YzeF6Zl6z9UWlYe4efLXilZQQjl4hlshtg=;
        b=M1BGbT0B2kN5gjp2dmj15Yyyg1nCSgBRbOr6q7gjK2GS2JtAUC6Wgdk/5DLsIacEIQ
         E6O4vClgIh3Wr7BPzsIQPYyc14ZM6VFwb8DULZaODG+hk9TZ/JD+2qAZBzhz2o2Eb5u8
         Ec6Qvht4S/CLX+Ievzgq2YMj4wjSKJKAnZEnMkyuE8B3WX21ItCq/fvSbeg8QNFS/X0u
         aEXw1G1EeHWHvRoG4R4b335v/84RIOcH7ocb1SUjnZe3SXN/nSN7JbVoKzD+R8BYvAXD
         yOpRJYiAFWDWC2r5etN+AkLxhfcVY2UgiajaOA9Vodjlhi6hKAJniwZZI6OGLTMAe/2V
         cH/g==
X-Forwarded-Encrypted: i=1; AKwUvBxxj1ivAE+p2G0Ik2yQyYmlvD54B5u+XfnqCr4vvklhr3S5eKSgyZaDRqMWffULmzGOp2Ab6lRldHusJJKy6tU2@lists.infradead.org
X-Gm-Message-State: AFuF++nQ4CaZXYWTaxs+K5iF3DT/0aAiOthhr/bj+5koe934pa+gnKQ4
	wruT+7DRVN5ckEgHyOgf8UtLPUPL8yutOnkt7/EuIcIhK3hpEx1LOCtR
X-Gm-Gg: AYBFou2WN6xk0RmF9tfEe7VbzFrlxyzHsRsvTyevtnrU8Gc8C+zGzO5XmCLs4C0L0jb
	NjaaFL1bsESoLY7w3KxeWjVGG1nfSoDrqAaOZDb37Kgchy1XeH7oo1hudK/Y6Nu8pg1kJ32JfjT
	59xAAsftCUFLfOyC7hpvs692QWwnPgxgFv6CdvUtI6KRJjslW0udCQAWyIbgzZyPbSaDEkAHIsW
	WrHO1YlyfN+7tjpx9s77jC7Kyg6emU4fQAfAU2j/bDorMi8x8e76n+5h1hZljXRwYToyrJvnnZt
	XPuuHaz4hPUnqt8789lY6EsEp5Fl6a9GbsUi9syHXUUh01nQ6tatvnM6h8OJezWYgupcKKfUi4B
	qyi665/FHGjAcZk7zJtENfOu5tfVPqzlXdWZjm64nzu4ovWiCZ8A6TfW1G4bjPcVNtlasGtDDss
	/mAfaX8EOlHyaFY3R5U8SLZ9eyuQReGohEa/EQ3EuLnthrl1BXBq1613C+Kjy1KtzDRYhI84MQ8
	LXbNFVEO+iopu+IkLQZd6wb98s9MA==
X-Received: by 2002:a05:651c:4ca:b0:3a5:b0f1:7d56 with SMTP id 38308e7fff4ca-3a63050057cmr5356761fa.0.1790161661320;
        Wed, 23 Sep 2026 04:07:41 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f2f4sm521750e87.65.2026.09.23.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:40 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 16:07:36 +0500
Message-ID: <20260923110736.10-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923110736.10-1-anykey196@gmail.com>
References: <20260923110736.10-1-anykey196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_040743_712251_73F8DFBC 
X-CRM114-Status: GOOD (  10.31  )
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

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), with
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index ff9b40352a5..7d473274c06 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -189,3 +189,43 @@ &usbphy {
 	usb1_vbus-supply = <&reg_vcc5v>;
 	status = "okay";
 };
+
+/ {
+	reg_vcc33_wifi: vcc33-wifi {
+		/* Always-on 3.3V regulator for WiFi and BT */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc33-wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	reg_vcc_wifi_io: vcc-wifi-io {
+		/* Always-on 1.8V regulator for WiFi and BT IO */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-wifi-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc33_wifi>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc 1>;
+		clock-names = "osc32k-out";
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>;	/* PG18 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc33_wifi>;
+	vqmmc-supply = <&reg_vcc_wifi_io>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
-- 
2.55.0.windows.3


