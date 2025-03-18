Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C833DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LF0sGt9EDJCDjiIIHIH3LVrPZZWzR7DEzbi0LwhJr4s=; b=1xFDnT+3cPGh+jhjN/cq1PyxtE
	OOfvk5fRZKr/qVEA0h+foDX3sMEAs6qgqxXmuuVDSP2rMoZ+O838x6THeIKDpXrkgQvm040gWTU36
	1Slytbw+lwPNCB53ktslTtNDRVU3Jgj+f3APtGe4LNuL40pY+HdD7aw/bMLPIGf9k3jaYdb+nWRvc
	kxKxFW1AcKzSTgG1vwVW7HZjSxHV+qciHA+i2x4HngjCiHxKvFdLSx1nra1drbjC0DwAKB1Ginhwi
	R7JMMKx+m5gcDeDO1lmoqmTRke0i91gnYEZyqRRFQIfKyzYlsT96RfmynLTrqX4Y5MFG3tleiiD5Z
	e3old6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVcb-00000005oFO-3kxj;
	Tue, 18 Mar 2025 12:00:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVOz-00000005lri-3bct;
	Tue, 18 Mar 2025 11:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99A64A48F8A;
	Tue, 18 Mar 2025 11:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A68BC4CEDD;
	Tue, 18 Mar 2025 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742298392;
	bh=tn+hq/0Bcb87RovOeP5Bt+IfR0Zp29EmcXvKf0cZpUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qjjG1njZTUG9rTBF7/APH6lBgtwgCIYSgX0FQiQLgna6AbPIzk+CTTlZZSa1gerVt
	 Rp/KCVp7JDwwYy504ZHF+lk8Wu+9lzNNTYVo04k8zZKdBZ+JIa/YjbKycMcjpuNqz6
	 iJCeFzES9xKg7DgrNR2Z884Lhz4irjZHKm4KorN1QgF+iIO2TmK2MCbzrwoTIRIzrp
	 nnVxKIPAmMV3tJjqP42kQPoUI3rlLapeeJaWXuYs0oSfUpnEgAPl7E6wwkpW6Ku8/0
	 EoklRCPx8CWC4gJmymjnaLAx1yUNE/tVzSdImFL0iKRYWWFOeOP7bYHT4XCHXqZ+Jv
	 BAiaHx489kSFg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 18 Mar 2025 12:46:11 +0100
Subject: [PATCH net-next v2 7/7] net: ti: cpsw: Add metadata support for
 xdp mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-mvneta-xdp-meta-v2-7-b6075778f61f@kernel.org>
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
X-CRM114-CacheID: sfid-20250318_044634_034718_00952879 
X-CRM114-Status: GOOD (  12.31  )
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

Set metadata size building the skb from xdp_buff in cpsw/cpsw_new
drivers. ti cpsw and cpsw_new drivers set xdp headroom at least to
CPSW_HEADROOM_NA:

CPSW_HEADROOM_NA max(XDP_PACKET_HEADROOM, NET_SKB_PAD) + NET_IP_ALIGN

so the headroom is large enough to contain xdp_frame and xdp metadata.
Please note this patch is just compiled tested.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/ti/cpsw.c     | 6 +++++-
 drivers/net/ethernet/ti/cpsw_new.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 0cb6fa6e5b7d4fb9703633f0d67a7e95e6e7d8aa..a984b7d84e5e5917b83547c862924ccd30d83601 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -351,6 +351,7 @@ static void cpsw_rx_handler(void *token, int len, int status)
 	int			ret = 0, port, ch = xmeta->ch;
 	int			headroom = CPSW_HEADROOM_NA;
 	struct net_device	*ndev = xmeta->ndev;
+	u32			metasize = 0;
 	struct cpsw_priv	*priv;
 	struct page_pool	*pool;
 	struct sk_buff		*skb;
@@ -400,7 +401,7 @@ static void cpsw_rx_handler(void *token, int len, int status)
 			size -= CPSW_RX_VLAN_ENCAP_HDR_SIZE;
 		}
 
-		xdp_prepare_buff(&xdp, pa, headroom, size, false);
+		xdp_prepare_buff(&xdp, pa, headroom, size, true);
 
 		port = priv->emac_port + cpsw->data.dual_emac;
 		ret = cpsw_run_xdp(priv, ch, &xdp, page, port, &len);
@@ -408,6 +409,7 @@ static void cpsw_rx_handler(void *token, int len, int status)
 			goto requeue;
 
 		headroom = xdp.data - xdp.data_hard_start;
+		metasize = xdp.data - xdp.data_meta;
 
 		/* XDP prog can modify vlan tag, so can't use encap header */
 		status &= ~CPDMA_RX_VLAN_ENCAP;
@@ -423,6 +425,8 @@ static void cpsw_rx_handler(void *token, int len, int status)
 
 	skb_reserve(skb, headroom);
 	skb_put(skb, len);
+	if (metasize)
+		skb_metadata_set(skb, metasize);
 	skb->dev = ndev;
 	if (status & CPDMA_RX_VLAN_ENCAP)
 		cpsw_rx_vlan_encap(skb);
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 3da1c131335df1ff79b32ce0e3ea5200a2e53f4b..5b5b52e4e7a757a14965fe6df41935aed547111f 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -293,6 +293,7 @@ static void cpsw_rx_handler(void *token, int len, int status)
 	struct page_pool *pool;
 	struct sk_buff *skb;
 	struct xdp_buff xdp;
+	u32 metasize = 0;
 	int ret = 0;
 	dma_addr_t dma;
 
@@ -345,13 +346,14 @@ static void cpsw_rx_handler(void *token, int len, int status)
 			size -= CPSW_RX_VLAN_ENCAP_HDR_SIZE;
 		}
 
-		xdp_prepare_buff(&xdp, pa, headroom, size, false);
+		xdp_prepare_buff(&xdp, pa, headroom, size, true);
 
 		ret = cpsw_run_xdp(priv, ch, &xdp, page, priv->emac_port, &len);
 		if (ret != CPSW_XDP_PASS)
 			goto requeue;
 
 		headroom = xdp.data - xdp.data_hard_start;
+		metasize = xdp.data - xdp.data_meta;
 
 		/* XDP prog can modify vlan tag, so can't use encap header */
 		status &= ~CPDMA_RX_VLAN_ENCAP;
@@ -368,6 +370,8 @@ static void cpsw_rx_handler(void *token, int len, int status)
 	skb->offload_fwd_mark = priv->offload_fwd_mark;
 	skb_reserve(skb, headroom);
 	skb_put(skb, len);
+	if (metasize)
+		skb_metadata_set(skb, metasize);
 	skb->dev = ndev;
 	if (status & CPDMA_RX_VLAN_ENCAP)
 		cpsw_rx_vlan_encap(skb);

-- 
2.48.1


