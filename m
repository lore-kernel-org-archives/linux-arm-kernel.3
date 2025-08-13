Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B45CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAKAwNe91bV5Uy3CqZeE+2/LB9ZC5Pi+NUxAG6im2sM=; b=uBW3VHP43KWf2IkGj9WrJH5x9y
	LRXpf0EYw2XE0m7EqEDMKwsaURSRyNfZH6E8UXySoWHADcs/5eXuj3eSQUqVorhpIJRJDNqskcgWg
	0eouxbzU06NwqR2ZfVSY3mEPVHLh4YCKt3gB4zlx/P/pophzTq97vX0Eso63y0X+jT+Uzo+3PU0Qu
	1UQPyKtjMmEAx1pWEyZBG0UrOAiOuDy8kqMXIkn4ckNxTrW+NZPYhwUMgKPWifgq29RsBdpyWCYTk
	hi9cfrEqJHFqSYa2nPlXaqpzyI4ktUi01dobCM9UxRx9nIehCdz8tCRUgMQ2hWZwulcd0OFmzKHVQ
	xttxPHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Yv-0000000DMDT-0G5p;
	Wed, 13 Aug 2025 10:18:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8CY-0000000DHzm-45ew
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 09:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=gAKAwNe91bV5Uy3CqZeE+2/LB9ZC5Pi+NUxAG6im2sM=; b=fYLGiGFjQIsYFWQ1ChBVZKM10p
	JgXp7YC5HsEMJsGGmWAxHvlrxGqjsD5CNSVhgYWRM1MZR807bdeP7ifzvHlcPdxpCk7X8rXei293q
	gOHJE0oZsP0DOcrmITQXhSgBLvVRMBPt3mDI2VSmXHbjOCbBi4KSjb94UHn7xGTYXCX94FS8qEB0d
	2eDKKMRmXoYu1czLWWjIU60T8CJ6Amc8KVCG+otJL4tkswfDj3zkzMcO94LEH/HCq3S7kEEgS5+u0
	Hd72X7HYuJ0AsKrTOrBDTZQFYlnefe7gVon8GQMsNlvzpI9pI2CN6EYyDykr0QRbq+jTIde3Yx38D
	3DA1942Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8CV-0000000G3MV-2mFu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D87D6A57C25;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B519C4CEF7;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078916;
	bh=uFfyp85Y/ZURlINZYrqTyFUELj745HBHUjXdNQ/xIdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J7p3ld6XCZw79IcBaOd1W6EQQ4/4t6AzL+TWKrY3EJ8nQkHgGINXJs0vpafruOZhP
	 54adpVVI4NCFTmmGfkK2OZkdOQuejutB+50v7yxFICdt/XpLUqBPit3mWrBO3dAWtf
	 LoWT01hn9dwiZLPfcsLK7ONOCVQ/A3iJy/sdw2YuFI8N5EajfiAELtHILiTog64muM
	 IvSAnhUrSalCUsaZDr9EI4iQyB8sn0W1RXSfg/e85tkW++BKY/LU6gfsGSt3gEtn43
	 F5l/YMGykH8U57oBe6kNVWlOICSnLMZnjxDfIaVhW3k/oRgpQ5aZRSbGF91+ywzeNe
	 Tntln05FHLJow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03715CA0EE0;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Wed, 13 Aug 2025 09:54:54 +0000
Subject: [PATCH v5 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-allegro_dvt_al300_dec_driver-v5-2-a312ddebc4d8@allegrodvt.com>
References: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
In-Reply-To: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3356;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=rsZuEr9sLWRzFDAiFsRQC99+L6VlC2Ev66jDkdZLHSM=;
 b=kA0DAAoWwI2tvSK8AZsByyZiAGicYQGgRyxYWA4X6pzXd+7N5k7DPPIWNpl6sXYk7hKu3aLH2
 Ih1BAAWCgAdFiEE8DCl5vQGfEyYhAafwI2tvSK8AZsFAmicYQEACgkQwI2tvSK8AZu8KAEAqE8o
 LX6AJdykZGuk+HMDH9EgWok61fZiHQtrCo1MvRQBAIbIEl6BPsp08PGRe7QZqduSpZrRwgSRGh0
 jRKWU9ksH
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105520_064248_22307CD7 
X-CRM114-Status: GOOD (  15.04  )
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
Reply-To: yassine.ouaissa@allegrodvt.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add a schema for the allegro gen3 video decoder.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegro,al300-vdec.yaml         | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..12e86c306d5578d298ad03a6d59593dd1ddcff9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description:
+  The al300-vdec represents the gen 3 of Allegro DVT IP video
+  decoding technology, offering significant advancements over its
+  predecessors. This new decoder features enhanced processing capabilities
+  with improved throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented
+  through a specialized mailbox interface mechanism. This mailbox system
+  provides a structured channel for exchanging commands, parameters, and
+  status information between the host CPU and the MCU controlling the codec
+  engines.
+
+properties:
+  compatible:
+    const: allegro,al300-vdec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: MCU core clock
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: False
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-decoder@a0120000 {
+            compatible = "allegro,al300-vdec";
+            reg = <0x00 0xa0120000 0x00 0x10000>, /*VDEC_TOP*/
+                  <0x01 0x80000000 0x00 0x8000>;  /*MCU_APB*/
+            reg-names = "top", "apb";
+            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mcu_core_clk>;
+            memory-region = <&vdec_mem>;
+            firmware-name = "al300_vdec.fw";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 88a76452956eb3b91e7813cbdc16c361f26216a5..532d8a51df9f500767f468935d960b1634139c65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -819,7 +819,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER

-- 
2.30.2



