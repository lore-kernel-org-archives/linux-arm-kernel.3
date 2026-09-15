Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABEBC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=; b=xPrYrBGuO4l0amtEm8GBfhPPy8
	mX85X8AEIVzLG1XY7OD9WxSMXz+KgU6bhRjPfCv5yjyW8prnm7gla+lWkz96aGSsZ6lEDHw9Sgq7K
	4r0QRhH5pm0ZIJXYnWonYVyy1m9vtUBqzfcUWa+X6078Jtkofn6103BvvuEvLtmeEpXlUuZCAUh2Z
	zz6fVCeQ4/gEV6k7vV0rzNlkGttvU1azjGqZM1PTGeywMXvzap0XwgSiUJxFt5tTJfCT7F3iMR2yD
	JH01JYRTWPCXXnsPogggm42syq+BsQd4dhYsmb7mD4qlMmPN0sZHFAFKjOYvKQ3fL8AmHgju5aS4K
	7ilR0a9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qdf-00000005xfw-2aU0;
	Tue, 15 Sep 2026 10:43:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QdV-00000005xVv-3jfE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=; b=F3wC0/xExy6ai4nOksEEZp0eu7
	h1G90/3Xrs9sSt/h0Sq2B42GI35njzp8WqDMwkU1or6MTfGpMZzg9lboqR8LAfztE+Bb2g9+/2zMu
	4v8Vci/xwSEPzCZIlsiuAtxyrTg5LMS+TnrkjzLEIxfr8wZjmoma4JSbUwjTHGNuWju+u7MlFMyZD
	0m/tPvRvyD/sPX3Qq7WMZWpK5FQqU0EIT4ZW+KYqY2zFfkVdMODvaJgZK4CCPYVj8uM+QJhkK1JHb
	v8wsIhxMfnfQ5ec71MTPbhoTdpeuB2d0I0CdhMpfnORVeP1x+azEPDSRRZZl9Vm4dvRXNjvjzPB6f
	eVinyVNA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6QdR-00000006Ziz-3goN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:43:36 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912df756so712055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469013; x=1790073813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=qxj3kn4wumonhncF1hRXNHyhCZm9nCvLFRvJQC8nawfQzu/Ol3umXqStgsJCqYfn3/
         E4FuK3n0WYTN9jieXKzBO1FXKJjs2JESFcb70rbtHhDIeYNbdZwttdwc+r3E4DN75Oe+
         lpM/AHXeRGIqJxzU1hcMFApi4g1rWLkHE0y5wy4QX8BRZpaDZv+AmqGrnkyhF0HEwCMm
         pH1sUtBZ256Nud0108lwA6MFZxa8+7z48jpLJTgyw6FUHwRayn3kHXbKF7HLuUEgIkdz
         AkT5veFLuEza6+UuVHyYI4+we0qkPdPLJYm/7Tjh/t3NRfVQKjTZcrSTlAOaYGBvKTGg
         cDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469013; x=1790073813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=LZxsBccxp+N6Rfxq7IUgy1HHqZU30jsjNRbtL2lNbsB1yFyqCODhOWk0cU9/A7n1fS
         X+3Olh8FTUsbZZHLQn2kGo36+Vn8EqC8bYraFQFOYKsaLBzGT3OyuvJ7and5eAiH1w34
         GnjDQE4bb3pKHNvbTf87InAlTDjspaC8lddPFB2+GNGDERICeUVrpn3jDuk9XnuAnA4T
         5b9Tf1UzqYF3LYJ+whsydJ3AwFfSK0bhmIQkg/Vj9L/IoaZ2zUerhVPUmJR9Wah9fjoP
         9pO6sh5pw4bODZXb68MXjqXcLpedtW6sapevp5w3Rrw8fE2eQS9oaZPiBZHm3LDaQTuv
         gmuw==
