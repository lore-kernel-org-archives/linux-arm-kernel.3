Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4019CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dw9cqHmtj+JTcT9542JQD/91O64sVk3+jyfqTVqzQ4Y=; b=Y2qWZRckH60f71Mn5zlmTJDis5
	hv91T9JYCAOjO8v+oQzUjoTbAt6wve16kAK3pG4GS4ViLtnLPUalicLeqFAjh5YSMxsN1Z5qMfBvF
	DPON+BixEbCN0RTCQcyTkE6Sxv2rJnenkGG485Y8XkfnC0gWwyXMf+wg5wrAZpDD0+zp1qg/A19Xe
	OvdT44J+q0I1TeAblvDiaNZGbcOAPHGgxrty7Tv0NGHyGv6tVL6uZHQoX1S0cMmHzTZCd3jfP/SnT
	/na3mZg4pWluGvSfgktslwsQh/RvNxkGvg2785EnfFNMhLWqN8budfyfLKxII+jo85zamwJWvNPYa
	ksw/IhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65id-00000001sJo-2SZt;
	Tue, 07 Oct 2025 11:18:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65ib-00000001sGx-2Wc0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:18:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-279e2554c8fso60023115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835937; x=1760440737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw9cqHmtj+JTcT9542JQD/91O64sVk3+jyfqTVqzQ4Y=;
        b=l0rto1LSoJ2+V3flV9Vx9WJ4HDQsLh8oy8ruhmGbdR3xdT4dOFvRJxgbQP1S58Mvjt
         yXVBBAjajyMADEGE+fm+UNaDyNO4pOnQ28wBZryn2tJ+UNuZmoZz4qjQRvdRydHME4yD
         Q2dbUJK99+fF+UCetp5FsPVhbl2AODUMbuMobBO+15YBcwr8XybmEdZrN3AEyyNRT6Oc
         LhwGtUuz0crELVqYuTd8jCB0YtaYMHT9ySDXicdxRUEPuiwrt8iLpODNiDvLOq24DgNs
         si6m2txZrvErm6p12AMdQbOtdf27J7omQjX7GSo+IDcBznZvN1qwaBJzwmmztxB7lT0Z
         n6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835937; x=1760440737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw9cqHmtj+JTcT9542JQD/91O64sVk3+jyfqTVqzQ4Y=;
        b=Fr40p6xulBNGSPrkrOgE9IZgymktZCVvCq1gD/obcYW9mIow7T1uNBJ6g5tzyMlsA+
         IOmZ6AgRsVn7/jyeQNGX5dRGydTD60obFmcXgzB+KzIyk2s+R23+R3UBzdzoxnsQVQW/
         5oQckCN3JkHgAspdawaAlOGiKcjphCkV5FXGWoapwiExUvPPmmoI8U9+57NEt1uVp7xk
         Zx6x4dZ86IjUNdt6rSknrbtgcXLliiUKn8f349a0LZ+ZC3U5zIl8tp3QB7OfOsXOwV4w
         N/SHtqyOaaK6/LlSBixtDcdAnKCYty62+aZLr5hnJaSG4Zp7KWRwzH7UXnpita3Zscm/
         M2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW543+Yg7y6GIQzzb+bUyGPe3y0ZJDUhJBiCfcw1L+wmgb0qkiQoIJooWm98/rzmTBYuPP2X5rI46rJU+tlDZW1@lists.infradead.org
X-Gm-Message-State: AOJu0YylaaVDNd6KmDvTjsGRsughHQU8cRHJgE5ipu37w78QeMuh6G/Z
	KRaxBH9rTvXQL3FFDVbChSz+PD7viLgFyYhN96wXf+cmXfx7hTqy1gqr
X-Gm-Gg: ASbGncu+LLtX/OgRTz9+2uwA9qXOqQckNDK3ZddiEdNGI3uwj8Zgx//BuPmwhGSSove
	O613D9sQaLdzWYjDdUrQjXtpFk8Pj2MjwM8mI5EtycTwduPoJ/laB6bE9ADoC1g0p7/bpzCDayC
	rL3E3WgLOtlYykke4BUyWiGPYdIO5eCzfrXRg/8DVxUK2S2x9oxymYTPf1fw6WmxWJXx6PNAR9i
	MxZEVVmbPiCuBgmTDkGxHoGh9Np7enkutMVr/6al1e24/seMk/BH5hn4tZlukTeJqqK1wQbBE8x
	hT2H/WJe+ouf9cGkvdXU8dImn7tVKFg6WDovcRRiaGAKC7hQGaRvn4ukwf6a9DYAVOi5Ibo6ek+
	0KbqNa0PlvPiP7+gSj5mGeQOb/XQDOnk16+I2q16gNJfBAD9awdaHJdgNsqcMonfnVUBKHf5jt9
	HVKfRChbne1ftN+stAViAtulGqNeyqqVYwOA5qn2Ralg==
X-Google-Smtp-Source: AGHT+IHC2LNmC/xUFVcWeK3yLywWA7GD9fZRA7+m31c3Vn2k7x7olct3JnOgC1orGXTqxPOFEWB82w==
X-Received: by 2002:a17:902:ccc8:b0:28e:80bc:46b4 with SMTP id d9443c01a7336-28e9a664f0dmr175025365ad.55.1759835936684;
        Tue, 07 Oct 2025 04:18:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:54 +1000
Subject: [PATCH v3 13/13] arm64: dts: apple: t8103, t60xx, t8112: Add
 common hwmon nodes to devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-13-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6022;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=dMA8ghWVekTunsVu7XOstdzBbwszG1Yq/dFfXRCf/bk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3jY15w+v9irk9rkrp+zvDZ//DCl5UBk87+iv7aZ
 ZqqumjV+Y5SFgYxLgZZMUWWDU1CHrON2G72i1TuhZnDygQyhIGLUwAmcm0Cwz+bGSzX5RgmqjHo
 y5znt+T57zzd66/K5hWSYuwTrSqWRDsyMrzjnabz55ZC+PGlEjuNczkDOffPrNJIyZ3CKOV6Kfp
 fGy8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041857_657504_33F32EDD 
X-CRM114-Status: GOOD (  11.87  )
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

Add the known, common hwmon-related SMC keys to the DTs for the devices
they pertain to.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts | 2 ++
 arch/arm64/boot/dts/apple/t6001.dtsi     | 2 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts | 2 ++
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 3 +++
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 1 +
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 1 +
 14 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index ffbe823b71bc..264df90f07d8 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -66,3 +66,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 2b7f80119618..d12c0ae418f7 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -56,3 +56,5 @@ &bluetooth0 {
 
 /delete-node/ &ps_disp0_cpu0_die1;
 /delete-node/ &ps_disp0_fe_die1;
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index c0aac59a6fae..127814a9dfa4 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -131,3 +131,6 @@ &fpwm0 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46..f5b8cc087882 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -61,3 +61,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6..abb88391635f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -119,3 +119,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca..491ead016b21 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,5 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4..c2ec6fbb633c 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -75,3 +75,5 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 7089ccf3ce55..aeaab2482d54 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -56,3 +56,5 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 78eb931d6fb7..f1820bdc0910 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1145,3 +1145,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf..500dcdf2d4b5 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -78,3 +78,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be..11db6a92493f 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,5 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a..a0da02c00f15 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -133,3 +133,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 5a8fa6daa00a..c4d1e5ffaee9 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -1184,3 +1184,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.51.0


