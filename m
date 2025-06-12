Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA65C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Myr5poVQQENs/D3wsYBB3gIB4ThR6y3TggVy/m0W1ic=; b=Ys1E+ufQx99GkBIGf0H/AQYkDk
	T+VndSkRQ4pzBemJxafqUmqoR3uMQ7F0K1s3XOg7XeHw30XF6sQvkCYfvRFvTFlLssM1bYWCg8887
	JFbYqzFsqnnn/SGh1dFQibWLuuk2cawdykN9ToB/P2XgWEMXxe823/+DF5rxAgC1UjIwj3gK90L2J
	ow9GqDw2+DNkkf6aDX1KOC0zHZGF4au0jvKbzLi+Z5FIzQEsxSJfYX8a5BTOoO+xDWdlJoWuNL9yq
	8JJN9gY6PmaLb3jZYxhb63ykfyA9Eq6qjnm9TuFDFwUUOxp4AGhHHcp0+RWB83Ay+TanErIdvncmA
	usOzoBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfaq-0000000D4lN-0whz;
	Thu, 12 Jun 2025 10:55:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeXl-0000000Crr4-3ROs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:48:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450828af36aso192795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749721700; x=1750326500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myr5poVQQENs/D3wsYBB3gIB4ThR6y3TggVy/m0W1ic=;
        b=EOU97CJFWowUuoHfjeUzlyRF4TnYRdZnDL6LkJxHkBtyrb6/RXZqQbIhJ6ZNc9UIEL
         oi8lgOopN0O04fNe3Zcd+Ja3d6XOu8k+b4M7kjLjDO3QPoucryV8MT+PMROYlwBD6P4e
         2JNm6TAiqOYI+MY5sR9f7uY4DlO26WAJ/wmSt2F66SbEh5XmeQOEypd9iZRpNWSTZyV6
         HdFGQk/qP6ODTmbrDckkk6qocXizwKYcQMiBmN1hBSEeHP5eRRCjYTV3tsHpF3ANep5f
         81iHZxT/N1rbvtuOlKEnZ80jTAVdxRjMpEh1KYtYg4MHTqyqX+00H9fZUujYDkK1zNWi
         YZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721700; x=1750326500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Myr5poVQQENs/D3wsYBB3gIB4ThR6y3TggVy/m0W1ic=;
        b=pRTut7K8WtBdr+Ey8M4h9CG27UDVe9+etFnQXxqggsoNflVrweHoRdphDr27S16/DZ
         hBZmukIe6sZ//rLIc92EENERYT5EEwwnw/2USsybwWvwJFgch56w0MrNZZdGMjW1Kvb0
         CKcVg5uNo+mygmwIV8XbZwNaIUnHm/fzzzT9T5ujivts0R9ajc/qZP7/i5lFgg62QCj2
         6VQVHFXw/4MlHDr1hDEcBZ35Ts9r86VtXxkxvfnWODCagqa/YunP2THRG2ENbFL2G0DY
         B1Q7q1u9nPYvtooIiNCODjWGG1d3SB4ZAZd7oQ6ZaVEt6y0/Kxvszg3Mr0u5EPn8niQh
         pb3A==
X-Forwarded-Encrypted: i=1; AJvYcCU08A1ngjFcbffPQuKYbrovCQ9CtbdXmXfCKOBKu+tHzJF/Ac9hEaF1QoWZUxb/BMLhIdLUs6yvmm8PhOonqgjL@lists.infradead.org
X-Gm-Message-State: AOJu0YxV8ayFSBU0ba4+JYlR35ze5HHcJ7P8mNj/ut8sXaWPcp1fwY4N
	rMnTqseQwPTuxTr0OcdW+1hc9dPFhsAr6ONvfKqo/wbn2R2MSAw7yRVnEU755ey5r5E=
X-Gm-Gg: ASbGnct4uYLArxqdTNLBhNq1JbWuDe+VD3B0hWvk3EOfWY53lfQuRdgRTkxvMW6p0nO
	xJNAz/fHxOHYmv2PCYP0JHmyl05mjk50TUjs76RllT2qLYGVaXXJdrrHxzdCU+ynrwLOK5xreX5
	6xfhp8dEzwypdpWZ75tS2dYxFZr4UQibHgUCMgSJ/WPmSOqYo/PmA3BB5fqTSEOuIlvWOvaoBa0
	Epc0wpC7toPeYQzGiyie3dRpNCuGUfX4Kz0n6lgywplMp4hMHykGJoeZqICs7fjXfimdQW1qlhN
	VNdXpEkB8qiYQ/t3vW5glbghPeyiCrJ8TXj9ETTaqiAJH/idfEJmPMFv88nVtpVmJK2w7H4vUw=
	=
X-Google-Smtp-Source: AGHT+IGQXEC55fXNFt2JcDplGna7M5lNHAnmfEE8oJ5P1ElgKnXBGbj/U/t/VrF0AYpAltsnHeHEgA==
X-Received: by 2002:a05:600c:859c:b0:453:c39:d0b1 with SMTP id 5b1f17b1804b1-45324875832mr17428305e9.2.1749721700200;
        Thu, 12 Jun 2025 02:48:20 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8bd0bsm15394225e9.5.2025.06.12.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:48:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] ARM: dts: s5pv210: Align i2c-gpio node names with dtschema
