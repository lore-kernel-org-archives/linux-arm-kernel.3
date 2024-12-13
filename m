Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DBCE77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 03:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KPBXi5N5CCwTHICg2FM5R+V0qUviqQKoqSquGXTiuRs=; b=Gd126BM0ixluCl9I1kosoM0svn
	3xiDNIenhASo6Bf2Flis0ARisaZUOTRBlQo0WijjPaPDQCcil9JHIOsmdz8bwcyHYx68iO0wbl0Iq
	NBhnlR1J+7DETlWOGiLmTMuFY2U9xkDZOR0+HtBRp87MYg5ZW9eVB5zkAaP3ulkibvJLOuutgXBX3
	LcjOz+lwILpFgiLR+IxtI81tHzBjdJ1ACy1j74uBvet3wpPOqThDcPuLzelJWFxqca3R7qsvZXr3b
	x7oGPms091eeSQ3TN6cuOUcQqgMHE7Eo3Xfh7y7srPN1fDLlhcDAcnTqwfFXgUFgeKjGXP/ySoCDQ
	a76Ml2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvwA-00000002Ydn-10ob;
	Fri, 13 Dec 2024 03:01:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvv3-00000002YVW-2dya
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 03:00:48 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-725d9f57d90so936244b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 19:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734058845; x=1734663645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPBXi5N5CCwTHICg2FM5R+V0qUviqQKoqSquGXTiuRs=;
        b=LdRPXACz4B2Wv51ns3AeD2xY8aJS7xNucCzbWSgOWQqRKzNaFLxKlPBkGnQ3WQFG/z
         6gN9EvhhIRkd/KP8QMRLAyT6hujcvCWEhYTaWtswlYi93Rh14hskZV1Ju65ylyrsCSx0
         GPv6YmViLq8ruRXUr36f7+qXqvHS9kO/4Z5V9vVRkBdJANJtTVgsGcgzYO+OO8xRH7NE
         QCeMF4pIqW2+0sd5SqTKjF9wuy0fyF1ms0UPxnL9FWhVlHjLS4thf8Ba/dB0visKmMGQ
         1XNENL4EEUo8DanyOmCyE8JKtIZUz4DIHoHENp/He6rVEZUuYbdPNH99FzrUFpyoUwyz
         gaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734058845; x=1734663645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPBXi5N5CCwTHICg2FM5R+V0qUviqQKoqSquGXTiuRs=;
        b=E6bRhSaMn+foCvtEPWddVxg3nJo2kCiInVBd24rK79BhEtMUhVLxacIQkN+S+WbmtM
         ZaLomp3NvZzyHKNlZqIZxZrtaVqfGmSCR9KDKIy4f7htOPFao9faEfbSgK8QycD4PNJ6
         8ZD0mtGjVGgX0eFv9ZaqNEVW7CFbj99+2mf3tgKnPd0NLGuHMsx+5c0WXL+i8xm1hunk
         CJOYtxQtevoIb2QYcbvvCFwlMy0NfnHlG6vmTKIA+9E6hufVQoIf8U/Xoyw83lbyNzXD
         qiQRDAJzqzAj/hDvmxpJTgbYxPU4U8rMkIuQmQp+wmy8Qw+iR2Z2OjdYm/rEDCSttrzB
         wibg==
X-Forwarded-Encrypted: i=1; AJvYcCXp73465J9eqhfu5DH9slJ2BUjL1dkRm5RMBf62nxDUKlEdH3dlbwhSLDonXi+VzEdYivrGpj018UB1BEqTywMX@lists.infradead.org
X-Gm-Message-State: AOJu0YxlqCNJlzXoXO3IL/qhSvkyqm3iX1+3AVYydYFzsU8Mga2wqgom
	TKOC6m63n2+Z5JHfTKWcHgiG3pQTZwJf2RaTSQOZC2VZnX5do3kxCrCtjg==
X-Gm-Gg: ASbGncvP5iGnLC+NTPIet7sBVH+9R1d4W2zJbkEsxP/TipYJvUq576DgdxIjtzzOwVu
	I/YC6u0qCzdlWKWYTCrdS4mVVplEzZx4w9H4+Xt9VjwywPMumCA56AWeaTCuMZ/Nx3B0cIwkwGM
	CagPwVwVBSLhU7RJhKHToI+CptULW61+3k2aXtNNUs42rQEKmI+a6XrycNaMEasYMbt4/8LElEb
	etjrhtA2pK6UNZHQEzKQWJOCu4CSgmp4MYg14wKVPzpwjaEq6E3HG0rKSN9yqD2TEx5dg==
X-Google-Smtp-Source: AGHT+IHZz0EP8rBsHt73REos2pRhq2kj90v6bkCqeRkKUwXgaZ0ElTwKurf6FJc0UkKYBVOnQvmB0Q==
X-Received: by 2002:a05:6a00:c82:b0:728:eb62:a132 with SMTP id d2e1a72fcca58-7290c1b1c49mr1368212b3a.15.1734058844679;
        Thu, 12 Dec 2024 19:00:44 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-728957aaf22sm5977712b3a.128.2024.12.12.19.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 19:00:44 -0800 (PST)
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
Subject: [PATCH net-next v1] net: stmmac: TSO: Simplify the code flow of DMA descriptor allocations
Date: Fri, 13 Dec 2024 11:00:06 +0800
Message-Id: <20241213030006.337695-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_190045_670722_4E0C8CED 
X-CRM114-Status: GOOD (  20.32  )
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

The DMA AXI address width of DWMAC cores can be configured to
32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
get a little different between 32-bit and 40-bit/48-bit.
Current driver code checks priv->dma_cap.addr64 to use certain format
with certain configuration.

This patch converts the format of DMA transmit descriptors on platforms
that the DMA AXI address width is configured to 32-bit (as described by
function comments of stmmac_tso_xmit() in current code) to a more generic
format (see the updated function comments after this patch) which is
actually already used on 40-bit/48-bit platforms to provide better
compatibility and make code flow cleaner.

Tested and verified on:
DWMAC CORE 5.10a with 32-bit DMA AXI address width
DWXGMAC CORE 3.20a with 40-bit DMA AXI address width

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 60 ++++++++-----------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 16b8bcfa8b11..a48b7cf74a29 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4121,11 +4121,7 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
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
 
@@ -4171,17 +4167,27 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
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
@@ -4191,15 +4197,14 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -4284,24 +4289,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -4405,11 +4395,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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


