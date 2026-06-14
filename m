Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0A7CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 04:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOnY6yEezyUxI5CBehQcqD9t37X66JniIBbQ/HB7HUs=; b=K1AnfDehml+oWkHzUds9gAYCcg
	nyq2u7kJ8yzYslCAT3RQL676q7dShCpzvOinWxXxjSjQ7eL1g7bDn+mV7vfV7W1ydpVdxj8W09I5s
	Mk9rPDlr8ahjdZyiuxoXqCURaZIP7wZW+OvB5d4wceTKEXkLs7EG+xXagxBO2S9f+73wzIaNZ2iKJ
	hK3gqJ6/7lGBYTpMr1lE+meuXYqTumUtJZ/gddBYW7O5/xud6izub7KuQnA2ZDlXQDk8cIlXVlopF
	RtY+BASQbqa/O5UVd6j9PaTAz6nMIWoOTnNyIJc4xazALbPrQuzW0B4tr27fq9o8yoFT0ZaV9MwCD
	OvdWuBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc24-0000000Ci5H-1ThV;
	Sun, 14 Jun 2026 04:01:12 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc20-0000000Ci2U-2eac
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 04:01:10 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c858961a8efso859192a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 21:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409668; x=1782014468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOnY6yEezyUxI5CBehQcqD9t37X66JniIBbQ/HB7HUs=;
        b=P0nhfsU0+lf6arQVQHZgUz8KynR9eI8XxrSFwGI3yLHd+vG3T94B4O0w/b5PR91Ved
         eI4iOwn51uviXt4OnfbTVqOJ+31pIEWN+dtJNEnRuwPZCLHrmQNYLqtVL0lgM8tx+Dsz
         F1RBSEepNlvav80i+2JdMvMECRgKA3T+jEi3fst71WHFr4UeyFCOSQnzjb1CXic24Ht3
         IyPLnIr0MVJRgcz7urs3a3vwgQa9UcyE3o/CD9YRQ6f5xGtD5m9oIK/Uu0UH6YtoO3oF
         vK6euVWBriAiNMVuxT821NsjqsgN/1AmZh0spyciZ3RnaIOVu8x4KPxVEm34xI1tDf0w
         CQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409668; x=1782014468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOnY6yEezyUxI5CBehQcqD9t37X66JniIBbQ/HB7HUs=;
        b=ECpX7HR1qqXxeVUZMvhrUI9qoAhP13H+4GIV7GNU4OV7BeSJ/LUtdxZvMPFhrN7XKF
         aH8vRlocrqrt91xLPQoa7h64yBDcrkBjRNJ5ii35HDE0UrjiEUMrVvG+7twzUl70+Q0K
         Fs1eU6EYsTYqqhvDDcKgRSxzDGKeW8AiMltrb+y80fldGIKlnx5Yr0KEzgu75LShHeuG
         fCOiG870ABX/hCRGcWAEMfQ+1fHx8OTjiyqmrW8pm/9powxVtPR55VZUCtKH83v+TuBl
         TCvYSR1TgYM80mi+3wUys/Kg8HkJOKwRmYuXWcbQIx3hAu8TKnQb7mcaFK8AmHxOPhmT
         wXqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VGPGgPHN+GKOrmmXENlIPe11kaksOTL20AZBt96IKgvU8JbNAvx1WA0sZ+P8+/lewtUYM09vk0YqTtSs+GzM0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc2e6J8HdONFEVi0u8xFNOgDKhtO56bh2C+qIeUdsx9Dimj8Rs
	swHkUC4snlsBA0X8VORw/9uP1s9Wr/x6Ov4E0j1ZHnNem8TbMkWKWLmw
X-Gm-Gg: Acq92OHCkHnsmeFUyFg2jXZsS4oh2VYAjqfrXnNFOWomz3reSZabQ8+bg+mCp2cprNz
	51V0965AcAKVGbwfFGjV3ksFX5xYOTFHyl911/pCAU02A+auxM0CMy73CFYvDAwOGC/wdt5qc8a
	gmnCO3T7Becc3qdX5QJjpcbSBor9t2Kh4XUkNS/U8l70ceIGPYGSobQQBtiUd1xngjBM7Z8zJBA
	+8dVTj6c6KQ/qNRPf3EHpxOHbXGmwDfWZH5lMM5XtbCFeMWLP2O/rIiQruQSsyf55R4wpATjd47
	TyE3ajAx9Igy6M+v372YAp9KMJvhJEAWdV6VH0qbjUR5MaqyD7uyBfU3bfOqblRu4QbgRWaZGPf
	56OgRxjlEOi57qK8ezfZ9bt0NRz5iYRUaKr/fbS1no3f0Llq24FoerZ1IBu3IHRKXmUBT9v9y8v
	kO+qrvVEZDYWnL69FSk1zrRB0sDGpcMA==
X-Received: by 2002:a05:6a20:728d:b0:398:b178:a53f with SMTP id adf61e73a8af0-3b784021a1amr10268367637.40.1781409667707;
        Sat, 13 Jun 2026 21:01:07 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:01:07 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 2/7] dt-bindings: net: airoha: add EN7581 SOE
Date: Sun, 14 Jun 2026 13:00:27 +0900
Message-ID: <20260614040032.1567994-3-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614040032.1567994-1-hurryman2212@gmail.com>
References: <20260614040032.1567994-1-hurryman2212@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_210108_683231_19BD1358 
X-CRM114-Status: GOOD (  15.69  )
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

Document the EN7581 Secure Offload Engine register window used by the Ethernet driver for ESP packet offload, and add the new binding to the Airoha Ethernet MAINTAINERS entry.

Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 .../bindings/net/airoha,en7581-soe.yaml       | 48 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
new file mode 100644
index 000000000000..24aecafecc70
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,en7581-soe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 Secure Offload Engine
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Secure Offload Engine provides inline ESP packet offload resources used
+  by the Airoha Ethernet controller.
+
+properties:
+  compatible:
+    const: airoha,en7581-soe
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
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      soe@1fbfa000 {
+        compatible = "airoha,en7581-soe";
+        reg = <0 0x1fbfa000 0 0x268>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..7c338e670572 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -757,6 +757,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+F:	Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
 F:	drivers/net/ethernet/airoha/
 
 AIROHA PCIE PHY DRIVER
-- 
2.53.0


