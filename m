Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3B8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 21:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QGYXaVM0zRhN5LB2AqsM+NfqTKsJxQEiTbVn2J1DL3k=; b=w5aj3aQkRFIrNdTznG9HbJ7Umo
	hrwiM0KLvJ47G8OOZW2kQIGcGbO9yygZav2IPnCUfB7omX2d3ms8YSzQLwECtzCi7DYyV94eYQVQm
	WrUVfBOQZz9Clw34tnJyugAvc90p9Qza7mRVxepAFON8QE5487abkjFKt/BbnrwilsAtINYEn2tC+
	FK5aIpZWqTxruJU9yIqjUbTF5lTIGYxpBWdrQ8Vg5qwwty1cVFn61wWy4+gE8yiKu2LUOfnfYrHas
	fLEVdWXfzt1McbFEVGo6WYIoULyc66C5m967R8CMPxj513UAb9vpU3dq9uXKJvs1uadsf7fHkJyn7
	vC24lVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuDT-00000002fkS-33zA;
	Mon, 06 Jan 2025 21:00:51 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu9O-00000002evi-1B55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 20:56:39 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7b6e8814842so1283088885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 12:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736196997; x=1736801797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGYXaVM0zRhN5LB2AqsM+NfqTKsJxQEiTbVn2J1DL3k=;
        b=RMWym6LDHqs3MqWlX58SeY3Zj9i1dWbDPXdMEenxff9TOByEJgdIdbTWr2sqo4hUmc
         ZLV7uDdb9uEfkXNz7/jFHpiYT/UhDTSH7kaXHSZmX9YUC5EqoZxDbhayFMa6L49rZ7V/
         9Lhm44FNhZNypKL67+Exdp7o1RrO2mpXkWZ7E8dzaCm4vFS4BLhX4drR+c1NRPmYJ5gs
         Qil5rR14fY9dVn4Do/0PQVf091tHqIwsoRaAjZyausXLVCw6bLGJoG1rl5rfj30EoBSd
         2vlb1YMPBl0vSvGBlsLaXUdjTjet3pVAOuWgqk/abZLlkA9BB/j6pLP0hpsVb4NBOB+y
         xAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196997; x=1736801797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGYXaVM0zRhN5LB2AqsM+NfqTKsJxQEiTbVn2J1DL3k=;
        b=vnj+/2oylBEa6siXk/nZ/NwSm8QxzsUgSMVarYs4Z9YGkw3zdkU5eQ44inzSnSr/iP
         /E8RNzKls7HY/ked+Mz+RHe6X2ecbm3IUL5bl913M1QoH+ZssAdTRUStwTNbw8n3ZXa3
         I8xh1mOz4YCdGjHp5wz6JldsJQuOUC7AEbULekWVEx9v3ODQahIYW+pYoD+mC1LakgQR
         8VqXofDLmByOqbLSqZG7hn6UXCRMkFTEpGVLZQHCanjuVzPBQTpZt9ZBsWe27+s4nUoM
         HD3nTi/RfH5D9o7kdEZ4eibsyHn4ORaBrkD/HY1sGAdGScggU/RYmcjuKS1ennGO4NVh
         Yqkw==
X-Forwarded-Encrypted: i=1; AJvYcCVBFdzK6aklbwGxOOGeMVM6N0+5I69Vm5Q5MDHCVhWwsuAP/SAU0VXNzs8aQrHLF0R3rIBVuP7Px4eEE+xLiXhU@lists.infradead.org
X-Gm-Message-State: AOJu0YyCH0s1OgCeuYRQ2kGMSA8BBa8oOx10GEBcJzaTUVn1s6hvFeWv
	FCiYESkV9LeTOhlo79mRWh8tDmKWF6ftgn8dDLh2QXmwo1pD6Ad1
X-Gm-Gg: ASbGncuDTMjt+2ruIoA/MY2mP1jb+J67numTST2idmjMI1du78Es+3Jfmgsm56qBDdy
	FNTBDZQJrC4r2l+gJNF6Tlj41pqeAW4CEeI78qjAADoXlaPEp1xdoV7dMg9mMGJgx13wt3IdF09
	gXQhGB4ErsOeRPbRGYUqO69b1ClKqfEwEo/2b+IjJkp7sHK0dfQPR7I3l7a9FLbpHyKVVA38Xxl
	wKHCCnw1E417bj01Z9NWH1Xx7JypjXPgkSs3mlpqLkmtx4pwXrZEz1k8q4TtaKRGYz/TG1KffWd
	3EeK+FA6Zxj5mxX30NxOVicQP28yKef4M2GKUg==
X-Google-Smtp-Source: AGHT+IELbgusOdDCViGqWCWb+1+z8xDfNVcf5K0XK1922cW3ojCmzZQ/KiW+9YniO+lVhx6xnwHvaw==
X-Received: by 2002:a05:620a:318c:b0:7b6:de65:9ee7 with SMTP id af79cd13be357-7b9ba7ee78dmr10289860685a.43.1736196996749;
        Mon, 06 Jan 2025 12:56:36 -0800 (PST)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2d15a4sm1538745785a.35.2025.01.06.12.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:56:36 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linus.walleij@linaro.org,
	arnd@arndb.de,
	--cc=imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>
Subject: [RESEND PATCH v2] ARM: dts: imxrt1050: Fix clocks for mmc
Date: Mon,  6 Jan 2025 15:56:35 -0500
Message-ID: <20250106205635.2177321-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_125638_315054_0947787E 
X-CRM114-Status: GOOD (  11.63  )
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

One of the usdhc1 controller's clocks should be IMXRT1050_CLK_AHB_PODF not
IMXRT1050_CLK_OSC.

Fixes: 1c4f01be3490 ("ARM: dts: imx: Add i.MXRT1050-EVK support")
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Add Fixes tag
 - Fix line wrap
V2 -> RESEND V2:
 - Add change log
---
 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
index dd714d235d5f..b0bad0d1ba36 100644
--- a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
@@ -87,7 +87,7 @@ usdhc1: mmc@402c0000 {
 			reg = <0x402c0000 0x4000>;
 			interrupts = <110>;
 			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
-				<&clks IMXRT1050_CLK_OSC>,
+				<&clks IMXRT1050_CLK_AHB_PODF>,
 				<&clks IMXRT1050_CLK_USDHC1>;
 			clock-names = "ipg", "ahb", "per";
 			bus-width = <4>;
-- 
2.45.2


