Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83522CD343A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=; b=G07PhWx65zQwbg/Y6r9HQEWhnB
	OT9fNBgyxfj/z5IF2R9v8OjtZn0hvqkEy3kMYYSSbMRxVHWLPoW47Aqe4JkEv75NdYVgpxmntg+Hs
	NsYQL2wqr3XRHcd4p4+u++ezSRE4eGJA/b6rswCinf24TyBivAR6jiCplRJWyQs0Mh5Bgi2GKwup+
	acDGjOMD8SshKnjcsTg5sB8zZRhQ4mNK39cHTppfMnGkdWg/o2re6zt10a98/pPKBjdxS+dR1kwCi
	CSrfG1gz4oPYRnOtQ2R0pH1+3uSsDIKfKx/u19LVhjshRe1gmbF0PZKfvYxjG138XpYKKEmnNYWpS
	mh9W8Vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnN-0000000Fqlx-4C4I;
	Tue, 05 May 2026 10:14:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnM-0000000Fqif-1Bnx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=; b=FG2oteQ1zR2S7vS3mly13jSULS
	1Kw7/OnPbZJ6/B5B6TNebM2GC2IuGAJd7SMK/K4FwW7+vc+2fSA3CN78VF5S2ASnuqLStoAkEXwRC
	CXAX8VhII72xckq7TJhEbfTse2aqAnXOFNx58QqvyzEet5sjeUk54rrzZXdqgHm5QVtYIUN/7xFrE
	JWvNTrzgYOkPCVogQon/p1C8JKaWJ0NoOXOM2VDPUYl35bt0cU4Xnw8ytwhBVFPhP62ra+lk4wEjw
	UEtbyIGgQ7PnES8z5m532cJhS3VEa0uQ9VIsTvFzhzBheIgpHgQfcWiPu2oxqT07+FL00VmlJWDRa
	gvuzgjwA==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnJ-0000000D9V5-1zAg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:27 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-837b39eb078so1321714b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976063; x=1778580863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=;
        b=mN9RPnMr0RRixrBIOq899wKM6zcYa4J3YcY6j/+/lVyDSPLE7+yqfModunxHSopKSx
         PRcXSftbJPi/RCLgY/CJeAK0I9HBBTeHN6Cb58u9r1DFbbielnMZ9sAd2Q7o6oE2+Ylj
         1Sq7CccpGZA/e7ma5n0wc44FfaSs0vjLkBADc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976063; x=1778580863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=;
        b=iGB4N6TJGN2TRYTfd1aaEDJpZjzVr68DVIJwnwXE+SHQ0i7Yla10mxI+GMLRQWJF/w
         zG6E4BGCfvgSIKw2ugPfhK9/x1OlaR7ocaK/6+Rh92oTlVEmR815GdBLDLsfGsYqBdWo
         xsVjA4Iqc7mp5pt9025uXwrfknE6GHzHnm5X59Gp0cNF5JljmUm9Q3MK1iaEBjkcp/m3
         H/IdFN0Y6bYrIjuxe421ohsho9WcjW6NuhLEVta1chP+ZCSpHfprdDUB00GTGewKI0UP
         StOi5RUEPTAgZd8OmT967HeQSNuTjIlc0Fyhtg+rP+7e+4NzznictdKNsFf5TuKXXzMh
         lYEg==
X-Forwarded-Encrypted: i=1; AFNElJ8M7CUEJrzIFMQ8Kxi9MUmM8RvkIDhkByWXYiGEehavVKBzZt0hlffqVfVFx2YX3TurcDgyL39kSSkfJmeRvpcP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm1Uw449HP/iRshytPIYogQWrjOX3ZLe+wQH5K6qK8TlIGTB2X
	JVK1wj+mQUxwq9o9hRjT3nMMdpx3aHHuagpZEaBeoOmpIr/FfDrVnvzUiv8gGwC1vw==
X-Gm-Gg: AeBDievZW/3q2vXAkezN3A3oX0CSIzLOdcKNCj2J+HyX3rnc5cH0mS3SFXrHxzCFaUc
	58Jb6Z5P5dm19RdX3Wncgdd6lwacahIg/Je+nZNPC/mY6KvlWom8kuVeycilW2pBzkt5qhPiF0k
	xj0qGi4Ai/GNmhPKe+s3b0rRaNHlh3Jlc/EyKhXc/qN2a3NudJVQmnmVQ6BrTBU7/0Y5anXaZ1r
	gLhlIyZZp8xiVry6TTRi57HvEFG2PqtH0Cqr+zvORHXQs2PIKXE9N6bi8lTIb4k/yvMn81UvGh2
	wuLiN3m+g3lr7TBFBWAHXJkEtogVtOXG0B9Z+X2pvjIC4IvYe/osihYjetptvkQsCfIk4f182uf
	EAGrKgGeqmsKQ6PkGELWY6v154xugWeGXOeB7E3YA64YHkdD426T7qeizDPVtXWmWsPRY1/2tYU
	nFsa6Pr2R869LfDlmPGO/X7EyXL58nm48lFdThOhNa/cz8UqBeG/QL1zXHvTItCiGq4yEI+YZXG
	KA5PVlJF1Jis9MA7+Y=
