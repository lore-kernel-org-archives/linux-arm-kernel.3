Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EA0CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6vH5fXGe4VkkrWElN9kTcP4/mFYhBdwL1V1ZVaN0zdo=; b=WDEu8LLztkHTOFNvhJgFVHiIIB
	0gsSkA/vxx+beAXA4k3sGKoqQqp8/bNHY2p75i9YrsP/j4D7gZg8oSNZfwJobCU27qhg4KzTmvU4o
	FRU9SavMvmszFWuhjLib3+v7z5fYe4GfCoyVYtCnkyFFlrR3DlgLo7QAgyemo18ucBAycoWhgoKQo
	9Zxuxj9F2FlEklxobd0wKhkCpReQHC6b5ZmON9Mk+ozN0sD3XSdyNe7Ik0u4jfee8Ly+D4ce9J4tH
	EzWhuC9ZgqXy297a2/J2VNlF7xsZ/NGIzYOuhIcv9w2zGodFf2RJEVm9OJhrahmehqTyh56jXZ8VC
	Q/PPT8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIAyt-00000004KS3-2s73;
	Sun, 09 Nov 2025 19:21:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIAyp-00000004KRG-3THr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 19:21:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477632d45c9so15398695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 11:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762716098; x=1763320898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vH5fXGe4VkkrWElN9kTcP4/mFYhBdwL1V1ZVaN0zdo=;
        b=RVWQhc/McxQnJKSlDwDuAPM5YhKY6WK5zcDX7ZYjMZqsRDq9QmdqsvteaVoo6JrwEf
         d3Dc7IIPeBw0qX8VQR4wu9bo89eEKNJ+mCeV5vcVq526+RXzZ+KXgCYnGmz37m7beuNH
         ux7RziDbng0Ler6wLl9YRFeubd+Y49LEP9+NJqxQxpsxGqsjmK/AVbgEPkc/5WW8sTRJ
         F391fPLnaHy6tHDDPk+6r2tGPZqQi1nr2oA3768M1tBsFiwFKseMkCeo8hKmAUTR9UvH
         TjtAM/IRVKc0vKZ7YV6+TGwC53PhgUoQgQjvrh6YtW5eJbMCBPMFBeLpOS8QEDwTzqCT
         hazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762716098; x=1763320898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vH5fXGe4VkkrWElN9kTcP4/mFYhBdwL1V1ZVaN0zdo=;
        b=e6HIC4LZHGqQxEPVWrC/nRiPtYLbeWxPn5PeVXD1jfKy0SQ3T7Dny76BycKsT3O/jg
         not+qe8alx9ySwaBYF+jCyCn7ets+jf+9THT+327+WDD6o9AaxVN2E+m3lddqbdYIjpF
         kqHnIg80mGcByyV0zA1bcGXpxkz2kNmEaP9+QCYQjWu+y5F0fPuBkgk4AZN/eaRJOBZO
         hHXyP467Lyg49Ku3FV9p+/yXW1pz6hqoekey6l17zTZWU2LlfZVanc8VR7cpTZMlWKju
         mSlrvN35QYTVTOmMXfbpQlT0yrg2XRfyU/snZK+t0oM6/tVP+rrmGHZ4/CQcI0kJ3/Nq
         5Juw==
X-Forwarded-Encrypted: i=1; AJvYcCWLbWX7TIvSDtlHc9EKuvGiTg9lhv6F2ehZed7UkEY6ybHAAftBd6W7PxF1wm8K76nRKBz8gSyTltbkfY1upp32@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+zTfyLBrsIj2VV1eXKUgeljPe2jof8A/Cwa/R1xETS+HVvKzl
	knNol9B8sZS2Fa1aXiNYZGtJ/heF0Ibe+jGV4EPDmYjdX9Qfu8o9cH4j
X-Gm-Gg: ASbGncv+dWt7Vce7RU5bNMqe3mT5X2at5xHna5fHRdwrLalbqsLrQDMynh1Rk27DXwI
	cn2/WSmhhj79LTga6BuQOPaB+ylK1XXQb+8C2sq7XHupLyCnRxfcT6vPnWsVBaYBe4qVmtAF/ZQ
	dqeISlUcyQYVMRjR7V9uSiXuD/7EIvO56D18tIgXVQN75ReoanGIRZB2Uz0dFgpcG0BYLPeN7k5
	GUQoaPJHZuypoHKNLutoTNT8K8UT0MZMKL/8OJ+DhV2zVfAqmbcnDqHIGKadlkfwFrfcZ1UPKw8
	dpHA4Zab1STYme13qmSCyV5/3jAyT/Lq5II7FMzXM7VDxLnz6rO0DR3meiZHFqpzkl1c447qIJk
	gimyPENww5MRnO49oY/SmPtP/drrUAuCLnP4f+i/m80WEeso0e2/xam1hJWPj8AP86jA7XuM+r7
	lOlMPD9LJ5G0wO/K0yRNAN3ufTqhBkuF1YKyN1IQegAw==
X-Google-Smtp-Source: AGHT+IHEGGaPojLqJnQJyx/eRJbJgTm2GWxMz4aHcXLzOtk0tX2JbG/6GFj/8DCLl3D0UN/5mSd4Yw==
X-Received: by 2002:a05:600c:3554:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-4777323ae5bmr54155475e9.18.1762716097419;
        Sun, 09 Nov 2025 11:21:37 -0800 (PST)
Received: from apple.sigmaris.info ([2a02:8010:6606:0:d132:d099:e4e7:cb00])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e7a6desm91150875e9.8.2025.11.09.11.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 11:21:35 -0800 (PST)
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
Subject: [PATCH v2] arm64: dts: rockchip: add pwm-fan for NanoPC-T6
Date: Sun,  9 Nov 2025 19:20:51 +0000
Message-ID: <20251109192128.72527-1-sigmaris@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_112139_886575_D9F64A56 
X-CRM114-Status: GOOD (  12.98  )
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

FriendlyELEC offers an optional heatsink and fan addon for the NanoPC-T6
and T6 LTS, which plugs in to the fan connector on the board driven by
pwm1. Add the fan as an active cooling device for the SoC package.

Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
---
Changes from v1: https://lore.kernel.org/linux-rockchip/20251026194858.92461-1-sigmaris@gmail.com/
* add the fan to the base board dtsi instead of overlay (Heiko)
* just use 2 trip points for warm and hot temperatures (Dragan, Alexey)

References:
FriendlyELEC heatsink with fan addon:
https://www.friendlyelec.com/index.php?route=product/product&product_id=305
Vendor DT with trip points and PWM duty cycle values:
https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b62f5aad139fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L75-L90

 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index fafeabe9adf9e..9164a0ee6228e 100644
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
@@ -591,6 +600,36 @@ &i2s6_8ch {
 	status = "okay";
 };
 
+&package_thermal {
+	polling-delay = <1000>;
+
+	trips {
+		package_warm: package-warm {
+			temperature = <50000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_hot: package-hot {
+			temperature = <60000>;
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


