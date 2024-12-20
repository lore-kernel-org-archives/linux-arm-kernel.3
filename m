Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F71E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 08:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sIHIgWFpQUvX2jXNx2azeaWpatd549ZsSnWm31PKQmM=; b=lbs4jH0y1u4JKm1W9SojGsnTxk
	pjo0Wl1Jade55ed+hyqnoYLSDHAq2Z/3BBzdTQQy5Rs3V7+sDn2fOe+qTQAWMKYfc1ohKSmprOuV0
	kKZ64p6FjRvsFgHdirZYgfYUD61izZDPFlAIoquQwZGS2YYG53K7iFTw4fS1MXyDu20EZKzQ6iVqm
	ZAzDgWJdykQDbeb8n72Ehh9+QJv2O8aMpKXsmnM5cbxIjD0W6iwJWOMYaTQlkm62cRiZmtHTqPwcu
	iP168J7/td119vKpWegFibS4k4lzcOh34TOspPW1VbwBcNTB7WTOfFTOFDjh7nKQMeyP4TbhE9s5s
	9ALGn3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOY4J-00000004F2x-33pN;
	Fri, 20 Dec 2024 08:09:07 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOY3B-00000004Ete-1mkd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 08:07:58 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7fd5248d663so1188368a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734682076; x=1735286876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIHIgWFpQUvX2jXNx2azeaWpatd549ZsSnWm31PKQmM=;
        b=BvGs4f1NvL1NHuWbI2wC2Q+xL28bFal7C6QGMBSFIN/BuYVVJMwSakTeIqPq0Q1xy5
         U8mMee8l0ioFGs0GhQ5XyiSTt7Lvs0N59SWu0aZ4wqtVwizXp4q5WjxtmXcESLOhM5kq
         /U0DparduCctXmA4/N/xKdgd91v3RXTSwUhkx90DZZ0WiWhPiN8Vv8KnRXkxdY/686oY
         CR6bPyj9c8BklBhVdJvXRQrEBonFZmP8EAIqScZdrmJglJhkPF84zk190+8TGfQLs/5a
         YuRf7PSQ+9qT9z8z7RfJ++U5rr6hWLZqn29iK/iNrIvHtSLaqB6UkdQb5W9lRRxiJlAP
         9ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734682076; x=1735286876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIHIgWFpQUvX2jXNx2azeaWpatd549ZsSnWm31PKQmM=;
        b=khcKXqG/8yIAOe3sloP0rrOwERdtl/gXmqzl+QK0PEUEsdtK8ThLduGXe6Bnpj+s4L
         A5hPXRNZWJutHX32wJFHFwfpd48gKXGzpct8w7BBH6QFjAY1LNCYjNsu8D2FabSI2R8t
         qisk2Yc+kXFuBjyhURiUWw9Y6GHgkLnG4hAOrB+xGjpouvu7k8DVvrs4aBUDQqmiHbLh
         gQWqGS1QLxRmoCOUwvxmNdatve3TIxUxsc1OZ2B8Jnzq/Hc70w66Ypfs3l6DuNMcPOkT
         fzNbIOpYmxOZGKYkn4k2ukAMIj/WVE069BZnps0lzZ4b/GT0U2nSX9Jda6I8uRZcHaMa
         MloQ==
X-Forwarded-Encrypted: i=1; AJvYcCUReJxZUqVCPXB2/Pl/cCikhtuPGrY/z7El+WB7nEnNpWloWJK4abkqtXu400V4ttWbG1kb8IjzIqdQ3/EJWHmk@lists.infradead.org
X-Gm-Message-State: AOJu0YxcPMkY7bK4oLsbEYU0huELuPSMpOYm74f5qTR+++yOxCunV/lq
	HoXaaD9Ita5q7OJRNWCBiP6H6BMzYte0SNeit8F+YQlj/jZRTft5