Date: Thu, 12 Jun 2025 11:48:09 +0200
Message-ID: <20250612094807.62532-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
References: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5159; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=s0WO9dFDCSZUvYBIRb4/wfyft3Bl/vsjJiy9qqlHp30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSqJaVNvr5Yz4vK8Qo57gsKiWk04AUVgqe6ECk
 xIlKvemSS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEqiWgAKCRDBN2bmhouD
 14XHD/0Yd7qjZhOwXmX0UZYY1e7KP75JIg60MWwMUTtusGK+CZk2Q16AOMkU4TJrVKeEzu0f5XA
 mk2NDcSH1+XoY2wcAmkIRHTHDr5xah1V2950DpiIq2vpgpDCZ/lceMZuor3gIFmxm+yIm/usmvf
 nR38ZUs04llYMwekUBRhGvvvZhsfhBoDD37oOy6NAiBS4v1PJDvGGtHjzOHBgv6PALRrnxCeQ8Y
 ooNKR2OIu12Qk9rXrrNh1iC+jHwY7L6hMWNk8u7uwRZ2khiheJgrIZBis+D3FPBcX2mBCCUk64w
 cIC9lKOEtf6y1cOJ9gaLPBQPyyMqZxCeAjB9FZ6DMt7WAkvzx1ZG7lODoxEEy80bLJU35OTOpDC
 CqelG2bU796EliLF7Ac/bqe1Z+BiqHCWc/Nv/WTJxdVB17fQYaMQAo4tnJSSO2tMiNr5tFJRtDC
 kWGDYvqTuxSO8A4atYT2futOlWbzyauhwCJNtK5NqKr6Z6MT4XoJ9siiUGV4rWcizIR+4NBUJI/
 Y+ZFHzXOnnFfaCpjgQLwidBByuteJP+7/FpXO92WxL42GTbAtg/LD7gTMLJRH2qdwax8sHmrLs8
 YAHG2tlDvz/XHZz4TgbhEEf305sEYQr3mDLxN/NUiglK+oEFjKFaIpk57MoBij/wIOYhgRxuHJc L+dE2mFHiK/84Gg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_024821_867860_D9E241FA 
X-CRM114-Status: GOOD (  13.40  )
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

New dtschema v2025.6 enforces different naming on I2C nodes thus new
dtbs_check warnings appeared for I2C GPIO nodes:

  s5pv210-fascinate4g.dtb: i2c-gpio-0 (i2c-gpio):
    $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
  s5pv210-fascinate4g.dtb: i2c-gpio-0 (i2c-gpio):
    Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'audio-codec@1a' were unexpected)

Rename the nodes to a generic i2c-[0-9]+ style with numbers continuing
the SoC I2C controller indexing (3 controllers) for simplicity and
obviousness, even if the SoC I2C controller is not enabled on given
board.  The names anyway would not conflict with SoC ones because of
unit addresses.

Verified with comparing two fdt (after fdtdump).

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Closes: https://lore.kernel.org/all/aCtD7BH5N_uPGkq7@shikoro/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aquila.dts  |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi  | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-goni.dts    |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aquila.dts b/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
index 0f5c6cd0f3a1..e9ec2cc718e0 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
@@ -62,7 +62,7 @@ bat_reg: regulator-2 {
 		regulator-max-microvolt = <3700000>;
 	};
 
-	i2c_pmic: i2c-pmic {
+	i2c_pmic: i2c-3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj4 0 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpj4 3 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index 153514e80c9a..0a1a35f4f7cc 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -102,7 +102,7 @@ wifi_pwrseq: wifi-pwrseq {
 		power-off-delay-us = <500>;
 	};
 
-	i2c_sound: i2c-gpio-0 {
+	i2c_sound: i2c-3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&mp05 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&mp05 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -150,7 +150,7 @@ wm8994: audio-codec@1a {
 		};
 	};
 
-	i2c_accel: i2c-gpio-1 {
+	i2c_accel: i2c-4 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -170,7 +170,7 @@ accelerometer@38 {
 		};
 	};
 
-	i2c_pmic: i2c-gpio-2 {
+	i2c_pmic: i2c-5 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -420,7 +420,7 @@ safe2_sreg: ESAFEOUT2 {
 		};
 	};
 
-	i2c_musb: i2c-gpio-3 {
+	i2c_musb: i2c-6 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -442,7 +442,7 @@ fsa9480: musb@25 {
 		};
 	};
 
-	i2c_fuel: i2c-gpio-4 {
+	i2c_fuel: i2c-7 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&mp05 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&mp05 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -459,7 +459,7 @@ fg: fuelgauge@36 {
 		};
 	};
 
-	i2c_touchkey: i2c-gpio-5 {
+	i2c_touchkey: i2c-8 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -485,7 +485,7 @@ touchkey@20 {
 		};
 	};
 
-	i2c_prox: i2c-gpio-6 {
+	i2c_prox: i2c-9 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpg2 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpg0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -513,7 +513,7 @@ light-sensor@44 {
 		};
 	};
 
-	i2c_magnetometer: i2c-gpio-7 {
+	i2c_magnetometer: i2c-10 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
index 879294412381..5863a1300cc1 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
@@ -51,7 +51,7 @@ key-home {
 		};
 	};
 
-	i2c_fmradio: i2c-gpio-8 {
+	i2c_fmradio: i2c-11 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpd1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-goni.dts b/arch/arm/boot/dts/samsung/s5pv210-goni.dts
index d32f42dd1bf5..079581f4dfec 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-goni.dts
@@ -74,7 +74,7 @@ tsp_reg: regulator-3 {
 		enable-active-high;
 	};
 
-	i2c_pmic: i2c-pmic {
+	i2c_pmic: i2c-3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj4 0 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpj4 3 GPIO_ACTIVE_HIGH>;
-- 
2.45.2


