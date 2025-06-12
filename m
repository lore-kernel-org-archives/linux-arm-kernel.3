Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1EAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wGCQc0mcjPV9WgUkNTeUr3SyYHwhLuPypKWT3sxnDM=; b=YUB0J6d4H+EqHRBPaeArflxcxq
	p9JJ7DhEENQIlVHSnbNKY6sn/G1BdKWX7DAttSHKhBa4bWbs/S6v2S3nFgmQ/xdYydTS3rGEPWehp
	71gq2TWa7FUy1N0znsfQOTwOV906iZlKSXjg06OMCCX5fSB3SpUiN+u02oDWl+xz8Xacs8gqdaOgT
	fb2mavapU1zZFkjtK4Ff2HB/KbKmQEdt0aCJMkDChUMwypJndcTdWaMlRvC9STqYwzvQkMLyYwq6n
	YGbUKZciULkP8NBku4e/tTgtCxS0AaKQQXRhjVgvIxOQ42aQ444ED9xyZUTAFS1I7PT5wMwbJTsFr
	HTOKHNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfUX-0000000D3RP-2sNa;
	Thu, 12 Jun 2025 10:49:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeVS-0000000CqsN-0OEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:45:59 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C9jRZX1635161;
	Thu, 12 Jun 2025 04:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749721527;
	bh=1wGCQc0mcjPV9WgUkNTeUr3SyYHwhLuPypKWT3sxnDM=;
	h=From:To:CC:Subject:Date;
	b=SBKpd59ZfkK9r8jsdEr/Qis3VM6MSHyCwkYAyVVxxkHKaiYT263Q39aEo0HB8jbxL
	 Xyp4KaI/iG+HKlysjnGrKMt0Znr+MLgkMUrJGVSe7CPLnGnD6Yo6OK+svo8aTbvtz8
	 diFfqWDvjpAdBk1zeHlxnzBedKBTMiNlD56ACPrQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C9jRrE1841138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 04:45:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 04:45:27 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 04:45:27 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C9jRVC490857;
	Thu, 12 Jun 2025 04:45:27 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 55C9jP8J021791;
	Thu, 12 Jun 2025 04:45:26 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <namcao@linutronix.de>, <m-malladi@ti.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icssg-prueth: Fix packet handling for XDP_TX
Date: Thu, 12 Jun 2025 15:15:23 +0530
Message-ID: <20250612094523.1615719-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_024558_223875_2C50B627 
X-CRM114-Status: GOOD (  14.07  )
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

While transmitting XDP frames for XDP_TX, page_pool is
used to get the DMA buffers (already mapped to the pages)
and need to be freed/reycled once the transmission is complete.
This need not be explicitly done by the driver as this is handled
more gracefully by the xdp driver while returning the xdp frame.
__xdp_return() frees the XDP memory based on its memory type,
under which page_pool memory is also handled. This change fixes
the transmit queue timeout while running XDP_TX.

logs:
[  309.069682] icssg-prueth icssg1-eth eth2: NETDEV WATCHDOG: CPU: 0: transmit queue 0 timed out 45860 ms
[  313.933780] icssg-prueth icssg1-eth eth2: NETDEV WATCHDOG: CPU: 0: transmit queue 0 timed out 50724 ms
[  319.053656] icssg-prueth icssg1-eth eth2: NETDEV WATCHDOG: CPU: 0: transmit queue 0 timed out 55844 ms
...

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 5b8fdb882172..12f25cec6255 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -98,20 +98,11 @@ void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 {
 	struct cppi5_host_desc_t *first_desc, *next_desc;
 	dma_addr_t buf_dma, next_desc_dma;
-	struct prueth_swdata *swdata;
-	struct page *page;
 	u32 buf_dma_len;
 
 	first_desc = desc;
 	next_desc = first_desc;
 
-	swdata = cppi5_hdesc_get_swdata(desc);
-	if (swdata->type == PRUETH_SWDATA_PAGE) {
-		page = swdata->data.page;
-		page_pool_recycle_direct(page->pp, swdata->data.page);
-		goto free_desc;
-	}
-
 	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
 	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
 
@@ -135,7 +126,6 @@ void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
 	}
 
-free_desc:
 	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
 }
 EXPORT_SYMBOL_GPL(prueth_xmit_free);
@@ -612,13 +602,8 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
 	cppi5_hdesc_attach_buf(first_desc, buf_dma, xdpf->len, buf_dma, xdpf->len);
 	swdata = cppi5_hdesc_get_swdata(first_desc);
-	if (page) {
-		swdata->type = PRUETH_SWDATA_PAGE;
-		swdata->data.page = page;
-	} else {
-		swdata->type = PRUETH_SWDATA_XDPF;
-		swdata->data.xdpf = xdpf;
-	}
+	swdata->type = PRUETH_SWDATA_XDPF;
+	swdata->data.xdpf = xdpf;
 
 	/* Report BQL before sending the packet */
 	netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);

base-commit: 5d6d67c4cb10a4b4d3ae35758d5eeed6239afdc8
-- 
2.43.0


