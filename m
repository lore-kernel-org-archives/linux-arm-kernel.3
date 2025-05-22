Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B1BC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pedd/dnNhBSPTr2YZD2HUfw1IPYynZKrp4USIomxh+I=; b=RXCFiilE1GD6sK0DNtyeId3W5a
	+vx3w96A2hw8fD1t/qdwVpyA3y6r9FHc7IXUMMu3f48ahuR9YTRJcsixwOD3qLbGinHfSqWaI+WOb
	z0efH2ME/gMjMy/puy5A9H+FTRnCP8xn6+8Y7is0CkSOwTy5Cz0+9828Xr4/psDyHcY55nkTKzDFf
	9Y1xbeLK8VmKY8F5ngRtqAtvV2Iaei8McGCH74NPdpfagClnW2H2JE2bo/Vt7wtNbh7CTYkOJEyA5
	XNPbMm1ukziDnXY1MqvEqhRCEfUjBDEKXAWGaEyv7+8yGLDF6r9MZL/UCOboqNhAybFhPTuLuF8pK
	+dDfjpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI83f-00000001TVr-3KDI;
	Thu, 22 May 2025 15:42:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7as-00000001OuG-1i1v;
	Thu, 22 May 2025 15:12:27 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:30c3:8bbb:632f:b0c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93D028FA;
	Thu, 22 May 2025 17:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747926720;
	bh=pO5u+KDpqe/wtFtfltLT6eyTFZ/IqJJk8xm76d512/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GpshNTa9JHOJDRZHdtsC84v5/P02ueCLeCQNUEXgf3AzyBEwFBJjx7BkybbR65VBY
	 4pinIoeT8j5g1t1nZ6S9AwRdsXXgvB22AKWLW/N2mRlqLJc6Dzcx6DLwe2sfwcWHe/
	 P4tiv1afJ09/DpY5KEXmVW7dJjqqK6p0d3MIJEQk=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: rkisp1: Cleanup error handling
Date: Thu, 22 May 2025 17:08:38 +0200
Message-ID: <20250522150944.400046-3-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_081226_581095_7D680EDA 
X-CRM114-Status: UNSURE (   8.50  )
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

Do not call media_entity_cleanup() when media_entity_pads_init() fails.
As a drive-by fix handle an (very unlikely) error in
rkisp1_params_init_vb2_queue().

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c    | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..918eb06c7465 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	vdev->queue = &node->buf_queue;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
 	vdev->vfl_dir = VFL_DIR_TX;
-	rkisp1_params_init_vb2_queue(vdev->queue, params);
+	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
+	if (ret)
+		goto err_mutex;
 
 	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
 
@@ -2777,19 +2779,20 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto error;
+		goto err_mutex;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
-		goto error;
+		goto err_media;
 	}
 
 	return 0;
 
-error:
+err_media:
 	media_entity_cleanup(&vdev->entity);
+err_mutex:
 	mutex_destroy(&node->vlock);
 	return ret;
 }
-- 
2.43.0


