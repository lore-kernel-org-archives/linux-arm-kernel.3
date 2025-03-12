Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FD2C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=; b=nGeBKfQXKAqXjwK/zXGe0lxQ3m
	hgbUF2KcWk5d7eopWSXT1/BHqRjoo0x90mC4kdj4BfobAYYxLcadYlqJT5WV0wKBE6wiC/IBrfAvS
	Pzx3B2VQTRbvoFEycj1dJ+//2MmaUv/nvwyI3bLjDjzBDylWW4hnwjIIrcjC/XL9Jq5BZNgmBM0Yl
	eItXuATjXYOCKKmy4wFR2oa6/mMQMcTGy62cv51YgxH2/leALVjLAAXy78+f6yZCdbgHvvP5n/mrS
	6h/TyEYzuURq7Z3kyVnxMsB3NuvxpK+UpYODXu+pcScuqG043/fpy6oS7kv0i9WgAW1DRGWN8IgtU
	D5I/x6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJuq-00000008Cym-35PQ;
	Wed, 12 Mar 2025 11:06:24 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZF-000000088j6-1osZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so3697163a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776244; x=1742381044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=;
        b=TXJlHBkwmYmRamwHK8ZV9PzjFMIiN4jbO00lS9hz7NKEZqS6NuScTSE0bbihjNg7f0
         uz678ArxdIdQrJejqPqSJIEtQqvaGO9Gt8DWlcvAezhHwerTlY9g6pk62f+zLBI1W++E
         Wq5eq4rvQyFP0kdJwlNnliZVQ8ZgOrlLoBZ7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776244; x=1742381044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=;
        b=eN7Jtlh3VFIU88AI5mqmC/tu/n838vmzsOWc8bpfdk81JpuEUtab/Ao5mKsiiTXpqC
         fUmKc1cQxtsXQSUUpAaLT9OqleWBx5EQyX0XuY1A2MzsuwGWM9v6SSTGVss8s9DljfP0
         y1TlD+ExDbBAVh0b2Rt9mjX1GX+5Xxt30b+3hLmYm4Kt9vPUqHM3auWiFoM6AGPu7XqV
         iKGX/9B4BeF9s/QLMCZWch82evB3Iqcvj4Dr7ndRPN95ctq2kt5D4UqoTGcbwO4KpUBb
         LfakuCjfVIAbko2IxKBgvA+ltM9sbr3VBlKjmMUK6eEz3p+w27TuLgb100RC4BbsMylY
         pcQw==
X-Forwarded-Encrypted: i=1; AJvYcCWI48HQGBSOEhFa9gcxfUNV3UBYclPw4ZkmOP5MurQDxQYRWw41IQkyj9w3llX5dBPwyqJzog2NVuY8ZIcD572g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6xgASTIlDdBza9K2o+y9V7Hdf9Ua6HU3L3iqnoAN8gzpNkoGU
	v6NAlgnuuV/8EWdYI2P5SFjyGMzyd+vnOmr5HZOC0t/YqV/VTINu26ZDXDPAYA==
X-Gm-Gg: ASbGncsDeti0K/S9BmJllKZS8AZOgmwGG1krUuht1loz9oeq31pd9Lpg0pUUVwiLovL
	Ygj9madp9qYYARzv1qsBHopeBTJTEdi1K7PCWYnfOsoGbLlgJlD1Y5+orpITLrGSVcN4ovcgWT2
	m6aObp6j4mGKe+TGZyo0j9TuufkDOO+QiNgCNTtjMC3L4JCi6+r6EXtVE1uJf7nZ9PDUt/4NYyP
	MxUJHUHtDnfaZGvaXUOtom83G5T/1LHLHhweUnOI1GVabMpn4X/2Bir8m/FEVuNscNtohulwsxR
	fyGQYPSdz1T0+OzUNUWGOfJehtymDswP1RZgyWplaLkeSxBUL8Fzzd74D5aeOJQ=
X-Google-Smtp-Source: AGHT+IHJj3ClCl0G4w7uRfbh34yNw6y58jNADTnvGcCG6MJZbH+QLxVptAl9mfKjSGMGz6TiuUUEtA==
X-Received: by 2002:a17:90a:d88d:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-300ff368043mr8303305a91.34.1741776244552;
        Wed, 12 Mar 2025 03:44:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:04 -0700 (PDT)
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
Subject: [PATCH 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Wed, 12 Mar 2025 18:43:38 +0800
Message-ID: <20250312104344.3084425-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034405_469259_A97866F9 
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
2.49.0.rc0.332.g42c0ae87b1-goog


