Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB0FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=; b=A4mK188DqzzeDO+wxoRqM315sd
	9xiX/URczPYPTev6p/PrOUiPluxUWi4oPRihAKeb/CEmpVYilnruuq+kPg88CjATppRypNas7ZHOv
	4FcozfIcl+DNKd1bBCx9Cdq5wm+E0CSZHSXF7eDMna3HlXeyuY/NjUxZvBPNL+v2DKcXsYVLw1A32
	hzmf4JpgcK08xyqEkttExbaeYgjvuzVgbNekh4b6V3qZN1FCsI1jFjraojZf7MLOpHUdiKLVgraDk
	y0BWt3K5/+FRleQ643QvSOnVTgkGwHSGdsTbf17wwWRDfxo5Z0C+A9W1VPN5qijY9cLXutdHl5z2K
	JoVf+aQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qI-0000000BWwk-0Uf4;
	Thu, 20 Aug 2026 12:25:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qC-0000000BWuN-25m8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:25:54 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1361455f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228751; x=1787833551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=d6tMsmHak5Wzfozdf9+zlTyt+8NuGAXTurNZCz/yY/qfudF4es9KPbtmx3Bzyx29fx
         +oxTCtCAq3xlajoBUOkeGYOj6ExAriA51FZgW+Km8jrN1aeol+21chKULou/DZ7PNYxz
         Mal9+r6jDsMAuOV9g+QbqnVav+JVsKgbErLNHKVtpfymvnekTvYlU846J5rJwdopkv+Z
         XSi8GnAqWMU7Vk5CikGAvJlr9mYrDrOee+sb1CHqI3PCl1DrkeuH5YlR1lCUHahlMNJn
         IH5gawyYwDMI0tvzEmCVTmZZc1VfFCTA3jNov1sFmvBTH6axs9C0FhtaXrGX3kchGFU1
         zYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228751; x=1787833551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=Rluq8Cgoo20ENGBRa23htH+9hYeVbOga56S9OHnOPonbuEKSMiy0GhUopn6Q1iuMQi
         PhPoTyfUbUyOMeOgMkrpttinz5OkxHeWYzGwGMlVwtE/JqP64EtFXyADUUeW6cd0a8xV
         W4UsW8q7HW+EQ/H3c332/k5vdhF1D7utZj1jx1KJqzgGa0j+DwHsrY6Exb9Iz+8Mmf7O
         7k8IcHSLFjpYnc/u17tu/v70Z7EkLw1qfBYBZ+7sBpwJ+XrgWxTskd3LXpeHl6lU80SS
         nzasxY70ezMf2BoX+CtRBxwLE+ReY/QdBB3Fc5hmXlJZ8RFi8n6BjWsB/g1Wq7t6y8Rc
         Roow==
X-Forwarded-Encrypted: i=1; AHgh+RpAWcGIgCUNZDJNW9H8sGSk9321HQU5BNIi7JdSYzq0guQEIoXkTx3ls6+BtFuMx5HBENBaPw3af+0KDGAif8UP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw57qutlUJaSn9V3wIA0gq7CJeAhX9qy3ogdpnPp14JR02R7jul
	v84q4UqQlz4MdX86jPY3sEsuyOu5aGntJA+8KQfNrlOETQOrdHqFFdtm
X-Gm-Gg: AR+sD12hS8n8nK+I9rQYPolIuDuwni6uZVK0RzdqcoHtDLrurTUql0W/kRLVP7q8Ohs
	3XcXaK8E6LMCX/cm+LcxVrHvU63cUvI4PsUYFYp6OzlhXtpXYa6GbOOsQ0t9IHeaeshOFLTADJ2
	CJwpjtJlhBEHeu44lpdfJBfhPWR23gJGDxhQjjcMiBCO56hSVD3c85DPrPr3rbb0MVMewkQAj+a
	gNHJXCt884R65Fsp+dmU/t419lc8V5zM5dBreTej5CukaSAShgNHl4FW5c41X128lt023G2uWcF
	Sus2VqJCBG0u5OqeO/KIB/119WtlOK7UR4iKj9q8mpteNDpzyLt8Z7y8qcsGcgkMicN4ZSe8gIh
	PK/YkSy5+DEVMP2p7G37RPebEQgVXyr1F/ipbZ412L/pZxEMmvuzxZGhVP1haQsJEs+QnplxXXg
	lhfFBtXS5QlSLNGB74Codw2knU5kZmAbY0KW3bAMKQGSevDr9GHZD/dg==
X-Received: by 2002:a05:600c:5288:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-499aa1ea46dmr243508505e9.13.1787228750345;
        Thu, 20 Aug 2026 05:25:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:25:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
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
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu, 20 Aug 2026 14:19:59 +0200
Message-ID: <20260820122242.120039-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052552_584871_4B19D838 
X-CRM114-Status: GOOD (  11.99  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


