Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F258D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGhaOvmlmS+7WMRTI0qoktvD9ygsBMZt9H0idUxXEQs=; b=hlpIneMKqfVfI4vXy0WwxWNlyd
	YMkCgMvBjqlfiaPdNZsE5WBhvGI8ywoFrsU5pbiFP2OBeshz0psOsmsBKdbs7qGJcEqXRcs9LPynn
	zvW5/Ymq0NidrMQLYIHUbYL44EuPbcdB6ZFKhC5IlNXsTzDKRPZk6SOAgZQloR5N/V1lgR+qmz5bN
	xFOpikdTeTd1EO+VBhf920lDU3m1OP7iQDs5zX4mZ9k2bwKq4GQo8uwHj8sTlXmm8dFEpQydQvs7+
	Qzjsjy0I7LwpD8dUbmPkWz/7xx7y6DLJuQF8DlMMpE3ci1/HZqt2ydcwswLCD4dtlIRb7Dy9INt1C
	rhPQoUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAF9-00000003YDX-37BW;
	Mon, 29 Dec 2025 10:12:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEx-00000003Xy7-0B9c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:40 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-477770019e4so75374725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003157; x=1767607957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGhaOvmlmS+7WMRTI0qoktvD9ygsBMZt9H0idUxXEQs=;
        b=Mgpeeg5oXE9ucAy0CFMP7DsGuXMNgitRmBxzaaXRk31WDLNT40x2GOpPYPt5orVBVX
         Ja8AMV+A+vKT+HGLabGM9pVTLejhSkpD7m1Yc5CzD/tVsWk5+ymBPpLouUEfw1M4yEjs
         XFr7E4GTWxlrdp0ZcFgKD407yFEKs68n4g9qJHak4H8Cot9xy4i9lZKo+ggq/yRdnilp
         8s8qoNmIgrtsCtC9XQfX/PnTYzsd8SyqGIZAuxsqonKPeNDVmua8TMf7n8PcI7mNCdHf
         tBpVelhqaSMztOTH8244PkiycNTIuYONHeeY8ez/vQr2+wJZFVizLK+IQ678Z2lidQN0
         qxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003157; x=1767607957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aGhaOvmlmS+7WMRTI0qoktvD9ygsBMZt9H0idUxXEQs=;
        b=PMqXryl0VYaomIhi8df3USKHaXlvsd/G5e7Q/V3UKZlryxoqrmE/4nO0Bd22mdHh/a
         Y0XTHoGnNw9U2kDFJYhZnZAp+l4DYMdiIeqYD4FNWV5BStB1b8gjl8H0exL1sGXkmqPG
         Yvj1a4hL13oHvOud3UXwi6Rh2+kDAHM9M0HdcIxnZF2cy1UZWlyIG9dT+f1UoaNu3rEG
         H+9GXsZLxToYx6yXrvdJEsfmVhQbhc4Kj/lRCEiQMVxwZRE4M+EPZqsXYQa3XwNT0IiM
         aB/Nn3KfE7ua1fmGe6d04N9JD4OglqibPbJyY4YahD9mCjFLqRhFvBYj7rPqRmHqosck
         uwWg==
X-Forwarded-Encrypted: i=1; AJvYcCVohKqhQQRYkOXtoqQQNATA/VDr5G+3vm314GeT1M7E0ZGMjZCT3lLgapvR0sh5el3221SGEe+xhDsRnOOBOzdT@lists.infradead.org
X-Gm-Message-State: AOJu0YyxXerEBeHU2KlE4CpFelziQHOmRhbwJbQ2YMuRdmkJpQVHRkQK
	pvvirthlfB9q3mWkACmKek+bXu0ZFr5CIoaRcy8C6J8qhszBqhc48ttY
X-Gm-Gg: AY/fxX4Z3uTYuNFsyqrxuAzbhTxOOEb5YSSU1kvzB8pH5ZWElfIcMgqV2UOUpgXwAqa
	3PMINpFjwOJc9HVUKVEOi487voouYFI2saxdUgthze0DgvOWtXkjwtUTmCymi4YE2FOm9YXN68R
	jxn6cZ2W/l4JqGfTG8+7JahicQEJZ+wBnDS66Twot4tjJTArl10yNLvjPGqlaEUJQS9i2StECfE
	+m8/nS0KAfOeS7KddKeHVwx7QQCALMXKoesgWgG5USAj+ln24XWjrvFTPTB+bgsDLcOK64Oiu4E
	xkKGSyJlym0nkwvNdQvEJmoLvJuKLAFWoB8oYIZ0eDk5Z6b547mzZwrBDpK2hVq8g24tpAmXeB/
	7ovoI2hpBn0Q2BkheyrkLD9+jH/+can00mlWL9uNcJNxStSae5D9OaSY3bRfdMyVIVj3Ot3fil+
	l3Iqdsj5WeC4u0JKq5OKcWJdoWYYmiJmcWaTN5DglMyoPVd6f6FBhBNuqoWmEP
