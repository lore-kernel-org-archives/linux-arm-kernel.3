Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A50BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0J6rhU+ML1cXJ50GWJsc/i/idO7Q3cBKYjpE/H95koo=; b=aN3BiKfgSWhqFQYhJB+1qxa37p
	DJCGwvCSIVC8JaophnE3T5MB4x2ncNWfDyIDElnY2nirp8sNkz3lqkJuKwsKvQdXu0/OPBL0dwqY4
	jQ+QdeaSckZiTyuEVXhwy+V2o8nMijThTcn3STMgia0CqZQx6N8VPnNT2I9E6R75UnMCTmzqZJo1K
	mIciB9H7VIq30rqHUzHdvVY3+qif9vsvmD2BHTyUKRjGQArqrP7HtUr9ObF+XQji385MoYYThgst5
	OtzO43qH59RG6PU8JIxcw5yWsiy0OsoQuWZa2hGCGhSWL5/xFlSSGak6XYBJMQumJwcSIAGq/DHi1
	vLWPYxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLfs-00000002mzD-0f6W;
	Mon, 14 Jul 2025 16:05:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKlZ-00000002YwW-43jm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:06:56 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A82B31B24;
	Mon, 14 Jul 2025 17:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505581;
	bh=PxvqmiYbPz70hs/qoH9Iut4e6C/h17us0NlLYFupJ/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v/GfC6XBLD6nq1bXFY1NoL+Yc+1uR3YPRhJp+/BYpIjdGZkO8cIm0clxqcI/4XDn/
	 sZfidNBpBPj4B1mm9737f6RPZONcxyOZ63mXZVcnLDJO77IotXWXiKBkZMifDYV7b9
	 oCcKYg1bSTbxLKx9ig+T3dt1OHRLIaUMvIcU3QyU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:38 +0100
Subject: [PATCH v11 12/19] media: Add MALI_C55_3A_STATS meta format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-12-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=PxvqmiYbPz70hs/qoH9Iut4e6C/h17us0NlLYFupJ/c=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0CCHK9aZk2SI0RcgV/0tuTxD/+qI18F0XxJ
 9d57YU8/PGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAgAKCRDISVd6bEV1
 Mhn2D/9MMhEpgwq4bOTYhFBhlDQ1lfLzkA3iu+Gqn9rKhXDeqbRJe86C2B/CWTdcfur+G+DRPLw
 YONqHqDPIACRqY7PUlQefpme984cyATyfiqUPC3qtWEv1xSGhL9lc/DgSkL8BvewP3RneIh1k+F
 ayS/dzShlgCi1KVNyr7TZUagl1PmxGutMNn6XFDR0/3HjrHweeaALhgAOFq/82tX8zMWFBTPXUL
 C5ZKUzvBYyyge+iF5qSyfq7iDfBdfUeNIOf3CXHsZVuvMkkHa/ZD7FVLFGonypggnYMIKdxqhX3
 aE6u4A0UerlCYDZ1qlzxAFhmk0xcnnNnmde55mWoEoj6xJkeSZcHxxMqG60K4IaStC23aT6Hxtj
 xFZlJ7rB+vj0jSwUtzqIo2MQnEAajmxsu2zhMjK06WK+TjaMp3rpEvD+4gz03RpPFAU4B6bL0Jz
 DBBfKjFm/FxxFieFiC7STmpnGkfpKHmHMzIhvwKqqTOSgwwZoHNLS/s3mdAalDZroj2KBgImdRC
 SyX7fP9VcKIPvlVE/isJlj/u2g/s6dcJEdqfXLpLo2L2+rjbrjxFLsIb0vZOoec+VEAstBybVJx
 xC98DuRQ4uhO3j9mhXDtSkn1Vsa+jmK5TXhuTYRSZ3oGjfxB1FRbgL5GW/rzCL4gKf3/oC5lCP8
 q6ES1U6jCIbNXdQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080654_179613_30647764 
X-CRM114-Status: GOOD (  10.29  )
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

Add a new meta format for the Mali-C55 ISP's 3A Statistics along
with a new descriptor entry.

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

	- New patch

Changes in v5:

	- New patch
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index be94a79b976e3de4eb957f5d2584ec6d4230469e..d2e7d6b115b53980fef959cbd9c8e758819d20e9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..752d4d6ae5ca4ca924dd8a58aed6c4af3304879e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -883,6 +883,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
+/* Vendor specific - used for Arm Mali-C55 ISP */
+#define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1


