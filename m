Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34668C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paDUNiyt0Wq2p+ueOa5JMx3TxhzthafDaxZNibTjxcw=; b=QGw+sH0iPLTYrXmo1B97lvLqOC
	Y89ueECvRUs9h3P3dOUl0JyeKEMa8V2d2e20ueshzRdzspYF7fBvFuFiTGCg9GuSVVI0QbgbeFb4f
	u1Kz4XF9/j7N9PePwLpWfbHi8PFuZesT8OR0QY2z917dN1Z4aVikPA+Ntg5/1cX/4p/psVn+UwuGm
	YdZ/I9qXSv04QOrzIXVYERZrDkbWlX+ofNmcTe21pmp5u7gwAlaz956hAPlLGX+9AefEZlQZbwQLY
	HztB5Iz6KwKo5oYGEE3ZqfuaG5DFaaQjgCvR7vXiiGmkA9iLwlw+b0L01ZcsBUCdm0euWaapEO0IM
	3Gk3FMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4NK-00000005MDf-3UyK;
	Mon, 17 Feb 2025 16:53:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Nm-000000058YK-1NWz;
	Mon, 17 Feb 2025 15:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807405;
	bh=s9TR1FVrUafUEV8MdpPVkHJ7rP7lJNUQXfdRVs9cVzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qVPOSSBNV0u6iiv3VLUG0XphnUt/xZds2RLxmnnp5Rpf+judhtS/FhlACXKnxtunN
	 CpmPs6a+gZ9C5/XnjuFe2XDyhFZvb6dhjRjiTPIUaTePikoDQ5/EvtBHLUNZNXaiW6
	 cHwvRNj0VB55O7jFkU8INoAspvk01ax9gDjZkgd23GzxtTm4rsDvmJ2urRxa++xkeN
	 DItZOV10ZVGykUPDDSXE0L2uJSD0f/FUQFfrvfvkPeN3LhMvRf+Dtr/1ojV3nTLEav
	 1xRJkrggBlqektFJM+WLdNNkRsTI+svnm7O5BIDWxWblK1IFfa5bgmxbATKwQRkpxy
	 Occ05pzRIb2rQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6BD117E0F86;
	Mon, 17 Feb 2025 16:50:03 +0100 (CET)
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
Subject: [PATCH v7 32/43] drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
Date: Mon, 17 Feb 2025 16:48:25 +0100
Message-ID: <20250217154836.108895-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_075006_512907_8F13771C 
X-CRM114-Status: UNSURE (   9.37  )
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

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 2e98a8ed6cbe..50f9ab48cbf9 100644
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


