Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A932C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LjGT+0g9DBkHyIRREem1p9vsk1tbzvZptw7HNRAz1k=; b=PIulUW2hHoqEHbMIqTege1h5FU
	jhZM1929GehhgBmuocaPzfAWDKHUwKhWywEDAJCVcRLc/a3ajyWh53FVllRScU8rWPqEDcUJfnCy+
	aKxYFNhErjbSImFgCi21VMXIZLfSAIriT4SMEbEbhlb7j3bDi4KOTNJ3Xkd0s3L1n0BfHcJVmT+e9
	p8rHwx1a4XmgwgDCx19NI3ymDCasH6AbaUbWMuVn60perp+8Kpm4rgXvmtYi+RTZqSDsHsJWWfphJ
	++QJz1nyzRgQosQOUsUA6XcnCIMEmxYdnQH8XJ22+qyJmJY/K5NgG+KxgacpvtGL2gCCHoefmS4uQ
	TMtxTXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVav-00000005nz3-3BJ2;
	Tue, 18 Mar 2025 11:58:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVOx-00000005lr9-1RWr;
	Tue, 18 Mar 2025 11:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1992FA48E7A;
	Tue, 18 Mar 2025 11:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD104C4CEEF;
	Tue, 18 Mar 2025 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742298390;
	bh=iVv9lKsgzc7NHnkM2bif0jCWiz/F21PHpCbC8MzU9us=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KBECqMmdeZ8yKJyBVe2cc8UUyMS4dTq73V1W4rI1ZwPqcLZwmIXMDoHrHFAPjGY6V
	 EGzq4181p57fxkBYmMZ1SWAWgtOZkClekmig7OhdkIylg8nNRu8wuMZzPuv5M2BkR7
	 deXdnJJ2sa5MoHsANTfBX6GJTsx/idultdZVL5WVvrFiontRDeS3yaXy0vAu4SfDB9
	 5lsel9aY6VHkt5gHBBUw3nYKoG+N6J/tykrk0H65Yw0jBAUbcIImaCjGmjJvHFECGz
	 Z9IeXXzwxfXB/y60Chk+vUhjYGM4kd5xkW2dWHi5E4jFnMbDGIcdsE6tNdqoGUFgn3
	 Okyr8lWvlENLQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 18 Mar 2025 12:46:10 +0100
Subject: [PATCH net-next v2 6/7] net: mana: Add metadata support for xdp
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-mvneta-xdp-meta-v2-6-b6075778f61f@kernel.org>
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
X-CRM114-CacheID: sfid-20250318_044631_519062_E4A4A892 
X-CRM114-Status: GOOD (  11.78  )
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

Set metadata size building the skb from xdp_buff in mana driver.
mana driver sets xdp headroom to XDP_PACKET_HEADROOM so the headroom is
large enough to contain xdp_frame and xdp metadata.
Please note this patch is just compiled tested.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
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
index 9a8171f099b63c6a1a6415f12718d46d5d835f97..e190d5ee51544090a703c14c76abdc23797f864a 100644
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


