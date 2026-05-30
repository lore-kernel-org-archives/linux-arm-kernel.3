Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFF1CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fK8xGPvLRrL/yBjH0Flm1+yHx2HB54f6GUc0x/m2VP8=; b=SYNsL/rwaU6eDsAf2Vh0dOt0ta
	g1dd87aVAYIb93yeKrhGGsGHnbyjWkI4hxWmxrN19la167aBLtgarM4EsJC3dM8/2AvwdC/fkLcsm
	13M0X7gITw5g/+kU4vFlvwNfm7jM3TXOPchaQw2ozBL/1diT6crqZ+636hGSFhtCDfgJn5NtxSCsi
	bgD8dIu1KsL8etBMn0l/dg9Y8aEQg4ylADCBMgrJYequ/cThjW4q3g7iaWKaQ7P1UapFfNCz2EQg1
	s2rIa0HEDqLfQuFuwGLD2uTm390X3b68il5hX6adsM8XvLsESN2VFRQlG/H9UK4M48z1xe3buboAg
	JC1f5gaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGS-00000008nFQ-0IkF;
	Sat, 30 May 2026 14:02:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGN-00000008nCb-15hN;
	Sat, 30 May 2026 14:02:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF497442B6;
	Sat, 30 May 2026 14:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608F51F00899;
	Sat, 30 May 2026 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149726;
	bh=fK8xGPvLRrL/yBjH0Flm1+yHx2HB54f6GUc0x/m2VP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=inwgwn9Wmf0M2Mllbgp7osxU60Ggs+FRKlIoGn5MIsV9wiutJ9lWHTnNJ7VyYTxNP
	 bFIcY+fRmJVkv/kTnfDK670IEDpYnD4akWi4FhkwntIKB7VTn4eaaT7Vjje23X4MmF
	 UbCzaWhJ3165x/WbtWDGskOAQ/1AIgif8qLzyKyWY5BU5P3dx7Hbt+4bmzMFhsJp4a
	 slPYDZPEa4ccae9ffqwUJtSZgc6xlwKlNf34S940VCsowVGGPpg9fsOpyQy8QjkIrO
	 xmeqTxIWlAHUKvRCufAhyeijNy5kR80iit5cOMM2zdLY8tr1tu+irZ3QZPV8Oc+ibo
	 r4EjVpnYvGSDw==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:54 +0200
Subject: [PATCH 49/76] drm/mediatek: dsi: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-49-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/EOAZUBhbhNAajN+OaPiYfFCCi95aRIpS97rxzUUaVI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb721XsbOPOzw89tBv3nHDh1987V+QcnmGf+d2LZNe
 PT7U3OSR8dUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYiMtmxjrNHRHWv/8aW9r3
 qNap3lWpO1PRa7gt/pZpoNuy8LDtaZIvLy/8ets8N+bO64Qp5ro5OYwNL7a+XeV+aeV2c63XM3Q
 i16pI63IzsT5PXHFl5Tkz2dRLhmxz1kZYJIf/WfN2FlulwSwuAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070207_345123_2F8D78DD 
X-CRM114-Status: GOOD (  11.19  )
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


