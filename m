Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B4EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5OEo6P622AGc1kH2MmqxgD84mBJGJOaRZI+dlPq/iQ=; b=bBB3hrvPkamiCrS3CG819L33bo
	Z5bA3B6QzW1dZQstwz8cEmnSwxeErqLJeWoJr7bWKs3qkOBfOlDiaI0XQ13i53HQbEhNjUg1GtkfG
	5OPI3SWaHf+rC0OEVca2CLT5urzyEADm+zYCO+4VNeh/neVqHc7tOZfA95j21ErsXJpN8VqdqRJAu
	izBSOk9a1I2eyMowe+4Wy3nocpEKz/5RPHSZoWszUCaflZbr3QaGxIHp1mIY7tfvn9c8sobp7I068
	pHTipY0ySi/KVvreVcpvhwRjQvn6tmfO8YzZBQs0USH9Rzxe7cmg1U1z0bxIOXcXWMtyWMZ8CKiVF
	sFRJp4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFElY-0000000FiGm-0G64;
	Wed, 14 May 2025 16:15:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEPw-0000000FePd-03I4;
	Wed, 14 May 2025 15:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=m5OEo6P622AGc1kH2MmqxgD84mBJGJOaRZI+dlPq/iQ=; b=MSExPwWIjWm0Srwp4A22WAi3OL
	urP4zMAmRIfAcjxS3Hmkbrbq7mn0CdLPOEBrrdqiInRZJIci3XTFHQX6/mAY6HAHE2CP4l9xjkr7c
	VObiVqZxLi44q6MzU0eYsY1jLm2eN/Wq3no88+qqPimWZwnqgyrG0IZsa2Piy7mHs1u6y9wM/LwLk
	IhdnijxMF68/B4rCNmOhHZcyDTOTSq45t8na57kUwWzTU60XM96jhadW1+WnhkNwk19mIJl7vsWCH
	vGLStxlOhTlVy61U2dl+7y//jpPWUyPMK9ij5UUgPBymhX+o2HioLgNXN9/UYOCdqvOSlkubw88Cw
	N7h+CBzw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFEPq-0000000HF3D-2bog;
	Wed, 14 May 2025 15:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD1A35C56E5;
	Wed, 14 May 2025 15:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB768C4CEE9;
	Wed, 14 May 2025 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237982;
	bh=MwDa45ORKTT7hodVNI9CtLOOfX7Dv4E4i3AncjUZKk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k+i4Aecs8sQYsxou16j+LEKYH0YK/HjFhrsyH/Ziq82FUMIFVcRXhNj5X1yj52GQ8
	 icyiaoldYoxPrPFuPRSmNrItUKYl/F+FKudZxVVwRJkSmwNnwq0AlcLdnLd9Ge+1IY
	 9N1/zNEYkKv2/goqho9u+LUHutZvquT1+RyV/FU9Jl2+OnZcKpQ+vRM5ZQmlA3C0zb
	 wAFHOLVKDZbSZiQfUk5I4Dqxl+MJU53Z8BP3tujL9k0WWnpEpHmVtY8Twy4apA7dRF
	 +N9p+WOfPgWzE3bJ6k/RD/lScyLdQUa0YBT7S4I10YPytSZpkcjDapru1N/2whUGas
	 Q4uiU2YfXxr+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AD5C3ABDE;
	Wed, 14 May 2025 15:53:02 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:02 +0200
Subject: [PATCH v7 01/14] Documentation: admin-guide: media: add rockchip
 camera interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-1-7581fd96a33a@collabora.com>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=7244;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=CEGnh8nEsGbXB7l0NpZtii1+UH4tTXwGmHyIh00hh9k=;
 b=1TrDVOfnUMPvMExrapv54AJzrSMDqa16J/ezylxUpKsy5BdnS+Kk8imQ/D/edQbp373+VgtqK
 EfOs/AThZGzAW0duwSHlA5Nl3lAUZ4sMusgRyi8kOFHJ3hevz3XRmyy
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_165307_157082_382FB974 
X-CRM114-Status: GOOD (  20.63  )
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
index e8761561b2fe..f6497541d55b 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -24,6 +24,7 @@ Video4Linux (V4L) driver-specific documentation
 	qcom_camss
 	raspberrypi-pisp-be
 	rcar-fdp1
+	rkcif
 	rkisp1
 	raspberrypi-rp1-cfe
 	saa7134
diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe..dcfef77c3037 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21002,6 +21002,13 @@ S:	Maintained
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



