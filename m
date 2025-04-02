Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB9BC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu7GwhalGcQ35FTiqXSPo7s2l8tc3gqC2+U9o8nK3yo=; b=E5SSrz0kglqTOPsR2uXpoaG8xj
	O8izHUj3n363gqWTxrREUGexmwCWtmefizrIZqOtuH+sQJ/JhDgPuABxghYah3qkj2Zhd4hmAO32L
	SrXY0RgnS2F12mcK+euqVCrWFuV19/9ERSfJHSMNxwFKzf6+1vRAbHghQ5lchLFyCbQxXVDQjbfy8
	Zkax3mOdLI1zxbzi3M8+NC+t1ysWO4VdqRnXxadwo2fe87A+8EjLV3bVXoO7laoGCMaFLGj9/nL0W
	5rqiU5Ce2cLCuG0HjJH2UrzzHNpj14SOsdn36MANEEiebcLWN3Kt23z/t294f6y4bSnkb71Q5WN6w
	FkBUt59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzthL-00000005ZX7-3n9G;
	Wed, 02 Apr 2025 08:43:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztaR-00000005YFq-3GA1;
	Wed, 02 Apr 2025 08:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743582998;
	bh=517dgkQqDqOu7+fW8r6UKGqvXBz5QZHHTdbH5SjV88w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B7RrbOGkSiM1d8ioreYcpagcaWvsoP/5rQX9ITW79aijKXvn+52UyxaEa4TywV0Dv
	 EsXKc+QwQolW2RNQEu7hBbam31TB/1KADHl3Y9rs+YGIK20lHXh4MeZXfAkhvHhPBt
	 zPkOlzM52dULSrtjWLsIa+VgaOq0Z96E3Qq8BW+wNoxewtYstfeipEchIh7KyYLR8P
	 fOd81XTTQXTtuj3ZkQGMAkU/t33xj0eJkqnFeiRXl0uboJrBudNR4QF93y8w9v7lx+
	 cqBZQk0D6Q+Tg2lEs+o79EdmYS5ayOHoejw7v5mYfGjfcliHv8hwkpj4VC6bjI3MEH
	 T3HwkWl4zm9bA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9261517E02BE;
	Wed,  2 Apr 2025 10:36:37 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v1 3/5] drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err
Date: Wed,  2 Apr 2025 10:36:26 +0200
Message-ID: <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_013639_961184_350064BC 
X-CRM114-Status: GOOD (  15.68  )
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

When calling component_bind_all(), if a component that is included
in the list fails, all of those that have been successfully bound
will be unbound, but this driver has two components lists for two
actual devices, as in, each mmsys instance has its own components
list.

In case mmsys0 (or actually vdosys0) is able to bind all of its
components, but the secondary one fails, all of the components of
the first are kept bound, while the ones of mmsys1/vdosys1 are
correctly cleaned up.

This is not right because, in case of a failure, the components
are re-bound for all of the mmsys/vdosys instances without caring
about the ones that were previously left in a bound state.

Fix that by calling component_unbind_all() on all of the previous
component masters that succeeded binding all subdevices when any
of the other masters errors out.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6b31df587507..2d6562b29755 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -482,8 +482,11 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	for (i = 0; i < private->data->mmsys_dev_num; i++) {
 		drm->dev_private = private->all_drm_private[i];
 		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
-		if (ret)
+		if (ret) {
+			while (--i >= 0)
+				component_unbind_all(private->all_drm_private[i]->dev, drm);
 			return ret;
+		}
 	}
 
 	/*
-- 
2.48.1


