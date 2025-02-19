Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233A6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmpBa7eMuH+mFF2ncMukFi4gUmii0gteNirg9Prls7g=; b=pebHaP8P9FfQ2E0BT7kybidKwa
	DUP5B7n05BmmpoA6f3UKC8gkpfrzNXAErrJYt1w2NEourFQnoRUUGQ7XY41qBGRDDUe1aBn8DqCic
	6/eXggvAgW0wByvTsvOQmXcK4FUaW+fEJokuSvUzIDw6fZ3giBHj3uLIrjj1CAamQ0YXR9eEy1VJr
	DxPiaSvCEWEMrwl6J6aHDMYjacXTQu+IJoXANUbgx5LNX9DYUsd1FQy9kICOdZ4fNzXm1P6nc1iog
	TNP8RYY0IXi3CTNt7QRlPXKGMt7kfRgeloSkR85SOfRLWAHVng2Ub/BnMJQOAJqtC+9V5v06XHLh3
	Ek4qVvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgW9-0000000Bui9-1EqW;
	Wed, 19 Feb 2025 09:37:21 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkftd-0000000Bglo-46HV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:57:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f29a2c6a2so612620f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955452; x=1740560252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmpBa7eMuH+mFF2ncMukFi4gUmii0gteNirg9Prls7g=;
        b=FUwCNIbJKuEXoH5i8snjb2bUZRtlG/t9+N/qja6OwzYfK3+1ORiSEKpnS3QmlNUacq
         PCA0ZQ+NZrqKpZ1MnoPwU/RhVd8Xmv7FX7TJCLq3VQ+/ZSIW9vbCswezelRZmAGIKtET
         CtTTcULhhCLQT4oq1x2vnDP6E1QqraviBWL1f5vwxBnNtozXOH1TJpshe6aUF4cGBneD
         uJXawIbYtShYwP59ZFC3GjXBU8SvxgeUbQ323Gw3o3BGaDSxdxrR35/MKp/vUyW8by94
         BuAvM7DxScIGbT5ZAo8DsjUhkTFxjpLt37Ddq4osyqAxMwPlXBdYkwxH456lexictRKz
         s/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955452; x=1740560252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmpBa7eMuH+mFF2ncMukFi4gUmii0gteNirg9Prls7g=;
        b=Olbl+JozEjZE5x47R1YSxGvGPPj1ySC/dSeNem9kuNZ0LLTKVp0+H3n347nqDqndik
         RKHG4V0SCeCIwlhzWqqELONbmkCDG1H4TgL9uX+yZYbeIDxQCOTHPOqrZGNnss8BzUQe
         N17xYTMR2IVvQf5WO/NUhXbvQX3bNuDcZvAZOz4mRDezW7GEWUoK0bA/tVwfhbgTv3TC
         CVWfcPNuyPP+8kh4ldWAQKEGGPRWvUVY4uwdqss3uODbjkE9HANDpMPrPGi0E84CLV8q
         JsneRY6zkTbDG9UXqdpirhRsEqJhoTwyTFMuMQqliyETO4SI2ulXrm2PXmEyYw871vln
         iCaA==
X-Forwarded-Encrypted: i=1; AJvYcCWeUmkKYp4vY/ZKtEkGD0EPq/8k9Hx2KxXoFiW5Fs2wCpcXlL9JXPmLCet9pJvfKWo1RsEKiZ5kzphaB4plP4TP@lists.infradead.org
X-Gm-Message-State: AOJu0YxpVQDYYCFqlloAy6jBjWh7VelXBQTlRP1kiAuaNy9bB21nKafM
	XndB738M+IjPrfA4u4uoHdhAENMeJd/+mGaRYCtfRiA5ETNWEFDmRl7kMwPMBVo=
X-Gm-Gg: ASbGncuMjdYMIA8jb3PBdiO5sbz/TPQ5xc1nrA+/6ggkBdQ7wxgp9EQWl8UhtEg+zBl
	UdeO9zd/PWrRaOFRon+p6XYuImw/jNDhUwMxQoH2RwbD6XAXo9fMe6/m4oQueFwP5s8aq4CoQKT
	juXUJ+aOp29j2MjbKUb5YIVsBbTFHcPOdXvsuaPKhJlGs3CwKlW8nizEvvZJuu38ri16PDyN3pm
	cw4XyGCQEhLaRyvLjpGB6z62GiKf+aS6rwX++CosRCMikXv2lci+aZIWmJpZ0j7/X5yspK94hZ9
	bDnmlIr6evX74XhdbePNxnm9UiQPLw==
X-Google-Smtp-Source: AGHT+IHMgGpLmNZh2KOBXIVt5Xtg6SHJM16bLaqEQLg+J9+rGOfQPsKNJHHPFxgxlEla7/c81KlrTA==
X-Received: by 2002:a5d:5850:0:b0:385:edd4:1242 with SMTP id ffacd0b85a97d-38f33f50c0fmr6700963f8f.10.1739955452455;
        Wed, 19 Feb 2025 00:57:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399beadf31sm10007375e9.0.2025.02.19.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:57:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: tesla: Change labels to lower-case
Date: Wed, 19 Feb 2025 09:57:26 +0100
Message-ID: <20250219085726.70824-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_005734_018692_E56615F1 
X-CRM114-Status: GOOD (  10.32  )
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

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 690b4ed9c29b..9951eef9507c 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -92,7 +92,7 @@ cpucl0_0: cpu@0 {
 				reg = <0x0 0x000>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -108,7 +108,7 @@ cpucl0_1: cpu@1 {
 				reg = <0x0 0x001>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -124,7 +124,7 @@ cpucl0_2: cpu@2 {
 				reg = <0x0 0x002>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -139,7 +139,7 @@ cpucl0_3: cpu@3 {
 				compatible = "arm,cortex-a72";
 				reg = <0x0 0x003>;
 				enable-method = "psci";
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -156,7 +156,7 @@ cpucl1_0: cpu@100 {
 				reg = <0x0 0x100>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -172,7 +172,7 @@ cpucl1_1: cpu@101 {
 				reg = <0x0 0x101>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -188,7 +188,7 @@ cpucl1_2: cpu@102 {
 				reg = <0x0 0x102>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -204,7 +204,7 @@ cpucl1_3: cpu@103 {
 				reg = <0x0 0x103>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -221,7 +221,7 @@ cpucl2_0: cpu@200 {
 				reg = <0x0 0x200>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -237,7 +237,7 @@ cpucl2_1: cpu@201 {
 				reg = <0x0 0x201>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -253,7 +253,7 @@ cpucl2_2: cpu@202 {
 				reg = <0x0 0x202>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -269,7 +269,7 @@ cpucl2_3: cpu@203 {
 				reg = <0x0 0x203>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -291,7 +291,7 @@ cpucl_l2: l2-cache0 {
 		idle-states {
 			entry-method = "psci";
 
-			CPU_SLEEP: cpu-sleep {
+			cpu_sleep: cpu-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				local-timer-stop;
-- 
2.43.0


