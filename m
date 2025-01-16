Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55BEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PJS6kM+DJ2GGwqhWw1shA8+yZPnGkjZF8pz2SUSzfI=; b=v025CuElX6ypXPg8MtoMhmp1cF
	IuqxZE1fPc5znpiqs675lpm60BL2LB9zW3RJvbAiN7ClEjAY0wsQpPEruF21F6CLcS8usMB10Q9X6
	Sbtr9pcZEQEIg3YONGwTx5BVDHFEE5eyNOnI0Xvg9agXFMdIBVVjarKBMiZFm7UAQHan8NikbKS88
	IZXVmagaC4l9WrOet/K3Gddb8hMWLTLK6+nkcPTJHAW1zyNxKAoF7ar1c4ilJamFqYHA/Yc2Zta5B
	T1UvxqE7WMp4L5+lKVFPneXDWOELgo25Vkhe+tREOywy4InXwZ3mix+iOwo6/BngoiP6FtyQdgPi/
	jAYY4Jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZDb-0000000GQ7O-1f7q;
	Thu, 16 Jan 2025 23:24:07 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZB7-0000000GOxp-3402
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:21:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PJS6kM+DJ2GGwqhWw1shA8+yZPnGkjZF8pz2SUSzfI=;
	b=uZ29omjNcU4UbYfhIsF0VAP9GJd018ZmYttfHmmZNzR1FIOC3X6U+Ii7BkAzAI1EUTCAJW
	MCcAyP7yvKL6rQ6AjEcLJNvDpRI0AdQQF4CEnS9BddjgAETgDn5wrADuaE/4/xCo51+h7P
	nBy/dHyVn8tBKSr5Tgr/U6a/Hru5OxM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
Date: Thu, 16 Jan 2025 18:21:11 -0500
Message-Id: <20250116232118.2694169-2-sean.anderson@linux.dev>
In-Reply-To: <20250116232118.2694169-1-sean.anderson@linux.dev>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152133_906435_6BF7778C 
X-CRM114-Status: GOOD (  10.53  )
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

This device supports two separate SPI busses: "lower" (SPI0) and "upper"
(SPI1). Each SPI bus has separate clock and data lines, as well as a
hardware-controlled chip select. The current binding does not model this
situation. It exposes one bus, where CS 0 uses the lower bus and the
lower chip select, and CS 1 uses the upper bus and the upper chip
select. It is not possible to use the upper chip select with the lower
bus (or vice versa). GPIO chip selects are unsupported, and there would
be no way to specify which bus to use if they were.

Split the "merged" bus into an upper and lower bus, each with their own
subnodes.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 .../bindings/spi/spi-zynqmp-qspi.yaml         | 43 +++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
index 901e15fcce2d..12c547c4f1ba 100644
--- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
@@ -39,6 +39,18 @@ properties:
   resets:
     maxItems: 1
 
+  spi-lower:
+    type: object
+    $ref: spi-controller.yaml#
+    unevaluatedProperties: false
+    description: The "lower" bus (SPI0). On the ZynqMP this uses MIO pins 0-5.
+
+  spi-upper:
+    type: object
+    $ref: spi-controller.yaml#
+    unevaluatedProperties: false
+    description: The "upper" bus (SPI1). On the ZynqMP this uses MIO pins 7-12.
+
 required:
   - compatible
   - reg
@@ -50,8 +62,6 @@ required:
 unevaluatedProperties: false
 
 allOf:
-  - $ref: spi-controller.yaml#
-
   - if:
       properties:
         compatible:
@@ -75,7 +85,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
 
-      qspi: spi@ff0f0000 {
+      qspi: spi-controller@ff0f0000 {
         compatible = "xlnx,zynqmp-qspi-1.0";
         clocks = <&zynqmp_clk QSPI_REF>, <&zynqmp_clk LPD_LSBUS>;
         clock-names = "ref_clk", "pclk";
@@ -84,5 +94,32 @@ examples:
         resets = <&zynqmp_reset ZYNQMP_RESET_QSPI>;
         reg = <0x0 0xff0f0000 0x0 0x1000>,
               <0x0 0xc0000000 0x0 0x8000000>;
+
+        spi-lower {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          num-cs = <2>;
+          cs-gpios = <0>, <&gpio 5>;
+
+          flash@0 {
+            reg = <0>;
+            compatible = "jedec,spi-nor";
+          };
+
+          flash@1 {
+            reg = <1>;
+            compatible = "jedec,spi-nor";
+          };
+        };
+
+        spi-upper {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          flash@0 {
+            reg = <0>;
+            compatible = "jedec,spi-nor";
+          };
+        };
       };
     };
-- 
2.35.1.1320.gc452695387.dirty


