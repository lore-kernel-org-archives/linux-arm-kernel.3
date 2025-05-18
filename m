Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF1CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1jcWHYj2Bjj7Gqb8nwWrV3vO98Qb0ffMBHjyALl6BfM=; b=wf7SycHjsk34VVLgrYRnsy35fo
	jm5CCkjwRuMt9TdGyUp55zH/sPtTX4URpkir7uyRTBt/i7HdZftTQ3fDEioWsPcBYwGYw7iaK1bJI
	vpiypvQWidbVue1+YIrRRHnJ62o182Z57zX7YJFfMp6GGBDUYDjvFB0wknjzoDKPbX0qT2kSLqGIl
	zUyTWKucrrlIYItDg25NS5eoNLLpUiejY0kIdWhGP4goRsb1FuYTN3TYbWrFwSjsCFkJUt3LnokPL
	+wPL4hB3sCE2JnFPt4ktg+MJcS8VZBSHUJHV/wP6QI0fl+GonzdTV+rmk2PByeuHV92LmzV/DBs49
	AWk+fkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm4w-00000007Zvs-0JDW;
	Sun, 18 May 2025 22:01:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm2v-00000007Zpj-3URO;
	Sun, 18 May 2025 21:59:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso27045165e9.2;
        Sun, 18 May 2025 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747605588; x=1748210388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jcWHYj2Bjj7Gqb8nwWrV3vO98Qb0ffMBHjyALl6BfM=;
        b=Jrt2ZU9eNWYQzKAGb7bjzf8c3ynk1dTz2/gkPQ+T/Q+mRT7AX1zfXZlk7kk9iXdDDV
         8bbqy19CrUESLhZ+O1V8/ceiOTsWRqQJ6tvk5sCOkSDT+c0YsA5l1IY6V2zyVRQxb4S+
         pGieEdSWvjtUX+xe7fVhQjQH15Aeq/TnRsAhJPfLRmSg1glyQIYMUiJ5mouOKaisowGP
         Y08MgtEqSNOYL185DMGP8TBJODUjNtaZVRZA2s/gIqWa1i57xH7z9CDcgOrsZIE1WqKj
         Z9WeSloTrEE6tZelteFrP4kn1i93OKY63dkKIn7VjH6X9l4/zqE048eA1Av8KkXVxNXq
         wmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747605588; x=1748210388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jcWHYj2Bjj7Gqb8nwWrV3vO98Qb0ffMBHjyALl6BfM=;
        b=Rdre6P7mWxUac/oCe50gKqshnf7JFeqtxlXUIv5Y5GIeyDjbXH0rZLm2vOKrc+QhLW
         PlZFSILtlcAmlm9g0ayIJ8lWQpDLZVqTm6OWTSlnI1nbKJAABtlETk3lr51aFVQ/cR+F
         9Aj65/vJhSM1CA4PSGeD4YiN1f6Lm4TauPJb94keMk6fp9TnjjesP8kDy6LbSqR4mFfD
         uJDVs9JE8YFDlgYX3LDyPzaIkGGl6bksUIsVfad/Tr10jSaaCeLWCZRQ58ay59BlcVIw
         Tio/x1U7dhvNwnmCZEKer5sgkLZLo/020Li3CrXbGNmTG7sIQ+t+jzinGmsesLE7Bhw1
         Fmwg==
X-Forwarded-Encrypted: i=1; AJvYcCU2EcQ2V4ztIzRb/jovYJRPukwsCYPzacxf0MaSnYC6ZsWsf3GyMAEXue4DrT0QmOysubBeRQEpaiYx9HpZ8JH+@lists.infradead.org, AJvYcCWRLmv/UtTP8paGHs2W2v+V4uVWJSAuLISy/Kcl6GiT1XuS5IAqDdIISjP9aq7wnQ3g5zNugakyNpIyEGow4jY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP9hFmMc5vWPj1yBPTpWItxZWUlqOuf7wPeE3t5b0a0pdtBEZV
	6pqxj8BZRn/XIBuYlhnwpU2RgFkAtH7hw/IpjoJmkdGd4qOlkdFDUSjM
