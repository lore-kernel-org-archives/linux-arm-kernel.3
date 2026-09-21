Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A2DC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4/riDOncgRUhzR5epGdXHOZl5OnvQAmiqOQ7MptE7w=; b=oxZPCgz4e2T7qmGpir81nQmuKs
	RNcBvxr83tX8mjp2XF7htDr/LBdcJxy27wFhHC/KItX3uFaFgPPJgBGrGadXqT25NfpBC4NUEK7Gr
	3JyGydtJwtVHCw2KeNP4zZrnJPJqGalUKJBzviJQ8FEwdYb5P1wKOaD+tCmEpnorQgPrPxwyU2MrV
	J+OABKduoWYaS0v53b5D/ot4eIL8mE5KTh8WnstOKh8uN4N3VKGIT2W2xto+KJbU1d8qc8S8UtvQ5
	wPOk6wHsqYxSNvaOi1G/TLuKWudByvxW6p+HrBAk9sKLdtnPHZAyGMvGROL73hi1AZeFRToJCV0nV
	EoBA8yUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cNG-00000001wTK-463q;
	Mon, 21 Sep 2026 11:39:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cN7-00000001wMN-0NxE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=h4/riDOncgRUhzR5epGdXHOZl5OnvQAmiqOQ7MptE7w=; b=kJTrtgL8j4SN/no6YK2tj+owZA
	jRVbdat2UqZho152zsbhIYi7s9SGB6Eu6psjNvJS60iEAOXUQZYVFoRGSD/PlMWKHPXnW+ItN8M8F
	rUFJd3py65mcKONHa2Gk8VAqDLCf36l8NmTtBVUPYHOTOAJs3p8bZiQANkE7s9kFdpopLbMOD/BQ9
	wDUtAEJk2o2/lWgYOavuzTdXxBZqu/syJiUgqhA6U81bID9Lxxk+uUn65Jer9cSET3PVcQLedvOwo
	8xVP1lMjjdHAx/vxCM+GsevS1Eo1uYsW6BR/Zx3jGk5jGbmQd6YE4UurnkyFPqEzKjJ5BXxL5vHxu
	GLkC04hQ==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8cMs-0000000CDlU-3IeO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:39:43 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so15637915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990769; x=1790595569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4/riDOncgRUhzR5epGdXHOZl5OnvQAmiqOQ7MptE7w=;
        b=O8PZ/aWoPNsC2KeCoTYd7BWqmPntX5MP56FOKHZaDFcGDA0adQgr4T/8lkuB2lqIj1
         WezbNk1Hd1nFI9mP1AY9OrwtYuUYEYXikozI4uDd1pV/sCJyArtmk2f9/M2PNrGl1W1q
         Wcv4L1Y0u7AUJCX9AvUhVwl2FcrKWwVIpGAHMjyee6HC6Y1W+OTN5UiB/YkI2McBf1i0
         JB1o54vL42WmS3ca1CBkmlgMIAbc1FKvGrkmS7EQZumO5HkgrOrtw/wgkNs2kFi/5kAy
         uE1H2TTD0TU2XdQbGuB6D2euhmg5WPy2Kx8QoBzTJo61kycHCA4sfUae+OiuBK/jQUPu
         zfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990769; x=1790595569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4/riDOncgRUhzR5epGdXHOZl5OnvQAmiqOQ7MptE7w=;
        b=E3TSTLyTuMHCrsk87V3w6kQem3vyvMsbRHZPofSchGXAd+2IgCeSRwynMD6ih/Zmju
         5HDNt4Ck5a8vGKGtpCiOxpFKsnUbKeCykGmLVlsbrQTuPyFjX6Ko08LLYJ87jRVc9MYQ
         y7RxnOs51dDEUiStUv+r7hFLYJXr5D3Ycav8tgcearsxsT0FQYx7c+l2gn4QMX9Faool
         PIW2sQRS8NySuM3dBlPkz3/bt6IfEOnoq6cYX29HRzKe+Zwo1CfKkeWfgNLBhhI0PPBR
         +mHtQTl//5Nkg2MclBBi2KsQOstIkPq4khSX2hZvrOVFINuTUWb35s5NaKK9tfTyyRmk
         UHEw==
