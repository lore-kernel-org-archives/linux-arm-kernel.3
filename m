Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF07C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=; b=ILI5sYsJKQLITNmqfWO0K04It5
	7rDF4KGvTC9f/rK5DACAX2hQY7BjvuacoHbRSSqtN+FUE86P2AS2qcluBj/IvcM0C4U7+MaPXCZUY
	MPe0f76vTVU4jo4S3lWcWQCJUT5ZoAl1e4zLZc3sdaxZlKssfcThfa3LMgkOv/jneQamTuse1BRJQ
	iTfPPsP337blim0E2qWBjAjsXiV3Ko6VC9utC+9y7hwnWGbCJ7cJjNvkH23jqsDTzW+P7qyHqvU8L
	67PUVug9PVvnGcQCJGd7LBBMo0kxjUpxgjAtOfnkz+ltvKuZMCsoa9wH7XBKFf7HaD4AMz+ofbLdm
	g7XYlCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgyP-0000000Bu0U-2C5y;
	Fri, 31 Jul 2026 06:44:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy9-0000000BtsJ-0aOl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:43:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso337794f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480223; x=1786085023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=;
        b=hF3Jtqbm1ipJG/qKQ4shAOnIK7E+ImOWv0LNvbPHYkp9vrXnLeLhm59b8D9qHfVNV4
         1vFxobZMZWGEmI93TAqGSPnrtyE8DKaxNuwqDxoHMebFpqLmlNYF1VFd7EWSCZVryd1e
         gY4X0RIzIyS7ovqbWc6W4DKJUBD5sWOBIHGJa++fXoN+xtRzW/hFOkvXR2IryXkuLDw0
         rF9jVS+wkdflui2BF/B38rt1TS0k+E2IMj8lL0DQDMkoWyv1Lu+ZzoMrRAIkYt9s6jRX
         JFxY+qIQuBKClsp78TNZp94m9I+wdi4uEE/lXa5lcNIW/X/F+8w+ty26OYx35Tmb/GHE
         sCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480223; x=1786085023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=;
        b=Nc3XypKMAx7nqOerZw7kEFS0QBejeSxf9dKlwsDjkaLUUmUTQlCWGSbhthvCUkY/JZ
         IS5ybIljBksdww5pbBBjJLt0XEJ4wI54cJVQMSb5rDBU9oorrfmfQYOzJUhk6+IxDe5o
         9Ts53dgkpMCelNgMo1dscv4loPmA1I1CG/dDaidAgzz98AuR00bEj65bPUelSv9zvKML
         QaxZDyRRZSo1gMFDlT+bLxRTVjuki6SOXyHGV6a6xXSHsrQEYvKbk7Nxjd8Opapk7Cxr
         ZN9g/XyPDP78fvvNZLsDghm/oaYMsbWxiHyZrYjkSiLEBbg8Sj/Ir82gnE7jYTQQDzWJ
         GEbg==
X-Forwarded-Encrypted: i=1; AHgh+RrhLdhWhiR5ka4GQSuzZrny4aLARBQyIQng1Rlg1Ar0PikleisT0+QcQdK7Ds9oYu2mtBJprNbmH4yDI+8bBr0J@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrj0zG5ZCZF7w3VIirZnGC79Gk/VoEYScTZS7A8i76/GGAXNIm
	6fntRlCtKqWKAcDlqIo/zg3Jvo3A4WXsZ1Q+CQmZVRGZ1uCZKZLFAo+b
X-Gm-Gg: AR+sD13rZF9bU+Y6ZOPDAYIg/QG0s1ig/+6dbjzcmX2Je/1jOfAKlbX8luIG4BlvqJ3
	L2Q79ktQhC0HUlKJ4OwiHxvKIU3ytb7e5EOqnS3AYoBdQ9B7eFbmIrkLhqXqLKt9h9ocpObkpO/
	dYwy6dJnZdGn5fw61Q+LnF0ilH9xTE0xnahf37snUNPQrvJUzEEg/4/JCZdYRfyrvlOOZO+l1w1
	BV8csvicoizIbtiCZxvzlCeK2N6fFoPZe3ucLsRiWTKUu80ybX8fCsp7Z/Ha21pXwGbIz0koUE6
	z2zt0ay8/VSDNgctdOC9tcKxqIA8vsJ2PCdvW+1FX7xNlPZbprE5Bj7B0meQV3U9cbupV4IwBNb
	KvNQabnXoRYGFmNtLiw8HO8bPtJM5gOSiIFwt/kHoF+u7ZWusRxOiCTqIOvYa7C9OWKfo/mxwv+
	l45klfzPntr/R6oVLXS+y9KgaH/kPgt0ybA7hdIgbti0+43OMq20ioHVNvP2b9sOcaeZpf6BtJb
	FE8Or9HvPQWuTz2qB42ykck/VWvM87/PxovMvjedL5LMQeXgN42cA==
X-Received: by 2002:a5d:5f48:0:b0:47f:93d8:f4c6 with SMTP id ffacd0b85a97d-47fd2b716dbmr1962060f8f.59.1785480223099;
        Thu, 30 Jul 2026 23:43:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Fri, 31 Jul 2026 08:43:22 +0200
Message-ID: <20260731064326.2284228-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234345_212198_68BE193A 
X-CRM114-Status: GOOD (  14.92  )
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

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960 i2c Codec
and AFE as platform driver.

This gives example on how to define and connect the AFE driver with the
WM8960 for full functionality.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0


