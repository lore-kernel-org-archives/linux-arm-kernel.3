Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D804CF6ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfHVaMF03WdXmRygcwShJaZrlUkozLVUdfsaoXggej0=; b=m0ElrK4wclttraOjT85kzHmpE5
	ki8ZKlmWQjcJ4sBdeyiByD76Aoegk5MsJwI9LrSXpaLouhZFmr2vFgGotMCEbNeO8vwseJHpEYrbd
	RBy9kMswYdW2J3IeijKLTYvt4GP76Qe3gfgD2AoENbFaP2nN3TiZ4HMIEjkQBoyBbp/k2sGoA33W8
	qa22mAAqrHp7TlZFpgTTiaKxUGciIBazTv5fspY3RcD++BD9cS6ynQV9UiDglze/jWcJ0Bg1M+7oG
	STunSBuGUtchzyu1d4O1O3t6uvYt/kTgcqE51zLSxY3afhkrEoTf6wDN6vvKSpZ8BdZ5kVaoAGze4
	G2n1Jprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdn7q-0000000Gbe2-3Mv2;
	Thu, 08 Jan 2026 10:20:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdn7o-0000000GbcU-0JnS;
	Thu, 08 Jan 2026 10:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767867612;
	bh=YyeBDlNSLY4ru+W23YyttLQ3wHEda1dN+Y7WEoCQAts=;
	h=From:To:Cc:Subject:Date:From;
	b=ZOOZJESj4giVfU+dJYjFnTOe3lg+laQO/reAJsmJjsh6SiISklOJahmN+7Wa9b3a8
	 4j3LOIXvAw17G9kCb6Rwqbm4wP6Yo88RSdIXBMhcZQ8lduNCWWmH2nXLDEDLGMmRNh
	 LeHJ9MDtsai+wmu0zkcBJnaXfxWs4T4pTAdUqZ2UmkYLXhYY+0OqOHD8JCpOfXucsr
	 r4BRT3rjov2hfxc/j7H2lEbB7W7RbxqFdZutVvYEF1E+CrSFh5WvOSSUe7CzEZab2N
	 1S3PDe2tPfWt4SdySOwQet1aOCGiUs1c9xRk5zmgSmLtW5oGMrNshY1fYCQra4lhbe
	 /UlAyNpwKBYmg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BCA817E1330;
	Thu,  8 Jan 2026 11:20:12 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bisson.gary@gmail.com,
	kernel@collabora.com
Subject: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS) mode
Date: Thu,  8 Jan 2026 11:19:59 +0100
Message-ID: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_022016_287341_5652C114 
X-CRM114-Status: GOOD (  11.57  )
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

Up until now, the MediaTek DSI Controller has always been working
in Low Power Mode (LPM), as this driver has always ignored the
MIPI_DSI_MSG_USE_LPM flag hence never setting HS mode.

In the current state of the driver the only thing that is needed
to add support for DSI High Speed (HS) transmit is to simply set
the "HSTX" config bit in the configuration register.

Check if flag MIPI_DSI_MSG_USE_LPM is set and, if not, set HSTX.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e4953d5cb6a8..a90cae9512c5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -155,6 +155,7 @@
 #define SHORT_PACKET			0
 #define LONG_PACKET			2
 #define BTA				BIT(2)
+#define HSTX				BIT(3)
 #define DATA_ID				GENMASK(15, 8)
 #define DATA_0				GENMASK(23, 16)
 #define DATA_1				GENMASK(31, 24)
@@ -1177,6 +1178,9 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 	else
 		config = (msg->tx_len > 2) ? LONG_PACKET : SHORT_PACKET;
 
+	if (!(msg->flags & MIPI_DSI_MSG_USE_LPM))
+		config |= HSTX;
+
 	if (msg->tx_len > 2) {
 		cmdq_size = 1 + (msg->tx_len + 3) / 4;
 		cmdq_off = 4;
-- 
2.52.0


