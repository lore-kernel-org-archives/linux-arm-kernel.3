Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8476CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSqbYBErHQ1CxWAZRgab1I5TeIsyK102zuhzqgErQXA=; b=TZqHmc9aoSZmePwQHSisXkgABd
	AuTXk6HMbPDIK4vCAOkDkGA1m3UrkdSNwDLm/tHORV0oD3u19oIFyEMxGKarBe/22cl3XH2TQXzL4
	RI5X7MCBKtWctBza2IqbxrgGeN5H286Qe+LW0P9bENxfDZ83KjN5TepWdjKUMd9gm6XnN0U3L/UEN
	TqQgyMEAMCy9lHlaqNAP1HCQp1zgkEOS5vBbGZRjSLhb865uQ8ND56jIcFD/xx1h3OC9x1d2xwWfb
	FmbgDniBRYg+OdfMCw3T+NyIxyko5scPZJ1EsieiV3qk+GUVV1WMIRD0CKFckMMODCNRYobRKwNFB
	xY4gqylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMFz-00000005bz8-29p9;
	Mon, 13 Jan 2025 15:21:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLoV-00000005UP0-2LBp;
	Mon, 13 Jan 2025 14:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736779990;
	bh=0b9UD6MIOfaTN5x+7wVvBaoOpiYsakLZbMulQFD4nbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUoWY6xFp5AqUnBhkX0P7O1VeTxUus8daE3Qzqh3nPS1cg9XkhuVIvD0kx30xfhK2
	 sfJbJK0SM/65Zy2TW/0RmvWB4Zrd1A5aUWQrjt7JqASfedTn6C6Jms2a56Ajr81IYe
	 0POyIIfdNhvce1QDgDaBIeyLOimJ0ppePgN6Bn50XoB3SE49RfiJ0GkA2hPQhGSpQP
	 QHWKwBmu2AV7lSIpAg7OZaTYQB8bdvpt5tAG/8s8/HOFRCGJ5BILMo+rYLufyjz7Tp
	 wAqCkQV7xlz/8XB5GRa5UA5VopWJM+dbX72HsFgYCYjCY6jsMR7ykNHrZ3nJYalHH9
	 qJSj+SYrpsUow==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD2D217E0FBB;
	Mon, 13 Jan 2025 15:53:08 +0100 (CET)
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
Subject: [PATCH v5 22/34] drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
Date: Mon, 13 Jan 2025 15:52:20 +0100
Message-ID: <20250113145232.227674-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065311_772465_8D93A9F5 
X-CRM114-Status: UNSURE (   9.22  )
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

The hdmi_colorspace csp member of struct mtk_hdmi is initialized
once but then it's never used at all.
Remove said member and the only assignment to it as a cleanup.

Also remove the ibias, ibias_up, min_clock, max_clock, min_hdisplay
and max_vdisplay members, as those were really completely unused.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index eb285ec394a3..e2393f7558f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -162,16 +162,9 @@ struct mtk_hdmi {
 	struct clk *clk[MTK_HDMI_CLK_COUNT];
 	struct drm_display_mode mode;
 	bool dvi_mode;
-	u32 min_clock;
-	u32 max_clock;
-	u32 max_hdisplay;
-	u32 max_vdisplay;
-	u32 ibias;
-	u32 ibias_up;
 	struct regmap *sys_regmap;
 	unsigned int sys_offset;
 	struct regmap *regs;
-	enum hdmi_colorspace csp;
 	struct platform_device *audio_pdev;
 	struct hdmi_audio_param aud_param;
 	bool audio_enable;
@@ -1036,7 +1029,6 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
 {
 	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 
-	hdmi->csp = HDMI_COLORSPACE_RGB;
 	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
 	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
 	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
-- 
2.47.0


