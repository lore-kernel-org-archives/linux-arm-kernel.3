Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8C5E94121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro1PWATc9CQnHXj6iNekRDYtm/SESVbnHFCM/F3MVHo=; b=Qe/dtv0tXJn6wojWFjVTzgJixm
	9F+7X7HdSMglUyDwrjrhJNP4u4rYPvRbz8aXJ4l8KJToGVIpHiu4h8hJDjQF/DJX1bIgHNo7mHU3t
	8gT9P8R/GHJ8c259uDzpvVgia1OMyBUdKgnogsB730pY/DhMi+TITPjzn1PNGvUKYCrA9GEh3dGDo
	DhWW0wdIIt6oBl5kgYVtXB2LXBkOoAqQHEz0S+Z3rVwRAkP9ocgKS+Yn8lo3OFPSx5b9IR/LnK11T
	myR8U6zZ4KNPTkjOUGYBTFQn1y1h0UvICV0+oj+wbNOs9QxMM0xJujq7vw/IrdyMJAhBBnyOjenfc
	mWOCc7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaK7-00000004tYY-3fSL;
	Tue, 30 Dec 2025 14:03:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaK2-00000004tWG-1eLJ;
	Tue, 30 Dec 2025 14:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767103415;
	bh=+9dZdnFTOLQEU43l4IQfP9P4NbPSetsJuzCQ32SzXns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jIsErsenY6TL6SJSyJkoGGLS1NOKlhLcd6p7YPvROtay4CGMpi7TbCqFFTLQE7hOE
	 3QroSgNQieFaOh8EAMdh3NmrpZS8liS2pVoE0Ba5FMuVEpisJJeG2NByc4CBYfrCGZ
	 I2RQInSZ+2x83QKzlxa7i/4Pc4QjAF6xpL3E7q8k0LPC6OxQy8Zr0qPF+VwJ7DTYah
	 KI0LqFjVUHgwjNDQufzRBzyPRzERTmtH+T+iClywQ+y1BiyttuVq1lPNyH2CYQ6apV
	 aNN/CMIPDoP6lEir/rogTD3zZ8pvA4V9NTRo2H3A7rayEdiJiYSSCdKUS+XhTkhzE6
	 zL0PfNET9SaLw==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CEE917E127C;
	Tue, 30 Dec 2025 15:03:30 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:01 -0300
Subject: [PATCH RFC 1/6] drm/mediatek: plane: Remove extra block from AFBC
 data payload offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-1-6c0247b66e32@collabora.com>
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
X-CRM114-CacheID: sfid-20251230_060338_726907_C6B625EC 
X-CRM114-Status: UNSURE (   9.38  )
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

The AFBC data payload is in fact not offset by 1 additional block as the
code and comment suggest, and this causes the buffer to be rendered
offset by one block. Remove this extraneous offset to get the buffer
correctly displayed.

Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 5043e0377270..1214f623859e 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -164,10 +164,9 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 		 */
 		hdr_addr = addr + hdr_offset;
 
-		/* The data plane is offset by 1 additional block. */
 		offset = pitch * y_offset_in_blocks +
 			 AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
-			 fb->format->cpp[0] * (x_offset_in_blocks + 1);
+			 fb->format->cpp[0] * x_offset_in_blocks;
 
 		/*
 		 * Using dma_addr_t variable to calculate with multiplier of different types,

-- 
2.51.0


