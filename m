Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CDFCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=; b=Ljjv2DZY+buJTj7grqj0tu4acC
	Pe2QJHn+CsFjeEbUFu7NgKjbTfUsmHBxFtbaxzTa2a4mI6jRjZc7+UapxZ9weeSDSg+yiaKBo0by5
	Ac+pT6XulE3HyZaptrZKg0fHUi0tftpjc1QzALtD28eQdtiMoWkvkJ9XA60ZtJPS7A2S0Tz4JfFXp
	wBRo0AVy1CID1AkoDXyiRVpUmfioRK0sIPyqHd3m+EollAMTO1noUt+h3s0yt5pn0PzX80het8Idb
	8eaB6+91uHdyKmU2QbbdXaLdsWMNWjY28lRzltK0WZHSt8+e+xm6JlXCo5LSSrqxYP2cgOL1nkl9D
	+ZATF6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqr-000000068CZ-1W42;
	Thu, 28 May 2026 17:49:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqk-0000000687S-11ti
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:48:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso40881185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990532; x=1780595332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=;
        b=MPfGdbNLUoJWkxXWI1PxZSooV7WUfljriMzmK0G/bIt4x2RTWB6FGAP7cJAwc1K2hH
         8PchDOzPGz2sE6kQteRObQ6m8NBOTNZlMUaLvYpq1YKnfQGMW3DVSwFacugpexBn6fME
         coJFPapryh8XEVOjfupgr6NgZx4/JickPGUplrilypJIKWwwFsnhuNpEsN5GmP0NNaK/
         K2KwjBXG8qX8nyqmg0vA2ODZgoESJUkyr+4uqKwZcyUgZNWA0OPdUVAWisi0UM8nnXPV
         GKiBWSgPZ1fxm/11Hm/HjYcIF9UIJelWq07wQlLfY4nWhzAeF0kHzqDfpbAfcvLNO+kL
         k0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990532; x=1780595332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=;
        b=YFGKKMmYH2yVzMcRBPeW0oQG3UGevxISaJQlbXqW5AXmVCuBnY61OTBxpHa4YB0Gp2
         pqV0v+pZyKWwpccHiXlIJNOn0xKQdcl7CxIVB4KyPePuv/coVfrTbBJGq5ejJV0Jfc7X
         jkGVrkk36Jd48zgF+rQu9dGpUjcCfiu86pqk/0EAs8dLkEwlA+DSut6wL165P4A9wWoO
         H3Qkg59p4cicJR2c86b3gt6AbhnkUTaostQ76KKJ5opGwrC+TfiWqyTnoc6oIaGKmZKO
         81saZF+IAhVN9JBD5lcshI47ARarmjfnTP3VSTllQ8mxKO9EIJDiia1r3UsJrq0I9yko
         PN4A==
X-Forwarded-Encrypted: i=1; AFNElJ/+um/5DOxuFvHF6pIXSYHr6REg8goxP7bDT4CWnIwQApvbRnEc+pkHMIHHBjskO5S9xuB7NqB3dJx6NOSYaqif@lists.infradead.org
X-Gm-Message-State: AOJu0YwHLYPFMq+vT3pVcY1RbzrKPJMiKon0aX488z5m1eayPGkbnO63
	EeZvTwhm81+7zsmXv37O3fSLxRqkYqRLMJozSG7s9NZSNSMDuJSjTkf9
X-Gm-Gg: Acq92OF4ziieUgG6c9chWN4+Fx0CZyA1Lgdz6qccZNkkEbcmngQfAJFGAS9e4Sry0cw
	66bO/WTKn7GN7SbcFqglFVbMlA2t0dDUrSv/Cv883dkArFU6DaWBNnSSTz2+dPb3gJDij4k1I40
	trcVoHa2cR8mFhZSicEMs+8L6jaiyu59F6yzW+3NR2JA01C7AsFIHFBhDZHztoDNRZpiUgsPvxu
	hfaqvwseTvLKNYI+oN4DRFLhhVdIT0ag7cJqWRAjPLj2A4O58j4jUvxi0enho+CUbxKzoCSV+Xt
	DhMk4J6GT9zykPyBfvTJLIv2BnqI96fYlIB1dnIBrDIEds7TFkKEhx4bm+MdFa+wduzOeHln2xh
	I/dQTCmQD/E6v3WWi0wE/WrprsmKPUELoUkbNVPVKbQvtYkx0xXC8TuiQWQBL++fPXGNPW66me7
	ZH2M1QeyuXU9sY65KQolelH6fnRwPt4Z2sB1HI0B18+so0INrO/XV8ovhNq0JDsVbDRD5H/83Ue
	Bflu14=
X-Received: by 2002:a05:600c:4fc1:b0:490:7227:100 with SMTP id 5b1f17b1804b1-49072aa14b3mr221993685e9.18.1779990532172;
        Thu, 28 May 2026 10:48:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:51 -0700 (PDT)
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
Subject: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card.
Date: Thu, 28 May 2026 19:48:29 +0200
Message-ID: <20260528174840.28644-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_104854_297370_B7317752 
X-CRM114-Status: GOOD (  13.87  )
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

Add YAML schema for Airoha AN7581 AFE SoC sound card.

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
2.53.0


