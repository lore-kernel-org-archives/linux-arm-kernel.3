Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C6CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6SG43mHsHGUs5imH1Rk9lZLOCzzEMaWfOhJt2v6hsE=; b=G3/ffVXFMcP/tdkCvfbBAjjdJb
	pG6r8BPzf2Tu64CVDiaUFfN/xl1kwVjHnwSOTpP6XzHRargHT459Nw6VxMXzwenOri+c//x8rCUaW
	00ksgMYhVcfXenRSn6p9gl6Tqhfg7ZoCZNCMCM1e3yf7g4Kun1dMiQal7PM+ESHOFIpiRD97EwBCD
	Mf4Pt0aJKLlP0TgNmgNyDvotbcfm2ES4xLKf1a8Bh9HsKapnp7Lg3vQHMnDazvB5e/o9MWHRL0/D+
	mXotQ/OICudSe/tWdBVG01xFoVB63iJG30aBhd+lVubhjbieKtJVC2GwVPnyjUY6EJ+M3+RmpBItn
	u1zTpMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhYr-00000002zWX-0vDh;
	Fri, 16 Oct 2026 13:01:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhYo-00000002zUa-1aYC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:01:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48b127f1cc8so878086f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155680; x=1792760480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6SG43mHsHGUs5imH1Rk9lZLOCzzEMaWfOhJt2v6hsE=;
        b=C0dITxcW8G6YsytdPcpvOWSotGYz4j2cZmsyW+/UxONWOLBfOoSSWHLh41ecgGjgT8
         8ukJc6jd76DAscMH3JonjGc1HzuYLD7do2a68O84cFOgGR2m80L9QlbwxXrC5hznE4FA
         SUSkSuU4203R7HOwFgLTOsGC4XjPAY8zME2SrIyUpn4gAf4AjadYHmDz97Nb7ojEs1Xm
         XhAB2O9emwzqmYVsXwpXuqfOEXwTwomFmJ1r8x+Ni2IGyMovdLNEucEBLd8qA/X2r8OJ
         bCq7o3knuTuHIWphIKvPPFC4EkpdXfqUdIqEA4g7lGqESSwlEwq5C1zwH+Emfb73SfuV
         OHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155680; x=1792760480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6SG43mHsHGUs5imH1Rk9lZLOCzzEMaWfOhJt2v6hsE=;
        b=1pz5UXAur8e5hk21SelF3XNfT8lwsJLgRb4cKal0sn9N5VeAOz8t7v/MIo0MFvjRt9
         25lEl/jrL7ZsCFVlEHLtqihLPzVLmOtn6DHOudWgytHSETesxQ7HnaiUKrRW9PbvJb4c
         LMP/EBrPumg7X7yhxYxGVBwwO2zaFgZ0HHLR2SIRWWNqQJn7JXGDLUXDXLXFqbT3a4ZT
         bpkl4g5PjwCs5ziWFnrAXzDTKXxoiMnQRsal1jpjbMPnlXcgYxsZgIY+ziqtUQ4kdtQo
         VKY33n/Dwft8HEIs7of84FIfsDl5FxC5Umjpq4Ik5XG1sWzKkacsy5OXBV2yPWaZ1cGC
         yr2g==
X-Forwarded-Encrypted: i=1; AKwUvBwStmxRdR4/xa6SoiBB0wrIMot2bb8/DOCYfQHkWZ7XTc3kojIgXaor92JxE0Oa8T6v5w0bUBcsPiBrfg/HYulC@lists.infradead.org
X-Gm-Message-State: AFq9FYLQoLqFWE7MFI7ClNMrpFzWQhl0py02MSWxNrbjhrm7WP2G2SIA
	laz9MhKp/W0gz3JByTjN1hY/GEn7+JX0tWi9g8CqJbDbPdUoXtMNzlJU
