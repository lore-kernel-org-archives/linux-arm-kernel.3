Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6416FCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=; b=i24SVW8FcGRg09105xj3tHY/uQ
	3EaKyZ3NlAaMmx2o9DVmoZNs6M9NDlkeSNw7sTsIuXzRNQATDKGstu2UeQzcxlUBnfEzrrpf+Qn2n
	wxBlOS8z4v9XLTe5z/8O7uOxpG5yCpJwVnb0l7T+8P1i8OTCuhK6XQgtJkqVCKt6eUiEOAFgZqS9v
	hP0acI/efAsss9QkxJ7lJhXvQnDjBN4M3TIcN/2l2rcMfupmv6BLWFh2aoKuND/pRuxyzYDl1kcvk
	2fx9q01MfDBKTgcDHKDxqQ5yBnjHisiCP/1SOCCywt1qEVbRksGyuW60u8StiLg6Jk6hb9+wmaFlG
	lIeQfh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLg-0000000ENZa-0yOh;
	Sun, 04 Oct 2026 06:05:24 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLY-0000000ENVk-28we
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:23 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a6f8525bfbso384326a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093916; x=1791698716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=L6iYVDNy1S+fhNIcoGFppgvHYDdVZukn+UE50wzlsHFSKmuQOrwB8nA/v5hS6TKaF8
         iQmyZvV0kJqSjJQMdZj7/qJli6N/WaoEK9fmc6tVE0SxDsi+FkyjmhwQjJrWJppgLC/u
         NfhrClhxsax1cc/yDkjNADGf/icWkEUf8wRlYA8vBG28XEt7Rt9TSXXaRNw7y6ANx+lI
         TDKjF9zsUFqc0H+QCl9cEL77FZTfI72Lfy07CsuX4UVgyUUoRxB3dHDrNQ8cVwmM15im
         FOSGylT8uX2j4ZzRpiy9+ndkkFeCw4IkXDtfOgnuoI9IGDhpkdLuypUmiaodfBR/FMPW
         WyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093916; x=1791698716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=wj6w4hxbSaQWB5U197jcw/d92j8RsJLYVwmAD2+/XUoAyYhC2yHU8ZTD4SkHX18mRV
         +VH0yzfxErlCPyUmV1eotZHhcu8B7JZq82GXP5pEHVn3ZkGSmxU5qBjWbG+EHhyvFbA0
         8mSj2CNV4w9W4VY2QfhyNaF+YF3LtznrIWrlhhwmeZkU1srIoxkFppIs4+L1ypLeuZMU
         YhYFC9hEhSleMU1bphdhcVn9EViU13xehqBpNvgliKwwf4Tq6In19UNU00l/q4SSTss3
         8MqsR+b5uCrVBcEWzkgggPAOPstfTzrb8I8FMJsnXkuTcnK7EZAN8moqRBNKw21Pzb5z
         5Hgw==
X-Forwarded-Encrypted: i=1; AKwUvBzptaSxQrF8sus6vqFmB0gtnxSSZrJmf4KcM/PF/bTejBabI/8Fu/+CLFw2hu6kpKF5nymWtw7rh6RYiD36RfzX@lists.infradead.org
X-Gm-Message-State: AFq9FYI/mN2GSYNt3jHqK/C2PPBPX7Fkzzm8mFHfjdFIQUfs8jVM37XZ
	eBD7VJWdqh/wJp22ixout4RuXOCKqqSrxf+VlEkYe1+oxZHULISqU2e+
X-Gm-Gg: AYBFou2/JYutZyW1bdkKh71sSnGSwo6eLP33xCarCL85ygIDRN4NmwdHGFZn3D4+B+w
	HGf6rT+ny+LyFTLr+SgVq8RaPpLeGXn3pnnH6uygRNtmASKHK3IryNULXpLRMBvUE9oP59gVUKR
	2pnQD01m45cTB4nGa0plJMuFZDXoAtm9ftLWI5av0qaq70/jwUZARoi7Luu/QGWwgtFy8lqStkc
	yeuoCmLiXDhfsYobZc9ifYsOYe7CpmCO2AIS2glwT7LvT9G2FJEBC8mk51Se2/+19qUh4WBf3Fw
	68xYZK8x3WyKS1lGdujAxNBCXblffc3QGoXqvP9flSC01fpmyfTOgVeGKWZvrzoYMINT9nECDgh
	KW9JphvgBafz783VbE7HcKnwjevfUgiExCMKqFWnxNwJqMTc20tWbCsaIeTbbFWJmd455jcwlpA
	b5/esD62EimbqNCCbYttnEO1XkAIBTF9gX2NFJ8Al2salJkSpA1on1SfBU5n6LBPOBj00Kgspix
	ybVX5ab4UOtOV0ORpTksJa1KN4YKc0klV+ogxASF7rr+132zIxHzW1Qp5hokuisaexq1YQjB6i1
	Ni6PfAJ7wGGfzBfmRs/1zXpMRy/vBn4fWhusIAbY+AiuS9I=
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr2736881a91.33.1791093915710;
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:32 +1000
Subject: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7056;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=edwYXBTQUN1BJwuH/myONPpbVVDVKxKBlGn6cvmdYcM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+T8n6S05ssjt3VXeH/5abN0rD7X8l3TwfnwMveNC
 nZTjyX/6pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1wlNGhib72Y9aU6bFiwarVGz6cGLlmgUJu3PeybAcaEmz/zF56yFGhvPLv85
 urNso86dFdsvVpArpA09jsy7Lmf68f8T2CUMzJwMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230517_691371_8F51ED22 
X-CRM114-Status: GOOD (  18.36  )
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
 .../bindings/sound/apple,macaudio.yaml   | 210 +++++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..c0a04fab82d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,210 @@
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
+              - apple,j473-macaudio
+              - apple,j456-macaudio
+              - apple,j457-macaudio
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
+
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
+
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
+
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
2.55.0


