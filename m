Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F99CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 06:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rj1QGauGtTeiJ6R7+rilmmnzYIboPf6nkX4vie379bI=; b=fcNmkPVIK8xy2VPAyivEXkYhlq
	7i13jmHIqm0vDZs5JFtfegm98pMQvBPxY+uCnepbBpD3O/KLSCfobRdEO6aJDXJ+zMcXHwySh5RHI
	eKKZqTnseAFul28t/3BcfBU19IH1AsNkhcjmGdbtE2ggOHl9sZhO7mYBuokKJ11vY2s4Ubegdqxn3
	GjgdRLYk5eU6GxCa4iqVhIg3UY7Q2KIUBmJgqZN3YCKCrdXS47XCbUd7+awHaaeg7IpHqwdJDe3aa
	XTWh2JNsS/NIAGQhbmeaxfh/kYmOssyyxtTOaEk0wENcCZO2br4ONZG0qt1g+9GNTepuVhxATD2jN
	x80bAFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kAT-00000005HNY-44ff;
	Thu, 09 Oct 2025 06:30:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kAS-00000005HNL-1x0p;
	Thu, 09 Oct 2025 06:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08414621D9;
	Thu,  9 Oct 2025 06:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5798CC4CEE7;
	Thu,  9 Oct 2025 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759991422;
	bh=iixDKVyiVVp7+8PaX5CJIKm90MRovONR4rKXMm7l76g=;
	h=From:Date:Subject:To:Cc:From;
	b=a0aAP3sczWi62YXdnte+kBjE8NFpslFYjYlv0AQ6YNrHz35BUmioYW00WUS7t5kB2
	 kZM8Ag8pBWplicYBjgg47lxvsTGJ1u/V58J4OSH4UxxB47j/vh+pANO/KtEWwIQCfy
	 +Wc0kZn3hesiGQ2A7JQBK8ANmuPYTmhE+V62Wz9P7VFVan4afD/LZ+D0eQlA8Udk9V
	 1Dgj0X3/OnySckPMBQlBERIZ07jlCOSu8gwz6JJ7qBaxRL/2cBwhczeXJ4+3vo5OZe
	 Z+ZRZpCrxcUNImyoqsomOITm/mHXbWXvSXGuhsrcDEYW7vQhjIDMYtZFSVMvdexjPk
	 giDsMNFUqDtVw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 09 Oct 2025 08:29:34 +0200
Subject: [PATCH net v2] net: mtk: wed: add dma mask limitation and
 GFP_DMA32 for device with more than 4GB DRAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-wed-4g-ram-limitation-v2-1-c0ca75b26a29@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE1W52gC/3WNzQ6CMBCEX4Xs2TVt+dF68j0MB2IX2Ait2TaoI
 by7lbuZ08xkvlkhkjBFuBQrCC0cOfhszKGA+9j5gZBd9mCUqZUtFb7IYTWgdDNOPHPqUl5gU1l
 FJ3LWlRby9inU83vn3sBTgjaHI8cU5LN/LXqvflit1PkPdtGY1fRU16Sdqsz1QeJpOgYZoN227
 QvjgTr1wAAAAA==
X-Change-ID: 20250930-wed-4g-ram-limitation-6490e7ed9d39
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>, 
 Daniel Pawlik <pawlik.dan@gmail.com>, Matteo Croce <teknoraver@meta.com>
X-Mailer: b4 0.14.2
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

Fixes: 804775dfc2885 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
Fixes: 6757d345dd7db ("net: ethernet: mtk_wed: introduce hw_rro support for MT7988")
Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
Tested-by: Matteo Croce <teknoraver@meta.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Add missing Fixes tags
- Avoid possible deadlock if dma_set_mask_and_coherent fails
- Link to v1: https://lore.kernel.org/r/20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3dbb113b792cf00fb4f89ab20f7e7fa72ecac260..1ed1f88dd7f8bc69bf4cb2803b907c8d7776ae20 100644
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
+		goto out;
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


