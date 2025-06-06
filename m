Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AC0C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 12:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0U8YySrCzcQCHx1OTzJZTq9ssrB3rQxiNR/F/5giYA=; b=VSHB/3O1+dR5mtsGGgTpRSQChv
	7SYHEjy0VFJ2XNdWFwVqsdF0u+mO+IkHwekmiY/mtyrkMKO2rnwhZSAemo3JPylh9KCFdnjIKrdsi
	ur7zfGXEVUUlzdgrZQ/4izIMXxZ5NavLcaJZ2Ufv2OGIlgnvdXMuPO6QXuT6ozSOukp1fjobVJrYz
	cHf9XS7fg+tq+yFivXq9517RahyEZJ0IBDWSbCCAbt9ZEENj6uR5eM5E9lt4/n+pNvoDwET/mIYfO
	/uV3BHFqDxM4d7ilz98kFlqWO53lPq52ANbky/v7hxH6SyCJ6Ax+3AD353iy7dWsA6aHQzGGIGX5L
	vSVYp2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWaZ-00000000Hkg-34lv;
	Fri, 06 Jun 2025 12:54:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWYS-00000000Hc8-2suH;
	Fri, 06 Jun 2025 12:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749214333;
	bh=ONaGR/IRVw2brl1DvzP1xMGhlckfUTMY9+SsqjrbfPg=;
	h=From:Date:Subject:To:Cc:From;
	b=UsuohR8BVGL3hoDGKOENRcMyYwrH7PXGB6nIzpJJcd9dsTKapwMwwIYfjThp3U4Dj
	 CjE2pYUEez99p0mmuzfBhOyyKiF2s5qLMNNuLg1/ULMYVLKfBrQOcphJAoWk+ZdXLF
	 8mpXv9jZ7u29tNa4f4z3ZtyBkBmPeDp23ebvVPLnErLe6Ya8E07dAEON8q91eTq1vy
	 YE7i54WFjwBLn6EPsvWC0EPaxXsrsfgkWbzr6zcnnsLhNigHIDiCZJOSmMwaiF8+8+
	 HU0+OVLXzNp3JVyHzzy3KVfNdix50em8HlLgSO+7aG3reF1ziMjJpsr7sErTDDwjIf
	 f9gp6zkfw5Mng==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A8D817E0097;
	Fri,  6 Jun 2025 14:52:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 06 Jun 2025 14:50:12 +0200
Subject: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAPkQmgC/zWN0QrCMAxFf6Xk2UBX2NT9igzp1mwGbTvbqoOxf
 zc4fAon3HvPCpkSU4ZWrZDozZljEKgOCoabDRMhO2Ew2tS60Q36cr+6meWeqnONIy/4STFMOMR
 HTFhb2+uxccaZI8jInEgiP8Gl2znR8yWesj+ht5mk7D2XVgVaCv5d0G3bF5y7KZShAAAA
X-Change-ID: 20250606-mtk_dpi-mt8195-fix-wrong-color-5aab0f6d2d27
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749214333; l=1912;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ONaGR/IRVw2brl1DvzP1xMGhlckfUTMY9+SsqjrbfPg=;
 b=r+8ZRVrWvUhL7zhQKD0bz2TF1ADcbbp8UxfIUYKGE063dqymCkH8GA0zB9oOA53Fu0uliBLWk
 yAQnN9JQ/64DgZai79+2/AT7eYsADajmrCfzOgjnNv6+STVh5slLa1M
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_055216_885763_360F669F 
X-CRM114-Status: GOOD (  10.07  )
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

Reorder output format arrays in both MT8195 DPI and DP_INTF block
configuration by decreasing preference order instead of alphanumeric
one, as expected by the atomic_get_output_bus_fmts callback function
of drm_bridge controls, so the RGB ones are used first during the
bus format negotiation process.

Fixes: 20fa6a8fc588 ("drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6fb85bc6487a019cdcdb3770dc06a1deab8d5bda..a2fdceadf209f6d2166e7523b82ca18c82c7d435 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1095,7 +1095,6 @@ static const u32 mt8183_output_fmts[] = {
 };
 
 static const u32 mt8195_dpi_output_fmts[] = {
-	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_RGB888_2X12_LE,
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
@@ -1103,18 +1102,19 @@ static const u32 mt8195_dpi_output_fmts[] = {
 	MEDIA_BUS_FMT_YUYV8_1X16,
 	MEDIA_BUS_FMT_YUYV10_1X20,
 	MEDIA_BUS_FMT_YUYV12_1X24,
+	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_YUV8_1X24,
 	MEDIA_BUS_FMT_YUV10_1X30,
 };
 
 static const u32 mt8195_dp_intf_output_fmts[] = {
-	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_RGB888_2X12_LE,
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
 	MEDIA_BUS_FMT_RGB101010_1X30,
 	MEDIA_BUS_FMT_YUYV8_1X16,
 	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_YUV8_1X24,
 	MEDIA_BUS_FMT_YUV10_1X30,
 };

---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250606-mtk_dpi-mt8195-fix-wrong-color-5aab0f6d2d27

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


