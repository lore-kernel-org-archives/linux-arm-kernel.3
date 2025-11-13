Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C96DCD6E47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHc/PonSybcJaZ8bsEyitMoRoLAiEIduH6hrYn+egnA=; b=SLdzr/89MyoXbKuHKJ5NfVs/DK
	m4ZVuzr9VxvgBsGKd+ue+JtIVe0pqCKZ/O2EoyIQpYAB90KEMsGccsUIXnoc+/BHdsdUBNvDrlx7X
	k0naK2oHeymsYwkxh2Gu8tn1+jXkXWmnB41iKQ1Kp/7JzqieMi8+55WPh1meTE6kud1Ga+XjZWHaS
	ORqFDQ9LRl22JB0nT+oKpQX0RqQrNE5kJ6qp/1vvOX/py2/sj2YoTfunaeAxHlDGatsmjH0yX/vc+
	x1fbyZlRgjPINJdGJxBoxrrn1A7m1a7bjDkHPUOf1vDUqea7bN3/ZKrJGNn7NyeC9GpEcG47a9B9t
	FrlXooxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLm-0000000ARi5-2e2o;
	Thu, 13 Nov 2025 12:22:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLb-0000000ARZN-1Z52;
	Thu, 13 Nov 2025 12:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036560;
	bh=xJZtDnfK8GMEfZFtF4HpAbyGTAoHHKqHXm4cdP6YgTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WncOjzC8pUS07cXVHCSq/GxiDUzrGXEn6Y1QvhMojLj4KsguE2QSgLJOdj0XSVb3V
	 6Qy8LneWGdWK9J/c+mCBXaf9bvWHZKoRoQU9VANVbZU22rFSZbIKhuU5ZK1t5JK1ip
	 MfGsf97AhCBkc3X8gEKy5ioQuvUpEN+1VzFFzlUoJhz0YG7K51aAPNGRTJBdpfaHh0
	 OSBoUssxpzmecp5yzWNaS4zVTZwNpYTJcRyPPZ2asiViKy0jxLytGJY/D7ONzYiS7J
	 9dbATBQAvcNGDKYGSELGcKI2XTTtKPnQM0EclxQdyAmHVVbqTwe1ZSJoXf9X4aCy3D
	 tFMEJU2OSIxEw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECDFC17E13B5;
	Thu, 13 Nov 2025 13:22:39 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 3/8] dt-bindings: dma: mediatek,uart-dma: Support all SoC generations
Date: Thu, 13 Nov 2025 13:22:24 +0100
Message-ID: <20251113122229.23998-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042243_570752_87BE91DB 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

Add support for the APDMA IP found in all of the SoC generations
that are currently supported upstream; this includes:
 - MT8173, MT8183, fully compatible with MT6577 (32-bits)
 - MT7988, MT8186, MT8188, MT8192, MT8195 and MT6835 (34-bits)
 - MT6991, MT8196 and MT6985 (35-bits)

...where:
 - MT6835 is the first SoC where the AP_DMA IP supports 34-bits
   addressing; and
 - MT6985 is the first SoC where the AP_DMA IP supports 35-bits
   addressing.

While at it, also add myself in the maintainers list.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/dma/mediatek,uart-dma.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index 4d927726df93..3708518fe7fc 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -7,6 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: MediaTek UART APDMA controller
 
 maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Long Cheng <long.cheng@mediatek.com>
 
 description: |
@@ -23,12 +24,29 @@ properties:
           - enum:
               - mediatek,mt2712-uart-dma
               - mediatek,mt6795-uart-dma
+              - mediatek,mt8173-uart-dma
+              - mediatek,mt8183-uart-dma
               - mediatek,mt8365-uart-dma
               - mediatek,mt8516-uart-dma
           - const: mediatek,mt6577-uart-dma
+      - items:
+          - enum:
+              - mediatek,mt7988-uart-dma
+              - mediatek,mt8186-uart-dma
+              - mediatek,mt8188-uart-dma
+              - mediatek,mt8192-uart-dma
+              - mediatek,mt8195-uart-dma
+          - const: mediatek,mt6835-uart-dma
+      - items:
+          - enum:
+              - mediatek,mt6991-uart-dma
+              - mediatek,mt8196-uart-dma
+          - const: mediatek,mt6985-uart-dma
       - enum:
           - mediatek,mt6577-uart-dma
           - mediatek,mt6795-uart-dma
+          - mediatek,mt6835-uart-dma
+          - mediatek,mt6985-uart-dma
 
   reg:
     minItems: 1
-- 
2.51.1


