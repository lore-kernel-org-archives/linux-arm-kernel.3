Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD78C106ACD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP65QPw5R6QEOwFP1EXlhwulSaa9GL5K/VwO1HQfsdo=; b=otSnJxfNNwW8Wo/bECgKwB3QEK
	N9a4lFUhpNZ/1+GvZ4Z2Na3STbhQwJGqzudonBlcUfNGBTrLqPNM0GvYnPlqca0uXz/rkHF+7JbdP
	KOef0WkvtfyY3NQstLy+kt7m3vI6SfuNaEEWxtpvHjshPFFh4jfjPyfQwW+gToyTHciZwGYpCwPIZ
	Bi4Z0uVbervNrjHm5pjzGLUnRx4P8pW9zRFhiwxRM6cVUR62mcwoEmfknnAlrg5P/fu4f4X+byZPW
	vrrin8yGINcv/2aXRVfpgyvSb7j0aXFX+F3cZy7yK9QT3jK88ziuA/+qOPC/UjU721Rma+LULMdZp
	r+ynohgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kNU-0000000EpM3-14PW;
	Thu, 12 Mar 2026 18:03:20 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kNP-0000000EpIe-0Cim;
	Thu, 12 Mar 2026 18:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:subject:date:message-id:reply-to;
	bh=QP65QPw5R6QEOwFP1EXlhwulSaa9GL5K/VwO1HQfsdo=; b=pkRqJJlYzzTix2dnjDsKhHXPji
	erlS1V36ljnu/PE0eI/X3dCtjCe085U7PEjldnYGxisozy13kaOQuMl9KS4kLBKzZclWlgioWSSa0
	e1IeFMQZQr/g3Eg/g7EGc0FjBoxnc4LH7QjA+jTNLptHe/Yxc7dfNPtnYLEI1cm8AvwY=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0kNJ-000000008Fl-3z1K;
	Thu, 12 Mar 2026 14:03:10 -0400
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
Subject: [PATCH v5 1/4] dt-bindings: input: add debounce-delay-ms common property
Date: Thu, 12 Mar 2026 14:00:55 -0400
Message-ID: <20260312180304.3865850-2-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312180304.3865850-1-hugo@hugovil.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_bar: -
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_110315_088687_85429306 
X-CRM114-Status: GOOD (  11.41  )
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

A few bindings are already defining a debounce-delay-ms property, so
add it to the input binding to reduce redundant redefines.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../devicetree/bindings/auxdisplay/holtek,ht16k33.yaml    | 5 ++---
 .../devicetree/bindings/input/cirrus,ep9307-keypad.yaml   | 7 +++----
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml     | 5 ++---
 Documentation/devicetree/bindings/input/input.yaml        | 8 ++++++++
 .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml    | 2 --
 6 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index b90eec2077b4b..c46a2471f8b10 100644
--- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
+++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Robin van der Gracht <robin@protonic.nl>
 
 allOf:
+  - $ref: /schemas/input/input.yaml#
   - $ref: /schemas/input/matrix-keymap.yaml#
 
 properties:
@@ -33,9 +34,7 @@ properties:
   interrupts:
     maxItems: 1
 
-  debounce-delay-ms:
-    maxItems: 1
-    description: Debouncing interval time in milliseconds
+  debounce-delay-ms: true
 
   linux,keymap: true
 
diff --git a/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml b/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml
index a0d2460c55ab6..25b8b29c87d70 100644
--- a/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Alexander Sverdlin <alexander.sverdlin@gmail.com>
 
 allOf:
+  - $ref: input.yaml#
   - $ref: /schemas/input/matrix-keymap.yaml#
 
 description:
@@ -37,10 +38,8 @@ properties:
   clocks:
     maxItems: 1
 
-  debounce-delay-ms:
-    description: |
-          Time in microseconds that key must be pressed or
-          released for state change interrupt to trigger.
+  # Time for state change interrupt to trigger
+  debounce-delay-ms: true
 
   cirrus,prescale:
     description: row/column counter pre-scaler load value
diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index ebfff9e42a365..69df24a5ae701 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -18,6 +18,7 @@ description:
   report the event using GPIO interrupts to the cpu.
 
 allOf:
+  - $ref: input.yaml#
   - $ref: /schemas/input/matrix-keymap.yaml#
 
 properties:
@@ -46,9 +47,7 @@ properties:
       Force GPIO polarity to active low.
       In the absence of this property GPIOs are treated as active high.
 
-  debounce-delay-ms:
-    description: Debounce interval in milliseconds.
-    default: 0
+  debounce-delay-ms: true
 
   col-scan-delay-us:
     description:
diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
index 94f7942189e8c..502e0b7eb500a 100644
--- a/Documentation/devicetree/bindings/input/input.yaml
+++ b/Documentation/devicetree/bindings/input/input.yaml
@@ -14,6 +14,14 @@ properties:
     description: Enable autorepeat when key is pressed and held down.
     type: boolean
 
+  debounce-delay-ms:
+    description:
+      Debounce delay in milliseconds. This is the time during which the key
+      press or release signal must remain stable before it is considered valid.
+    minimum: 0
+    maximum: 999
+    default: 0
+
   linux,keycodes:
     description:
       Specifies an array of numeric keycode values to be used for reporting
diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index e365413732e7b..914dd3283df33 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Mattijs Korpershoek <mkorpershoek@kernel.org>
 
 allOf:
+  - $ref: input.yaml#
   - $ref: /schemas/input/matrix-keymap.yaml#
 
 description: |
diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
index d2886f2686a8d..542ba51144243 100644
--- a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
@@ -76,8 +76,6 @@ properties:
           debounce-delay-ms:
             enum: [0, 30, 150, 750]
             default: 30
-            description:
-              Sets the debouncing delay in milliseconds.
 
           active-low:
             description: Set active when pin is pulled low.
-- 
2.47.3


