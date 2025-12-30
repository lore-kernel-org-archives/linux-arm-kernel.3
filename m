Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2299CE95A91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rseR4zjVbsqX/7OjmWFiGavnFPtsuSxIULZ1Xj0q/E=; b=Fzz16YTJofvsggXQD1bhv+d9dZ
	+/yLNRBpZaefQLGGTq6pDQZftR2rUS0dJJHFnPIRWsNx0d7b522VjV8cuxKoN37jJHHPQfrNbHEbu
	sDB1g/H4Hq5rRAYPOae3QzGtkKKXcOXIE59gdeQ9Afz2lJcK5dtU2JVWEL4lh5BsHBxgx00knuFna
	bcopeIvbZkX4qDMei5UKgac7EeWVjNhpypSukkxp6/xET3ZjtvfYLh753E4F4hgX9yJ7uVVMmflTR
	zMJSUym5CJ2mfWIeD7kV/uHE/4V0mw4rKNDOUpAFwomfEkRH6cRzHnEyV2MwDuMQPZ3sG0VUHcWYh
	DhfYZXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKU-00000004tqw-1Cz3;
	Tue, 30 Dec 2025 14:04:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKP-00000004tm7-3oSx;
	Tue, 30 Dec 2025 14:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767103439;
	bh=7ItMKgsVy2ANsMynoBcCjpMv8Wqb8/BHa+zFioLqrpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y7JDCR3KjF5xO3Cb9p8u4LJAanA1E+R1SJFxaZgjU/Etndc0lo1hPKtGny9QXsImT
	 lBOmOs0SkuSiz4Ptv3Nlt/0iBvRxGd4xf206J+9utGm6abmLEq/euGzWZRdOvdZSZ1
	 LjKb5xEi7xZWwiHyG6O6vYa6Hi4o0+lMMiGrrBERqjuUXbW8YDzN4nW5QCX4WZAXQk
	 WMYNC0Pwo8ipF7j9E9QzlcEcBMx+MgvtU2EXyFMuEBrw4cx9qa2wuDoDkPPks4G1gs
	 ZYjBKH76CLrhKOfkj4lXTi3YcflkSsO+IU2IClTszAln7TeoN8veD38tjUJYeExS5f
	 aIV0UPdepajzg==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8242317E0ED3;
	Tue, 30 Dec 2025 15:03:54 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:05 -0300
Subject: [PATCH RFC 5/6] drm/mediatek: ovl: Disable AFBC on MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-5-6c0247b66e32@collabora.com>
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
X-CRM114-CacheID: sfid-20251230_060402_145161_8211FDC3 
X-CRM114-Status: UNSURE (   9.02  )
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

Despite MT8188's OVL being mostly the same IP as the OVL on MT8195, it
does not support AFBC, even when the same register configurations are
applied. Introduce a separate compatible for it with AFBC support
disabled.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 196b874057ba..97f6694772d4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -762,6 +762,21 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
+static const struct mtk_disp_ovl_data mt8188_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.supports_afbc = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
+};
+
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
@@ -790,6 +805,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8192_ovl_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
 	  .data = &mt8192_ovl_2l_driver_data},
+	{ .compatible = "mediatek,mt8188-disp-ovl",
+	  .data = &mt8188_ovl_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-ovl",
 	  .data = &mt8195_ovl_driver_data},
 	{},

-- 
2.51.0


