Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF17CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAj5Okicz8DHPwnoQVMwbPoLMZCIPHEvN4INNL15jEA=; b=FWui2aKThq2NfNylljNnKPZL4Z
	1Xdpg6vpeX8HhMxmg31tmSO6pxBVjqN9ubrOtvh5ezXPKkaG8pHKoZlnz8XZcCCEyiNklmy2Rn4Mz
	ZzrmLYsER9Jnqg5OruP7aB7g5ZzdVdFKT5ITyuBinmHPQbcZMjNTPVqAt0iRGVz9dCh1McQYSG2nn
	+yxpcUieIHxxSEYUdoXdcgyiKjnkIuSW6+l9IgmAaLy6rwZcjCdgqbIC9YMat2ywa3e6u4iinmEGO
	ivtZ9M1znIJY4n7ZZesP26RkLEZ3m2i+Kbhm7Dr29/WdlYTZ48C+kNX3R7hd9DCDbCLQAQfSf1PQP
	dttpXIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7Y-0000000FdXk-0Rqm;
	Thu, 21 Aug 2025 03:37:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosse-0000000FHGK-40MS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:10:14 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BFCCE16D7;
	Thu, 21 Aug 2025 02:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734953;
	bh=9ETI8pbpLBDcba+2zpyyDyV15yFUOQqPE3uDEbvIbfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J84vmB2DqWJB+PE/Lr4H63CyWUxPS71rmHj3nCY81ihWb/X5qin8PxtfJdsxUqkpU
	 rjcEg0VPJBtfpHEXieyPfMnXrEJlejGiy929W/w6+kd4yEVv3DnFAkEfqVZVBc2AOl
	 upplUubft2mkQZVTjCfNzs5DtTalYUzTyw88ypuk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/12] media: imx-mipi-csis: Simplify access to source pad
Date: Thu, 21 Aug 2025 03:09:34 +0300
Message-ID: <20250821000944.27849-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_171013_139441_9A176886 
X-CRM114-Status: GOOD (  11.85  )
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

The mipi_csis_calculate_params() function needs to access the pad of the
connected source. The pad is already available in csis->source.pad, but
the function takes a convoluted path by getting the pad index and
indexing the source subdev's pads array. Simplify it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..46f93cd677e3 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -579,13 +579,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 				      const struct csis_pix_format *csis_fmt)
 {
-	struct media_pad *src_pad =
-		&csis->source.sd->entity.pads[csis->source.pad->index];
 	s64 link_freq;
 	u32 lane_rate;
 
 	/* Calculate the line rate from the pixel rate. */
-	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
+	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
 				       csis->bus.num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
-- 
Regards,

Laurent Pinchart


