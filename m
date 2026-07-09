Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F18C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nC5NLJ8pW+SqosUddq6nexetvIDgkO0Nqv/OrUYS3E=; b=jfjpGwMt5nld/KmxyGRob7ZQNF
	D6DWX3XyiUSqPPY4yQivqZr99hTdO9rffRrJuwQIDIC9YQMEY4a6D0mzg8t1EtxGqNLupLywvsJH5
	RMhhinzuAjCJ8Su0MNLIGTGp4JLZEGpG48aLd+Wd0DFY5Dx3WD5p/NZi/eS1UDIRF+v0fbs+Boo5G
	l8dYH9LCQkJ4spOIvXTmwSewKkLqF2bP8JoTaYT7syyLKQT2pqxWQso+lMyLuWxLxR/G1ZKW/eB93
	21NVOIHikpPNtpdW+n4rYN7nzKd83+3Cj68iWRkzdoUDXMkFkAUD5fPtMC8IzANkRCEBcGEjYMB4e
	2NXmli+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzC-00000002B1J-22WN;
	Thu, 09 Jul 2026 11:32:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmz4-00000002AnA-0Zec;
	Thu, 09 Jul 2026 11:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596717;
	bh=dgSiMPi4AYj3N/GiA52EKPGuymrYrUeC48hkQYWmpzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pu85P2OgQsZzse2Z+jn/Jhp2XUhUkwrcLXirQIGqooNVjhZMW/cGUbgsROWlkN+ms
	 HQzdCXfnTIERJ98B0XF8QF5NRvp3jnaWVgNXBWFXHFpkRrnOWRk7L43G6N4r2+Kgjk
	 oT68NZAUTEedyg6SxyGdzLXJ6/JU5b/hhA3pmTnFlc3ZKsN95WzS8vuC/xHAN7DZy+
	 nOKEVioW+W1hLEg8O0JzoqmB+xhnn2ksLPKeyhrP9nctHp0Ba8vRQawGH245/ERYcs
	 IybomlvGI72C8L9witIfX7/SvLXJ8vKxf4DmuSeOlk7mRNu3poJclLqgwt1qSqRojn
	 L0CFdsATio1Yg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A80D17E0D53;
	Thu, 09 Jul 2026 13:31:56 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 03/12] drm/mediatek: mtk_dp: Call pm_runtime_put_sync() in removal path
Date: Thu,  9 Jul 2026 13:31:39 +0200
Message-ID: <20260709113148.49090-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043203_173123_C53D4828 
X-CRM114-Status: GOOD (  10.53  )
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

Since pm_runtime_put() queues an asynchronous suspend, calling
pm_runtime_disable() right after will cancel the pending suspend
work.

Call pm_runtime_put_sync() instead during mtk_dp_remove() to
overcome to this issue, making sure that the suspend ops execute
and that the hardware correctly powers off before module unload.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b8421..0d0507890d99 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2866,7 +2866,7 @@ static void mtk_dp_remove(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
 		timer_delete_sync(&mtk_dp->debounce_timer);
-- 
2.54.0


