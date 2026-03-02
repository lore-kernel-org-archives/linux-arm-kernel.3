Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB80EA4E26
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mdSfSo5atNYQZ6ZNDlpmC+Uf/FzXi7FYtSKQOIHUis=; b=qMmKfVBuuVwEIQJc+hs7p9aSNk
	1+KXMO0ebtuUc5iufZN1VCModu3gsVkp9z4c+JCdUdtklwSNBn5tr4P/D8sYdph2iIqrle4N6oFwz
	+C5m2YufT9VwfVMcjCQwEvq7sx1zRNKCaNwlipoxlcZzcbG/fAhaxd0FlRikijTNTWI9iJHAM0ph0
	4QdbAG3FvS+yhGvzs21x7ivuNXx6shITZThoRDynFgPJKnjqg6DgX7oo7fv1EPso3Wz7t6rsEYHaI
	AGoWcrqqK7p85JhsKAN0L5iETTeZ8yF2Ifay1uQ/zvTiiCze8o9FzLTK0sHw2uxNzdthi88a/zCl1
	bHtI3kgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JY-0000000DNKj-2Gbd;
	Mon, 02 Mar 2026 15:36:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JV-0000000DNJG-084d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57BF1433EE;
	Mon,  2 Mar 2026 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CB4C19423;
	Mon,  2 Mar 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465764;
	bh=CYDoAqYz0+vG1YQhjmnYaSQHBJESLZPbzW7By0gNSOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Egeu3r5uSdNJbTroxXrYZTsIzdwvS/kLOLoawApPgryLcShe9eV0nus7z5+cCpzz2
	 YUhZS6tmboo/GQMxAN3a2dU+LY5yuUf2mfzTfoic39T7q9MgvHS6nG0P3Ms+y+uW8C
	 DgDwO0bvQZGN+Gk3sru6L8Z/5w4NblvhElu/C1LBCSBiOP+zAPbZITv91Romuyi4W0
	 8Pw90etuB6iEYCHEhHH3VxQw8jzAtDua/feEeeQbynK21dN4piIT0tL52DnHxaVG89
	 Dob2x/UKFCXAu79eu3UbsJ+6P081awMfZMXJclpgQdVaY6XWP0x2EEoYgKMzvnP79L
	 LTZzxts9cSWUQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 188D35F95F; Mon, 02 Mar 2026 23:36:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer SoCs
Date: Mon,  2 Mar 2026 23:35:56 +0800
Message-ID: <20260302153559.3199783-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302153559.3199783-1-wens@kernel.org>
References: <20260302153559.3199783-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_073605_130480_AF4AEEBA 
X-CRM114-Status: GOOD (  13.13  )
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

Support for Dual SPI and Quad SPI was added to the Linux driver in
commit 0605d9fb411f ("spi: sun6i: add quirk for dual and quad SPI modes
support") and commit 25453d797d7a ("spi: sun6i: add dual and quad SPI
modes support for R329/D1/R528/T113s").

However the binding was never updated to allow these modes. Allow them
by adding 2 and 4 to the allowed bus widths for the newer variants.

While at it, also add 0 to the allowed bus widths. This signals that
RX or TX is not available, i.e. the MISO or MOSI pin is disconnected.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---

Changes since v1:
- Moved "allOf:" block after "required:" block
- Dropped "type:" from child node in conditional block
---
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index a6067030c5ed..6af4ff233158 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A31 SPI Controller
 
-allOf:
-  - $ref: spi-controller.yaml
-
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Maxime Ripard <mripard@kernel.org>
@@ -82,11 +79,11 @@ patternProperties:
 
       spi-rx-bus-width:
         items:
-          - const: 1
+          enum: [0, 1, 2, 4]
 
       spi-tx-bus-width:
         items:
-          - const: 1
+          enum: [0, 1, 2, 4]
 
 required:
   - compatible
@@ -95,6 +92,28 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: spi-controller.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - allwinner,sun50i-r329-spi
+                - allwinner,sun55i-a523-spi
+    then:
+      patternProperties:
+        "^.*@[0-9a-f]+":
+          properties:
+            spi-rx-bus-width:
+              items:
+                enum: [0, 1]
+
+            spi-tx-bus-width:
+              items:
+                enum: [0, 1]
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3


