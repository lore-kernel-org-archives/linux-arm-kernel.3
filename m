Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D402C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ociqEsQfgU4GoX/DSEwHfPRfdh4C/EHPWPn7YJ+3l8=; b=D8ZDbOePVEh0iPwzZJb7odB2YV
	mzewbWJSd+BUXccwKf1/t1w1GI4/jxkrvqV7mV/9Q008ebF6FxeNZtrfpl64GhV+Yf6gCGJdI1bMd
	8643mtj+WviTxuWj6hcl2FGangoI6ONru9u0DqMVL4OlLMFE/sQbTmLIeKkH8IT/1OiEUg+m6nW1c
	ZPf8N5SGzAGEBQLyGl6HobzOGx6tggkszacZU6Zl9d3gWAqyKPQx/0bU7R5rzobMFSLyosNsINjk6
	7gdcOLxybhHYU03A5MWORzfjC/hu783rmeCS7b4Gznq6t9RmCbm/6iyc64NAy3fVzCI9aI/oGCQqq
	eWI60qhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tln2U-00000007qVx-2Zu3;
	Sat, 22 Feb 2025 10:47:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmza-00000007qBq-2kM7;
	Sat, 22 Feb 2025 10:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9EF55C0F99;
	Sat, 22 Feb 2025 10:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DF6C4CED1;
	Sat, 22 Feb 2025 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740221057;
	bh=1bxj/vC/QXDveDO1JYH8sC0FYLsbB1P5VxpEt6u4zPo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p5QP8NYFIakX0saiNsA2sXR2CLO+44f61vUls0TBRjZ5wAFYtr6F/ztSg9l7h3y2X
	 +YSt+U71JsgDZ+OZAbNm4derxPT/wpDfxh6TlYKHfzmFa9n/eX5qG56JApMqBRFmky
	 1BKmflSIOuOnBdH2gZz4leohx4KsZ90rd2MAgTCRY+ZPx/SGG5nasQi47kV5jxbyhe
	 WgKwq8GEkOqVjxDhohV9bWxd+9xszKRiIEHl4kzQW4GMo7S6aAwQEwnaxoC145awui
	 3Ven1ekPNBpmIlVfAOTmrvU6PFxav7YCW3O/tLs87d0C0Ocb72LiyAwG4CIE5lqraL
	 RLdDYUsEX87/g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 22 Feb 2025 11:43:44 +0100
Subject: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle array property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
In-Reply-To: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_024418_741662_2489E6D2 
X-CRM114-Status: UNSURE (   8.45  )
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


