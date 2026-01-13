Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9891D29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4nOACyKniDCko+WOiNcrPVMT7mzrZwXyg7N59fHkP4=; b=QCPyNAiEUj7KYc5MIkKFxem5zR
	O7IgzwMz52T5ZhwJENUttZr4Km6CYVhdUkNcgp56q1ZoG5yNIRgpiurLdN4twNbXVUmwPzkgsqpl8
	hHQMbmVNGU7TXFmbv9xgLR1vcqXyp07utsRWcl50KNZWDV2xy9efhEywyWboZUaTZLg+J3r9P/acG
	fxxnuMIIxS5JcODDvvzyLXXdR1qSVK19rjIzOC/Iv1fgukBX/mikUMFRzskBKs9dM9P2OsPqZn9jY
	VxxFr9fUNwsON2kjUw1W++e3l3dBeKorr2BB0YWl9uTH7BJeIrkK+x9NN5UXZagC2I5g9FCqHAM/i
	7tX1MxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaWU-00000006pPH-2oML;
	Tue, 13 Jan 2026 09:17:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaWO-00000006pNT-3wJw;
	Tue, 13 Jan 2026 09:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E4nOACyKniDCko+WOiNcrPVMT7mzrZwXyg7N59fHkP4=; b=NFmPR2ca4j2FiQP36+R0sitmEm
	fnySilbqEkYUbzEo0p68lyUDGoya+nFjIVQTWOBFoo5ErGn11v64FevGx4IN0KbiGHvW+3ZMcImdn
	R/zesB/CLej6mg0rNeh0PkhnzcFtOk6IRkVVqcvEOTax+LsPTXi50qk4vPKxeW9uWYgKNr7wqKE4R
	Qx1eVTj4o9YWcbAfPGw1bf45Ap3qiN2mZ10Zpr7fnGQxD/I5+A2oKLw10uXuxATz0uyBEFf9vshxB
	N9BRywxW9Gmaet29pZKCPgPWJihqWabQzSNTnqp97koEbagGorXI129FmXaQFxVZBnZw8eWLi7sdw
	NS1Qvllg==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaWL-00000002Qg3-2qyq;
	Tue, 13 Jan 2026 09:17:03 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C9782E0;
	Tue, 13 Jan 2026 10:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295258;
	bh=scL/K3QjQ0/H8hzHNz3K8wFS/aDLqPs9oUM5JEDk+U0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cTaPW2xoYQ4h5xOnBjzYVUmUJb4IVh6FOI8IM3fLIYHhJd82dXanhXjICfLquJlo3
	 paVsa9/Nq1nryRY7dG7dWswGq6JK2J3YeJsDjamWLlJHysym4Hp7PIYkSq0YkCr1ZJ
	 ZtwqTVuu0o/pfWBeoN/EwPMfAxXNcDqHUUNiL/0Q=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:26 +0530
Subject: [PATCH 06/10] media: uapi: v4l-ctrls: Add CID base for the
 bcm2835-isp driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-b4-vchiq-isp-v1-6-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6622;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Qsff1fosFHVeYD4/9z9e94GrIj8Lgf4vkb1cJ2u5WKg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtIzdm1gUEigeQFe+BcXCORRzU8+DahGs3gd
 JaWTil7DFWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLSAAKCRBD3pH5JJpx
 RYsRD/98jYJeNK7BRqmchxTCfVwgwqvWoibpuwHHIEFmzC60E8mv8uBq2S583KeSFuG0NzOYQCM
 zpgaco9lJBc0r7Fco42l34e+X1N81nj51hYCtAG0NmdV7BchJO5dulT8LY6BgNS5O8L4kqstYr1
 jek+DKhfyxP9AvXYst511XFCJDP3UtpLB9/3ON8GSyftBG1/+iSBaz7ChGz+/3fp34buStEjihi
 QixenlA6J2LsNnuLqiBIeFwIOMW0xn5Oyp6uztnwW0jJmwcPNI/xiy3PTEns+t8SMNkYZyxnsiH
 3L59toZKrwUizoD2dpQdsoiKoWJ+R/Avio/HZzUZ6l93XeWj3RDIXb+hTkAXcgu0NdfVFEfdE1g
 710qhRlmkzmT3fEpEK22QXC5RsEcU8t287WQkEPYIOzq33QlBpfcX+WQfdLJlcOBVs7AJZDiJ6J
 ej7Q5gVApgmCi4zz5JVzfoqhq+VpKfjlLwDSQWvurR1GgEdNec5qA/RV092mBEcapIUHOeONCmq
 fCOmlFDcM6YN/htCai4Gz9SSQcmy5m0llfKZbrp4LX1GbOKK3ALd59y+FnE0mLDePUjI+/DeDkI
 yKSHMhlS+SJZzdnLzlDtOZbHJOAMSx0V0ror4wZYPb1AE0stwXvL1gTccbM+p0jjtWK8fbq8WJ8
 K6tK8E03cpeHiVw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_091701_883599_3BDD52D8 
