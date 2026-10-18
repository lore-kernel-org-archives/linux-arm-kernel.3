Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC59CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=; b=kUppeFpzIdTckwobXM4NLiDGmS
	gz7Xit6g8vbSL4ywE96BzxQOiCfO61G4VqOQ/wa85iMIjM0A0iEV+oedihd/boPZBhwaOsWzFowwh
	JDXHQomFI7ZzgSIU2pyfxKImQvZXByX0B+NL06h4gPgvht4nZ7K6oY7HzuioG4Mm/dFLh7yPgrBWM
	676eLSGKoKMSXLG5mozWG7uEMJd8e3EWJ5tP6Mfpot42lnibna8fqptn088XySxNlMhm8Dzdx/yME
	bg2OCAxddt1I9uL23V09teJara9pfZAFCQnQoewrk930cr3SCJDKxc2N6MNenDALJmyBHjpnl2S+5
	Rd0pAPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrN-00000005Zdo-446X;
	Sun, 18 Oct 2026 05:55:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrJ-00000005ZbI-3PQh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso760617a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302901; x=1792907701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=;
        b=iz+AcnoaXZSenjIeM3CDJ0qMVDfVYZ3l7nAssiaEqS0SphHvsY07Z7ui472JyB+wJn
         UfqGNmlf2Vzo6YvTKLIlJ6evgGr2igly2Id0AYpCkDJNkgJ38LWyzv9pH/99OHgGptaz
         pHLP11VkMGX+QBmGbHPezf/chjFzoKCiPvg9HurgwvIndsUWYZlLfYqDysmDwHgKqdAt
         vyEeADuEPrlzMdqFruHQbSTopQqzlittpJLMDxkXuVP2LZyNT22lTQMUWVQ631zZcRBD
         skL2Gi9T7/AFwFLWCmjuVlop/wlw104kgk1WfuQJabUS7RMse7INiXelb/rvgQoLw6v5
         0kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302901; x=1792907701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=;
        b=b0EjnSX1gO09H1oopJd4Dx7k66I9weDWotKJtL0PSWbbRCh5ji5XiRZDSKMOxInLFi
         UN7FfKAxAFJMYAfLk+yLjSzmSrvIesvQY43ojPsXtGXu2tMpbFSoVvTKby/PaWk6wgrJ
         LqGvO9+2qkARoyPFkS7iINAtqFNIm3HTcaxJHGIrbVF1XSberQIti3ktjyhzoeVvvvn7
         /cTndWeWqpbyCgtS4K/Xc4lPVuZlowcnlKDPtwpvoNcqMmfc0t1me4NF4/rqbMv49+i7
         nMUVRUBZTEfTy/rPSzhRp9RegK731da7egXbnuSL3APcjLj3F5WIhIvfW+HG4WRM5CHX
         Glyg==
X-Forwarded-Encrypted: i=1; AKwUvBzvl44c57IVuNz8EF8sRB0vChIy4BFXKfxLmqND3o4tcj+EtrZ2oIX3n493oNj75242eyyT4EGHEKuQH9kwIC36@lists.infradead.org
X-Gm-Message-State: AFq9FYLQVtKf7w5RvM5DO5qphwwq4Qlgba442MTi6sb+/3Z59ducW7hK
	yT4T5nzUwd2IX2glPaK79tos2iyL67tEKUW7Wn3OlAnyZQEkDQk2yV1s
