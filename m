Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B813FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hq3Pp51rFwOFBTS6gKQVsSs8Eps1DcwhteoxOcUWwbU=; b=ZhLjC2RdWH4T8aqeurEW9hL0Ko
	gX3w01iztG3edg/Wj9snNIChnHCk/zvDK0sZwUOnuAq/IjkgG6UYXa7GgleeYp6FU9pSw3P4u05pd
	8V6n/tE7NmCsBrDinqmrKp7jSgqXeP5XFSe+2tBLYrj58tGHO4DQqzYuRHxiLOFogpm4bicfA23RK
	tXVy3K950oGZrWrZhuM5InjWIDu5fHwzsdhgosEFVX1fDdgGFWEK2QnlPtJCGUZJ81WIXHpqLfuow
	8Ro+trEH466osIMpeUkM76SoLj5PTvvPSlH2gy14pTCQixshrMaWM+pd7PHQmm0jrM0DvQFdUi6/P
	vV7Y/Pew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHtZ-00000000yUq-0vWK;
	Fri, 27 Dec 2024 21:29:21 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHq5-00000000xsq-1U1g;
	Fri, 27 Dec 2024 21:25:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so13323722a12.1;
        Fri, 27 Dec 2024 13:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735334743; x=1735939543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq3Pp51rFwOFBTS6gKQVsSs8Eps1DcwhteoxOcUWwbU=;
        b=VNV0GkHgxvEsAQjZTlAeCxymps44skAQoNVoHemjKYcmVMbET/+OAZNXoh5iw5Hy/F
         sAgoPe3skkm/0QyUZfJ5tA7ohqzd488HVplnkcw00uzyhlSoQAm8s4FZG5lEK0wJGgXd
         KjIaAAPilykPj1doAIo2a1VM9sN2PzGqpAKrjGWl1bO2HyBP/jWlIs3s3D31oyFc66Qd
         4mmBr3wxjB7nRSMAco/sBRmCXHu4B4qy1flA9oMty/1APc1Gcl4CEJcMcCCunHKNwUcF
         uYrn/z7PQFyf9mV3dmkjKWWnaP0X/eQIEuqOsAt/axH77ZydAvEWUboYuXPoQPzdynsR
         d5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735334743; x=1735939543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq3Pp51rFwOFBTS6gKQVsSs8Eps1DcwhteoxOcUWwbU=;
        b=vh32ow9fT0OJ6lB8kTalKKXBdJgBkB/t8HhmAWWeWTVq2AmRaBMUIVBit04s0AkH2O
         25yuOTbxUrtR3onmJKxPaB9uPuGmldTET3sdvnUaS4tIy5gYepHI1Q2g8mZTMQuCNkGc
         wGtkBYi6kz8J4+dEdKJiv9eqZh2Q3BW16OXFNgb+gmwuDD1dUiRNd9J54cG5Dmea6u8p
         HRGQem9g9bbD8miCnuxvh0g3dTTPqdRFGbAwJHRq5XjUXuWUpd8wWqLKS/UE6IDZ0IL9
         EFEAhZj+/RzODht0GbPzDNySxlHh2Eogr5l3Pqv5UqzwiXn2YTuZ/A0WTe9H/MISP2zK
         R3pA==
X-Gm-Message-State: AOJu0Yy7HdVUWC6PBr6FR3gt7hP3KJ/UTwOIRSSUuSBJcBXgvCJ+tc4G
	aAy9bwPrldCeWX9JLf+4haHNrqvnmgoh7aBrxj6NKUnzZHZNcHb4T8TKHA==
X-Gm-Gg: ASbGnctp90Q+YadOqNkED94vmhANOMcTu4sn8ihj4FrGdkvuzlod06N7xeGowH8RrpW
	m2bohDwhJXn/QxCbhA8oaxk2rafINnFcNuu5NFkq0+pSQlZVwqg/ItBcNDMTWASVYnxtNkj64Pw
	RmeCoaMDlZmjHAhDfJlW7UvV6eGT0PcB9JRmzD05V0EXQMTdOADVaDUVJ64UT1NmJTbomYsvcDg
	eUPWHjMOPcovLYdSnklXcT77eLj+Ll/YzKGYAGZvfBITFO6sDUjdelkkPWRxYzDi54BehBolujN
	D1lWhaWwDZh5vsA+YuTmxFrdqy5XsHO041SaoOgjSD6xFCr3X/cVcy26BTJO17upkDk34gk+E96
	kfblRFzp9gFuQ2DuXLWpSNZql5Q==
X-Google-Smtp-Source: AGHT+IE/gPijdoDzjjoUUMlREXLzOGk06s31fEZOuaqJ+0cfbP2MBhEf0Ezj2q/xZiBbAGE9sVR33Q==
X-Received: by 2002:a05:6402:2790:b0:5d3:ba42:e9d5 with SMTP id 4fb4d7f45d1cf-5d81dd8fef8mr22819469a12.9.1735334743258;
        Fri, 27 Dec 2024 13:25:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b2be-ba00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b2be:ba00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbc5sm11627950a12.60.2024.12.27.13.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 13:25:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/5] ARM: dts: amlogic: meson8b: switch to the new PWM controller binding
Date: Fri, 27 Dec 2024 22:25:11 +0100
Message-ID: <20241227212514.1376682-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_132545_398488_1E36E7EE 
X-CRM114-Status: GOOD (  11.48  )
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

Use the new PWM controller binding which now relies on passing all
clock inputs available on the SoC (instead of passing the "wanted"
clock input for a given board).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts    |  2 --
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts      |  2 --
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
 arch/arm/boot/dts/amlogic/meson8b.dtsi         | 18 +++++++++++++++---
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 18ea6592b7d7..236999548094 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -443,8 +443,6 @@ &pwm_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>, <&xtal>;
-	clock-names = "clkin0", "clkin1";
 };
 
 &rtc {
diff --git a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
index fb28cb330f17..0bca0b33eea2 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
@@ -162,8 +162,6 @@ &pwm_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>, <&xtal>;
-	clock-names = "clkin0", "clkin1";
 };
 
 &uart_AO {
diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 2aa012f38a3b..1cd2093202ca 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -347,8 +347,6 @@ &pwm_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>, <&xtal>;
-	clock-names = "clkin0", "clkin1";
 };
 
 &rtc {
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 9e02a97f86a0..0876611ce26a 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -403,8 +403,12 @@ analog_top: analog-top@81a8 {
 	};
 
 	pwm_ef: pwm@86c0 {
-		compatible = "amlogic,meson8b-pwm";
+		compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
 		reg = <0x86c0 0x10>;
+		clocks = <&xtal>,
+			 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+			 <&clkc CLKID_FCLK_DIV4>,
+			 <&clkc CLKID_FCLK_DIV3>;
 		#pwm-cells = <3>;
 		status = "disabled";
 	};
@@ -674,11 +678,19 @@ timer@600 {
 };
 
 &pwm_ab {
-	compatible = "amlogic,meson8b-pwm";
+	compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_cd {
-	compatible = "amlogic,meson8b-pwm";
+	compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &rtc {
-- 
2.47.1