X-Gm-Gg: ASbGncsXqRoNsuu3CzFiZBrQlpFeNffEte1fcOgLgH0wxftHuKMmDo4daTXXnJg07NL
	X/BqDvsoMSLfiX0fTxZEsAz5lHSuxmeRpAvnVQuBCs8gaOuQYyymKuSHvwzKybuWNCGrERZ3yTC
	nakw2squ8TWFzuZEaPeU5WtFSIHD5XJMWFItNkeJu63scQ6YPnzZ3yPOPj41Ka3i7krVM29YoeQ
	brgGVt8eWsLam08Htbh2cuC6TWJiFBINdGDMqn80By7E6XgtXpoLvovyO2dYWmi3zv59g==
X-Google-Smtp-Source: AGHT+IG/D9plEVilAERZI3fidpIBW8JkrUOdC70JJmLdSIf9OIsnZlzX/HnlT4jua2CEoZFs6bN1Fw==
X-Received: by 2002:a17:90b:5487:b0:2ee:d9f5:cfb4 with SMTP id 98e67ed59e1d1-2f452eeb66dmr2697667a91.36.1734682075918;
        Fri, 20 Dec 2024 00:07:55 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f447883b0csm2971735a91.42.2024.12.20.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:07:55 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v2] net: stmmac: TSO: Simplify the code flow of DMA descriptor allocations
Date: Fri, 20 Dec 2024 16:07:26 +0800
Message-Id: <20241220080726.1733837-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_000757_466935_F8D07624 
X-CRM114-Status: GOOD (  22.29  )
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

The TCP Segmentation Offload (TSO) engine is an optional function in
DWMAC cores, it is implemented for dwmac4 and dwxgmac2 only, ancient
dwmac100 and dwmac1000 are not supported by hardware. Current driver
code checks priv->dma_cap.tsoen which is read from MAC_HW_Feature1
register to determine if TSO is enabled in hardware configurations,
if (!priv->dma_cap.tsoen) driver never sets NETIF_F_TSO for net_device.

This patch never affects dwmac100/dwmac1000 and their stmmac_desc_ops:
ndesc_ops/enh_desc_ops, since TSO is never supported by them two.

The DMA AXI address width of DWMAC cores can be configured to
32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
get a little different between 32-bit and 40-bit/48-bit.
Current driver code checks priv->dma_cap.addr64 to use certain format
with certain configuration.

This patch converts the format of DMA transmit descriptors on dwmac4
and dwxgmac2 that the DMA AXI address width is configured to 32-bit (as
described by function comments of stmmac_tso_xmit() in current code) to
a more generic format (see updated function comments after this patch)
which is actually already used on 40-bit/48-bit platforms to provide
better compatibility and make code flow cleaner in TSO TX routine.

Another interesting finding, struct stmmac_desc_ops is a common abstract
interface to maintain descriptors, we should avoid the direct assignment
of descriptor members (e.g. desc->des0), stmmac_set_desc_addr() is the
proper method yet. This patch tries to improve this by the way.

Tested and verified on:
DWMAC CORE 5.00a with 32-bit DMA AXI address width
DWMAC CORE 5.10a with 32-bit DMA AXI address width
DWXGMAC CORE 3.20a with 40-bit DMA AXI address width

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
V1 -> V2: Update commit message
V1: https://lore.kernel.org/r/20241213030006.337695-1-0x1207@gmail.com
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 60 ++++++++-----------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6bc10ffe7a2b..99eaec8bac4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4116,11 +4116,7 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 			desc = &tx_q->dma_tx[tx_q->cur_tx];
 
 		curr_addr = des + (total_len - tmp_len);
-		if (priv->dma_cap.addr64 <= 32)
-			desc->des0 = cpu_to_le32(curr_addr);
-		else
-			stmmac_set_desc_addr(priv, desc, curr_addr);
-
+		stmmac_set_desc_addr(priv, desc, curr_addr);
 		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ?
 			    TSO_MAX_BUFF_SIZE : tmp_len;
 