X-Gm-Gg: AYBFou3yPrZtcg47BY4v+cvu10Bcw60tmB4Ws6oVd/gkkZwa9oXy8tPGSZ6r/GmbRGq
	/Ct++eW3v21wM6vTJjShtP5t7ue5QW/1okD25i1m8czD/vilxLATvdnvWAbVV+KY4ffFIY+T+ty
	JeIl8e5skOaVOY2XcJAfMYNYDqvVYbh0a4vBBnvsPnTldgQMCsGqW+fmAaQyVJrtAskNketAUU+
	OoikPCW38EuMxrqKRPA9tq1J6PjkSG9dmFbECc6V7WXnHJrKgDl18IumM5Nm5WcuOq9cFl1ptzO
	7bZXPkGTo5AsWaEa0DRavWSEzW8BUzRRgZQZzuFk+CKt6V28UJ8fHvLxipPMBPGTKXn7ONxGpCq
	r6/yQZt7Z4BJWX8dzYTQGclmIi/yfWZzEzFzaZAjG2Z9DP9CXw4xglio/Ax1PhXVeZJhJIBX5AU
	AjLghEyrPbAsZX2sOnpaBe59Z9JKFEswdauI7dwe+EVy0wzYbpSv15BMPb1RMBnQw4dj0K2p1Gk
	DQ1ROlKXI53gI4+01TKxxoCYHsxxNct42gsVt/P8o6apWgJ1h15oBREvB3N44nwr0SKQpqLPzl3
	xw/gcXH5nVSwIXY9L/I6dBbeYFhsLTLZhbeld+Fo9cKEHw==
X-Received: by 2002:a17:90a:10f:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ad1b31933fmr591669a91.60.1792302900781;
        Sat, 17 Oct 2026 22:55:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:57 +1000
Subject: [PATCH v3 03/21] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-3-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=SS0IiGxMzo2EMW6a+AaERracfk8R0/aaLFv1rffDov0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rkvzrpT+3hikpd0XyeHaOQZWyEpE4t6hTOGb6VLj
 +VvPG7YMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOpWC4a/8oLvZRckda2Tv7r+9ooPjcFXLz7W43pwr/NTVlBt3cr5UxkZNn8vj/3
 7JHkNg4JizDzez8xF/XtiuyNyg/5McbkuaKnKDgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225501_868064_F5D414DC 
X-CRM114-Status: GOOD (  18.22  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Add a binding for the primary audio subsystem found on Apple Silicon
Macs. This binding integrates the codecs and SoC I2S peripheral
used for driving the headset jack and speaker arrays on all Apple
Silicon Macs. The internal microphones on this platform are
connected to a distinct coprocessor and are not part of this
"main" audio subsystem.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/apple,macaudio.yaml   | 212 +++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..af8e9686ba7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,212 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are
+  part of an integrated audio subsystem comprising of Apple's
+  I2S peripheral (MCA) and a series of codecs. The machines
+  have a wide variety of topologies ranging from a simple
+  mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own
+  mono amplifiers. This arrangement can be expressed as a
+  set of DAI links, where the MCA ports each codec is connected
+  to are represented by the CPU side of the link.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,j180-macaudio
+              - apple,j274-macaudio
+              - apple,j293-macaudio
+              - apple,j313-macaudio
+              - apple,j314-macaudio
+              - apple,j316-macaudio
+              - apple,j375-macaudio
+              - apple,j413-macaudio
+              - apple,j415-macaudio
+              - apple,j456-macaudio
+              - apple,j473-macaudio
+      - items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+      - items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+      - items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+      - items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+      - items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+      - items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+      - items:
+          - enum:
+              - apple,j457-macaudio
+          - const: apple,j456-macaudio
+      - items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description:
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      Node for each sound peripheral such as the speaker array, headphones jack,
+      or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      link-name:
+        description: Name for the peripheral
+        enum: [ Headphone Jack, Speaker, Speakers ]
+        $ref: /schemas/types.yaml#/definitions/string
+
+      codec:
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              Four speakers: Left Front, Left Rear, Right Front, Right Rear
+              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                            Right Woofer 1, Right Tweeter, Right Woofer 2
+
+        required:
+          - sound-dai
+
+      cpu:
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+
+        required:
+          - sound-dai
+
+    patternProperties:
+      "^dai-tdm-idle-mode-[0-9]$":
+        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
+
+      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Idle slot mask. A bit being set to 1 indicates
+          that the corresponding TDM slot is inactive/idle.
+
+    required:
+      - reg
+      - codec
+      - cpu
+
+required:
+  - '#address-cells'
+  - '#size-cells'
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+      model = "MacBook Pro J416";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dai-link@0 {
+        reg = <0>;
+        link-name = "Speakers";
+
+        dai-tdm-idle-mode-0 = "zero";
+        dai-tdm-idle-mode-3 = "zero";
+        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphone Jack";
+
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+      };
+    };

-- 
2.56.0


