Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1Pfv3QtEwW/Kob0i4uzFquHgB4v8zx1EiL0xsK+MsU=; b=ixigSrqDWRSw99hCpTYSdds/FQ
	4fm3HqYwCIneaHdq+Tq2xXeHoZHCVB5Y8WJKFh2YAGQyzJa6kkP5BsHcuVKC4J6lOg78jpCmHtNC3
	4NDEVFJcOSOYOam1sG2Nm5CJmb3lNcS5936RNZkutSFLukqxxz9Wr4gXnEQhVEUDCpGJXbF8p0tSr
	pXWDoSJT5SsXQqLNOMA04dkLua/poAvH+i2EB9mLYjpR/I0jM0cezFIyOxNH20UsAItuOoV5X87ti
	IV2xkl7JSpTVjhxWV7mnQYOWN8p0HeJhzzjoe7R6uXesWAj7RyXlmBZ0Fw0CDr0qUC3kxPsbHhuQr
	/mezQzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaAg-0000000E6vL-3VRO;
	Tue, 17 Dec 2024 16:11:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZkI-0000000E08q-2g6E;
	Tue, 17 Dec 2024 15:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450265;
	bh=iGH1BHAuVlT2GOX0NIFqeG5lBc5oKbS/z0v2UOVx3hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RYFBc5TmfkYp7DU7OT0FV5g72ZcvuzDwjKww1J0sU6b/3KGGN1AXgTMmW+dur9zcv
	 5lUv3uSMZA2liaVATgpqy46pTIwQadO4Ckmlj9Cb164pJI9iCCQEfsN2iq6pffkfgK
	 bWEbuW8wgjAIM8JvjSButgKzx7D9EL1HBS0+IDV/GcwQU1nsVUOUgnFBygNvAoexc+
	 OihWFLqIS9J4srHX7nDwA8005ZJouqSK2218PU6X4RgrfNhl2KwAXENthlkKEI/FIn
	 c3dQyx2QFW2GGwQrumgV80mNWNEcB3qMFNcIpM5DaP1XsUM1u53fhr0qXCPIqpzZJ1
	 gvmvURFSpD6cg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4D6D17E37B1;
	Tue, 17 Dec 2024 16:44:23 +0100 (CET)
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
Subject: [PATCH v3 24/33] drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
Date: Tue, 17 Dec 2024 16:43:36 +0100
Message-ID: <20241217154345.276919-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074426_862331_ECAE2E96 
X-CRM114-Status: GOOD (  12.21  )
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

Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
and indicate that the mtk_hdmi_{remove,suspend} functions may be
unused (as they are, in case PM support is not built-in).

While at it, to improve readability, also compress the
SIMPLE_DEV_PM_OPS declaration as it even fits in less
than 80 columns.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5d46d486c68f..7e4536391cfb 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1694,8 +1694,7 @@ static void mtk_hdmi_remove(struct platform_device *pdev)
 	mtk_hdmi_clk_disable_audio(hdmi);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int mtk_hdmi_suspend(struct device *dev)
+static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
@@ -1704,7 +1703,7 @@ static int mtk_hdmi_suspend(struct device *dev)
 	return 0;
 }
 
-static int mtk_hdmi_resume(struct device *dev)
+static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	int ret = 0;
@@ -1717,9 +1716,8 @@ static int mtk_hdmi_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
-			 mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
-- 
2.47.0


