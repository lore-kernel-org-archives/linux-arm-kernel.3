Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042F9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 02:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpNmhokPwuwTpBn4wsN8PkNB3GZ70idsqXpWNdIFNhE=; b=Yuh4My6W2XzmxE3FvxF/fOv0C1
	fUpLjhCJVipygfHLBLOSgBIp4mR5BBZmPFsmjErSxaHk8Qwu1ZWAf/CM4UlmCfU+34YlfTrjZhhga
	OGLmYVYQ/sdIj6mEMeiXucL9YDuw0vAY1753hPTSm7H4viK6fSSB50vgwD7opUHep78la13nJ0Smm
	7i5x/b83ujaFAMbqP3zjJDPBAqX7/CufqdpTo2nqaJope5yjylsLpxazlVTZdQ+q8MFF1gX4UOayx
	fGn+7wd67+l7/ZzYwqQRFlgHaam1O5NVtMiY0+jIQLdwHMr3sHnu7jYrBj0uwda6HvjJh2OYU1Jie
	brxYtfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udghJ-0000000G2Jr-3UI5;
	Mon, 21 Jul 2025 02:56:13 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgXk-0000000G1Ky-0yEJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:46:23 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250721024614epoutp012b54f26766df4c17003fa4acbf3e5a5b~UJDcZKMYM1459614596epoutp01p
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:46:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250721024614epoutp012b54f26766df4c17003fa4acbf3e5a5b~UJDcZKMYM1459614596epoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065974;
	bh=CpNmhokPwuwTpBn4wsN8PkNB3GZ70idsqXpWNdIFNhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TA6PKCqU5xBPBNpEHgcfDryRLFZEh/Pksi7SNitjJ2BxVKhGIgC2xlhL/ajwEAgwc
	 XYvieIaHdguWrTML3Vt8pRlZgYEBAQoFZrjLgeejO7EeJ3J8PWojM796COOfFCUsPB
	 9njO65FHI2g1ITaq0StMqP6uVmeskZfjAeHGAiIA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p3746a1cce420efac6e5ab7540be0e46fd~UJDb6tTZg2776827768epcas2p39;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.98]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC84q0rz6B9mH; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b~UJDahuYAm1461114611epcas2p1i;
	Mon, 21 Jul 2025 02:46:12 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip219c09e9d567601a3aba9e4dd34546308~UJDadbf4Z1051310513epsmtip2T;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 9/9] ASoC: dt-bindings: sound: exynosauto: add PCM frontend
 nodes for ABOX generic
Date: Mon, 21 Jul 2025 11:30:52 +0900
Message-Id: <20250721023052.3586000-10-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194620_743026_2C108EFD 
X-CRM114-Status: GOOD (  19.82  )
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

This patch extends the Exynos Automotive ABOX generic device tree bindings
to support PCM playback and capture frontend nodes.

Each PCM device node describes an audio stream interface handled by the
ABOX DSP. These nodes include properties for stream ID, IRQ, ADSP core
assignment, buffer limits, and stream category (deep_buffer or compress).

The bindings use patternProperties to match playback and capture nodes
as children of the abox_generic controller.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../bindings/sound/samsung,exynosauto.yaml    | 126 +++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
index 3a7b5be627ee..e477550afc7c 100644
--- a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
@@ -28,6 +28,14 @@ properties:
   compatible:
     const: samsung,abox_generic
 
+  status:
+    enum: [ okay, disabled ]
+    description: DTS node enablement state
+
+  $nodename:
+    pattern: "^abox_generic$"
+    description: Node name must be 'abox_generic'
+
   samsung,num-pcm-playback:
     description: Maximum number of PCM playback instances (ALSA PCM devices).
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -42,7 +50,7 @@ properties:
 
   '#address-cells':
     description: Required for child nodes that may declare address space.
-    const: 2
+    const: 1
 
   '#size-cells':
     description: Required for child nodes that may declare address space.
@@ -55,6 +63,10 @@ properties:
       compatible:
         const: samsung,abox_ipc_generic
 
+      status:
+        enum: [ okay, disabled ]
+        description: DTS node enablement state
+
       samsung,num-irq:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: Number of IRQ channels supported for IPC routing.
