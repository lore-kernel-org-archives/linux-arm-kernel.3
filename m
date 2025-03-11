Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3C0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98mwQrG8ZHKQksTB2YWqxqCiv19DJ16z6lfP14d/9T8=; b=ZPUJjLmNMg6XmMfKJxOothD24z
	Hf8e1+l7zVN5+Zn/LrikjJnVZFLixVbjEoCMefZ8CnOQV5VX24SMDJ6JFPejSph81tfONwvEHmYl6
	LfButBc8jc9xAw9lTqlQf1O6dQvUtWuCqy9M7+uC2ofRg0phoiOLD7LZuVEykzBkVJt0VrvWj1zcH
	5hZg1OweQgwm2OHSDuU9/gsrLdZmBaMIasTlhqIjTUSfIlkoHLATbNOx8Cqw7PNBUMx9gX5AVsHTh
	nM2V7C0q/moCqNxDl4y0uVoW2J3VzxYEhmsxYTRjc+QJ/m100SjnATsuLQxCgvPsHaALSNkevU9CT
	Tp+vY6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryk8-00000005eFT-2QG3;
	Tue, 11 Mar 2025 12:29:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryZk-00000005bcB-26Tr;
	Tue, 11 Mar 2025 12:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 336B75C623C;
	Tue, 11 Mar 2025 12:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D98C4CEEE;
	Tue, 11 Mar 2025 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741695551;
	bh=hM+Tb4R5v8bLINi/KffYzAfj9nxBFX9y1AOJMkEpWCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mtvS7dUpX92xO/aWwKdRelwCLf5IKHFEHhw03H4yOPk+kGjXEOcMTnCxn1TIufoAR
	 rbgN+CEuyzxrB9DFcjJnx6d/ZQpl7GRZbtQ4DE4L3TdbeNWcK4xMDzkEdGzWi4L8Fh
	 GhnOsn8oFwdtku8OaN0lCJJhsK12LBxr3IYkrO/nZceHeVqRgKm5dRA+pzfq0amITL
	 kh3cnGnkwpR2x9J+1p6bid8s0c5as08d1IOWundV5LmNn3pFMssapMIndBtG+8XNKV
	 h8X+6fxlSOT6lyAjNXzkA93+kujQQUHn6XWPkoJ/NzB8ADekfC34H0+XNA+AYavzW6
	 uQou4/yOIttSg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 13:18:37 +0100
Subject: [PATCH net-next 5/7] net: ethernet: mediatek: Add metadata support
 for xdp mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mvneta-xdp-meta-v1-5-36cf1c99790e@kernel.org>
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
X-CRM114-CacheID: sfid-20250311_051912_628559_DC076C8F 
X-CRM114-Status: GOOD (  11.10  )
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

Set metadata size building the skb from xdp_buff in mediatek driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 922330b3f4d70421276ecd3f4ab175b3ae263f71..43197b28b3e745319e974c6022a6a51b6953f60a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2122,7 +2122,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		if (ring->page_pool) {
 			struct page *page = virt_to_head_page(data);
 			struct xdp_buff xdp;
-			u32 ret;
+			u32 ret, metasize;
 
 			new_data = mtk_page_pool_get_buff(ring->page_pool,
 							  &dma_addr,
@@ -2138,7 +2138,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 			xdp_init_buff(&xdp, PAGE_SIZE, &ring->xdp_q);
 			xdp_prepare_buff(&xdp, data, MTK_PP_HEADROOM, pktlen,
-					 false);
+					 true);
 			xdp_buff_clear_frags_flag(&xdp);
 
 			ret = mtk_xdp_run(eth, ring, &xdp, netdev);
@@ -2158,6 +2158,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 			skb_reserve(skb, xdp.data - xdp.data_hard_start);
 			skb_put(skb, xdp.data_end - xdp.data);
+			metasize = xdp.data - xdp.data_meta;
+			if (metasize)
+				skb_metadata_set(skb, metasize);
 			skb_mark_for_recycle(skb);
 		} else {
 			if (ring->frag_size <= PAGE_SIZE)

-- 
2.48.1


