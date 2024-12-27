Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0DFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPy7o890B1hnetKOjzEFvvu1NGrPASXvtZeeRfzkmm0=; b=2m7mLFWgrU6QjIs8hOtkFDP65E
	5B9idt+I5MvPkbWD+GI2o/s8t/tuNuyL+w5lCyV1s25l5G20nlNc852IAaGszsAvl3D6RuvwTKhyB
	X7wMgVXOrLYCdPTtruEZc5sTwqXSEEHJ6Afop9G7USWXoi/pz3wchRZGkXcRqqV9/Jgz/hcjEjVJO
	aNXKMeOnwrylndrLfoLRgJeTH++OGeNx1v7x9GUCn1z7H07iSTDjhOPGfWaDqfpFCouJ3ltRnddmU
	UPVxUp9Bi4pinyPxiWMbUiQt/p5OvTQpTClbZzhkr5A/0h+RK40U4ZgTi5MC6yLHLzv9DrKIPmlzp
	BbibJsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHuj-00000000ydg-15X9;
	Fri, 27 Dec 2024 21:30:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHq8-00000000xu6-3WJq;
	Fri, 27 Dec 2024 21:25:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso1056566066b.2;
        Fri, 27 Dec 2024 13:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735334746; x=1735939546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPy7o890B1hnetKOjzEFvvu1NGrPASXvtZeeRfzkmm0=;
        b=NvkASpQqiRbpDje7SYFvXu41iowsfDKEmVt3bRWsTN9ss5GsyLAhUfJ5wr/IiVwlS+
         /8INb0fauV2w/rrPY2T4S0zDokwAFvKqYoijcOerN6mvffc9pM9iMhXYQAEmo2gw3llp
         kLoWveDaPcHcCFdEeVyAV207NzpYfQ81dZ49pxCay3IJc3f67J1L4tnHLiNus+gPV8C1
         NxVVOAMB7Ehmi9gA7O8OJtzxsIojHSCUTDDJ0jnmSUpB3oN8MVn9NgnImXGCF0HZhu0q
         U1a8aFY1rQ6PTxLdpT/YwFy6iaCzJ0GVoNTZjKhPDaM87qfnf8FUMocisBY3wkwEq70t
         sYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735334746; x=1735939546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPy7o890B1hnetKOjzEFvvu1NGrPASXvtZeeRfzkmm0=;
        b=k3lhwZTkwShdgDsY5J0RYJC6EJNhCCLlZ/sMsNN2dD4aRDpyV9opjVPpXuiqhtDR4b
         NkpB9cs6Ih/e54ieeLi/y0sJrujZ0A0ORIhHaC7+Q/vbBisBlqAPbecbXEQUvp0rsJif
         S9Hw7uXA1xDGGeR/2m5Xpsj8KrhbN29mYJ6xp+oa9b8z6XcOCENA6833dtsN3hSkamvS
         DBOqWWWtUar+XtbsJep9J4TOVJEjOweGa9uQfKuxQA5zl1LG1aRzFUO1TN5bDc5Vsmcw
         2V/5tTTr3HZEr8bkbgc7kEflKSwwrCVSIwl8mVKO0trx/fPwYpglYk0rFCnItl4Eyi7X
         rI0A==
X-Gm-Message-State: AOJu0YxvupigoNPmyaSWTlQtP93pBDAxhY3su0/fztl8eE2AZg+TJo6O
	5kEZ6XwA7eJV3sLpSON4bxBuPXDKbxm3uWBwMU+iH6/38WuvTvAxuOrrrw==
X-Gm-Gg: ASbGncs3Cm3Tnbzt7mUWsdSL2MbDpJkgs7uHJ6fUqbm8UqMxxGoznvlVu5rxiLwKmZ2
	H/Z7qmbUN2kmv84EcOawB6OY3kfwI9/ZEJWFUHg32Rc/baV5a0DBdYt5727XojoKxhC7HilHe44
	1H2kP165ABpTfIyNOuKfkVhaB4OUzSP3iOb8nbwP3GMLVcavpkGlBe21md7g+Xd0a0TNcRVPC2N
	uyyvwpB+ti2ZQl9Z1AhLC4TG6zBnwAszYxTsguQolzScJuIAmk5ils/zE4dACSVFTyt0tqsLOWS
	U642/twGUPxEPTY2iaFHR79cfyWmX5BfInp5FU7tOaZ6ITM7+rlZJMJrlVLFFRw2nTa8IFqYuk5
	1iUamxWPZA8b5tuETKFcIPW8drQ==
