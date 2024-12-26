Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF5E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCq4pgg3ghZQ5gyCQM0kq4IJL3Ban35pSeSFFuGXBL8=; b=pRLfrXfS490H1TH8VgKJcEIRO0
	k4/74RKNgYyeE0Bf48YKlkyYnS+W4QwkabqaNMr7/D0/2APv92whJWiT8IayRu9rJ/EDNCSQlmclQ
	RxEYCI7V00tq/VKpkBOIeuuoqtnJCb7aJY/fw4CD2e3/HiEuMMXoapIpuBTXbCe/ZGI7V8DiMYtuq
	9zqOcnQW8FeLOQlTSKaqNWXO4JPHKJrQIKu1LxmQvoT6TyJv2tr0bSoN1B1g0RwyMeeoH4094+dgb
	Cvsi0NBYp+xy2XeL26ixMOFaRpVQZCNIYomeFYmtkxYSXiwOjKwAOMASc3EwkQDbts/G1YEZePmdx
	ZDs0cT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQvzA-0000000GW4v-1Hhs;
	Thu, 26 Dec 2024 22:05:40 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQvxb-0000000GVvp-2GI9;
	Thu, 26 Dec 2024 22:04:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aab925654d9so1217271566b.2;
        Thu, 26 Dec 2024 14:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735250641; x=1735855441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCq4pgg3ghZQ5gyCQM0kq4IJL3Ban35pSeSFFuGXBL8=;
        b=dy9sSkBeJghSX8YhBq3qMXae5HBYT7Cz5DsWBfkmEpB9hDaTniOME/2kdiDb2ahN08
         xwVJqX8JjmagoiYfF99QLqQHKdy6bSq58S1cZ/Pu8+TgTyxMPmTYqF41/2x+e1gHYdzo
         To4qNL5yKvbRjcahB12USJW9UHcj0SsRUYuIxyq1TDsTJEWNgU3krO57v2aij1PowzC4
         ur6b3eBhlV5BvWDDln2VZKs1sO6Bk1qiSDHkaVSlU9Xrkmxip5lu9WDfs6S4ZyxwMPNQ
         vAfd6DEeGAXT88Hh1RCL7xUn/VwddTpbda7BUMWn4lcT99F/tkNvNDLtAQAcX90ub9YT
         QD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735250641; x=1735855441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCq4pgg3ghZQ5gyCQM0kq4IJL3Ban35pSeSFFuGXBL8=;
        b=ZX9gJEAbkJdY3RogiPDbqWhiexPkDXBt0Tq+Ki5F/Psb7Ww4Gnn78VqfMVM83/r0x2
         RWGhKQB2h5+sGBSO/TsOGq08N2E6ZZYoz8ZSYC215QArI8rc72hptqEEes4qGHoY/Omc
         1qpQnjUFhiYsGqqPksoko3hk66vebdq66LaB1LqJRs9+moJmEVliFNJAnbMycFVISF8w
         PTeRbVoBN+wdT991b4lqQqPKe+c3pfnR3xrRZCjf7KUyzn2pTPkA2b3E9W8NQVBQEckG
         GHiF9QsHT7rEBvfagPD3LGCfzxQcQyMYu1mHrk+ExNpvFSCNcgrgtVhsn6kGQXWjXgop
         BYyA==
X-Gm-Message-State: AOJu0YytMVlfiymVGMjnDH3yGO2bwxQXP89llyPb32/z31xFWJICj+Mi
	rj72y5nVg2BqDnj89d32eZxQyVbCWm5NTt/Szwrno1v2iawpsMGg4kpPpg==
X-Gm-Gg: ASbGncsbUdgUNtQYMZjv2J6mXNbH2/xwrlW59M3JxRIUqnyR+stnPNBaLg6SMzN90Lx
	Jb6Tt5DNqfh8VoszbeTfdDVUTGYGFDaLgsE/uS0w8gWZ1I1ZLyZq1qp4FnYW3tHIVKYSOOP7n2U
	1UM1Qpn7Koo4Oc8lf6l9PRsBjKmekohxYcM4swLTY5Nrer7YnsOuI3gddVrgSAozeV2myVcAYt+
	NuDBD4zdx3+h3Q/emMWsP10eB3AKtUOfQi00MSo1heIbWMnfhEmKk/lPHg4MoYXSVanavUt7V2a
	gahP/kQy5rnhRcBhEJnOTtF4YWYOR1oBvaUd796JDbSQHtXxMBCmZzB+QixcVn5+mc7MS5NXECm
	WkpFkZ4k=
X-Google-Smtp-Source: AGHT+IGuGLsLz0eg3XnX61A2VWimbSnHZ3HdwaSlpZ2eb6Tkhezt3kD08zYUbIsbh9VNY2rsmYs2HQ==
X-Received: by 2002:a17:907:d9f:b0:aac:619:7ed8 with SMTP id a640c23a62f3a-aac28748b30mr2394212066b.7.1735250640729;
        Thu, 26 Dec 2024 14:04:00 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-9da0-ce00-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9da0:ce00::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e82ede9sm1011815266b.2.2024.12.26.14.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 14:03:59 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] ARM: dts: amlogic: meson: remove size and address cells from USB nodes
Date: Thu, 26 Dec 2024 23:03:52 +0100
Message-ID: <20241226220352.965505-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_140403_587416_89D038E7 
X-CRM114-Status: GOOD (  10.23  )
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

The only board that actually requires these properties is
meson8b-odroidc1.dts but that already sets it on it's own. Drop these
properties from meson.dtsi because otherwise they can cause dtc
warnings:
  /soc/usb@c9040000: unnecessary #address-cells/#size-cells without
  "ranges", "dma-ranges" or child "reg" property

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
index 8cb0fc78b2af..28ec2c821cdc 100644
--- a/arch/arm/boot/dts/amlogic/meson.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson.dtsi
@@ -255,8 +255,6 @@ rtc: rtc@740 {
 
 		usb0: usb@c9040000 {
 			compatible = "snps,dwc2";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			reg = <0xc9040000 0x40000>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb0_phy>;
@@ -270,8 +268,6 @@ usb0: usb@c9040000 {
 
 		usb1: usb@c90c0000 {
 			compatible = "snps,dwc2";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			reg = <0xc90c0000 0x40000>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb1_phy>;
-- 
2.47.1


