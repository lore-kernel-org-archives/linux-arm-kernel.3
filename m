Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB62C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhM8GE1xZoKGyrAe7YVj++mHCNDn2ZM4viM56ZyqlN4=; b=yrSMCIf51dlhte+eCJp5pFG9eW
	f+CyYarY1lLw59wZLq5Rmv+VOpNYFryqVlS+WZIcoVtyjl0Zxzgf3Z2zss09pZw/kCRqpxkzQ+J81
	AOw/WiUCe5r25rPAAPqg0z2DJ16GwQ8aBxDLdJyGIY7KwzjZXgs1/TlDN+4HU6EltEBrLMmAZE48x
	V/8XcZyslIoluhytEMW7XZLsORlrgE3p42dc0eCJ9rNY5lb8GA95Xtv819IrsZA4NwV+bHd0yXLRE
	Ggn8Nz01pAroA8/qqPoYYUDkKnmucQwgtNgzWlhf/TAlumxlECV3+S5yuC6fD5vwSGRktpA4UOK/T
	t+oBoArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueyIv-00000007wG1-0C61;
	Thu, 24 Jul 2025 15:56:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewev-00000007hsa-2m4b;
	Thu, 24 Jul 2025 14:10:58 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94EBAC64;
	Thu, 24 Jul 2025 16:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366217;
	bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h+ht9XLwnR7UUmgO5C1AnL/fmYRCmYCmDKsEl4ajfFSsNUFW/vKCksTmj00tKoXNZ
	 XmVRYnAutmBWI+AAIXuys8VnL05rd7n5Zu1h0LZsZCEMmhXwh5gByar/62zTFgV+bu
	 4Ci1jWtb3K76SoOaZ3gXHz0MghHEvgo7Uk+hdolI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:31 +0200
Subject: [PATCH DNI v2 24/27] media: pisp_be: Implement set/get_pad_fmt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-24-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7R60gOltUMYV82hQEHCOM7Z9Qxe0nMqQmWx
 fEVl6pPqgGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0QAKCRByNAaPFqFW
 PHkCD/9qdD97ai0c7MCMnH3YjlFvnHU4m+d7AKDsxdcHUkaQC3fNm0Vf5s7ThTfX8ag8sil/2SR
 p1LfNxyGmzquhg+qI1Nl26LHi4DdSSXrxSk+/O13c0pKG6cIvoWit0DtnW4eGmX+ju7Q9t09fN8
 V22Eheu5sYjw0Cyi+C5PQU1VQGt3iow9/VXWVwPwuaQNgD16CvIVjkVLNiQZ1DXHMoafj+Plru1
 sIlc+fimyMZphtvb8CfrAvnKCCyY+nfKx02gNqgo3xN/cO6sOmbzjSI45F6gjBRSwcwPga+oub5
 93Az+XiI8+BJEs7XMy/yBLmBTvyXgX882Ge61o+49nuTnunSnpj7NqSg5vRhQTAKXjK3TvkkBOb
 FHOeo8HlR5V2dsXuR+ueC4q8u1RVNb/7f0JBWUNMdcybKpt392/G8++fRnYIgw44g2o36V3VnxG
 D25Ty2DGKhxyxJ/T/EetSfMEUhyT23/a0jVjkMggNb6/EkE9WiT42WZkywHDVRAR+NvYLLmM7KD
 sCaDuCzNPhUubYTXxyO25NaALJ/oZyAE4vVYpv6I/82FRO0E6RqeoqQImOpF+EKSxjdssqF+RVI
 tgg+l012YM4Qeo5fxrQiY8JdcW7Ly50ejzQ9hstqd+MfSfSHHeExGy9QY9VoThzdMMrDAyIw5ij
 DNh9e56xdOx2BAQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071057_843616_EF3A9B69 
X-CRM114-Status: UNSURE (   9.09  )
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


