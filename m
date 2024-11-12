Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785E6D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B3mZr64eLqXOPvQw4rIGbWSUmJmj/pCDaeGxwRb7zBs=; b=FydWUFP9DEyMozUzySfzI23WkH
	8BLjhk5YDbzKsfcGh8jl08m3Wq8wU+BvociNCInGaqXdhXb4ghNbeAaKwPvqO9TvQAmZJClEzYWtA
	QO1brtztB+RSfm62BnoEbsOakDUk2RLNw2td57OH1lhxvHghDNyZCpMa+UDtRrDNc898bt2aZ3I5Z
	6r4oq5tXhaAaO3trHBd3WFUmIcFgW34Wfno+eOqg50M4Us5qjPOP9W9jN/33cMsp7ZQher8BnCAsl
	GvK+ySnQl8JZjWHKfD5x4oKRRg36tI7xjQsbN0gMUCRo4z1PVFH1inNNWDzp+I/8pw2kO5ETsh3XC
	pbRw8OXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApUW-00000003JDe-4Bwn;
	Tue, 12 Nov 2024 11:55:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoTk-000000037GQ-3qgJ;
	Tue, 12 Nov 2024 10:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731408634;
	bh=d0rkJCXmARckOR0ApqbLV71XuCQ8/P+BmXaLUyM+hZI=;
	h=From:To:Cc:Subject:Date:From;
	b=huGsx0N+QXnHFkB+EPH2jUGLA8Dq53UwS++PogGrliWtn0fp5bAnf+l52ny29gc6t
	 pCB/zf3krpIjPf+REG+5i4lrLMduo+9Y8iWqpa1NrCqypuwN7E7NR1u50hh/O5BBT0
	 Mu3RX7NmQEFUhbB7f8Ix6iIXGSat05fSepWEV1HKa1/JDYSw8ypJetGS/Eq1/Wunhm
	 KyyasO+Ssr0QYjlRKFu6XrlHkQ/A2iimAsmC1q/K3iAuxEGKfGvlmi91kPAbE2uz2n
	 M1uFDusJpU4xDWVhZY09qgAOlikC27855i5ND+UUrtA43eW5aAjNBJnjYhA98V3ymG
	 YOtWfZ79+B1Aw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 108C517E35F0;
	Tue, 12 Nov 2024 11:50:34 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sui.jingfeng@linux.dev,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dan.carpenter@linaro.org
Subject: [PATCH] drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one()
Date: Tue, 12 Nov 2024 11:50:30 +0100
Message-ID: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_025037_133593_3866B819 
X-CRM114-Status: GOOD (  13.32  )
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

The struct device_node *next pointer is not initialized, and it is
used in an error path in which it may have never been modified by
function mtk_drm_of_get_ddp_ep_cid().

Since the error path is relying on that pointer being NULL for the
OVL Adaptor and/or invalid component check and since said pointer
is being used in prints for %pOF, in the case that it points to a
bogus address, the print may cause a KP.

To resolve that, initialize the *next pointer to NULL before usage.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..bc06c664e80f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
 					 const unsigned int **out_path,
 					 unsigned int *out_path_len)
 {
-	struct device_node *next, *prev, *vdo = dev->parent->of_node;
+	struct device_node *next = NULL, *prev, *vdo = dev->parent->of_node;
 	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
 	unsigned int *final_ddp_path;
 	unsigned short int idx = 0;
-- 
2.47.0


