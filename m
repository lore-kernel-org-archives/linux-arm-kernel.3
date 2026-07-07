Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB816C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=; b=zBblFds0ZfzwejgXDplBCEqe9W
	Tq6mB33D46mDtFwXrRby3U9JuQbU0nnyv6AFGEjux6z8TNKxXGQ7nCx4CBz3Gt8C82AEFCYrAOykB
	nfdtMkzBUBw+4yNPS86GIhFZDilGk/QhqTil45c0xg9tKg5KlBzUuKaPFQdr+HbyVa0rwjncC/wId
	r2zzTsdrSCZE974tiialTlvdvtv1sVk+lUg6RTv2w3Zzq4zui3F4leqI9/vfmaTCfMBCUypah/hLo
	wD7cuFs/4rpJdwFxXHZj6jEQnXQszsfOmdNJ0Es4M7uUIoqnbUU+QhlygJjRduGmGinSSgalyfeMx
	XVuDwHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3I4-0000000EmjE-38Ku;
	Tue, 07 Jul 2026 10:44:36 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3I2-0000000EmiI-0gfl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:44:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c96cb024ee0so2813677a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783421073; x=1784025873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=;
        b=V1Mx3k8mVqBo5a3zPVuclUr9L3qXnqXdnqOK88FCCCygtGm4BKj5hS9DeAuTkHlb3I
         gjE2rspsUuRG720N6hZhXAw/9QJwM4tKDSJf7vhuwMcuX2+i2P0fYTFemR7tUjJCcAwl
         5UU8PZNGf8Z7q9VzkEtye+2KCVu9j+fuKaVPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421073; x=1784025873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=;
        b=GuZzN8AnX0BL/KCk+K/Us2b0OaD5h/E6GI7dMymw3Fpzx1x/lantHp+vUhJg3RNhij
         59tujY5+LZFY7ayKOxiGVWgxXMBLv1FbuKEHzJ+LA/9R8XFe+jupzbshIwd6TDuOA1Q8
         UtaHLmwFuUYulAJIgKZ9GCygqEKiMq2vu/UDzFK17QlbANW+aLpzREwZSdCs3EMEgQp8
         WzJNbf6bbQuxjlBSa/Ni9BA/7E5zGo4ctPBn86v1r7GlChi3VZqtttBMRx3B8p0u/NZt
         MjYe9r0hK2kiqCZ2Dvpv9KrvwJmLuTQSDgmMbDZCV25ANgwctNmddPSzVeqRWzMaQcAB
         jcpg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5aEYV7m2xd9+MhxV6UXl+83Nfrb5rab8EF6Wtf/v/wHdgq0v9abUSPXx6cx7a6Dhp/sRw1xtgxxlj1OeNm14p@lists.infradead.org
X-Gm-Message-State: AOJu0YwgA/NuHblo99Ao/kApCwt6uEzO04CkkX2rULW8OVc7ohjbALd4
	iiOk6/IeAgDhwaccKDhu2eE/I2+dS0sDj1ef+pJT9Ebskbw5U/rcQ+8QX7k8H1pPZQ==
X-Gm-Gg: AfdE7cnCWEgQWrJqcfjSxerTE6xUGrLq9HuKvyEJZqwOcTRX1v/q52cxiRpIAnZEXnS
	Mt0l/+3tcxLEKNSB11G4OYZIIru2bPR6Frx1P3ft6QD0jOT6/3ssS9goTIAGTIp57K967/HpMWj
	mYCcg2q4sd6V3+v848bhRvVtxaNOf3nd2GE22yERnH+gLN9nZue92zXCq38PB8qvMp7/TblSDHM
	D5X+UyEi1eONQ9M9s3mQtg/5D0k+Cnp20gFBpFmVL8NehnLkQe1dZ2HgwHwlyO+z87mt8EitLoO
	VlvvVf+qd382pDuHNJNE9HKFex8jHeHv3m7ZQQbzLPu3TSt4uz/+B7Il7a2e8mbfLD9sslE4Xrw
	jwx7yinH8AkTXEUo5SP4tLVOkBxdR33NVA60vuEzfUf7muUE6tZ3EtLGizh9wEsQF31/TCd9x2z
	raUSsjpwTYorZa7WWmNcnhsMxWGUC4pP8zY10AvADz2sgr7wrpYqSzJ86L2mWGopDmyhHT4g==
X-Received: by 2002:a05:6a21:3204:b0:3c0:9c18:d5a7 with SMTP id adf61e73a8af0-3c09c18d6f0mr2745290637.68.1783421072707;
        Tue, 07 Jul 2026 03:44:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:cfca:cfe0:c982:e981])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5b95sm790980a12.3.2026.07.07.03.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:44:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
Date: Tue,  7 Jul 2026 18:44:25 +0800
Message-ID: <20260707104427.3409290-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_034434_220202_7D92E1E5 
X-CRM114-Status: GOOD (  15.08  )
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

The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
DRAM.

Add a device node for it and hook up all the supplies.

This change requires a firmware fix for the SPMI bus to read back
correctly. The required firmware version is 15842.175.0. This is
included in ChromeOS releases R150-16700.22.0 (available in Beta
channel as of writing or stable channel in mid-July) or
R151-16721.0.0 and later.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..fea52c377d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/spmi/spmi.h>
+
 #include "mt8188.dtsi"
 #include "mt6359.dtsi"
 
@@ -241,6 +243,14 @@ &cpu5 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
 
+&cpu6 {
+	cpu-supply = <&mt6319_buck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6319_buck1>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
@@ -1156,6 +1166,14 @@ pins-bus {
 		};
 	};
 
+	spmi_pins: spmi-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
+				 <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
@@ -1267,6 +1285,54 @@ &spi2 {
 	status = "okay";
 };
 
+&spmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spmi_pins>;
+	#address-cells = <2>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@6 {
+		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_s5>;
+		pvdd2-supply = <&pp4200_s5>;
+		pvdd3-supply = <&pp4200_s5>;
+		pvdd4-supply = <&pp4200_s5>;
+
+		regulators {
+			mt6319_buck1: vbuck1 {
+					regulator-name = "ppvar_dvdd_proc_bc";
+					regulator-min-microvolt = <520000>;
+					regulator-max-microvolt = <1155000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+
+			/* vbuck2 is ganged with vbuck1 */
+
+			mt6319_buck3: vbuck3 {
+					regulator-name = "pp1125_emi_vdd2";
+					regulator-min-microvolt = <1060000>;
+					regulator-max-microvolt = <1170000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+
+			mt6319_buck4: vbuck4 {
+					regulator-name = "pp0600_emi_vddq";
+					regulator-min-microvolt = <570000>;
+					regulator-max-microvolt = <650000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


