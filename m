Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3581C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azgIPPvnb3xo8w6FQBxsN5Kr8m/w1ZbCcc3sgLdo0JI=; b=AP59EoX1oosDgLwvgk+sBthKSh
	NkXGatiJMCoy/I2Djmrj7vEAfvbtZ4h/qjBM39gumJjwDCgjVC1CJjc//3FpqkrTtBRyKsqH8TbDD
	QVc8zyYOD7Us6Qck3BKc3YwenOkEzlVvJOj7p/99af4KyFZWRGFJCQajTBmPruRP1xJrf2iitr2/A
	Z1vZlG23WSYaSHOze4hS64Y+AwcCCBxWeOaSndvkwnM1kRdF9Kmr/tPc/H9+bZY6ZdcyVxGJszpDa
	IPZYViZpBJPmSrycHEzECU3BhpkfeWND9TdjlsovHQkDy2a9P3lRQtzFRkQl/qFCx/rjbFFUjj5LF
	ig35wjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0ni-00000006Eo3-0CFx;
	Thu, 06 Feb 2025 12:16:10 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0eh-00000006ED3-0MWz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:06:52 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5dcf0de81ebso1230004a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 04:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738843609; x=1739448409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azgIPPvnb3xo8w6FQBxsN5Kr8m/w1ZbCcc3sgLdo0JI=;
        b=ZbNmhT2iHjrVcdkSetNsgdF80FugOMIzWLswUAMFBXX0VtrZuMx8RZOpFv7O72vF51
         BnxUIExGYp7tL7LH+LXYhHXQkjtGsD3IqMl2ACS7Y137jZuKtKNrl36bfs+qXMr6KO8W
         ikHlKDeqmDRUXi4OBu1C6VtCpOc+YmIcfENzN9xHAPKE+cqedZwBpgzNbNXYzNWD5g1k
         mnFfxY11TLzcnwQqqhrOKr6zQE+8gO0Vp+XGDfilI37/V1tHqH834lwwiPi05dkPesCM
         3u9nkG1ZMf46LDl2y8+JAc0mj9+BzvP/6OTkiV/6gArdkca271kcP+KGo8rjboA8Svh+
         pFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738843609; x=1739448409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azgIPPvnb3xo8w6FQBxsN5Kr8m/w1ZbCcc3sgLdo0JI=;
        b=WAN7DdeQgkGH80ihIiIxCLFXTrj4FthzTfkiZUENIM6PQeAvv31WY26Zy/ece+qXXx
         yyPgmnKqiEhXTwxzBmWJfZXrb/w0mC/xSvOcdWIc9X17YoOjP3b8Jpqf30iEGvo4kDDa
         WX73Aa5WfNfS7ctQlgHpknC3jXWQ0ANnwzV+QKkGRCo/9uPelEEfFbFZhHCJaaww2EEV
         3+7FkX6DlrGEaRvYb44hJiwrCJm5ihpqWKX7OHCT0sgl7DrLMp3fV20UyfjoHsEA7QYQ
         JXHbDoiqvXsYkmSp+TPCRjwRWf9uNncbibBXYAdmWInGbw+ZmeoSEXAg8Nrq0TBtPAdC
         6YOw==
X-Forwarded-Encrypted: i=1; AJvYcCXbqu1vRow5dA9zLsm2Xoh42jeTH+/kP5W0k223dXSsOjmfDHDytGjWXlF2CHiyBWdyVbOhUdmdnPSF5zqUS8t4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1gV4dN1rmjqTbSwM/YzxvsU2UdxRcIbtqC8MSPC71dVBDz48G
	MCtW/7eNcqtyxhD0CfslCbOyqdDER8vV8NPFE12vl/gjS0EPhdIp5CNb1hlU30Y=
X-Gm-Gg: ASbGncsx1N5KrTLMt5jg52p7mUY2SS6H5WQsk6JECyKWhil0ufh+RPci0uOoA+gtJ9Q
	FAHVMI3Vx7m9tfPe2Uvxq7/bdZGqj9nvrtKFl5r27eIZ5TK0tMHE96OJ7uTaW8LOdJQUsm4psUB
	w1ppcb77/OJb3XeGKklJ8lAHsJniFMjg3KeqKQNrgk78rMh1KBeZX4GnLsDh+moRDSaRrFTwFR5
	yCERj3dE30sf8986g76+0LShRV2bTJbkM2f/3cf9wxkzh642IdpKx325bDAbxXgJpwIOX3jjjb1
	ucWSv8PCF9VI6TWENorvUUTAklIxyDtg4YrHR8vZlvxIF2qG3FSOaTJkLQ==
X-Google-Smtp-Source: AGHT+IG5uqRw3jqoLLEGSCIgSLFJdBnS0MRDiPp24UX/D9Hd8p8T334IFdUKb4jPzFuoHC/yaN/s3Q==
X-Received: by 2002:a17:907:268a:b0:ab6:eec6:7cab with SMTP id a640c23a62f3a-ab75e2f1177mr683407366b.38.1738843609230;
        Thu, 06 Feb 2025 04:06:49 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e718asm89556366b.99.2025.02.06.04.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:06:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] ARM: dts: pxa: Use #pwm-cells = <3> for marvell,pxa-pwm devices
Date: Thu,  6 Feb 2025 13:06:27 +0100
Message-ID: <f5ae474c74f43d0002d45f77b956f28d5b1f7ed1.1738842938.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
References: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4137; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5+DEXbonSTYjkcktKvLdRgdRfeSdfMjc1Rj9POliA3E=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvQlS08kl1+fkjvrR20le+KLGfPtNzVIvF8ubbQmX9Rg3 dS99mKvOhmNWRgYuRhkxRRZ7BvXZFpVyUV2rv13GWYQKxPIFAYuTgGYiLERB8PuL+kbPlhfvGFy i/Wx3hkrtivr1Br69n0J/R5/dE+63wWPkxINYWw8Mn0LMl6uyrbQkknJK/FOvCUiv17X+cLclL0 7lB6tuhezekLJaYfmR4ov128xeOtfyyas4WgXEsidJ59x0++nmOurMyv3pV9++MfKgcff5tJWto VSJ/qtelbpruIU5I28Vp/Q9u3/7JWPkkJy9ywNkzK667dZfjeXzcMz7dGaJfs0unOD2xR5MmWV3 r8RdFw9pfZp9Ho1s2+eft4v8kMsmxtLO6bG85a4h/X4Rl6se6IseODqyVixF5sDqnw1bVxZi8WP i88XXqTUVKIwq0DV5Yv+vCJ7efM32/NEru65mZ5RFqYHAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_040651_123152_C63362C6 
X-CRM114-Status: GOOD (  14.35  )
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

Tested-by: Duje Mihanović <duje.mihanovic@skole.hr>
Reviewed-by: Daniel Mack <daniel@zonque.org>
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


