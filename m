Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C701CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1H6vtH0yOxDRzXREfaGJRvXTxeA3gHbb5ggurrMQBs=; b=rlsuNfzN1bHEAFC21tNJwAjLUw
	YxETvHoEkHOp+RxQtN7G66DVlXTVMq6QvMrqA86r4CYzOcIDZ6HvLUGHLpQsIM4rH9mRL5gMJ7DBY
	l285bT1F5MmtMSMQiZljuQisZ5i5qbxf6CB+1pRtbDVLT69QuSW2NEDg64iaCH+v2VKT5GPKS8iBo
	mztPMSJCPPeRRwyoa9P5cZJP1z/m6NHKiIJIDopBK9o3NqXOuXdOCmF8QAYUrP47+bsTr+J8dMlyL
	7/CAn9bwdLCZDVZMk696Fua+GCEwL270i7yU4D60BW32lh0lBLw8a0d2a4qsYaO5KgaqtdbJ7JONv
	0dqru9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwI3-00000006WPs-3XJO;
	Wed, 30 Sep 2026 15:32:16 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwHh-00000006WHf-3vCg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:32:00 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 93FFB240105
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 17:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1790782307;
	bh=R1H6vtH0yOxDRzXREfaGJRvXTxeA3gHbb5ggurrMQBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=OZ40qvK1inh0OZpTGefRWVh4XZW0LXx5nrchtJtlsOenNMUQ1mhnZH4H3+0mV1npK
	 Xy81jhOgQ4U2kjsluuOjgeO7K5utRfnDQaTBIkcUtNdrsy2NkDdVA25AFore3hWM3m
	 nKtSchjH/aVo6mn/9UygqMEHdpDmrB0fOZ1ys1b2AF50V4VnWycNhEUVvZrh7n6I+1
	 5itVS8w16DqVYqLLvFtgoK/kg5tKDHQWwcwxTeniZPmvtFD2O9KKlOM0PCMYvUeHZW
	 dnvVBxW+Nf0hMjgRK02bL8sh3UeOTwUkrKwJxmEp7EYsq+eTOp4bQtK+LLuxbyzevY
	 Lf/us3MsXRnlA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hvzYF6wFbz9rxK;
	Wed, 30 Sep 2026 17:31:45 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Wed, 30 Sep 2026 15:31:46 +0000
Subject: [PATCH v10 1/6] dt-bindings: rtc: Add pinctrl for S35390A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-rtc_s35390a_int1-v10-1-e7b1cbc50a7b@posteo.de>
References: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
In-Reply-To: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Langer <michael.brainbug.langer@googlemail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4227;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=NT5uBcECvV5+Gri6OJUWTeQ+wnkOKsRvHZQ6kONk9L4=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqvSteXpcAVXNwwVlfr9sF1/ghWETMYqfWK8OJJ
 L7OjiVzT82JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCar0rXhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9LeSA//fImWJ8uXyXTc2JpOEy5FXfJ6f0QrYnw
 vEb9kCJ2DL7hmpa/b5nkdAuZBp+rgpafodMevi3l9it/32OrLFYmGP6Sx56t3QKLdOXV4xiC/Dt
 h8CGWAZmDkAto8SPL+oijGlcJAXp1bEG2KAjzxMZol4n7w35rdIFVsvZls3hqRDyz5Heccklduq
 FlmjStyjSaOp76Cv6GBv3GEoJl6bBnwOj7rpgKclU1uK6ipu/1DlgWb57g72xHdq4t4pdl49Vr7
 38NJMz8tIdpDzE4MxegNjuRqBy8Rf4eHJHQFppjF5z4EOsjsiklxtQOjKfMFFBeoh/7iJXppec0
 ieWwOaFwxemRAmUtXNJqIzQ9mNM+PJ+wJH9bX99fLg6SweU1n7k6GYa2n2LZOAyZEnNUe2RWlHu
 6AO+Z19OLuA2BqMWBNMrnOHMyfCqiyXo842r2sHDGIER/L6zoUQ0C7Rh0n6uebhELLYcjwxT5O2
 1RFBmaiytIN/4CirxANUpyaMrCcVziLlq1aK5wpBMuSBK38J3iHRq0Dyfw+5rLrkCsmg+jES6U4
 XlW6aCP7z6LukkyRry5JspQPUfWP90GbGca1rPdQi/KVgGyTMGA/g78jDY+H3HhveEvptbsJ8Vm
 /3ayLTVkkN10XBx64UzzhMhBCMHX9OA2me2M2w5vfHCYhrIqBds4=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_083154_307099_FDD9FA8B 
X-CRM114-Status: GOOD (  16.25  )
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

Synology NAS devices use the output pin for interrupt signal 1 to wake up
the system.

Move devicetree bindings for sii,s35390a into its own file.
Add necessary properties to configure the individual pins via pinctrl,
which allows the interrupt signal 1 to be used for wakeup alarm.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../devicetree/bindings/rtc/sii,s35390a.yaml       | 118 +++++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 -
 2 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
new file mode 100644
index 000000000000..f86572e9faff
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: S-35390A 2-wire real-time clock
+
+maintainers:
+  - Markus Probst <markus.probst@posteo.de>
+
+description:
+  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
+  very low current consumption in the wide range of operation voltage.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: sii,s35390a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description: Supports up to 2 interrupt lines via the INT1 and INT2 pins.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - int1
+        - int2
+
+  wakeup-parent: true
+
+  wakeup-source: true
+
+  "#clock-cells":
+    const: 1
+
+patternProperties:
+  "^pins":
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "-pins$":
+        $ref: /schemas/pinctrl/pinmux-node.yaml#
+        additionalProperties: false
+
+        properties:
+          pins:
+            minItems: 1
+            items:
+              enum:
+                - int1
+                - int2
+
+          function:
+            description: |
+              Pin function:
+              - ignore:  Preserve the previous state.
+              - disable: Disable pin output.
+              - wakeup:  Output wakes up the system.
+              - clock:   Output clock pulse.
+              - pmin1:   Minute periodical output with 50% duty.
+              - pmin2:   Minute periodical output L for 7.81 ms.
+                         Can only be used with pin int1.
+            enum:
+              - ignore
+              - disable
+              - wakeup
+              - clock
+              - pmin1
+              - pmin2
+
+        required:
+          - pins
+          - function
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@30 {
+            compatible = "sii,s35390a";
+            reg = <0x30>;
+            pinctrl-0 = <&rtc_pins_default>;
+            pinctrl-names = "default";
+
+            interrupt-names = "int1";
+            interrupts = <23>;
+
+            rtc_pins_default: pins {
+              int1-pins {
+                pins = "int1";
+                function = "wakeup";
+              };
+              int2-pins {
+                pins = "int2";
+                function = "disable";
+              };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index f4d0eed98a08..0bdf0ab4ff97 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -81,8 +81,6 @@ properties:
       - ricoh,rv5c386
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - ricoh,rv5c387a
-      # 2-wire CMOS real-time clock
-      - sii,s35390a
       # ST SPEAr Real-time Clock
       - st,spear600-rtc
       # VIA/Wondermedia VT8500 Real-time Clock

-- 
2.55.0


