Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B75C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FV9YmERdmuLqZLm6cvsLGT2BG/yL0o05Pzwxp3DGL8Q=; b=5BCriuq+HmQS1BlIFE2LkJ1AL5
	ElXsuNzCUgOQS6EkcvfVwSo14wmz5o/O2DKyQUlOY33I37fLmEnvfAprYt6tl6d9pVQGcQP6l12B7
	54+jo4j+5MHItliZdyBrbYDzuKTRAsPXKKhOW9eVMGC8FUxAwCC1DW95yqfpgwZ8hyEMcIQKdbjIy
	qdv34Fyh8XCUzCYvSWGs5gbj5oVwCN15ZtvnoMHa6klIakNHhfsCD4OFXE/wQ37+MtNmYsiUfDa0s
	A4aEkjES8NbgtMAkf1eMme0U6RojBTx0zTY7L87h9ZEdL6J6i/juop52DmAjK8/uShlhfVfHGXDt+
	22nuDjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgoW-0000000G3PS-1vMt;
	Mon, 21 Jul 2025 03:03:40 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgXk-0000000G1L8-0yBm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:46:24 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250721024614epoutp0366a1674f8b9c3b808a6b5bcce9b4139d~UJDcY-YPr2154521545epoutp03E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:46:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250721024614epoutp0366a1674f8b9c3b808a6b5bcce9b4139d~UJDcY-YPr2154521545epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065974;
	bh=FV9YmERdmuLqZLm6cvsLGT2BG/yL0o05Pzwxp3DGL8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sb6/mHeuyPNyHddPjefDBdea4wIUYr7eiNTZmSuOj3Fqz3Ikdby1irA6kscb80mfb
	 PBGatn3TIBC0kQznXcJE9RAmyZxisC5MG50ZxeLIxLMH2qdHeulnlf3NT7uvLoljY7
	 FKsl6RrFLzA+bR9Lz8i/4BfBphxdQGFxhWQZaUKs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p2e68dd4f8183805f1a605e43c486b632a~UJDbpll302128221282epcas2p25;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.102]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC82SFJz6B9mF; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p382f3decd51152a5c89c673f222e22da1~UJDaRtkY-2776827768epcas2p3v;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip22bba247cfcfc34030a285b596a0649a3~UJDaNgXcO1443514435epsmtip2G;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 6/9] ASoC : dt-bindings: sound: Add binding for ABOX IPC
 Generic
Date: Mon, 21 Jul 2025 11:30:49 +0900
Message-Id: <20250721023052.3586000-7-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p382f3decd51152a5c89c673f222e22da1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p382f3decd51152a5c89c673f222e22da1
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p382f3decd51152a5c89c673f222e22da1@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194620_745345_10C30422 
X-CRM114-Status: GOOD (  11.77  )
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

This patch updates the existing samsung,exynosauto.yaml schema to
describe the ABOX IPC Generic child node. This node represents
a virtual IPC interface used by the ABOX audio subsystem to
communicate with SoC-specific hardware using shared IRQ channels.

The schema describes the `samsung,num-irq` property and allows
integration of the IPC node under `abox_generic`.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../bindings/sound/samsung,exynosauto.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
index b1e49f38ffe9..3a7b5be627ee 100644
--- a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
@@ -48,6 +48,23 @@ properties:
     description: Required for child nodes that may declare address space.
     const: 1
 
+  abox_ipc_generic:
+    type: object
+    description: ABOX IPC Generic subnode for SoC-level message routing
+    properties:
+      compatible:
+        const: samsung,abox_ipc_generic
+
+      samsung,num-irq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Number of IRQ channels supported for IPC routing.
+
+    required:
+      - compatible
+      - samsung,num-irq
+
+    additionalProperties: false
+
 required:
   - compatible
   - samsung,num-pcm-playback
@@ -66,4 +83,10 @@ examples:
       status = "disabled";
       #address-cells = <2>;
       #size-cells = <1>;
+
+      abox_ipc_generic {
+        compatible = "samsung,abox_ipc_generic";
+        samsung,num-irq = <64>;
+        status = "disabled";
+      };
     };
-- 
2.25.1


