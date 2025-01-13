Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0642BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAxULArYxJuYyFzF4L6mQD2w1miPvUK7K3CYYaBvkrc=; b=HR3IcpyzmM6mnAW7nCs/mvxnoj
	XDt1dpbbAZjBvnnc01JdZjeHAoz4vXYph2mrq2G/Yztf970est8dfk93urwFP/6LKe70GPh9m67ry
	KbtVHVL6cSYQrT5npv5DMVxQWocQzl/YxHZ1MM9t/MPa2Rv42lGE/LsOMsvrEuiBTmELGaJK0uM3W
	qC/XUlbTkZvozJipG+hhcTM4ntOtQXSOM9TdufTn1ujSCz0bQi8EBdyJaAbcNNLfsxBfmmInP5zog
	TIL+vviuoXMtLfczWTl++oWb6NYUen8LZKRQ+plCcjhnfSVhzPPuISXWV3C4/cqHOmTLwYrxA+oEz
	z9I3kRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM9x-00000005aSX-1Qww;
	Mon, 13 Jan 2025 15:15:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLoO-00000005UIJ-0Bbx;
	Mon, 13 Jan 2025 14:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736779982;
	bh=K8q46MoHqKZG5igwDGJXGVu608ZC0Vazge2PSt049ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jx4GPs1n7mkJR6Mbu8vwk0y8aDskfI5a3zZ9q+r7w80sBhaJmzdu48Fux3qMtTI03
	 TVTlSvE1SyALPcwm8ZmTsMxOZ1QdWJEuQgqf5sLEsTf7M7rHX6ejRKNGNhmPbR0zLs
	 KDFZJPo4Y4LDlxldDFfd/nklCrC4CchcT3B7V7g/7QMvEmzk9S/2WdtJ9GG8TJY9q+
	 mkogrgsCXAzPQcunFlmENljULsOZDQXFbRfWOEajDvDka0tap5NRBboqPTyIiQGIOd
	 6LBqUeTV/38zFs7XHIPCrAUCVK42DU33ukyxfkehWGj7oYNtUQGu4R5lDeitmkGi7i
	 ON1WYmPQT6TKw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7244C17E0FC3;
	Mon, 13 Jan 2025 15:53:01 +0100 (CET)
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
Subject: [PATCH v5 17/34] drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new function
Date: Mon, 13 Jan 2025 15:52:15 +0100
Message-ID: <20250113145232.227674-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065304_261332_CA87F735 
X-CRM114-Status: UNSURE (   9.96  )
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
index 5a3e0f4e553d..b5245ac15801 100644
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
2.47.0


