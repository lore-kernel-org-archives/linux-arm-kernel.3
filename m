Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3C4CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=; b=1weH5K78W+QMyCVzCObD32EXmy
	lKD+AdvNRQOfbdNHheBRw5YY9kjfmkRni//tE3YV9KsSUHCl3xv34p8X2Qk3hVFR3GmR752is1b90
	j0Z4UN71yuL4tFVGi/u0jd8GAvXwzmAQTIeUXcTDuNmYY+c1qsaXQe2YWNkNInkkrQx98FstfySyq
	id8z76tM94kDiBGxVizBvgq62dKnaNAf8n4CLouMzYXTDYzHaN5QRo9CGScTXGGV8QZw82MoeaxSJ
	jM8XQnGH248x6/2uJHYrmuDEbuhQ/ITuvfYEV6JXJDbmuoI/vXJ6aWXtFp3II/GfVBFKF6JPUP/4e
	tL2bGq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8v-00000008r9u-1xZG;
	Sat, 30 May 2026 14:58:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8k-00000008qz6-2qpv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:58:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so1271840f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153097; x=1780757897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=RiEqzjHimz+wvx60mXadJ/kKHFOlJm+s6ykyHwvhDwMvPAFEI+FvEHYWrEqWf38Tez
         Sxe6+ttjIwonOmVOJtOr6ksPncIwBrr0xlAURzC0A2doJFe1N9olsaf2MPckbBgGgwN+
         qCu0fGiGumxVsZsZiik0+J4fxQQfiONtPeJsxkKw6nFD2czupX3S00nJeYs99J/SffJm
         qMYXUIfVSuIa2VpNGN+2rOaXa7TZ4CvqzPDkVv8OssLrfH95F0jaXZeeG+wXLjjUJret
         IG2I7/9bjwFtc7FUO2EhGZFtm3zgEi3KUJ2OJj0LKvaWT1g3P9rREOKFsALcYDvOp0ry
         zF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153097; x=1780757897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=paVUq7aTYmegs9MPumBYehC9lKLVVhLBIA6Jz7HWAIYNm42uSDg6PPrNuc2dcH9+h0
         2kwqigwQ/nKuE9238Fl5a750AJEMxKFNic4hyFdAcu+t0EYxTQ62AJC6HX8KDOeWCsi4
         3brv9DFg7zaxM8M0e3PlwkcC1LwT8jx7XXsWj5SmDMlbVzAci9RCxg5ifO6OLMTC5ieZ
         eQNB6+acuKY9DzaqaV/zROPy0hFE3v+E/dTjjgDj3C7aAv5G2hKd36yi+/Wuzpn/1wNW
         4N1uxpE/lcCJvtfjKB2jwZz3dxBjXaSF+Ifcc4jgzpworDLGhjd1EesakGQzapaRQvQw
         mqrw==
X-Forwarded-Encrypted: i=1; AFNElJ8RzX6AVTGX9PV0m6HTunDmtA7PMbv95BRLPMMqJsomcmpFmP8nOTSqKrVT12+BqY77PYqNw3iEUjZWJn8Dw0aT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuf9AMiKTXdHcSMfF4gG8IfxIxAp36pithbUF+PZ7itsDbKOB9
	3FvLWOaUetqmu37u/lE9T5TfBQ3cuo7ZG4o03s2b//YZ/nUjjOTenhiA
X-Gm-Gg: Acq92OE8+fe4yRs1+Vr80stDqjV8AAFHnVmvGHviTBz+FLITSVlGvPp/XHVZ912+Skl
	I0xMJLm1oPYoG2ll0l59zJGoZjUcGbD/hNxRr4k9elY46zGiL5bMO74VsA17MHmG56+7ERkK26K
	Bp03F5AEg8UnlVfDmP1229jbNNnUrum1xVT9y2yYp9jCdJYB7GBEn2kPeL6SLROTiG9JD2D6Ebg
	Y56TA3jNqtnrmHUqGcGVO18hEs9B60Kmjc0xkNm7gLMoBOKfVd9Le+4umwSmxSKLeUX7jIZDAs4
	4vQdWvUo6nNqGEw9OJF/+On01pobMwLfH8sogPFhGVGevqBVLGcrI/HhOj/X/tdl/ApQjuG56gg
	GYI7ruk963KHRxVINvJ0uhIyXmPluCu7o5DgwWVOEkHOMOXxepw29CL71ohUD+xJMa40FNugnN0
	7wH3gfC0BQq+h6HBHW47UC0IVjVCpbqiM=
X-Received: by 2002:a05:600c:c492:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-490a2901b25mr67467075e9.5.1780153096610;
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Sat, 30 May 2026 16:57:56 +0200
Message-ID: <20260530145800.1029920-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_075818_729809_6A66BD9E 
X-CRM114-Status: GOOD (  10.69  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 2124804c8863..1f65f0fd41bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
-- 
2.54.0


