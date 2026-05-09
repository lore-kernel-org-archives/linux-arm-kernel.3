Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA61CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4qqVuY20vWi5Wyys0RJEI/xkcBg3JMmfkSa061S4Sk=; b=2djd+YYey4Jv03j6BPJ05bRrnN
	iedk69Ja7KCpT4+wRdPNvV0kQYTxSNVC8HvYZhw4JpNcNWCp/6xHq5P1CrJ8mye53sI6d0BKDd9B/
	Z+99/Im6Oke6ut4NenzmB+w8Ki+daDS2F5AkgEgmkaWFcv32PDOvUhgnXLxTao+uSa14lpAta5GGA
	FMT4v5XJmqIDonUjZOvo3Ii240pFNLP78FYVO1GPnARor+ffCgZpOWS51i7mOINei99MBLohMHXuC
	GvL8C3kkcpuDDz5zsBFLwa8mK1tAfhJG3RjNJLAx2KB11dSaBewwPp1+xYAGEsWIumKXhR3QCWCEO
	EtENkcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhNa-00000008yKq-3ypA;
	Sat, 09 May 2026 13:06:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhNX-00000008yHt-2LQ6;
	Sat, 09 May 2026 13:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FF4F43C56;
	Sat,  9 May 2026 13:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3475C2BCB2;
	Sat,  9 May 2026 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778331959;
	bh=i/o5rMhIgPyVu8XYuoQS4qdrmGAHMa4Oy5hB1iaTjr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KPoxKkdr9UB9t1A2L3eKyMymC9McgcC94weQafa6PnZhoHGo6l/bh0AS+MmwG5ZaH
	 RaVf4BlHxX3N8ns+5rvrfa0EMh9PbXGOOiN6IdOb8URZd3tCxedFY8vNLS1IBXn9oD
	 mOd1UI59l6z5WxgF31r5GXkGp9jPhODlMwXiuAgZSLMtkdxgQqvxF5tzHxZi/W6YAI
	 Grwu/5KX7ndbnYSuS5j3zadmzIT5T/Lk2DH6Nc2RwJq12nfiObBNN3FHVjKln2RNM2
	 /HZHVNApFZd+3hMyak8An06F/kPeBDpUPth5NLLXRiGUr9xXx1AzCwBKQMdjuHgoei
	 1OlrEEUXgURxg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 May 2026 15:05:27 +0200
Subject: [PATCH net-next v5 02/12] net: airoha: Reserve RX headroom to
 avoid skb reallocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-airoha-eth-multi-serdes-v5-2-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org>
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_060559_782386_E3E43393 
X-CRM114-Status: GOOD (  11.18  )
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

Reserve NET_SKB_PAD + NET_IP_ALIGN bytes of headroom for received packets
to avoid skb head reallocation when pushing protocol headers into the skb.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++++--
 drivers/net/ethernet/airoha/airoha_eth.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index f71fb18197ec..8a941c58d1b4 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -543,9 +543,11 @@ static int airoha_qdma_fill_rx_queue(struct airoha_queue *q)
 		q->queued++;
 		nframes++;
 
+		offset += AIROHA_RX_HEADROOM;
 		e->buf = page_address(page) + offset;
 		e->dma_addr = page_pool_get_dma_addr(page) + offset;
-		e->dma_len = SKB_WITH_OVERHEAD(q->buf_size);
+		e->dma_len = SKB_WITH_OVERHEAD(q->buf_size -
+					       AIROHA_RX_HEADROOM);
 
 		val = FIELD_PREP(QDMA_DESC_LEN_MASK, e->dma_len);
 		WRITE_ONCE(desc->ctrl, cpu_to_le32(val));
@@ -627,10 +629,12 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 
 		port = eth->ports[p];
 		if (!q->skb) { /* first buffer */
-			q->skb = napi_build_skb(e->buf, q->buf_size);
+			q->skb = napi_build_skb(e->buf - AIROHA_RX_HEADROOM,
+						q->buf_size);
 			if (!q->skb)
 				goto free_frag;
 
+			skb_reserve(q->skb, AIROHA_RX_HEADROOM);
 			__skb_put(q->skb, len);
 			skb_mark_for_recycle(q->skb);
 			q->skb->dev = port->dev;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 58530d096de7..6cd589b790b6 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -32,6 +32,7 @@
 #define AIROHA_FE_MC_MAX_VLAN_TABLE	64
 #define AIROHA_FE_MC_MAX_VLAN_PORT	16
 #define AIROHA_NUM_TX_IRQ		2
+#define AIROHA_RX_HEADROOM		(NET_SKB_PAD + NET_IP_ALIGN)
 #define HW_DSCP_NUM			2048
 #define IRQ_QUEUE_LEN(_n)		((_n) ? 1024 : 2048)
 #define TX_DSCP_NUM			1024

-- 
2.54.0


