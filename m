Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1C3C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=; b=GVDI8+YLjlj2mOwuorZ0UzbWhm
	Oei6SJiqN7Bka8ibUg0vvsTWbRCvsjqXDkTZj7mvrwhIRpzs+L/4TUuSAbhHAvPGqp8huzkTUD+3L
	d6pCoOO0Ehw8hzTXf76xQRMzmoaSpFekCThVHr9vPnh0EUKEnjGHGKG7nU2Ho625ddKAMgo3S+uJL
	tTrl+eDz8RHl8qSRIHUEMg033xRO3nGclAME9onzjn8++225XKEZJsjd8M6OBC4rih8IZATp+fmoD
	8FacobpGiLtVEfiURiS+XJPD4OlzX+IkxI2a7DD1Duik2r4Lzcoopc6UROBYqrv8tsqVC1z4kGx6D
	hsjvuSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qjL-0000000Fj03-45XK;
	Wed, 02 Sep 2026 19:34:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qj8-0000000Fis7-38pF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:34:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47de0093c42so1572753f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377669; x=1788982469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=;
        b=VZnA17yIfWjFiCAd2D4QoQowfP+kL9N9CfDrTMLTEVO8UFiBZIWc/M3tDMtN/fMbHD
         gYPkNYdBUyUqMewuG/khUw8ZFluOEyoHC4GyFv5iw9y7BuWZwNp8yqEGCckPJtTgkLVG
         /qRhFbCTMqZC5sL6ivn7FC6AsfQkqVBbNRjWRejG4pF54xUHivHi7FySLqKAxrKbv+4B
         6C7qZh/cpjdZJZxKO5s2+4nZWYtBUpZO28vekXGvBRGZEEfDiGQeNv+kOzlcIScqbSQZ
         NOnBQEQcH6SfUNjSVQbeFu+Rnlj0aMikIPfXdHwCly0ejpZGfclxhhp/pt9BoytCJfOY
         g63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377669; x=1788982469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=;
        b=UopgHpVZgcHhZYxk25Sfr0sBtaAUTDubI5x8Nmz9Ph5Ff1ekXh67pIvkibSPAq5VqJ
         SfNoZaPILaeTZI+4jV3u5iDsw917iG/7cDKK9nKVmmx/arWXp2r8JnY4d6A5fM9Rx6DU
         Ta9uS0bvRKNndJMcDwELqFvjYhhtFqu3Qk8YEM+JmXMQKSKyNwxTytwRH4CicDHrdSLP
         JTSlMAUEUInLQ8AQMAmb5cJ7KqOIlS0A1cBZVwAe3j3xBtAsRgmSpY4J58OI9Bpec+BQ
         x+JD6kzpve8fX4GP/WkoCQfZ4HGKYLg4yb4WyC1098NgsNJ+thcEinQgO7zmWNAoOLgZ
         qeMg==
X-Forwarded-Encrypted: i=1; AKwUvBxTjaRZubTrSPNYF2/CMGFIRPyKD1aTZoONWn2TnWqDFk2I2O8qruBEgRshHS0qCHvwOSmmQWfVG0viEF14FpjD@lists.infradead.org
X-Gm-Message-State: AFuF++lmLadIGeXF7pHv+cObJ63+GOWJGXuWKi32AT3RQs7j+XKU7XfB
	mw7I6ezlB45/kCOM7soZJVpXid6UU1XohKyEG2te1etbdZR/Zv4/7FKp
X-Gm-Gg: AYBFou1tiS9nj8RtvNVqj0jLycwBoogb2LDAUvyJQBddk2CmvhPCKMX0oBNGyAWKXUI
	63TlJePznjtjd9bTBvXCrqO+fImUJakF0Hr139waUWLmAum4Y3IRXFvPFimSGDJyqMDL7rP6QRt
	44GNIOeize/NLArlIEbbgf50W2ALZMeGvjC7Hc3/4mXSlThn9lOrpI3hVffJxixm++uzKoUq/V3
	1Mz9YRqYYa4g3PsA0xyyNSjljPbbV1lV2WyLUjR6LS1yjZVWwIAKppja0uhmRIzh/PkutJz9TZA
	NruzISLXdAYjn9I3xvPRfPXj0OD3AJh6vrcfbNc8qLz4PG8LtiIxjZ/bSf3j5X074dRSZN94D6e
	1f+G57x77qRLwk2hS3isNe/CD/OoVVDC27RPvYLBZ6BQ95muEFN1Uha+qK8F0fyryzXqqA2tmsj
	7wPGF5i+Y7lOrr5uNKFSQTIEiHU/cUuQymmGran2VG3PUq6kHW6m4vTnK2
X-Received: by 2002:a05:6000:4819:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-48488deedc7mr13797916f8f.3.1788377668785;
        Wed, 02 Sep 2026 12:34:28 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed,  2 Sep 2026 21:25:37 +0200
Message-ID: <20260902193351.185771-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123436_982538_0FCE4641 
X-CRM114-Status: GOOD (  16.50  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Previous version of this patch had the PMIC device declared with a
fallback compatible to "mediatek,mt6323". Sashiko pointed out in [1]
that it would have been wrong as the fallback device is not really
compatible with the new PMIC.

Since the change is significant I have not included the Reviewed-by tag
that Krzysztof Kozlowski kindly provided in v9 of this patch, I hope
this is the right thing. I really want to get the bindings right as they
are harder to fix in later commits if the need arises.

[1] https://sashiko.dev/#/message/20260820125850.3B34D1F000E9%40smtp.kernel.org

 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0