@@ -65,13 +77,92 @@ properties:
 
     additionalProperties: false
 
+patternProperties:
+  "^abox_pcm_(playback|capture)@[0-9a-f]+$":
+    type: object
+    description: |
+      ABOX PCM playback or capture frontend device node. These nodes define
+      individual PCM streams used by the audio subsystem, and are children of
+      the abox_generic controller. Each node describes a PCM stream ID, IRQ line,
+      ADSP core allocation, and stream-specific parameters.
+
+    properties:
+      compatible:
+        enum:
+          - samsung,abox-pcm-playback
+          - samsung,abox-pcm-capture
+        description: Compatible string for PCM playback or capture device.
+
+      reg:
+        maxItems: 1
+        description: Offset for pointer register (pp_pointer_offset) used for communication with ADSP.
+
+      reg-names:
+        const: pp_pointer_offset
+
+      samsung,id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Unique ID per PCM Device, separated by stream type (playback or capture).
+          Must be less than samsung,num-of-pcm_playback or samsung,num-of-pcm_capture
+          defined in the abox_generic node.
+
+      samsung,irq_id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Software IRQ ID assigned in the control domain. Represents the software interrupt
+          line used by the ADSP to communicate with this PCM device.
+
+      samsung,allocate-adsp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Index of the ADSP core that this PCM device is allocated to. Indicates on which core
+          the stream is handled.
+
+      sound-name-prefix:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: |
+          Prefix name for ALSA DAI interface. Helps to namespace controls and routing.
+
+      samsung,category:
+        enum: [deep_buffer, compress]
+        description: |
+          Type of the PCM stream. Can be either 'deep_buffer' for normal PCM playback/capture,
+          or 'compress' for compressed offload streams.
+
+      samsung,buffer_bytes_max:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Maximum size (in bytes) of the DMA buffer allocated for this PCM device.
+
+      '#sound-dai-cells':
+        const: 0
+        description: Must be 0. Required by ALSA SoC bindings.
+
+      status:
+        enum: [ okay, disabled ]
+        description: Device node enablement status. Set to "okay" to activate the node.
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - samsung,id
+      - samsung,irq_id
+      - samsung,allocate-adsp
+      - samsung,category
+      - samsung,buffer_bytes_max
+      - '#sound-dai-cells'
+
+    additionalProperties: true
+
 required:
   - compatible
   - samsung,num-pcm-playback
   - samsung,num-pcm-capture
   - samsung,num-i2s-dummy-backend
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -81,7 +172,7 @@ examples:
       samsung,num-pcm-capture = <32>;
       samsung,num-i2s-dummy-backend = <5>;
       status = "disabled";
-      #address-cells = <2>;
+      #address-cells = <1>;
       #size-cells = <1>;
 
       abox_ipc_generic {
@@ -89,4 +180,33 @@ examples:
         samsung,num-irq = <64>;
         status = "disabled";
       };
+
+      abox_pcm_playback@3fd0000 {
+        compatible = "samsung,abox-pcm-playback";
+        samsung,id = <0>;
+        samsung,irq_id = <0>;
+        samsung,allocate-adsp = <0>;
+        reg = <0x3fd0000 0x10>;
+        reg-names = "pp_pointer_offset";
+        #sound-dai-cells = <0>;
+        sound-name-prefix = "ABOX";
+        samsung,category = "deep_buffer";
+        samsung,buffer_bytes_max = <0x24000>;
+        status = "disabled";
+      };
+
+      abox_pcm_capture@3fd0400 {
+        compatible = "samsung,abox-pcm-capture";
+        samsung,id = <0>;
+        samsung,irq_id = <32>;
+        samsung,allocate-adsp = <0>;
+        reg = <0x3fd0400 0x10>;
+        reg-names = "pp_pointer_offset";
+        #sound-dai-cells = <0>;
+        sound-name-prefix = "ABOX";
+        samsung,category = "deep_buffer";
+        samsung,buffer_bytes_max = <0x24000>;
+        status = "disabled";
+      };
     };
+
-- 
2.25.1


