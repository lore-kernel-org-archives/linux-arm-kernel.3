Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04430C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jk+CGCeQ+pA1nGB3c0kKmB1vBTdOo0AQ21urSGKLv/M=; b=KKrOnBn1VUlSw7VE6G/c+fcQ4M
	rPXfhj8SNj1WO6+LIlr7X/NUvHWkEPhmSkA9ZuxRmm2V+9roYXlPDe5Y63rUf31yqXBBeRd3xGifb
	bWT0VvFa/XjTSXkfUjkd2+3q4WJ5DVzCLPcEX17dT9jJnn4iT8IiikhoxIvJ8928pEEkOf2cOLbnJ
	sZErBv6gNaAmcPoiWBzyKUOzFzUtpOAFRohBMJm98+p5GZ+vwoxs7mzNMYNkD59X9S9jRrkT0hVKH
	927BAwz5sv7YsQi04ciOSt4cFyHbxrIYwQGF4CSAmcfEKmD6d5LHl23BrDFINLF8L3zXixYv7uBmY
	GseqDSXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk533-00000005TYw-2OVK;
	Mon, 17 Feb 2025 17:36:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3NX-000000058KY-0pgD;
	Mon, 17 Feb 2025 15:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807389;
	bh=t16i+0C+ZcahRk+Jk9rLi/G14zxkWnJj+r87u3FvDm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iI+GvUGpJPp8gk9ZzMtLp11dgfNqQgZLlzM8UFKYQPfJEp6rNrlBR5W86vIYMRA6x
	 /jcnzS+F6MYJhIlSXRZDHf+dozBePR00lQ7PPb1loehJbm+ktoaq11/JOyW+y3lSSY
	 6cZvKBBYLygnrzJ3ibKj6XUzLTVzG9bwkRtNCy7qANA7+6agTNuEvGtRGplz0wHV+V
	 8s+xO4DcEFc5ra6EY391Hc7gSxOQGd6LlrTGmIStnUdV2HvzdARr7wJD2/HY6gmpwY
	 p62M/7jhcsI1MpoISDF/wYkaRmW16Tzm13AHFVfhmxtCQ3R7m/4rGV2xb46KMTBlGj
	 1p8tBa/k6fwWQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97D0F17E1568;
	Mon, 17 Feb 2025 16:49:48 +0100 (CET)
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
Subject: [PATCH v7 22/43] drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new function
Date: Mon, 17 Feb 2025 16:48:15 +0100
Message-ID: <20250217154836.108895-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074951_395050_51C7D099 
X-CRM114-Status: UNSURE (   9.99  )
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

In preparation for splitting common bits of this driver, move the
mutex-protected cable plugged callback and codec device setting
to a new function called mtk_hdmi_audio_set_plugged_cb().

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 25ea3f3d982b..69db6b19017d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1597,17 +1597,22 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	return 0;
 }
 
-static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
-					  hdmi_codec_plugged_cb fn,
+static void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 					  struct device *codec_dev)
 {
-	struct mtk_hdmi *hdmi = data;
-
 	mutex_lock(&hdmi->update_plugged_status_lock);
 	hdmi->plugged_cb = fn;
 	hdmi->codec_dev = codec_dev;
 	mutex_unlock(&hdmi->update_plugged_status_lock);
+}
+
+static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = data;
 
+	mtk_hdmi_audio_set_plugged_cb(hdmi, fn, codec_dev);
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
-- 
2.48.1


