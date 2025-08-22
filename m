Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1D2CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwoFWt6G1ilbyVtw0X9UEPOOghxifgP9/Dy0rgxN+a8=; b=afFiVMhTN4ci/EZwhLv8Df6Ykz
	WNz2XlXOJCxtQuMq6I+h20gJey3lGjR1mLMSbwJr3nHBIwo2Z0KJyc9iCQPNxj2bluz3PPy5GVCRp
	bBAEAPOT8QMhOecNyDXJ+/MyodC0WdSJCQHm/nHB1FpRpAmnp7z6NQXBoz3Iy51tbxHdH1cWfK2yK
	A1a1Rw59PlC1GAkosc5IDWBYSUkdUOFEU3vMt0wxw8bOoQYHVBHGqq3F3BsbGXCeV/IOKnmuleuPg
	yMFbpQ18rc9XecNujAdqx+OO484OUfC5KHPrd4jBeeOfkfCz53gxueDAYUBuKLVPYTJfc8n16erKV
	O1GLgOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqi-00000002I0r-2XD4;
	Fri, 22 Aug 2025 11:22:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdT-000000012Mr-3MWo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9EC2CE45;
	Fri, 22 Aug 2025 02:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822421;
	bh=ovnp78uxCAMSAIEe6ksQSf7uTZ5gFLsD1WnNZZ9DQWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LDDAHb2BLRjxMsVzpJMUtCia3uu6KKrjUquwsKlGro2FUc4+rhHqXFpeFsgnTJWLu
	 WG6ZUxjkhYH3Jb8Dn84KEvC2QMuyxfgHdysuJWir+ghgKc7en6/wOmu/pAFgUULbAA
	 kJXMqbJN2CBBMdF6Evx15W182TqVkGUyj5yUvAkU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/13] media: imx-mipi-csis: Simplify access to source pad
Date: Fri, 22 Aug 2025 03:27:22 +0300
Message-ID: <20250822002734.23516-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172804_023851_43BCCCDE 
X-CRM114-Status: GOOD (  11.59  )
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

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


