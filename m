Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED4106ACD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIoIaMLukKrJmxdba5RsTgmbYSp25mplp/E+QiIZI9I=; b=OxKob2+bod37o2jVcV2Czae6ak
	8f6y9cDCmrkFi8SGMwTyRJ757ButjJgKL4xZHHwkwql+NFoT8W8clmvdEAU+H66Yp42+fZEwLDwLO
	Sd11eLQ68FF04ewF4iKmKYcdmW0oyAbh+ojvftu0qwYlPE5w20WanN+4eOTxDUI1rXvq2aJglwoEZ
	Gj5+T93vLhgOz9+gmLkFI7HauButjfIWT5ppf4y+VBT7Rl0bDoVFUV8922ae2VDR4bb+OV2cXqcr4
	Fa6Ud39FTIiMGoTDqpDsq7gsqwsmUaf4oCCZvxGExH0JA7Bu2YBGgWRKaOweiHh3MP7ldqP08M3hM
	ujqzN4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0knC-0000000EtMw-2AzJ;
	Thu, 12 Mar 2026 18:29:54 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kn8-0000000EtKS-2Qi8;
	Thu, 12 Mar 2026 18:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:subject:date:message-id:reply-to;
	bh=YIoIaMLukKrJmxdba5RsTgmbYSp25mplp/E+QiIZI9I=; b=vn0a2vs++I//3Jb8kibo9O0B5G
	jW7cIwvT2Db800xcCpVl+k13w/i7g27cjxsL31MIbKC0XSFP29FDRojsU5DlkFuYCa9upPclAetpq
	1pm9mwetJpsSzlq+mX42XRahAcS2TZHQuyZyDfTEcGSUQOID300D2nfNqZwbJ2FMkHvQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0kNM-000000008Fl-1kOZ;
	Thu, 12 Mar 2026 14:03:12 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: robin@protonic.nl,
	andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	alexander.sverdlin@gmail.com,
	marek.vasut@gmail.com,
	akurz@blala.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hugo@hugovil.com
Subject: [PATCH v5 3/4] dt-bindings: input: add GPIO charlieplex keypad
Date: Thu, 12 Mar 2026 14:00:57 -0400
Message-ID: <20260312180304.3865850-4-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312180304.3865850-1-hugo@hugovil.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_bar: -
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_112950_611263_0CE91419 
X-CRM114-Status: GOOD (  14.50  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add DT bindings for GPIO charlieplex keypad.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../input/gpio-charlieplex-keypad.yaml        | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
new file mode 100644
index 0000000000000..c085de6dab854
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/input/gpio-charlieplex-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO charlieplex keypad
+
+maintainers:
+  - Hugo Villeneuve <hvilleneuve@dimonoff.com>
+
+description: |
+  The charlieplex keypad supports N^2)-N different key combinations (where N is
+  the number of I/O lines). Key presses and releases are detected by configuring
+  only one line as output at a time, and reading other line states. This process
+  is repeated for each line. Diodes are required to ensure current flows in only
+  one direction between any pair of pins, as well as pull-up or pull-down
+  resistors on all I/O lines.
+  This mechanism doesn't allow to detect simultaneous key presses.
+
+  Wiring example for 3 lines keyboard with 6 switches and 3 diodes (pull-up/down
+  resistors not shown but needed on L0, L1 and L2):
+
+  L0  --+---------------------+----------------------+
+        |                     |                      |
+  L1  -------+-----------+---------------------+     |
+        |    |           |    |                |     |
+  L2  -------------+----------------+-----+    |     |
+        |    |     |     |    |     |     |    |     |
+        |    |     |     |    |     |     |    |     |
+        |  S1 \  S2 \    |  S3 \  S4 \    |  S5 \  S6 \
+        |    |     |     |    |     |     |    |     |
+        |    +--+--+     |    +--+--+     |    +--+--+
+        |       |        |       |        |       |
+        |    D1 v        |    D2 v        |    D3 v
+        |       - (k)    |       - (k)    |       - (k)
+        |       |        |       |        |       |
+        +-------+        +-------+        +-------+
+
+  L: GPIO line
+  S: switch
+  D: diode (k indicates cathode)
+
+allOf:
+  - $ref: input.yaml#
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: gpio-charlieplex-keypad
+
+  autorepeat: true
+
+  debounce-delay-ms:
+    default: 5
+
+  line-gpios:
+    description:
+      List of GPIOs used as lines. The gpio specifier for this property
+      depends on the gpio controller to which these lines are connected.
+
+  linux,keymap: true
+
+  poll-interval: true
+
+  settling-time-us: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - line-gpios
+  - linux,keymap
+  - poll-interval
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/input/input.h>
+
+    keyboard {
+        compatible = "gpio-charlieplex-keypad";
+        debounce-delay-ms = <20>;
+        poll-interval = <5>;
+        settling-time-us = <2>;
+
+        line-gpios = <&gpio2 25 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)
+                      &gpio2 26 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)
+                      &gpio2 27 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
+
+        /* MATRIX_KEY(output, input, key-code) */
+        linux,keymap = <
+            /*
+             * According to wiring diagram above, if L1 is configured as
+             * output and HIGH, and we detect a HIGH level on input L0,
+             * then it means S1 is pressed: MATRIX_KEY(L1, L0, KEY...)
+             */
+            MATRIX_KEY(1, 0, KEY_F1) /* S1 */
+            MATRIX_KEY(2, 0, KEY_F2) /* S2 */
+            MATRIX_KEY(0, 1, KEY_F3) /* S3 */
+            MATRIX_KEY(2, 1, KEY_F4) /* S4 */
+            MATRIX_KEY(1, 2, KEY_F5) /* S5 */
+            MATRIX_KEY(0, 2, KEY_F6) /* S6 */
+        >;
+    };
-- 
2.47.3


