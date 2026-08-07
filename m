Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B6FC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=; b=hkP4yJyR/a0XEiRZG5cA6Sj+px
	IFGTtHQlv+e4DVbONobzI4pbjCzNwb9SlZhrbuiN/VicejTTysLT2TLVIMZ+jYwpgw5XBMOcYxRQC
	+IP4FNvyAPoWSYwwdE9DaxDmLCENADSD1hYhYLGzlq8wToKPhtjSzO4/v7S2nR1rOENa5UTE6TKeN
	NV/E2c+kTYbvLY1M1Vlg08jtgBm2Qmc0adle5oOcufyDG7RfnhnkiQVl1dkcBq5jOuuUqPZr0Cfx7
	8UQxT9i31dpMBzdMyesstZY2d/K6Ml7fjjfo6Q0jhkBT365rvC9ghJvaaw4eh7sP1Aq2uvcVIclP0
	oCpMe2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQtA-00000008hNr-1FzQ;
	Fri, 07 Aug 2026 20:09:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt4-00000008hHi-106Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 20:09:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4980dc26022so37692335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133388; x=1786738188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=duhbJavEZKCSp0NjaNOXMuNu5N4YGq/klgZVD+ljjIeSBC1bffF9czUcV/DV8Q1qpR
         y2EAoeJn6IDPEUtXjmLUmrW1mW3U/ZIVUYICAz3/kWhAD8wb0DxQ6iTQbu8Vri6Lpc6F
         tNqsqKQMeJtZvfE4DL1NDgl3Kub3NRroGXuwtDVcky+whaF+AdWDGv4O7Dvv67q1vGBc
         43G6PxIBLm+1YFM4ZH16QdtHx7ziHdkIa0tNj0PpKXTc/wwj6B6WxrYu2LMkL6xeIiWe
         xlHyrIM/X2eRksg8sQ4NMnN69DHwYHN2HPpZq8bm1PyRO+6ZX5y+wSup/m7AC9IXCa7w
         Aw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133388; x=1786738188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=GpI3yV+uJivmQQYsn4cwN7PrtywDdNeKPB9bF4iod+lOpzOxcVuVD5dT4Ht/NyJm86
         zQqw+/AZRypJAwrhi2N8lNO142kSZzKgS4Ti+8mi+ifSp6+Sbx77O0jh1PXowXjS7Is+
         zSsNoiW2YJfD7OSlfSONpFlBmhiN6d6Q/j7fDYwD8TOrw10jyWGWG8qAc8Ibks3jX6a7
         FPnYvKw4g1LAY3CpEZfVAgBg5ZnAsgNG8WMCztRXQ8KNdyei6zZrKqnT1WW4k1qcmT4M
         /MMf4xfdAglFujc6k70OTsk11iyFrBZzGA5eW1ZXlRuZtyoj0jKEPqwrph+nybD7ieWk
         asEA==
X-Forwarded-Encrypted: i=1; AHgh+RquvAP4Jg+/rriOCLKsBAYlSN5z+8vbYKEsddhDvVaZsyi1zMh3MALXFaSv02ypdHEG8qcC3GoaHv8hBIO9C7mx@lists.infradead.org
X-Gm-Message-State: AOJu0YwHWd7I7Mrwd7MD6x8LDa3w8svBRCJkNW9oLiIc8A8D5kEVvwct
	SXfk6DjlsSY+hw9YiLwCyMaNHK776c91oLNVmTiso+BaGAT0VOZf8YIg
X-Gm-Gg: AR+sD10WwhadSBJ8CfJq+z+ww5n7jxXESsBT2T8ccRRqVW1nOAKcwhLzEJKNNY1KQJX
	LKkZGJjccLGd9dSCDuyhe9wjoLXV1sWSh0SDkILlfeT9HIGUn2gHsEjxQL4y5tnlEFv56kMmGc4
	QxaavStvW9CEO55P/44GqNtbWKOzJAK6PBVApz9FygBFqlfqVYhkPovwjKQ5YjYUuQAAF5Qtqef
	fduPKICfmXjp5jESgouhWIWFz1Te/GBvwAftPwomVxmNBvTj5NuxgE72t1FCMcFKTUo65fHb5c/
	SywSEoxaKVCaAvBKF+U+KWU16cLXpPTlTnxVnJ39B436KA9Sy/+kgWzafbp2baNpSA+pEsW6/yl
	cY6DSAT57zrclXRvA+1WzK3QJ2CAYpZ1Onf4ev06et3ydUlSvAKO+aEA66zP865BMksjTJSlv1u
	jBQF3Qx2KelqmFdhyYurU9jZqXjkBy3qo0CAh9V9lGeHGl7nD6QTYc/401RdmByJW7XlaYkWRQL
	Cv+jX69Xkjaq3YNqyQVEDbq+jSU/PLIzagLH054NxfU5iJTDkKh3A==
X-Received: by 2002:a05:600c:1f8c:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4994e7a820dmr312951345e9.7.1786133388229;
        Fri, 07 Aug 2026 13:09:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:47 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Fri,  7 Aug 2026 22:09:32 +0200
Message-ID: <20260807200936.201827-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_130950_287185_3687E03E 
X-CRM114-Status: GOOD (  13.79  )
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

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


