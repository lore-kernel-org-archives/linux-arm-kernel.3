Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCB0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxAh9AdG88krGLebvRceq1+PxJtP7ItkbnxQ2hjVQgA=; b=O1Upw1Bl2ttlp4POc8TL72nD4B
	uI82ssJxNaYTN2/JsfmY93GZ86xp5WfltM46vPy1O9eNZ4sUAIp0RVJtCSA6LIaOwKO3HsHdGgXYk
	6kY519fkH461OesWvijIfObUsi2lrRD73EWXxDDUhYYIdmSQug4sVoynodMigDfE4Ey3AQwlREKZz
	qdRKBQO5zsbOmDIDN1jlvCwgG0XhbdzNtBSxIjFJ6w8Aenyu9UW8UVFjJ7XwdLQMayQTPYd0KGube
	ocP/32KO5aUwII0wSxSJlyZs7ors20oZcEM9exUMaecIr8s2UgfOKG7peTq79e/4CS/GEjsroMDPH
	8KgMLDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLOt-00000002kTf-3ji4;
	Mon, 14 Jul 2025 15:47:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKlW-00000002YtD-0KmD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:06:51 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08E1D54D6;
	Mon, 14 Jul 2025 17:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505576;
	bh=ZQUU3jmSUSxgVvqdoecsQN8+9VxXx//7OqvGkQ/kxQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G4zDsRhJCN36zqAJO0GrlJhafhdAheyt9cnJRc/OURWIOmiRfF8+2gYuqf0PDLpfa
	 RiU005ab5D3A+25M9ngJuqs0WnPqlcpz+cnDwj5wa+jc+KbOZXXVECi+vduDWLEEWJ
	 WKILUgRgISOD+sFGR8V0G9QMqYvoMw4eNyOMgRcM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:31 +0100
Subject: [PATCH v11 05/19] media: v4l2-common: Add RAW16 format info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-5-bc20e460e42a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ZQUU3jmSUSxgVvqdoecsQN8+9VxXx//7OqvGkQ/kxQM=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0ATXqKOp14Gy2P1Ty5prBhhCaixe3I98kao
 sDa3g+movKJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAAAKCRDISVd6bEV1
 Mk0TEACTvdzYRIzFxdEW6Jzv9lGJKwo/iZEy6qIsGu/m2lzNWd/b+RonJYhIgP9xyLKwBNTEQ1k
 apREeOxM2GWlYUsctz2B9+y/XOUZlIv58GooqQxq8LfqifMJ57RyDaW3tXH6iX5y/swA0vDhw1X
 ak9dbyfH+3RZvKWFrW9j5dRT7PlF0v3wM/500GKkvsV9OmTy7dRVTiqP9JqqU/Ptj8WgKmRzinp
 4zEN40c/+CE1DwEFELD/O18/5RdhA4dYaRtrb1gNO5Oo/cuds8IvSYHMUoSZC34N7fFKN+eC44L
 g4EdJHQf0Jd0wMY6FjDfDlG5Oun8oxEV4qM5zkdIg0xKb7uhykZlSdGVYEFGYWiB7lytVnn2ZQA
 n+aakoYDVjc8MAigHbE1ya6drncFllxI7kF3nTKvg6W5EoP79MESn9rm2WxYLYHTNcRg6YqShse
 bvnI+4poZXKN28OgHawltoLgXUZNFg/AeOJCtlILxK1iDz8XfH0TLICBc4wlf2xNVpZAW/+ceGR
 Q+aKZQXl6yeDA0aCUiFkzYJVNDtv4paQEyFGJh3ipq5/RJtPeUEsP1QWI1DE/336MY1fPk9AJSc
 IbVi4wwRd/zYgNCcZm7UalJIgVGQr08lgZhy8q03kBzBmCoyCrU2Gps7wGtGKYZ4xATU8NGc9HS
 czFDN6vvofK1bog==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080650_270106_2D459439 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

Add entries to v4l2_format_info describing the 16-bit bayer
formats so that they can be used in drivers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 drivers/media/v4l2-core/v4l2-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index df40756ac8f6c5103d61cd1d4b2ff99b8fbab641..5bac5d45c5ad19f2e76eda127338409d400d5aca 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -344,6 +344,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SBGGR16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
 		{ .format = V4L2_PIX_FMT_RAW_CRU10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },

-- 
2.34.1


