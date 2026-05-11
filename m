Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B11CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEcqQdxhuFVXx7OvJFukLBeh46o9QjwdgurNQ0HzpJc=; b=2Meginm3gyHuRnshUN9+hfN9We
	BnnoEAhWPpQ0YEfXeBnLYGA0teK7Px+21bG4vwKgGrjNE+LdDPRNwQH8YWLeIpJJzbWtbyPyzVUtI
	NSHu7DmpA+K+Kbw1Nqfh9oEcpmGvIt26gsQ51PuWq0z7+f/oGzLImBgBDFGAdk1gEuvXDTSPMNNXd
	Hntn5KDkmR2ZlE/f8s4l4lFYVqM6xWEiPXHWDTDqDug2XGYdhaFdp8Lj0UnBH1O2vLkYcb+HyUkd2
	xspXufGt4PIYnzvkgtVcd+OHqk7EZ6nHqetwlp/O+PzA2PCPruA8U2/7qvZ3rVnESOlfHi+WIW9Fs
	c233Qi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOD3-0000000DA6E-0G6v;
	Mon, 11 May 2026 10:50:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOCz-0000000DA2J-12ev;
	Mon, 11 May 2026 10:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B09F760120;
	Mon, 11 May 2026 10:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13554C2BCFA;
	Mon, 11 May 2026 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778496596;
	bh=GtTOCUnQPmRi1bdY3r2oyNNR2Jf+SjIm6GiVXh4YsaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GSms5RNqkNhlpdXvq5TB2KG/fRLLNTupXApZr7dBsn1q7uP9iL1tz+MyEi0HhYcht
	 RsxfTgcMf0DvAci4ILETh/P/LsaroXhEZlEkX+r4jxgSjdJLBenCx/kmBt8wQ3Oy6I
	 uQ7oCgBNmNTRBjn1A4HxRGoRa3yRv28Dms5hiDbxSd5XzG9mLw+F2dSV8mYmKXEyP/
	 pDlyLvwqmi6fn2M0ggQjC3t9xNhe6Tz7YtU1/xgPMUL8NUglyxfAOcKzutOZbyIpKs
	 KY+c8GBOoPVBJING2Pgbydf9/Zt6ajG4qaho41j9fFtuDIpkhQO20K+0FTot1emASo
	 lprq6K+vknpKg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 11 May 2026 12:49:28 +0200
Subject: [PATCH net-next v6 02/12] net: airoha: Reserve RX headroom to
 avoid skb reallocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-airoha-eth-multi-serdes-v6-2-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
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
 drivers/net/ethernet/airoha/airoha_eth.c | 12 ++++++++----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index f71fb18197ec..3fe2561c85f1 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -543,9 +543,10 @@ static int airoha_qdma_fill_rx_queue(struct airoha_queue *q)
 		q->queued++;
 		nframes++;
 
+		offset += AIROHA_RX_HEADROOM;
 		e->buf = page_address(page) + offset;
 		e->dma_addr = page_pool_get_dma_addr(page) + offset;
-		e->dma_len = SKB_WITH_OVERHEAD(q->buf_size);
+		e->dma_len = SKB_WITH_OVERHEAD(AIROHA_RX_LEN(q->buf_size));
 
 		val = FIELD_PREP(QDMA_DESC_LEN_MASK, e->dma_len);
 		WRITE_ONCE(desc->ctrl, cpu_to_le32(val));
@@ -616,8 +617,9 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 
 		page = virt_to_head_page(e->buf);
 		len = FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
-		data_len = q->skb ? q->buf_size
-				  : SKB_WITH_OVERHEAD(q->buf_size);
+		data_len = q->skb
+			   ? AIROHA_RX_LEN(q->buf_size)
+			   : SKB_WITH_OVERHEAD(AIROHA_RX_LEN(q->buf_size));
 		if (!len || data_len < len)
 			goto free_frag;
 
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
index 58530d096de7..d3781103abb5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -32,6 +32,8 @@
 #define AIROHA_FE_MC_MAX_VLAN_TABLE	64
 #define AIROHA_FE_MC_MAX_VLAN_PORT	16
 #define AIROHA_NUM_TX_IRQ		2
+#define AIROHA_RX_HEADROOM		(NET_SKB_PAD + NET_IP_ALIGN)
+#define AIROHA_RX_LEN(_n)		((_n) - AIROHA_RX_HEADROOM)
 #define HW_DSCP_NUM			2048
 #define IRQ_QUEUE_LEN(_n)		((_n) ? 1024 : 2048)
 #define TX_DSCP_NUM			1024

-- 
2.54.0


