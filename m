Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16028C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7cGY2jIqM49E/v/3mNIX7W3FWnie2RfQ6r58OkQFRM=; b=sN49KCgIT/eNEXcbx73BDtHU2b
	Du2n5fLnxLTbSNZlV4d+Nf/QUIxOygnYHwqm24G0dt62bClddLtEtNRRUBOai+VdRZKq8ZnLHQVSe
	UdfEYs7/B57z17wMvNRyFk+K9FPhj45gtdfo09aHUThzwKY/btXTFFR2owWVtObqodrmkG7tqwB4Y
	8IdKqDSWNQzQ+DEkfsUKk6PmFJdrnfDHuYgzONkyITfIg0qfSk9fnnyaZZYGRRvDDoK3zO6v6YPYD
	I4v/LhhLDi42qHhK9vdxpODl9T61I0fWPo3DX4rw6xvnIKZc0znqfd+FY1gDeNSjy5HFEIK1ijQJr
	9NhjMDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLRK-00000002ky8-3HcW;
	Mon, 14 Jul 2025 15:50:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKlW-00000002Ytb-22HT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:06:51 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A515754E4;
	Mon, 14 Jul 2025 17:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505577;
	bh=LUnMkSihpSZDwWh2x85x1J1CVcob8kgOfAp2ap0QDpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=viqs2+IX3rkPB5JEjDb1zNGTyyKMQq302u6di5k7NeQ9FJGfHGEGy3trP/9ggBgmz
	 Zqn+uabdMEqys5oG0c62gvznR5muSV9DGNRfjUhKWuqN139AtNNhw3OUm+VtUrqte9
	 GBaxHc+/YWLeuLZCwSRPDqojhMfgfGU88PQoSoIA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:32 +0100
Subject: [PATCH v11 06/19] media: v4l2-common: Add RAW14 format info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-6-bc20e460e42a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=LUnMkSihpSZDwWh2x85x1J1CVcob8kgOfAp2ap0QDpI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0A9FAFvJqJNqpHv6M1aFuiqDEFaeLqGZ2D/
 deMpEeAzQSJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAAAKCRDISVd6bEV1
 Mn1AD/oDqN/oTWj6bZ3fTWHf0iIRY7MQeS9c3GC7TIQgtgKzR3yqOHoGwvt/+UvvXtFRokYi3qJ
 wvzYzSK+2she9ZdSFuvdCqT45o/2dxSxpy8zYkoQDXQ1FqwLsXJaN1NhdmYxl4BhpMRBJlhPPrE
 zzgp3m+h9naZjxUT4xqSsjOUTN2PzaCp9vNaGu+KiQG6M0kgUg3Rc756FI/ISwo35Zxz1y4cUYS
 BbKFhY1si3K/y9E5M6oNwaHpAutgXKnj4bS43DRccVUZfT+LWrQmjAxjexEhaoN2EOVZvJEb4Gv
 V+/ghVf/VWhnlMvZnViZSXkq4DbPhSABZI8yJAnsdXUHEc6r4s62v8mzfc3GM5INfQOrWcuPcyn
 4ggjju4ARGWyIaXlD/R5wlF7mCPAvQJ8R5s4L+ZQnzdbKH92zYBKiyaZPIH1trOS6B7wqnOo+2Z
 8JcJvspdW/uIS/KPUH+MgLExin8/+cooU4xqeJMnMjkLLH71S/ZqJsQ0aaIgu3leN+/OtDMRLeh
 vjs+xwtFivTTll3sarD2QYxlfHY66gb49Mfze+ooUhA1uE4d5fQEAOw7L78Xz+any3oRy4f4o/0
 2yXsRNkfjQ7bEkCn0CQ7AcjXg/cATA1QsLl+X5XWQOzDvVzUe40cXICWw0j9j5+o43CunbAVT9s
 ObZV0lGYpv790wg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080650_687456_3754F927 
X-CRM114-Status: UNSURE (   7.97  )
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
index 5bac5d45c5ad19f2e76eda127338409d400d5aca..209e73a715fa8346a15eeb19cd2caa26a6b3e9e1 100644
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


