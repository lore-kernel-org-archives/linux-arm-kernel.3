Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03707C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxAVqvofqeG89seUD3HcjBbLv/c0EiZBfdY1yrGGpRY=; b=QoZPu0h2/fviIuyNFS4FiokyLs
	41njQ07FhlXKLAZJid2lYRYP5+SWrmeIzZcIWSp1gSD865C1gUlJWRkPXbNVwBHqO0IZqyp+YtVnK
	qzXCm4k9+KSGQstd583a3+iQWiXwUuyr9R2imJp8OlMI1FA0MusngyMaQvxAeatbq2jv5JRVE3KXV
	oZVYKCIaRRsvHrky087Kt8af0TeWILU6L6wsMV/RAyzr4VsGQYs/7btFFtVbPpiGM+DDh4zDYE4yr
	5Y6mLQDTLJWsKOUVlIbCeZJbbz97O8jdqBkRblbCAo8+dGRi1g/33Xk3vJq3NIOINDyjvCG3v6btD
	N3dJzyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXK2Q-0000000BVPL-1oo4;
	Thu, 03 Jul 2025 13:31:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIkI-0000000BGlS-2vXa;
	Thu, 03 Jul 2025 12:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751544533;
	bh=uvtB0oCs74aMKuLBMLpHE5WJ8YVpay9CsNi1HZ/A9zQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eN9JfteXgu/5eC6zkJRCDnv2ULEfLQ0/bBafTSPJAe1If6ea4F2/KsQ9MqLsoMeZa
	 HYm5ibFfFn71bvgOYHpgp+GEVVXKTLxX09tjylM/nsiX78PxbHl1ikesWEjp0d1c/V
	 HgsAdHnOWNjPD0JKOA/hHTmXUJxTGp7OnWMQoZf8Zu/aAnUW3Bc0atHnk5Rd/qUSJO
	 IvZfstDhCfSHPKyNOGPSbfFE1GfkWNUFhM4hQTvEOY/afStGKWGnS5V9lce7if6xm+
	 L5hPAgbiIRgjpmGCt2ECXKVivDK2gyY0Q9XUqp5nme8STNaIjp7vPB/Whxxi3UDxJS
	 J4mBoYdfro2qw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E36917E09C6;
	Thu,  3 Jul 2025 14:08:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jianjun.wang@mediatek.com
Cc: ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/3] dt-bindings: PCI: mediatek-gen3: Add support for MT6991/MT8196
Date: Thu,  3 Jul 2025 14:08:46 +0200
Message-ID: <20250703120847.121826-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
References: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_050854_876559_F0D86383 
X-CRM114-Status: UNSURE (   7.86  )
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

Add compatible strings for MT8196 and MT6991 (which are fully
compatible between each other) and clock definitions.

These new SoCs don't have tl_96m and tl_32k clocks, but need
an AHB to APB bus clock and a low power clock.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 162406e0691a..fe3b17b92597 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -52,7 +52,12 @@ properties:
               - mediatek,mt8188-pcie
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
+      - items:
+          - enum:
+              - mediatek,mt6991-pcie
+          - const: mediatek,mt8196-pcie
       - const: mediatek,mt8192-pcie
+      - const: mediatek,mt8196-pcie
       - const: airoha,en7581-pcie
 
   reg:
@@ -212,6 +217,36 @@ allOf:
 
         mediatek,pbus-csr: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: bus
+            - const: low_power
+            - const: peri_26m
+            - const: peri_mem
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: phy
+            - const: mac
+
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:
-- 
2.49.0


