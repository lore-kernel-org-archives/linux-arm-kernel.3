Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7B7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv8Mw3+8eU9cV2HlyQpIxLb2e9yEdl8sDUp0kPrZKwI=; b=IvAhVr0Q69L40SFbrUTwzkptyR
	oC6QhIB0rBA2mVNILMSbIm5ziIa1B14zyG9u+6cpT3X4XYefZftNgxcML415jJMPShTd8faK2FhpL
	IFn1ZNs61QvdKd452joKAVN8ThQqUDLP9LZsDQeucCKu4gAIwDdi1HvSbSTG39I+/jV/yUXBNwmi6
	LOka7DMKKVpUEDG3DRSS+2ntbK+6ERllU+/3FlKPBWY0QE8SjZflIjQUxurRDGiey3LoNX8vVstvY
	4R7aRaDahEQpREi5ThIbuiMRl1ac036QtqR1vQyAsvlN26744kiGYK/eCm6KmhYdTGyUUlmFF7a89
	NOytR1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr2g-00000007RZm-3DOQ;
	Tue, 11 Nov 2025 16:16:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr2V-00000007RNr-02iR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:16:15 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3AA71FDD;
	Tue, 11 Nov 2025 17:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762877654;
	bh=CzpGklnvEveNZ32xlH2FueSqnRlwcvM0qaALq3kE6Bg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bz/XQmR4jBFY5o8BxLvHHqWxEjHzAdpy6ynjtGirqSwJ1cd1dIzEMjvI44CERKPsO
	 GiWhm3KzgXFDkcW+Qtwi5uh2MVVgF53yeXQk6DyDB8V714pnlu/PIogYykdIw4jJnw
	 xbg4NEL5QEPOrvA+HWeKmsuNYbbmTlqAzKXAJ5pQ=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 11 Nov 2025 16:15:52 +0000
Subject: [PATCH v13 08/15] media: Add MALI_C55_3A_STATS meta format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-c55-v13-8-3dc581355e3a@ideasonboard.com>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
In-Reply-To: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2544;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=CzpGklnvEveNZ32xlH2FueSqnRlwcvM0qaALq3kE6Bg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpE2FDSkkt+cJhumgIEYCfySm74dPPoHtJUj068
 fYrqYc4r3qJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaRNhQwAKCRDISVd6bEV1
 MpkvD/43vGsqYxOOsFbScihNbXpQNFocr5e55pZ9nD+48/p8xOTFVz2Q35K4n6bHBKOZqlmbuBY
 ChqhAeDe6qD8JsutWA6LoRTQ5czKjgZR2LTXc+kSGpuJ9J1PK2rGX9eOJI4ESdUXGRPRIWy0Inl
 rjbXIOAMpPU5KfZ3g4n1Hvecg9EAfp0KZO9R12axSiHUcGSnL23eI7IQhvkOcta39R2UB6TDw+z
 /mHj/AT5P4lodvwhD+NItP1SXaSU2LiWpXQLnCFwnhRmOhaWf+xBC6DcxuLd4Bil5rp+Mhnn9sm
 HAZHf8352U/d+ri3qaUie/8Ff6frbye0RaHSnqG/r3uxjrPKJdagRC8l55wJGdz3Y6v6w6khG8o
 CxU/QHkVMDKu25IFBcJuUo2GkNT0nuvXZa6mlCssksN+4Eot6+tw5Q3PQbtVrKgl9cTE3E7z3WZ
 4Bvtn3kQLZtMJwikCUCnQ5nz2VLqKxwFWyRBS6yPQ/Dufmoc923h4DU1DesGFKpDo3ZjL5a/yR+
 TXzlhI1KuEdH3l5mEZPnACusc2f54jqmYgieqPo4ZjiOM0rTXNOBa1XJ4nNHmrt9+jtfG8IpBf0
 iL0GYeZ4mQoXIrCo9pW7VjCmrVOTKYYUZKNAWcVguWLer//cIQlX8yoxZeM9/wP6KZ3ZMfZ14Bx
 JVH4JUG2hxJQ9Rw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_081615_194131_521F00A7 
X-CRM114-Status: GOOD (  11.37  )
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

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v12:

        - None

Changes in v11:

        - None

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
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bfab29938b8f43f3224e4bc794c21eb5b6e368a2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1469,6 +1469,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cba4b131166773ae0d52c00de6e1c304bd08573a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -884,6 +884,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
+/* Vendor specific - used for Arm Mali-C55 ISP */
+#define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.43.0


