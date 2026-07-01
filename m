Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1ADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fAWd6pLKVDf/WPZ2TyROXLISQMM7xFS2SWfHZplKoo=; b=SeH2P3c4p0JqvwtuSKGjHV9o+q
	7b9M6BeIKBu6EQxTzug9FLweOW/mu9mNUpggUgcXnfFNm/PQIRRzh1ky9XybfYdjOri6i7zraSsvp
	XXlzmIm0XLrNA6mFwkfvgBZjVihDLii7efBNay8mxt5lVK2ctDFvyoun3YZ4Ubxt2FkmwN95rGfsq
	wGHMdADOWcLyvw+cpRURXFcaciZCRcbhzWf1RGFZ2Z2F5PNAMFFrYFObvetjvQIN0vDqhJfkCS8CV
	7KacIjTFiKVUbjECGLeyIiLGRDjNIZpKYf9IPBXkRpTQ0kLrIb7GyHeaRv5LD+Mncza1HTv2pk4Pj
	UObyb1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxj-00000001y4o-2hCf;
	Wed, 01 Jul 2026 12:22:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwy-00000001vX0-0Mjb;
	Wed, 01 Jul 2026 12:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908512;
	bh=9/mUB0vnFsvDNN+7EoIzQsUVVkwoA8QkJ5WFtUr02kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBngWdgNBR/UjRSovDEcuzCMNWoc73r7xE44OwU9vZW6q0DJ9D3s7qCoUxJzaB2gK
	 B/0JQf1XkLysSkrwEQsx2DGyxyB1rFx6Jcb3HyWeqVsVE373ekKGFRIBuT0ag3mlMJ
	 oCb0wx7BKJVqv7NxchKgqXilAGzt/fJ74O6UMLUTrf9C+Wfp5qa8Joa1vbtOKt3VdK
	 S/T5wW9yvDztL0sDWP56QbfD3z92QGmAnD+pQr9eJauNT3R8U6oNfTXtm6CJ8FAMHl
	 U+U2aMGFjXvFr5jPlpBAXl5YUojXfwbvEIDMd2IBlzcKNZc6MV1fghl71mo2/X2rjw
	 FaX6TdHZgC12Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FDA717E0857;
	Wed,  1 Jul 2026 14:21:52 +0200 (CEST)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 37/42] soc: mediatek: mtk-mmsys: Populate multimedia subsystem subdevices
Date: Wed,  1 Jul 2026 14:20:52 +0200
Message-ID: <20260701122057.19648-38-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052156_346847_4E3E6463 
X-CRM114-Status: GOOD (  12.09  )
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

The multimedia hardware subsystem contains all of the multimedia
related sub-devices, and that really is by hardware design, not
anything software related.

In order to allow specifying a correct description of the hardware
in devicetrees, add support for probing subdevices of multimedia
controllers, specified as subnodes.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 24296ebcbae3..37f7c888e7e2 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -498,6 +498,13 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(clks);
 	mmsys->clks_pdev = clks;
 
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+		platform_device_unregister(clks);
+		return ret;
+	}
+
 	if (mmsys->data->is_vppsys)
 		goto out_probe_done;
 
@@ -543,6 +550,11 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8195-vdosys1", .data = &mt8195_vdosys1_driver_data },
 	{ .compatible = "mediatek,mt8195-vppsys0", .data = &mt8195_vppsys0_driver_data },
 	{ .compatible = "mediatek,mt8195-vppsys1", .data = &mt8195_vppsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-dispsys0", .data = &mt8196_dispsys0_driver_data },
+	{ .compatible = "mediatek,mt8196-dispsys1", .data = &mt8196_dispsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-ovlsys0", .data = &mt8196_ovlsys0_driver_data },
+	{ .compatible = "mediatek,mt8196-ovlsys1", .data = &mt8196_ovlsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-vdisp-ao", .data = &mt8196_vdisp_ao_driver_data },
 	{ .compatible = "mediatek,mt8365-mmsys", .data = &mt8365_mmsys_driver_data },
 	{ /* sentinel */ }
 };
-- 
2.54.0


