Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09E9E95A91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cde8PHmxRrnJwUmGh2gafFUrLU4hTZjLzmLMdB3QVqE=; b=IYeQ9ULBqJKr18GpHI9L74NFZw
	akZP/HTU2UWErS3X2z3o0CBbOq8DzVs6B+Y190Yo+iCxFFMXFjkmIX6VRAoQFL09NxXLgvWTBmloH
	L7IzcICCDKSxXjK3hYiwxKnLGpWPqqQdZA+1+aCgVHr+nwBWkxs7jTEHIAzmoTptnz3frljhiIcVW
	46ZacOL52n6/TYsnjXSvgHiRWaOpZ8OsC/J4HrAuj7Qm+XWTy7d7K+v9aT67GCA/6CDqoLDK1FVZR
	e62a7T8VovwDJo7jDvN6FINMOtu/tEQvq3YvHfDgePR1ejz37Fi8nBMNGKRdHWfwtSQdXFYuTMTw2
	/9N372Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKB-00000004tb4-1xrO;
	Tue, 30 Dec 2025 14:03:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaK8-00000004tYF-3FCX;
	Tue, 30 Dec 2025 14:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767103422;
	bh=rJV17EF05/w3f78uj2ASdMF8eiM0a/h7oQKf1vfMmHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PDhygWG0x/U4wclIg9h8oZo+gQ//UlYeRFApaehOF9ikP+860UiSJUFwFG/D6F0gt
	 sfg23E/sYyslf10PCqtHV15hGDCse7vVpKRbzpxXbTiNQ4PQ7eg3eJymG26ph25CRt
	 Pf9Praf4I6S6MqQkHBZGXoiCJgcKwacssm5lRzXp4O58EoM4rUd7JMbAsvTS3n8tlt
	 05uoGNPKSurr+uCbeWxq5LCAsgbokXhLtQVXed9YSuQ/Ai5u7QcFlT4ZREf5A8/5Au
	 AYzpzqWOAdtPzVq8lPXj2Pje18qV3X3Ip6u/gLG0pCO7w13lRZsXkpOqwiaIR4gynH
	 zxTzx1VXuIR4g==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7776817E1408;
	Tue, 30 Dec 2025 15:03:36 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:02 -0300
Subject: [PATCH RFC 2/6] drm/mediatek: plane: Correct AFBC alignment
 definition to 128
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-2-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_060344_961310_1BEE0F01 
X-CRM114-Status: GOOD (  12.14  )
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

The minimum alignment for both the header and data buffers in the AFBC
format for Mali GPUs with archicture version 6 and higher (which
includes MT8195's G57 (v9)) is 128, not 1024 as the MediaTek DRM driver
currently defines.

Since Mesa defines it as the correct value of 128 [1], when displaying
AFBC buffers, some resolutions will cause the OVL component to be
configured by the driver with a data address that is different from the
address that actually contains the data as set by Mesa, resulting in
corrupted output on display.

Fix the AFBC alignment definition for the MediaTek DRM driver.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/3848a080534a17ca075e9e95dd3a14abb80139aa/src/panfrost/lib/pan_afbc.h#L364

Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 95c5fa5295d8..46be4454bc92 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -13,7 +13,7 @@
 #define AFBC_DATA_BLOCK_WIDTH 32
 #define AFBC_DATA_BLOCK_HEIGHT 8
 #define AFBC_HEADER_BLOCK_SIZE 16
-#define AFBC_HEADER_ALIGNMENT 1024
+#define AFBC_HEADER_ALIGNMENT 128
 
 struct mtk_plane_pending_state {
 	bool				config;

-- 
2.51.0