X-Forwarded-Encrypted: i=1; AKwUvBzVEfEG9eBnyUQwOlZJViSKcQNDAjV/6LzK5+Gqfz4GDETpQr0nau9kx30yyuiUdQaNV+xZs41fA/LOLJA+j6vQ@lists.infradead.org
X-Gm-Message-State: AFuF++mqEu45yRaJt2MJCggWYIAFw4A5ZACCC3Ql35z8eQeKdFn0flhQ
	p7liBpywIoIoiJ6tRzDuxXI6zwbqyIbo+s7eNzKoRZ02m6FhRR1eZUfq
X-Gm-Gg: AYBFou2zcqQtcWl9BnEgYAxKlyotJ354I2hbAKftWSywYwrvFQgalIp+0tWIMaUnQrg
	7Z3Oyi9UIZjEVD182dkUGkGQqkfbY0PEhaN++xXcA2UVOeprxucs9fJchEnb/6TNyiyPBbffMkf
	ZwCj6ndMCYsw6NpOZJkUp6zMnxadn4dTdq5n+BAMCVDrFqWvsW6/DpXGGuHNv5C0KTF1DMpadta
	dwSvcWW2nBOJ2VLR3t3QycBW2txBDC03dAAXgZbK1oaOvDF4ZSa32GmjJbo2GgJ6p1XLxtIl7v5
	f+wvFX3StLgBvPWEA+vtRZFWCnb/Xhp/XyxzMeup1htUnNZIdaKLYsg0hpJrnK5mBXer6zgdrpL
	A8xQBw2vsg8uiuL6Ru8HKydOtld/eCJ9Z7uj/+3Dm2Ya+UClBvmacpvXWJxDXUbRJ5zjxdj91GI
	lCUoV9HtaZLXjYdcEqdRlwEhvTiii52LzujYPVrSBwgdQQY7A4r1Ro7kPgzFgnhbMNv6xH/le4P
	5OLJxoWuNalsu6txCnJDO3Z8+ijMaSzInp5X33DtVBDpeG9443T1KsJYS5VciynmZVRqCtOP0+s
	/w==
X-Received: by 2002:a05:600c:3548:b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49e822a6d43mr7233625e9.30.1789469012386;
        Tue, 15 Sep 2026 03:43:32 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:32 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:49 +0200
Subject: [PATCH v2 4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-4-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=2044;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bGK8ht4ZsYBRwxHCHXvcjD3xAuJ63yHglUCiy5arzTU=;
 b=yeWXeDtjlbYXnbnHo+rBAMifURbyetkigWkciYlnmz2Njk1RBaH1wo4bBYUGlJC6lwRWoDU9b
 tW+D2K+PqmFCxhdXa68gYb5iLmkYhzprkayLva/21NsCifePTjlEZH3
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_114334_032590_772F82FA 
X-CRM114-Status: GOOD (  11.62  )
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

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. Add the device
tree nodes for them.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..b7a527614243 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -973,11 +973,21 @@ sdgmac_grf: syscon@26038000 {
 			reg = <0x0 0x26038000 0x0 0x1000>;
 		};
 
+		csidphy0_grf: syscon@2603a000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2603a000 0x0 0x2000>;
+		};
+
 		ioc_grf: syscon@26040000 {
 			compatible = "rockchip,rk3576-ioc-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26040000 0x0 0xc000>;
 		};
 
+		csidphy1_grf: syscon@2604c000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2604c000 0x0 0x2000>;
+		};
+
 		cru: clock-controller@27200000 {
 			compatible = "rockchip,rk3576-cru";
 			reg = <0x0 0x27200000 0x0 0x50000>;
@@ -2848,6 +2858,30 @@ hdptxphy: hdmiphy@2b000000 {
 			status = "disabled";
 		};
 
+		csi_dphy0: phy@2b030000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b030000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIPHY>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy0_grf>;
+			status = "disabled";
+		};
+
+		csi_dphy1: phy@2b070000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b070000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY1>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIDPHY1>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy1_grf>;
+			status = "disabled";
+		};
+
 		sram: sram@3ff88000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x3ff88000 0x0 0x78000>;

-- 
2.43.0


