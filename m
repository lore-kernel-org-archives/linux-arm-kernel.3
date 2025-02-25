Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B65BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5S7OzKm73jH9LwR5vYRGJ8Itz0tdca2CuuEiMhSv7WY=; b=LhC7tdd+zZ20XNOxB+1Y74Y/iq
	3Y3ifc9x2ldSi8fjeqIQ+7ODr9oaxh8J/qbpsfqcfKHTj3L5+ZhDjjFz4HkYS+qxqpIINpeYJzl9I
	iG89Ye7q7fAcCXvx/NOMhKTQS19MxZi4LjcFPp38ME/55RAkdybau10axxx0vhKQSJgNgNcAfLf5u
	dT30nR8AhsIVqjibwUtUYsD4U521tBE3LA/cTP7SXt1ZqiVQjxL2lTNTTtO+o2Inru0JBs99BhI4m
	hczXJGK7/+p8cBy4khddwnlbM5CV2Rtbe9gdaXeHkx0yDeqPPj3I0Ex2a6rmKvnR44HpZQA0HFxA0
	ylPDmS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmq5I-0000000GL1C-0qTv;
	Tue, 25 Feb 2025 08:14:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpvJ-0000000GJZe-2pL3;
	Tue, 25 Feb 2025 08:04:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27E895C6668;
	Tue, 25 Feb 2025 08:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D596C4CEE2;
	Tue, 25 Feb 2025 08:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740470652;
	bh=9KVXWc8stYPpZlIbVSdXAfaPi9fFh/5ieJlqnGagLLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VpXbLunl6/8IB3r01XBqTcYmSUeZ/CortIR3eiQTx8B7bHYs11bLt+WbFoAnpKqWd
	 Qq24B5fsGZS84YUpM6ScHIfy6LazheD4VMH4yveFQyEvIIaKJ2KGN2MUFQK59fXBou
	 UbeWE4TJ4B6tSwe3FVzbH/s8qlot1rm/JNhqwG34reaFG1zupwzDYU4+yTgFC1eV1z
	 oRcmeydRSpotdij74XsbtX6p/pBwXTnEcFrz/VTMlotWivj+wysztkMtEbQGQdn4EI
	 0nsgkjZ4I0KHXl//0j5DWSnkT23PxyVQ5t9FF4pJqQpF5SMx1VLm+E1+oy+tyusjPm
	 L9uhGM5WC/kNQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 25 Feb 2025 09:04:06 +0100
Subject: [PATCH v4 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle array property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-en7581-pcie-pbus-csr-v4-1-24324382424a@kernel.org>
References: <20250225-en7581-pcie-pbus-csr-v4-0-24324382424a@kernel.org>
In-Reply-To: <20250225-en7581-pcie-pbus-csr-v4-0-24324382424a@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_000413_830715_1BAD54CD 
X-CRM114-Status: UNSURE (   9.18  )
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

Introduce the mediatek,pbus-csr property for the pbus-csr syscon node
available on EN7581 SoC. The airoha pbus-csr block provides a configuration
interface for the PBUS controller used to detect if a given address is
accessible on PCIe controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index f05aab2b1addcac91d4685d7d94f421814822b92..162406e0691a81044406aa8f9e60605d0d917811 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -109,6 +109,17 @@ properties:
   power-domains:
     maxItems: 1
 
+  mediatek,pbus-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to pbus-csr syscon
+          - description: offset of pbus-csr base address register
+          - description: offset of pbus-csr base address mask register
+    description:
+      Phandle with two arguments to the syscon node used to detect if
+      a given address is accessible on PCIe controller.
+
   '#interrupt-cells':
     const: 1
 
@@ -168,6 +179,8 @@ allOf:
           minItems: 1
           maxItems: 2
 
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:
@@ -197,6 +210,8 @@ allOf:
           minItems: 1
           maxItems: 2
 
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:
@@ -224,6 +239,8 @@ allOf:
           minItems: 1
           maxItems: 2
 
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:

-- 
2.48.1