X-Google-Smtp-Source: AGHT+IEEqpluRCt6k8YgVElk53IPARdNcOg+sX454L4Ga2LZMawpnbxrDXzY9rlApr1YZZYjgLKOaw==
X-Received: by 2002:a05:600c:5246:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47d1957f707mr375649945e9.21.1767003157158;
        Mon, 29 Dec 2025 02:12:37 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:36 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 29 Dec 2025 14:12:04 +0400
Subject: [PATCH 7/7] arm64: dts: rockchip: Enable analog sound on RK3576
 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rk3576-sound-v1-7-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3935; i=alchark@gmail.com;
 h=from:subject:message-id; bh=/DNd3nTBgpx5bzsW5XipYiAjiZLaQMrfypQ8s3aY+cQ=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTDZu/EGt5/fcaLyRtWMkHvJgSmTV+Q53v/1f93JR
 Yf/mVhkdkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDV9u6MDNseFxl6BW9gXHBv/p8du43+i12o+P+UZV7Krhe3Q3T4bRcw/I9ZufD
 O/NgFm/hUti93nDKzMu+OUpnOHpvWdYU19i72FzgB
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021239_151035_66AF9D8D 
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

Rockchip RK3576 EVB1 board uses the typical configuration with an ES8388
analog codec driven from built-in SAI I2S.

Add device tree nodes for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 99 ++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index deab20ff4d97..0789733c2073 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -246,6 +246,63 @@ vcc_wifi_reg_on: regulator-wifi-reg-on {
 		regulator-max-microvolt = <1800000>;
 		vin-supply = <&vcc_1v8_s3>;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_det>;
+		simple-audio-card,name = "On-board Analog ES8388";
+		simple-audio-card,aux-devs = <&hp_power>, <&spk_power>;
+		simple-audio-card,bitclock-master = <&masterdai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&masterdai>;
+		simple-audio-card,hp-det-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,routing =
+			"Headphone Power INL", "LOUT1",
+			"Headphone Power INR", "ROUT1",
+			"Speaker Power INL", "LOUT2",
+			"Speaker Power INR", "ROUT2",
+			"Headphones", "Headphone Power OUTL",
+			"Headphones", "Headphone Power OUTR",
+			"Speaker", "Speaker Power OUTL",
+			"Speaker", "Speaker Power OUTR",
+			"LINPUT1", "Main Mic",
+			"LINPUT2", "Main Mic",
+			"RINPUT1", "Headset Mic",
+			"RINPUT2", "Headset Mic";
+		simple-audio-card,widgets =
+			"Microphone", "Main Mic",
+			"Microphone", "Headset Mic",
+			"Headphone", "Headphones",
+			"Speaker", "Speaker";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		masterdai: simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
+	hp_power: headphone-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_ctl>;
+		sound-name-prefix = "Headphone Power";
+	};
+
+	spk_power: speaker-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio2 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&spk_ctl>;
+		sound-name-prefix = "Speaker Power";
+		VCC-supply = <&vcc5v0_device>;
+	};
 };
 
 &cpu_l0 {
@@ -712,6 +769,25 @@ hym8563: rtc@51 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	es8388: audio-codec@10 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x10>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcc_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcc_1v8_s0>;
+		assigned-clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sai1m0_mclk>;
+		#sound-dai-cells = <0>;
+	};
+};
+
 &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
 		compatible = "ethernet-phy-id001c.c916";
@@ -778,6 +854,20 @@ &pcie1 {
 };
 
 &pinctrl {
+	audio {
+		hp_det: hp-det {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		hp_ctl: hp-ctl {
+			rockchip,pins = <3 RK_PD6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		spk_ctl: spk-ctl {
+			rockchip,pins = <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	bluetooth {
 		bt_reg_on: bt-reg-on {
 			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -839,6 +929,15 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sai1m0_lrck
+		     &sai1m0_sclk
+		     &sai1m0_sdi0
+		     &sai1m0_sdo0>;
+	status = "okay";
+};
+
 &sai6 {
 	status = "okay";
 };

-- 
2.51.2


