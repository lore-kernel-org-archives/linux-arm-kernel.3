Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9hHQKhtm1MnpFBShYKlmn3Yw9T8iFqweptkZtVYG/Q=; b=yEteWhbSXa1nUewsMjuCU1KU4S
	+K7mxyTFw3k4oCxNaVw9E5m45cqzNzXftArnCGWcLl4JFGuMvIwtb5qLawWroFJGsotbHczygsQGM
	35Ci0MwfIwB5bB76s2pPkpiHN7fXD6DCLzhY58IIAgjvz6Q1Xv1vwEh/96+8XVj75DWMZSP8VFyFd
	hA8tZviYf+uS97sAvqFEw0P2kd5Tiafq4tdFNHDdYs4n54mhqDa4Oj0tcExQKIB+qmmrReV4G+pYU
	wSW8f2Aj4C6GS/Yfjb8qjgpAyMjTUlqxdV+YslE6uzX8SVh41Ht9PkffaWR7zal4r8xBoakTxzscW
	uRFe+wlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4e6v-00000005SMh-2GJ5;
	Tue, 15 Apr 2025 11:05:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dlb-00000005NQU-3Zhc;
	Tue, 15 Apr 2025 10:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713826;
	bh=cvpc/8MORNWWHgQBMcaiPbaTmMTg3aTrEh08x8WPRtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0sBrNFQGGl6X1hh8KrQ3M0U2kQxfQB4RHBY+F5D7YlkSD0ekhhtIAvf3Or8UZcWX
	 hjT9UAJfPuw1vgLZv+4PZY5JLbCq2v6a420hC2kseiGScvOARdKRyIespjqWCzGCPA
	 cJE/dxgHziMy5y2hWDfOtoH3FPajvDpNveSArqUEwU0WE3yvUeLrQRU3sqLJpOpwdO
	 fKVuI5Nh2i74uC2MYXW12YVDRYnzYlgfDkNKGfKKIuPuqQPS+pdBfs81l6VXEMLi5Y
	 vsLIO3ckPTQrCXs/I/G1W6RlMNlXX3b7XNp9TptoHDQtp7O+bQnRoyKFeesgy2uRHu
	 n3Jzc7KBASoqg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0841917E0B2D;
	Tue, 15 Apr 2025 12:43:44 +0200 (CEST)
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
Subject: [PATCH v9 10/23] drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new function
Date: Tue, 15 Apr 2025 12:43:08 +0200
Message-ID: <20250415104321.51149-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_034348_044162_8C133BD1 
X-CRM114-Status: GOOD (  10.30  )
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
index 697508edfa41..60ec16f6827f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1582,17 +1582,22 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
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
2.49.0


