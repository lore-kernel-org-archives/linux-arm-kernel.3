Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A7FFEFB73
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn9LiSkjlIXABJxcoT6GJ8bFoLr6hPrPz3sH3qIdwpc=; b=0SOWvTN/OdkStY0fPeIIhf1eKd
	95lU2NvFpQbUvrLJ5UW2q5cQPTMt3K+My+MbJkMhDJGGE1KXsXVyDuJ1pTajci2/yNzr3PVUPKT2G
	lnpUKugoA7wA9ir/JqCquJTBMv5+xHEwcbsoHKzeLD1L5aNWCyPZzTBPofABw9EnE6fTStSPdtHYE
	jvLudsAO3bbqdIOjw7nY7TGOwdX6Ff4iRPMkTuseuYgSDRkwbOjGy12DNncoTN1Y0LjnciERhWEWU
	KNujShoj0M6vn6CZb9l6zwSBqPdC0jU5nmAqsfdLIEk5ESp0Is/NXZWHjU4hzghClj0aA0uJfLCP7
	WU5Xcpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw20a-00000008pke-2eix;
	Fri, 27 Feb 2026 17:52:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw20U-00000008piG-49Wv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D48B241B1F;
	Fri, 27 Feb 2026 17:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E91BC19421;
	Fri, 27 Feb 2026 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772214724;
	bh=wFLm7k88fcySk3WbqBdNrrXtxAUhx3c2WSVbqeGab6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=heXXfdoP5arDJG3XvK6VZxm+PHg6R8na5fMOeoSlO2E6O4YGrgRkiBriyJHTSr8bX
	 /R86Tpaugnokera4ihUa40vBWWIz7TRrKhxpJEjvXX8flVv0QoRThSIrMEjFo2XnkC
	 zK5CU8cebHKiUc+b9vp0ekw3EfyRtcOmiNalvLJLxg97tMNa4J0A+C+MtOaVDFmmyl
	 N59oSqG8Zxb4UyVAw/zfertnV0JIdCcedq+fPs3k6JpO+Xf5vmc9YVZ0M9PBgvFVT0
	 T0FA3ylv0Rz6q2tk+pG261JRF2j9fYATOU3+hcfL+BKwB5TUGjWbpBPCrv30SkEF1D
	 sVNE6RmUGJDXQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 1C4DE5F9D2; Sat, 28 Feb 2026 01:52:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer SoCs
Date: Sat, 28 Feb 2026 01:51:53 +0800
Message-ID: <20260227175157.2339758-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227175157.2339758-1-wens@kernel.org>
References: <20260227175157.2339758-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095207_045304_8DDECFDE 
X-CRM114-Status: GOOD (  12.63  )
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

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index a6067030c5ed..2197f65d878b 100644
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
@@ -82,11 +79,35 @@ patternProperties:
 
       spi-rx-bus-width:
         items:
-          - const: 1
+          enum: [0, 1, 2, 4]
 
       spi-tx-bus-width:
         items:
-          - const: 1
+          enum: [0, 1, 2, 4]
+
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
+          type: object
+
+          properties:
+            spi-rx-bus-width:
+              items:
+                enum: [0, 1]
+
+            spi-tx-bus-width:
+              items:
+                enum: [0, 1]
 
 required:
   - compatible
-- 
2.47.3


