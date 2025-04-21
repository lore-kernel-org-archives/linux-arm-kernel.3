Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D20C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=; b=Gq0QMGY8B0nQ1x8KpIUbg0ndpp
	jb+HdZXtqvIlhGwpx0sX4JQaJi7d7S095rKM++NPLm9uZq5FZx5201sXZX7KFsXhBMTwZMWtlB/kD
	sCQpJUv3FObSFoLtTutBvLp6B2Mw1fOjnrDCucpomLfSbfsXBnBIEtpGAw5MkhitOpxMsx83kyTMo
	t6zZ5kBahNjfIfhVJQVbG6CyIRQSglaHl38YI4wlN7zoZGlSnqVgxBgo5R6UnYtsGKc0NikB2w+Bl
	RzcMp4p0ntKFVbEj/5OjYbjntbnCkNIWxLof7x/Pd8965bljRWhBdxDGgSwjssiBDpbgC+Zg5Kidj
	4pPzo+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oIP-000000045Dy-18EL;
	Mon, 21 Apr 2025 10:22:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9O-0000000448B-2Oni
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223f4c06e9fso32316525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230398; x=1745835198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=LhVSJk118dEB60KZzvm9K0SjaWU8Mp5hfw9F1/VZ3SR2Dt17yZf84bJ9HD+TbGfG2v
         /0DKDp8JTnoudHO265XaJWYnsIPXwgZL2JuHqzRcTp+KdJPfspWdd5iO6/H6uhZjCqIW
         J+Mnci8cGsLbrGlD+R2dCfrldICBjNbi6fsqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230398; x=1745835198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=e/HS/aCfCD5Lm+m8ZgJydUx3RsyKkHUqwr/hlFDwn1JQGcsthKkeyW27rqcnfLVLwS
         km856ZGnJT+IWicki67QhN+WS7Rcr0wVMbABJNRKS40lKIhm/URrZtx/ZWazor0qJLKd
         wvowoc6ebjqep1sVxjw//JZ+JvXk2iU+3O4hxYON8rbsLBGSRmnnnAmiadktiYNroPEv
         9klw6u/X1CWFuHH6kr5lR+vlSf0rAi5b7arOWFgdfutzzfTJoHKJYfqfryzg4HBaXVoG
         Sh9NhBSoUDqPIew0Rq6zuFkGalKB0VQ/W3B7NQpSc8xNf1kHoLhjJDHNTj45F40jM3Lp
         cmUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0nVUHkSkdql6K+vNPPj91sIWyuDBsy6h/u2VG2B0sWwlehs3wYrjOLvz9M+v4eBSr1E9lbXwZCP4St2pQpQ0p@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt4R77nYziaoaMby4tAI5FgdbMzsnsGaXsl4AaD2u8Snq9u1HW
	MnZPHU3vb/6nU+X3jfICCSz/mR7vrnQjqTfGhzww7RvyCXL9dsBFHZUdKQHnr15hLQDK2sDuTve
	rAg==
X-Gm-Gg: ASbGncsMu+sGQUMCCrohrC8DFq5INpvRdop6lmTjnjH8yc6k05Rn7D2CUiEQ7kF9YFP
	clISae5P1JLoyVoYt87SgzpbQ66H7g0DdCe/k2kIqlNVd5kd0jjuVWvTDDpto/LiuvOnWWIljBJ
	8OJ3xXSIr7r8pQ04OAc2rbY89Cb8MnjfjIPNizJ/Ar8OfOjpE9hva+6SYqtxDjFDp0BcFnYN5nN
	4VSMWI3Lp10nXQNSupws4w7Ci6OokzQKXvBdygXhZCTkO4NzYy/Q/AylMYzm2hSqSUyYDkIL7ht
	RIGQ6P2T2g7SbUN4supnwfQmHO/2TWafST+MaMosf8Q505nuUDzTJj8xSuUw9ZRz2pHJ2g==
X-Google-Smtp-Source: AGHT+IF6rGXrSzCpvaNGhX4xciML4WX1Qp+Xf99qU1svwwhGPd2mOXprUmL/S+UqQYoWzSfytulsaw==
X-Received: by 2002:a17:902:f644:b0:224:7a4:b31 with SMTP id d9443c01a7336-22c53e38f33mr139591965ad.6.1745230398086;
        Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	stable+noautosel@kernel.org
Subject: [PATCH v2 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Mon, 21 Apr 2025 18:12:42 +0800
Message-ID: <20250421101248.426929-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031318_611615_1E0EDF76 
X-CRM114-Status: GOOD (  14.80  )
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

Steelix design has two possible trackpad component sources. Currently
they are all marked as available, along with having workarounds for
shared pinctrl muxing and GPIOs.

Instead, mark them all as "fail-needs-probe" and have the implementation
try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8186-corsola-steelix.dtsi      |  7 +++++++
 .../mediatek/mt8186-corsola-tentacool-sku327683.dts    |  2 ++
 .../mediatek/mt8186-corsola-tentacruel-sku262148.dts   |  2 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi       | 10 ++++------
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index e74e886a00cb..822a177e7c19 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -123,8 +123,11 @@ trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -197,3 +200,7 @@ pins-vreg-en {
 		};
 	};
 };
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
index c3ae6f9616c8..4dbf2cb73a81 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
@@ -17,6 +17,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
index 447b57b12b41..ee5bc2cd9e9f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
@@ -19,6 +19,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cebb134331fb..918f17385ba5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -390,19 +390,17 @@ &i2c1 {
 
 &i2c2 {
 	pinctrl-names = "default";
-	/*
-	 * Trackpad pin put here to work around second source components
-	 * sharing the pinmux in steelix designs.
-	 */
-	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
+	pinctrl-0 = <&i2c2_pins>;
 	clock-frequency = <400000>;
 	i2c-scl-internal-delay-ns = <10000>;
 	status = "okay";
 
-	trackpad@15 {
+	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vcc-supply = <&pp3300_s3>;
 		wakeup-source;
 	};
-- 
2.49.0.805.g082f7c87e0-goog


