Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AE5E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzFBJneA47iDhJ0GrhHnUSWy5uxvLUeSyV1v559BZTs=; b=a449Yvn6N9A4FPOtUAfOGtZ5zN
	q4zUAoU613DbRI4uUSZjvKJS3VPa/bMMcwitZKHhTl0f8N1povt/e8Fc8iuVK7Z36iIFljIDcNLRE
	7tO77TUPWBuRUdu57rNRCKBzLv0c7rvnhxzX61NTbC4YeUf4opVqRt3d/sIsFG8bv3nz50EX//SX1
	xpo3dHfqJaH40wZSW8tZsDqFJyKEXHdQ8wpPLFuL2U3kjaPnq6VquaOg1vvmewG+8lLzXiyE5iIBO
	AQ0SfKUswg0l/l+i6QtI6kRpsFo+3UwmWnlblmJL56zutNc/YqBVlP9j96xVwVYSfFmBkz+Xmv0t9
	nyYjmbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaBl-0000000E7FQ-35tU;
	Tue, 17 Dec 2024 16:12:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZkJ-0000000E09h-3bIH;
	Tue, 17 Dec 2024 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450266;
	bh=vD8T5R3i/xb217YiGqCPRSsxlhMnzbBTogkNqWoL7vY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TXYb7j8Ix20ZURydgQwuCSVb+Z+/QIr+legbkI4aqFsMsnTp9rT+4o2SLRaY/PxPi
	 AJ55Q+so+G3HdulK43EzI1IaVhJ1pzbHp9u8bDiBVYUwvE5LC06BXKmukU6lp4G5+G
	 4dyQDDaEGzOBlAdFU/QOf9g982ltVxwQxGbjjqF0Ozvi36j5EnYD6LBQGR+DjQipdW
	 GF9hTDEzGCX6DhARxv3AboBknvF3dxxr9gt5VHwjjgRUdY3QII78wECdJ+nfGOoGIQ
	 hvBVzCyXbf99bFUJCWurPgxJ11g7TIYCe2nQVGbdVtMLRr5U6VJQCuyQZwvp67RriA
	 lod4IgvgSIFjA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B3BA17E3786;
	Tue, 17 Dec 2024 16:44:25 +0100 (CET)
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
	dmitry.baryshkov@linaro.org
Subject: [PATCH v3 25/33] drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
Date: Tue, 17 Dec 2024 16:43:37 +0100
Message-ID: <20241217154345.276919-26-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074428_038904_DA4A4922 
X-CRM114-Status: GOOD (  11.51  )
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

If the clk_prepare_enable() call for the SPDIF clock fails, just
disable and unprepare the clock in the error check branch and
return immediately instead of jumping to the end with a goto,
slightly reducing code size.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 7e4536391cfb..dbcb9fb09edd 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1095,13 +1095,12 @@ static int mtk_hdmi_clk_enable_audio(struct mtk_hdmi *hdmi)
 		return ret;
 
 	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
-	if (ret)
-		goto err;
+	if (ret) {
+		clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
+		return ret;
+	}
 
 	return 0;
-err:
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
-	return ret;
 }
 
 static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
-- 
2.47.0


