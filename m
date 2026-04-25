Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ABFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 03:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Q87q408S6kD03eCdhgkumlXWLlyzkrJl5PR3laXuXk=; b=i9WK5qvam0CcIB2YFcxN2f3KCA
	qECk7jpO5ZUW/BZKWaBy/Zh7VUjh5NmAz+VnKBTSjGqUJRWvsKqBghoIbs3IZTAsaRklf1epSfNSI
	WrgS004EwPW+PqfSYin8Q+thSfr89Dnp/U6YxqUl8YGmjnTP/ikYWNWltqZULzvRybQlBg+lwiWY3
	g9HkOnFaotu+akR+pusPX127CzuhyCZsC2gS46FtTqRtu1f8Uo2rsWVnNc6QRq5MFVGEL+UMFOSyH
	887WqHSF9oXbr0qshUBExB7BWR7U9Aainf6pyLoHYzitWRIcSO/qfrrSsxvoC0YY2bgmIDPVHEf7q
	Rg5Qy3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPe-0000000E1nR-1uVY;
	Sat, 25 Apr 2026 03:10:34 +0000
Received: from mail-dy1-x1364.google.com ([2607:f8b0:4864:20::1364])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPU-0000000E1dc-0Mad
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 03:10:25 +0000
Received: by mail-dy1-x1364.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso8910727eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086623; x=1777691423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Q87q408S6kD03eCdhgkumlXWLlyzkrJl5PR3laXuXk=;
        b=k/l0YeaF+Uivx5lFn+/Xy7GRJojiXo8+WujGGUH5bZM8jL7fDB1x2mt/CXcjSWgdvv
         dEZ723oqH8y7nloydJDRaUcuQvStpZpjPkN/tpcE0/eikuQIJzh3tESTNcUCnxagv6Yq
         ZDHxcQZnOEEZ3GUFmODEjrHVGfQipQVuYVSSLtXdTey5vfpovV3/+Ly8shXVyQMApsoT
         PCFtjffHybC2NLp5SZhP7sCG9TtfkoyTAPhx7agP+49KB3P/hcxscVmayjdMczEzwq6n
         /2x5nDDXKLfi864hkU44NN9G4NVssb3bdVCg674ZvZe5Se5lz8r+4CowR9EeVS/rzDBc
         m2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086623; x=1777691423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Q87q408S6kD03eCdhgkumlXWLlyzkrJl5PR3laXuXk=;
        b=YzBE9KYY8fv38JNFZUvYdpjWaWFDFOHh/krQGfWFT8xpI95OEY85oA5Rac0M5vUHtw
         fA7yGXRk3ozxpTnh5L6lrzonncfVAjr2otM414J+VnaURFvdHat7Qc1rBXvxYAsBTf5/
         sBP0ag/FV7k0TjeN6N97YL9oOP4fV22yluwp0/GzbLjgnxSORMdR+zBOfqephkqm70vQ
         Pxq2yrheqwAnp5lFdIsfEu5oylsX076urpjVfjLnsbKtvSEVDtM6A4cDqG8oZ7+U90xp
         dE3K1EsR+/IqcCwLAEnkNUVw+0Pe9xdiFgHY67A/P1KO1QCuyBzCJYXAA/QTFCDicFCv
         8ftw==
X-Forwarded-Encrypted: i=1; AFNElJ8IAnxnYMByW6NNlKswSoyWnkYOBVRXFveuYgbdl/02kkn2ZkQhKM4m1CZ7ZLHBkCd0SEm20jx8vuGl1MO2LCp7@lists.infradead.org
X-Gm-Message-State: AOJu0YxGlHqjuaQNtJzvRWsI5Ui2+KxExv43eyWMMcGz0+lh6bO/18iX
	HWNeE5QCuOa0QY7xh7axzYwQbtJLF51MrxeY6SK6ZV1I9gRVISAGK3AXlDlaETRuxNJWh0Addq5
	v5ScU0L5NfYq6hTCu9sE+CuEm6ND/OiHumw7g
X-Gm-Gg: AeBDietak7cREqaadq+DOFJ/YV8529s1ijdmlr49kYaABi/gZEeMfiqEGaSJ/CgEcXF
	KAXXVqPZcssatH2SvnAWaMzy5Yc2HS9SeUeaTlLcg0PhmOGG5PZ2OhUJa8JiDdkgbUtRnqZINJF
	8TzUk3hdlmojiovrw/ef8oMr/WlBYHpoH5c0lvVfNBDvVwd8xbnli3qDQN5vZVUKw/SHysOjhi9
	znhSL6Tg9YDp6R5cXWvwpniso2hH2gpd6zQ/EUku7zWzUL2NsD3L2WIjaOwkyhnOhjb0bq1BO2Z
	8tyDIlfTHaG7pD2y4Il9Kh+sVkY84mJgVu9ZgqdACdmE9OvNQmFKnQIV3R3C9EnIWqBMYnPX3hF
	ov41m5WjXfKcmhbeT1BEujiOaRIEFv+z2uYLkaAkGwFpQZv2km4TErx8=
X-Received: by 2002:a05:693c:4011:b0:2e6:e916:70ff with SMTP id 5a478bee46e88-2e6e916770cmr11635454eec.28.1777086623456;
        Fri, 24 Apr 2026 20:10:23 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:23 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v8 4/6] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
Date: Fri, 24 Apr 2026 22:10:09 -0500
Message-ID: <20260425031011.2529364-5-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_201024_128166_41456CFD 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

The Orange Pi 5, 5B and 5 Pro schematics label the RK806 PLDO outputs
using the pattern VCC_*_S0 / VCCA_*_S0 / VDDA_*_S0. Rename the base
dtsi regulator labels (and the es8388 supply references) to match:

  pldo-reg1: avcc_1v8_s0 -> vcc_1v8_s0
  pldo-reg2: vcc_1v8_s0  -> vcca_1v8_s0
  pldo-reg3: avdd_1v2_s0 -> vdda_1v2_s0
  pldo-reg4: vcc_3v3_s0  -> vcca_3v3_s0

Also update the saradc vref-supply reference to track the pldo-reg1
rename. No functional change.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..fd5c6a025cd1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -274,10 +274,10 @@ es8388: audio-codec@10 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x10>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_3v3_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_3v3_s0>;
 		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
@@ -441,7 +441,7 @@ &rknn_mmu_2 {
 };
 
 &saradc {
-	vref-supply = <&avcc_1v8_s0>;
+	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
 };
 
@@ -666,8 +666,8 @@ regulator-state-mem {
 				};
 			};
 
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
+			vcc_1v8_s0: pldo-reg1 {
+				regulator-name = "vcc_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -678,8 +678,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
+			vcca_1v8_s0: pldo-reg2 {
+				regulator-name = "vcca_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -691,8 +691,8 @@ regulator-state-mem {
 				};
 			};
 
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-name = "vdda_1v2_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -703,8 +703,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-name = "vcca_3v3_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <3300000>;
-- 
2.53.0


