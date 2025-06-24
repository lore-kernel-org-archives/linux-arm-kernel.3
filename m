Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162F4C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35rVixgV3M7CJZ+KYTGI17qTjWGLS5AtLUPJFsiVjBo=; b=3TY0mfuxBPBVgfBSmkEeO56+qQ
	4UE1X5/RhoyOD9M3vDEsyd4789RnqaARgvxw1T/PulMlAdqoysnRX0HIXpEoIMKWvie9Y4KqoJVYS
	J0LOoIxUb3F9LyX38xq/fWpYFjlbvofCDr0YDZstU02cTGSwIGRp3AjoXYsTsHLYw0hkSrWMtOwIz
	FiYc9PTPm+1AUqYOCgO3906FBm05C0/7dvAY0GDAH6E5EfbJW2jF6ShJiDb8Wgg0baiR0Y1J9rjN7
	HocFQuqRw0mhzlMlsjUuEBFvTGQwzbCUyiEb29/06u3KSLdwv/n8GbbSoJ9Y79R8/W3lJUTP48ouQ
	3IRNcCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0qF-00000005Ifw-2Bu7;
	Tue, 24 Jun 2025 10:25:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0mY-00000005HxS-0gw0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:21:39 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1DB1134A;
	Tue, 24 Jun 2025 12:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760476;
	bh=WCZ7Etf0/q8g1Hia+xjF6HIFc84Y5jXMPh0/FyOEK00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TIuJmR6UBVxzA0RkWUsMuc5gASopNGzIRMlF9NluY2bMdiLweLzfiALkiA5TV5iTF
	 bZd8f7JCkrwPumBIDLhveoSF1wqrQP129SIYNRqWX7HbPpV3tgkn/B64Xht5vt3368
	 AXv/xcHmTovxUG2w902NrhNKV9j6uRKOlfBHCTBY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:16 +0100
Subject: [PATCH v10 03/17] media: v4l2-common: Add RAW16 format info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-3-54f3d4196990@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=WCZ7Etf0/q8g1Hia+xjF6HIFc84Y5jXMPh0/FyOEK00=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwmUw1T5ifJbwFzj5v9YnDRDDnzPGwpmGgzn
 o9sENSXn5CJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JgAKCRDISVd6bEV1
 Mg1qEACmW0uHsjSNIGe1YmyC+iHIcVNN3YvZUQqrPo9Xc4+HoQOjvFuNTLYoVvdCCRfJxcA76vA
 gTPqO/UrKyCDHnhqC5xojADw79UcZWAXnjVDCVJVsxWSbP5XtTAnS91UzAM5PIspjynPLG2ZTT6
 IjWczS5DGFBmz0PR4/KhZcSh5b9oOa4+XwQKmqHiomJtHkp3TEina0hljCsKvNWz6w/N/JKgY8e
 9wxT3zqv3xWyE3aZH1lpLLT8afm4g4RZUSHixDiEkNlkoL5qbQlKeU5yf7jPEWTqOQERiVjTL4h
 T7K8K/ZC8PXV8iQ7gX6yfmR7wYcwnbipHTUNdaEvnqhPL4KRqBn70N2jGU6SsYaaqxsOo60mcxE
 w5gD/mQxQaw+g1kS65q4zqTWTEvGlmVogE/jzT+lDyV4y4vkYGN6YaW7im4c7u1dXTOroJoGRC/
 ermm0Vy8tvYGT2UW0mx1ovZmHPEd3kbX8yJ7V0bb8RN/9jRLKbb74TOjrBskOOBitqlDln9iqn2
 AbJqvB8X3NfsQrMQFiAUoaTb5A7BrJxCUyrVqZ1q+hk0re38Mbo/MK2w3dyAjjqoMRS6LMeSk5W
 ahzFFfG1xnE1rzVWZ7WE+WpuuNm19/NHVZVTvbAR6bHKjToL1NUV0veSsYRQAo0Wnz2QwNCtOoy
 338vp1NSQ13IoiA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032138_352010_3CAC7C6C 
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
index bd160a8c9efedbcefc58b8ecc829e902f392e5c5..c1c6c61b4dff81f6bf6ef8e5c0066a4e1ed95472 100644
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
 	};
 	unsigned int i;
 

-- 
2.34.1


