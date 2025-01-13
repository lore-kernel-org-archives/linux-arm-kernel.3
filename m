Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C8FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SzbLn+zBvTZ44te2ODpZuXfw4gb92xTxgD9eToqlmQ=; b=QqbTDfCkrNDoz90x6ewPYdH44f
	zQHO6Pw2EicQRk5Y9T/XUNM+TcVCl4lz/zROebH9kp1nTOxVwQEVfRENJTkFeIBJpbdfaUKsz6uJH
	rK46Q6WLht4IMQcjYAxQlhNuo47b95ESsgrwJUZGXTA6NBT9w8rY6weijqOUa0YX8dmg4L64ThjTp
	9e3JNLnVLNCwpcYQdhNleSDxBFl1e0BfFFl3gRK0USxrARpnHJ7oOHVMUeHmewTHXzrH/vCmQYUsO
	AefY2z5jRt5niTkUjoL90HTo08bk0Ii2f64hhR2B1QiAAk4fMMKn1Plc/YyzuPe6eh+7twSKM27rd
	O6XeVQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMCN-00000005b59-0gdb;
	Mon, 13 Jan 2025 15:17:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLoR-00000005ULT-0mvI;
	Mon, 13 Jan 2025 14:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736779985;
	bh=bc1/5llvb/F+aOw3gHKRXfhgUMntRZTJgN0Q2TFxP5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iicr/aSLCuSct1KklmIWQfixAuKUZLdNtHsk/F5qEuiEF+V1hIl3jZfkUf3lgcUHC
	 +LGmWVq2MzWJnEWNzk+laziAP36paYBwNJxKWaZrlVAQ0gwiaX+e5mETyNp+dtc9dy
	 dNl9ANn70ApuBngoMWb182FMZgoFI+aS7ZfS16v3K7dJUTSOwiowZw21ttpWwpdYSM
	 bhFoabWhAy31gN40RtZsOiWb+lQw2p38ZpHLG7QjQNB2W6cWQ1xyYfcclMZYMYhvh/
	 iCzcw1iZGX5umaa1dEdXw/RM7oHNVbeGyN1T+cbpIwITR9ay3hyYzRY7kijftLpUOl
	 4XwjpJs6oe16A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67F6F17E0FC9;
	Mon, 13 Jan 2025 15:53:04 +0100 (CET)
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
Subject: [PATCH v5 19/34] drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
Date: Mon, 13 Jan 2025 15:52:17 +0100
Message-ID: <20250113145232.227674-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065307_396875_C498D3F7 
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

Move the vendor and product strings to the appropriate entries
of struct drm_bridge and use that in mtk_hdmi_setup_spd_infoframe
instead of having the same as function parameters.

While at it, also beautify the strings, setting them to read
"MediaTek On-Chip HDMI".

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8a26cfc9fc61..65e9629b6b77 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -952,15 +952,14 @@ static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi,
-					const char *vendor,
-					const char *product)
+static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi)
 {
+	struct drm_bridge *bridge = &hdmi->bridge;
 	struct hdmi_spd_infoframe frame;
 	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_SPD_INFOFRAME_SIZE];
 	ssize_t err;
 
-	err = hdmi_spd_infoframe_init(&frame, vendor, product);
+	err = hdmi_spd_infoframe_init(&frame, bridge->vendor, bridge->product);
 	if (err < 0) {
 		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
 			err);
@@ -1328,7 +1327,7 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
 {
 	mtk_hdmi_setup_audio_infoframe(hdmi);
 	mtk_hdmi_setup_avi_infoframe(hdmi, mode);
-	mtk_hdmi_setup_spd_infoframe(hdmi, "mediatek", "On-chip HDMI");
+	mtk_hdmi_setup_spd_infoframe(hdmi);
 	if (mode->flags & DRM_MODE_FLAG_3D_MASK)
 		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
 }
@@ -1707,6 +1706,8 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.vendor = "MediaTek";
+	hdmi->bridge.product = "On-Chip HDMI";
 	drm_bridge_add(&hdmi->bridge);
 
 	ret = mtk_hdmi_clk_enable_audio(hdmi);
-- 
2.47.0


