Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFB7C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frlNAx51raE0xlHGIwaZMiq9j0m21lFuSU/xrSCHF4o=; b=D/S65dsqfFK2nOOMlRFlJbVThI
	5u+kwl/dMIM4aa2qkuVoLhOMfRfTVtQY3cUsI6DieKyo7mLW9FK8yxQkGZHFvvoEt0LJ6mZdwSP1J
	2X2x2zv6PUUK6ro+HY2llRwJmG4gt1EWd8sIy+2zXpCk1K8ER+1mt4YgyGjfZMowHP9OiIghzzxE/
	tcg8zWQA7pFaffeRWUNUi/fEt1UUfr9a5mKg9kqeNFWTNXy/rCk6g7IApdzq30mAMNC2h1EnJO86T
	AwCNPjHLw26KE3aFYUjzAIOJGvMuFbFarNfaWGL2rpuLdQg0ZiFCwiyOMtNwAirLcI12kPsl5cJ1V
	rJ18M0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nVK-000000092Ui-1Fmp;
	Wed, 16 Sep 2026 11:08:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nVC-000000092MZ-3b9Y;
	Wed, 16 Sep 2026 11:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556912;
	bh=IOra0Av6gxMDSD0lippEBFlcuQ2SmjjMSqcRMB0XwNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbvVHDEgNz4o4l8PAXtobZkZFbr4btAFhsUmoqfEgbBRwOl8e+HkZFO0H+8Z2nzYq
	 4o5dZkq5oBx4AXbnPXtA153hvbduf31EJYvGqoj0DD+PmDL3xm4wdR16uWKvOO+0mi
	 6AKI4MPkdmzfVc6AJ7I8U728yLbaxgmokYov+UBuCvtPycgwLmfR49I2IUdGezTfqs
	 198+haU+sK3Wqcq+bGRBvddRxZ0alwJsUhJzFl7oQOu++R9hpqpQr0f690gSxpqssQ
	 B0O006ThM/djvAFVjpFqQPf+r8guHvD0ko0FpV+7t8xC572uxSNpMznod03mKLIxiM
	 Nh0JhEvWW0xIg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06BBA17E1289;
	Wed, 16 Sep 2026 13:08:31 +0200 (CEST)
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
	jason-jh.lin@mediatek.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v9 04/13] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Wed, 16 Sep 2026 13:08:16 +0200
Message-ID: <20260916110825.102631-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_040835_065431_13E52B31 
X-CRM114-Status: GOOD (  12.16  )
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
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5c3b1f2d6ff6..28ba532210ff 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1095,7 +1095,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
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
2.55.0


