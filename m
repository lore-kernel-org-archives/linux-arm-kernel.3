Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4BDFD376C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0P0g16xTJdhYm8l3vI0AbR3OUqzHDBE6PhK3jSMQGU=; b=ZgbThBBPBhUj+a+0OJx2Chf9iE
	GnwAplwZ/gsmhh9C6kcjBQbOzchlzl2BmRZeai+Jjjj42MAv/ZMER58KzExmdXcu5cSfi+7nNSecF
	jrls95FuPjFavSquIJMrdn+Jg6XPrG1FDvUdSH0SKLiQX9gt12n1VlHzGn6JL2OyWWnVB4DRCVUKk
	DB9p5Rl9bDaSUgKujdbUKGIhsDBYUFJf8/ANUu9AWZQhcCVnb35RyX2J1LCC0HndFFluGTYwzyoK7
	bEpjr7Drwrfcu8fv3fy7KvQgy1zL+ptOzZ9gLc/vtsJiiE21f/CucE/Eo2lAI63fl4lwDgTfkgitE
	gEH+U/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHFd-00000004Qws-1y5r;
	Wed, 25 Feb 2026 15:56:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHFc-00000004QwY-22aI;
	Wed, 25 Feb 2026 15:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=K0P0g16xTJdhYm8l3vI0AbR3OUqzHDBE6PhK3jSMQGU=; b=szulYOn7tWgpvOjLdOm8k/k76m
	ea8R9BgeQ2inIfZ+VbjawZMZFcR2iI1hibFxR0/PeEWQGbthaVhpxToH4USlluMZrwjZS1VkXC2Pv
	8PXN2o71aq3Mf3ysKq08Jg1sRWAViMHG+YwoWMlgpI07mgE5fMUDZqSQMGNIH4AwSNTJZzBXb9eUz
	SnPij4iCidjOM9h0j9rusyD72MBwPKLXpfJKLgJZALqKEnuXSjRZQCEpUrPn8WJ7Vf5xmNTAFN+Hs
	OEgjN6PAcRyQOQlNKjD7vzNmtkYOit9ngsZjEQCKtc+JpX8SknZGoNVqm2ahCAIgEkFSzEBwaJcw2
	GM3GOuhQ==;
Received: from mail.hugovil.com ([162.243.120.170])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHFZ-00000001I8T-1OWm;
	Wed, 25 Feb 2026 15:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=K0P0g16xTJdhYm8l3vI0AbR3OUqzHDBE6PhK3jSMQGU=; b=rsQqJHwZaMP5H5rjbQqDX0aJEH
	CrKT+SkMKHEXDVfMlwtNuZBDMjp6mtOSI8g0XVYvTH6v+lJPMF83+gyOS/c5T9xVRRZV75I4qPxRs
	2XsQ1gBJEoQoBHFkhckW7V+W2zp7vbjFN0a3IniMGMdsyiBE6JB/JiIJIfvaWqj5lTvg=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:47746 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvHDM-0005uT-JY; Wed, 25 Feb 2026 10:54:17 -0500
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
Date: Wed, 25 Feb 2026 10:54:00 -0500
Message-ID: <20260225155409.612478-4-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225155409.612478-1-hugo@hugovil.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH v3 3/4] dt-bindings: input: add GPIO charlieplex keypad
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_155633_559864_612F96C3 
X-CRM114-Status: GOOD (  16.32  )
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

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../input/gpio-charlieplex-keypad.yaml        | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
new file mode 100644
index 000000000000..d3eeddc8e533
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
@@ -0,0 +1,106 @@
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
+  the number of lines). Key presses and releases are detected by configuring
+  only one line as output at a time, and reading other line states. This process
+  is repeated for each line. Diodes are required to ensure current flows in only
+  one direction between any pair of pins.
+  This mechanism doesn't allow to detect simultaneous key presses.
+
+  Wiring example for 3 lines keyboard with 6 switches and 3 diodes:
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
+    charlieplex-keypad {
+        compatible = "gpio-charlieplex-keypad";
+        debounce-delay-ms = <20>;
+        poll-interval = <5>;
+        settling-time-us = <2>;
+
+        line-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH
+                      &gpio2 26 GPIO_ACTIVE_HIGH
+                      &gpio2 27 GPIO_ACTIVE_HIGH>;
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


