Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE225C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Mj67QcVmqs6wmRW2naVhRw1o1ZfYr/QnTH9zrVrifs=; b=GEK0DTSpUpsqZZ19M8guvB5qs4
	iDatWpFKmpB8IJyrXBjzi6mcXePUqWTl6o7Gqhb35nYb3Xw/fh8JUufjJNIKa2wKevtWHDxdnHgik
	kPneUDuobxjy5haMMaZUOYcQdJdSg2mMn5wAQ1u5xlz//nzkMJCe2Q8Aq+ctt15uw13LODnFpP9PC
	WZF6kWJsr/bizWI7cGm0F16jdTTEBW4NB8VWF4S/FI0rImGmQE6SUFYJuiCOGlRr8MYe7H8DnBpgw
	yjqcYAzQldjhMcNRTJOMTdsr7H+zO8P8AnFX/E7bkavyiatC1xmpS2t4XDxTIzN1zmBOFLAKbS8Cs
	IQqlJ9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1aH-00000007lJ8-1yee;
	Sun, 12 Jul 2026 21:19:33 +0000
Received: from out16-185.antispamcloud.com ([185.201.18.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1aC-00000007lGb-3bMU;
	Sun, 12 Jul 2026 21:19:30 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx195.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wj1Zx-00GoSN-M0; Sun, 12 Jul 2026 23:19:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1Mj67QcVmqs6wmRW2naVhRw1o1ZfYr/QnTH9zrVrifs=; b=DV7yCnlpn/0mTP4kaVCvoX0bvK
	q/StrZFkYRAG4qJwh9bb1GtCjQBZPH1lpeSDiIIr74szX6BiaxY89rWXF7avxAT6PyNaTkwqwHUox
	5slzsAghwP5/WClbQTpTFH6fZJOGaHiy5Oj0S2i1OyoI25sE/qVm+VxzA0owKOi58QzbBIGhLObl9
	+lWxXtFm040f19qrc4RAjCC8cIDwRgL/ZYUrcIsNTva+WX+th2eg2u0nMufoZ48JzlaQK8KYUS4TE
	a/HU8U+QAidog5jlAyDbrfn0L1MLYmW8VpwSQy58yMAupBtF+46FaW5QQRJoEjhV7wBCPr1WiFNpR
	TD123p2Q==;
Received: from [188.251.249.2] (port=43526 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wj1Zu-0000000D6jk-38Hd;
	Sun, 12 Jul 2026 21:19:11 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Sun, 12 Jul 2026 22:18:53 +0100
Subject: [PATCH 3/6] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-bcm2712-iommu-submit-v1-3-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00198314465392)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVII5Q6oPCuB9qu4EA3zhr96uX8i5dKehwf
 KC2SaWwUYSu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIPXALmPA8d+BGIw6ynmMqunGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCulNo0fvnzmZPW3MC2/ZtQeB7itP8hgjDRserKv4bhb3RyZlCL9i3kc+ehInPHgYZWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AyPIv7c2tg
 uiTnO7hoWdxS2Euf+eM3l5KPnbp/eQthjVPLCh11+xKgET3fXj754wkhoRweeXUyelEFumxqJC98
 W2Chcvueb7X9IVOP0nXi5ScUGZbDvQNAWVsKTgEVkGFZkrTBb08hz2+hQWIE/jMJBRjlXAPIIi6r
 dxgy5Mnu2cDsZps7XJtkUNhIi117bsGJ7ren9RtRNyYim5e3GD8LGd17Yt5uvWRLqYZ7YcWBwuaj
 bB9FLgbTIobDkucCu6K1Qts6ESwZ+TRkjY5CmPXd4fzFwV5PA+Zo1HkEWshOrnfOczv/Rq1TfV/y
 9sPCUZ0yjBqTnQMt5W0GKvZ5TPS+0sUsSnvAz6a57TzpYAKZxAOMmYkwXP3g8rtJn6lRuSHjV8Jw
 2Fxq1Vd7xIu/TP3zxxtadaYgn3OIzsUC2wDRiPKWwieZyauFYqHkIbFa+ipFHuOywN1cBSoAw5Iq
 u8uD6H9vRamlPbOxG7rXq5Czwgf6xGEuqjPYHqCiHsRpKiyawVZCoGB4EfDx2fRuW8Y0o7OCze69
 5wqpq4Ow1lDfcfvX9sw5VBsaDF9CxNBjABkH3hTMjGc3lQAtuckU+MNQlLpWhjjykqbde3UjWoF9
 cBo9q3T2iWmfFRW/Psbz8QFVy0V5rN3M2TZ9grsaBV7hOgCSkfEzb1aIdlnbLZp4DCYOuNFQ+5eG
 III/qgXB3gv2NI/ukWuQBNrXV+EmIqM8SxKOhcObZXWnkEw+6F9CGyYC9AhR1ZLKC40YaZQ+trtn
 Eh9wUysc4uCrhmcWLql8TBcwc7MLvLLf36yri656/naizxFc684o/A69h/CvHI/GeXW8oEyu47TQ
 DqTi6GKwcIp24VOsP5eu885wo+t+ynT3Y80OmAux3oN13+ztUzneZGHdcUfaxYq0ZH+Cc9iqnocR
 WxNUEo38DE53aa5lZFsy2onypIM6qetbKE/25wcBE3dCizsqYfBnHUM3oFa+qdoVIihnVzbm4Qzx
 fUxUyvhr3Z1SFe+4OrB9Rro7EpOy1Um2iVRPSUxhtw3wz3yqYcOpyKA69LF1Ge2GaGfxmfp09oMS
 l8c4ShQ//ve+MHzjs9MOb3HXByN6cty/LT6lgOv2AzRyYGlsi3xQeIJ6TM5o5F89lTjPCn99uwfA
 g5wm8t3Xj/LzZ5s/OJg1L2asZ/4te3BTDYEBZZ1yPQnIH5IVn/pKnch3lmmwSrgldH+Ps9MOb3HX
 ByN6cty/LT6lgO+c9AHZZ12442bv/l3jZJg=
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_141929_014856_AF46B20C 
X-CRM114-Status: GOOD (  12.38  )
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

Add bindings for the Broadcom BCM2712 IOMMU and its shared TLB cache.

Include compatibility with the cache phandle used in existing firmware
shipped on Raspberry Pi 5, and also allow the iova-window to be omitted,
which similarly will maintain compatibility with existing RPi5 firmware.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 65 ++++++++++++++++++++++
 .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 35 ++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
new file mode 100644
index 000000000000..0d91c513afc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2712 IOMMU
+
+maintainers:
+  - Daniel Drake <dan@reactivated.net>
+
+description: |
+  The BCM2712 IOMMU provides address translation for various hardware blocks
+  on the BCM2712 SoC, such as the VC6 display pipeline.
+
+properties:
+  compatible:
+    const: brcm,bcm2712-iommu
+
+  reg:
+    maxItems: 1
+
+  '#iommu-cells':
+    const: 0
+
+  brcm,iommu-cache:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the shared IOMMU cache (IOMMUC).
+
+  cache:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Deprecated. Use brcm,iommu-cache instead.
+    deprecated: true
+
+  brcm,iova-window:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description: |
+      An array of two 64-bit integers specifying the IOVA aperture start
+      address and the aperture size. IOMMU mappings will be created inside
+      this aperture. All preceding address space is in identity/bypass mode.
+      The aperture start address must be 4GB-aligned.
+      Should be considered a required property, but it is technically optional
+      in order to maintain compatibility with historical firmware versions.
+      If absent, defaults to a 4GB window at 40GiB (0xa00000000).
+    items:
+      - description: IOVA window start address
+      - description: IOVA window size
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+  - brcm,iommu-cache
+
+additionalProperties: false
+
+examples:
+  - |
+    iommu@5200 {
+        compatible = "brcm,bcm2712-iommu";
+        reg = <0x5200 0x80>;
+        brcm,iommu-cache = <&iommuc>;
+        #iommu-cells = <0>;
+        brcm,iova-window = /bits/ 64 <0xa00000000 0x100000000>;
+    };
diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
new file mode 100644
index 000000000000..f22e9be2c473
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommuc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2712 Shared IOMMU Cache (IOMMUC)
+
+maintainers:
+  - Daniel Drake <dan@reactivated.net>
+
+description: |
+  The BCM2712 IOMMU Cache (IOMMUC) provides a shared Translation Lookaside
+  Buffer (TLB) cache used by the primary BCM2712 IOMMUs to speed up address
+  translations.
+
+properties:
+  compatible:
+    const: brcm,bcm2712-iommuc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    iommuc: iommu-cache@1001000 {
+        compatible = "brcm,bcm2712-iommuc";
+        reg = <0x1001000 0x100>;
+    };

-- 
2.55.0


