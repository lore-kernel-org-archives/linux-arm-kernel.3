Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FB8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=; b=OGpLU35nHgqxKQsY2y9u+M8l+O
	3gtPRjlHbKmxNxbFC6CfOupxnGkw+kI2XDl/AvkWxWaJu9ZKwMf86JvS47TFzZr1wJKsNV6f9LzR9
	+RUWWo5Lv/qbg/z+S26zbX9WrZFn9vTbZL6vm5fVqaxjwnQqKw1CAOJq4wrSayCM7kgFBtS0cd7gU
	0J8dp3OvNXWLk19trG7SrO5kwPGFct0okofgDy8ogk/Ei+fcuT5TJiIuSCaLZvM+4c2ZBxNJqhCJv
	UdnWaiALS6L/RAIlmWIkldDcXJRB1nIlZ/rvJxI9/czkAHtfuY45ELLO+uDA5ygKipFXozX5r6gBc
	G+9OYLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDsL-000000043yW-0pql;
	Thu, 02 Jul 2026 09:38:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDsH-000000043vj-3kxa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:38:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so13960555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985104; x=1783589904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=Po862T348vpD0AUospCmrUeNbsBj2ueDd/bYh6SOeGvtGuAlISoJodAqnnw3cmhVdK
         VuWdBvcGiGvG+9si1l8tKyzxxQlM8NQny3SnOXzqaS0ggvDIXdgvg8G5V/d2RzJgeWQB
         ouIrM4FwDp4WCAioa4jSSQnJXa9jwFsri1dJkA1k0PoVW9Sna4T8k7BKMpIRMDeOzAHb
         7e/jB/VP1rXym/rpycNRomKDdIdPlTV2SmS1+hm0s18dH7SQpHMcz8pP1F/mST3POx1G
         t1r4TtvUaI06PscofYkAQpSJDIHbtc7aoreSfW5BintNcAxAcFcTL7ArND3oIrA3G/rh
         epew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985104; x=1783589904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=d4Zj4tDls8EXuK8tdLPLuiTk2zfcfmG6j4UnqlFQ1tKs+ECT2ejLTpLBqknVud6Ndt
         5HRnO0LnyP/msaBWw3h6YROmcl7TsuhZeR34bxLe0rMSjyPQd7X+3eehYtJnPS3sKhF2
         P8hPf+Yq0XPB0UEeLr0zVMw27N9cPQy53tjOR/wPS3i2cOvfeooWmTf8apxHnZPNnisI
         rt/li2xVqDmPQ0Aaq7sZdNsgHDG/HYfozZkCt4w82V0R2+8hKr6g05dSAWf4wHr42MYt
         ME1jBpfScEr6uaW5OqjudIJozcmQlM4BLxpaXcaARNxTzvEObkd7oq1k7hxCO2MJQrJF
         V7oA==
X-Forwarded-Encrypted: i=1; AFNElJ9fhQckMKHvsC0EGqfI9ofKxOqogiWSGQcm9Lutx+qhklYAiKA1BO92/FgtKsouPEnsQJCokSQNm0QQqDZEO756@lists.infradead.org
X-Gm-Message-State: AOJu0YwgXtfQGtm6dkslfgSdvpHT1+tsZdFM7t3sgtriuH0Ffx9vj6jk
	WElSirMmHh6a0BRB2YotDoZkeQfIBj6bWBz3aiLk5fXbx/TS4jGfD4UW
X-Gm-Gg: AfdE7cmDMukLYtKIfIb8N+16xbZ4PHwPQoO1VkAuhyfbqMb0jhWWTun2/PlTQEsA5/q
	fOpdEqZnb1/2iVgT7oqGTxUQcVeTGvDq+QiU4p3h08DFkwCWW15aU7VatjtwLKwF9UX+sVxMu+o
	tA6sMvRQzmqlfeRFJ/TDP6fNUz7uU8LrbopA2W6XayC9AkBG2n5B2z7QcnAQPUii5kYt9CKM9J7
	4Ka1QnCSIvygyzpC0y6fzn3AyE8nAf9KchVm1bvTS6214OFWkW977/zwYiIr0XiqWQ5h2oiwEb5
	L5K9r7b+1dLl4ixGLr2a2m7al9ZtrrFSJdEGrhCXHmADpEyPRysGfpVwHpkNrAkK+YwQzTLKSHW
	Rm8RvyPrtVENSsxNcPVLuHWNHUF5jycFo/2eM0g94A4JeHt16efKrjd0sB8AubeB0bebh9GVBYC
	wqjAbDWNKTS/Oi7FHGmaklXKy/gldpL1TACMO1yixE2bV5QwG8H7Inhb6f3DHpMm1pS+DZiITK2
	TKcMQ==
X-Received: by 2002:a05:600c:828d:b0:493:bf86:85c5 with SMTP id 5b1f17b1804b1-493c3df3495mr61803955e9.36.1782985104016;
        Thu, 02 Jul 2026 02:38:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm35502285e9.10.2026.07.02.02.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:38:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/5] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Thu,  2 Jul 2026 11:38:06 +0200
Message-ID: <20260702093812.15918-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702093812.15918-1-ansuelsmth@gmail.com>
References: <20260702093812.15918-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_023825_964633_CB49E800 
X-CRM114-Status: GOOD (  15.46  )
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

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

- PCIe1 Serdes can support PCIe or Ethernet mode.
- PCIe2 Serdes can support PCIe or Ethernet mode.
- USB1 Serdes can support USB3 or HSGMII mode.
- USB2 Serdes can support USB3 or PCIe mode.

Add bindings to permit correct reference of the Serdes ports in DT.
Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml  |  9 +++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h              | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0


