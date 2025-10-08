Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A20CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5cRdwlSpnxS4LEsDA4lGj0GmLZOGgOsp4ZRnuw/8QKE=; b=UkeD6/Y2K96x+3N/x3vq3DvYWL
	zPgQQCaLsFt+2h/JLiH4ZkmrBPDG+6mqFzVrvVvFeHMAy7jOBSRjfBt508+6SIetbdhuuBd7KAfW+
	wLiBITxXDBhZh21OdtMnl8BSM8wxnI5Jw4b3nP3bS9STUIJyK7TLfCX6bnmzo1ZEK68bKK7/3Q4r3
	x3wkwxScpqicfHix2iFHLxGrfTzVazbBzvgs5Yono7L4A54IW4x0ZPBMpdS3NhE/VCPEJ2NFgXhef
	vk4lT/3Lag+4OHjBtZSRVQwy2oRwUGOo0dH2K6yUAJp1vhucjtomHNyeop3vITkFApza5FeGbZEjs
	7b8+XaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Rin-00000003foY-3NHA;
	Wed, 08 Oct 2025 10:48:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ril-00000003foB-2ulb;
	Wed, 08 Oct 2025 10:48:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CB8F43717;
	Wed,  8 Oct 2025 10:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CA2C4CEF4;
	Wed,  8 Oct 2025 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759920515;
	bh=r8JHW7S9t8XtUom2huYwx+1JK/cKzVt5jAQ2jApdSJ4=;
	h=From:Date:Subject:To:Cc:From;
	b=jh27gp3rw022a1h/WWr+t1wM0U5EPs25PS24UudRsvMvW7VuFNgttsy1GgDnKTtOE
	 fJy2IBNDNmHfBsGgVXOuQhiY/2uVhdRXyxjViLozWaO5OtoeEKYnQVCKAyogH5fWkw
	 O4L4XaH2//EYfNKzmkmT7znzYUWq5PFSUH2X7hz7TGr0wdeHvdbfqdhH0q/0TXB6M5
	 Px2bnP5mAsnm0130NIgU98b6Of7kZyGZ1FB0Td96nq92zEog71n0wX8Xg26Oll+B1F
	 NzioWB/ah65ZPpHNtDTd9tUPpR1QacxVqKJXSdnZ+uFtCkDGtA83RymnbEOHYZhEIn
	 /BZqFWAU1f/HA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Oct 2025 12:48:05 +0200
Subject: [PATCH net] net: mtk: wed: add dma mask limitation and GFP_DMA32
 for device with more than 4GB DRAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGRB5mgC/x3MQQrDIBBG4avIrDtgE5Ngr1KykPonGYi2qCSF4
 N0rXb7F9y7KSIJMD3VRwiFZ3rHF/abotbm4gsW3pk53g7a95hOezcrJBd4lSHGlCR6N1Zjgre8
 tNftJWOT7/z4potBc6w9l4YGwbAAAAA==
X-Change-ID: 20250930-wed-4g-ram-limitation-6490e7ed9d39
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>, 
 Daniel Pawlik <pawlik.dan@gmail.com>, Matteo Croce <teknoraver@meta.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_034835_766102_9E00116B 
X-CRM114-Status: GOOD (  10.35  )
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

From: Rex Lu <rex.lu@mediatek.com>

Limit tx/rx buffer address to 32-bit address space for board with more
than 4GB DRAM.

Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
Tested-by: Matteo Croce <teknoraver@meta.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3dbb113b792cf00fb4f89ab20f7e7fa72ecac260..cc3f3380a9980a6525921205dc7adaf321a099ae 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -677,7 +677,7 @@ mtk_wed_tx_buffer_alloc(struct mtk_wed_device *dev)
 		void *buf;
 		int s;
 
-		page = __dev_alloc_page(GFP_KERNEL);
+		page = __dev_alloc_page(GFP_KERNEL | GFP_DMA32);
 		if (!page)
 			return -ENOMEM;
 
@@ -800,7 +800,7 @@ mtk_wed_hwrro_buffer_alloc(struct mtk_wed_device *dev)
 		struct page *page;
 		int s;
 
-		page = __dev_alloc_page(GFP_KERNEL);
+		page = __dev_alloc_page(GFP_KERNEL | GFP_DMA32);
 		if (!page)
 			return -ENOMEM;
 
@@ -2426,6 +2426,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 	dev->version = hw->version;
 	dev->hw->pcie_base = mtk_wed_get_pcie_base(dev);
 
+	ret = dma_set_mask_and_coherent(hw->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
 	if (hw->eth->dma_dev == hw->eth->dev &&
 	    of_dma_is_coherent(hw->eth->dev->of_node))
 		mtk_eth_set_dma_device(hw->eth, hw->dev);

---
base-commit: 07fdad3a93756b872da7b53647715c48d0f4a2d0
change-id: 20250930-wed-4g-ram-limitation-6490e7ed9d39

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


