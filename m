Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0244DEDEBEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSARJ2xr5zNTwzjTW4AFghqGY8Sq94Dgx3SRmBpQfjE=; b=xH6LlqF/NAWNAeUzZR7a3Yvnlv
	qp2EqJWwNBIZ+xRrg+55yiZdku8FoB985oZG6kMR4Vl867BKASDaysiCfCqdS5BAslByU+pJ9kvrr
	Kv742dX350Mj8teau30ElKoyuIWBPk+FUi3/2KXIHaLu2Mh2xNF08yFc/y+kJ8nwv9wBT2jQ8FGEO
	kU417Hh0VklUOnTUlohjHoj7v8bbo9wLGf9CJu15wFOv7GloOM1n3Z9LNTwSYHQNuS/t0TYDHkX+s
	ZMQbTVD3ab5jfufXbSa6ILyy5ZQyjot9ayAJCXhalGBI0Xtu4kmQGzDwcuMM6Q0A5Xp+rakqDxkt8
	plLVASDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVaQ-0000000Fowz-1u3I;
	Tue, 03 Mar 2026 19:39:18 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVaO-0000000FouL-15z3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 19:39:17 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-56a87098868so2177230e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 11:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772566755; x=1773171555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSARJ2xr5zNTwzjTW4AFghqGY8Sq94Dgx3SRmBpQfjE=;
        b=e6iPwnzlruXjH2nXASfxHMM/dZmv7TLYLJbGcgcf6yT1fOBJpjBOk6S8YSJPHQ8wP3
         2bxlMxKNXhA8d2WQxKmkTB7D4BO6EHbStSTuhHKR6MmcrVXHG2jcPmd5HI5FoapzsWRl
         ojRO57gxWngmtAIiv/i5C/7bLIw2SC4MPAKX1iiFg6SbQUW9TDORCuVmaNmM5K+u3PQ7
         t8+wU+Z8aKfg79UmwHLrYXdVGABr25eigDYoAkpAE0vpL/4Du60EWrGYreebWiXfuCZd
         jyK/aDkxawhrGSZwRgb52o2kiC4X+lyuvKIW+GphYwEkAI8Yd+p9Xa5GQl0Zz5xpaiOW
         +oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772566755; x=1773171555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSARJ2xr5zNTwzjTW4AFghqGY8Sq94Dgx3SRmBpQfjE=;
        b=Vy7TrJVWvAh8b/2Fo7uowNMnlSRB38fzKBXRPEGUCOR1oPEwB5dfJ2YBNlkpjADfh6
         4WDf0pMWu9gqKkKSYfl8Xr09HucwUvD5SBPZJjza1eMb6imzgASecdWAB4kQ7iwb8I41
         67bLCkRIt78eprlPqdbUnLPYmPENYA59r/YUs4R1qKeFw62sx/3avSWuu/244Wxm4NW1
         8GPliXLkk4HS9BAWrGROZjoIc2gUUMl8NIbEMmwFjThCHNioVWuqdWWIYCWwTpqslVjF
         jPyQZ2bSq6f9DDdB8z0cLkJmQJtqCeqEOTFz9RWjomb5WrHWUeuWL/zt96l0KRANdjON
         nWAA==
X-Forwarded-Encrypted: i=1; AJvYcCVj1NYtmmOVk74PMjvjbE8ufEct9eoxPZdgluSXl6l6LlD+z5XCcRN8TMGtjDUC0agnQ6TET7O8DAn0imCXPPpq@lists.infradead.org
X-Gm-Message-State: AOJu0YwN0cbDdNNPAFyiWs9GqDuYM3V97huohU0EgEN65jlxt5sI51dO
	uy4hIZOiRdxo8EBd/BOvMq7K1Bl9T69KdQ83BImq/USP/KZJLW3cYEpm
X-Gm-Gg: ATEYQzzLdowSRMPPTeXt4eB68ikBcvAPGJs3BioxZAiUnQK7PtZg5TeDQb2r/COa1EH
	ptGtrqI4FbuMAk0XxF3OulsAzseq1XPFmAY6s4oZvfZz2fdWRRzQBX3UNePrOSzkNQAg9xGIfl1
	kmwQPaXzk8CXBVPptnEpW8DE7xB7xjs9SMKVTcsQPsjQjAeKtpV7Ck52RdKcTVxDXgGTrGTPG59
	oeEbTB1h4gnIBl3Q2hFm6OlVgopdsvTjrNhYB2dpmrTGUMpmjA+Ayaa9Lkxfj4VHYd4s6LJVHqk
	dcpRjq2snmBeXIyQcn835OzAfvpE5B43aqgas2bK4YZo6suTvv77VG6z1BAmoZUtV8YS72DtoDQ
	4owiA1Ltsc6jxP9hJjI3soiB7i3ndCovLWjc6Y8zNiN0fqbUGztlOVH+MxuyGL7XXn9IBWr9Zbi
	BGgLE8BYLOrCwd0crZuLgXPhVZPzZbbJgrcuhwezIJi0UPwMpcRWT5dyyMpQ9qhxF0VsQu
X-Received: by 2002:a05:6102:c09:b0:5f5:402b:7ee3 with SMTP id ada2fe7eead31-5ff3232ba39mr5986835137.14.1772566754755;
        Tue, 03 Mar 2026 11:39:14 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:499e:12bf:3287:5753])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7af30asm17780456137.3.2026.03.03.11.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 11:39:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] ARM: dts: rockchip: Improve GMAC description n RK3288 boards
Date: Tue,  3 Mar 2026 16:38:55 -0300
Message-Id: <20260303193855.828892-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303193855.828892-1-festevam@gmail.com>
References: <20260303193855.828892-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_113916_309226_D3CB68F3 
X-CRM114-Status: GOOD (  13.04  )
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

According to rockchip-dwmac.yaml, the mdio node should be 'mdio0' and
'wakeup-source' is not a valid property.

Change it accordingly.

This fixes the following dt-schema warning: 

Unevaluated properties are not allowed ('mdio0', 'wakeup-source'\
were unexpected)

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi  | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi b/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi
index 12ab10c4adde..0816e388852f 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi
@@ -100,7 +100,7 @@ &gmac {
 	tx_delay = <0x0>;
 	rx_delay = <0x0>;
 
-	mdio0 {
+	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
index 26817848c154..3da105060302 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
@@ -98,9 +98,8 @@ &gmac {
 	snps,reset-gpio = <&gpio4 RK_PB0 0>;
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 30000>;
-	wakeup-source;
 
-	mdio0 {
+	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1


