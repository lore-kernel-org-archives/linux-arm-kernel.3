Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAE4E6FE2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4gc0MT1nGYM0hrqETi0KVfNri3Wxw/4mGQypBxz/xY=; b=YaNK9kSImw48vfKzYZ7Ldsu2Jb
	395401WRuijAYoFLzr61d9ibk6izcSm6fUwiZT03M5xiucYVsicxUPE/MvGaOfRaVo5WHn4arokYm
	KmMOJU0q91X+lM61ul824Si+seU+XznSDxeeUN225EWTs6oOiA4fy2eJFvwh1nJptVOAiUbGpw43T
	GDRGUP/iMITkc9v+oEn7RUhR9NWJqa1Zzu716u+KrN1g7HHwd2Ob7GzYxKcd3U7Lum7Am71p1fCrp
	ujjGv5soAmtdCDkxJzyhKWPrRCrASQCJJ7GTd/djpyRjhqK5xKboQeGB3HiRwduGh6j3Mqfudwg5o
	+GJC2Z5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LN-0000000G09t-485A;
	Tue, 23 Dec 2025 19:46:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LL-0000000G07o-3r37;
	Tue, 23 Dec 2025 19:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519209;
	bh=gYnI8T5uMPJ/mmH4wjqwSpKH7oDdWaPT0zX051fZAyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JoUEImJfF79JttsO7yI2ZYhVhtn8PkHgh7V3tURXYLmlRoP+O/kQld/5H0kOdcQnr
	 IiJd2Gi1ikc9zupBn2CPlHkmeO55D3FU1QFqBhpi/KgfrwojObM28xc/JTKQ7yATGy
	 ucDXI2I0/0DzueslRI4iRNGdxbfkGJPaxlXPokXAWhrUlpAFpyXtzaml/z5jUWXq4L
	 EuI16PvYkWuZLju5mPPzDO8zY7OceT3Lnryoy2WQSLeA5gSD8DTWhh3ZQUc2U4X8j3
	 BKgmEiEDSOGbs624JY/v6Gmtn4p6lGAY1Su7Wj0R2qLgtv0qExSd3BYgEMB9//39e4
	 X/Ehsrpd4z8Nw==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECF2B17E150C;
	Tue, 23 Dec 2025 20:46:43 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:45 -0300
Subject: [PATCH 04/11] drm/mediatek: ovl: Enable per-plane color operations
 on MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-4-0cb99bd0ab33@collabora.com>
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
X-CRM114-CacheID: sfid-20251223_114652_110343_3E541E31 
X-CRM114-Status: UNSURE (   8.10  )
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

MT8195's OVL hardware supports per-plane color operations. Enable
support for it in the driver.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 46238c21b0ac..cfc6a3154f73 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -738,6 +738,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
+	.supports_plane_colorops = true,
 	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),

-- 
2.51.0


