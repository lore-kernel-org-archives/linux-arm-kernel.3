Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F82C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 19:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZJfOLRNyb+7MiF0dDETPj7ISQ89kkt4dtcttV2i3h8=; b=DR8++ByfeXOjak/6UzukmgZlU/
	4xBK3NyRCMbbamMcDGkAVhDwfTq6sDj3E0b0RxIpvDvy/SqZEHV7uH6eBFWghkxazHymOe4wIXj0g
	seNmuhoxi7QgBqiwO4EgKRiRso0YdoK+Vgz2QIvFeELhPIZGnCf6+9VRiOm+ecJhtjiZBW3hJAHe8
	oYwPWKQd/ajyC+fP21ga43rccuZ/UUOjgXeosySDX6R5sAfUb/6uevEOCsA5hG/1F1CwVgQbL56aP
	yAddQOSH+q5YzqOnp+WRGhvU6Uj96sKXnVEbZSXoSGWa0PBSNDX7DMMBt64L1Aq1cjjTtgZtbMTUE
	t+iR6eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvNc-00000008d9K-1niO;
	Sat, 22 Feb 2025 19:41:40 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvGV-00000008cWA-1GB1;
	Sat, 22 Feb 2025 19:34:20 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5fc13355a5bso1469578eaf.3;
        Sat, 22 Feb 2025 11:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740252858; x=1740857658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZJfOLRNyb+7MiF0dDETPj7ISQ89kkt4dtcttV2i3h8=;
        b=OVEf0Q/k7DBiT3Be2RWi7Q/6+H0I94kOMvb0PqxcWXWv8aarqeuB5C4THzqPU9wF7t
         KATmnSTlCBxhInb3lhGRaRESRfZsv4EERVG+tJbKhroetFC/b5NradLO8i5MiA06aJPe
         E7Xa6CtEEUDJXPNUUNhvprsjBbxKfhRj1/rVW4yUJTBtfH/AwFJwKU5n0WX8kMqaL+4R
         arK9cqx+oRhARj9D1YpNJ/X6tguYhS8M4pgT+tltSGQC4Z4Si5aVnC5A7Q8bI3NmSmpF
         Y2T6+D8NV/wTicB4HQdREDho7N6mKLIFKsspXZ9dhx/KoUDy9WbdRGEt+Rxv41jyMn8R
         LuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740252858; x=1740857658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZJfOLRNyb+7MiF0dDETPj7ISQ89kkt4dtcttV2i3h8=;
        b=pEnGhALI/HEYfuLnAnnEyUf7mjnKz0atwl+szocFQXVSgCQt2iq2VMkmqT+h3hVZgN
         z0NX71HlwtJLMVqJK7JD7ZOxC/kSXdfo2MuDY5/7jcgu3fEDKDrBt3E7fZcTwnY2RICV
         S9HBUQqV9lvUP40e0OlZfCX/Qd5po/dvfx6k8PMIKd47AZOt9WhPWDcr28m3ULeZPKgn
         sKQH7GHN8YO6xMqYAEqAvodEcvXqm68tzY8hochhZCM+W9W2JI5eEjAhjOCd17mBRDyV
         OD1/qnW3P8MkWgUy+Lic5+8rR0E2FBZ0kvOocst5cgS28n5SYJh/c3L/cA1Kk6UW1ZFJ
         Y5ww==
X-Forwarded-Encrypted: i=1; AJvYcCVTWEGIdHnqwimu9bKRd6ViZQIMi7pr5naT3IyGLxWxc4YylmRNOwrqcwU+6Yi556izQG3dzueh6ZBTu0vnNmgZ@lists.infradead.org, AJvYcCXqp++e0V+2RHNT4rXOaOUUap0qL1lC4gqWzQtJXnBYN4Q6wjQHfumoHp8li1UNVkkv3hKAzvWzB6ZNbcvepdo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNHoNXSxv10Yi4PXuveBhzecsWxvZnD+A7hykhd0pRlnO1htkI
	K4NhylXiAMoJB/Meyi6Nwo27yxbjEzkt0sfHorDYhv07267JTRi5
X-Gm-Gg: ASbGncuK8zeV62F5J/SKPzmrKHyjiBWTg5S0Kd0nIy/wFL4wnXJd3EKAOjNyg3zzyw8
	k4SKnZ1z1JX0a83oJhdsfrIATQD2BiacWm1nmrrgW/UDQiMsLJFhdbRpwFuhoxtrJ4okvQeTzmg
	DndX97+4+AwUrhc8K/D5h41aulTx330+LHJ0hD4wW8bcwF4saBI5z+FYUYGH+nN+Gemu7PMNbyL
	dIYMhan1OPqzPKBw34d2fUiqUACD/C16Njw95k/TQJFeYlE7Gbcfy74Y5iT6iPMTPMtKnQChUv6
	rMqNznPE36USbwc6T6HN+9F/EejwpH5YvA==
X-Google-Smtp-Source: AGHT+IEFP0r53ZXTgL60gIHSGqk9U5lQ72WxXnfCIJYXnmeTVZ9xDCe1lgDArb2xx+SVoq705EIvkg==
X-Received: by 2002:a05:6820:310b:b0:5fc:dd26:a087 with SMTP id 006d021491bc7-5fd19625a36mr5464393eaf.5.1740252858231;
        Sat, 22 Feb 2025 11:34:18 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b69:ffa3:9d4e:2cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fce7afabd8sm2724012eaf.34.2025.02.22.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:34:17 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 4/5] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 13:33:31 -0600
Message-ID: <20250222193332.1761-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222193332.1761-1-honyuenkwun@gmail.com>
References: <20250222193332.1761-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_113419_335326_B902AE70 
X-CRM114-Status: UNSURE (   9.60  )
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

Enable the only HDMI output port on the Orange Pi 5 Ultra

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index 06800733d11e..a4db0839bcfd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -5,11 +5,46 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-orangepi-5-compact.dtsi"
 
 / {
 	model = "Xunlong Orange Pi 5 Ultra";
 	compatible = "xunlong,orangepi-5-ultra", "rockchip,rk3588";
+
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+};
+
+&hdmi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdptxphy1 {
+	status = "okay";
 };
 
 &led_blue_pwm {
@@ -32,3 +67,10 @@ usb_otg_pwren: usb-otg-pwren {
 &vcc5v0_usb30_otg {
 	gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
 };
+
+&vp0 {
+	vp0_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp0>;
+	};
+};
-- 
2.48.1


