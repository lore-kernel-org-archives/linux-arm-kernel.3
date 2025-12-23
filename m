Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAAFE6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU6T+J1+Z1ABalW9OPYg5VtoP/UavCSR8CGTddbBx6w=; b=PinJW+wZ9U2tiY9QTqurHFZbJh
	aA42dPFSqvSDi/o3oxTnm7cEQz4DjufGUNYmo+mJgwUiiIOBZUSQFK+9PCAZqnajua34p/iASkhtn
	sQ/BGnXu4EdK/8NNrI0fhD+i4QkHJyrV3U206YM3xlSUzOgAMKfFw1MBoCbkSGYF5uU2avlnNtJDN
	79pk8bQSYCYLav4Gaa6iQkQ+gqgfxDa4Bzjv/NeIFCC1MbtiB8yXZkFqtuWFX07kf+rOfGSL1VJ1y
	rImU7ib7t+0Aq1hPw2VmER9XpTt287y3+lQrMYbG2LbmbL8p+yiwGTSf55SaF1BH3QIqcGgi5KgY/
	tBZo2uqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8L6-0000000Fzye-3qSJ;
	Tue, 23 Dec 2025 19:46:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8L5-0000000Fzwx-0mh3;
	Tue, 23 Dec 2025 19:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519191;
	bh=AspixI/Zehlvp8aaMQOtqUnGyuNV8eKlnuQrhHE2EB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=keKOzdTCO3rnHak+ZHukTtXHNIjGooF9SNvH+vphysxH+cFAIRRgGFPDj2fMJ02xO
	 nLxB3CI7hhElaV6KQmkDwcxmBr+o+/eGRW724DXvU6SQfYOkhcy8Y9yq1u3WKy+ZBH
	 tfzE5zUq031jwhz3x6c5YvfeuXIBwXO4Xj+R6kFY6PrartjuHm73ZFQsk166iXPPbk
	 Q2GUoZGRXTS2w5E35HokGmxxoZQX7ezLmmST/f66P5pKE/9U2aO/c/12+anZ2TozmK
	 cLXmhJJivqqONZc4h48QVwd4oYk62pLwJyaZyapqUqIzZeAkySH/20728xc0yntoyf
	 lCCIjXdDBaHcQ==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A304117E10DC;
	Tue, 23 Dec 2025 20:46:26 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:42 -0300
Subject: [PATCH 01/11] drm/mediatek: Introduce DDP plane_colorops_init()
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-1-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114635_380037_0F8AAAD9 
X-CRM114-Status: UNSURE (   8.65  )
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

Introduce a plane_colorops_init() hook to allow DDP components to define
how to initialize the color pipeline on their planes.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 99bf1e1015da..3a7393b7f4c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -13,6 +13,7 @@
 #include <linux/soc/mediatek/mtk-mutex.h>
 
 #include <drm/drm_modes.h>
+#include <drm/drm_plane.h>
 
 struct device;
 struct device_node;
@@ -86,6 +87,7 @@ struct mtk_ddp_comp_funcs {
 	const u32 *(*get_formats)(struct device *dev);
 	size_t (*get_num_formats)(struct device *dev);
 	bool (*is_afbc_supported)(struct device *dev);
+	int (*plane_colorops_init)(struct device *dev, struct drm_plane *plane);
 	void (*connect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);

-- 
2.51.0


