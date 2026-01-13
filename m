Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB8DD29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ1hoFZXyU6BZ5oabn0l+rj1sPSKhOPz8oxSSQnew28=; b=01vy2UdwtVbbQ5bedZcDiYDly2
	T/fta3EVdQCcz+pi6lJJThCoP38ngmvLFN4cZVccAQQ8Fx3s0c5U45SOX+/BWjREzQdvycCcz3zF0
	riPA8vor5dKhCP4yrUT/GcfERd7MBQzNglfT+EO7BKQQpgasQuejnpcaYcZJ7S76Lr2xVvKSX4OOd
	WOY1GV0cTvH981b0RQbK+JldeD+URm1owhR2Z/aSS+ndcdk50o2iQVDQ8eHNGREIrzMUJViCztcOx
	GqaNSYT+3GKm/g4O5L23Lo3AvKlO+/h7Wj1snL7lxP9w8CqhE7S67Bj4kXNQdWlm9wpiWXXGH+5jO
	HedCROzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNp-00000006oB1-0Zme;
	Tue, 13 Jan 2026 09:08:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNm-00000006o8E-2RZf;
	Tue, 13 Jan 2026 09:08:11 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9B4B316;
	Tue, 13 Jan 2026 10:07:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295263;
	bh=kyfIWiZKsIFqoHeQCFtMxJTG9Er3B3wsG9OKJw8XEeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LjjQuPF4NLsPuuoY7GzWIM7Bzw1t/bZc/EsbOfU76mbFQ7C9z9YWAwDpaswSGN3tW
	 MPbfyYccAsHXSJYtl1v42bRI3L6XFt9Pao0jwwkIwyYF4Gsxc7H+OCnLhO6iqTzcDS
	 P3qLmkAixYY3URLmzaZH3rnpzs5yWFQKynY5pYpw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:27 +0530
Subject: [PATCH 07/10] media: uapi: v4l2-core: Add ISP statistics output
 V4L2 fourcc type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-7-ea0b300bffc8@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4266;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Z+stu8A+Ltko3z//8/Zz66mt7iixZehU8eSefkNFPwg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtJOwtmrwy2Ha8asPz2z/UDSL9rd86LL6ekn
 G/CH4HNj1qJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLSQAKCRBD3pH5JJpx
 RXjFD/0UXPxitRefjxzA74sEwsQDmf2VOIQVX7tBlBPirPuvIm1aZ578ExWYni2ySYMwJ/BLmCo
 QioENHDb+/BCogmK/7efVyDZ+DtZXOtjOlv5WfjCDvqdnPB7GPDWURjlLfnKTpzGzQi2ulF9qnM
 MUDVVaHwzKKAWDnhysU0J/3OijePLV4BW4wDJP7i7afCIjjH5tkiW2xcr5KzWCuCR81Jl1SD5sd
 V/+Lizv+C1nUvDlX/pMI2wGDX98uaxbNZldOa4tcJe9zm4ssGyCGQmPx95UjJ6v5WCnKEy+E4fT
 ccXE1E/B4LVcIUFMqJTyxBsP8Ngd72KTWim5BWSo1ZwyWhY9rmHpORXQkIDZELDVDuWhS47OSx/
 PjCaVNv1KlObw2nIo5LplmMUqfUFzU2hwKWAU06kciirWxY/ulzyKc3uZ8taJ760ORU44RhEvW9
 SCb+wR/1vcpGzxkeP6PFAe3ZW6JTfxtshDL0qHtGLEv6LuHk2kFBObv5aTuZnyuIsGPwDa5Cky9
 2RmMVhH7CIaNukF0zhsF74xjL3dITbIRhUr5tQskJwZ0E102ljUEwhFInqb3s2M+hMJsEEcxd0L
 4UiZerkJPmbyXLvU/PPlkUEpm330GPTnjujOJ6AL7te66sWIXJ4igGw3LShTwLwT1RV9Z4wTd/h
 Pv2IQ3DHB7jJdiw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010810_766864_066E2EDA 
X-CRM114-Status: GOOD (  14.05  )
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

Add V4L2_META_FMT_BCM2835_ISP_STATS V4L2 format type.

This new format will be used by the BCM2835 ISP device to return
out ISP statistics for 3A.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/pixfmt-meta-bcm2835-isp-stats.rst    | 35 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 4 files changed, 38 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0ac5e6d76696c5b78eebb0db43b354..be3f20f0e68fd225274428b4a712275654bf539c 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interface only.
     :maxdepth: 1
 
     metafmt-arm-mali-c55
+    metafmt-bcm2835-isp-stats
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
new file mode 100644
index 0000000000000000000000000000000000000000..d5d71f3ae752a41b86f755c24b487c7cfadfac4b
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _v4l2-meta-fmt-bcm2835-isp-stats:
+
+*****************************************
+V4L2_META_FMT_BCM2835_ISP_STATS  ('BSTA')
+*****************************************
+
+BCM2835 ISP Statistics
+
+Description
+===========
+
+The BCM2835 ISP hardware calculate image statistics for an input Bayer frame.
+These statistics are obtained from the "bcm2835-isp0-capture3" device node
+using the :c:type:`v4l2_meta_format` interface. They are formatted as described
+by the :c:type:`bcm2835_isp_stats` structure below.
+
+.. code-block:: c
+
+	#define DEFAULT_AWB_REGIONS_X 16
+	#define DEFAULT_AWB_REGIONS_Y 12
+
+	#define NUM_HISTOGRAMS 2
+	#define NUM_HISTOGRAM_BINS 128
+	#define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_Y)
+	#define FLOATING_REGIONS 16
+	#define AGC_REGIONS 16
+	#define FOCUS_REGIONS 12
+
+.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
+   :functions: bcm2835_isp_stats_hist bcm2835_isp_stats_region
+	             bcm2835_isp_stats_focus bcm2835_isp_stats
+
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..30bfa35ae9f5119dd89251716e4da45e88d30aa9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1488,6 +1488,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
+	case V4L2_META_FMT_BCM2835_ISP_STATS: descr = "BCM2835 ISP Image Statistics"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..b0dff5e124d7eaab933e57909b8421c475de1da3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -869,6 +869,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
 #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
+#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A') /* BCM2835 ISP image statistics output */
 
 /* Vendor specific - used for RK_ISP1 camera sub-system */
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */

-- 
2.52.0


