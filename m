Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF5E63CA3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 18:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KgUVWqzHwJ5YQYyVy8QnSy/op2C+C4KeJA5ZeUsIuI=; b=vSHWJKbgOp0Xq6HXYLvc3NqmCe
	8UJVUg1l3yod4NqOAJIbNFsFLenFtLC/GxEiD/N4GTpZ9mu/YNeuXT4414QRO2EBcvOB0LDShCF3L
	B1nuJHK6TWqE82bTvolPcmwmW70sWF5Xo82xRydSxctMe/qMD9yOk1MlFsf3Tf9u6mAMgPxcgP1Hu
	QzXaRYG7ZsdjK6MhS2WwfUC/EwO1wBh7s9X427so50ywy3qbMae+PMQlaGeQa1fDUY7MKs12MrzVf
	dp94ahuDwU8yM+H2fM+X1S5cq3MrB31CHar2sSq5YHU8cxPwbLKnjd1dD1P9MI3pkNaCwFcTlxccc
	IUAx2GKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk4bf-0000000BNbz-3izw;
	Sun, 25 Jan 2026 18:13:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk4bc-0000000BNbI-2433
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 18:13:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso29685685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 10:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769364778; x=1769969578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KgUVWqzHwJ5YQYyVy8QnSy/op2C+C4KeJA5ZeUsIuI=;
        b=Lz0YbyX3EJ3t2Xg5pOjdsUKBafVtzSnR52fsFf0mJsMNs+DNupOxHPHi/AUPWGdTvO
         ilCsoa/JUYIVE9KFm42zgkV5/xhUl2Rc8TkfNdhArshjBl7C7pV33cQKDQNPBD7QBkMU
         uZixd3c5YUXDGaPkjO7643rv6jMpYJ6DsaHnZ391bMdvLUajHl18kTEpP8OcjYzAaq92
         WV2w3EDlo8Ki49+nWKJ9laer57qxS4xEEDn7b9svCz0iVARtImTK+IsOK4iNg0tQuHS6
         VB7sobu8+n1X5LA2DhzfMwTI9HuGFiSeAqwrRurVKe5tEtBWM8NrckVkBkP4pZ/TehiH
         ehcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769364778; x=1769969578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KgUVWqzHwJ5YQYyVy8QnSy/op2C+C4KeJA5ZeUsIuI=;
        b=lJPA1s1qbfkp48shzyAu5N6RIJ5qKbIMee3XXyRAzqcWJszyQH0pikYZIeEFRmQPgE
         jZhP/C/gvMpueCnZkmjnx+gkMDkl09W/kxHmkIeEmcT7EZhJr6MqF/4QUDkkT5g9iIqQ
         5IfKNpciMmsyh9SaJVfL533I3U+/u/6aNgQgjJiJA51z0hcCidQMsYuas9KxZQr74wsI
         qp4ZloytT1+imylCTb1b/fBL22/05qln4qlyFFYgz1Wt/0uYfODWdOQzsRBDRIXf5sOJ
         EE6g25KpQiFf+KHOTN4rvtAyNZFk1xs0Sz8YTB55zmGk+v4gtDFYwV+jRYM6avIGqaNK
         8HzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD/kGZimNeDqGBX3o0wuM5qOAIFHymDa2F3u0aEBNceuQG9JRcnkkK9G4qQvtzeM/wReQGxo6A6q+NdBs63kxS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+nHaUJ0AMEnfly2zk2z2hXuAY2iofu9diPJ6kfAp3cvScqPbN
	L8pi1w64UdZ95D4p3X9/X+kawZFXhrmJgmvoCcKvPbc2njlM8NrP5fPP
X-Gm-Gg: AZuq6aIJQVkxLYDwHLo0E+cSSKHKxbQm5BYEwSAd//temI8QCSPwuEttd8HIYAI4rEN
	YDTAbXkFySRBNVQqw6E+KasDGYjZBLwCkf3DvD9ulbGubyw3lyR8sx4ykSOESYAFrj/EQnWP5+V
	rrkToGdB/px1/cvLfEefsymNzQaWQNyjP0iQKGVoByf7XyXunGgD87/AIOlolLMVcVRalGgNGK7
	W6q7tVXFqZCGtN05o+XbEQ9IQDo1vV5WLkxCccGDrUHqXlQte8/YuA1C6qCUnRYYzj1w4kfG1Ip
	S/MX3PcDlnJS+ECtrbhfgL4/OKg3gxv/t4Rds1VxCf+4UgvbTcWom6gXvvioeUV203RRyiFCrhX
	vsPOBe298cpOg0ijfxs6vywpT3enLhp9kpPLSIVMerKqBE4dDT5PdI3M1if/688PP3GulXBK4VY
	RC4kGnKJiydkcbMLSvis9+3U+yEmOhJUDm5bwtwAWAEQ==
X-Received: by 2002:a05:600c:b96:b0:480:4d39:84b3 with SMTP id 5b1f17b1804b1-4805cd4090fmr36093185e9.6.1769364778155;
        Sun, 25 Jan 2026 10:12:58 -0800 (PST)
Received: from apple.sigmaris.info ([2a02:8010:6606:0:fd30:74ec:a5b0:107a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5b67sm215302305e9.10.2026.01.25.10.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 10:12:57 -0800 (PST)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: rockchip: add pwm-fan for NanoPC-T6
Date: Sun, 25 Jan 2026 18:10:14 +0000
Message-ID: <20260125181228.25145-1-sigmaris@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_101300_548074_A1BA31DF 
X-CRM114-Status: GOOD (  13.55  )
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

FriendlyELEC offers an optional heatsink and fan addon [1] for the
NanoPC-T6 and T6 LTS, which plugs in to the fan connector on the board
driven by pwm1. Add the fan as an active cooling device for the SoC package.
The PWM duty cycle values are taken from the vendor's source [2].

Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>

[1]: https://www.friendlyelec.com/index.php?route=product/product&product_id=305
[2]: https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b62f5aad139fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L75-L90
---
Changes from v2: https://lore.kernel.org/linux-rockchip/20251109192128.72527-1-sigmaris@gmail.com/
* Set trip points to 55 and 65°C (Dragan)

Changes from v1: https://lore.kernel.org/linux-rockchip/20251026194858.92461-1-sigmaris@gmail.com/
* add the fan to the base board dtsi instead of overlay (Heiko)
* just use 2 trip points for warm and hot temperatures (Dragan, Alexey)

 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 90e7fe254491b..84b6b53f016ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588.dtsi"
 
@@ -89,6 +90,14 @@ usr_led: led-1 {
 		};
 	};
 
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 35 64 100 150 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm1 0 50000 0>;
+		#cooling-cells = <2>;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
@@ -590,6 +599,36 @@ &i2s6_8ch {
 	status = "okay";
 };
 
+&package_thermal {
+	polling-delay = <1000>;
+
+	trips {
+		package_warm: package-warm {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_hot: package-hot {
+			temperature = <65000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_warm>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_hot>;
+			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pcie2x1l0 {
 	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
-- 
2.50.1 (Apple Git-155)