X-Google-Smtp-Source: AGHT+IGwvkeINNYEAGKLq0cWzHRLbP1E84zmmITYv95ShFIlDCkszjudHI/QU5ZyJkd2tqERiNT0Uw==
X-Received: by 2002:a05:6402:2345:b0:5d0:d491:2d5e with SMTP id 4fb4d7f45d1cf-5d81dd83ad1mr56585606a12.7.1735334746094;
        Fri, 27 Dec 2024 13:25:46 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b2be-ba00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b2be:ba00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbc5sm11627950a12.60.2024.12.27.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 13:25:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/5] arm64: dts: amlogic: gx: switch to the new PWM controller binding
Date: Fri, 27 Dec 2024 22:25:12 +0100
Message-ID: <20241227212514.1376682-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_132548_885331_E8A22B67 
X-CRM114-Status: GOOD (  13.28  )
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
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |  6 -----
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  2 --
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  8 +++---
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  2 --
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 --
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  2 --
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  2 --
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  2 --
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 25 +++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  2 --
 .../meson-gxl-s905w-jethome-jethub-j80.dts    |  2 --
 .../meson-gxl-s905x-hwacom-amazetv.dts        |  2 --
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  2 --
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  2 --
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  2 --
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 25 +++++++++++++++++++
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  4 ---
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   |  2 --
 18 files changed, 54 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index d38c3a224fbe..2da49cfbde77 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -345,24 +345,18 @@ rtc: rtc@51 {
 &pwm_AO_ab {
 	pinctrl-0 = <&pwm_ao_a_3_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_ab {
 	pinctrl-0 = <&pwm_b_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_ef {
 	pinctrl-0 = <&pwm_e_pins>, <&pwm_f_clk_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 45ccddd1aaf0..6da1316d97c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -240,8 +240,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..7d99ca44e660 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -329,14 +329,14 @@ i2c_A: i2c@8500 {
 			};
 
 			pwm_ab: pwm@8550 {
-				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				compatible = "amlogic,meson-gxbb-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x08550 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
 			pwm_cd: pwm@8650 {
-				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				compatible = "amlogic,meson-gxbb-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x08650 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -351,7 +351,7 @@ saradc: adc@8680 {
 			};
 
 			pwm_ef: pwm@86c0 {
-				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				compatible = "amlogic,meson-gxbb-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x086c0 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -498,7 +498,7 @@ i2c_AO: i2c@500 {
 			};
 
 			pwm_AO_ab: pwm@550 {
-				compatible = "amlogic,meson-gx-ao-pwm", "amlogic,meson-gxbb-ao-pwm";
+				compatible = "amlogic,meson-gxbb-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x00550 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index cf2e2ef81680..2ecc6ebd5a43 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -298,8 +298,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 7d7dde93fff3..c09da40ff7b0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -241,8 +241,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 /* Wireless SDIO Module */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 52d57773a77f..b463d03c3ed9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -150,8 +150,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 /* Wireless SDIO Module */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 3807a184810b..6ff567225fee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -222,8 +222,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index deb295227189..bfedfc1472ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -185,8 +185,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index ed00e67e6923..8ebce7114a60 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -739,6 +739,31 @@ mux {
 	};
 };
 
+&pwm_ab {
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
+};
+
+&pwm_AO_ab {
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+};
+
+&pwm_cd {
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
+};
+
+&pwm_ef {
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
+};
+
 &pwrc {
 	resets = <&reset RESET_VIU>,
 		 <&reset RESET_VENC>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index c5e2306ad7a4..ca7c4e8e7cac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -280,8 +280,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 /* This is connected to the Bluetooth module: */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index 2b94b6e5285e..4ca90ac947b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -116,8 +116,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
index 89fe5110f7a2..62a2da766a00 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
@@ -115,8 +115,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 /* SD card */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index a80f0ea2773b..4e89d6f6bb57 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -211,8 +211,6 @@ &pwm_AO_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_ao_a_3_pins>, <&pwm_ao_b_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal> , <&xtal>;
-	clock-names = "clkin0", "clkin1" ;
 };
 
 &pwm_ef {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index c79f9f2099bf..236cedec9f19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -145,8 +145,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 /* Wireless SDIO Module */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 7e7dc87ede2d..b295f97021de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -101,8 +101,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f58d1790de1c..2dc2fdaecf9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -809,6 +809,31 @@ internal_phy: ethernet-phy@8 {
 	};
 };
 
+&pwm_ab {
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
+};
+
+&pwm_AO_ab {
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+};
+
+&pwm_cd {
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
+};
+
+&pwm_ef {
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
+};
+
 &pwrc {
 	resets = <&reset RESET_VIU>,
 		 <&reset RESET_VENC>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 96a3dd2d8a99..2a09b3d550e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -289,16 +289,12 @@ &pwm_AO_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_ao_a_3_pins>, <&pwm_ao_b_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>, <&pwm_f_clk_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 &sd_emmc_a {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 7356d3b628b1..ecaf678b23dd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -192,8 +192,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
 /* Wireless SDIO Module */
-- 
2.47.1


