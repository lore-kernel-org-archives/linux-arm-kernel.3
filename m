Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E35C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeEW0pIkVVML5n2uPdr1MoaRU3O0iwWNe240NEbZW7U=; b=AjmcPnmjWqbHxTAme10oaSnRoC
	hfvsQqaKygqL5lSsPHa6GE0xX94oQlVOolPcSeQfmzwMilPRWspyInPz26or50pMx/EHbw0tsZyq4
	yob2AMESXIOWG/Eg1Ft2j4bt8vRkD8crkB0W7tsapadBDXQWs99Ws11D1iTEBquLHYW+A3sUbvqlV
	wusaP/BTYewSG6ifSwTq00F8bQBlerFdb/z7LOkrhtKsYOQLwj+nTbMzQ+kFTApC6Og9WdDH8it2N
	Qv3tnr9BbeM08mKaRF5c5ZbWOaRQLjKUFBYGGiH1kqU6Q8fODZIeKh5BTsLPBnz58sjm6t4pjTido
	ASBn+PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUBP-00000004EPi-3FdV;
	Fri, 23 May 2025 15:19:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU6Y-00000004DUv-3n3i;
	Fri, 23 May 2025 15:14:40 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a882:21a2:2327:ac4f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C03A4A4;
	Fri, 23 May 2025 17:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748013253;
	bh=uPGmW5BZEjqSxL72Eg9qbe0NAJhFfcaFI1Vo//ykHrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QXEFZOpumio/6D6zu95bgODt1cAwPpdqxCwzA2yhHd2QBXDsVcvUbiJ9QVkqq680q
	 DO/9ygJB0wUWmXY06ndtGnPbR5UqKbmzVR6vWgVI9TriA/HryDcaRHNuu6hrTZwklY
	 6mBZKVI9Q0kpKPDg5FQ28gaEucrgscQkDVCn/nWs=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Fri, 23 May 2025 17:14:30 +0200
Subject: [PATCH v3 1/3] media: rkisp1: Properly handle result of
 rkisp1_params_init_vb2_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-supported-params-and-wdr-v3-1-7283b8536694@ideasonboard.com>
References: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
In-Reply-To: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_081439_083947_E2CA488E 
X-CRM114-Status: GOOD (  11.17  )
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

Properly handle the return of rkisp1_params_init_vb2_queue(). It is very
unlikely that this ever fails without code changes but should be handled
anyways.

While at it rename the error label for easier extension in the upcoming
patch.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

---

Changes in v3:
- Moved these changes into its own patch
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..24a8de697f2b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	vdev->queue = &node->buf_queue;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
 	vdev->vfl_dir = VFL_DIR_TX;
-	rkisp1_params_init_vb2_queue(vdev->queue, params);
+	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
+	if (ret)
+		goto err_media;
 
 	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
 
@@ -2777,18 +2779,18 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto error;
+		goto err_media;
 
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
 	mutex_destroy(&node->vlock);
 	return ret;

-- 
2.43.0


