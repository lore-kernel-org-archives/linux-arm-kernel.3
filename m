Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A64E94121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2ELL0pHbGQrgtyoBRnlMMkxNwHMgYymH5/UZts2VKg=; b=i7bGwQ+MqQXhhEMLj3LQdctzdP
	TdoaebFVHer8loE03NRA9ymR+o/2vtdCNoaZXH2OgtpZVwFQGNelijUMT8u866HSd4knPcnN9iV7s
	+F1qzE8h9KoyfdJ0btLwAEStziGEbFvD5LXXxmdHvZUDh0Zv34Ir/Ayf9BGx437SG3JGaMDoXE8fi
	FR6ESQErbzrbv9LPp6wLWp0wOv0+92UulxpLurS6F+C/mxQ4Wn397z4UHCZMokLqmcEzMbigW5b6E
	yLXPrVV7R9SeA0F3nRdtkHpUTNERhY4+YIZVHnsV4aORb71hqU+1T1YwPvi6N74sWd8Ifda0Mdc7T
	hPAdF0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKY-00000004tv2-3Ut3;
	Tue, 30 Dec 2025 14:04:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKW-00000004trc-1a4Z;
	Tue, 30 Dec 2025 14:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767103445;
	bh=2zwHE6VS64y4Vju4EqV2SaPOMxtYDh5dxEHGfmBSgxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iYFVD69PDeKLH+y/WbmkmAQ3srpkFolh002OMQj1ttIfP4JwfqCB031iSvR6qPp0Y
	 uZ2+8W9VywIL5fo53xJLuJ2eo8bowdfn6Mkje9J9Gaa55X1D2JnnkgkPgbKz91nvyl
	 sNGrF26v6w+Kiy2/jhVeVoynlg3xVrF42n1mHLXrCoIcGduuYhq//pJzSdhSOC4s0w
	 dlna8aSn1dDRZjAKPvxNaV7KWY48JnoXQgIJ9hGFbjbl1fGS+Pbdy9NUyPaQs5iCpO
	 cvX9T9IQzayeQvdUyJVNNcADzyXhtsdkZvfeSykfmVawDRzQGSkCTeb0DQtUl8g6N2
	 IDbnu8DomLL1Q==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2968317E127C;
	Tue, 30 Dec 2025 15:03:59 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:06 -0300
Subject: [PATCH RFC 6/6] drm/mediatek: Re-enable AFBC support on MediaTek
 DRM driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-6-6c0247b66e32@collabora.com>
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
X-CRM114-CacheID: sfid-20251230_060408_606569_CBA9ADAF 
X-CRM114-Status: UNSURE (   9.55  )
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

Commit 9882a4064003 ("drm/mediatek: Disable AFBC support on Mediatek DRM
driver") disabled AFBC support on the MediaTek DRM driver since it was
broken.

With the bugs in the AFBC support now fixed, re-enable the support.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 8fb08768e8ce..38dd94cdd665 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -22,6 +22,9 @@
 
 static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPLIT |
+				AFBC_FORMAT_MOD_SPARSE),
 	DRM_FORMAT_MOD_INVALID,
 };
 
@@ -69,7 +72,26 @@ static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
 					   uint32_t format,
 					   uint64_t modifier)
 {
-	return modifier == DRM_FORMAT_MOD_LINEAR;
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	if (modifier != DRM_FORMAT_MOD_ARM_AFBC(
+				AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPLIT |
+				AFBC_FORMAT_MOD_SPARSE))
+		return false;
+
+	if (format != DRM_FORMAT_XRGB8888 &&
+	    format != DRM_FORMAT_ARGB8888 &&
+	    format != DRM_FORMAT_BGRX8888 &&
+	    format != DRM_FORMAT_BGRA8888 &&
+	    format != DRM_FORMAT_ABGR8888 &&
+	    format != DRM_FORMAT_XBGR8888 &&
+	    format != DRM_FORMAT_RGB888 &&
+	    format != DRM_FORMAT_BGR888)
+		return false;
+
+	return true;
 }
 
 static void mtk_plane_destroy_state(struct drm_plane *plane,

-- 
2.51.0


