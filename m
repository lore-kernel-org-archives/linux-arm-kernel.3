Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F879C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 00:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Csr8P80vKglsKS0cZBaoIuhqtrwVNy6zr9k2ICghBF4=; b=eyvawr30Zz6hlW/bFd5FvHpTSK
	/BXJ9AJTBX0RUQDukjkDA15Zq7UqdQev+g1lnTP7WY9gWHtgat/q1gkPOeYfdpNjxdujTPA+EB1NV
	7ie3lF6Ixlv+CUDtDigKiNdErm2qGhnFVtevC+pvJNmxLiqRrTm4jC/nr0ffmaeHMVNo/5c5px45J
	9jbu7TRFrZ5/B8af4xA4b9Np1SfhiXa7i8URHhib7Xt/17CClWdnoDQ7VFTZS5Zr4ZjYlbQ26kmP9
	nW2qGe5vdRY+ODHY07+up4hKDznbEQ5cDYwkcPHUgyiYQvSMkQpdTQ4/HXugrTxVWHJFrJpjw+4f9
	+Ge6xipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIk7-000000070nh-0XyK;
	Wed, 09 Jul 2025 00:32:59 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIc5-00000006yvz-0QTX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 00:24:42 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250709002436epoutp03d2cd996e0cbcaeb9be4e63aa48a948bf~QbYXF6YN-2129121291epoutp03M
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Jul 2025 00:24:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250709002436epoutp03d2cd996e0cbcaeb9be4e63aa48a948bf~QbYXF6YN-2129121291epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752020676;
	bh=Csr8P80vKglsKS0cZBaoIuhqtrwVNy6zr9k2ICghBF4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=eRgb/vZ2aqCoMZbLv3QvLHgiMu1iu+woD405nufCHFYZheDrzDy6bWFDwzs2ZXB0Z
	 gNfqrm7A5zsUGuiixTq3CumdrkVaKE5qC2Xv2z/PitbPw/IWdg7I+pyr0geycQZSx8
	 DoIxKJgcs9ZdljlaJQ4ilzz+IFuNt2Fe2pDVKLpE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250709002435epcas2p4bedfe99160977b09d8dc4f19f86e2167~QbYWqHqiL2856628566epcas2p4q;
	Wed,  9 Jul 2025 00:24:35 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bcJdH02HKz2SSKX; Wed,  9 Jul
	2025 00:24:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19~QbYVIzYC_0544805448epcas2p2N;
	Wed,  9 Jul 2025 00:24:34 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250709002434epsmtip2553a0baf142607e684f8aaa6a98301f2~QbYVFbsmw0388303883epsmtip2S;
	Wed,  9 Jul 2025 00:24:34 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, lgirdwood@gmail.com, s.nawrocki@samsung.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ew kim <ew.kim@samsung.com>
Subject: [PATCH] ASoC: dt-bindings: Add samsung,abox-generic document
Date: Wed,  9 Jul 2025 09:12:39 +0900
Message-Id: <20250709001239.379695-1-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19
References: <CGME20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_172441_469986_57CE4BD0 
X-CRM114-Status: GOOD (  16.06  )
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

Add soundcard bindings for the abox generic of exynus automotive.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../bindings/sound/samsung,abox-generic.yaml  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml b/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
new file mode 100644
index 000000000000..bf641a197903
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/samsung/abox-generic.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Samsung Exynos Automotive Abox Generic
+
+maintainers:
+  - name: Eunwoo Kim
+    email: ew.kim@samsung.com
+
+description: |
+  Samsung Exynos Automotive Abox Generic core node.
+
+  This node represents the generic Abox controller which manages
+  various Abox sub-drivers and acts as a hub connecting them to
+  SoC-level audio drivers. It provides PCM playback and capture
+  configuration, as well as dummy I2S backend handling, enabling
+  integration between Abox IP blocks and the SoC audio subsystem.
+
+  Typically, this node is used to initialize and configure playback,
+  capture, and routing between the Abox and other SoC audio components.
+
+properties:
+  compatible:
+    const: samsung,abox_generic
+
+  samsung,num-of-pcm_playback:
+    description: Number of PCM playback instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-of-pcm_capture:
+    description: Number of PCM capture instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-of-i2s-dummy-backend:
+    description: Number of dummy I2S backend instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  status:
+    description: Availability status.
+    enum: [ "okay", "disabled" ]
+
+  '#address-cells':
+    description: Number of address cells in the node.
+    const: 2
+
+  '#size-cells':
+    description: Number of size cells in the node.
+    const: 1
+
+  ranges:
+    description: Standard `ranges` property for bus address mapping.
+    type: object
+
+required:
+  - compatible
+  - samsung,num-of-pcm_playback
+  - samsung,num-of-pcm_capture
+  - samsung,num-of-i2s-dummy-backend
+
+additionalProperties: false
+
+examples:
+  - |
+    abox_generic: abox_generic@generic {
+      compatible = "samsung,abox_generic";
+      samsung,num-of-pcm_playback = <32>;
+      samsung,num-of-pcm_capture = <32>;
+      samsung,num-of-i2s-dummy-backend = <5>;
+      status = "disabled";
+      #address-cells = <2>;
+      #size-cells = <1>;
+      ranges;
+    };
+
-- 
2.25.1


