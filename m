Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05518CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OhP9WyP/wpWu6Mb4fbUxFs+8834wmIS++iJ9iNw9HQ=; b=mMR/Xgyq4jcVp/NeUhj0r6mgJf
	GwPvV9RAcY9mGwtwvKpOkiQQOLXlb9d3XI9vD5Bw+yaxLzXaVtUxC7fyjVLv69ciF0Mc0oANFowwh
	yu22W+V+iclO6VKdNzx20Qhq1H3GpbG7++t2z+JcOdps5fKF3ZOoEHMN7BiQHVnXI/KO4R+RD4An4
	kwHoWwXf3cZB1Qc1al+pUyC8QuNaqyFyFbBk9MDv3M6viHEF58no15ucm7d28xb07GvWacnvx3EcX
	YtqD+svKPKZDqkV42J4rIa5LwMJTw7Y5CCtWYvxjtsmTHwO8HJzw+tJuGBYBYpYzhkxRzXKVPB7tu
	X8fYUFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNSu-0000000AlzK-4BzJ;
	Tue, 19 Aug 2025 14:37:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKps-0000000AKwI-2ikK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:49:05 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so2602757b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604144; x=1756208944; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OhP9WyP/wpWu6Mb4fbUxFs+8834wmIS++iJ9iNw9HQ=;
        b=XStWq6TeJyFB/Qzf+9JHmkwIRxbgzmY8AaG7Dzg8JZ8kNjpWaQLv2Hu5Uo6K1LFWyn
         22yDsf65yeH+7GxwXILtBWq8xh9K4i4sfTfwg4waO6t+ADZEtuKcXpC0YEMKqA0KbOIo
         I3WPPKd+zeLqGYjWTVL+aTO8SdVEZTGoPgli5lVnx6ujVHdN/T96hgG28GNvC+HEvy1x
         /HHZZoULuXOHB+br2iXm7DxTB2EbQebPw+7Lte6VSEZUMiZ1xjYfDGIJwqZ5NYpvspuY
         wuypG2bRWPFcsGvNer05TbHnUPw8KcnnMsXbwFjCVHphH7xpXh5BvVqcGZsbCxN1R8z8
         kimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604144; x=1756208944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OhP9WyP/wpWu6Mb4fbUxFs+8834wmIS++iJ9iNw9HQ=;
        b=GAez8g6sJIhYYIHf/13Tc/e0ZoYaIHdNi/guGrIlcT0Mfo0QhIiXwH71ZBzJEwJDzq
         fEhp670bT0GpkkWWmXWJiWaddLEnzzEJPVOMIZPQNtsDX01W6c30OKcEKlsYAi99Rb2m
         9M1JBw7gLoaQ8JVcl+zx45Ey+AXeq6+DSnBlp6vn9hYqno4TRG6UDZn/hmcGukMAbEgo
         RpJ3wTSi9W1p7GfnwcC4OeQTgDHzzkLJuPqXZCPlJfEBNNAPAaVcztzQLA5JZes7P1XB
         G44HyEfFdBMjSlGdJI0kSvDclkHwMEcrXTlhTQL/rMkwX1MWTWiV1n9FnDWH24yPjNeJ
         8lNA==
X-Forwarded-Encrypted: i=1; AJvYcCWcQ5FbcuxN8gLl5c4n0D6pPUrFmEaaAfRRjtNYkufDhF36q6bWlG3dntBjY5YzqJsFv0MRhV5WU6015O1R4d2v@lists.infradead.org
X-Gm-Message-State: AOJu0YxQMiePLEWez2mTh65J+C+BnE0vvqWepPGPYgkbXq7OYu9VMl1e
	uh9W0y1XjHIF/KVofmBbv976braWQi8gtgM662JnbvfYUVemEUTXh4WA
X-Gm-Gg: ASbGncvPtN46c66iPzfN/gtwIQr9W3efg8dAto+d+BGt2NyKgcxJazHJRnCmO8sApUc
	gRGLeKhvKs9Rv8/eo8mV67lowwU5IuW+rOeDSi8qVa/C8QWe3iwSRCuPFTuyCjcl3iVQQ3Svv9v
	zB0J/MEMurY4H4WMbAZCPb6SS9FxTKCfkqOI0oAgagPCbualh+E2t3xLbfwhx2lhvy7+IQ8QVEm
	H3BKXi8a49IGmlP9TcBhrSaVieG0mopmhK2Dyvc5idnyDkC4T26q8Al8hunj65UMiySY7NR6oRd
	U9Z0Py3dOKhAb76wkHkJZlcaNbkqNASAvHOumKiIlTyNysIfuGWJmOfILXSkiTfKOLTSpxYktKO
	9ptaoCBph1lQZVncY5NQ4Dr9r1j10ocl4bftEsH+qW69aPFGTKqwWSvqsGX76WnE3LJmV/mRh17
	PApMfaqFNVXqGwPjHWvwXpcMCO6w==
