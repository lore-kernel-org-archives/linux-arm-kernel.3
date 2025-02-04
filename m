Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DAAC02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=; b=JTpc1Za5KbTen+TvV7kmP+Ml/Q
	8vcicTqXDoea+FKMG1r81til8l/xlhD9hBnw1d3TzxL5yHEjnkj8xxc8G5EhpKsEOVMxzzl8O00dT
	bZXxZJ+E/ytglf5Hn89lVEeKeDtB/5XHBU7KlD0578PqPf1UtU6KgGCFz1Yw6Ot/jmHPPp0ETkl2r
	CYmGeNeXI+D5RGvVJ+e7Ma9zP4G/CLVUvfpCUhMqLhgBGMkwDfO5tDl+Y37KYR3mjrG8khXAgBGEF
	j0zqF98EGYJnHLQycl1bjknxJfvMEcjfJCFhuTpyLJ9Y1FvD/Hm99z0j36jt3Uu0Ch/01wY9Fm3nW
	d8kO7Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMpz-0000000173u-0Kh4;
	Tue, 04 Feb 2025 17:35:51 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMjW-000000015uv-2rBM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:29:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dcd3454922so889391a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690149; x=1739294949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=N162RyNvYVXoSeQyZ9fvKDl6Yqv+W9derJCdjp7wLryyRZR7QgtSLTVUQ+m+5VV1Rd
         t53L/kIg+yjyBp9wHNQF1SmCxK+eNr6DyNpsWBHviR6xZm2RzD02DanWEOse2o05H6kZ
         CloK57wcfxk0DISUmkGRWiugR1/gIVyYze9+aSIt6rh82+X6rcs0aC4FqEN4/ynZtki4
         W0LQ1WeO47Kp2SrhH680WvFWq8SmGS8PB71c4QriYuz3EcuUmkL6oqQaRBG7NUPSc0Ta
         /wRVc7kHKmdOUhwvI9F1F6gm4lXorr6gwHUY7Dk9C4G2TF36Bt7DplqYLkaOAlmIAQ2c
         SURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690149; x=1739294949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBre3tfK9eNw0D6ztWoJ2B8wDlLW7jzGaVQPJWiVrhc=;
        b=m7NnUUV3U33be0kE076G9PdiqhJ7TViMc2kBYtvJgGnRVggCHdLfesv9EXrrUtQhwG
         zpImxN+oHVcTIlTWmLez3x1Mv/uTDimxXZHLk/Wzp4gD5lfI2lbZvlz+J6o1LIw8OtwP
         7MCQ4PgvuSgTA/sHSc1zRzxh6vKnG3ChHTfJJghYICCy+0oNV8S2RUzK0qaXkfE9mF0L
         4umszKwEv5HlvUUvDIzw7lE2Gocaq6DR/8wnfNvfWLQmWvaOUWvrb78cGD9HaANsV56L
         QAKduyDeAkKPH2yntW3jfQnz3U70ONe8rhnG/gTQjYOVmTaST0IqSoJ0PvgK7BHGRXlo
         YKcg==
X-Forwarded-Encrypted: i=1; AJvYcCXtceaxUBZAJIcs+YRUEuVWzA6/3WUK4URn8NIcn3EOl62aPys7cj1s4d8jUIl9/OEKMjQ6jd4mM8XtjgSL4P4q@lists.infradead.org
X-Gm-Message-State: AOJu0YwcGUBjS8YMOHk3b1csFpAW6qkR3UibwE3uWAzIXs2YPcWNMq6+
	4dbSbuU7KuQTHuFWz9FVbesIzcSomQwiexyKrBiwPCVBvEEw8iIGJvVqcg==
X-Gm-Gg: ASbGncuuvs/AprugcOJDT46vdF7cjOYI+ldKxO/w54Z4POH4Jef8qo4equ5gVHc3cF+
	4w31g/qRZrpnnwFhlE6dXvrHs9STfRnhtFqRmWwqAU0T0MCD83S97bQ1fCbLGEn/J6t+tJYOg+d
	L4RnVLHTB1s01QZl72TQShZs16FzmFYeaLaY965gZtE3BUeXKyW1PVeCn6hC4cUnUeG44ITk8hG
	QnVB+TvxC9kS5oanzXBk4iB0QhLG2aNrqSrn9rTtmrycrhvqMU/Jly5vTxOselCvWmhK02HN3zq
	8sNMW9v/bSjUNrOXQ0PjFcXki53xo2sMX+BEP0UsDxanCOG66k8FGqQwbJB6o1fBUIg=
X-Google-Smtp-Source: AGHT+IFu+slwz91GENh5QMjYcOh4lrpEqmBdNLas88SGUpO3WiuE6Ri0unHYb7Tl4RKE9yFsTn+Pnw==
X-Received: by 2002:a05:6402:40c8:b0:5d0:ed71:3ce4 with SMTP id 4fb4d7f45d1cf-5dc5efad984mr33079113a12.6.1738690148448;
        Tue, 04 Feb 2025 09:29:08 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:07 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] arm64: dts: exynos: update all samsung,mode constants
