Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D84C02199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0qvYmPCyPNFC5gLGw5pr5m26K+35wbL4YftBfSGxVs=; b=FcOjGgDih5n30ZIt7G6nAAsvED
	OvIXQ6Y3uxWJczcKs6mnG11uTlh+xGTiUQtFgyUUo+s/mUszcB+yDXSZH1J2Uo/Be9kNdQ/SRCsAi
	0NQWRfBMn/gui+h8r+DHduHqebq0P2bGkYG2DYc7fzlPiG0MstCsB4Ow5/tHK4laFIa6FOOJaQGHa
	VVUOhn1XC826bjAM5DHcnQS9ilhCcuP2un3lQq9Axd5KbL3MUFxwlgLEt2h4k6P3Rjn3b1EvrY90g
	KUfQ7qbH/ibKkf+YVX3XiB9EJXDVNG84eba/wuBChvz+V/yhh/vQ9daF0wEY5c6tu/VuvjSrPL1Ea
	IQtQ6ngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjjb-00000004BhQ-2J8X;
	Wed, 05 Feb 2025 18:02:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjbY-00000004AuH-1qIn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:54:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab6fb2940d4so218741866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 09:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738778067; x=1739382867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0qvYmPCyPNFC5gLGw5pr5m26K+35wbL4YftBfSGxVs=;
        b=RPkhyrVu20/91+SCrAf3r/ojFUiBwDWI4uKxhXKBVJzQ7U4NYsvjqFV+NlHpPE3q2Z
         IMo27BIsLxoOMexuufdpfEdkj9mt4d29lamZI6gNU5jxXLmK6VXIxVx2uBoMH22C2dMd
         zeeAxqoy212aXw17sfCX5Ed5G61WtKuHtUDHe5KEnl0IvVzhn4SwWCrV2Nm6tUvxtpXo
         OF6FS05MlOfhMpe4SJp5zGNFPv6qx3cwsqjTxgvrTwAeWaZfBWVAnPxj08Uz/qkXskVB
         hidT5XGbNVO9MoyXMjmOu7bzdR1EIm1TQFAUFT61kMJiFwe1+VNvwc0KNAJ2mWjvI0dm
         ZFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778067; x=1739382867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0qvYmPCyPNFC5gLGw5pr5m26K+35wbL4YftBfSGxVs=;
        b=UsGlUkFKLBGP/rbm7jWI2M2hwbTqDm1QYNWDIz0Ubzl/hPEuZLGhcdiAR5o5baO3SN
         2RFKhMrNJERzFfOTIyBVcl+ymrDDkmTFbCPZTMIzCYGCLqyypBlQRsrzVGDSi51LkjzE
         o1anMnEZ3BL3qvI7eDiH3qGQRfVlGECsro3E0Fdp2JB8TTOUHohKK4HcAa4pnBrjoprq
         B2JuKHfk80XzV1MmJkXFTX6b9nEJAdR542IuUpSwxelvLgf5FVgQrkrmYkk6UQ393n+k
         KRaI4TlKUvk4GKyphGJAPQj9+gbOm/4GAR8CEobXXJauPUd3Jr2V38g/hqxovXPF/+iU
         hvew==
X-Forwarded-Encrypted: i=1; AJvYcCXI3j/8GRneln57NCryOWisR8jZaBA5AtUBJKKN3mDMmArNtkGhcQ4h0h3eyJZQ21mAg/KgFJ9TKohpfPiwHUlP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzenyl802QIUOtj4qU79lzwc1Oo5boUR7icbcRjBNeo4CWQ5n2Y
	xmglJ3ZwsyXTTwYu5eNCa6hXMxZtajEwAhJImkrLE4tjcs++U4z71r8oQ02JOjhnDScJ5u88A9Y
	pJ8g=
X-Gm-Gg: ASbGncuqDDJjbbQdjwY6t/P2f91LISubMsRXnkm4bfbS0CQIF2iMqkatSM+fnufdGgJ
	cBLxbHgasFKs14Oj5giV0H9ZoOBmUBZt/zJXMo3yAZCMoHzqyzJmUqab16pUbexYtAUBMeEZnod
	5gXuJF7pkTcWVy3WEcg1vpzzx9zH8QbEk6uovuIxCSA2d2VxdpVGBdShYdRwmoCM0RRvzTTinDa
	Z9T3k25N+Ax3CXZUaXxdlc8tH3aGE+aEizOuwwZt3Wb1Q38VKUWT3mYpGrMH0uEp315WyimTTCm
	GR30WHI6isEAcquOi+gidQkWJlRMaqX/NbloSmPXvC4DOUfC6s9O2Dq7ow==
X-Google-Smtp-Source: AGHT+IF92wMPufEGt9cvnv832yheronJqrKc1D31ugycDeyrAicJl2GAOxWT42IXWDLHshxUJkJSnQ==
X-Received: by 2002:a17:907:7b9f:b0:ab6:ef92:c238 with SMTP id a640c23a62f3a-ab76e9876bdmr31149666b.20.1738778066758;
        Wed, 05 Feb 2025 09:54:26 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5b5ebsm1131303866b.181.2025.02.05.09.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:54:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: pxa: Use #pwm-cells = <3> for marvell,pxa-pwm devices
