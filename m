Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CC8CFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 23:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=; b=npiczaje27mFk0c5j0BtOIvSkt
	iE4MCvZFN4caSU0pXGygtriG4gCI0G1X3yejSfY5vUd6rAVzUtBMYItN1XEg8fdHP9DYt2yHK7zU5
	6yXrDfhZERV/O0tPh5jBzwBc3rGH26+wPvGw+PLkXwUq8G6sQsPXBKLnCaTk13d/L+sW8pqo6ENH5
	K4fJJtuW1fkitGlFLTCdB9fuS5InOJaUJdllyRknXHbd2AF3Q64l27XzDcvymvPC0zlVwN899RfUH
	9ddphnx0d7k687sc4vkXPuYJ4+jRwNckRyzcmZVExSIUnittkud+dyVlRi0OH0RVUI2OkTsxW3hoM
	CGUSx86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6J-00000007ZGx-41zk;
	Thu, 20 Nov 2025 23:30:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6E-00000007ZCg-1ZO4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 23:30:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-429c7869704so1233655f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 15:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681400; x=1764286200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=S9D+hu2aMjI3md+gi49cy8UrjtzHhBEKqDUwMDwTV/J9kgGUWkNE6Qqi80+QZHIU74
         COJsfKgWTt1o20xdkwvXKH+oxgfG4z/uuFC3RvDkegAIoE1XDdhBPVe0YGeIvzLLKpGj
         FAKcKqCYlvsfsgeaK2ZDNnK2HjaxJUEPN0mfsiiz6tty1JVfiRlmdZWczaiVCAt8rik3
         /nJqQTF+bmOT/yqLd3n/ilDgL/Jc772Q10pzIiLtsXqxBqR6vh+FGKl1OkzP6KkbzJ3c
         3MVUid5+7tv9o7NA0x89+Lb/KgCbhRdvV1lGP8266LdchOMIpthsg2u50/YSx4o5pUY6
         ACwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681400; x=1764286200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=kh12Gbtf6L1O/mGqzU71JMHuWxyV46OJ/BZem8p2s/57Ezu8RAhobRTzomL5OnzmF8
         bvbubT52ipqajqXoM4QbhSIk6xyyZtRO+O48ZUz9d0fj0eAX1TsoMn52CLo0Jo347n7f
         jrKfba3fZ5oOVRRf4Hyv47FNOZz1xr+Zr/4nDzSqXVL3wZTf15We1ZzjhacBdojhjL7f
         Z3NTHD/zcMppKwFRZaLfTkw7NgeqIyPoHsTCVbYQVrYMArPfYMzn0vRhQraM3turOURO
         xBKvP+07LzqlBP7xJFDcf9kzTncVisBAlvkxh88KYdfn5mv+tz8f1+BzPJz18HWPOQKh
         KhLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtc32T9Euc95iyW1ul59dQoWP/oF/o7N5FrRLYWTxH6mTIt/4240/MgUM38QHCO0wEj5cJzaIbBLyQFRlWjvv5@lists.infradead.org
X-Gm-Message-State: AOJu0YwIHjnREtiGm2SiguyBxoCGIjkdUkIvblcaTooojMPkLhgMQkFw
	gi+pGDqwstTUQpgwcxAGLwO9XSXail5rSY0oImbfkaYzE0n6CXrZ0D73
X-Gm-Gg: ASbGncu54ivrUdsy+tFnq6yTUtu8Sf3bKzmAunHCj5FihckhIi1yWrBf0/XMaLN73Gp
	8D9hUqc2V97Lo289ZaulLOJ1fED8lWxILyMJE+L+huho6FYcqm8wZXdJsK8dYKQT7bxqUpa8bHB
	jmWqGwFq/e+lPbx1dOKS/QHtRLschrA1D1ve6QFjGsq/rmcgmU/54E5yQbyv+UzzMYwrrfE5LeQ
	q1+eBrd3PAjJ/mapBq8QiB2JoOIDOTKNkSuRbri0raG6fOipv07bE+plEPcuNu9uzTk8QKvIkJI
	0WCBv1unEh5Kl0g6NQCflbKnm1mhk31gqwWqldaINQi/ONu2rwaPcLlApOFc/yqGyaCd3b1vKQb
	OpCdGxv37URxnVUeY7/o5YGOaMR1nzS5PZ9kxXqZB0/sXaJ3F+t7S6X7oZO32sz4Fm8UnE8TB3Y
	R6oelGs2M3lywprjJo6uDIF+vb1yKmjE6AjOsHsdhj
X-Google-Smtp-Source: AGHT+IFkcSWktgO2c9cw3ZmsJgiZ5al3O9HH0pDkGB4u/dkR0XIinpd++pYOt4jbYtH4OgfnVILTXw==
X-Received: by 2002:a05:6000:2284:b0:42b:41d3:daf9 with SMTP id ffacd0b85a97d-42cc1cd5d3emr109924f8f.2.1763681400373;
        Thu, 20 Nov 2025 15:30:00 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:30:00 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
Date: Fri, 21 Nov 2025 00:29:10 +0100
Message-ID: <20251120232913.32532-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120232913.32532-1-ansuelsmth@gmail.com>
References: <20251120232913.32532-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_153002_430232_6DEDB372 
X-CRM114-Status: GOOD (  13.97  )
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

Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.51.0