X-Gm-Gg: ASbGnctYsiX8ru0LCVnhLLGUxfiZVtBC8Yhw3DGIrHjlP49GNVPlpejeHxZGzXjdtSe
	Kg2cE/J4H7ghalDj3JZHFx9aVo2EKpl2QBUDMNIAbF8Vj0t2MjGzi4SaQ2ZZBT/FHmD1//xM47v
	tv/rTtAyZZpDepXfwtMij9dv8n/6VVbSDoy89yeWKnHqwzCtPPGN4f8d2BsZPZNqw1PRMyxm7xt
	MrYGs1bL4aPAd2/abrFDDQhtOhH80IicnIqoW9seUSpzIb1vbb7RTSV1PL4uaZRITu9r4wNHl/i
	sjnIF65FvJ+5B5IBUB1NAfxgy1ZMkiLz7RqPMdpEF/uiIGcIexSsWFwBQi9kdhjk6bML9CguiEy
	mIBq6dmaAnfbDfKDLGcbJLglAJ4ffHQSvuMM8+ThRnu+n9oZcsNJtdVWHqyp7do83t8ADXz2nar
	S0Kzo7YovoEA==
X-Google-Smtp-Source: AGHT+IHEoNHpgy/GHjNzWJO4qHfmQbt3TtQ05k1RPPmbrZqKlkbHKvDWBWg0LpEWKjRbnreSuLjTHg==
X-Received: by 2002:a05:600c:1d96:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-442fd60b8ccmr94872805e9.7.1747605587518;
        Sun, 18 May 2025 14:59:47 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef81csm185711995e9.34.2025.05.18.14.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:59:47 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: drop touch panel display from rockpro64
Date: Sun, 18 May 2025 22:59:33 +0100
Message-ID: <20250518215944.178582-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_145949_873161_D9D7173A 
X-CRM114-Status: GOOD (  11.39  )
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

The touch panel display is an optional add on for the RockPro64
so this should be an DT overlay, drop the panel options in
preparation to add this as an overlay.

This effectively reverts commit b65155c786c4 so as to add an
overlay for it.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   | 64 -------------------
 1 file changed, 64 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 51c6aa26d8285..e848ea6efac3f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -20,15 +20,6 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
-	/* enable for panel backlight support */
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <5>;
-		pwms = <&pwm0 0 1000000 0>;
-		status = "disabled";
-	};
-
 	clkin_gmac: external-gmac-clock {
 		compatible = "fixed-clock";
 		clock-frequency = <125000000>;
@@ -116,14 +107,6 @@ dit_p0_0: endpoint {
 		};
 	};
 
-	avdd: regulator-avdd {
-		compatible = "regulator-fixed";
-		regulator-name = "avdd";
-		regulator-min-microvolt = <11000000>;
-		regulator-max-microvolt = <11000000>;
-		vin-supply = <&vcc3v3_s0>;
-	};
-
 	vcc12v_dcin: regulator-vcc12v-dcin {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc12v_dcin";
@@ -590,19 +573,6 @@ fusb0: typec-portc@22 {
 		vbus-supply = <&vcc5v0_typec>;
 		status = "okay";
 	};
-
-	/* enable for pine64 touch screen support */
-	touch: touchscreen@5d {
-		compatible = "goodix,gt911";
-		reg = <0x5d>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <RK_PD5 IRQ_TYPE_EDGE_FALLING>;
-		AVDD28-supply = <&vcc3v0_touch>;
-		VDDIO-supply = <&vcc3v0_touch>;
-		irq-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
-		status = "disabled";
-	};
 };
 
 &i2s0 {
@@ -638,36 +608,6 @@ &io_domains {
 	gpio1830-supply = <&vcc_3v0>;
 };
 
-/* enable for pine64 panel display support */
-&mipi_dsi {
-	clock-master;
-	status = "disabled";
-
-	ports {
-		mipi_out: port@1 {
-			reg = <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint = <&mipi_in_panel>;
-			};
-		};
-	};
-
-	mipi_panel: panel@0 {
-		compatible = "feiyang,fy07024di26a30d";
-		reg = <0>;
-		avdd-supply = <&avdd>;
-		backlight = <&backlight>;
-		dvdd-supply = <&vcc3v3_s0>;
-
-		port {
-			mipi_in_panel: endpoint {
-				remote-endpoint = <&mipi_out_panel>;
-			};
-		};
-	};
-};
-
 &pcie0 {
 	ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
 	num-lanes = <4>;
@@ -782,10 +722,6 @@ vcc5v0_host_en: vcc5v0-host-en {
 	};
 };
 
-&pwm0 {
-	status = "okay";
-};
-
 &pwm1 {
 	status = "okay";
 };
-- 
2.49.0


