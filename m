Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56383C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvMgTaBglCpRBphZhhMgN06pEhZRxMG1CwlLCM4ocmI=; b=E2thTqiZXK7u18rWCXcNwLoDhH
	dQckBWnrAuEGR1dQDXlscdV5M+euoaJC98MtTLhJ1R05TiaxOiY1syidDjizmXOnj0ceQQSczZRqk
	Kkl7fAxs45EHAW9HrPE/2rcBHZg+EErwlcAC95TEmNFfNv00rPFrQ2h8DOBxGNjuS78i7fxDTic3G
	SjiGa3NdijRYUCGObints7w9HYGL72Jo9Y6pHqU/IruHCdyceS83ZmfYpXQBg0wsLtQfl2gLywIlJ
	1jO/LSqAZwWFSzQpH09qZTiKkReGfixm1sLNrpMTks7mTzgYuNOkVxVw4Ey3ibP/gzJ8d0w1VNVnD
	3LjYgRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjy7a-0000000Ecu3-1SJU;
	Wed, 15 Jul 2026 11:49:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjy7J-0000000Ecbf-296f;
	Wed, 15 Jul 2026 11:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116171;
	bh=8PBnueuBT6jwz1nO5Ycv+65fEIKpNJ2+KGYPkC4+P8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSGFzSEvgZwYM/kyBHJictGBvX5F62HfU3vEDw4uVqE/6lBCeB7Js+5WxzmWcv0Uj
	 Maazr/dmdChKePCFNsakmx3TX0bjqClp2zPH/Q+WbJ9l6JTU3OJfTwAbSURGFkh8Ea
	 Gcst9acwA2ggdEGdTAJmQZn5S2Z8pPTFJBp8pk4C2R+AfdV25Aw03Dv92EZBA93OVf
	 BW9/6hkgPUL/vzjomfi89ep5l0Bny2hHsKU7igwEHPsAK11nQp6slBHyto5kF45vva
	 IjN7pjyLY/v1vn4g52xg9+AdHPSfvEBCiyLbd8PVO4qt6CwhfVK2Q5u4TutUUYXwBK
	 Ei6ZrlffynNIg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0AB717E0DFB;
	Wed, 15 Jul 2026 13:49:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v5 04/11] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Wed, 15 Jul 2026 13:49:09 +0200
Message-ID: <20260715114916.19690-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_044933_724892_4DCED5EC 
X-CRM114-Status: GOOD (  12.00  )
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

When binding the dsi component, the .bind() callback initializes
the encoder, and then will optionally trigger resets.

Should that last operation fail, binding will as well fail but
the encoder is never removed from the DRM encoder list and if
the driver gets removed afterwards, this may crash the kernel
because of an use-after-free condition.

In order to avoid that, cleanup the encoder upon reset failure.

Fixes: 605c83753d97 ("drm/mediatek: mtk_dsi: Reset the dsi0 hardware")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8ab5c3431dbb..e3d7338c35e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1090,7 +1090,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	return device_reset_optional(dev);
+	ret = device_reset_optional(dev);
+	if (ret) {
+		drm_encoder_cleanup(&dsi->encoder);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
-- 
2.54.0


