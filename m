Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B1CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vN+iH6FU0S8uotOu8fLMGMIkp7fWDd/vDDdCH+ZWAe8=; b=Zd+eakm/+GyNfdqWuf7yhOlC/w
	OEisounjA0Z9TKLvHZAYhvRaKINUFBPZALuo913LFUwFbzVM7VKzRqHiDd1dE0OzrhC5NlOgLIYSL
	+bTv4AgsZSJf6E1B8s7cyRKc2cArCMnVrZQfPNuAqHchqY4h0nH3D1guQCvaYj+nriKIG6yV/cB+0
	SKyw9foLxeiwsDH1DtW2vp/1LylsXaWC1TJY/gnZ7XFXUOzpQ3Q88G7+KLgw6q82JUGyJUp0G40ll
	AtrOi7dF2v7EzEvm3NMKmmmbBaJ5vVxCchZPPuFOziurtSOrV+C/SbRMVjjKLArIb6peNzlVxGhYL
	gke6ewTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eg5-0000000GLe9-1Obd;
	Tue, 14 Oct 2025 13:02:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8efu-0000000GLPV-33Cg;
	Tue, 14 Oct 2025 13:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0125D44964;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF32BC113D0;
	Tue, 14 Oct 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446965;
	bh=hXryTLF8q4y9elXCJ9ilK+iRM0tSIZ+XhIIktNp3FKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QP+jxGCTf6NNkMd/LvINqkSbT8hKmKDbSTdEaqX/Cub2N1BRRQ0hko+J4YqqmIlYu
	 0TYXeKMrAmlW0tVHkiYJRVKrYJhE2Xes1KQea4KyAGRxlSmH/QSBquOmN9RFS92zRV
	 DGrkqwntQxCFLMWAQdkq/N95XwbIhdbYZF7+pNxgXhdrEg11HFfih0JLV7MBmlefb6
	 Xw5MLmZqhTePYsDMa/6yteGvjwPdPjhDjFyEVUBM4VFTl+LBu5vmNdtEkCHQoz3CGR
	 D/juyEFJVJG+Gz2sKunUeweE3Yzqf+6LsDkg64Q3RHdp6w4X8Uhtx7obKvKvtIai5k
	 LZDE3btdAzh+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F8DCCD184;
	Tue, 14 Oct 2025 13:02:45 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 14 Oct 2025 15:01:47 +0200