X-CRM114-Status: GOOD (  16.03  )
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

From: Naushir Patuck <naush@raspberrypi.com>

We are reserving controls for the new bcm2835-isp driver.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 Documentation/admin-guide/media/bcm2835-isp.rst    | 127 +++++++++++++++++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 include/uapi/linux/v4l2-controls.h                 |   6 +
 3 files changed, 134 insertions(+)

diff --git a/Documentation/admin-guide/media/bcm2835-isp.rst b/Documentation/admin-guide/media/bcm2835-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..e1c19f78435e6b14d051607b6a8b0d4f442f0314
--- /dev/null
+++ b/Documentation/admin-guide/media/bcm2835-isp.rst
@@ -0,0 +1,127 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+BCM2835 ISP Driver
+==================
+
+Introduction
+------------
+
+The BCM2835 Image Sensor Pipeline (ISP) is a fixed function hardware pipeline
+for performing image processing operations.  Images are fed to the input
+of the ISP through memory frame buffers.  These images may be in various YUV,
+RGB, or Bayer formats.  A typical use case would have Bayer images obtained from
+an image sensor by the BCM2835 Unicam peripheral, written to a memory
+frame buffer, and finally fed into the input of the ISP.  Two concurrent output
+images may be generated in YUV or RGB format at different resolutions.
+Statistics output is also generated for Bayer input images.
+
+The bcm2835-isp driver exposes the following media pads as V4L2 device nodes:
+
+.. tabularcolumns:: |l|l|l|l|
+
+.. cssclass: longtable
+
+.. flat-table::
+
+    * - *Pad*
+      - *Direction*
+      - *Purpose*
+      - *Formats*
+
+    * - "bcm2835-isp0-output0"
+      - sink
+      - Accepts Bayer, RGB or YUV format frame buffers as input to the ISP HW
+        pipeline.
+      - :ref:`RAW8 <V4L2-PIX-FMT-SRGGB8>`,
+        :ref:`RAW10P <V4L2-PIX-FMT-SRGGB10P>`,
+        :ref:`RAW12P <V4L2-PIX-FMT-SRGGB12P>`,
+        :ref:`RAW14P <V4L2-PIX-FMT-SRGGB14P>`,
+        :ref:`RAW16 <V4L2-PIX-FMT-SRGGB16>`,
+        :ref:`RGB24/BGR24 <V4L2-PIX-FMT-RGB24>`,
+        :ref:`YUYV <V4L2-PIX-FMT-YUYV>`,
+        :ref:`YVYU <V4L2-PIX-FMT-YVYU>`,
+        :ref:`UYVY <V4L2-PIX-FMT-UYVY>`,
+        :ref:`VYUY <V4L2-PIX-FMT-VYUY>`,
+        :ref:`YUV420/YVU420 <V4L2-PIX-FMT-YUV420>`
+
+    * - "bcm2835-isp0-capture1"
+      - source
+      - High resolution YUV or RGB processed output from the ISP.
+      - :ref:`RGB565 <V4L2-PIX-FMT-RGB565>`,
+        :ref:`RGB24/BGR24 <V4L2-PIX-FMT-RGB24>`,
+        :ref:`ABGR32 <V4L2-PIX-FMT-ABGR32>`,
+        :ref:`YUYV <V4L2-PIX-FMT-YUYV>`,
+        :ref:`YVYU <V4L2-PIX-FMT-YVYU>`,
+        :ref:`UYVY <V4L2-PIX-FMT-UYVY>`,
+        :ref:`VYUY <V4L2-PIX-FMT-VYUY>`.
+        :ref:`YUV420/YVU420 <V4L2-PIX-FMT-YUV420>`,
+        :ref:`NV12/NV21 <V4L2-PIX-FMT-NV12>`,
+
+    * - "bcm2835-isp0-capture2"
+      - source
+      - Low resolution YUV processed output from the ISP. The output of
+        this pad cannot have a resolution larger than the "bcm2835-isp0-capture1" pad in any dimension.
+      - :ref:`YUYV <V4L2-PIX-FMT-YUYV>`,
+        :ref:`YVYU <V4L2-PIX-FMT-YVYU>`,
+        :ref:`UYVY <V4L2-PIX-FMT-UYVY>`,
+        :ref:`VYUY <V4L2-PIX-FMT-VYUY>`.
+        :ref:`YUV420/YVU420 <V4L2-PIX-FMT-YUV420>`,
+        :ref:`NV12/NV21 <V4L2-PIX-FMT-NV12>`,
+
+    * - "bcm2835-isp0-capture1"
+      - source
+      - Image statistics calculated from the input image provided on the
+        "bcm2835-isp0-output0" pad.  Statistics are only available for Bayer
+        format input images.
+      - :ref:`v4l2-meta-fmt-bcm2835-isp-stats`.
+
+Pipeline Configuration
+----------------------
+
+The ISP pipeline can be configure through user-space by calling
+:ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` on the “bcm2835-isp0-output0”
+node with the appropriate parameters as shown in the table below.
+
+.. tabularcolumns:: |p{2cm}|p{5.0cm}|
+
+.. cssclass: longtable
+
+.. flat-table::
+
+    * - *id*
+      - *Parameter*
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_CC_MATRIX``
+      - struct :c:type:`bcm2835_isp_custom_ccm`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_LENS_SHADING``
+      - struct :c:type:`bcm2835_isp_lens_shading`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL``
+      - struct :c:type:`bcm2835_isp_black_level`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_GEQ``
+      - struct :c:type:`bcm2835_isp_geq`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_GAMMA``
+      - struct :c:type:`bcm2835_isp_gamma`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_DENOISE``
+      - struct :c:type:`bcm2835_isp_denoise`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_SHARPEN``
+      - struct :c:type:`bcm2835_isp_sharpen`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_DPC``
+      - struct :c:type:`bcm2835_isp_dpc`
+
+++++++++++++++++++++++++
+Configuration Parameters
+++++++++++++++++++++++++
+
+.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
+   :functions: bcm2835_isp_rational bcm2835_isp_ccm bcm2835_isp_custom_ccm
+                bcm2835_isp_gain_format bcm2835_isp_lens_shading
+                bcm2835_isp_black_level bcm2835_isp_geq bcm2835_isp_gamma
+                bcm2835_isp_denoise bcm2835_isp_sharpen
+                bcm2835_isp_dpc_mode bcm2835_isp_dpc
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 02967c9b18d6e90f414ccc1329c09bffee895e68..c4166be86ae9fff896b1094c59c049ba07b0f0a2 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -27,6 +27,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	:numbered:
 
 	aspeed-video
+	bcm2835-isp
 	camera-sensor
 	ccs
 	cx2341x-uapi
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5..ef0b3116314b20f394db85854b770a792366869d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for the bcm2835-isp driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_BCM2835_ISP_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.52.0


