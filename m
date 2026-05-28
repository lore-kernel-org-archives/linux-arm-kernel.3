Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF52CCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qXnXLkY1CCgVaXoTscYWjlLp5qZd4EXN61dC6lHCH8=; b=RpBjTbf9MOa84niSxtXn6qmCs3
	KqLc7UWEsRgDMl4HUA9ETiVS12ov2lypHfRQPSuM9gOzzirijHO8vLIQaWspDMtsnjxImicogX6R3
	2CATV2tt0KqVO1xgZX249HEdnQxN+3rVhWeKzrrhA7dNkODVH5c5PWLac+yO+qQdgC4OAx8pbbHL8
	KyZC8ADnUsyHXXNYjp5f/iFV7kripeGsopuAoVnTWzj7sXljPbYydK8AZV4XracfjMXOJJLv6Hn19
	BKHolUrc/SFzkB0sNXLzWVcH9acZf3sk2idDdIt6GiwxQ719LZQ+L3Dpad/oIO7NqewOfJgTz0/HW
	qEwCXPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqr-000000068D6-2VdF;
	Thu, 28 May 2026 17:49:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeql-0000000688b-3z6s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:48:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49048e043e5so53701065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 10:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990534; x=1780595334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qXnXLkY1CCgVaXoTscYWjlLp5qZd4EXN61dC6lHCH8=;
        b=FTGDCzQU9XG2BYhEWtz/XIXeZs6xgcqt+gb7FRp0cAGMH7AF4dQemii4reoSh9x9R1
         +rVLGNDa4RidEuC/vgA3bRs3bL0kmJhOZsaPaw1FujlALWgzFrDnnYKCTl8piYdoOdsZ
         fNus+N15+DtSg9brHfT7qawvxiHh2Cv7r30390NqqdJBV87PbY+80su2Yh/71Q2NV6x6
         x7yg+94NPoGfIhT6HH7E0k+Lm0fkt5Dyc7ls1BkFgQltR7RNuODkx+9epCKUYHtun37p
         kMiMVzpjWLiJE+4i7CdAUQnvhIHRH3tki6ZCbS2CIaZ35//7R53xejw6AnxXrUTb77dV
         v8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990534; x=1780595334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qXnXLkY1CCgVaXoTscYWjlLp5qZd4EXN61dC6lHCH8=;
        b=d5QczdaqGhDzEcsXDr9d93w8tSArBFk6WrRCPFqQbm72HKhNPpPEMmk3ZOGSN7K0te
         cnOkG9TcD5eUOu2RSesPDYMLOuwPmyWEZY6RO3rgidoa1culjhYOCa/sHvEh1oPU5W3I
         Hp+aNY9hYuHyD/KenkgNFZR5UeuQKsOCOaBCwV4mQgdX822qs/fg2U+crW+J0J4GFmTV
         tvIgQcs5yChq9TaVIoOp5/91T2mO/D1s1jHWg20SFU6fDoqzJMADZCsRxbwXY0TtLUhr
         ziC8pKTXlsWQnup0ApgN8OtE0zaUr8jv42IqgybpDeCfivmXjNmChi64KZbttTjq797x
         +Wyg==
X-Forwarded-Encrypted: i=1; AFNElJ+Wf/svee59gZqtq5OF587TLI1v6+CwF0+kvxSXDLgtQLExLh9/MAo4bKBLIKJGbBK7ZLEoQr5vtl+8efK2ymr7@lists.infradead.org
X-Gm-Message-State: AOJu0YwfFgwjPrpCkKG13pFIAiAkUb9BmCtzZMfSq0KgzEENw8jYHOMf
	QthN4Mruuvyt6qzjCPSlj8xvYK8RRFpv3cTAqHARswRiUbO1yNa6kzLA
X-Gm-Gg: Acq92OGtTahVfNCgNbHiCce2YOb4U1ekJi50w5uQSRx2V13UKmXpQ7XSQ5kvpkcUDwE
	qN2dle0elkdOt/oWk7lxR6QAPZllzKEPXYFNs3ABmQ+ciGM5o0m1w9BKDmGpZtEfYaU3NzdEBwp
	5T9z9nrWndiAZUAG/TUKIZ2wUh5SIpTHT1um3bwTv8Pvp034Rdycl0z/tL2hjvsWTFAzcFG4R6/
	/1Wsms6pHaFjxTySq2EzhI2o29/B7uTnoIKnwCpTGwxzio32I951YNcwGqXi6w2z/2+b3B0rXL7
	YGoe3EPcpxpH20MyGSI+RkuhiKLGxe/wBeNmBJ0kibB7DiWCOoQrbUUx8EV/LqpCYw4Xw9kQ0BD
	/EFwNzy4+79aw7LXU9nTPqNF3kT0oYNwadzAN2xkHepSMzpZMBmmE7m7NtKsHmNCQ0zsFM3OUf+
	5dtcai3PKkwOVbxRCV1YiiPLymjaCFlUcysqUL2ru6CzG2vv29cAvXpp+xjESh5zkivH94o3nfz
	I/RuWI=
X-Received: by 2002:a05:600c:b99:b0:490:4ebc:b80a with SMTP id 5b1f17b1804b1-4904ebcbac7mr432758575e9.11.1779990533962;
        Thu, 28 May 2026 10:48:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:53 -0700 (PDT)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Thu, 28 May 2026 19:48:30 +0200
Message-ID: <20260528174840.28644-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_104856_040672_144AD085 
X-CRM114-Status: GOOD (  14.90  )
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

Add YAML schema for Airoha AN7581 AFE with the specific WM8960 i2c Codec.

This gives example on how to define and connect the AFE driver with the
WM9860 for full functionality.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..b637c294657f
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
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+    additionalProperties: false
+
+  codec:
+    type: object
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+    additionalProperties: false
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
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


