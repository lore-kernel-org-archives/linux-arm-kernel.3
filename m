Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB29CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VYAVNXT292NGZ4sYFN5J4OwZfF4VzXtkjrNp6rS2X4=; b=X8v0YOLzyiv/KUPB6E5+XtKsBZ
	IBQE5/vdTcpxk0AbvWh4XlIHAzX0yJU+ncKfasmXcb4541bUkoiEAiusCvBQSEhrzWvdibrXEW0TJ
	HLc6/Mixg3CG/ESfihaSTna3HdvAjsK96p4ea1sxukz5iVdiA/fVY1gW3p+SHJ3E7DLNoAmBpQ/2L
	3EIDV3YA8g6nT8kTXcdRHdMx5taTCZoGOQuIrhtU552sKDM+u8ZAetdjjkTCpi+UfW1IWZODEr/+z
	DPb6REowPoHp5KBbNbwOFHU0XAtquTA8Qkb7P4+ek3FWwb57IBzPasbWEUUmqX/zbAwUvD3abh7lt
	woM1q/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqC6-00000001vAb-11HX;
	Fri, 15 Aug 2025 08:53:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwU-00000001sSA-26Ae;
	Fri, 15 Aug 2025 08:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 984765C54B0;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FFD8C4CEF5;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=+LdxacDOKbwv5ZlhXWTL9PeHEmVA5121O21NQzi8U8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CETaJ7XcfZrZwAHeVDADXVmrjA8oZuhJhdw49Amn9mXn/+HqvQemXaJySdaPJ+y6I
	 3Ng2QayQJHuyrU7qZRhHvw9kc5Q+Ra6kGZ/Ketj3xz0PnvR63uIJIiEjVVMtiQrR9E
	 uQCVXSQPmoQ+Rx8fEejbfz+voOaAuwsAO/uMws4mApgjHJiBt6ntD23KPSi3kVWAi4
	 AvDmBDxpxPm7Lv1nZ4a4UDpJEYhfGhXFDSQwJ7qsDwn1pYkzrMWkxcYTSnfaxvE90a
	 OE3A3seWMJBtsoefnQksp+Ff+TZnCkbnysr4fhLmc0uoGVbT8eQDuJYgffVVcu3Kt0
	 vvgut4MG5SfpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A55BCA0ED1;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:27 +0800
Subject: [PATCH 01/13] dt-bindings: soc: amlogic: Add clk-measure related
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-1-59f04ba67457@amlogic.com>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247056; l=2924;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=WKCqPVvjKvBXZpMp6AHTLsZhyPJ7w7tYipQPXxNUfy8=;
 b=Q41qJt636clPDrUBiobgwPQhIgCCdN9zC7cR3+DvjHw/DkHPHACtzt579HcHsSbegx+EGYnso
 SAP1K0IrAffB30vT6+ZbJysS3mjFwAyqBwtGnT6NcX2J7u/OIiLPKsZ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013742_655001_A2950230 
X-CRM114-Status: GOOD (  11.38  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add three properties to clk-measure: 'clkmsr-indices', 'clkmsr-names',
and 'clkmsr-reg-v2' for describing measurable channels and register
offsets in DT.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 39d4637c2d08..1c9d37eef5f0 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -6,7 +6,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Internal Clock Measurer
 
-description:
+description: |
   The Amlogic SoCs contains an IP to measure the internal clocks.
   The precision is multiple of MHz, useful to debug the clock states.
 
@@ -28,15 +28,67 @@ properties:
   reg:
     maxItems: 1
 
+  clkmsr-indices:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Supported channel IDs for clk-measure.
+    minItems: 1
+    maxItems: 256
+
+  clkmsr-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      The channel ID names supported by clk-measure correspond one-to-one with
+      the IDs specified in 'clkmsr-indices'.
+
+      Therefore, the defined 'clkmsr-indices' and 'clkmsr-names' must have
+      matching counts and maintain strict correspondence.
+    minItems: 1
+    maxItems: 256
+
+  clkmsr-reg-v2:
+    type: boolean
+    description: |
+      Specify whether the register address offset for clk-measure corresponds
+      to version V2.
+
 required:
   - compatible
   - reg
+  - clkmsr-indices
+  - clkmsr-names
 
 unevaluatedProperties: false
 
 examples:
   - |
+    /*
+     * Example 1: clk-measure uses the original version of register address
+     * offsets.
+     */
     clock-measure@8758 {
         compatible = "amlogic,meson-gx-clk-measure";
         reg = <0x8758 0x10>;
+        clkmsr-indices = <0>,
+                         <1>,
+                         <2>;
+        clkmsr-names = "ring_osc_out_ee0",
+                       "ring_osc_out_ee1",
+                       "ring_osc_out_ee2";
+    };
+
+  - |
+    /*
+     * Example 2: clk-measure uses V2 version register address offsets.
+     */
+    clock-measure@48000 {
+        compatible = "amlogic,c3-clk-measure";
+        reg = <0x48000 0x1c>;
+        clkmsr-reg-v2;
+        clkmsr-indices = <0>,
+                         <1>,
+                         <2>;
+        clkmsr-names = "sys_clk",
+                       "axi_clk",
+                       "rtc_clk";
     };

-- 
2.42.0



