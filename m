Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A3EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GezTh7CEZSGNy/hj5QCxQQLoFC/kezBwPCYdh6zNgK8=; b=Jdpd2PaSDHVVQFmNsg11ZZgNeF
	AYG3aLlU0uMM9nP4e9XrI0h0b0ADomxVqipHun4OC6hRubOmsXJSaWpaeFf4GWKjoXJMV/z9vjIjw
	WBk9fh5PTrEO2c0sXoOqz5toAeWzKEFFnbkrim0H1nKegc6PJl1RzdestkTX/pXgBSUaWECz6hY8r
	Onitg3BCiNV9Wcl2FV4BUo1MwAPn8m+Ls87tkb7PtmqzV9i3VO0IltY0Hfu51tRo5yhFzcJ+3XnFk
	y4jzXh1l+tQi8WANKdhvKmEUq50NPqXZQxB1R8BldkfpuMPq0ZkUHUVJDk8UKbQjfmsYV9rfDP2dr
	zyHPWNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqZp-0000000CbWm-3Uli;
	Tue, 13 May 2025 14:25:49 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqXh-0000000CbDq-24BG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:23:38 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4def13d3f01so1676596137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146215; x=1747751015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GezTh7CEZSGNy/hj5QCxQQLoFC/kezBwPCYdh6zNgK8=;
        b=dEJJDyhqLGY1z71eMLWM95mnxXo+BeGj41fqJ0ZgkTynNLEAlc2GU8rxNHE+UxTRNf
         nfWY+I+V9TPyZW7HcnTl365jnsFDUF+1OYCQD5KDxbHxVs3GBBpOHrrhHGCis2Vrnscw
         4jq4A4Q+jtMYm9NGrvwnpDbBSAB/G2KmgNhTiAhAelZtCHzNe1EVEPx/Elk7lgoNaqVq
         RYOtMRRRlfyZvQPg4TKoHZbY9Tz2Kt29lkSXyumdjZXfhF0zzMOYqtWjDsT1HaViehdQ
         udld2D5bI9dNT/Vm7U1eB/xAmdsMDvxNlq0qudkXDIS0tJD0aUevOl74vU4Pwt7RaL6+
         djQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146215; x=1747751015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GezTh7CEZSGNy/hj5QCxQQLoFC/kezBwPCYdh6zNgK8=;
        b=GcsOyB2nxAbXIBEHAGBs6c/h5wgr1dvWT6/fqmU6nyUo2LNDVwwWBV/JNRN1719725
         nC79hE3HEYkJK+2xJRGvLYDhYNdkCIAhyU7JHl8461ucECmhstzvhFyy9IxpcRXhw9Zq
         XCdDkvQnx5sEM3puQarrmnFmF0wXzwKFU5o9Rl98jRumcoQYggSobsQfLuFbExIeWuaF
         LHJRw3S8lQlFtTrzyuvryJS/mp3rHjHuzBGL7SwXODg4GeUB5qTnLzp/D/lsynw0YU1+
         kL/UaQbZc8cKpCD598wqeELWx8oVJjONrsXsNsKoaGzIFFMWcWkodZE072Q4hDtyjQ/8
         hIiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxHS8+ecykqR5+m/gEVTaDt60cXRVN2ffENN3tr2vh683xz9MZf/9ZjUdgNPosePsJnHRakc/pgBVCPPyw7VTZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyClg7MO+5jy4oUIZiriKH4fxkX0m+oHdnKkg892JpfUqS1jL1+
	faUcEJdVLYsEXxixrwEAzeHMT4GpMmQAEfELKQUy4ZXCyXkSbOa3A/80Hw==
X-Gm-Gg: ASbGncu8/ifkFvQlOAk3JvrFQqclJ6FpvjbzkZzJCEX1apIMXjxXIeHD2md2rQi+7m3
	r+FmxUAqDDi2b7m51Xq8eQwS48sFkDBed3dubJisIzMBKj1SkuYE7KUMpKt/Pe8uw/kn1QOEdhL
	18AjUMd+4HOUY7Mt0lP4f7x0wK/2T09cwWU9N4x0t49Sd201g1OXusjlNvEOLZL4s6/LXARglt0
	aKv9gBqplCxdjAeJ6M9LVYR8jFhAHHrmuFIu98gTCf+G9hIOe3Z8d+rLVr1gCBljguxDjlg9/7c
	eyRTjGJtoZQHE1aDAP/h1pBTLx0rVCt7MvXoLjGL1iuAxdfIeAFBV6FiKk8EhDW7rA==
X-Google-Smtp-Source: AGHT+IHGcQgMwPPAEGBJfJrJEY9x7HjJUxv3RHs7/BaUYX3k0+VoevK10R8gdqCI56LzymOxCbK2Hg==
X-Received: by 2002:a05:6102:1586:b0:4c1:924e:1a1d with SMTP id ada2fe7eead31-4deed3cba69mr12923184137.18.1747146215203;
        Tue, 13 May 2025 07:23:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5c18:acd6:b894:dc8f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203c26bsm6630965137.27.2025.05.13.07.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:23:34 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] ARM: dts: imx7s-warp: Improve the Bluetooth description
Date: Tue, 13 May 2025 11:23:18 -0300
Message-Id: <20250513142320.4036324-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_072337_536467_94CEACD3 
X-CRM114-Status: GOOD (  11.55  )
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

GPIO5_17 is connected to the BCM43455 BT_REG_ON pin.

Improve the Bluetooth devicetree description by using a more accurate
description of the hardware as per brcm,bluetooth.yaml.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index af4acc311572..b66e612d3329 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -43,18 +43,6 @@ reg_brcm: regulator-brcm {
 		startup-delay-us = <200000>;
 	};
 
-	reg_bt: regulator-bt {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_bt_reg>;
-		enable-active-high;
-		gpio = <&gpio5 17 GPIO_ACTIVE_HIGH>;
-		regulator-name = "bt_reg";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
 	reg_peri_3p15v: regulator-peri-3p15v {
 		compatible = "regulator-fixed";
 		regulator-name = "peri_3p15v_reg";
@@ -288,6 +276,14 @@ &uart3  {
 	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_bt_reg>;
+		shutdown-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
 };
 
 &uart6 {
-- 
2.34.1


