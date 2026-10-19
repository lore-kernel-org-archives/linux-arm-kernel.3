Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53729CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gZMXThPsw5Hj3K9EBxanaGodYWwNvyn38pa2n05siwg=; b=xFPTsoqZlmhlifz4iDfbTsK9Yv
	/AWbkRIT+rxiT8KZjf9tLp8GshierxjnRVww3PGngGOVt9ShxJ7lE3Yz8qCknfwlZ+lwK9UHSW+ZR
	EB3gP1yXPkmA1KsrJztHK/NqfpJdGRS2++0XLJ4sdLKJrxvTigoY+jnGlu34kPx66SKOV6Kw9pyA8
	CnMw16EOt2FYrJMp1FgvVhkhX5/nwan4jec75aA3GxqR+xbzwCWyfLp64+dqxGsLmknC6yhVVIbL9
	+I+6Z33QeqyP+w7sxnTlLg3JM+H1GrZ6yS8CzzqEyoGGzpnyRrgtTW8lJtAm+QCytBh7Fah3TVTxT
	w7tcQxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoCj-00000007jDY-2sfw;
	Mon, 19 Oct 2026 14:19:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoCh-00000007jCu-3eqy;
	Mon, 19 Oct 2026 14:19:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB5E560136;
	Mon, 19 Oct 2026 14:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AF70C2BCFC;
	Mon, 19 Oct 2026 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792419546;
	bh=bYO4N5qhTzU/pGIBZQIQ9ttnK/MV86W/KSJjUFVZp2A=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tuvsVyzz9arOsSFCN3WbXoK5l6Fm8TlJw1KIpZUbaHUL3xNQ5YSdEZV2LEBgnPSt0
	 9Ol5abm2n+8Ng5SjyYDIOQodfcIGE/ENAaFqjNs6NhND6zsMdTAWmIJmXvKXhnd16b
	 J1+EjWJYZqIrJzduz0lkpMRawvq2Kw04Nwy5Z/2FhSl1HVbnHLQaf1z9xQU5BTQfdV
	 ylvoKMCcwwLs84XvDT2fLm+Q+6AJqgFCNFASslGImTvXqNZkwWgMx1LMmhcdbBS//H
	 8J+sDwYjLPQgJvL6n+BOdAJkZVxuyVPc1rMJHzQEepKbu7EwsAfhuXTgqS6AQ3Q6gF
	 Au62+MMsZEWvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75077CCF2E3;
	Mon, 19 Oct 2026 14:19:06 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Mon, 19 Oct 2026 15:18:35 +0100
Subject: [PATCH] drm/mediatek: dsi: Fix handling of long packet reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-mtk-dsi-long-read-v1-1-9bddcac1def5@protonmail.ch>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDuQiIp6ldKFSUYdf6JkbBHEu
 5vq8lu8d4BQYBKokwMC/Vh48RH6lYDtG98RsouGVKWFVrrCeRvRCeO0+A4DNQ6z3NiSssqp0kD
 s1kAt7/fz/XksXzOQ3f4jOM8LrCgPOXUAAAA=
X-Change-ID: 20261019-mtk-dsi-long-read-45bc8e49d08b
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, shaoming chen <shaoming.chen@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792419545; l=1720;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=utZT4oI0+pnVMGUZYDb6g2+lkw+nMH2Vwu5HGoj/nEc=;
 b=UZfIFZ6FmaVoqnOm2wvWHsyQ6MhVLAPWmfmeo+EP9rxXaQKQ7Ua0xrmAJYM6XA0NDsMoO4A7e
 UD47LZefiDVCzyt+xu5j2Xr/kOEfbS0kRlSJ7eMSRPbqlWl4NybXCd1
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
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
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ben Grisdale <bengris32@protonmail.ch>

mtk_dsi_host_transfer() decides where the payload starts in the
received data based on the byte count returned by mtk_dsi_recv_cnt(),
treating anything longer than 2 bytes as a long packet.

This breaks long read responses with a 1 or 2 byte payload: they are
treated as short packets, so the word count from the packet header is
copied into rx_buf instead of the payload.

Fix this by checking the packet's data type instead of inferring it
from the length.

Fixes: 21898816831f ("drm/mediatek: add dsi transfer function")
Cc: stable@vger.kernel.org
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index f82506e10fd5..de4414b51abb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -165,6 +165,10 @@
 	(type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
 	(type == MIPI_DSI_DCS_READ))
 
+#define MTK_DSI_IS_LONG_RESP(type) \
+	(((type) == MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE) || \
+	((type) == MIPI_DSI_RX_DCS_LONG_READ_RESPONSE))
+
 struct mtk_phy_timing {
 	u32 lpx;
 	u32 da_hs_prepare;
@@ -1171,7 +1175,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 
 	recv_cnt = mtk_dsi_recv_cnt(read_data[0], read_data);
 
-	if (recv_cnt > 2)
+	if (MTK_DSI_IS_LONG_RESP(read_data[0]))
 		src_addr = &read_data[4];
 	else
 		src_addr = &read_data[1];

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-mtk-dsi-long-read-45bc8e49d08b

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>



