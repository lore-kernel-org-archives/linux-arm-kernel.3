Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CD3E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 23:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVhjLtK52HqccD+5q+IAAIu0zKotPYRO7A4TSqMJjIE=; b=d2/TvToyL2OwfVePdxuRNiEv/H
	VVdpVZWpg3ibeQJnoX+807NCQlHsWguIHqlSk45qlCi2gqE9csj4JnPhPOgAVvFZhaKgkCBdJ+RMD
	HyN68gLxbIhDKt8FBdLApyCTDug6NtyUSXZgFqKuA2dA9fknm0qaah8RKy40dah8xEKNUTUcY4NwD
	iLSBg9kA4Tvz0W+MjXHPw7r+gWv5Lq2jqquRb5Dl80Lr/0QXPq8EIxfPFOssmQMEgXs7v0efHYPZb
	u60H8uB6H0t+Q0kadTuZo9avlsr2pjVhI2BjZTRgIpJKRMypb+zkPyVuqvbQVKquVngC5R/9lbOTU
	lvRfhKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhFd-0000000F7Xp-34kr;
	Tue, 17 Dec 2024 23:45:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhEY-0000000F7RD-2fEt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 23:44:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216395e151bso1473895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 15:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734479049; x=1735083849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVhjLtK52HqccD+5q+IAAIu0zKotPYRO7A4TSqMJjIE=;
        b=XCHTIIj8G6iK8wkfrWCoHfe0IdyMElSfLL4edaPxDMgACmkcD2QbENYoo+xhgCH+J8
         PJOA8Hz8pQwEiUp468Bdjnp1me7+S9caoXNtE0NjaCLsMV83Hc57P23SdhQ5GB7iRRZ/
         E2Du8K3dm0mTjQ2f1zcG5HzhD/c3acmF7NW9gol07yB2dk12Auj4jF5sqI/e66nF/349
         ZOQLRdUFPNuBUDSlr38xnt5RGvdHVgTQAA3ZL32dC3TdBOuoCVzUELAMPckVw7eGyXdv
         VFbJ4mqTG5HEseIyrPBP/pgmflKy5RLE33lPe9roKT+TqVPXQq6c3bpZBStX9zq66y6s
         XOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734479049; x=1735083849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVhjLtK52HqccD+5q+IAAIu0zKotPYRO7A4TSqMJjIE=;
        b=F3WMs5+dTK8il1pw+lcOmzqg9Ww5CO4E3JPlv3baAwPNuc+wtaKiTYO/GgzHtYtvqG
         8zRsnpkl3mCxtFDkNtMeKI4U9uyxsr0gLDwJ/JmzdELHrKDRMCQRpF+RfBnpW3jk1sQk
         WfUs4R8tS7NRQaZ0pnXIpzYUAOEhxBRbUVcX1VbkZNSZ48ViAeKAMu7/pYcyybP7SKa/
         +BLfZfRQQ/Wzd5MwOGdEF8GdorxZwCssfsBetYApClDkdNanqbHP3V2atGWmWEjaTjRM
         wI78lr+HpJpgxKjicSjQGjcZfoRGROxg+E9KQj+BYhXUclKGQfIOGeFJ95J492s8TdxP
         zoFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwDBhJX713+3LnILhdhvGn84ijgwN3TUWqSAN98dEaw7fFneYGvWqavs6RY4PMyayTkxa8atOcZcH4zBeDKHx6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+UK4DzIjwLWAqLgRE2ZX3lLWlYiL/5JLyj9dyEq62m2B5+ukM
	Bq0qDOX2pyHhi7/94bbft/hvh85vayqhGmrZ5weNPj6QdNRp/49a
X-Gm-Gg: ASbGncsKPIhZcSeCNW/8DBokzJcHlxQwowSOyEiljVK9IAixXjAdtjd+xIordFs+wek
	NEaTccR6Sc2+6nxCbK9f3wfOoz6EAmU2Vb5TnZnpuDNVSbYmv43N6D/EizCn/QwWG5/J7I55KRs
	9tyTr0pKTuhgMoBqqQrRg01+RBDlre1xE97YYz5mJw0j/ayamY0vPf5bG1SxjuUP7v3sAgz1RDg
	bGh5Z5jDN52wlSLnX1EbF0vznOMqQhV7CcF7lMwVlOKyvzpHeMmj+qU137zw+uMCIgPqw==
X-Google-Smtp-Source: AGHT+IEOORShiG8XXoYl2/Cqm8zfdvBzPJZnXZxkuNnjr6iPaes5DNRpLHtKXXX/KVEXVIFuLKigLw==
X-Received: by 2002:a17:902:f646:b0:216:1079:82bb with SMTP id d9443c01a7336-218c9262ef5mr94735665ad.19.1734479049436;
        Tue, 17 Dec 2024 15:44:09 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9c22:b0c6:8519:2b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e720fbsm64746865ad.269.2024.12.17.15.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 15:44:08 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx: 
Date: Tue, 17 Dec 2024 20:43:51 -0300
Message-Id: <20241217234351.71130-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_154410_676018_9856AF7F 
X-CRM114-Status: GOOD (  11.51  )
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

From: Fabio Estevam <festevam@denx.de>

mdio-gpio is not a valid pattern according to mdio-gpio.yaml.

Use the generic 'mdio' name to fix the following dt-schema warnings:

'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 7cd17b43b4b2..06545a6052f7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -160,7 +160,7 @@ eeprom@0 {
 		};
 	};
 
-	mdio_gpio: mdio-gpio {
+	mdio_gpio: mdio {
 		compatible = "virtual,mdio-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_swmdio>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
index 625f9ac671ae..26eb7a9506e4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
@@ -37,7 +37,7 @@ usb_vbus: regulator-usb-vbus {
 		regulator-max-microvolt = <5000000>;
 	};
 
-	mdio_gpio: mdio-gpio {
+	mdio_gpio: mdio {
 		compatible = "virtual,mdio-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_swmdio>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index c1ae7c47b442..aa1adcc74019 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -94,7 +94,7 @@ aliases {
 		mdio-gpio0 = &mdio0;
 	};
 
-	mdio0: mdio-gpio {
+	mdio0: mdio {
 		compatible = "virtual,mdio-gpio";
 		gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>, /* mdc */
 			<&gpio2 7 GPIO_ACTIVE_HIGH>; /* mdio */
-- 
2.34.1


