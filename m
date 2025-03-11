Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A42C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcj9eN4yX3H0LBQW5mVwb+hVWYEEc1Xf8ZUBi9PAoOA=; b=J0AEaJXLI+9FLTb4GpvBtDfjxh
	3odE+1ae6Ij3D8rS60w6VJGcR+ZH4kWXt7d1k9XbI+K0KBJUzWSi0tpqRVwmjgrMAHHPrNatohssR
	UxTSFyV5h1sqTEvlHqKC4uV5dV2+vT8IUU8ut17Rc8wsPV2qiqI6TtSF6h3LS197NV/0/ORVnzlaV
	ZLU/AiltUA3YpfI0va5SJ3ISFofqYk6PqQ67HQ0fIEVyI+b8P+fieqzpZVEB+iDpEx+yCz1wrr0d2
	97ivOU63/LCPJgsv9dH/cK1PZSanubhnj9fTR3Vi2Pc/UQ1zjvQJaSDNZ9Dpk91RAwsdF72dk5e9G
	Y5xz2dhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trygt-00000005dSQ-2BPe;
	Tue, 11 Mar 2025 12:26:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryZe-00000005baw-0ucJ;
	Tue, 11 Mar 2025 12:19:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5F975C621E;
	Tue, 11 Mar 2025 12:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD207C4CEE9;
	Tue, 11 Mar 2025 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741695545;
	bh=WlTKQ3kcPFy8Hxds+Qy4aCVKV8kY2r+qZ2PUzA/IBug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eGYIcZt+Un/GTINujdFJtIr0Mdj8NtySDL9FVsZAqLLOXDruVRrxBRsdKxYb/mycm
	 W9v1AbhrCHepRf0w4reU64wK2RSCX7G/nWHeuGxYpbRr2ud4gyTUCEStQnfu+vI806
	 VU8YGqYc3tlITLzZdAs9Sc4YyjqPQCAZPssUEV93gUyVtfC8oLS+RFT8EY7Ox+ofHD
	 rn1gz07XdDV/dj31vYJc4Y3AGFBgCstiDp1oQKwIkO2Z2ytKAg8lNuGIcbUuz0p6QA
	 uXFwAYz29Qd/wPW/6GDhjmIRrWxxE3yJ3f2CgNERitHfBJI8GH1daWFLTNZLadrx7v
	 gZIbiwCDg8rhQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 13:18:35 +0100
Subject: [PATCH net-next 3/7] net: netsec: Add metadata support for xdp
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mvneta-xdp-meta-v1-3-36cf1c99790e@kernel.org>
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
In-Reply-To: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
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
 Roger Quadros <rogerq@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_051906_346084_0223BA6B 
X-CRM114-Status: GOOD (  10.52  )
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

Set metadata size building the skb from xdp_buff in netsec driver

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


