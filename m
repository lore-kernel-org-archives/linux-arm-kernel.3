Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93E5E6FE2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEpv+M1ZhATwvuXxlKTIzjZRvKzL0LqqyunY1Tuwz6g=; b=Knr3+mV81nh0MzCwlkK2fas6t1
	yrGNWUUm+HKHqyW/l5si9s85rt9v94t8PJlPLetKqQVha+vaOa3woC1byUWygk4s542isQoH9Yux/
	pmZL0AT7yZFr5do8abIlDAhyeSYIZzfWbcZckXFWTgoOHHx884LW4AhqHDDpOkEI60GOaX8ETiHjL
	qjqBZaj3mUBiHbNwz0QRs2/LrpH8SB9YEozJb2nEXgeTzTAmT0nWEWrLufTeGjt76HsbSFLvB3Mte
	gHPwGAGHkL4tRoCgQVx/FD5HVeT0YyoQrIBheM2yDKF4C1EvaNbzzE/JxsCds2lCGyv8Z3o66nEEU
	F48PdQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LY-0000000G0Jd-3nol;
	Tue, 23 Dec 2025 19:47:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LX-0000000G0Gc-0O8B;
	Tue, 23 Dec 2025 19:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519220;
	bh=bNOxsvSYwL5OP38kXCritpPYbkgkalJFimlUudNVI7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C5tPBURdYF6xHHM7eAqMb/5jTU/p0T4pZ2YNh47DIBOhOI0CET+Ttk5fIfpIBnV2L
	 YyzXnZtquchvwR4Zvx7mGefijqCbl8lGT4pFSxM4msJxPTC/WxF4cH9s8m7xYcWAfB
	 U/Ao4LPPkO9tqS7UG3BadaC1gxcYoBxJvWG/v8d2MJ3l05iK2XnIQGbTOvf5szLuZU
	 kbZqQh7Sk8D7407Vebmsn5wi+cBUl1hAWpDx/UW8BeGkZ0hnHm+ZoRUk1oh4YQNojP
	 S0g+cEteEDGu7GUXzfbDGs0lF2/WgJGWA2386FB9vyYal/PgHr1Dp4BhPrYFj3RJ2j
	 jcH30aOQmBpvA==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DB6417E1525;
	Tue, 23 Dec 2025 20:46:55 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:47 -0300
Subject: [PATCH 06/11] drm/mediatek: Add plane_colorops_init() DDP hook for
 OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-6-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114703_376279_0F9E2F4B 
X-CRM114-Status: UNSURE (   7.64  )
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

Hook OVL's plane colorops initialization function in DDP to allow its
usage by the MediaTek KMS driver.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 94b356da6de7..ef906b2aff74 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -331,6 +331,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.get_formats = mtk_ovl_get_formats,
 	.get_num_formats = mtk_ovl_get_num_formats,
 	.is_afbc_supported = mtk_ovl_is_afbc_supported,
+	.plane_colorops_init = mtk_ovl_plane_colorops_init,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_postmask = {

-- 
2.51.0


