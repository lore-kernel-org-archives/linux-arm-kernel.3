Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAC9C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdfjMTseKRLHd2G7cfjnBpOTHSEyRnqoawGfi07bMWI=; b=HlYCo42AobcS3etGSqWAHOZ3O3
	etEjuRySKyJq2EEkTHUyZDi7ACtBR9ZcQueMVc2gt1JL7CqIb72V2m0n3qSRk7IpX4ZZt2jmgD5Tf
	jXHqwDceYvGtg7C35iNJX4BjBL59jrNEl8fVNmMxa6Kn/XmOJLfZuqc0NUkMeVmUnFAQeVZvCKHv1
	vWTBMNqFum9TZKnsP9UQqiC8xqbXy02LK2TuNeZaoZxHjpT2FIeWCYXA5jzjUl5OZrdfWClsYHYZM
	cVuT54d8gkJM8B8lgGuUSRrpv2VOLuVbhXFnEXNA7nXKLGXmouTMx5a7ZymlLreXNgh6+qV6LArtr
	+rL6Gg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tltOs-00000008ShL-1QYa;
	Sat, 22 Feb 2025 17:34:50 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tltJ8-00000008RlJ-2Tig;
	Sat, 22 Feb 2025 17:28:55 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2bcceee7b40so2044072fac.3;
        Sat, 22 Feb 2025 09:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740245333; x=1740850133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdfjMTseKRLHd2G7cfjnBpOTHSEyRnqoawGfi07bMWI=;
        b=bsAOLmUaJr4CgRNVUcyD3vvq7pCiUrm7X/8kStSw3YxDnUc44CeyJN28zJILvGpN3C
         UlMjOfrkTUy1NGoJnvOV7DS8glBCrRDNyLrGMtNUO2zWXtajtS2udNDq948XduqeCFvI
         AJInZ9FqnBoYIMEJR5w3mrBJLgLgjUz3EhI9G3Im4cONe/s0/BgqUm/ujT4XO9NU/Ack
         dEOBETjKvqe1RROmxpUoU2rnuR47RherEXtMoKHv8CmqQY6+OY3kKyWFl5DQRwuaenQX
         hAh2vVwQJsa/MlAoyk5bl3lO1odEMHpvai7fWHLtCc0ZlJwi4ofEB+53/ZrmAcEgwPel
         KjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740245333; x=1740850133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdfjMTseKRLHd2G7cfjnBpOTHSEyRnqoawGfi07bMWI=;
        b=W+ZAWpu6ycIC3HoGlAeuZePG2ihklDGYH/WlaASMgj4Dro7rd8NDsa8Eafd4Ky1hMN
         r1aoivKWP1YqLW3oVDSt/j7JAg4HtqY8FX7YAri0CEBUefClYZ5gpOE/x2FFxo0pvb+W
         ft2APa0R6F6BRfkHIMRXBy/yZnXIjzuz910bhKxENq4JgPpQJOfoQXZPyEE30rLQ1CNX
         JXy2ZUkAutU5Vdd+0W08wQadXL9vfP7U9Y7Mkzw465GwXoLRvf9ZO/1lHx4kO5BKuybo
         5Vl0fU89eOK6u3+OIisqHhV/rinKOXKqsoa/Dj8nosCYMvPkGkkpC+atf2dIE/8/oOyR
         Zctw==
X-Forwarded-Encrypted: i=1; AJvYcCW4rOQ1sGuYpg2nUq96ts8IiPgqgBII0wzX0vdF+J/JI3CjkP8zBXEKE1vIAL6qUhsJEHDWYOqLykF7wVUoTSI=@lists.infradead.org, AJvYcCX63A/AY5f+Xpj9BKtLf9IJ0SKaukKKWoq/kwaWBlcuhLHMvU3nxq1pclt5WFaCGVSL9gMUbfjoXokR5tpneHbN@lists.infradead.org
X-Gm-Message-State: AOJu0YzOSXTPvvL78vChxMjNxViThGjksRKbGBjSL91ly7Sk/JHokh52
	zgycNQnEvbTGVV6lzg3ViovWiQ0S2+w11Lr3mkeVu4Jz9N6/lwWV
X-Gm-Gg: ASbGnctdlD9WmdJRTiPpvdXoNCmRtF3PrhinvWP/FSWMY3u5zSbg0yft/MraA4+iZXN
	gE1Iam6Nb07IFnPpGD8jNHa9RXmTf3Y12UTjoaRXvvR3h1OK8ZVcRQ9lisKBoMvKhAcr+wGjNNC
	ezXUY4PuHQu3wPghDa2DolfTrvm2UCrOUM2dk0m/hjBr6FJytzlNU9puziyKv58zAyYvO3wHtoO
	yh8JF3loe3jHwT2ZE5PgJjiXGdmdid413hHMBKU9fW4JLIg6c9J6TW7AwUFB/E9f8vbYpLdIPsv
	s49IeBWlFUV4yU4kcgEqoVfGWm27oqH7E/A=
X-Google-Smtp-Source: AGHT+IHL+cfwNw54b6gC29UuxrpU5tB+fQvWP3jfylDbrcuOrZOvpNnigixv+P5O0T95vWiZeX7ggQ==
X-Received: by 2002:a05:6870:212:b0:2bc:66cc:1507 with SMTP id 586e51a60fabf-2bd50d01bb7mr5721852fac.12.1740245333600;
        Sat, 22 Feb 2025 09:28:53 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:996a:132b:43a2:f7b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b963a0ac4bsm7244238fac.47.2025.02.22.09.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:28:52 -0800 (PST)
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
Subject: [PATCH v6 4/5] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 11:27:51 -0600
Message-ID: <20250222172752.6254-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222172752.6254-1-honyuenkwun@gmail.com>
References: <20250222172752.6254-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_092854_625689_8EF3DF63 
X-CRM114-Status: GOOD (  10.01  )
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
index fa975c5db0ae..571a7f61bfd5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -4,11 +4,46 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rockchip.h>
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
@@ -31,3 +66,10 @@ usb_otg_pwren: usb-otg-pwren {
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


