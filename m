Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3D7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYO77tq7W5vMECTNJggRjm3ersbeWEtJCeArb977E9A=; b=wkbFh2vIqs/6hY00BUsUbnu/qe
	+EI9/ykOVJQPLxTwts94NtU7QDipCliSfMY0nQ4HCawdEL2Y29beeYOVyy05Aq05H2Qy+J9hDcl6m
	GwMXG4av/HhKmlZGFAD1LyTQjWdrvc3RxrGE7sMHOsFgKf+D49zfBSQbaFSk4NV5BMxz+FGHiRN1x
	ReXEx3k8DClXKbFlOU+v3yo51TQdWN0BA+2OT53pHB8c/GtMGi+jfioKaw4D8O4Bq7Ol2oty9PPTP
	SvE+jpEv26WPDz7iRM2+b9A+q+Xp29ahF02ebFu1CzUlkNjLFfi80C4iYOJaTUe6BCGU5G8IwfIv/
	GDKNJv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgtH-0000000G3iB-3sC2;
	Mon, 21 Jul 2025 03:08:35 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgXk-0000000G1L3-2EGX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:46:26 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250721024613epoutp04011f3f33cdc11ac2ef1645d0b99c3b20~UJDcCkmFi1495814958epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250721024613epoutp04011f3f33cdc11ac2ef1645d0b99c3b20~UJDcCkmFi1495814958epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065973;
	bh=WYO77tq7W5vMECTNJggRjm3ersbeWEtJCeArb977E9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IFklJoPJZwcqOv/w+VcOE5cb0+2rS6kEFUtb1fl95waOLENyaLtE6mfhZAoSfJVsy
	 nlAdXPfNzOvZTi/YCTfQKkmyA9CRqs0xO/244HAJUl9MjVlNfVI5ARVnb2gaHG81Et
	 H+t33manvOoQu3Ixk4BXeZPmPN0FFICn4t/9jZBI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p229f3754dac8b54208ffbe0b221c807e4~UJDbfi5Nz2628326283epcas2p22;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bllC82lmmz2SSKb; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3~UJDaEi5pY0522205222epcas2p4i;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip27e4a25bd9da3119a3e88b5ff0c56cce1~UJDaAmW-Q1347413474epsmtip2i;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 3/9] ASoC: dt-bindings: sound: Add Samsung ExynosAuto ABOX
 binding
Date: Mon, 21 Jul 2025 11:30:46 +0900
Message-Id: <20250721023052.3586000-4-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194620_883759_E2B1055D 
X-CRM114-Status: GOOD (  17.96  )
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

Add the device tree binding documentation for the Samsung Exynos Automotive
ABOX generic audio management core. This binding describes how to configure
the maximum number of PCM playback, PCM capture, and dummy I2S backend
instances for the ABOX core. Actual hardware functionality is provided
by child audio sub-drivers.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../bindings/sound/samsung,exynosauto.yaml    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
new file mode 100644
index 000000000000..b1e49f38ffe9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,exynosauto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Automotive Abox Generic
+
+maintainers:
+  - Eunwoo Kim <ew.kim@samsung.com>
+
+description: |
+  The Samsung Exynos Automotive Abox Generic node represents a
+  generic audio management platform device inside Exynos Automotive SoCs.
+  It does not directly control hardware resources itself, but acts as
+  a common interface to manage child audio sub-drivers for PCM playback,
+  PCM capture, and I2S dummy backends.
+
+  Typically, this node provides configuration for the maximum number of
+  PCM playback and capture devices (ALSA PCM) and the maximum number
+  of dummy I2S backend devices. The actual hardware control is handled
+  by child drivers attached to this generic core.
+
+  This node must exist for the platform driver to probe,
+  even though it does not map any physical hardware address.
+
+properties:
+  compatible:
+    const: samsung,abox_generic
+
+  samsung,num-pcm-playback:
+    description: Maximum number of PCM playback instances (ALSA PCM devices).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-pcm-capture:
+    description: Maximum number of PCM capture instances (ALSA PCM devices).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-i2s-dummy-backend:
+    description: Maximum number of dummy I2S backend instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  '#address-cells':
+    description: Required for child nodes that may declare address space.
+    const: 2
+
+  '#size-cells':
+    description: Required for child nodes that may declare address space.
+    const: 1
+
+required:
+  - compatible
+  - samsung,num-pcm-playback
+  - samsung,num-pcm-capture
+  - samsung,num-i2s-dummy-backend
+
+additionalProperties: false
+
+examples:
+  - |
+    abox_generic {
+      compatible = "samsung,abox_generic";
+      samsung,num-pcm-playback = <32>;
+      samsung,num-pcm-capture = <32>;
+      samsung,num-i2s-dummy-backend = <5>;
+      status = "disabled";
+      #address-cells = <2>;
+      #size-cells = <1>;
+    };
-- 
2.25.1


