Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756CBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRDlTP7hsAZWXJ/hltAMOaBzG6ysfKykEYUSygKYXcs=; b=K6K5Int9oB3wiw/Wq5zMRKxnYt
	NBHRwr2P6Gwjk6GUhXRHTVrIqRyMPbTKuUL4WV4A3hMH7ohs0SvTVaNY28jZV3uvubzUKi4XaiLiS
	krEtiRRSkMtRQ/wLoyFKpl3Mux+bSTt/5Pfa54gfWIfUHMtRy09dwBkVlljMi96x12A16bhZBqp6w
	k+3/o11GK6y3uO/iyCo3Bk5wNnwe4pK+jZhWO1xDLHU1bv49CjN6Nas94U/hEzzhvuFXZYcWrVRUJ
	NZcpEipsrAwjOhSvqZPERyEsuukxLh1OxAyjyZdsywYwWn0rd2cskOjn+ERvSTNQcpSvEtAvW5Zdq
	fpkM0cOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L1Q-00000008386-2h65;
	Wed, 23 Sep 2026 11:20:20 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L1L-0000000836G-0pra
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:20:18 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b8d47b5987so642587e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162413; x=1790767213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRDlTP7hsAZWXJ/hltAMOaBzG6ysfKykEYUSygKYXcs=;
        b=Jl/bkN0ntvJa65agjL+2voJJnfLgcxT1JSb1VCp6zdibkMlEEFrrHJpjsLYmtoEIh1
         ZeuFcg+jr8T1jeAPg2J9uyeeI18EohhgFhrEDvFFxXQjO4/YzRv5Ol98yZzzJwaE/tLw
         pKQNJLcXpjLLA6FQfZ3hyFtLHnebyKh+D1dps1kZYjBV0v+85mB+cDbLqhhzr3CmDMkx
         8HaUr5Cfda7VgsiWJ3Shh3qxRJj3yvNnUjy8IrdzkIbOIrnh7ljECWd2fkJ4z0DHg54X
         mTY19weMhw4i5y/6fhGb5VfXgYDyEWLBLR4SMDqokGsHIvbM0immeq3QX7eNX28ya3Xi
         58dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162413; x=1790767213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRDlTP7hsAZWXJ/hltAMOaBzG6ysfKykEYUSygKYXcs=;
        b=xdj7ARv1CJ6AyH756zClGrqfukHVhmL8A7y/LdBNcWV2I3VeTCG6ZGAbJB01AHVpIK
         urlATN9hn9/o87VmgREQWto1lba737+QM/6LViUKf75naGJE0I7+8d5aFfJSjgRpHnjq
         egkCh3YNuhUQu9q8cdK9MW6hGy32EEpMc8FrO90OT2OHv82NxIVAdcLO/xfU+sav9ZrH
         99Ic8/EnmhM7JNy8mAyNzVxX5WfOCNoJYySR//IIequG0S8LTM3F6RHIiKDfmJ/v43EB
         /roel/YkKxRtl/KjEuyVk94WrQaQp1+sRzl77BHntgIt0ACj6gTyuHv5Uv/9iouR4KWu
         /p8g==
X-Forwarded-Encrypted: i=1; AKwUvByVXmNCRs6vOvA9K/F/+EPA57R+dWu5yLv4vUYrsDTTQb4yGDNJyEnlrCwgSSKjP1Sj+6qxl+zT83k5QJd+7ImM@lists.infradead.org
X-Gm-Message-State: AFuF++mER1RemVyp1xpREwvGdZjLjvEKjxP7vNI9C9Ls0mo4DMWv+Tn+
	LwyXxYHJWtKt64vAcjluMUJcgRwelspoJCvA7QM1ZUHhzaEVi0M5xFIJ
X-Gm-Gg: AYBFou20kp2I4IYHky8RG0byCqyDcG9suv1Bj8GJGwnhlE4LWq7B1oFlpCvBDvXoX36
	qbESCb4vCovvuVo5JVD317frAEbYc898nrFyKxFUzUr07sh1N7GBLjR4bpOeqiXifY6oGtRtm9p
	L81F2pi4kVxPbnUtYsl3Qu16e5gozvvdNwek0XoPQ3PuD0gGxj/NboLggzt+PSTEvEwFl7jU6lA
	/Db5MYtQqzBKgax+SBLcIWlQX8lf9tnA/XnBceP9vkb92Y37FN/hIAca76Px2sIWS6qG3QEKd+c
	/N8YC0qTxFPcLvKjs4Nz1O2hQxq8y2sIxs40Diz9xlGjLrxlbbRS+OVgyExdNS8Vbil62HI8nv5
	ffxC8lzYdf3kEOnq++wysPCgSFHhqw8LukE4hJM1PZ4HJsEXncq8bFSoOYb/siypuY84maD6P6d
	7k7z7vt6lBFhm+gOJe4xpgbxWR7hPSTmEv+N4yPY8JEQrG2+QbLdEjqJcpqe0CNYUldd6HVbgSl
	jdj3n3xfwKp2fsC7mbm2cSmM5Y1QQ==
X-Received: by 2002:a05:6512:2252:b0:5b7:55ba:1914 with SMTP id 2adb3069b0e04-5b8d8967ac3mr763907e87.28.1790162413121;
        Wed, 23 Sep 2026 04:20:13 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8595cb6sm516505e87.82.2026.09.23.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:12 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 16:20:08 +0500
Message-ID: <20260923112009.1062-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923112009.1062-1-anykey196@gmail.com>
References: <20260923112009.1062-1-anykey196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042015_651737_B882A3D1 
X-CRM114-Status: GOOD (  10.67  )
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
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18) and
gates the RTC 32 kHz fanout clock (PG10), with the 3.3 V and 1.8 V supplies.

The pwrseq clock must be named "ext_clock" (what mmc-pwrseq-simple requests)
and its output pin must be muxed to the clock function, as done for the other
H616/H618 boards.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index ff9b40352a5..39f580af15b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -189,3 +189,45 @@ &usbphy {
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
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&x32clk_fanout_pin>;
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


