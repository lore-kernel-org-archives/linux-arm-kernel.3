Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F65C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=; b=XvLjNXRx6dPiprqHpocVYNApPj
	grLqw6dNIoIcKRnWUNABh/iThHEcC8RhU289DuB3wUJheWGsPi/zjXV7q9JmvzxB0G2O50B5xbsR6
	idnkzS+ApkSONI430EV4/WLGYqhVcFemEVx07Gow5aTFe3oW4RDV+a1V9+4/0mhoJ+6Dsotcvbxnk
	lm8mcrhtTNcnXxy4VesKqAYiA2Yo+6t8KZ6PY2XOHg6R0OIBAMfOaYMrptd7pe9SCL3XAv/dbgYlY
	Y8UbA7mcRteW71j1W/0QjnSl/YPY+7G2le5Iqpwy1zG73mSLbtJ8D72iOiw40ukH429YF+48v1ZuI
	MOdnWPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRjX-00000006bpL-3brr;
	Tue, 17 Jun 2025 08:31:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYV-00000006a1T-2XoU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=; b=cHt/dI7A6JR8ajDrLKy3WM0X0X
	AIzvSmw+S/3CARmVUxsVqTDmchIXQ3T1o+u+fuzYkmBOzUOSUDZYPSwbhd2fteVtlw7yqSHwFwmRR
	FcIoYLYCRhJzJYondoLb5ubof/sz7ZpdvHGhDNoWDVP8NB/Vn2viXDMz6eNOCfiTw3mbilOYARhA9
	lOmPjQ9lZpUSvZVVwVwv2YlLgq0x77PKQv2odYVSVbHRim+7uqtoUyRWh3wU/BqQV9026Le7jL0ES
	KrUwUk3xqW4zh/E7EeXOaog/Y8rE8NVzNzq3akoKbYgIuP0lhxktDZZ9l31VenbvhdjzyG4IvMCNd
	MLLw8Blg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYN-00000003k6P-2T5D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2363e973db1so50572655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 01:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148419; x=1750753219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=;
        b=Gxf7Di3odYNSrFE5tyxiZdX5cyVvlPMXbyVdnBG/IrULRuc+1Un3ZsmX1i+7FDR4Gq
         j7t3lPGRad9BJ22lLPnK/H7M5VkLrfuUdQT+Iaux7y5bhTTXSfjnh4GsxbwUc8we4FZY
         UxFgPXUlqJW2PtO4mabDx4WAUTyZv+B0+Am20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148419; x=1750753219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=;
        b=QLjYcaQcdtiMCh6UG3eWnDF1rNRtcAk/6Yb1D4cmjMTjJdpSAjg7P0SzkG4lHPO3OY
         wtWu3IBla8QNC8kUrMsLlpr62LxDnLEVojsBCIv1o0OunO69GLWOwi050sIOEOkoBwUI
         dIJv1MEtryp3f7OTAQotJAWdsDdGsv65fVPDzCFPjxxBNMT7hOH1YQGWSQ6awh61ZrhA
         vjQR2KuW2hTcvOHZJVZonnDtp3N3K3PQiKdhUUoaydciaFASfK4+j9jF+hatmxOvXbTH
         AHGZ5JB1f50kG7wyeI/f5VFvoLJqwRJxGHiqcVbAd+/jS7Nv/EHIuOUK3oUlDH9w6D5a
         +Vqg==
X-Forwarded-Encrypted: i=1; AJvYcCUpJjxy7gtzy6OqQaIhRcp+aWQPtoIlX2/ZCR55A1sIlkl8OvykUOX2J4Z2Lk4eOy0c16MEcW5QoRfLTQ4v4wxq@lists.infradead.org
X-Gm-Message-State: AOJu0YyPRcdJ6M4xbxNwxKyQeJPkDUdG+E52qOXetYt+swmtznR7Qe7A
	J7OFDi0k4Lp3U2bLdraFjnWo9vRKvTzBVhDZQsDqaJFpW3YK4HIP64cFOrwv8foWWw==
X-Gm-Gg: ASbGncsrVo6LpbnXbawiBMCoYlor6C7X/HeVzzHcye1oToAWhIPtEKGm7lrIUx/g0KH
	9/QAqkkVDpc0q8f9EbExDy6jFGsSZ7hCAD8jQeRpstfjQERs270XyCFbBsrcYxtgc9+aX8nOQnB
	lSXul4EHmMdBz9i1TT4aV+BcZgo5/5Vp/nGH0XqAjG3DTyq3CtqmiZusgXfxoEGeqUlE3LTkWsT
	5Coeb7IVTl4gLlJF7NbhJxvC5zkqolC8QLMefILnIS7s7cXFdwaDlGT36qeqV/NiqZ6X/5Y0AI2
	Oxd/PnAi5nbnZKR9iLU72VBvwpLmM0ozFOnWGZJuzxr4aYT/v7wr6miiMXy/AaANKi/ZygGEpor
	FfDIC
X-Google-Smtp-Source: AGHT+IEdEae9jR3M9Ile50GhlK5a+mZddJwAjCXfQi04qoA/3oENN3QsRc5nWKd11gVEcOZh5+alGQ==
X-Received: by 2002:a17:902:d4d0:b0:236:15b7:62e3 with SMTP id d9443c01a7336-2366ae00e3fmr181507135ad.9.1750148418807;
        Tue, 17 Jun 2025 01:20:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v3 4/6] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Tue, 17 Jun 2025 16:20:01 +0800
Message-ID: <20250617082004.1653492-5-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092023_729634_7944058C 
X-CRM114-Status: GOOD (  14.25  )
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

Cc: stable+noautosel@kernel.org # Needs accompanying new driver to work
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
index 18cfc99cfa3c..ff20376a44d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -398,19 +398,17 @@ &i2c1 {
 
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
2.50.0.rc2.692.g299adb8693-goog