Subject: [PATCH v12 01/18] Documentation: admin-guide: media: add rockchip
 camera interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v12-1-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=7244;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=weR2XLDhr0Y9vmX8tmMM8NPOkUIjnZIPDkW5+rbOIus=;
 b=SQymRTY9qGJzRFmie2nzw36zEd9j23TQaMJdtzmKbIg8wbiTNYFLYiXj1YbvgCmnQdvq95Sp2
 Wz+dkf+GTiFDtCykOLGKonPa22st46+b2g4al6j8goEldcGPd7FhiS8
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060246_857360_9D3A056D 
X-CRM114-Status: GOOD (  20.43  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add a document that describes the different variants of the Rockchip
Camera Interface (CIF), their hardware layout, as well as their
representation in the media controller centric rkcif device driver,
which is located under drivers/media/platform/rockchip/rkcif.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../admin-guide/media/rkcif-rk3568-vicap.dot       | 21 ++++++
 Documentation/admin-guide/media/rkcif.rst          | 83 ++++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst    |  1 +
 MAINTAINERS                                        |  7 ++
 4 files changed, 112 insertions(+)

diff --git a/Documentation/admin-guide/media/rkcif-rk3568-vicap.dot b/Documentation/admin-guide/media/rkcif-rk3568-vicap.dot
new file mode 100644
index 000000000000..02340135a2ac
--- /dev/null
+++ b/Documentation/admin-guide/media/rkcif-rk3568-vicap.dot
@@ -0,0 +1,21 @@
+digraph board {
+        rankdir=TB
+        n00000001 [label="{{<port0> 0} | rkcif-dvp0\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000001:port1 -> n00000004
+        n00000004 [label="rkcif-dvp0-id0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n0000000a [label="{{<port0> 0} | rkcif-mipi0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000000a:port1 -> n0000000d
+        n0000000a:port1 -> n00000013 [style=dashed]
+        n0000000a:port1 -> n00000019 [style=dashed]
+        n0000000a:port1 -> n0000001f [style=dashed]
+        n0000000d [label="rkcif-mipi0-id0\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000013 [label="rkcif-mipi0-id1\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+        n00000019 [label="rkcif-mipi0-id2\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+        n0000001f [label="rkcif-mipi0-id3\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+        n00000025 [label="{{} | it6801 2-0048\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000025:port0 -> n00000001:port0
+        n00000029 [label="{{<port0> 0} | rockchip-mipi-csi fdfb0000.csi\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000029:port1 -> n0000000a:port0
+        n0000002e [label="{{} | imx415 4-001a\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000002e:port0 -> n00000029:port0
+}
diff --git a/Documentation/admin-guide/media/rkcif.rst b/Documentation/admin-guide/media/rkcif.rst
new file mode 100644
index 000000000000..f35f644a54a0
--- /dev/null
+++ b/Documentation/admin-guide/media/rkcif.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Rockchip Camera Interface (CIF)
+=========================================
+
+Introduction
+============
+
+The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs in
+different variants.
+The different variants are combinations of common building blocks, such as
+
+* INTERFACE blocks of different types, namely
+
+  * the Digital Video Port (DVP, a parallel data interface)
+  * the interface block for the MIPI CSI-2 receiver
+
+* CROP units
+
+* MIPI CSI-2 receiver (not available on all variants): This unit is referred
+  to as MIPI CSI HOST in the Rockchip documentation.
+  Technically, it is a separate hardware block, but it is strongly coupled to
+  the CIF and therefore included here.
+
+* MUX units (not available on all variants) that pass the video data to an
+  image signal processor (ISP)
+
+* SCALE units (not available on all variants)
+
+* DMA engines that transfer video data into system memory using a
+  double-buffering mechanism called ping-pong mode
+
+* Support for four streams per INTERFACE block (not available on all
+  variants), e.g., for MIPI CSI-2 Virtual Channels (VCs)
+
+This document describes the different variants of the CIF, their hardware
+layout, as well as their representation in the media controller centric rkcif
+device driver, which is located under drivers/media/platform/rockchip/rkcif.
+
+Variants
+========
+
+Rockchip PX30 Video Input Processor (VIP)
+-----------------------------------------
+
+The PX30 Video Input Processor (VIP) features a digital video port that accepts
+parallel video data or BT.656.
+Since these protocols do not feature multiple streams, the VIP has one DMA
+engine that transfers the input video data into system memory.
+
+The rkcif driver represents this hardware variant by exposing one V4L2 subdevice
+(the DVP INTERFACE/CROP block) and one V4L2 device (the DVP DMA engine).
+
+Rockchip RK3568 Video Capture (VICAP)
+-------------------------------------
+
+The RK3568 Video Capture (VICAP) unit features a digital video port and a MIPI
+CSI-2 receiver that can receive video data independently.
+The DVP accepts parallel video data, BT.656 and BT.1120.
+Since the BT.1120 protocol may feature more than one stream, the RK3568 VICAP
+DVP features four DMA engines that can capture different streams.
+Similarly, the RK3568 VICAP MIPI CSI-2 receiver features four DMA engines to
+handle different Virtual Channels (VCs).
+
+The rkcif driver represents this hardware variant by exposing up to three V4L2
+subdevices:
+
+* rkcif-dvp0: INTERFACE/CROP block for the DVP
+* rockchip-mipi-csi fdfb0000.csi: MIPI CSI-2 receiver
+* rkcif-mipi0: INTERFACE/CROP block for the MIPI CSI-2 receiver
+
+and up to five V4L2 devices:
+
+* rkcif-dvp0-id0: The support for multiple streams on the DVP is not yet
+  implemented, as it is hard to find test hardware. Thus, this video device
+  represents the first DMA engine of the RK3568 DVP.
+* rkcif-mipi0-id[0...3]: The four DMA engines of the RK3568 MIPI CSI-2
+  receiver. Each DMA engine can capture a certain MIPI CSI-2 Virtual Channel.
+
+.. kernel-figure:: rkcif-rk3568-vicap.dot
+    :alt:   Topology of the RK3568 Video Capture (VICAP) unit
+    :align: center
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 3bac5165b134..694fad685ff5 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -25,6 +25,7 @@ Video4Linux (V4L) driver-specific documentation
 	qcom_camss
 	raspberrypi-pisp-be
 	rcar-fdp1
+	rkcif
 	rkisp1
 	raspberrypi-rp1-cfe
 	saa7134
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..3f9fbb5d73da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22210,6 +22210,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
 F:	drivers/net/can/rockchip/
 
+ROCKCHIP CAMERA INTERFACE (RKCIF) DRIVER
+M:	Mehdi Djait <mehdi.djait@linux.intel.com>
+M:	Michael Riesch <michael.riesch@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/rkcif*
+
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org

-- 
2.39.5



