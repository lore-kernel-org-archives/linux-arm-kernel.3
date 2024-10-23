Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC3CCFA467
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZ6VmVLdmhY28VtA6wAyYo/0YXHAiwZFjFaUDgu9nIM=; b=IwyH+6yVbIwsDe42/K1j+zu1FD
	DvsC5gTZefRt3lt/NtR0Bj9Y9psK5BEobi6yDqvrT6WcS1Uai3k6b8lBTQOC5TZD75NSe4GvcsAon
	OKNzJspIOHttH2P2UugQ6EiJ4JwMpQKc8ema4EOdMTInvSG4QTw85LNCmFqGf+FR1uqLQoE+eTk4n
	GWDolJ5OhjGJOzSYHJhmQQrmypiuRz5SMXZ9J77xrB8aw+R6B2DIWbfUGmn7vcOx6hPhHgXpl/mir
	U5rnlg8bMiahF/8T3hWo9omQ1cVaHuqU7UBEVXF1MCHXMfpbjkdhD/C9c84rQZcMC9G4HdY4/HHMl
	j7I7nAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hh5-0000000Fmi6-1w8i;
	Wed, 23 Oct 2024 20:10:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h0R-0000000FgWj-2BDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:26:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso154020a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729711614; x=1730316414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ6VmVLdmhY28VtA6wAyYo/0YXHAiwZFjFaUDgu9nIM=;
        b=jd8ZZhXtZV9pGjh3FGGtTQNRZqE/LRZKvKStaVwmM3jjil02lD8/R0C7Xt1yLa9+Bh
         9ZGnlJAHMX2ADU0lFTqD1C+6Ws4Z7qIHnjhYkkW7Tjw6elOptois+t52Nz73UUd+s2gB
         qLPjWSvDrVcbUtd1ArtWURuwDThu3TIs6p7GFE/f4B4R8aNg235sAjSK33relj09Vrfh
         tS7FKmx38fLTfSahjSQBa0493CuOHNa9W7wbP+39Jg2Mypb/c+G8fP+vkiiMzB4T/j/U
         JlHikwfikjtUda+DKzngozDUAeCMEAZnFVBWAio2bGhbgh7bDtS8uGjrR+Hjm54BzVPE
         WphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711614; x=1730316414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZ6VmVLdmhY28VtA6wAyYo/0YXHAiwZFjFaUDgu9nIM=;
        b=UjtjW5KGGb1VlRabAym9Jdjp2dl1JddYrYJ7J4ifR591Z+lCHpvRjHgYwffgYoWjzF
         S1MslZ9SlDaCqqL6g65eI+pyFyO6aLrPCcI8ulkTHdaZk1eozs5UM4DcamXNphktfw0M
         GghbyA526CVCxdXqajeeBWctDB8Q5nSgcAwT0FWUEDROIkcqBBWyFdNvMTcTUzri359+
         0W62P/ETut66aLHuLLNYdIKmHfE7tLEj863CLkPr1L14ogR9rAIfkZTDBCjzz4WbiqkM
         2+1YDfoiZecq6arLOA0t2CiuMcnqzuTkWMZslQo0Mt/nZRLVcM1NqYJb1ET7bdEYIsPj
         qTnw==
X-Gm-Message-State: AOJu0YxSgynNCUdDQi4/JcUE1zEIdvsAwan2RAaxBhcPT5aTTcBNJiSH
	jXFOSiET3vZZyemXSH2iJ5JpqV7FTDWujcm0hlA7/GLAxwyPh3cL
X-Google-Smtp-Source: AGHT+IE7vid8RJXkhmDafU8mkpKEz7Hv+OtCNibLynfuRwXFP6i8LTmLMJHyAoI8Jc308/MOiT1EEA==
X-Received: by 2002:a17:90b:1e42:b0:2e2:d61d:60e6 with SMTP id 98e67ed59e1d1-2e76b60d423mr3473435a91.17.1729711614266;
        Wed, 23 Oct 2024 12:26:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm1837839a91.54.2024.10.23.12.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:26:53 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] ARM: dts: imx6sx: Remove incorrect mmc fallback compatible
Date: Wed, 23 Oct 2024 16:26:36 -0300
Message-Id: <20241023192638.1214045-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_122655_584677_B093187C 
X-CRM114-Status: GOOD (  10.40  )
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

Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX6SX is:

compatible = "fsl,imx6sx-usdhc"

Remove the undocumented "fsl,imx6sl-usdhc" fallback compatible.

This fixes the following dt-schema warnings:

mmc@2198000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
	'fsl,imx50-esdhc' was expected
	...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index b386448486df..a94bebaa858a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -998,7 +998,7 @@ mlb: mlb@218c000 {
 			};
 
 			usdhc1: mmc@2190000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC1>,
@@ -1012,7 +1012,7 @@ usdhc1: mmc@2190000 {
 			};
 
 			usdhc2: mmc@2194000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC2>,
@@ -1026,7 +1026,7 @@ usdhc2: mmc@2194000 {
 			};
 
 			usdhc3: mmc@2198000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC3>,
@@ -1040,7 +1040,7 @@ usdhc3: mmc@2198000 {
 			};
 
 			usdhc4: mmc@219c000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC4>,
-- 
2.34.1


