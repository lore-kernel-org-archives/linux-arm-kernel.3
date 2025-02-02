Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F10C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lASZNEX57b9DgcktMWKa+5fFNo9gffofmzPdzipGsoU=; b=A93UoKoxqu5ymtDfoMyQJjCtge
	F3B15jsYgBu0zAN3ieZ7NC2ewm7R0EyAtB6/gNK4wFx9kk93pbv0oEphNjmr916emEYRt3BZF+W4T
	8yUTvHTpkOYwx99Id6ARdWtJiXePpqickdLSWLKNaBfXom4HaN6vWKQqqCT+p7o8N3HVfD7aRtmwz
	L/+5z63fLHYanc/02o20V36BQKJJupXGnrsnNX3TkI5kccQi5FjS4/CgaRNVy+8YYm1LEwGYf4Ari
	8kKoJ9bE+v8sX/5OJ3oSyoX44JcVmh02HAWHOoa0uYhzokRd6nYI4PWUFXzp0UEf2jSYnvyVd5cOa
	QKfdo2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tefmf-0000000E74b-1KrC;
	Sun, 02 Feb 2025 19:37:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tefk4-0000000E6mU-2upE;
	Sun, 02 Feb 2025 19:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C157A40C48;
	Sun,  2 Feb 2025 19:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BD8C4CED1;
	Sun,  2 Feb 2025 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738524891;
	bh=MvBbBz0UZOoSGohxLQSCxzUNlNMms+bHXssaD7TA7kM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WoQEosl+kDVcBNcdo7cvQYIgXbTT5tTmnDqMV9AMJ6djArwFsEsHCXEKfVJQMHZ6L
	 yrE4ceg/FnZd1XyLpM7030LJI/7+cEe2ZJuGPznhVaivGi2CD8723aVX+NfWTfkptq
	 8fzGuCWhx7oSbxKo7Tl6THLJa31crMZjKZNMKEtNsITK2WJ/7IGBK7C999UL91DUOE
	 BBzDyAhSe6eg2yinOLYbTG96Ut4jUChFEoRKjFzcC8KH/W5kXPssGwdZ1JHhbk1ZHZ
	 3tTfmbJSw22qW2dfyM6J+Z9pxX91Xza9OQTSFtIxv10Hz9ShQctfXXroKVdc/Qv6bq
	 FcgDBdNPSSaNA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 02 Feb 2025 20:34:23 +0100
Subject: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-en7581-pcie-pbus-csr-v2-1-65dcb201c9a9@kernel.org>
References: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
In-Reply-To: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_113452_820326_8AA9DF53 
X-CRM114-Status: UNSURE (   8.74  )
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
interface for the PBUS controller used to detect if a given address is on
PCIE0, PCIE1 or PCIE2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index f05aab2b1addcac91d4685d7d94f421814822b92..02f2cd9bcf007c1f16b18b1330a88ce43807a9be 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -109,6 +109,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  mediatek,pbus-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon node used to detect if a given address is on
+      the PCIe ports.
+
   '#interrupt-cells':
     const: 1
 
@@ -168,6 +174,8 @@ allOf:
           minItems: 1
           maxItems: 2
 
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:
@@ -197,6 +205,8 @@ allOf:
           minItems: 1
           maxItems: 2
 
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:
@@ -224,6 +234,8 @@ allOf:
           minItems: 1
           maxItems: 2
 
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:

-- 
2.48.1


