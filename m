Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4F81049523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=; b=vzlBC7ddeAmqKuSrcRYO0Evz0L
	ocjWvoR3dGDikPH82BSno2oRkYqT5D7sFxgBmNpaL4E+D6rG1Mw1PoRwxQecyda94hbKX2cnWkKsR
	DKN7dxTFBrLWVUa/qlczs3HrVrTHUQnMlA89wj+9j6KnLWS1jpp7sWzhWfUUdWRLVAQA8/xWKWpbP
	4KH/iYnoB60/o9IKspdUCxKV6lK4ksascgLcP9FzPU9QH/oMdUz+jxc0PmKBlt90wV1gByxVC4HBv
	rKstKZ+23bz2Rk8qI1WKF7VL6OsSguCfmx23IsmS4A69uGgfImToOKPqL6byxLUByzOoEa/cmcwFy
	xvloPsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCa-0000000BJlJ-2oVH;
	Wed, 11 Mar 2026 09:50:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCY-0000000BJip-1gxs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=; b=QHKnOuIyMQVV6g6OuIJMqHXkvf
	2D7KuFQXVGiB5XC/CECdDYjc+vhbnCHlNNZoSmtzmP5w5rlBMfXPLvBUNGhiKtu2TfplYDMUOadBO
	jeT6oADDR49ckU5w8NYWWP+tbf2vBH1kmdeyuWS4oGWXj32bMNXY5PYfzcF+eHehkSavDuZXkSOf8
	Z4hCeANrCwqyN0zBK3RPxBaFzfKcMwhnktgNh1JmAwxv0WMcJh4Yu52QFVK9Lrs+7Q96Mf5jle3rj
	rVYsqBBzqiBo3VsDFwCBAFXUcJd5cag6hJzuQNwmXkWdR5XClaSbeRZj40o9IVLN7J9dTvW5uqtSo
	RzvNldJg==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCV-0000000Gbf6-2WNp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:50:01 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso2931632a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222597; x=1773827397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=;
        b=E2Oie7dbUTHmI3BKf3Fm6s0cKJg3NLEpP34Q13QdztQE2kRKqhgX8L9xUhQp2bSy9e
         Bvg0EEzSKF/2Cz7IPUgrGg6eqAjIFF2Lm+j3Lez9bQZVFC4b7iMJzhwocEBUoDw2QuNB
         yNh6HtSqbOk9hAtB05/KyCWM5o++EMPykB7Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222597; x=1773827397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=;
        b=xRiyxmWk6YV3OuICPbhxUaUF9kVAtJta0lwhqMxpIsi74L7UM6HExNjfRnZnrXyz30
         JEUq2lMsXsMQU8KmJRM8B0g7hFW62ByHzNrdQzIyPe6nXPSirChis/yc96kRhRsu25UL
         R9+shsKcDj+/mbyr+oRB0Sxhm+BzRgT09XWRA8/ZNTZ41BACzNoqibczmkj+y3GMbhsQ
         HvJ/WydqK3gvLcQcaNmQnhv+ayFZU+WDQYafAFlsZ6OVXCOLWPnMMsOrCVWb9TC+jWzb
         jCrQ+9BwYs0FL5DMTrrmMTd2kvp4N6qKItwZUDn4TjLu3cw4Wod1z2RP/gyaGTs7O0km
         khsQ==
X-Forwarded-Encrypted: i=1; AJvYcCViBVanyAnjc8KOFbRyp/DrkHkCl+t43oux7EdOFVrugGbae2NPSFrDeVvy+ZS45YFa2dV9uU1gNiA0+5PlguH8@lists.infradead.org
X-Gm-Message-State: AOJu0YzrKJ3LRZ81nT4lrvl0/lUAs9WLG+h5vDmrsqRbOS7tGo2HEQHx
	aGOLKtQiCX5c+FRtlRWAkMJbxF99k6ptCLn3APVhfWi/oH0B6G/cwpS8flQ3kAUU7w==
X-Gm-Gg: ATEYQzxgSTj/20cAiplJRurGgd0eaba6J0wrhnb87Ppp9lWJlpduVsNiYlhAjsEGDa2
	S/CHdsHGDjgjVNj4CcX4161AsC9XiuPMej2zQqRzHpBAYCWKlh2bandJI/sGuKAIvinNxdN4fsf
	ussicJ8mJrEd2H9IgnAqSY2lKW1NMJfpILNfFMoqdD0akCRB16nJyKlbdegaR7pp5NGE3PFF7ts
	iOA6LY2/wSohYMOxBtNYUHaMuKoovcjC+/g8dvmV7zsyp2hgZRu8ZYNboFOTPsMmvDpYAPI5f+d
	ksPYWZxfG3bOTgNkERZ/SD1vfbgqeR+LL1vSlWmeU1KbMPPyr7MO+d+LagEcS7sqO007bOEmj+R
	7y6DXVsVSqCCgpAcaB6nI+NbnkCT5wKbi+riht1Bv5tW0A3/N1/Xzk+pYbpCJnONqzRv82htgPe
	rkASS8hEhLArrmvMiVskcK48a+vGcbZaRbYMiUkm5dLay+sgSt8N8J95butH3w9ZUl8XbBvRmFC
	5e+AMcWZyyquUGV7Bo=
X-Received: by 2002:a05:6a21:6e0c:b0:389:8f3f:50ce with SMTP id adf61e73a8af0-398c612795emr1755090637.56.1773222597656;
        Wed, 11 Mar 2026 02:49:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:49:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/prime: Limit scatter list size with dedicated DMA device
Date: Wed, 11 Mar 2026 17:49:25 +0800
Message-ID: <20260311094929.3393338-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_094959_735273_68D7C659 
X-CRM114-Status: GOOD (  15.30  )
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

If a dedicated DMA device is specified for the DRM device, then the
scatter list size limit should pertain to the DMA device.

Use the dedicated DMA device, if given, to limit the scatter list size.
This only applies to drivers that have called drm_dev_set_dma_dev() and
are using drm_prime_pages_to_sg() either directly or through the SHMEM
helpers. At the time of this writing, the former case only includes the
Rockchip DRM driver, while the latter case includes the gud, udl, and
the tiny appletbdrm and gm12u320 drivers.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 51fdb06d3e9f..9b44c78cd77f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -859,7 +859,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	if (dev)
-		max_segment = dma_max_mapping_size(dev->dev);
+		max_segment = dma_max_mapping_size(drm_dev_dma_dev(dev));
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
 	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
-- 
2.53.0.473.g4a7958ca14-goog


