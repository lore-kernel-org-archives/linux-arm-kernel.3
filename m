Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD222C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey6JgpZdRL0T8lcsXrGEreCSOGtK3BJ5z3m9ebHthR0=; b=M0mF2JtIByWXe9E3tRGQhOAYjs
	1gtWWeioSD2dsDngqVkbFjPWp2hQOmLuH+ak5YMNlkD8ppz4Np50Ceccnk4Rt2eiKHO8AmWjk9XvC
	cXGDLJqVxhTKicCFTVcsgx8cCv++Fxqqd3gjyvysx0OCY+9jwPMNWnORQ6RJcUfaZrwFnNDycdi5F
	zBhwHZr66yirUcjW8HaQvMZQQtYtjBApY/VRI1QPAXDm7O5xXlhKyd/5c5hoNLQ1f23GlBHTpYDAa
	TJtjOzgI0pR+Pf8JaCGC+25RL+EcLTEPRLM8UlIaI2aAmjly8iA4P+Ywve5F69BbyEASMPIL1TEOo
	XdV9PV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eOv-00000005WR2-3ZEG;
	Tue, 15 Apr 2025 11:24:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dls-00000005NfR-4793;
	Tue, 15 Apr 2025 10:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713843;
	bh=/Ysfme4bhURYgPvgEn2XsQA7zWDU59MfSw1pYgrGJXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lppZmGp5omx1dfkI1fWUCeX+ROZjpaEGbNy7mfRuBc/+a2dXQiWWBDdR9e+eTUMgn
	 OkvAJnqgNz4RExfTasasoQNZY41pyZhh/nHVFvLy2UlAM+yyPbHBl4dBQ8CJ+NMLjL
	 WqFuMZuB3T9+QIZgtCkmtpGk2eImseETzwswnYMaU4DeEeA1l/wqRz8AT0yHqf9GE2
	 3r1Dq3QK0x2srzFwZpZ1VxLY1wv53Rj32XoKyF9B5gcWdtSh6LOs/4TR9oSxPAV+W8
	 iEHfBc16umipS69N+O16wU2TeAbE7pOZ1oRkas0cqSe6K6cva+UyZMX7KNBccXlHRB
	 rsTMhB1Oongpg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3354717E153D;
	Tue, 15 Apr 2025 12:44:02 +0200 (CEST)
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
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v9 20/23] drm/mediatek: mtk_hdmi_common: Add OP_HDMI if helper funcs assigned
Date: Tue, 15 Apr 2025 12:43:18 +0200
Message-ID: <20250415104321.51149-21-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_034405_188849_D3F9986F 
X-CRM114-Status: GOOD (  11.47  )
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

If the hdmi_{write,clear}_infoframe pointers are not assigned,
vendor and product strings and HDMI helpers will not be used,
hence this commit brings no functional changes to drivers that
have not been refactored to use the new helpers.

This also means that, in the current state, there is effectively
no functional change to mtk_hdmi and its other components.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 93003a39708e..b6043d99be7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -406,6 +406,11 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
+
+	if (ver_conf->bridge_funcs->hdmi_write_infoframe &&
+	    ver_conf->bridge_funcs->hdmi_clear_infoframe)
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI;
+
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
-- 
2.49.0


