Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0211CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=; b=YeQoyfT29BLvaaPEmNFNPe8DTv
	6/fxeGNApnCgU0TAO927MNYO+oXSVVho16UxOjbPnu8uIR6pgPlW+b0VfFOf+xTGQGULjMo32XZjo
	z+JiNKIM+JvY9juPwbX3dvU1amIWVXv7aR2UF1xAqikJzwY+sp26uC8+7WB3n4PqGOyAI2+PBHR+G
	/3Uw4id72NWSg7TYsnyiHkm7VEUNqKjjLM0s1xvh9hwWjzLNeqNKJHMDXD2pGvpQXMGsZPe/xn9Xz
	RYBKWiKG2HUew9xxUi1R92rruheFddhsY7acyWX5UW43Bhgi2Nzd8aN2DTNYQFSaR/zrRE1+3kNUu
	Pd1aXNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDMd-00000003pZk-0u9x;
	Sun, 21 Jun 2026 08:17:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDMb-00000003pYN-08Gt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 08:17:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49249072f03so5068215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 01:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029827; x=1782634627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=;
        b=Ufll5E88wR8fMpoC5cwUCPDqQL/LNy75fLh/vDFGMuPzqhTHGRX2uDHU3CS4kJFIUq
         mxfq6gav9l1rvFmJSo/JR4AtfB6ElS2de+onHLa0MFFZfiYIXsH8QglHiLeUSjZhDY0h
         PvB4QzxSTRfa/+eBT5L5DGMXDygxoLejzMIfn4+Pmrvoc2DYiAl6ssJODCaqs5CKWZ4s
         x7JODMfYaRYvoKBGisY0i2njvPA27gHCm16b8WwDe35KtF56CxvnPR9vwZ8Ja+ja56iO
         JuyIds43qFqRQVYU4oZJlMr7n5CacWyrbmsn+yS/hp5zZFW8x0L3p+CXmDh07iDmo19B
         xDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029827; x=1782634627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=;
        b=HloTcLzuJFwt5hNNlwo2Clzq3tY4Q7nJWokmRBsYzX99d/kgStObxFgNd+iyWxL0Cx
         p8qe4subcvBKbNcCq+Z767DgE7HSjCXeQTkWMvxTNYIRms+XpztkQMDqaUyVV1jVze42
         bwmbBZG6nhJIJhWBP9ZKMwE1Rmjn4Q8MOX/rT8PYll1TRm/dQmroyt7waX7lZW4p1wg2
         lKwkmJuRhWFHAoGshljAp6wZYzQXe794Fq0qOvqG46mpphrPu5s0VjTirlYUGSajGlv+
         gEEhIJIBqnNAe4wcBx6c/HecCCdJjrB17mj8ERJnLFS0cy2PL3bgMejyh5ku56j74EQe
         g0aA==
X-Forwarded-Encrypted: i=1; AFNElJ9LXp/puUosUlHTg0TnEqt8V40MgR2nH4xyHZqDCTd8TB2ICS4kGuC4WnvVSHwK8dOwIijTa0lO4ZdppSZ8aOCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxawliKK3rgnd3/dApuBgel7py68YxijtOj9hrAGNQRqVAWGC3M
	T1CGiK3N4AkPTyGPU4z0T+erOF45vbw+O5UP5JU0DDMwfqvJ9Yx5hNsD
X-Gm-Gg: AfdE7clfy1CGat1k+Ar5IiY8PEc2YxN5ZjqhHxlKu+1yC7ZCl+RJwJpKB5HDY2k2blL
	PZMHSQBfe57+2XT0GUgzIL1cwjG0VBt1wqGBriJk0eZoNHOcgOFX5YCzbmbv49IGa1o/bBuPLuH
	aqyKvY9tMO039Z5Op/oLjsDX8xza+JwtWcy4oNPH+Mp3AobocE5fQvvMR6LvgPM2J/E0X+x00qs
	tT286KgzAonoNPXYVymS6uin2kDvI9VDopgSP4+5excOaR9hrgquImLctk9QPU2DIq/ji8YM2i/
	neW/umg4V1jhtGynthTx2qWK8GEOYDs06Crkn3ONmwaOgzNu+0KvEIeUNBzciylu/4QYVwCfNCJ
	wHieVzwclr102xfcnEWnpDTKOQ1FqIvAxj1gf+EUBB1jmBwBecB6tfdQUKtXp/ahlAew/oF/FHd
	5xPwdk2w==
X-Received: by 2002:a05:600c:468c:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-4923eeb494emr165616195e9.0.1782029826761;
        Sun, 21 Jun 2026 01:17:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:05 -0700 (PDT)
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
	Val Packett <val@packett.cool>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Sun, 21 Jun 2026 10:13:26 +0200
Message-ID: <20260621081634.467858-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_011709_091967_D15DD49E 
X-CRM114-Status: GOOD (  11.22  )
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
 .../bindings/mfd/mediatek,mt6397.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..fd4b41bd3716 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
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
@@ -99,6 +107,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +672,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392", "mediatek,mt6323";
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


