Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F73CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkVrUy7dh9MWqjeRA1kzGCzqyCmmuRbOfHYZ5gEfZu8=; b=SakBvTdpGopZ3jGJ/PMHVnYhmM
	tTAOi723touqlMKP0fAuK3tGzK/WlG4IjHgTnrgO2m8woiqqsmHKGmG+i/3oIXq9E3hl/EDwL4BHs
	KZsXt/7+YXr0+fKCq2XaTxSowwZRiKxDZ/bORz4e0Qk9nhzgFKyk5k+dwNRSxNAjvPGfTaY+x0xmY
	Ev0Ho+e3TGTKmTbLUIIPnskgKWofjH+8S1J470MdR9QGPqnr0RlsosqY+2vjIQUwlY4tmQ1Wb41Xt
	gWpsIBMScfRSCQmgfibm6Vb85uH65nnGnuog5yMAZQTEQTMHWlc81oeTzmeClhYXMh6rhoxxbfI92
	ATwfx6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVSe-00000005mag-10zi;
	Tue, 18 Mar 2025 11:50:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVOk-00000005ln2-0hO8;
	Tue, 18 Mar 2025 11:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 689DB5C57EF;
	Tue, 18 Mar 2025 11:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84918C4CEDD;
	Tue, 18 Mar 2025 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742298377;
	bh=5bdfNHNW+EoJKgsImeaU1ELqKAI9RB+ut6VPZYTxSaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dnJg0tI1RHrQUFNIGYqSCDRHEBb8kmU7NXfRpd1yHY9RldMoknRO9txFvGJBrm+9i
	 U3S+wYU6zSEdA6IPrFFPhhLncMYbInYbUgniDhnCLbf7AlmNeyGEKEJ9OfYE7ZQ9M4
	 AdkpRg3WrFBLDqRysfPleQYCb/72T6oKw4BvquInKFv6V/GlfrwB1kDD7dLuJjA3KE
	 Hpz19NKbDM+GG8yGABbbUcxo7bsp2fK1ciHG4vM3L8w8O9d7Rh8HLW8fg+533V9oDL
	 An687yny/E9ghZ84OHVGAIdRgEzE1DIjlYukf7YcbSBJMB66p85UyBd4yJp+RjCPW3
	 EQ+wZtMZOUWYw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 18 Mar 2025 12:46:05 +0100
Subject: [PATCH net-next v2 1/7] net: mvneta: Add metadata support for xdp
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-mvneta-xdp-meta-v2-1-b6075778f61f@kernel.org>
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
X-CRM114-CacheID: sfid-20250318_044618_290771_DCF44EAA 
X-CRM114-Status: GOOD (  10.93  )
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

Set metadata size building the skb from xdp_buff in mvneta driver
mvneta sets xdp headroom to:

MVNETA_MH_SIZE + MVNETA_SKB_HEADROOM

where

MVNETA_MH_SIZE 2
MVNETA_SKB_HEADROOM max(NET_SKB_PAD, XDP_PACKET_HEADROOM)

so the headroom is large enough to contain xdp_frame and xdp metadata.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/marvell/mvneta.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 44b18c57390927e37eac267632cace656bb5526e..147571fdada378e430fd96f2fb4a7e7870b784a2 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -2342,7 +2342,7 @@ mvneta_swbm_rx_frame(struct mvneta_port *pp,
 	prefetch(data);
 	xdp_buff_clear_frags_flag(xdp);
 	xdp_prepare_buff(xdp, data, pp->rx_offset_correction + MVNETA_MH_SIZE,
-			 data_len, false);
+			 data_len, true);
 }
 
 static void
@@ -2396,6 +2396,7 @@ mvneta_swbm_build_skb(struct mvneta_port *pp, struct page_pool *pool,
 		      struct xdp_buff *xdp, u32 desc_status)
 {
 	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
+	u32 metasize = xdp->data - xdp->data_meta;
 	struct sk_buff *skb;
 	u8 num_frags;
 
@@ -2410,6 +2411,8 @@ mvneta_swbm_build_skb(struct mvneta_port *pp, struct page_pool *pool,
 
 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
 	skb_put(skb, xdp->data_end - xdp->data);
+	if (metasize)
+		skb_metadata_set(skb, metasize);
 	skb->ip_summed = mvneta_rx_csum(pp, desc_status);
 
 	if (unlikely(xdp_buff_has_frags(xdp)))

-- 
2.48.1


