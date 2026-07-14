Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B66BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87bZRmaO+PPhSVvGmWejd2KTaZSvv2uQRcGbyymlkXM=; b=vFLk4w2B2MjSdEoUk1yG+hGISy
	ezTr6QJGMG5d5kT2eorHSBLjSUJGigKHRSlS/YJRYCinLi5ao3r+iyaA6FucWMRJ3HHos9u+1/CDi
	Q6Ps2eovVnc98Aj5Pa2zGp+X/yIKiPrjXN0M0U6QRY1gkZhi01lgedd7LG1Xpm3VxswxlneIsUvQh
	hZrhhQfM5OEJ/8JuJ717Kh18+666LCvOIbYgqq+e/BDhHYDEndqG3rEvX67HguSyfXeoesB/O5tnY
	wMWlqqivwBRDV/56rndNQ/MWK7lMV0tJYoGuGtoWubcgvz3xgoaV/SEqVEAv4k7rzogDgVMWKDlCk
	j4v4nY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbbQ-0000000BmKk-2nff;
	Tue, 14 Jul 2026 11:47:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZn-0000000BjSS-1HyL;
	Tue, 14 Jul 2026 11:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029525;
	bh=U8wbtuZ0GvoDAp1lslwGMJcS1iFdvCK1ZvJJYPJhSSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ji+nNJTZWXvTWQSbmF2AkkMNLjNj4HlM0dqQhdeKNaTl0lpgyN0G1BkXgQk2bsDmH
	 Bl9N8uWO/ErEIaGuBWu6DZc5PxKczFNaRKywqywgUYyOnulAfWCcFvDLeNagBAlEup
	 WwR3dxqm2UXiOwvBCc4X/7w6r+KVd6x9XIfXTHMuB2nQN0z/IsUfp2h8E0VfJkAQyy
	 4F/nAqdk8roWDfXKyVml7MexM0d821S00smLpvKi1sdQM+TVpK84fL5ymYjfoZJwms
	 Y5XUmz6SKirNS1LUTMzuR68+LlUNsBBN4BWGRABlcux4p9Jc9DGOk6H3qPG3fNoggO
	 Cvlv+XndG0YMQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C931217E0B89;
	Tue, 14 Jul 2026 13:45:24 +0200 (CEST)
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
Subject: [PATCH v2 41/46] soc: mediatek: mtk-mmsys: Populate multimedia subsystem subdevices
Date: Tue, 14 Jul 2026 13:44:09 +0200
Message-ID: <20260714114414.184512-42-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044527_514763_E064B954 
X-CRM114-Status: GOOD (  11.20  )
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
 drivers/soc/mediatek/mtk-mmsys.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f501a29a7697..6c02b898741c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -489,6 +490,13 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
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
 
-- 
2.54.0


