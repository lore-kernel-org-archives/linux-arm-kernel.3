Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C44C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrfDy9jf1lYIeWq0N65yo6UgwWb8tofpWW3x4+bkR64=; b=yEo5dq/L8uNLRvezYP74yeRX2w
	BOBobIu49BfmQkQ5fYx0VkcfAGz5FIUlmM+Viq+L0WhlRAZBorLTUjOmcUc9F3Jt1xzCpJrmHIFxI
	bQeFXiqnlimKv78xnaEulPCUOO3PpLvpeih2NwsSd8YDPFhCg6qrlo1l8KRFY7Dzbv00I5e6SPHjl
	u98TpPjp9wVWIC8HEOr9bGb2YUoZ/mjfA/ObCHi5f8gs1zbUZHB0n/aG7f8ggWb5Hp6venOPp0wgg
	qUHDLz9SMusJyFYFFNdVRpJ2BFxmVJf4VeMLZNSqMz1ioHeeAyuYv2HEvplQ34Ll7jV/1nt9o+z+R
	eYGwxKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trylj-00000005eeE-3wAF;
	Tue, 11 Mar 2025 12:31:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryZn-00000005bdB-3Kc6;
	Tue, 11 Mar 2025 12:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD827A418CD;
	Tue, 11 Mar 2025 12:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015E2C4CEEC;
	Tue, 11 Mar 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741695554;
	bh=x+krQGj/SL7R2wTdC09zi8Lq2AOOM9k7jWivDeJJS7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r8AqGYmkKFQQ/vy7x1cM404pF4kwW8b9mOnf9uhfwPUs7/J3vpKMzAJjfAXOquY1L
	 36qn3x0ZcN9kZFSINUG95beouVuvqQk51kt6TDGbq3BeFwB7FJUtrpcmFrxubQZOGU
	 WaTwf6mK71Osy15xecOCW+flQF4dRFyi11XEAXOgo9ilG83bEoUrIqw5f2JS7AD5xh
	 nYpQ1mna/BFRAoAtVl5aUD/Y+dckxhrzHEa5RLHCh8MHWzi5w5MOv1/X62hnh24n/d
	 PUG1fyxAXOIOwqv8D4bs6uqN7OmRF9yI19BP/TSj8f5+bDPq0PutZZBw9SI7I+mQE8
	 IFJYpfJFuFyGQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 13:18:38 +0100
Subject: [PATCH net-next 6/7] net: mana: Add metadata support for xdp mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mvneta-xdp-meta-v1-6-36cf1c99790e@kernel.org>
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
X-CRM114-CacheID: sfid-20250311_051915_962972_D99D4C0F 
X-CRM114-Status: GOOD (  10.90  )
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

Set metadata size building the skb from xdp_buff in mana driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/microsoft/mana/mana_bpf.c | 2 +-
 drivers/net/ethernet/microsoft/mana/mana_en.c  | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microsoft/mana/mana_bpf.c b/drivers/net/ethernet/microsoft/mana/mana_bpf.c
index 23b1521c0df96e7fd595daad8b49fa9be935090c..d30721d4516fc60cf8883f2b35cc561559082ccc 100644
--- a/drivers/net/ethernet/microsoft/mana/mana_bpf.c
+++ b/drivers/net/ethernet/microsoft/mana/mana_bpf.c
@@ -91,7 +91,7 @@ u32 mana_run_xdp(struct net_device *ndev, struct mana_rxq *rxq,
 		goto out;
 
 	xdp_init_buff(xdp, PAGE_SIZE, &rxq->xdp_rxq);
-	xdp_prepare_buff(xdp, buf_va, XDP_PACKET_HEADROOM, pkt_len, false);
+	xdp_prepare_buff(xdp, buf_va, XDP_PACKET_HEADROOM, pkt_len, true);
 
 	act = bpf_prog_run_xdp(prog, xdp);
 
diff --git a/drivers/net/ethernet/microsoft/mana/mana_en.c b/drivers/net/ethernet/microsoft/mana/mana_en.c
index 2d826077d38cdac7ebe9c355cf883b0d727eeca2..a3986fc47b819dae1f8a1d62ebe1ff051b144236 100644
--- a/drivers/net/ethernet/microsoft/mana/mana_en.c
+++ b/drivers/net/ethernet/microsoft/mana/mana_en.c
@@ -1559,8 +1559,12 @@ static struct sk_buff *mana_build_skb(struct mana_rxq *rxq, void *buf_va,
 		return NULL;
 
 	if (xdp->data_hard_start) {
+		u32 metasize = xdp->data - xdp->data_meta;
+
 		skb_reserve(skb, xdp->data - xdp->data_hard_start);
 		skb_put(skb, xdp->data_end - xdp->data);
+		if (metasize)
+			skb_metadata_set(skb, metasize);
 		return skb;
 	}
 

-- 
2.48.1