X-Gm-Gg: AYBFou3H5sM9eAtu+H7JP3wPR543EA90tkTV7pVWir785odVNEIpRI7NqpH3S4mohzK
	hwpElrlJrSlP9BgTmT2VBH9Aew5SMxigY/amunORpKRzWoUvX9jtA3XWTkhyqpFoTvYJpetZlcQ
	nXRgLS1EyfGhajkEhrUVyg7D6n3WDmOmXE2UjMPdk53k3uydKtLP2TtIZ6xNGeAFnLNUjqR6yoR
	4vB3+q4nLLwwBnd+WqqCG3J7pwUE2rWrFYBMQeb3rPzih5S5RBT9ri+FhaxAK5sMPZs1duJ74O0
	UPugEIjlBdXwTWlA4edAF9CgmILIJXGfk9dMbgmqCu6aFY2supP7yrrhLrtJoaIWOFRRag/Anpf
	NASnu1XTJsZnZ9p1jHQDg2zWKmBS+E/RvQw3MxnJAUMtLloqp1vZhFVcPU4lLsFJPvU6IkhLvHf
	zYKpMemFMGrS1ZTbDmMKjrCYiHh+yaRU/PnjTXma4//jigA/3EpgXCifrmYUbY+gPtQ6xrU3lwU
	2aCRKWc/CqDQmpXmBQFo8+4EVOuYn4Odpd6ietyJHBiABV+g/wlUAx916112G9qXoQ=
X-Received: by 2002:a05:600c:404f:b0:4a1:d05f:3efb with SMTP id 5b1f17b1804b1-4a1d05f3fe9mr18704235e9.0.1792155679827;
        Fri, 16 Oct 2026 06:01:19 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm4331624f8f.7.2026.10.16.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:01:19 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Kevin Hao <haokexin@gmail.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:TI ICSSG ETHERNET DRIVER (ICSSG)),
	netdev@vger.kernel.org (open list:TI ICSSG ETHERNET DRIVER (ICSSG)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: ti: icssg-prueth: Fix dma_unmap_single() direction
Date: Fri, 16 Oct 2026 14:55:28 +0200
Message-ID: <20261016125534.36024-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_060122_438730_4B9035E4 
X-CRM114-Status: GOOD (  15.37  )
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

In emac_send_command_sr1(), the command data is mapped with direction
DMA_TO_DEVICE. However, in prueth_process_rx_mgm(), dma_unmap_single()
is called with direction DMA_FROM_DEVICE. It seems like the buffer is
written to by the CPU before mapping the buffer; and, after mapping the
buffer, the device writes to the buffer. The DMA_TO_DEVICE direction will
handle well the cache maintenance operations, however, if the IOMMU is
enabled, it may cause issues with device write permissions.

Change direction to DMA_BIDIRECTIONNAL.

This bug was statically found and compile-tested only.

Fixes: e654b85a693e ("net: ti: icssg-prueth: Add ICSSG Ethernet driver for AM65x SR1.0 platforms")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index b8115ca47082..6f4a3f64ad39 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -98,7 +98,7 @@ static int emac_send_command_sr1(struct prueth_emac *emac, u32 cmd)
 	tx_chn = &emac->tx_chns[emac->tx_ch_num - 1];
 
 	/* Map the linear buffer */
-	buf_dma = dma_map_single(tx_chn->dma_dev, data, pkt_len, DMA_TO_DEVICE);
+	buf_dma = dma_map_single(tx_chn->dma_dev, data, pkt_len, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(tx_chn->dma_dev, buf_dma)) {
 		netdev_err(emac->ndev, "cmd %x: failed to map cmd buffer\n", cmd);
 		ret = -EINVAL;
@@ -108,7 +108,7 @@ static int emac_send_command_sr1(struct prueth_emac *emac, u32 cmd)
 	first_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
 	if (!first_desc) {
 		netdev_err(emac->ndev, "cmd %x: failed to allocate descriptor\n", cmd);
-		dma_unmap_single(tx_chn->dma_dev, buf_dma, pkt_len, DMA_TO_DEVICE);
+		dma_unmap_single(tx_chn->dma_dev, buf_dma, pkt_len, DMA_BIDIRECTIONAL);
 		ret = -ENOMEM;
 		goto err_unlock;
 	}
@@ -303,7 +303,7 @@ static struct page *prueth_process_rx_mgm(struct prueth_emac *emac,
 	page = swdata->data.page;
 	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
 
-	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
+	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_BIDIRECTIONAL);
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
 	new_page = page_pool_dev_alloc_pages(rx_chn->pg_pool);
-- 
2.53.0