X-Forwarded-Encrypted: i=1; AKwUvByYy5kHT1Bs3I2mhSv1cuVUN5EkBdxKXEYd/moebRKP02Egm6IGiDlDu0N5n7tFTe3+3zoxDkCwbMOVE32wL4pZ@lists.infradead.org
X-Gm-Message-State: AFuF++mg6yOXMY7sS8x047eMdXZNjFXp3o1bMgpoQFWQrBzUijb9w/Ha
	NbtKMvLKyoyc5KXZ72cE+G2kjdZZtQ7EzPLJ8+cThp57//NwHtI8SrkJ
X-Gm-Gg: AYBFou2zVprnosLDEYDHp7y4sK1zoSvcC9NXYSC3F1D1PrvKHck4lhjH0SGAnR85YIk
	pVZ/+Apl1Z55AlHBUSxjm6BkKVNR5wdcAxzsGXr9rNLZYXEUNId3XwUAVqblOLsdY41zBQ8UrP8
	j02HRMNQs1UKSfQKpfXC7DEu1Jb0bxjz2XWM+8XZOFSklSsfihKJLoB/iMUBp1im0CnvUBoCtrL
	5EKJOrYveDiqR5UsEJycdyyGhxONBfOS7XH7BQUXkg/FCfIyh7/xqgvBw26bPVrY4IrbNJ5mVC1
	7oSPAoy3YUHu8l27cGTccoRhBz/WLXD57gxDpJ0Wro6cy5soPdZo3J/YesvysI9D0Pm2f9DE+JO
	ymGWGEY/vLRUT2Jva3mmfDQBlYlTwUeCFnwjsm4g/Qe2A2aW8URRldMnw/x2LxZH62ytZhNaZJE
	/RZCpxJJvyApkuhSqsOoB/A/dlAiXLQkGEVadP6+w8Smyr5FSz96P2Gu4cw0cQ5E/5v2E=
X-Received: by 2002:a05:600c:46cf:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fc5687b6cmr156358075e9.2.1789990769221;
        Mon, 21 Sep 2026 04:39:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] drm/mediatek: Add support for mt8167 Digital Parallel Interface
Date: Mon, 21 Sep 2026 13:38:56 +0200
Message-ID: <20260921113914.779393-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123940_577629_918D0DA6 
X-CRM114-Status: GOOD (  13.74  )
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

Add support for the two DPI blocks found in the mt8167 SoCs. One of them
can be routed to a DPI connector and another is directly connected to the
HDMI IP.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c     | 23 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0e4f430de983..9012adeb63d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1114,6 +1114,10 @@ static const struct mtk_dpi_factor dpi_factor_mt2701[] = {
 	{ 64000, 4 }, { 128000, 2 }, { U32_MAX, 1 }
 };
 
+static const struct mtk_dpi_factor dpi_factor_mt8167[] = {
+	{ 64000, 16 }, { 74250, 8 }, { 160000, 4 }, { U32_MAX, 2 }
+};
+
 static const struct mtk_dpi_factor dpi_factor_mt8173[] = {
 	{ 27000, 48 }, { 84000, 24 }, { 167000, 12 }, { U32_MAX, 6 }
 };
@@ -1163,6 +1167,24 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8167_conf = {
+	.dpi_factor = dpi_factor_mt8167,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8167),
+	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 150000,
+	.output_fmts = mt8173_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.support_direct_pin = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+};
+
 static const struct mtk_dpi_conf mt8183_conf = {
 	.dpi_factor = dpi_factor_mt8183,
 	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8183),
@@ -1342,6 +1364,7 @@ static void mtk_dpi_remove(struct platform_device *pdev)
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-dpi", .data = &mt2701_conf },
+	{ .compatible = "mediatek,mt8167-dpi", .data = &mt8167_conf },
 	{ .compatible = "mediatek,mt8173-dpi", .data = &mt8173_conf },
 	{ .compatible = "mediatek,mt8183-dpi", .data = &mt8183_conf },
 	{ .compatible = "mediatek,mt8186-dpi", .data = &mt8186_conf },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..64c87221d931 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -802,6 +802,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8167-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8167-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8173-dpi",
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
-- 
2.43.0


