Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1F6C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJn8bgDlexj3pTLFD/TVKu44xwgcekcV50vMMBDdgSo=; b=OINvMvXd52fJj814RELn5PLwcr
	rNN7UgoHxKVvcfKJlASn1LRQPC9S3wgcaFmkQH0tvMP0RqSU3nP0lvHO/wLvJiyQpEkIgjD13e+ch
	leDoG98TClEE2XmvYf4E8UJYrKdqcncFIavBIzU8GklBWhTMJWy/tNxo/6VIJ4plpHHkl3mwwwX1m
	uLDquqUprRlah0rPzTimWdwJEd5G7WEWFMd8Z0UhNGtgqs4bROO5MFe0H8DNAoje4uHbvxTDWPIkd
	Cpb62P/72cDrf33+o8csnXZnOcfTbUxNlv8BLxVFP3+NpeGa9ieQ7sfhGbI+c6VZgW+OZCRNB/pXR
	GRQy8RBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1q-0000000GLTu-0G31;
	Mon, 03 Aug 2026 05:15:58 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1j-0000000GLDj-0X4g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:55 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1476474a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734150; x=1786338950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJn8bgDlexj3pTLFD/TVKu44xwgcekcV50vMMBDdgSo=;
        b=L/T7NRSHs5FdMVA08ZNXX2ihmhWF0qWhCsqMLtTDWG60opEv5V9Lb/s3D9b5Cfmgkq
         P6aO7Rgw/0Qj9P4F8Vnnp1GJlVfg2DXfSEUw7B+wvTvFUmL2o1qVWYt/E0DiMVrIhQCk
         9Ol3PvglbPyVCo4u7GmjXeN0kdI3zPOCigOKZ7K8ZBlss/WPiW6nWLSqSwSTwzpk7NQm
         0+JFevnLoTejR27Rl4h9JLTPzveF8NF7Z6SrwLB1Dtoj2b9eUsXIJAi1H5Q3s9JDukr4
         xe01tquB/1wFmwMZH1bclcpEFKD2Ifcg5jER16e2mxGGhocFkL4XBlckN7G+f6P6CPTJ
         VMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734150; x=1786338950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJn8bgDlexj3pTLFD/TVKu44xwgcekcV50vMMBDdgSo=;
        b=A7ACNKzmOfZyi6dWlewqh/9ztEKFx7c4MfWIZrJwznpSJD/rJzldpxX2XdQ29Q7jyF
         hOP8TaE+g4jcOH1wsg1oMT955CiSIIpFRRGDhFF9+r/ZHJLKiDfq0zJ+fJL6IirTwFrx
         hm9WE9svvFxUGQGYgVoMFbTJe/9E1xzijFg1TfomqEyq8c3pHoCVWilgkaW/xXebZlay
         gRixGjglux76TfYKMWWBPSqH9PmQXmca7Dp6zKlBYmVDE1Y+SDa/W6gVGD4qD6GcJXe5
         kpkHmurAGAEa9KdAEIwUalh+UyFp3mMFZZJhXGCA3fczvCbC9yBLAMPjr8TCWp5xTXRg
         JruA==
X-Forwarded-Encrypted: i=1; AHgh+RpvJQ9Q7i27saG6WA8qvY1kBPgcMGWNNiwvhbLdwM6GF+smQs5jLkC0GDzgS4fuI32ZtF9MojmLwQyAV04YoLQa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdf3e5CaUpxe6A5QwTlYkTSUJ328KoilEx0QjKuR7h9AuBEF2S
	pBaz90JyXenRipOuCb3hem+fa2nIVuxKH0kwAie1MBVmbYXYZ47fXuwWBUmjQDtZ
X-Gm-Gg: AR+sD10PVOz53B+Dmr3pJ3TtDlmDiZJKaEGaPZPLSOW7HpM7vZWJ/A9K5wboqrmKreZ
	G7dmEpqRRpT9ofK7Ltrm3DHmf2Le6MfWDVLd0NPDc5CtXzjBcFuNG1jARXXz3FpZF+7A6rDBJGP
	T7y/qhiyA5E3umEfaAi7fxOgkGXfqXX2KB33yo94vMXum6sh0S72xaGx4XeLC696Z4z4f617mBx
	LO3k02ys1Ga+ux+nUdrccALxUs83WI3SNFDhh8FEA8bcYYxNhYvP83jsuqMXSevLSOM/IqHI4mA
	OlUp0oz4Pn8B7VOGE++bH5jbEYKB1jc9hAeBAOT/sVPm+E0FOLbVuzXRcVYjUvapqdOM1fYE7sl
	hbb7tKbCTbqAPQQMcHpZ+IOu7Z7TcGPmVOffk3uZXuOdim1/Lb+MjpaFAHW8rYn+clV5FlOAO9K
	C6qTB2gGD9YTOqSH0eSfxAWTB9Md05s01K6cbqASyaaWmIf6eS0Z2ceU4U9JTOZ0aUhxy178SA+
	TpwVLKMnK3LVdSv++m18t1GmA7OM7QROh9IRqxv6yd678wVX4KULpeBGT972vUmoGUwcxt4r/ff
	zq0qbgzELnGA9dYvZvopEWIQDhzQu5fux5f4+ahjDlMg8ZkACAm9gz2TnR+UL9LwgZxJFMds3Mn
	BTLqswolwjXPAyP4U