X-Received: by 2002:a05:6a00:3a19:b0:827:2a07:231d with SMTP id d2e1a72fcca58-839228c94bamr2443788b3a.17.1777976063465;
        Tue, 05 May 2026 03:14:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12] regulators
Date: Tue,  5 May 2026 18:13:52 +0800
Message-ID: <20260505101408.1796563-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111425_684954_B218A77E 
X-CRM114-Status: GOOD (  14.57  )
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

The ldo_vcn33_[12]_wifi and ldo_vcn33_[12]_bt are just two regulator
outputs instead of four. The wifi and bt parts refer to separate enable
bits that are OR-ed together to affect the actual regulator output. The
separate bits allow the wifi and bt stacks to enable their power without
coordination between them. These have been deprecated in favor of proper
nodes matching the output.

Add proper ldo_vcn33_[12] nodes and drop the old ones. No default voltage
ranges are given as they don't make sense, and the existing ranges are
about to be removed. In-tree users of the existing *_(wifi|bt) regulator
nodes are converted over to use the new ones.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use non-suffixed names (ldo_vcn33_[12]) instead
- Convert existing users
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 22 ++++---------------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  4 ++--
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  |  2 +-
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  6 ++---
 .../dts/mediatek/mt8395-genio-common.dtsi     |  6 ++---
 .../mt8395-radxa-nio-12l-8-hd-panel.dtso      |  4 ++--
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 +-
 7 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 45ad69ee49ed..a953fb527b69 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -164,15 +164,8 @@ mt6359_vcn13_ldo_reg: ldo_vcn13 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1300000>;
 			};
-			mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
-				regulator-name = "vcn33_1_bt";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
-			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-				regulator-name = "vcn33_1_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
+			mt6359_vcn33_1_ldo_reg: ldo_vcn33_1 {
+				regulator-name = "vcn33_1";
 			};
 			mt6359_vaux18_ldo_reg: ldo_vaux18 {
 				regulator-name = "vaux18";
@@ -231,15 +224,8 @@ mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <3300000>;
 			};
-			mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
-				regulator-name = "vcn33_2_bt";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
-			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-				regulator-name = "vcn33_2_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
+			mt6359_vcn33_2_ldo_reg: ldo_vcn33_2 {
+				regulator-name = "vcn33_2";
 			};
 			mt6359_va12_ldo_reg: ldo_va12 {
 				regulator-name = "va12";
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 2062506f6cc5..ae11cd73e333 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -445,7 +445,7 @@ typec-mux@48 {
 		mode-switch;
 		orientation-switch;
 
-		vcc-supply = <&mt6359_vcn33_1_bt_ldo_reg>;
+		vcc-supply = <&mt6359_vcn33_1_ldo_reg>;
 
 		port {
 			it5205_sbu_mux: endpoint {
@@ -637,7 +637,7 @@ &mt6359_vcn18_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-always-on;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
index 8da47c916313..84064511fa0d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
@@ -58,7 +58,7 @@ &mt6359_vcn18_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-always-on;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 40b381d4cc35..2e68e997dff3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -592,7 +592,7 @@ &mmc2 {
 	interrupt-names = "msdc", "sdio_wakeup";
 	interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
 			      <&pio 172 IRQ_TYPE_LEVEL_LOW>;
-	vmmc-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+	vmmc-supply = <&mt6359_vcn33_2_ldo_reg>;
 	vqmmc-supply = <&mt6359_vcn18_ldo_reg>;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	status = "okay";
@@ -617,12 +617,12 @@ &mt6359_vcn18_ldo_reg {
 	regulator-boot-on;
 };
 
-&mt6359_vcn33_1_bt_ldo_reg {
+&mt6359_vcn33_1_ldo_reg {
 	regulator-name = "vcn33_1_pmu";
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 62c336e21500..4259291a52a3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -701,7 +701,7 @@ &mt6359_vcamio_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
 };
@@ -1216,8 +1216,8 @@ can0: can@0 {
 		clocks = <&can_clk>;
 		spi-max-frequency = <20000000>;
 		interrupts-extended = <&pio 16 IRQ_TYPE_LEVEL_LOW>;
-		vdd-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
-		xceiver-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		vdd-supply = <&mt6359_vcn33_2_ldo_reg>;
+		xceiver-supply = <&mt6359_vcn33_2_ldo_reg>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
index 0389c9cb8581..ecc9fd27b82d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
@@ -29,7 +29,7 @@ panel@0 {
 		compatible = "radxa,display-8hd-ad002", "jadard,jd9365da-h3";
 		reg = <0>;
 		backlight = <&backlight>;
-		vdd-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		vdd-supply = <&mt6359_vcn33_2_ldo_reg>;
 		vccio-supply = <&mt6360_ldo2>;
 		reset-gpios = <&pio 108 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
@@ -57,7 +57,7 @@ touchscreen@14 {
 		interrupts-extended = <&pio 132 IRQ_TYPE_EDGE_RISING>;
 		irq-gpios = <&pio 132 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 133 GPIO_ACTIVE_HIGH>;
-		VDDIO-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		VDDIO-supply = <&mt6359_vcn33_2_ldo_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touch_pins>;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a..4530434015a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -614,7 +614,7 @@ &mt6359_vcamio_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
 };
-- 
2.54.0.545.g6539524ca2-goog