@@ -4166,17 +4162,27 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
  *  First Descriptor
  *   --------
  *   | DES0 |---> buffer1 = L2/L3/L4 header
- *   | DES1 |---> TCP Payload (can continue on next descr...)
- *   | DES2 |---> buffer 1 and 2 len
+ *   | DES1 |---> can be used as buffer2 for TCP Payload if the DMA AXI address
+ *   |      |     width is 32-bit, but we never use it.
+ *   |      |     Also can be used as the most-significant 8-bits or 16-bits of
+ *   |      |     buffer1 address pointer if the DMA AXI address width is 40-bit
+ *   |      |     or 48-bit, and we always use it.
+ *   | DES2 |---> buffer1 len
  *   | DES3 |---> must set TSE, TCP hdr len-> [22:19]. TCP payload len [17:0]
  *   --------
+ *   --------
+ *   | DES0 |---> buffer1 = TCP Payload (can continue on next descr...)
+ *   | DES1 |---> same as the First Descriptor
+ *   | DES2 |---> buffer1 len
+ *   | DES3 |
+ *   --------
  *	|
  *     ...
  *	|
  *   --------
- *   | DES0 | --| Split TCP Payload on Buffers 1 and 2
- *   | DES1 | --|
- *   | DES2 | --> buffer 1 and 2 len
+ *   | DES0 |---> buffer1 = Split TCP Payload
+ *   | DES1 |---> same as the First Descriptor
+ *   | DES2 |---> buffer1 len
  *   | DES3 |
  *   --------
  *
@@ -4186,15 +4192,14 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct dma_desc *desc, *first, *mss_desc = NULL;
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int tmp_pay_len = 0, first_tx, nfrags;
 	unsigned int first_entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
 	struct stmmac_tx_queue *tx_q;
 	u32 pay_len, mss, queue;
-	dma_addr_t tso_des, des;
+	int i, first_tx, nfrags;
 	u8 proto_hdr_len, hdr;
+	dma_addr_t des;
 	bool set_ic;
-	int i;
 
 	/* Always insert VLAN tag to SKB payload for TSO frames.
 	 *
@@ -4279,24 +4284,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (dma_mapping_error(priv->device, des))
 		goto dma_map_err;
 
-	if (priv->dma_cap.addr64 <= 32) {
-		first->des0 = cpu_to_le32(des);
-
-		/* Fill start of payload in buff2 of first descriptor */
-		if (pay_len)
-			first->des1 = cpu_to_le32(des + proto_hdr_len);
-
-		/* If needed take extra descriptors to fill the remaining payload */
-		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
-		tso_des = des;
-	} else {
-		stmmac_set_desc_addr(priv, first, des);
-		tmp_pay_len = pay_len;
-		tso_des = des + proto_hdr_len;
-		pay_len = 0;
-	}
-
-	stmmac_tso_allocator(priv, tso_des, tmp_pay_len, (nfrags == 0), queue);
+	stmmac_set_desc_addr(priv, first, des);
+	stmmac_tso_allocator(priv, des + proto_hdr_len, pay_len,
+			     (nfrags == 0), queue);
 
 	/* In case two or more DMA transmit descriptors are allocated for this
 	 * non-paged SKB data, the DMA buffer address should be saved to
@@ -4400,11 +4390,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	/* Complete the first descriptor before granting the DMA */
-	stmmac_prepare_tso_tx_desc(priv, first, 1,
-			proto_hdr_len,
-			pay_len,
-			1, tx_q->tx_skbuff_dma[first_entry].last_segment,
-			hdr / 4, (skb->len - proto_hdr_len));
+	stmmac_prepare_tso_tx_desc(priv, first, 1, proto_hdr_len, 0, 1,
+				   tx_q->tx_skbuff_dma[first_entry].last_segment,
+				   hdr / 4, (skb->len - proto_hdr_len));
 
 	/* If context desc is used to change MSS */
 	if (mss_desc) {
-- 
2.34.1


