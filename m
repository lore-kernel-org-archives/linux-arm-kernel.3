Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2056ACFA465
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZZgc7NDi6YlZ282tPqnjhZ3qjRGLRGk4q9ZK0X/XpA=; b=1OtquX3ZEzeOEBVBsULOkdQzTE
	cIKc3fSMstD5mAjSa1i8xFLQeVgi8NtMcMFnm/gxOyGYvoe1lYZMWUdmjzSHcJN55/l3rg+dJWHsc
	v8iiFvTzqm4jib4qUZb+Ow70ejvjP6r2ntP0akNjgPaaO4Jn3TQOhjrLLVqLyEkpIyU9FiT4Rjs3O
	584fB448XImif9iw4iKujEEzjs2v6cOjRIS3VhPh2ApGqhUZoWGi3M8RuJV9wh+mXTJM5zJjtq6zl
	RDpIA9gPqwRW44ieUgHT9A/RuN9XeNot5k45crlmjTXjofhZsjJx2P9fHHsa/TKWa4QRrD5YzJn3v
	2rWaMjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hh6-0000000FmiY-2H3g;
	Wed, 23 Oct 2024 20:11:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h0U-0000000FgXD-1ORW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:26:59 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7db54269325so87324a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729711617; x=1730316417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZZgc7NDi6YlZ282tPqnjhZ3qjRGLRGk4q9ZK0X/XpA=;
        b=hdg9C+EJ1pBEi1MkcCrh9yLnXYujRgYLF5ByunVouk7YwHlPDcYK7t9hGapSsg/BMf
         MGzU7CzyMysZdzIrh+X8rzf1AfYjTDQH506Y2Y4/lEt3TDPR1ir6iq0zN4TkSbP1tkFa
         Vgs6LXj2bdUgWWMSiK+qI2K+NcxfU8gxlcPTa+9v+b2Z/++dA4KSKLFvSwKJ0iAL0K8J
         /fyBRQIrX1mN+u095d+MmN+nsaMDyU7YheHfmZK7dsnev4sajHaqdYlIC+3etpLOK1C/
         S8WHvPQXvjRzdOY9HX0nWIiRiaYvKBUl1LV4KhPOhLylJ9IQ7VybU2YGSPbQJ9Qnqsrs
         M9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711617; x=1730316417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZZgc7NDi6YlZ282tPqnjhZ3qjRGLRGk4q9ZK0X/XpA=;
        b=Po44U1QjnOMUa0z02ISDVSZ65mLg11gUiHbn7YgJ7urxlkiWvnHLWotOt/SwVC28se
         3SsZ2WMy/K+xl15okRgkNDLH/KHPtwvDKVRDmuDvCLkt1GpL9Kx79FRkFZxjJ3pQg2wy
         N+Wu2fvHjuIrEu4/doEikMccjA2xq8fQwr6jqzpWd4kSaUujefsXD50dhHH6PHc1rAVG
         9p25n6tKZgMmyOamfsGSqDAF19ygPCvEp9tnDPE4pbC63zJiUlTZBdQhWTWw5xPUajtJ
         Tq0uTHVwFMkN3rDJ2VbG+oHm/jsSEGwVxLVkOlPzQWu1OkdHU0vPzsdlV1DPofbIH7BU
         y7tA==
X-Gm-Message-State: AOJu0YwHFmdISLDRgVubnYyODM+Q4n1XbZ17JqnpWDZdlyOagd8x1oC6
	riN+lbsd1erO6N9T7McAN3sbytjrNvjmy8YK3UHiG1v3alSeNDfv
X-Google-Smtp-Source: AGHT+IE8cfK1Q3ro7s4ioQMLwil46AxPf6iM3nXK71sYBrDHb0MP+dy8N3vAGTBNXN/kiXG3Lo3xUQ==
X-Received: by 2002:a17:90b:3890:b0:2e0:894f:198e with SMTP id 98e67ed59e1d1-2e76b6cdb36mr3930784a91.30.1729711617201;
        Wed, 23 Oct 2024 12:26:57 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm1837839a91.54.2024.10.23.12.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:26:56 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] ARM: dts: imx6sl: Remove incorrect mmc fallback compatible
Date: Wed, 23 Oct 2024 16:26:37 -0300
Message-Id: <20241023192638.1214045-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023192638.1214045-1-festevam@gmail.com>
References: <20241023192638.1214045-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_122658_396908_2162146D 
X-CRM114-Status: GOOD (  10.87  )
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

Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX6SL is:

compatible = "fsl,imx6sl-usdhc"

Remove the undocumented "fsl,imx6q-usdhc" fallback compatible.

This fixes the following dt-schema warnings:

mmc@2190000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
	'fsl,imx50-esdhc' was expected
	...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..0883dee72bb6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -859,7 +859,7 @@ fec: ethernet@2188000 {
 			};
 
 			usdhc1: mmc@2190000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <0 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC1>,
@@ -871,7 +871,7 @@ usdhc1: mmc@2190000 {
 			};
 
 			usdhc2: mmc@2194000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <0 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC2>,
@@ -883,7 +883,7 @@ usdhc2: mmc@2194000 {
 			};
 
 			usdhc3: mmc@2198000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <0 24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC3>,
@@ -895,7 +895,7 @@ usdhc3: mmc@2198000 {
 			};
 
 			usdhc4: mmc@219c000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <0 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC4>,
-- 
2.34.1


