Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBE4CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE3oyBfZXHBAIuUCjtBZLnQ5uXRzUOdkNj3PYR0EAjo=; b=Ensrj8lBC+I8KjlX1ZEHGyamO9
	QDalmx+b0MrHz80xmGYoC7nID4KyHbH/wZ7khX+S+e3kS1U4y6ONWpP9dZh2DohgVUvJkUqsb8L9K
	tcr6rNqm9gPn/8tx9mtwIK/wFyBwYySsI1RsUkjOQHGrcgNx3j1YaoCksKHDDEF5MnBlNVqX1flPQ
	NsRHfXgn3qePfoLio/j8WbK1noDY/QvWbT9+tls7fQ7l00i4EBDbHdZSRQr14qxMuhlqUUI3Nh6Nj
	vdhdO3T1eDXRigNlb+kA6Af84vENZ+jt/fT2um0oA1xT/TJmgX8dYNZ/N/GyFDtKgRdA+vtRNUNbz
	Z3z3NdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7l-00000003mgY-1qIC;
	Mon, 08 Jun 2026 14:38:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7k-00000003mex-1AmA;
	Mon, 08 Jun 2026 14:38:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5EFF40233;
	Mon,  8 Jun 2026 14:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2663E1F00898;
	Mon,  8 Jun 2026 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929523;
	bh=dE3oyBfZXHBAIuUCjtBZLnQ5uXRzUOdkNj3PYR0EAjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NFAeHpw6jf2yf0Nb8YKaReBpuo1w9Q8dED0hBKJm9fpy1q/rt6JSKFTkNLiYw0JQu
	 mVIDXQSvT+os7BZY1jME0Yo1Iw8cSmqvBUVeAZ/u6hlAmXBWhu4EFa8axO6YZWEHPe
	 dYqK/dOdZ8aKdUSuAA9perosfk1fDWQ2rmEDqhMrp09wK1X95q+42VajNYLLkZM3Sh
	 1VsSJJXrdtqXAOozmu8I35jbnl4A0WTPSezinOrGdIqpXgLPxexAeuQZqPItrSr5Yd
	 383n8cFEKjoaG9bw4SLReKsphJu3gmLIKeypdC6MmFrKkJa/b7hGR/cd35l7fihhkH
	 ShL3OjSgCkjmw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:33 +0200
Subject: [PATCH v2 51/78] drm/mediatek: dsi: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-51-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tBLd1+NkEKjYNRkMMidrK+jk1jncrtYgqxTfysMLM20=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql6N/bS9bJRpWqraZ4+/6EKFDa60Fv5R4hc9b7nv39
 4tjV+qWdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJHHvM2LD1675/e34lTDcq
 KRAWstvVF+59NFpnn+vxFd4yrvw3l+a3K05LbbsQl3zp1Ztt/btPKjDWcKi9fd56Kdxux+SSW6U
 Xkxp7lE9eM73jcPFJ/XOPPdzPrkxfzzEhU8oqP1c2e+oXT5FbAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index eb325e68aa59..3f3f56eed3f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -892,11 +892,11 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.atomic_disable = mtk_dsi_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.mode_valid = mtk_dsi_bridge_mode_valid,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
 void mtk_dsi_ddp_start(struct device *dev)

-- 
2.54.0