X-Received: by 2002:a05:6830:82eb:b0:7eb:c933:eff7 with SMTP id 46e09a7af769-7f196f0d0e1mr13285248a34.9.1785734150243;
        Sun, 02 Aug 2026 22:15:50 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:28 -0600
Subject: [PATCH 18/21] arm64: dts: allwinner: orangepi-zero2w: enable
 Ethernet expansion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-18-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221551_215114_B3FC4B62 
X-CRM114-Status: GOOD (  15.30  )
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

The optional Orange Pi Zero 2W expansion board exposes H618 EMAC1 through
a 100 Mbit Ethernet jack.

Add a reusable H616-family description of the AC200/AC300 EPHY wiring
alongside its first board user. The forced-ID link PHY selects the
populated control path and AC300 tuning range from the logical SID
configuration field. Keep the AC200 I2C controller and AC300 MDIO control
node at status fail-needs-probe so only the selected path claims its pins.

Enable EMAC1 and its PWM clock provider through the common include,
provide the board's 3.3 V rail to either companion variant, and make EMAC1
the board Ethernet alias.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi | 61 ++++++++++++++++++++++
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  | 13 +++++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi
new file mode 100644
index 000000000000..26521429957a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common X-Powers AC200/AC300 Ethernet PHY support for H616-family SoCs
+ *
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+&emac1 {
+	phy-handle = <&acx00_ephy>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pa_pins>;
+	status = "fail-needs-probe";
+
+	ac200: mixed-signal@10 {
+		compatible = "x-powers,ac200";
+		reg = <0x10>;
+		clocks = <&pwm 5>;
+		nvmem-cells = <&ac200_bandgap>;
+		nvmem-cell-names = "bandgap";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm5_pin>;
+
+		ac200_ephy_ctl: ethernet-phy-control {
+			compatible = "x-powers,ac200-ephy-ctl";
+			nvmem-cells = <&ephy_calibration>;
+			nvmem-cell-names = "calibration";
+			phy-mode = "rmii";
+		};
+	};
+};
+
+&mdio1 {
+	ac300_ephy_ctl: ethernet-phy-control@10 {
+		compatible = "x-powers,ac300-ephy-ctl";
+		reg = <0x10>;
+		clocks = <&pwm 5>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "calibration";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm5_pin>;
+		phy-mode = "rmii";
+		status = "fail-needs-probe";
+	};
+
+	acx00_ephy: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0044.1400";
+		reg = <0>;
+		nvmem-cells = <&ephy_config>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200-control = <&ac200_ephy_ctl>;
+		x-powers,ac300-control = <&ac300_ephy_ctl>;
+	};
+};
+
+&pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index b340bbcb710d..e833ee267c83 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sun50i-h616.dtsi"
+#include "sun50i-h616-acx00-ephy.dtsi"
 #include "sun50i-h616-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -17,6 +18,7 @@ / {
 	compatible = "xunlong,orangepi-zero2w", "allwinner,sun50i-h618";
 
 	aliases {
+		ethernet0 = &emac1;
 		serial0 = &uart0;
 	};
 
@@ -54,6 +56,17 @@ reg_vcc3v3: vcc3v3 {
 	};
 };
 
+&ac200 {
+	ac-ldoin-supply = <&reg_vcc3v3>;
+	ephy-vcc-supply = <&reg_vcc3v3>;
+	rtc-vcc-supply = <&reg_vcc3v3>;
+	tv-vcc-supply = <&reg_vcc3v3>;
+};
+
+&ac300_ephy_ctl {
+	vcc1-supply = <&reg_vcc3v3>;
+};
+
 &codec {
 	allwinner,audio-routing = "Line Out", "LINEOUT";
 	status = "okay";

-- 
2.53.0


