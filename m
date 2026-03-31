Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4391061B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 00:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6KkVZ6avnq5JZYkKR1K26BH30WGfxU6tLWicybER9M=; b=Da73/wbEE3Ft1z5U0+PFWPshw3
	nkB3Z40cfLykc7UJ9G3bmmatWzvYO4xcQktPt0Hkdm0APuX0daQyiDDQaqqF/A9Y4ep9x+BTTFHBh
	n1n7kZFnNs/eJHNmEpvHry+bfoWCVpNTHwDEsrfmyw7F7opbxAXieZz9GxDIpfXE/zm8w2z9DqMUn
	yplnfW+SpoH2hHj/O6GCA9LjNSVWvhpG2qVZrS7lQYU6K/afNAxFLg4ixH93pb2nFZirC7c1/MWOF
	4JHYQOftQs2i0gNYvymf0LtzvJp1Fd0aywHW43fqDRdhxnn4jfoRw0i/sExyWuywXWmKwG8Ux8tpB
	oZOin0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Mu3-0000000C3wi-0uKN;
	Tue, 31 Mar 2026 00:24:19 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Mu0-0000000C3w1-1rHD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 00:24:18 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12776bebe9fso2037844c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774916655; x=1775521455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6KkVZ6avnq5JZYkKR1K26BH30WGfxU6tLWicybER9M=;
        b=eOW7/xcDMiK33IuA3bnA7CLw8DBesx4x6LIuVCMrRnXb1vV7DUv6+bt80aJIOQ7ROr
         RrOiGtkG1RvH8vfyXi6rNzxwXb1IJgoJFBUUG1kyfGMDa7BnfsBfUXozaoQn58FsFZ6J
         DbZg0wv020b9QNwBEh5gnF8BNMIC3jefYXMXv/BuVTpX9ubyHNjqmv9EjPxHPZPqb/7/
         iWrRlPmpTc7Swd5U+XDgWQqtZGWsehQb3J1OmYiVCCyNDT0vEcgQNtL5jvvJSDbDHGX6
         gs9LreVf5ZjEStmncLjrgO4/CIv2wMvAFyO+jBpKe4iSChkzuZ9IEPvVLTGxKYMweo0j
         tr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774916655; x=1775521455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6KkVZ6avnq5JZYkKR1K26BH30WGfxU6tLWicybER9M=;
        b=NCeH6EZkIQAzBfabIrnYeIy3gQQ1rzrFoGcBkMPHK4dH3Z1ss870Nm8pf9B8y8d2Yt
         0u93qebyvHDa355RXVkpsBbrS3Sy/jPnY2sT3bJjHZayK1PnjUWQv+vkFPDd2lMkmYwL
         DjTd9j8RoJG6IYvQnNhXnWVTUlbXp8LLA23BsSvN3n1VkTXXNAh9hr4EF8Ryk/IgL+9K
         gC603Ob4l7rU/RT1NEdfCGwntqOpZrh1R9pepSqXmRcCSccxJAjV6iSziu3hRGt8HCSy
         A6f5PdMwIW8uZBCocMNIRp+WdydQ1NPzHJt6yDak2fqOcQdeC06XbOm6GjBwekfNnmXy
         /mEA==
X-Forwarded-Encrypted: i=1; AJvYcCWnJbd1GCh0lvEVcu3bB9eINHXMCi9DuxhiG8zmE6ms1COrAuErQDKj0hjEfHjGo0n7TRs/pR0CeOwHDRLT9D4E@lists.infradead.org
X-Gm-Message-State: AOJu0YxhTMvqAOzO2Q+XzCM+iiZmjpl2pPSBRoGy/XcsuSYH50ApJW30
	obBbHiLo9unEVM4MewPiT52tym6EfYDjEeqWqT1hWikmRs1NOA4wY2eIcFGU8RCQ
X-Gm-Gg: ATEYQzze/bmI2Sq00B1efqI+mFhv1/ixjNnNF56MDjwfv78JuJ9LDIv9N9Sc4vzgN61
	qTHf9xYB8Jzsp36sRJGNt99JsDxpDFYacb9cWWpA+IlCyDMRATEwSlZjq0oHbjZu3o3JJoiLen/
	wJbMMhCicnr2cAlcpfPYxyR6dLA/aIjkl4LFiMi1ST7OdWG29Bv2smyyf+TivB1hB4zNEtwXSko
	w5Fj2e6feAdncZZO2cDbSZSR4hYPXUgDKK6b6QExYEuBwqIKjVbLi/lCh28p2OrwaBAnE9KyjmF
	jZLWXmQRF3h+N/ww9ry7YgXwG1eHOxM6CVYC5xcBdrBwfm/V4A0cDD79My1s5dZIS7g0VgUC8yT
	/4jV9ydzQu4yJhbhDL9m9uGDRnIRDbxxR5W0MtUkOLnExES4XBWRXCNyiKgESEoGfcEbhTlkl/a
	er8i80viZ2z2aOj6KTBgGsOojCEOAdyTS2EMYvUqcCHfXVqz/q6nF3jK8=
X-Received: by 2002:a05:7022:2221:b0:128:d2a5:709c with SMTP id a92af1059eb24-12ab28f3331mr8407522c88.33.1774916655278;
        Mon, 30 Mar 2026 17:24:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm13195709c88.10.2026.03.30.17.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:24:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org (moderated list:DRM DRIVERS FOR MEDIATEK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] drm/mediatek: simplify mtk_crtc allocation
Date: Mon, 30 Mar 2026 17:23:57 -0700
Message-ID: <20260331002357.7995-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_172416_949550_122F4AA5 
X-CRM114-Status: GOOD (  11.50  )
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

Use a flexible array member to combine allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index fcb16f3f7b23..914841d2396e 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -62,7 +62,6 @@ struct mtk_crtc {
 	struct device			*dma_dev;
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
-	struct mtk_ddp_comp		**ddp_comp;
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
 
@@ -71,6 +70,8 @@ struct mtk_crtc {
 	bool				config_updating;
 	/* lock for config_updating to cmd buffer */
 	spinlock_t			config_lock;
+
+	struct mtk_ddp_comp		*ddp_comp[];
 };
 
 struct mtk_crtc_state {
@@ -1048,18 +1049,12 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		}
 	}
 
-	mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
+	mtk_crtc = devm_kzalloc(dev, struct_size(mtk_crtc, ddp_comp, path_len + (conn_routes ? 1 : 0)), GFP_KERNEL);
 	if (!mtk_crtc)
 		return -ENOMEM;
 
-	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
-	mtk_crtc->ddp_comp = devm_kcalloc(dev,
-					  mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
-					  sizeof(*mtk_crtc->ddp_comp),
-					  GFP_KERNEL);
-	if (!mtk_crtc->ddp_comp)
-		return -ENOMEM;
+	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 
 	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
 	if (IS_ERR(mtk_crtc->mutex)) {
-- 
2.53.0


