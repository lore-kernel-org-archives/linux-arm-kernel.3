Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74036C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEYl348RP9lH+moUTtTB4bVSn/nQZWI9NOD2wGD5e/E=; b=YRpS2UJYQdG8aa2sKWOYXjPQVG
	XaFyZ/8xbpAgMuThvQHR0rpsJ5SQcQqCD6pil+eQ92AR8QVD50n4dqunbsokTSOdDxF6qFSl1m2Cr
	vkW2nui5eSvGwkb9dlpL+yzCWmMPAFfrtRaXoRckB327x2GOFqnp0DFZVBwOukmRJ4i5TppsBicHF
	Kr49FJt7Y3SuWg8V2aeVy3tWCmOIUdupRie8S/uTTPwkWzX4fetwlJLmzeh/JXrOFmyUZpWyzTVhd
	1qXmsgM0MBbBKQWhRcix0AQy2EoK50iMUDPzCpP6u+PUI8V+7L8iGJ5tCx8175N8RpYU06WOsab5M
	UF2qcapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1ZO-00000005OxP-2uS2;
	Tue, 24 Jun 2025 11:12:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0rw-00000005Iv4-2nGD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:27:14 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49C245298;
	Tue, 24 Jun 2025 12:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760482;
	bh=oMkhBkAO/dVyRPRg/bL2Da05aRTj4RPblyuzQlSLlb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PhqS5Z9WKv2K7X7K/R3W2lQFMvTvZDVgWmtZuWVzlazCzqzH4Q3G+AUR+NM2KgZoC
	 0qbUFJYsNROw8/TSj88sBDngxYkj2PDhmF/hix5XRYpnnHPIumAFsYjsUElMC4W284
	 1nUZATHbDhT+FlslukTrs7JoLDa/lvup46GeW6ts=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:26 +0100
Subject: [PATCH v10 13/17] Documentation: mali-c55: Add Statistics
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-13-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7938;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=oMkhBkAO/dVyRPRg/bL2Da05aRTj4RPblyuzQlSLlb4=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwpmErqsxaxjVBvkzrgcFfOfxrzkD+KY5Fe0
 CAJRJ56dxmJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8KQAKCRDISVd6bEV1
 MtIoD/9GJwHUA+L/OiZWJBGSnNrCNeAgMbhZYQDVKrMrWrET1ycFPAp88O+AS/nGP37QTUdxCLN
 zS6hd7SqWoqfQ6Ms6WdLgk1FYmK4FuvRlgxQNwX+s1rKqr0Frchu2vXPsrkscgny84tjWBpJnkT
 Y8dBwVbzK+BlpQyP14ktOR6hMGVSnkKFCazhyQTvbJFA6DIy7JVHoyCVWpBmhEHU+u/nqI2O7z7
 P6qhqOrOEzxV28jOPph8AWdhq5c7uJ6gERG/OicHm/NR5sgBxf2HGd4O/LXFWA+1GqaIPy8bZxy
 XqZM3u666ftNAM5SuxDFu7tBJp8+0SM+vjpxLLzLnxmvYyVCHgmKdEFfjipB/xjVkQLJ65P6mK6
 3mQBBUzyGy+QbjQWIwNDUXSOLrUDBoSSPaSLbBpOeqtPovyn4vztrsQLmvIjlWobdx4arB3Bzgz
 7WSvslLKbfSaezFKQlmW2VVmrU3Rcjr6pvLs8pyHync7ZC0uxSI/ShvAjmpyRGWTqMg4Fgu6ixf
 rBzlMZBlYF1OhaHrc3hAIuTlhtDO8T+4QF/K+/N3AE84CpCbye0qSmjIzWvQEaXL7EkvQNG/zMq
 EIBpID7pR7PC/GHIW4NjQfIprWhXaDzGWuLz8RCK5UJn3ne0y3hR8hTMxEY1qesmERB1Yyu80Go
 X95QFijyBdO8VdA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032712_987796_49B8CFAD 
X-CRM114-Status: GOOD (  17.44  )
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

Add documentation explaining the ability to capture statistics from
the mali-c55 driver's new V4L2 device, as well as the various tap
points from which those statistics can be drawn in the ISP's
processing flow. Additionally add a page detailing the new V4L2
meta format for the mali-c55 statistics.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- New patch
---
 Documentation/admin-guide/media/mali-c55.rst       | 60 +++++++++++++++++++++-
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/metafmt-arm-mali-c55.rst             | 29 +++++++++++
 MAINTAINERS                                        |  1 +
 4 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
index 72cdded507b3a7918e28d9bd9a1c6f72ddf9e664..7eaeac63ddf713730fac266d81866539310cc7e2 100644
--- a/Documentation/admin-guide/media/mali-c55.rst
+++ b/Documentation/admin-guide/media/mali-c55.rst
@@ -67,10 +67,11 @@ The driver has 4 V4L2 subdevices:
 - `mali_c55 resizer fr`: The Full-Resolution pipe resizer
 - `mali_c55 resizer ds`: The Downscale pipe resizer
 
-The driver has 2 V4L2 video devices:
+The driver has 3 V4L2 video devices:
 
 - `mali-c55 fr`: The full-resolution pipe's capture device
 - `mali-c55 ds`: The downscale pipe's capture device
