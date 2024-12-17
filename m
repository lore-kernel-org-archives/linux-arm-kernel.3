Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0296E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfWGnEDljR0ygBfslw1P6+MUQlMFCytD6X/QLOAv1P8=; b=WEYYbxE3DDS+tkRmFdMTU4NKOZ
	JacaNP1Azl8TpW+Vdbb0NFT1gCm2bMRY0C/6Uldq286Gl09e8yhBOfqp575hQqROqM0PLoEi1OpoX
	WwvbwIlRtYkWN82pVExFL0wH/gZ/IzSpRnhTeiJOmVFL21yGvbuvC4yQFZQBGpIAIsyF6PFPeIVXW
	aaniWBdn2tEuF+uYnTLJXmDH2+aXDioz9/egmxlnwXHFvJLGlIesk9+n4KAmZwKOqq5INmw1+6k+9
	MtAtaoAhsagPUlUHqCA8L74+v9didOGlsOdrndj+xbqLVkvpLFJXtpKTN7+oLvEMsLUxnNIimulNO
	bi3E6tCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZvd-0000000E33l-0IoQ;
	Tue, 17 Dec 2024 15:56:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZjy-0000000DzuE-29qF;
	Tue, 17 Dec 2024 15:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450245;
	bh=fJFfsjlng07vGCafdFs9lY2YtKnjdud5x+Llr5/lbfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lsImPZym1S64oqsa8BaFzHZ2acoP6saRDxwritdxYDdcYJuvS8u4fAIFRsbp2w7ym
	 Ppr4/1GvSNCy15U8bPGU6wMx2Ld4COtwABz/84ozVrb407dho8lw9BCAHs1SsC8SvM
	 IO2JQZij6/HzVJNqv34QtqmRqQDnQN4HRlr3MhI6S2sLCFAa/ztN+zDcbtyqfCNak4
	 IUx/A9Y6uf8gNynEZg5eVuMl1S/Ad05b7DkLLWj5oQ7lCq3Z4bxLgFMdNtuyeEJulN
	 mLJO35qHvRxcTlSn32DhLamCmXQn0d6UhDE6KZBO5KFvJbfDwg2PxvQgii20PTDGlV
	 2jHz6YkJUxk3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC3FE17E37BE;
	Tue, 17 Dec 2024 16:44:03 +0100 (CET)
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
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org
Subject: [PATCH v3 10/33] drm/mediatek: mtk_hdmi: Convert to module_platform_driver macro
Date: Tue, 17 Dec 2024 16:43:22 +0100
Message-ID: <20241217154345.276919-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074406_720424_F0564597 
X-CRM114-Status: GOOD (  14.00  )
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

Now that all of the mtk_hdmi subdrivers are a platform driver on
their own it is possible to remove the custom init/exit functions
in this driver and just use the module_platform_driver() macro.

While at it, also compress struct of_device_id entries and remove
stray commas in mtk_hdmi_driver assignments.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 37 ++++++-----------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index f620a61db2e0..59a8a81fa0ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1780,15 +1780,10 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
 };
 
 static const struct of_device_id mtk_hdmi_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-hdmi",
-	  .data = &mtk_hdmi_conf_mt2701,
-	},
-	{ .compatible = "mediatek,mt8167-hdmi",
-	  .data = &mtk_hdmi_conf_mt8167,
-	},
-	{ .compatible = "mediatek,mt8173-hdmi",
-	},
-	{}
+	{ .compatible = "mediatek,mt2701-hdmi", .data = &mtk_hdmi_conf_mt2701 },
+	{ .compatible = "mediatek,mt8167-hdmi", .data = &mtk_hdmi_conf_mt8167 },
+	{ .compatible = "mediatek,mt8173-hdmi" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
 
@@ -1798,28 +1793,10 @@ static struct platform_driver mtk_hdmi_driver = {
 	.driver = {
 		.name = "mediatek-drm-hdmi",
 		.of_match_table = mtk_hdmi_of_ids,
-		.pm = &mtk_hdmi_pm_ops,
-	},
-};
-
-static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_driver,
+		.pm = &mtk_hdmi_pm_ops
+	}
 };
-
-static int __init mtk_hdmitx_init(void)
-{
-	return platform_register_drivers(mtk_hdmi_drivers,
-					 ARRAY_SIZE(mtk_hdmi_drivers));
-}
-
-static void __exit mtk_hdmitx_exit(void)
-{
-	platform_unregister_drivers(mtk_hdmi_drivers,
-				    ARRAY_SIZE(mtk_hdmi_drivers));
-}
-
-module_init(mtk_hdmitx_init);
-module_exit(mtk_hdmitx_exit);
+module_platform_driver(mtk_hdmi_driver);
 
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI Driver");
-- 
2.47.0