Date: Wed,  5 Feb 2025 18:54:02 +0100
Message-ID: <9722b7efc8b9dfeac6ded6302e026f538cde9518.1738777221.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
References: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4037; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iBU9OUHxDFRwrkGtwor16WU4NZhH5SNhALBCHkrsTmA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBno6W/v2o83YpyNGfd1Rl33qRbjwDiFw+kiB5NO 7QJ/ueiAxWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6OlvwAKCRCPgPtYfRL+ TjimCACv1XnU/EyqtKVJ7VMA0V++XPrQAxgKrYl92evq7HhjlahPkqlzO6fTqUUSkmZOicDP2Et RrsaWMsd7hA1yIZ4GJotAhKIDXOnQ1Ujol08cJVsdgqQmLxWeWf7rqq4POxE7kjegWSbPk9EhNW ewx4DQPY9PYODSmPoRzpDODC7nC+v/hotdTSCdYG/i1P8F+sx7TB953LdLlHnTHuA1ge7R/WLhq u56rGSqjyR2N1aZ5OLDCpRtjO4EcBvqdLlU139QbhlFTU+qcg4YpaMOgX9RfvQUktJ3XIg8G4AS 59lL5JfYfzr6qGEPQUgpPBssvXuddxVMYc8bKSvOEcpWP3PE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_095428_486894_DA840374 
X-CRM114-Status: GOOD (  14.39  )
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

For consistency with most other pwm bindings, also use 3 cells for
phandles to PWM devices.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/arm/boot/dts/intel/pxa/pxa25x.dtsi                   | 4 ++--
 arch/arm/boot/dts/intel/pxa/pxa27x.dtsi                   | 8 ++++----
 .../arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts | 2 +-
 arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi                   | 8 ++++----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/intel/pxa/pxa25x.dtsi b/arch/arm/boot/dts/intel/pxa/pxa25x.dtsi
index 5f8300e356ad..d25065caeebc 100644
--- a/arch/arm/boot/dts/intel/pxa/pxa25x.dtsi
+++ b/arch/arm/boot/dts/intel/pxa/pxa25x.dtsi
@@ -67,14 +67,14 @@ gpio: gpio@40e00000 {
 		pwm0: pwm@40b00000 {
 			compatible = "marvell,pxa250-pwm";
 			reg = <0x40b00000 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM0>;
 		};
 
 		pwm1: pwm@40b00010 {
 			compatible = "marvell,pxa250-pwm";
 			reg = <0x40b00010 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM1>;
 		};
 
diff --git a/arch/arm/boot/dts/intel/pxa/pxa27x.dtsi b/arch/arm/boot/dts/intel/pxa/pxa27x.dtsi
index a2cbfb3be609..ed07b65cc362 100644
--- a/arch/arm/boot/dts/intel/pxa/pxa27x.dtsi
+++ b/arch/arm/boot/dts/intel/pxa/pxa27x.dtsi
@@ -49,28 +49,28 @@ usb0: usb@4c000000 {
 		pwm0: pwm@40b00000 {
 			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
 			reg = <0x40b00000 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM0>;
 		};
 
 		pwm1: pwm@40b00010 {
 			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
 			reg = <0x40b00010 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM1>;
 		};
 
 		pwm2: pwm@40c00000 {
 			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
 			reg = <0x40c00000 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM0>;
 		};
 
 		pwm3: pwm@40c00010 {
 			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
 			reg = <0x40c00010 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM1>;
 		};
 
diff --git a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts
index 12b15945ac6d..9094ec422577 100644
--- a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts
+++ b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts
@@ -56,7 +56,7 @@ backlight-controller-pwm {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm0_pins>;
-		pwms = <&pwm0 10000>;
+		pwms = <&pwm0 0 10000 0>;
 		power-supply = <&reg_vbatt>;
 		status = "disabled";
 
diff --git a/arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi b/arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi
index f9c216f91865..4e69b4da0ba6 100644
--- a/arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi
@@ -224,7 +224,7 @@ usb0: usb@4c000000 {
 		pwm0: pwm@40b00000 {
 			compatible = "marvell,pxa270-pwm";
 			reg = <0x40b00000 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM0>;
 			status = "disabled";
 		};
@@ -232,7 +232,7 @@ pwm0: pwm@40b00000 {
 		pwm1: pwm@40b00010 {
 			compatible = "marvell,pxa270-pwm";
 			reg = <0x40b00010 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM1>;
 			status = "disabled";
 		};
@@ -240,7 +240,7 @@ pwm1: pwm@40b00010 {
 		pwm2: pwm@40c00000 {
 			compatible = "marvell,pxa270-pwm";
 			reg = <0x40c00000 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM0>;
 			status = "disabled";
 		};
@@ -248,7 +248,7 @@ pwm2: pwm@40c00000 {
 		pwm3: pwm@40c00010 {
 			compatible = "marvell,pxa270-pwm";
 			reg = <0x40c00010 0x10>;
-			#pwm-cells = <1>;
+			#pwm-cells = <3>;
 			clocks = <&clks CLK_PWM1>;
 			status = "disabled";
 		};
-- 
2.47.1


