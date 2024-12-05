Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6D2E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7SEly1Irm3Wk7jVZNaxYx279hcLJF/UlA7L6ww3BkY=; b=VRxjpFdohRu5AKaptx2QpvpCpQ
	Wq5xNOMZRkpUI4xRCnpC84ndOZvPFsxMMZarnykE/ZjHXM4g6JRXxXWechKZNH0US4tKTRLTt0083
	DBkdQZiCS1Yk/NTTAit/+zPxhUEvd6cK6sNtA9/4PGS/lCmLsVJt5wEyfzrMVYPC4WYsNtUeM5NEf
	bB0tZwNwqiJKAkk9T0282ZDU08n4yhJfW0hBp1dTEBZBTwSGe3Rov3howWU++Eti/0hl9XrJBpSNQ
	SDRkwBVZfbJJSkZ0czF+n4TNynSQDb4npr0e9pv9pFUceOqOorck6dcmOvs5gSwrb92E5s/YrZFFr
	ZU/rRwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAaK-0000000FsKq-3Z5y;
	Thu, 05 Dec 2024 12:03:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAIr-0000000FmAb-25Tl;
	Thu, 05 Dec 2024 11:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733399152;
	bh=Iuw6lKAFVStlEoHokBHUjRYt3DcWkQHIBuWJ0JZ2TFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lrgiSCmUP8WsD46KlOPP5b0OaGKpxCuBsOOZfzjM3qQ+FQqOzFv0/QzQfKK6EPkeg
	 vXaFbLU4pGI/D41gAG3ol4THCN5+DU3HHAqu3Mrf1RmDxoi9ZXmoN4DR7Ky4GhhDQF
	 Ta4qcXKwqv4dQgnqhi/qSnf9Cih3cxAqclEa8vtOGwpPRANYouUg6XviSxpTrT1weR
	 wlUnyoQI2DuMaINpXMDkbk8RST170jr1CNogbx/MZr6EeGc5hBK6GH531FlQuP3Wr+
	 i/m68e8p83y8ifKr2dbmahw5t1b1Ba9/ushJOKmv2xiAXJvxbqP7xbnThYQ6Bn3Jx1
	 mJsG1mc6UoUTA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4052817E3633;
	Thu,  5 Dec 2024 12:45:51 +0100 (CET)
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
	kernel@collabora.com
Subject: [PATCH v2 14/15] drm/mediatek: mtk_hdmi_common: Add OP_HDMI, vendor and product strings
Date: Thu,  5 Dec 2024 12:45:16 +0100
Message-ID: <20241205114518.53527-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_034553_704142_CA9A0791 
X-CRM114-Status: GOOD (  11.39  )
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

In preparation for adding the HDMI TX v2 driver, and to allow
a future modernization of the HDMI v1 one, perform changes
that enable the usage of the HDMI Helpers provided by DRM.

Check if the HDMI driver provides the function pointers to
hdmi_{clear,write}_infoframe used by the HDMI Helper API and,
if present, add DRM_BRIDGE_OP_HDMI to the drm_bridge ops,
enabling the drm API to register the bridge as HDMI and to use
the HDMI Helper functions.

Moreover, as part of data exclusively used (in the context of
HDMI bridges) by the helpers, assign the vendor "MediaTek" and
product "On-Chip HDMI" strings to the drm_bridge struct.

If the hdmi_{write,clear}_infoframe pointers are not assigned,
vendor and product strings and HDMI helpers will not be used,
hence this commit brings no functional changes to drivers that
have not been refactored to use the new helpers.

This also means that, in the current state, there is effectively
no functional change to mtk_hdmi and its other components.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 4f708b04f5e8..0f60842462b0 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -408,9 +408,16 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 
 	hdmi->bridge.funcs = ver_conf->bridge_funcs;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
+
+	if (ver_conf->bridge_funcs->hdmi_write_infoframe &&
+	    ver_conf->bridge_funcs->hdmi_clear_infoframe)
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI;
+
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
+	hdmi->bridge.vendor = "MediaTek";
+	hdmi->bridge.product = "On-Chip HDMI";
 
 	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
 	if (ret)
-- 
2.47.0