Date: Tue,  4 Feb 2025 19:28:03 +0200
Message-ID: <20250204172803.3425496-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_092910_723580_F78EFBBB 
X-CRM114-Status: GOOD (  12.41  )
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

Update all samsung,mode property values to account for renaming USI_V2
constants to USI_MODE in the bindings.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
 5 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index f1c8b4613..cb55015c8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -651,7 +651,7 @@ usi_uart: usi@138200c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138200c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1010>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -677,7 +677,7 @@ usi_hsi2c_0: usi@138a00c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138a00c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1020>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -706,7 +706,7 @@ usi_hsi2c_1: usi@138b00c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138b00c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1030>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -735,7 +735,7 @@ usi_hsi2c_2: usi@138c00c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138c00c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1040>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -764,7 +764,7 @@ usi_spi_0: usi@139400c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x139400c0 0x20>;
 			samsung,sysreg = <&sysreg_peri 0x1050>;
-			samsung,mode = <USI_V2_SPI>;
+			samsung,mode = <USI_MODE_SPI>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -796,7 +796,7 @@ usi_cmgp0: usi@11d000c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x11d000c0 0x20>;
 			samsung,sysreg = <&sysreg_cmgp 0x2000>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -855,7 +855,7 @@ usi_cmgp1: usi@11d200c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x11d200c0 0x20>;
 			samsung,sysreg = <&sysreg_cmgp 0x2010>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index b36292a7d..66628cb32 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -442,7 +442,7 @@ usi_0: usi@103000c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103000c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1000>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -505,7 +505,7 @@ usi_i2c_0: usi@103100c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103100c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1004>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -534,7 +534,7 @@ usi_1: usi@103200c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103200c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1008>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -597,7 +597,7 @@ usi_i2c_1: usi@103300c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103300c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x100c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -626,7 +626,7 @@ usi_2: usi@103400c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103400c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1010>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -689,7 +689,7 @@ usi_i2c_2: usi@103500c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103500c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1014>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -718,7 +718,7 @@ usi_3: usi@103600c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103600c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1018>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -781,7 +781,7 @@ usi_i2c_3: usi@103700c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103700c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x101c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -810,7 +810,7 @@ usi_4: usi@103800c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103800c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1020>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -873,7 +873,7 @@ usi_i2c_4: usi@103900c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103900c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1024>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -902,7 +902,7 @@ usi_5: usi@103a00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103a00c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1028>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -965,7 +965,7 @@ usi_i2c_5: usi@103b00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x103b00c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x102c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -994,7 +994,7 @@ usi_6: usi@109000c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109000c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1000>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1057,7 +1057,7 @@ usi_i2c_6: usi@109100c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109100c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1004>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1086,7 +1086,7 @@ usi_7: usi@109200c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109200c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1008>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1149,7 +1149,7 @@ usi_i2c_7: usi@109300c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109300c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x100c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1178,7 +1178,7 @@ usi_8: usi@109400c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109400c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1010>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1241,7 +1241,7 @@ usi_i2c_8: usi@109500c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109500c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1014>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1270,7 +1270,7 @@ usi_9: usi@109600c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109600c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1018>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1333,7 +1333,7 @@ usi_i2c_9: usi@109700c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109700c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x101c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1362,7 +1362,7 @@ usi_10: usi@109800c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109800c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1020>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1425,7 +1425,7 @@ usi_i2c_10: usi@109900c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109900c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1024>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1454,7 +1454,7 @@ usi_11: usi@109a00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109a00c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x1028>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1515,7 +1515,7 @@ usi_i2c_11: usi@109b00c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x109b00c0 0x20>;
 			samsung,sysreg = <&syscon_peric1 0x102c>;
-			samsung,mode = <USI_V2_I2C>;
+			samsung,mode = <USI_MODE_I2C>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c9..6e9007518 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -223,7 +223,7 @@ usi_0: usi@108800c0 {
 				     "samsung,exynos850-usi";
 			reg = <0x108800c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1000>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779b..b73c152c7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -161,12 +161,12 @@ &usi_uart {
 };
 
 &usi8 {
-	samsung,mode = <USI_V2_I2C>;
+	samsung,mode = <USI_MODE_I2C>;
 	status = "okay";
 };
 
 &usi12 {
-	samsung,mode = <USI_V2_I2C>;
+	samsung,mode = <USI_MODE_I2C>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb2..473db46aa 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -825,7 +825,7 @@ usi_uart: usi@10a000c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
-			samsung,mode = <USI_V2_UART>;
+			samsung,mode = <USI_MODE_UART>;
 			status = "disabled";
 
 			serial_0: serial@10a00000 {
-- 
2.43.0


