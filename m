Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7FEEEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SfTOA/uhjIWDRFqoiON2tAx3e2cujwx/eei4rDUEnkk=; b=SfO1Jt74mtI/eq/mWpVgHzM0M5
	zBohYInKwl6yQW9Xj/kpyk5oAMSpaQXKTwqknGVN4m/8UjPrl8jm0U92/77dJl9rrN242F7BAbT+/
	8/V8VNnKB3Oiigr73MxTnD4pehjziDd4bXk5VZEvfoVkWVnMrspEZRPgPVtPX61aCo/niEm6ruPfL
	hVJOE65BdMPtgUvnWv/t9TL44QhXh6UIr6m+hfzpzXo/glbx60Valr8kGX0mhkwf9mjYv91zP+Rny
	fbKIHLTLhiD6mDX/PbjHRrx+ihJlsXk6ZSPhCIwhbAKlbSbCAjIADRlGD/o1fnYU20MMevaPBhtEL
	b6oQySAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbE8f-00000006hkl-3Fr2;
	Thu, 01 Jan 2026 08:34:33 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbE8d-00000006hk2-21Ta
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 08:34:33 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0c09bb78cso81190635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 00:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767256470; x=1767861270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfTOA/uhjIWDRFqoiON2tAx3e2cujwx/eei4rDUEnkk=;
        b=CCDUcRSg+srnJxIi0Y2ygXF1nQYSQjpLvURmhRhs5kj1qvhqpZ0t0UfTSXZ959NDy0
         48rszHvb1McJ7xq3i8Wb52ARfMx/z649QfyVQTYYwCzVyFrpllHngJ27ejpYk7iWMaZV
         ts4BSH9MfRcvRhlijreNVEIkHPf7E0z+8zJjE4I0jw39NLJzDaq8ODc070bUtbr/jFdb
         uG7Q+eige4CC6N6belS10zG3nR+tT5nWx3pk9uwguc2aR9vuNy3x0P+jJmhRoGP1wzOO
         btSfcp+lQsKe+izcsFhU0JtYvR7Bpdch6EmdGaj8XXS/AeVFWg8i6icScQtMmgqGLxsL
         GSJA==
X-Gm-Message-State: AOJu0YzPSjUqOixTdJZSGdmyJhHtTgwR2TvtDkGXuqmJd/WH3XlfKdcr
	mvSBTGPyTVi2CfkRRucEZ5dt53jzVQBsWIfBIlrFTJUqWEaW9Ev4qkfk
X-Gm-Gg: AY/fxX6QltALNR9ph1cLpHn777HFOa/VRcMKWPFXThDV5l2t5tcJsEdOYckTHo3XWKL
	i0WnFffrrkBnLtNyKWBe0DsE2HSDSAmd+U0ESPqauVuUgsKQHK/23rCkH7NJpDhefzSuWllkiMt
	R0DbdlfKhSmW432Afk2ZQtSEsw1UAtp7N0YACbue+tROCd6V/rMO6F0gFHqW9qtoxrdqq9gyZ9S
	DQm/fJ/kF23ijNWpQt0cv15RE+pp3qZMFg7swUaZQ6On1d0vJjBHH4Fkgp40CGaH4qFz1EIN1gA
	tT0pS2Eh0kxPoMKXIKjJpvNyGqXp+shxNJzkuaSQH7859eFi5EKdPJeupgyRlG2HXYOy9shZf+e
	OA8ZnKJ6OdNnTLSfs1ii4oUcNKtFoWzaQaMTeDv5h5FX6g5p8fgARjjV0YA3fnoqS01l4sG0Gmw
	fBL9vDUNibNQG7HKXVd2O1
X-Google-Smtp-Source: AGHT+IEchdp5OT0VlEVis0i716ONVjQcLibPiNquq6bswalRb8A3Uv01Yc504XF0MP2wYvwY1MVYHQ==
X-Received: by 2002:a17:902:f688:b0:295:55f:8ebb with SMTP id d9443c01a7336-2a2f0d40403mr265291645ad.21.1767256469592;
        Thu, 01 Jan 2026 00:34:29 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec6bsm339904295ad.87.2026.01.01.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:34:28 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alvin Sun <sk.alvin.x@gmail.com>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v1] arm64: dts: rockchip: Add USB Type-C support for Radxa ZERO 3W
Date: Thu,  1 Jan 2026 16:34:15 +0800
Message-ID: <20260101083415.1327341-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_003431_530878_D2FA938E 
X-CRM114-Status: GOOD (  10.76  )
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

Add vbus_typec regulator and fusb302 Type-C controller configuration
for Radxa ZERO 3W board.

Link: https://dl.radxa.com/zero3/docs/hw/3w/radxa_zero_3w_v1110_schematic.pdf
Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 .../dts/rockchip/rk3566-radxa-zero-3.dtsi     | 10 +++++++++
 .../dts/rockchip/rk3566-radxa-zero-3w.dts     | 22 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
index 1ee5d96a46a1b..79448016ab490 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
@@ -35,6 +35,16 @@ led-green {
 		};
 	};
 
+	vbus_typec: vbus-typec-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_typec";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_sys>;
+	};
+
 	vcc_1v8: regulator-1v8-vcc {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dts b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dts
index f92475c59deb4..54f20856bcfc6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dts
@@ -50,6 +50,12 @@ wifi_wake_host_h: wifi-wake-host-h {
 			rockchip,pins = <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb-typec {
+		usbc0_int: usbc0-int {
+			rockchip,pins = <3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
 };
 
 &sdhci {
@@ -90,3 +96,19 @@ &uart1 {
 	uart-has-rtscts;
 	status = "okay";
 };
+
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3m1_xfer>;
+
+	usbc0: fusb302@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PC7 IRQ_TYPE_LEVEL_LOW>;
+		sel-gpios= <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus_typec>;
+	};
+};
-- 
2.43.0


