Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5D9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhM8GE1xZoKGyrAe7YVj++mHCNDn2ZM4viM56ZyqlN4=; b=nUQX+HbkoDC0Q7sKI40Fo5whyi
	w414pZqF5wmk9LhnKEmhbHItudrUTjLVXfwGxeXddjmFekTYQ6jOprsvVxmDBmZ38ZUS0XGD525MC
	mmSa8p5Yp3YFW8IgDf3XE18FPE9vuyik0rOqAeJ0rbpNiIMx/tY+tz6sz6akC0Bb8AYQ1EjKO36oO
	pPtI23X8iEwq5LiwAjSuJYXOBelvsKS0txgu0JQx1bGOC39NgcFietkrfI4CZ3DTvqFc8fK2hQJof
	LFeZrnsATHeVDYdbAf1ABnrKdvtclNIyFSv1FemfPEN/RCPeZQk/j07nhEFM1SUslR0GAQy02BLDC
	BIoLTPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNLu-0000000A41s-1AUu;
	Thu, 17 Jul 2025 12:04:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM82-00000009sxg-3Uec;
	Thu, 17 Jul 2025 10:46:20 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D201AE2;
	Thu, 17 Jul 2025 12:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749144;
	bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uiwxmilUyeUwUbhXT+Z3DOUylJFzWaOUMiyPqvYTUp4+ecDcr2ZRpyrJJ/pClK7EP
	 HC9VLTioj6+n9rvkpV7bdvKWoF7FHTjE4wDOpktqUwrNqJmS2Etgzw5wAfkf9kTtL7
	 2rYDY8h6AG3srtfYxn3SaqJT9Ma2qMdDM8ZZUPDA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:49 +0200
Subject: [PATCH DNI 23/26] media: pisp_be: Implement set/get_pad_fmt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-23-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRR446grg45jSOazWmLg7XRPDLLG/B80g+S+
 8a4h6emRMuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PHIcD/4nIDePGNOBSTZXua3WG5IPv5k4ZIU7nI1QDA4K1hbYrxMBgTT4OSo+Cme46A2XAe1vzgU
 nweba/418w7v34UBvBbQuVKa4HnWC1apjPZYAQ9QNkYkVXBSDeMoApB83UvIBgYzqpSzB4msTy+
 HrvY4dzEVVNe7RrFUbtJJf313vzRfKcaEUtLz5JXE+CtdXLhv+iRLl3hovKuWv0Tpl9xw9cw0ca
 JyrLlnLiQ6/wfQaDdOe7obChvMgeErN9tv/8OEV4T56RCcGABsDlRJQAlRx1649PkLmuoxOD3ln
 cqeeVKdT9xjK0oFihEJtCvGJISxv11x2QfV6xjQpDg/EDMZ73SJC1zMtGcF0FEPGEOg2PCb8dAd
 jvx55GGnAfoc3PBl1+/Vu+q0H9GutBmNVhhMq4gdStnXr5GnfWu/D0TmdiJQtdG92/yBg10EClw
 3uq0nvKh6JaITdRdIyDCzLI0ibnmH7nzVkvDC/KrhS3rhgw8GxxIfUWjk25Z6Db2q1bqRwx48DP
 HzCx0YF8z1KT0j54/+RxGp1w6pg3X/I7MvFtjFG+np8fRhvqXTBy2ZDYJhUd8LW2056qo0P+uf8
 ZS1Bgt5F2kzwSWJL9GLjF3uz95lO1uyk9wihRscneEATpBN2VPzjLBgwFJkanvsR8NjRC/1aGDp
 i6TdcGazjri2pQA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034619_024694_970E9348 
X-CRM114-Status: UNSURE (   8.70  )
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

Implement operation handlers for the set and get pad_fmt subdev
pad operations.

Format is only modifiable on the image nodes (of both output and capture
types). Only sizes can be modified.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 5aec4f8979053500c870e71ce7171bbd1cac9606..22e440f387b5e5560b2cc80a8b3bf6064dc12d7c 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1488,7 +1488,36 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 	return ret;
 }
 
+static int pispbe_subdev_set_pad_fmt(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+
+	/* Only allow setting sizes on the image input and output pads. */
+
+	switch (format->pad) {
+	case TDN_INPUT_NODE:
+	case STITCH_INPUT_NODE:
+	case TDN_OUTPUT_NODE:
+	case STITCH_OUTPUT_NODE:
+		return -EINVAL;
+	}
+
+	fmt->width = clamp(fmt->width, PISP_BACK_END_MIN_TILE_WIDTH,
+			   PISP_BACK_END_MAX_TILE_WIDTH);
+	fmt->height = clamp(fmt->height, PISP_BACK_END_MIN_TILE_HEIGHT,
+			    PISP_BACK_END_MAX_TILE_HEIGHT);
+	fmt->code = MEDIA_BUS_FMT_FIXED;
+
+	*v4l2_subdev_state_get_format(state, format->pad) = *fmt;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops pispbe_pad_ops = {
+	.set_fmt = pispbe_subdev_set_pad_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
 };
 

-- 
2.49.0


