Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966ADCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKF7GqpNUTdJMAXxQG18bCaWMljaCNKHwPc7AyjKQ9w=; b=q8UFDWbX4bRe3geCAVa8zlHy8H
	Mmc324rYq2Y+i58vLeTNbg50Pdn7XMdYdEsnI5LBT1NptwEEX3qEclXLF+Xr2AzVuB6wYUoJNRFPG
	38/zattjImt9vYIN/X5fbR0RtOHTGuE320YllSQqGt8wFQC9PTv6dg0565fxpvgkBfs/5x5E3K+6E
	csZY0t9GY63v6VTGQu16Q4dma6FY9SCNT6akPbqbTTed+xx0VF/pfvwjKP8jrV0LnCMpCclnVttDh
	cBe8fflhCGqaPXY4ylmHydH3vU/rsTJkXixw5rz/CReHXLeXvgmRF2LsbnuTjbjQplEXOJwcA5vvH
	hLLRjkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sG-00000003WcJ-0JfA;
	Sat, 20 Jun 2026 20:01:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sD-00000003WbI-2Q3u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 20:01:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490ac357c55so32560725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 13:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985660; x=1782590460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKF7GqpNUTdJMAXxQG18bCaWMljaCNKHwPc7AyjKQ9w=;
        b=szGCewCUIqSSGDP0zHC+6FM+AZlSScsdkHQXzanze+P8LRPe6ciOcn/LMBmH4q8n/J
         JB2QyV/Ez+J9WopiT1QO4jwCOFzHO9Uhj3ajjynZYspnjKmDs/g4SFuwwizRi4CWsy74
         bQ6sYaqGHdZe+zVDj0SSVonpJ8/93AQbrmNkrjyjqEnEZsKORwzhMrwr0vo5PBFkw/Fp
         Q4Xh+ALzD92xKCax+k2kjIoKElXnsGUQjpWnrZq5oq9lqPY/+R+UNsbXBvPabxP0GNYo
         K3fCwnbXXM5Cot1IgIL+O+r8dRTClZ6hpIGnXYLLGyf8l/4nLfL+ck9nkDWWLKW1yA2b
         OLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985660; x=1782590460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OKF7GqpNUTdJMAXxQG18bCaWMljaCNKHwPc7AyjKQ9w=;
        b=ER0CE+6kCgU75Aiq8jCJQ9xtDTwtqVagRSjXVmy+olsml/sVmQ4RS1fQ123YsaAmty
         axAQNgqp9EOOeFTTzqRa5Gb8Y0v0o9aJLqMdZTvuj2gnsg71TckokS9+B9ojWPMUhySM
         RRGA/z+5fZ/82dIb8AbmfPs0b00JKCltFnMubcQvY7Iidx0ZfygGwqG12ooRfkq+afIa
         p1AhYMnS0qRt9FnYKTMy7DZLSW6rvtg29rng/eJGmyMsoxKvLu61Z7rdwU/oj1yJZ43/
         pTmY5P0Kh1/U4BC1CFPBT+Qcd2dMVGTNnGoxN34CtnlzT3fr9ho8bEQXSa1oyyENM4W1
         WwaA==
X-Forwarded-Encrypted: i=1; AFNElJ/jP4o6s/fJJ/gL72fZGYEaGcnTvnwS6/dJ1XDWrsTQI1gZ0wBWxVyuKxagNfWRuEzGr/OmahJx/+pznYJ9ApGJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxwjZSkr44qqMwb5GXcxyjq5pI469706Xro/D1T00UweuYyzcsE
	uQ1aiGsf4w7YSJrNL+IpqBUEs/QTAQ026LwiyybjGMn8tLBZjvu2NrrC
X-Gm-Gg: AfdE7ck+XznVJP9P5/whiHddflA+6Lfuvc6myyreCCcFgjaHo5EeoZLR2JPEOcejJGB
	mblC6Q04rAc0zyJeKlKjsGFlVMPwrl2+xNvBRnHS8BZ9kO378IRPxW4oBr/MJokG7nLvkXIApOL
	MNePcKNzBf1v41yqpFwR/FTVsILZyqk7Bz9XVXbVs4sXovrnksopUuFFlmlXXobaiQyxfq9K+o4
	zR6yQQALv4PCyxMirlAHTFE06HIc5YIucF0wDo0WRUjpm4qztxe3XeswwmdgM2YbyreX37kull9
	y02uv8c234anCeN6of60KdseCBFrYKdSGn36meFaOXRBiWhpkW7OzRbgsZD/7HE3nNkITZ9gG+R
	D0ePXtxWHxJgDpp5WCx9hqie/Yjkaa7g1VSCqfjyp/NYwSF8AsfmDD1aCtAwY0RL+3AiOl7hsgB
	DrvFgWwQ==
X-Received: by 2002:a05:600c:3112:b0:492:450c:57cf with SMTP id 5b1f17b1804b1-492450c5d26mr106314955e9.31.1781985659503;
        Sat, 20 Jun 2026 13:00:59 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:00:58 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Sat, 20 Jun 2026 21:56:47 +0200
Message-ID: <20260620200032.334192-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130101_645276_CA555DAE 
X-CRM114-Status: GOOD (  11.06  )
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
 .../bindings/mfd/mediatek,mt6397.yaml         | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..927df823d640 100644
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
@@ -663,3 +672,68 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
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


