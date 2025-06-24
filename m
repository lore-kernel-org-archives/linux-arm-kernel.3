Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958CAC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQw3WkWawU+2pCVDukSqZhpLf5dPpOCPoTPhqaXxqcE=; b=I9FbGyBmf5p5FbCKPmp/nYU5WN
	kXIfpoH+BRwcVDS/ovITXNnh8vGtC+Er0Al33PAYqoFag0XmbznkQN+uMbfXTpVJCOeXQdTPLvc8W
	yFb7tAcyjCi/zGYh74BpthsUmX7TCJ2OH4i40BDqQyHp9z64kIpfJAF8cuLgB8D7kEmyFGi1/ZpqM
	DW7YYtI/8OX3pjGqUVbx0EwliGMAFrEjpWy7qXUDDJVPOfChIN3nPESCwKgQkN7MikWDvQ/1Oig/E
	WoDyzhAzU9hnu59BoZAw+yDw4EMV4fxRKOuS183Td+9yOLy7IzPRpmaEA2LYcnTCOFku5+JHYrHMf
	chZIH6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0vF-00000005JSO-1A8s;
	Tue, 24 Jun 2025 10:30:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0mY-00000005HxV-1wkv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:21:40 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 622B51648;
	Tue, 24 Jun 2025 12:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760476;
	bh=CtrA02D0TrXi2G+EYcSXTmlf7VKeqz+VdclJGy+0hzo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OGu3v6CLcpAiyA+yrI7PXqMW6eHoDaEqRLJyU9CUKNwUPAQO3rKxjrP00hSTgAuLF
	 tH6LnXcb75YQSdkbXtJynPUg0SZaE1vkLg71KtV0v+wAME6MUCsWHh5McDv7dTJMuB
	 de58E5sWt6rk/XTKAgRFgW7Gni9MSn10Eb8FsdSs=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:17 +0100
Subject: [PATCH v10 04/17] media: v4l2-common: Add RAW14 format info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-4-54f3d4196990@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=CtrA02D0TrXi2G+EYcSXTmlf7VKeqz+VdclJGy+0hzo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwnrvVDJ7NhkS1kztl9nrE+JR3s3OUFxq4Ik
 +q+Py8sI0uJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JwAKCRDISVd6bEV1
 MkuxEACQYNGPHffbsljumWxzoTwJ+M+DNdXha2wYfWJgPobugV4Ef7Mx4rKStztIOqaAG2NMxk6
 mm/AAQrt0sISynArKEV4D4otNPIDIDDpaRNiatjhSAGviEVsLHfT2jwh1qJDc7Ac290pulLtZQZ
 CxF/Kb6nFNdBphdL3MiAp8Dhp/IgENZLE0V7MDyo7t7J3QGnc6O23kB1akAWvCb/7V2frNwBqAs
 tAShT8vxEGCQL8MRGgS3kBm1qp7lvmkKtKn7mK0y+WlC+IZQp3Wd+GRwSxleC9OYBTZyNsvnvqH
 DejRbDTzuvv02FrbTafKBfa5kAriZXEe8vLLEmnUncOsimueMgRSg5JbU+3xwCJ8qeqm7P46k0a
 YcflPGhf8+osOAOxVJKM/U9hHYgeklGfkuYvVO0KKh5SAKixVjGFK3rNX+NYrHTLEa239o6Xt6t
 gi/ciepN4uOYuMnJqFsQKgTVkQN4MqYP6/XPpyi9Ue9jq2s8ZDIfl2eSTrx2nuv672IkiKkotM0
 Wjk7Muxp5IxoGTewgJqYGssClSNKMzD+0mJgvkA7+OZJijXLU6zXC6wMfbWhTbj18C6aJ5kxUS/
 3bbf7gBKy7yV/FZ+OOe2QCBlqB/4WQ1NktztvcZvwFgUsddVODU1nHxT1+mbuVrO0W0ewh+l0Ep
 DY5Aj2MdeAvu5JQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032138_663645_5325A57F 
X-CRM114-Status: UNSURE (   7.87  )
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

Add entries to v4l2_format_info describing the 14-bit bayer
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

	- New patch
---
 drivers/media/v4l2-core/v4l2-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index c1c6c61b4dff81f6bf6ef8e5c0066a4e1ed95472..1123975db9877e747d7e8c2c8c3bd41eafa05032 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -344,6 +344,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SBGGR14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGBRG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGRBG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SBGGR16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },

-- 
2.34.1


