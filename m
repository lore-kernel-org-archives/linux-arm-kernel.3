Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30625CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I93wz8CKpgQy+526q8lOXNd9GCplSJUpEI+oY95QMxs=; b=W0DS1Pj/gd74zE92jLKv0L6tu7
	bGd7HXm/Odt2l86wIxwK+2rwOPIKaW87SrPksNPAgoX+6UM9iu/4Z652QlBMl0XHeN/0hHfINHUv6
	eXqJxaETxlnJIvqMcTi5YH/eQc4zgJeJG+OIaBi9OoK7fqxoNBMwUvO+lhrM6cSCkrPCfOPBrlBqM
	I7CzhLNsEcL9v/5k3E8kWJMvgkcoTqgmzEri5cs0LgcNIBEx04HC9EEvWHszljZBkUI1WPx90RIrO
	Jqa3wKERErBLnH6qnblwAZRyjjqWoDg+x87wBEixb01pyzv3dsjdXaHJVbuYsU+kcOcfd1qpsyhHT
	r/YyunTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7n-00000003Akz-1GC1;
	Fri, 16 Oct 2026 14:41:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7h-00000003AgU-0n9R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1188365f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161687; x=1792766487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I93wz8CKpgQy+526q8lOXNd9GCplSJUpEI+oY95QMxs=;
        b=KHssiN3Xwi+yE2PUjosq/BYJE+k49z/bTW+zfzCkaMBaxiwwh5KTFad6WeOjWKbAVa
         SfrMqg8IEl9GXJjmuWQST/+eMyVF0UlsU6pHqB6Az1F7EwUjLd7rqc21YT2sa/400Eo9
         vT19bQLbpr0GOXO1Z/bLdBBpYdnTkTq2jDkB5bRS0bMI6BhSzLOVXiexUz8JojALuhKe
         JJvaBUVENyeSQOJuFW+BK18nXNx7k5+UCdHTjECARx/0qINZJHP8UGwP5pKAereQ7HYu
         Z/XTZhCDXkPqG8By5E0h0DDmlqr2Sm1AljUna3mYZZgFu0LeXL4bKFwkZs6u2kFu2gyt
         7RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161687; x=1792766487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I93wz8CKpgQy+526q8lOXNd9GCplSJUpEI+oY95QMxs=;
        b=N37Zl3P4QqSSkAmF2dwphiF3pVyLjhrt7Ely5dz4yRZEFJR4kf2dSONpHRhP58e2OX
         sLlpBZ6GWWilBZt/e9TS2VWVXgzZHdVDIBCMAv4bVtYA+j5GIPxwkuQEVi7VpKYnJadd
         7ASniPAycP+eHcPew6ALVplQYXQHN2cMWbowCwhFHvKXfunyjNKzNPP4oD1OkhmGmlLE
         xM/6lB1jL9Ajt9bHfqPvvnpA9vg/3mQyoVlEq9WZSKd3l/0Rxbj1W5eHfkk/CekmUfxj
         JCbbfBeXo9h9dW3S5sfWoIA7ppiph83xxqVkrRbQZgmSik9fvXAvWk77dZLl0YENISuQ
         egag==
X-Forwarded-Encrypted: i=1; AKwUvBwVX9ZL5jPx/5CSQxq1nvrH8OdT4+95Da9v63nT1ET98az6KCH7rxWa/bq4EADQr6b+OM8i5mK7KCwgkJZ40yx7@lists.infradead.org
X-Gm-Message-State: AFq9FYLDPto3gC8kXeyTWCdKwcBZAZQCjNmVGxxD/gucdx7PAzwZgRjn
	CRvE3zlJBVnxKtONJlA8z+XavOyWL8NX/du5Xxl8iGMfyzWfOrIgI6EiYZ5ki/xUOjtRBcfDKw6
	jJjb6Eb4=
X-Gm-Gg: AYBFou08Owh9aFLw8Nd0Ddft8I9+RcllG1UDcTJ7DCTHDVF1JXKeo4hq3Uhy0VGHG+f
	8r0T9HqRkwKFkVYdDfhcU0459wLBNhlMGMhhKbPdL4psLFgC6CWqlqqsKzGP59so6JvZaovpUiE
	BlbGghSITbiwvzhUCvhrI5PpwcvjzmLG5r6d9K7jppfe6YGpNkZAVzQmPtar5IC+HR8/j6aE2xv
	Ql8uT1T5RC4f0T1l/HukJ7D++psy7JcdiWP/APAcHBfTIyH/QjT9H0O3Efof8zK0o2cnRYmgY4B
	dS0w1Gd3xEdk2Xz0YRc+7Hqc2feOQIcnRrI4RA9Z4p9asY+UW61uxBNzfiGUoP6L8ZbGYzmLdTM
	PiYiPzLhMCvQaHro8Lp8q0ZEtvkqHL23SsfZxgr/ApdytpXhHI6P87tagDeAT0sCqUfMrT25kaA
	Q+ifaW/8pQjEJQ2ljQISyJvDA7zhtgfEaqooHckLFe9kD0yMA3/laKMm+gzT2pyyd68LIgqY4OZ
	ZV6YJnv8w2JsIilAkun61Zh829eynzKOLGA5lFBKej1tvpwp/TBdOUAxzj1H2CMk+yQNdXwekWU
	N8zI
X-Received: by 2002:a05:6000:400d:b0:48b:10c8:2183 with SMTP id ffacd0b85a97d-48dbacdd2afmr41397725f8f.32.1792161687267;
        Fri, 16 Oct 2026 07:41:27 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:27 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:20 +0200
Subject: [PATCH 05/10] ARM: dts: omap: dm816x: refactor and align MMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-5-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1896;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=bQlaSmVrxWRh3eFexaKgbJh5U7ftQwzZnbqVJPILtpg=;
 b=GdQ58uqjcnmGPDtcijnfZlLk3LVb6f9YJJVOwK6BFvPD1G8Wv2rOQyByMakkeuOpx0A87+uRk
 rR2R/Cr5fBcA9PSdu0Th6HGErC8ZzGFOUPpHQrBKzemmH4cIfOEq2mP
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074129_274713_805E8070 
X-CRM114-Status: GOOD (  12.42  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 9c9d5e296e90..7f3ef3a00ab8 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+			reg = <0x48060000 0x4>,
+			      <0x48060110 0x4>,
+			      <0x48060114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48060000 0x11000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x11000>;
+				interrupts = <64>;
+				dmas = <&edma 24 0 &edma 25 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		timer1_target: target-module@4802e000 {

-- 
2.56.0