X-Google-Smtp-Source: AGHT+IE0AX7GGv6lhJRvMXNEeWItmzt9jXuqrt/pCi46xXUUO89+xvPNiTEdfoooayxRjMHduL6Iig==
X-Received: by 2002:a05:6a20:a10f:b0:243:78a:82bc with SMTP id adf61e73a8af0-2430d4d563dmr3224506637.54.1755604143798;
        Tue, 19 Aug 2025 04:49:03 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:49:03 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:48:00 +1000
Subject: [PATCH 8/8] arm64: dts: apple: t8103, t600x, t8112: add common
 hwmon nodes to devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-8-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6874;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DeO8Ii5S4xPqjwogDhDaxek/3Uge8D2U0NrM4GwGiu0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvIf35OWPVC7/Lswm+0246dyUbd1Zxr42pQtW/HvP
 ZfTf0+jjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbS9prhf1JPpHPfrn0y02IT
 93/43Xj18r2TSY5WVVNfBj4xU07m+MXIsN1CXZevaHnPd0sZgUNaERsKDvIsy0mLXdVtpNb5+tw
 uXgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044904_693182_644CA4F0 
X-CRM114-Status: GOOD (  10.85  )
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

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts | 2 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts | 2 ++
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 4 ++++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 2 ++
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 .../arm64/boot/dts/apple/t8112-jxxx.dtsi | 2 ++
 14 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 62ea437b58b25ca649e20b1072b4d835bbc17d3a..9e8c4107e65d8dc47ad2ad99af2f436613c11d8f 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -16,3 +16,5 @@ / {
 	compatible = "apple,j375c", "apple,t6001", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Max, 2022)";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 3365429bdc8be90b63c8051822243d897854ab27..b62cf16d6b73e74c3d9116730b44596be2a89ea0 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -48,3 +48,5 @@ hpm5: usb-pd@3a {
 
 /delete-node/ &ps_disp0_cpu0_die1;
 /delete-node/ &ps_disp0_fe_die1;
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index 22ebc78e120bf8f0f71fd532e9dce4dcd117bbc6..2cb38861c3855e31c9b8ab66fe69b818c381c604 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -121,3 +121,7 @@ &fpwm0 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index d5b985ad567936111ee5cccc9ca9fc23d01d9edf..7e551e8660c9c2b51f021b1188680c5cce9d2951 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -128,3 +128,5 @@ &pcie0_dart_3 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..f5b8cc087882d6bd2b0f4f2711844d2a0fa8b604 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -61,3 +61,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6776241bf746d3458766e44e3639a..abb88391635fa048c196d0631d90405519ddd178 100644
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
index 97a4344d8dca685708aff136af92a1b316f3c3dd..491ead016b2193f123f4ded9dadf85ebf37cdc7e 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,5 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4861544e20c717124ede3327be010..c2ec6fbb633cc6aeec2322f295c054998fbf08cc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -75,3 +75,5 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 152f95fd49a2118093396838fbd8b6bd1b518f81..20e85612ae70c116cab788f2c03f5a7d76cb19be 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -48,3 +48,5 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 0c8206156bfefda8a32c869787b2e0c8e67a9d17..f711af410a2edf7587ff091e195c5cf243dc8a34 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -92,3 +92,5 @@ &nco_clkref {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf89ce73e3486bce504f1f5f8003f3..500dcdf2d4b5da698ee0798f37f624ff70e7b9f0 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -78,3 +78,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be498ace6906b936012e01084da702..11db6a92493f367cfa64be5e844c80e99bdd325b 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,5 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a8fe7966f5541f24f03a379143cfb..a0da02c00f157a0e667b26aebef9157636b14ecf 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -133,3 +133,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 6da35496a4c88dbaba125ebbe8c5a4a428c647c3..6e54c1fb097e8f72cb4fb37e491893a7e3d7e6c2 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -81,3 +81,5 @@ &nco_clkref {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"

-- 
2.50.1