+- `mali-c55 3a stats`: The 3A statistics capture device
 
 Frame sequences are synchronised across to two capture devices, meaning if one
 pipe is started later than the other the sequence numbers returned in its
@@ -333,6 +334,63 @@ configured, followed by formats in the appropriate places:
     # Set format on the video device and stream
     yavta -f RGB565 -s 1920x1080 -c10 /dev/video0
 
+.. _mali-c55-3a-stats:
+
+Capturing ISP Statistics
+========================
+
+The ISP is capable of producing statistics for consumption by image processing
+algorithms running in userspace. These statistics can be captured by queueing
+buffers to the `mali-c55 3a stats` V4L2 Device whilst the ISP is streaming. Only
+the :ref:`V4L2_META_FMT_MALI_C55_STATS <v4l2-meta-fmt-mali-c55-3a-stats>`
+format is supported, so no format-setting need be done:
+
+.. code-block:: none
+
+    # We assume the media graph has been configured to support RGB565 capture
+    # from the mali-c55 fr V4L2 Device, which is at /dev/video0. The statistics
+    # V4L2 device is at /dev/video3
+
+    yavta -f RGB565 -s 1920x1080 -c32 /dev/video0 && \
+    yavta -c10 -F /dev/video3
+
+The layout of the buffer is described by :c:type:`mali_c55_stats_buffer`,
+but broadly statistics are generated to support three image processing
+algorithms; AEXP (Auto-Exposure), AWB (Auto-White Balance) and AF (Auto-Focus).
+These stats can be drawn from various places in the Mali C55 ISP pipeline, known
+as "tap points". This high-level block diagram is intended to explain where in
+the processing flow the statistics can be drawn from::
+
+                  +--> AEXP-2            +----> AEXP-1          +--> AF-0
+                  |                      +----> AF-1            |
+                  |                      |                      |
+      +---------+ |   +--------------+   |   +--------------+   |
+      |  Input  +-+-->+ Digital Gain +---+-->+ Black Level  +---+---+
+      +---------+     +--------------+       +--------------+       |
+  +-----------------------------------------------------------------+
+  |
+  |   +--------------+ +---------+       +----------------+
+  +-->| Sinter Noise +-+  White  +--+--->|  Lens Shading  +--+---------------+
+      |   Reduction  | | Balance |  |    |                |  |               |
+      +--------------+ +---------+  |    +----------------+  |               |
+                                    +---> AEXP-0 (A)         +--> AEXP-0 (B) |
+  +--------------------------------------------------------------------------+
+  |
+  |   +----------------+      +--------------+  +----------------+
+  +-->|  Tone mapping  +-+--->| Demosaicing  +->+ Purple Fringe  +-+-----------+
+      |                | |    +--------------+  |   Correction   | |           |
+      +----------------+ +-> AEXP-IRIDIX        +----------------+ +---> AWB-0 |
+  +----------------------------------------------------------------------------+
+  |                    +-------------+        +-------------+
+  +------------------->|   Colour    +---+--->|    Output   |
+                       | Correction  |   |    |  Pipelines  |
+                       +-------------+   |    +-------------+
+                                         +-->  AWB-1
+
+At present all statistics are drawn from the 0th tap point for each algorithm;
+I.E. AEXP statistics from AEXP-0 (A), AWB statistics from AWB-0 and AF
+statistics from AF-0. In the future this will be configurable.
+
 References
 ==========
 .. [1] https://git.linuxtv.org/v4l-utils.git/
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..644eb04dc736e6ba219eee81c510834b13df0bfd 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
 .. toctree::
     :maxdepth: 1
 
+    metafmt-arm-mali-c55
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
new file mode 100644
index 0000000000000000000000000000000000000000..186e0deb9ece70ab1d2b22bb5ccb69196264a793
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-mali-c55-3a-stats:
+
+*************************************
+V4L2_META_FMT_MALI_C55_STATS ('C55S')
+*************************************
+
+3A Statistics
+=============
+
+The ISP device collects different statistics over an input bayer frame. Those
+statistics can be obtained by userspace from the
+:ref:`mali-c55 3a stats <mali-c55-3a-stats>` metadata capture video node, using
+the :c:type:`v4l2_meta_format` interface. The buffer contains a single instance
+of the C structure :c:type:`mali_c55_stats_buffer` defined in
+``mali-c55-config.h``, so the structure can be obtained from the buffer by:
+
+.. code-block:: C
+
+	struct mali_c55_stats_buffer *stats =
+		(struct mali_c55_stats_buffer *)buf;
+
+For details of the statistics see :c:type:`mali_c55_stats_buffer`.
+
+Arm Mali-C55 uAPI data types
+============================
+
+.. kernel-doc:: include/uapi/linux/media/arm/mali-c55-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index af4dce215fd3bd22de09c41c9469c3bf69609bd7..e82123e5d5ee961ac58148f90716e04876e36077 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2038,6 +2038,7 @@ F:	Documentation/admin-guide/media/mali-c55-graph.dot
 F:	Documentation/admin-guide/media/mali-c55.rst
 F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
 F:	Documentation/userspace-api/media/drivers/mali-c55.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
 F:	drivers/media/platform/arm/mali-c55/
 F:	include/uapi/linux/media/arm/mali-c55-config.h
 

-- 
2.34.1


