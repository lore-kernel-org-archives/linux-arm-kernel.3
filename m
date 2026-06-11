Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75017CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QMwju+bF00fDRWgD6aFjamUkfyRvkUx8XZMI5aZiZ14=; b=a5R6ydOjzJiElqRIdfDXVN4AP5
	L5AJOqgTvLA7fnE/FM7Eemnj7oj8BzlFUsvKYHYuSuvYiMqUOGD2Kw29KTI+sB8RoG4JlRZEbZpuJ
	dYk9QqUF9vRhXXq4u/EpBXI+fOpC60pL1/oZk5eeKgp/eTnnomNo+x/mQi8HLoFpc//o09hYIj2sI
	motxWvS1aZqzYwfPw7IJDBoOhQNOtiQxel9GA9Gjhh+R/Su9k1HE59b3LQlvGiFAxNb1oIXGoJkKU
	p64OCH83qVeWATsmum4E2KqpxMNIp9e23K6eJ75J28jR6R0WKnBLgs6xJ2uO79yA6bEEHz5779uL/
	Rq94IDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYcB-00000008meU-2CUS;
	Thu, 11 Jun 2026 06:10:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYcA-00000008meC-2BMF;
	Thu, 11 Jun 2026 06:10:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A552160208;
	Thu, 11 Jun 2026 06:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B3D1F00893;
	Thu, 11 Jun 2026 06:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781158205;
	bh=QMwju+bF00fDRWgD6aFjamUkfyRvkUx8XZMI5aZiZ14=;
	h=From:Date:Subject:To:Cc;
	b=Cq4TRXsJNrWHvMYJo5W7d1NrCYcnm28ETJ1Z1i6euJUPMcVxTTi469wALxVqBI+JQ
	 Xa9jp8kC6PtfqIcIKs0hGGn5HauYqi+2aDTaA0cpLzs79siGdr3MmBERskBCw0zOQ1
	 CBGqcnyuHTkutUaM35s/O9jNyrYpLCkMtGmGRGqLTXfVLezrOBEOyWWhRVbBfBILi2
	 7Sl8h9ynBKCXylM3JE2GRRUR6ON8PeHJ/fBAjn73nu+lt83pZGa4cxHp/4WvOpRe2M
	 vYBU1Vefa/CFXXtHq8QhRrIThH638nSfQtZpafJmoVlGbSRiMSNAmmE0d6VbLseaFJ
	 yiev1y0YEVTZg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 11 Jun 2026 09:09:51 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC5RKmoC/yXM0QpAMBSA4VfRubayKZlXkYuzOTgKsyEl7264/
 OrvvyCQZwpQJRd4OjjwMkfINAE74NyT4DYaVKaKrJBSGDs5Xi060ZU6R02oWtQQe+ep4/N71c3
 vsJuR7PYO4L4fqiXti20AAAA=
X-Change-ID: 20260611-bcmpiqcap-f893a9ea2da9
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Naushir Patuck <naush@raspberrypi.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=ElaN3MA+r7gbV2oGehvuhfujvcI0kDw9G1DVXIYDWoM=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLK0As2FhAxepPjJRsg4WGn1X9vGH7rok6+nTc3+2paE9
 fv//H7VUcrCIMbFICumyFJt8q9WuH+H+0lXSxWYOaxMIEMYuDgFYCILZjL84dNWXXt8ywfNiQk/
 wqfpCNfss+LtKnt1+2CdocGO/zslfjEyrFco5av/VRmnuORq+a0ZLb8F3Tc+6+hSPMDEy7RIlle
 ZDQA=
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
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

The unicam exposes two video nodes, one for image, another for metadata.
Querycap should return the right caps for the respective node, not both.

video0:

Capabilities     : 0xa4200001
        Video Capture
        I/O MC
        Streaming
        Extended Pix Format
        Device Capabilities
Device Caps      : 0x24200001
        Video Capture
        I/O MC
        Streaming
        Extended Pix Format

video1:

Capabilities     : 0xa4a00000
        Metadata Capture
        I/O MC
        Streaming
        Extended Pix Format
        Device Capabilities
Device Caps      : 0x24a00000
        Metadata Capture
        I/O MC
        Streaming
        Extended Pix Format

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..4bf36ce80047 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -1833,7 +1833,10 @@ static int unicam_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
 
-	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
+	if (is_image_node(node))
+		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
+	else
+		cap->capabilities |= V4L2_CAP_META_CAPTURE;
 
 	return 0;
 }

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260611-bcmpiqcap-f893a9ea2da9

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


