Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C118F3D61E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=; b=SjsYYiohh4UiRO+dWUpix8Be20
	4hHFxFUoLzgg9gunabCn39FahQiucDy2yQ0jx3zwnOCuP7rn04AjQYMjIoi6nTrJNWzf9w+G6d6Zb
	2CThuq8yKmeNtYLK3gxXToWpzFgP8d2KLCMEQo6xy2v2E66cdymM4hQGFNFYHnRpiKmU+BeRgy3tf
	ZS+hiw6vfGi22eiIPhjUbKNpH0/fzqsnKVj+LXyLBqOKb9H2WJRacU9mG4pq9Tnpj4GVuhxMFAxG6
	Fo1NkpG7qTQ7B4uTwx8+tj/Z748tpv4nld9X9ad/5dOWhELf0fc0Em44OrvPWrrKot9zbXTX7qlHC
	aNG0f8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785O-0000000ArgX-09pJ;
	Mon, 30 Mar 2026 08:35:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785L-0000000ArfJ-2bMq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so40955505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859698; x=1775464498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=r/NponBHieddWtorA+L1DSAvt+TbzH+ovnbQcoFi+kjUy2vVuJrJnEYL4mqFA/AuTb
         tiSk2ZOtHHm8Qbr+EG+BGVXA/FTTSu7/VyTZ+K5plq2J5MKgiQBdxrveaSQSxi/rqVVX
         sT21gROthhEnDHMrkOcGgtWE64oqD5PbVdr1U+VlgFs94ZZIpJzCetFv4CCtLkQIwRwO
         69XBpW4OLvcAVVUCEmE6UYYh6QH9X2gN4vLwz8Q46vFvZJYOsvwgBVIL9Kf3IaBh4KLe
         s7AkuvivN6BE2F1iaVG/ruDu+NP9R1/DbIqpeQJbziiw/tw9eRmjk+oXFcBprZ1Utebn
         VrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859698; x=1775464498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=TY/z+2cj0dZqN7Oz8H1VLuMLWBVpYC9aAzKIi6cewU9o+Pl7mPd/1IuJNKh5uIGgwI
         vpVk91sud2bLatEBBmwItMGffeX/vgv2CARpv5gVUFeWJ1syXHKGjdY3nxOPIJ0YoZo2
         UVBUsT8c7lVUBmWy/Vnm7HFRY20JZiV1ii4Q+TrnYxitnl7O2Nev56l7aG738FVhVkrP
         FLiTKFkg9EPZiaCk8beMI3ODHthggGvv/lrqShejtHa1vlgSlHSkEVglj8NW87dqEXoq
         L/39By8kKFSn9gJkx+VB7fbZC3CgAArIDeGLF0P/KQdRtl4mtr0/wgOm5wjTj1KHoNJ/
         uu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK1NKpHSn8Afk2SLPFzZdsGBNN3pywAvbaFwLQ4+ImgwDCkKnv7/dh2Ky3gIc5bUWZYrqEr3Gl8Qzy8fJP1KVu@lists.infradead.org
X-Gm-Message-State: AOJu0Yypuz8AItBdPc7cjEzDdq8Nhw7BQK8eiEJe88rsQxmEaATwB68c
	M4jFbHEAxtGM1zEiS48+1uNV2lIpU77Tx/IZq3GCgyYENUZajkilV9sO
X-Gm-Gg: ATEYQzzcEQP24jfOCMSEiWxwz8PZCYeTTjZBSivTr4IyP+3uUDJkJ9DhRKo2hijBcjq
	D8kaaP06NwVU0b1tw+HSKelUPlb+7qfHKJMuJRndmiHm+zoTfkkpq/+UMy7ZC1qMS50zL8dJS61
	TfmG5UiQVZ7ChX0Rj0JP/2Q7kpGt8GFP0HFSvTNDa0XtkkMcolJ7NtHTpr52qqDSkMzyUulu0ux
	RrwQbTP/U56wlsI3HPIh44H9fCWJILKk2YWZrz3eCiJ55frbQpKHg05AFQ4S2ptG7oo9f8scG3D
	feUm9ohPrDOYdh1rdEcTPyBAGsIUdqWU3uzcYWfYlC0BgVGG/hEFuzW5J7wnfQNnK4hKbGsmiGF
	dCcDiemEzE0zTGsgj+V8I/KGxAAzdnPMe4Jc0e8LbS2xd3N4zMTbQbEgZV28dq2RkX1Xck9cyma
	rLyS2A9JgYAcamagX+7r8/2AczfkTDPg==
X-Received: by 2002:a05:600c:a30f:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-48727c81e54mr170906055e9.0.1774859697668;
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 30 Mar 2026 09:29:35 +0100
Message-ID: <20260330083429.359819-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013459_678509_E1FC9C91 
X-CRM114-Status: GOOD (  11.36  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC. Remove the
required constraint for the regulators node compatible property to fix a
dtbs_check error.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..bfad018cfbf3 100644
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
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -99,9 +107,6 @@ properties:
                   - mediatek,mt6366-regulator
               - const: mediatek,mt6358-regulator
 
-    required:
-      - compatible
-
   adc:
     type: object
     $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
-- 
2.43.0


