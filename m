Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2ADC36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE5hlRBeQFfk0ddPiX1vKZupkrIvHqrvp7tjh87NC24=; b=JZkjOKcsbPviuwa8AdqNpg2FWQ
	8wY++Jdd97urO8PgizStWrXI9DSaOzGzxqgxisDzSA3I38h8t/KpCGvr3TvhyV8KqB287Jn1N0pv8
	iExjOVrfPpi3K1vMkxnLqb/U6JPPbDwdYbpE1T4IXaWjU4uBRnILfYEX8c40OWONSvEno/Wmf0HKb
	FTzLJcK7fUrHkni9hbBGKiv3JU+XbpqU+ezZSMg4M+oo1/JQ6Y3mffG2Sktiv9P7WoX+uBjdr0GSO
	oFdh6N5QHRDmwLLKhG9sNU0y1mz+Ogr04tvgr3WkU+IGAlVFy7l6dZM9fXwQdlFmvVM3gBh7h0B03
	ytvLusWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QQa-00000009nM3-3TgN;
	Thu, 03 Apr 2025 19:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q36-00000009hAz-1ZKJ;
	Thu, 03 Apr 2025 19:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDE22614B5;
	Thu,  3 Apr 2025 19:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A980C4CEEB;
	Thu,  3 Apr 2025 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707783;
	bh=ixbCm9Hf47DCdGEe9BFRTR9Y/mFx+TzTcbeK3AAkrO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iB4RCEgNLMtrEZLyPLhZLAUMZZa67yJTlnL63/GeS7Y0ySWCCaf2kUNy7cSS9V7FK
	 nTSw0ZLZlPSKIb0lwXFlMhDFbKaB2UkUs7I2v40QtH+NrZNT4NfKcq4KWcMLCV2wU5
	 1ACJ3XjRm+l+ZO51yHco51gq2LlAizhSh5ci73CWVotf4YWqY+YZziwHNmpcGNwD9f
	 jHqVWwdJ0tjs2VTmacb14pFNLUO+3BKUvrPkL3rwgcIlgZ5a9QxOmNJGBmPgTFMMVS
	 JUIyaQ5BWJJXkrA2w0PEMDaxeH07C23DX5YkEW1ORpRGga0bwkzksqMyMTQKXejRXA
	 pDPypyO1tRfxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 24/37] drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
Date: Thu,  3 Apr 2025 15:15:00 -0400
Message-Id: <20250403191513.2680235-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191513.2680235-1-sashal@kernel.org>
References: <20250403191513.2680235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 473c33f5ce651365468503c76f33158aaa1c7dd2 ]

In preparation for adding support for MT8195's HDMI reserved
DPI, add calls to clk_prepare_enable() / clk_disable_unprepare()
for the TVD clock: in this particular case, the aforementioned
clock is not (and cannot be) parented to neither pixel or engine
clocks hence it won't get enabled automatically by the clock
framework.

Please note that on all of the currently supported MediaTek
platforms, the TVD clock is always a parent of either pixel or
engine clocks, and this means that the common clock framework
is already enabling this clock before the children.
On such platforms, this commit will only increase the refcount
of the TVD clock without any functional change.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20250217154836.108895-10-angelogioacchino.delregno@collabora.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index c3fc85764c973..a12ef24c77423 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -471,6 +471,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
+	clk_disable_unprepare(dpi->tvd_clk);
 	clk_disable_unprepare(dpi->engine_clk);
 }
 
@@ -487,6 +488,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_refcount;
 	}
 
+	ret = clk_prepare_enable(dpi->tvd_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
+		goto err_engine;
+	}
+
 	ret = clk_prepare_enable(dpi->pixel_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
@@ -496,6 +503,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	return 0;
 
 err_pixel:
+	clk_disable_unprepare(dpi->tvd_clk);
+err_engine:
 	clk_disable_unprepare(dpi->engine_clk);
 err_refcount:
 	dpi->refcount--;
-- 
2.39.5


