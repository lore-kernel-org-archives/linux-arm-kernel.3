Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC0AE6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GGna2JnKQuKrOCIvjhD/cFHS1w4zzZ9XYuLKLepy0k=; b=3Yib9IhawJ8ahspv2xRuXfFHUZ
	USSIy5rDbYyUQxjUd7zhsBvVWEfvojPNG+B56SinG3GHSGBktZXF2+G1RIK81FMXB+HjE0DN+xRHf
	FYrPPDOXQKi7S7zhFNElmiSkM4xcqZ5rJswGk3JWH3EvfUafnStBIRvCFX19wrO9iCv1hZ7dU0pYn
	M3sG24KPy3nij+YfHO3PETyvd3X/ii5eXVQE6n0dr6AHe5ric/+w7wiISl0y9HSXmabKZ/BhxlneW
	C57cbCoAfUZgT7aTEkuohSrJOACBoOY19YXJu7SiHpv7ubab+n191d3A91P6xwScy0djbqkzWgUzC
	9Wckik1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6jm-0000000FuZT-1gqr;
	Tue, 23 Dec 2025 18:03:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6je-0000000FuPv-24yZ;
	Tue, 23 Dec 2025 18:03:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766513019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BojjSr5SYbGIdjzaubVHN1sD53gRL7Q9GU0OH8rhl58rOoyWFzTR7bBdBlugqykaPZkT5cJdXOEnpBhreBxkxlLVDTeI60sBvJCus4nTI0BLT14RpjcY8FRVD+sIvcIbgnt0ugRs3f3ZblN+InLUpag54NqLfa12VMcXHPA7j8k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766513019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8GGna2JnKQuKrOCIvjhD/cFHS1w4zzZ9XYuLKLepy0k=; 
	b=cgxoJzx3HZl7HmJl7LB38otTtXAoEYq6wadPzIQON9dZxWg9uvxMLKDZHYEt/eBgj4UCw6v/nvacBrabqjy1aaaf73x6Bd2Mq9HKvUUJPQNU4ckSIuTYqFzIwvHjd8Ge5IssnqLZ2UIPLXj+BZfNrn4zfSI+psavgnPJAYq2q0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766513019;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8GGna2JnKQuKrOCIvjhD/cFHS1w4zzZ9XYuLKLepy0k=;
	b=T6kBIg73hbYu7uo3p3+0oJmZGrePBf6T3iy/1JKG8qDtMQ8gtqlkI0z0laA9EbMn
	mmp8mPtNg29eHb6B7OAfNUehHkBSNHJK8jAZNnCc5YqCdjzopFaWi2QmDY5xlNV+ZY0
	JlbTALQS3ddSTppwO+ppRNCVGyb/w7xVNBJ3/zso=
Received: by mx.zohomail.com with SMTPS id 1766513017105214.8943639514565;
	Tue, 23 Dec 2025 10:03:37 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:37 -0300
Subject: [PATCH v3 17/21] drm/mediatek: Set CRTC color pipeline driver cap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-17-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=1133;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=8Jlby476xSmK6n5wnsQz9iEV6+65MeonxppBOVK4bOE=;
 b=sMHOtgI8xpup/GiLFGJKT3Dew/5W6qaT5slahFNalSzeOT78yvXT9yAR3bUqW/flhpwVJ8g7i
 zm8J4YdstTUDNGRtI1sy4vpemwTib2Vtamnn5AqDpRRmsDb+mKHn5zE
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100350_697435_EE8DCC6B 
X-CRM114-Status: UNSURE (   9.56  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Now that the driver implements CRTC (post-blend) color pipelines, set
the driver cap so they can be used from userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a832616..554b310ca11a5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -613,7 +613,8 @@ static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
 }
 
 static const struct drm_driver mtk_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC |
+			   DRIVER_CRTC_COLOR_PIPELINE,
 
 	.dumb_create = mtk_gem_dumb_create,
 	DRM_FBDEV_DMA_DRIVER_OPS,

-- 
2.51.0


