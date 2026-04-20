Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781E4F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=; b=MGoBBxB9+MXht5Fr0T+5btV+/H
	tdzrKCvMvELvf22EMptQXt9TsZcH7WbRQ237xwuZUUGw87g6ZCB6mjlHUrsJCVlXtfBW/oDepo3Ab
	/zs4UN7UVIJPLB7/G6wbkYlwfEpfXu52HYl4rtyos0L5YAKF2MsZ8wJSoDreeGNngtLbxsDr/lLNd
	rbN8EQoSQCCnqHvAsorNKMkDDUnmb2x7bnGqK1aXgwejEUnpC1o9rAq7YKfjjtfzH22gl4pR4i8SD
	MHsGTz6SMpr+k92oBGDc6a/RYW2Odt15r9AjygIi/Nxkac7imJzTGDc+7rSKUvBHO2I6t+Ig66CbG
	gyPa8Hvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIG-00000007jiF-1jDz;
	Mon, 20 Apr 2026 21:36:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIE-00000007jhX-0mCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:36:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so31265085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720992; x=1777325792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=;
        b=dlgQG9P6JEy8ks+Bbh2zXCnzV9wPvD61dQ58N0Cs983XeAeiSg+FNMG/yeSrrPAK+7
         eTsZeXaGaXHddcM0/tSCkfODn3bY5ffNv2pdnPo4JmVVhTfjp/ZudXMEBoMhc0UJMe3Z
         IN3eNo490FStOv+0gSgNcyQVYPxcmpEafSHO/9EKik553kkLz+zuPqH0IvSUWVEruGr8
         78hysJyTGXdUxTZIRurZw7/g7CfUCux5/76hhN0s5iT3XYJVYUzkCeVmc1xt6OzFHuq8
         A8k668rXRTtNzkLoKTmzVT+uuyu29LfQxiGc59ht+99eCPkfF1kAG0oU4Ft9KNuCowpt
         TgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720992; x=1777325792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=;
        b=PPqQpvR14/lj7JBsazEEmlKsZDBXC5BAk9CHeJXo4yHHh88HLWG/PyvuucmZt2Gj59
         lFz9x1iu4F28JsFeP1s5lZl0Cwn8rq578QGm6zoeSn75P5KklpxIwpULCXOY2qj1V9um
         YSHg67OY6yHvsagmMhdfAphzkMnknEZsoBykA0GBlGMf6N+JR0aofx0o4t2i2yvn1rYp
         eVUcZxISc8Xj+sstKwpYnWOXKy0sTrFabrplou+omv+AYHwoX9k/vHgEtn5Z7GC/rUAk
         ZSrO0Q8+h8XFv+EqpJrx0DJj6lo04czev2aOBxJ+YGGMGpdtpz1QZn9KJ+wleC6dGLI5
         U3MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fDwQ2nVfEY6TPGxTNAw9bCgaiArtjLG/0AI8VEhei66FdboS98KW55WUTxsAnxZo9t5EvZpvYJ2lyQxUM1vyP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95po10q1SncVW1DiPdHieStlNJm4JsxQCkTgclAGjoqBfF/X2
	/h0KBhnHVO9bBajrQ4MXZF0YcJwJuzyBt5YHT/Ml8JGN8EN/ZK02KhT1
X-Gm-Gg: AeBDievj7kZe8KLzyIyMfwVCSviW/4Rv1vZEf3dK/n4FjH4fK1SO6WlCEIb9ccFWk+F
	qAEpwN8ssji3HEAVSNfPWioRtAcBQH5lS75sYmz8I5Sj2DVxwIN4Gkb5tjMxE370S8r4NyRjTMR
	nua3h1qD+yb+ibMkV1xVvTmeZhfOswQ6GcLRNBiIz8ydk3UgntH9ZQVhVxcolvK1bKFXvUm1krs
	okKuLc08LquCD4bv1jd45PimNEv8ZUGeK9hfK4I3xw3qo9QD0B5rH+DhIljLWxD0A6b4vEDVNyj
	LKZibt+SOkGattM6pKxfx1EjgtrjRiCN3PSzHXq/ANA9L4m9WIKDYcN6aX7tmMw8t6TT4zxPnVv
	jgrEOo6oxeZE8f0+o4cCCwoiibiO9q625RQUF3+8SkOV0CbbRdWICq2rKeW0r3BvzZih65FBXvU
	PZpF21Y7c3O7sjfN7G/iFGUZAnnCv/ZA==
X-Received: by 2002:a05:600c:1907:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-489201cdf13mr58952175e9.12.1776720992169;
        Mon, 20 Apr 2026 14:36:32 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:31 -0700 (PDT)
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
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 20 Apr 2026 22:30:00 +0100
Message-ID: <20260420213529.1645560-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_143634_242644_65FBA8BB 
X-CRM114-Status: GOOD (  12.49  )
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

Add the currently supported bindings for the MT6392 PMIC. Its MFD driver
does not use the compatible property to bind the regulator driver, so
don't mark it as required.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..2866e95e338b 100644
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
@@ -231,6 +236,22 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6392
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/mediatek,mt6392-regulator.yaml
+    else:
+      properties:
+        regulators:
+          required:
+            - compatible
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.43.0


