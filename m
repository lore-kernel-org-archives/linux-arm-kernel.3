Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DA6C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzgHNfAtOgoCjd3m9EqExWHoxWvoLxVokSuTlgzrljs=; b=aazf2X2LP7/PYqVpJvMyBFE8Zv
	XM3cKDOZiRC1t7A0SiCxH//M0l5DNnb1utk6JOveH9xRtaJlLBRfuGKXBrwL2Ayo2bffrQuDMUtps
	VrGkelzhmI+RCnF211gkl11P7JyyzDH3o4D9OLZQad93hIxm5cu2RMBm3Z2HiJ37meZVKa1D8NfUC
	ADqORPK/slX/f215pSQDppnNvLTR3vl5lwLqHRDASbVZ9bxK2731EiHRfGAQi/+bLcakzWrrnXuN0
	V5Z1wiFJaAGxw6u5OM9kAI13u7dnWQvXjenNynC+IXfqip9SD4O5L2tWOr559fIgQNX8vbYg9piLl
	HB4uh8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpEt-00000003kTa-0akN;
	Tue, 11 Feb 2025 12:19:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXj-00000003Z72-3D1Z;
	Tue, 11 Feb 2025 11:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273706;
	bh=bNAeqzzfsdSSsErdVI+oe8ZaTzRPLejXIIaCMLxt6N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWZs4SLhBxXwbVEJpp1BjCjUZ5J1IiZEDNQpSzc7Y/DysHnELRejuY+uYN2AoE31C
	 BvOH7eRHOpKSExGzCPPokmebBsb1F8KIr0AUIyYbsWKQs7tOOUAlnM1N2Gy/i5a2WO
	 mYYLairrGSQxCRAL3JnT3mfHLOfy5RdQkkVsxnCGcjGkLk4bsZJEuCIDU8Dt9yzPtD
	 5k7DGV79OfaWfiIIt7pMCz9/nov3ftFF+ZszUy92MMyB9SMIgbXnga8PH2CpMjGssH
	 efszg1Zm0BpW2en9XvQg9aYpSeeAOkw8Xv/tx86IkJSh9Q20OT7CAgx9xr5BhFn82v
	 jCH8q+PtwoyyQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 24F9317E14D5;
	Tue, 11 Feb 2025 12:35:05 +0100 (CET)
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
Subject: [PATCH v6 31/42] drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
Date: Tue, 11 Feb 2025 12:33:58 +0100
Message-ID: <20250211113409.1517534-32-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033507_977687_16B1EF05 
X-CRM114-Status: UNSURE (   9.67  )
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

Remove the "driver bound to HDMI" print to avoid useless spam in
the kernel log, as registered and bound drivers can be debugged
through debugfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9c929092a9a9..53c28737ac2a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1632,7 +1632,6 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	if (ret)
 		return ret;
 
-	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
 	return 0;
 }
 
-- 
2.48.1


