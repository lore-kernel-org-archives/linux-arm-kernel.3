Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B88CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbFIaE2RBmy0WoWvCGpbm1Y5B6TcKaYMkYdCfYEtdWo=; b=YTZd6Yvh4jJwT4KOglaes9nf8C
	hc6khJTKRokbsBPjqJPA9r6Sf93n6Vux+HMeUPwxK5L7B0UgR2XXrApu8+6bVKqT1jmaOaJqE8BR7
	ySSfDB+hNNCBRLvg3SCCY/8DotJ0r3BD6xHKWesLwwWyxf40hrva2xFmZXtPo9hH2FHiNnvYeoitR
	qFnViBsl/xgvW72Zqp2KzyvQNNhoVY7hFgPa/6u6WisbRiVD1fhTYzXxYkR4tFQbxAQGR3SxBW8DT
	0byKrnYD/g9wyyOmflt9G+Limi9gNr6hNelIf0LBHwWChQktSMf4xabOKf1hPqqyzzYhM6lPeoQpu
	Xq9OdYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVVy-00000005n7b-0puS;
	Tue, 18 Mar 2025 11:53:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVOp-00000005loR-1qs2;
	Tue, 18 Mar 2025 11:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F0A1A48F88;
	Tue, 18 Mar 2025 11:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22FEC4CEEE;
	Tue, 18 Mar 2025 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742298382;
	bh=OxxwCX4kmkFgORosEwbEM+9lMLPNKxBrIFre8ujLNdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G/8bSdeF2XHkLu2RJLqgr1qcc3i6Xqs9vw1Kb8R7xY+Fhi+0qxrWc+cK7qxI1FdJL
	 SS9/v+gso/M9T1ReB7ioMHdNvFXQ74ImLErduWqE3fubCGlD6gfANC1nj5NWggcloQ
	 UAjkdTZmYRgdVo66u0YvV3qtp1AcqUexUDNL77Y90PSDdyDtyRaxljl0cgT3qpMiBc
	 sLPQRd2J4E7JhLpm0Q7XJSmpiOOvxc9bSvcPPGY/2HsGFAd1WIPookJdVIVMv0pe+u
	 Z4oaogFa1h5bqyrwnXJlNbRTr0lO6MlVVP0YpHqUnT147kwtp4IOKu7TrPtNCwHrcu
	 mYphVAbb4JLRA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 18 Mar 2025 12:46:07 +0100
Subject: [PATCH net-next v2 3/7] net: netsec: Add metadata support for xdp
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-mvneta-xdp-meta-v2-3-b6075778f61f@kernel.org>
References: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
In-Reply-To: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Masahisa Kojima <kojima.masahisa@socionext.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
 Michal Kubiak <michal.kubiak@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_044623_616135_AC6111EA 
X-CRM114-Status: GOOD (  11.34  )
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

Set metadata size building the skb from xdp_buff in netsec driver.
netsec driver sets xdp headroom to NETSEC_RXBUF_HEADROOM:

NETSEC_RXBUF_HEADROOM max(XDP_PACKET_HEADROOM, NET_SKB_PAD) + NET_IP_ALIGN

so the headroom is large enough to contain xdp_frame and xdp metadata.
Please note this patch is just compiled tested.

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/socionext/netsec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index dc99821c6226fbaece65c8ade23899f610b44a9a..ee890de69ffe795dbdcc5331e36be86769f0d9a6 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -970,7 +970,7 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
 		struct netsec_de *de = dring->vaddr + (DESC_SZ * idx);
 		struct netsec_desc *desc = &dring->desc[idx];
 		struct page *page = virt_to_page(desc->addr);
-		u32 xdp_result = NETSEC_XDP_PASS;
+		u32 metasize, xdp_result = NETSEC_XDP_PASS;
 		struct sk_buff *skb = NULL;
 		u16 pkt_len, desc_len;
 		dma_addr_t dma_handle;
@@ -1019,7 +1019,7 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
 		prefetch(desc->addr);
 
 		xdp_prepare_buff(&xdp, desc->addr, NETSEC_RXBUF_HEADROOM,
-				 pkt_len, false);
+				 pkt_len, true);
 
 		if (xdp_prog) {
 			xdp_result = netsec_run_xdp(priv, xdp_prog, &xdp);
@@ -1048,6 +1048,9 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
 
 		skb_reserve(skb, xdp.data - xdp.data_hard_start);
 		skb_put(skb, xdp.data_end - xdp.data);
+		metasize = xdp.data - xdp.data_meta;
+		if (metasize)
+			skb_metadata_set(skb, metasize);
 		skb->protocol = eth_type_trans(skb, priv->ndev);
 
 		if (priv->rx_cksum_offload_flag &&

-- 
2.48.1


