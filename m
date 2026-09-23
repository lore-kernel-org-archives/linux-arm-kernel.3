Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079DBC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=; b=ncn/Lc8OaV4tv0OCdTDP4FuNvL
	VAQaTkygt/f6smbjrQwQWmRJceYS0f2e4fwn0kiRakBcSous29OV2A4xyetmRm53J4Lv0iBR0yEKc
	0e+GPcnpzrm6X+NiDrqz9DxswmRohaxVXriuSBy+1Ou40WaL1ywRpFfh9UKRcvAIqNd0m9JWZwnnU
	ZFS1fYUal3DKOgMzoqp3jCU/B0sB9Tx7Wo0ef7WmkeSBeFgSctsim0RiIqtWqleFk0eRvsWtaXudK
	IcclOkPJtSqCUxb12NzT/aCGUCVEZXHlSbtfLG/l36aY1DrkYP9nqet6hAfQnwQKiwpWPxjYOdFlI
	mbQZ4wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fee-00000007AmN-0sFF;
	Wed, 23 Sep 2026 05:36:28 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fea-00000007AlH-3S09
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:36:26 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a368895so388476b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141784; x=1790746584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=RkKJ8h923o60AEXtc1vGxHB1/ThAa9OIKjfX/iApGZGDPR+rVj2yFJ8G3X7ky6YgPU
         MS+yZ05LplaNk2ugy7XvbHRMuFKoSjRaWkznH3AvlPapQtjtRt68FPoN7NuwlO6u0udJ
         41frF0XtDkevhdlrsNWNUbBRS5Ylqb/Z3byYj174AwbFRrhmneHVEL6gIxcZgu27F8VH
         T2N+fr8hl2XpSpItmM6e9geLPQkpwiEzeXCDx7kabYcfjddkki0CcP/plDX4Kw5hkiKv
         pujiIK+rNLQIKsH4Qe9B4q00T+k2eApGdl1RTZolAlz4ql3svyFoDaYC2nDDTQgM2Zgo
         ttzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141784; x=1790746584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=K9+oya3/+zuEYkFHkShVM0sEiX8kks54LU7Rt7wvRF725gVVBUqOTfOQ+NMhveEaCa
         r6gR0VkrI9Blnc+N9IFF6i9CU3rjEvCKxW9Lt6tf4Sutp2c8dmrDUJkjqqN0VIBfORwO
         hgcBbKa0pqlwMIIKYv3z4a/jE+8kxhzITs35AcNX8OAO/9RMlSNUsA9Fq49cdTIFoKwF
         fQ6oODabkqZWi+3WLDkdtYs7f/4ZgPBxxnLaWGIN1HsWq26M0KVtwx3DF0OrtJVDzcsB
         2uhyfWahQTIRRbc6v5j4/7B2wbLIoby8LgSkA18Wuc2ScavJgz9b8IpK8wsKBcrT6erm
         FFzA==
X-Forwarded-Encrypted: i=1; AKwUvBxQUvR21wVDJVuDoLCYXb7/X+gs2EGzZYv09ploplezsX9Cws8x2ctQo25K1H06sXTHdG4PQBPznukK3XzVkteJ@lists.infradead.org
X-Gm-Message-State: AFuF++lEdd4E+zMV3Ob68kFUqQrvbRWuw2hTYDkzviLSEvUb8r7zeqMJ
	7K3yrTYEXJEZXQVkmyVSauXYzpAQjv2siaZ1xvbvzav42Y0cbS6gH9fv
X-Gm-Gg: AYBFou02io4aibEMiNscaPyRrEk3wxo06kPZs2J3AzUxL8igIYd6A5Kny80o5/POB/s
	iY6Y5N5+pR/4A0cGtfGOIBqUAVz57EeNCuSynYjkSvLuEzKGCggcZbnPNOHNN9isQioexLH9+Sf
	BcQui9GjZ/6Y2qbtAeMjSudjcmOffwJV3ifDkQhpBbt3GtSvaJiWE7hFQVCc5wHZwc05Cto9tKH
	hiwY1eurOn/YWU+A9ahWcEWbMYAWKD1dwehamRLCFcheJp6ZKyZjbfW9XVxMQeNwr/BQzcZj6l2
	PZgO5pndrnLvybECnt5Ev4EarVD9fURg0S1szNh3NaWKNNodAH1WQwhDAR82Yq/WBJT5oIfzrUq
	kqMjE/NaKXHpWc20YPNNi2hlOmN4cMMwcj3Uw90YlNUcrsRTsrdCgCECC719ALUCH7QQhWpnomA
	nD9Bb0F9ymJbfKiLWFTydGiaG8DIuSXbLH8iNxTSPPhhSpkBJqsCSzUJqyjB9ojuZFgF06hsuPo
	aBXE64XATKiFm+XKjG1N65YGTGGO7ChaAmHEnb33kxmNn+x3RNb4d1Jp1o2dKB8phmMvSGmLLTs
	t+H96NXuHuEayrndGYCP1c48I3u3MvkmoYgeShbriGGMDzo/EauA2DNZqb1Mxr533GYnJA4MYWA
	igf6FvLBV+8dvdV9ZquSZ
X-Received: by 2002:a05:6808:6b8a:b0:4c1:9127:c0fb with SMTP id 5614622812f47-4d5ba3c38b4mr1883196b6e.36.1790141784089;
        Tue, 22 Sep 2026 22:36:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:14 -0600
Subject: [PATCH v10 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-1-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_223624_905764_30BE0608 
X-CRM114-Status: GOOD (  13.63  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0


