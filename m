Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D0CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCmXTVYaRt4RiBQRwuD2RR3u3e6JKLZJQPNiKvz5wI0=; b=C7d0kOy3KjYDxY4kNvpW0XSe2g
	PYJvSzebUn9pPfG+TurQZLzs/3iuSZUmj5acTQAxdNWnvFuqdgjGvo6d0oo0Z76mbKlEGvD6J/qOI
	VK2Zc1AGg+Fe3xc+TCxEmvfrBrb0SYFA2TmuqputFrF3O8I0JdAQJ41T1RxGZYxq7IFo393xoo4Dx
	ER6wTHPoR/CnHrUXN3gOsvViH/pXa24FZ4Rg33TCHwUxPIvIZHeYG4ac83g1x78Tl9uljHMtrDui6
	xnvMiisby4HpO8J+0SL+5bBHODHvO3QEae8O4d73tgPizcWADKxxIhmvfK2ik9dwpcqKaSWOWNNvA
	nqKfOtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuByW-0000000GbcE-1SEa;
	Wed, 12 Aug 2026 16:38:44 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuByR-0000000GbaE-2PPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:38:40 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-92e85499ffbso99594085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786552718; x=1787157518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCmXTVYaRt4RiBQRwuD2RR3u3e6JKLZJQPNiKvz5wI0=;
        b=k1U3XrGVnN9xx5qficWcqYsxq4H/SGmp8OdnfwgWzDDlYOu94fpNcWyXIX97FbqYF8
         RZ9qn/m87ckySG7DNHBUqicp8t0d0uAURvGRP/6av+OANSXbm3opuF5aOv3lE7NWAYhK
         N9yhSurbVhqDpcl9TnDvrawuBmdV9vmyuCWRqeKnVTK/XI0IlGlhHGyzfWFcShx67Z/v
         vU6PccujXyoqYZ358aJqt5WRrAwBhlKRyH9VS48b1k/XcJwuGqzA12uPHRJf4pGay3fm
         D0zD8ztcA6sB7xBX4LopzgPgQNU1DgJxLIG5R8z+VJZJyOwYP3JCsgQ+4V3bxf2aiQUd
         TG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552718; x=1787157518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCmXTVYaRt4RiBQRwuD2RR3u3e6JKLZJQPNiKvz5wI0=;
        b=GkoFOh+ZD22gZ4zTVoSBtfdBTsrYkUuGuHEuEUPvtxkctWYK0UBrACOiTzfDrijPvF
         5x5VQEqw+4NcgvXk5H0zm8nVwM3IMYPwWSmZo0DeAjXKd6IqTahL47Lw1lIBOiO1bC7o
         cadPP4u2q9qN3dylL5a71Az7gvD7tkSQbxrrhjqtLkPUOJLe+YmYb3fR5KQ5TurREhLD
         0yT56IxFeqJ3iuaUxlz/LCspC579/O+fLx6lF6k62LNzEZvKh3qa693ZESRwvPbQSRzc
         lwKj5Z8mn9+ThAe0vMrhjbaJ/+C6ytbP7F/D6vZBp9felJTvLg6NdjMLMt/gaVoaCPGo
         MnwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyVHcmYx/Eu6qa/H1cnKlt81EngXuILqfvn+TQBUx/DhxbB+MocJszq9AsouGMEAcOtHch8sYOjGg4PyNfPzOV@lists.infradead.org
X-Gm-Message-State: AOJu0YwlNuKAKymOPhZON+rLBeorohThTvfS2xXDC1luzB1TIEPy3fQW
	iyasgsqo7ajIXy9YKBVgtiTODmfzKk7vCoKDTLL5LBE3Eqb4PkXu8i5i2QbFJT2EiBY=
X-Gm-Gg: AR+sD11ycnAaIs/ahzcYzIHllDANF9yXAe4CKh4B3ExhKWxWH291VwS0GQ5QRq2Ya6K
	I9mhTulWnqvEMpLtJ0hGCu/eNj65V4XvY12551PFzuZeiGPEXU649vMKHWrM2edBkBs20EghKFR
	5HBvHERs1GNZmsnKIF3KIHYTHxCkPc8j4carqFUemV1CDivAzyvy5bCYcjBWAONE3xyM4CRCctf
	7yYvweOBIvSdflTZRxZpcH+WWlxPmvP1Ot0wDyqH4nvA1sMuxMAhT74ruf4cfOeaE6j+dD/mU79
	421yOn0F9qYyDndA7eOcp6diQcr4BlxGnIhy6m0BCrG3oWYkXPeAmQkbV/qv9E9rUeHly/JG2ne
	jU2fcA93tP0vyQOYs5xh3SfOkfhqeEG25MOsbmsPR3vIFYkw7yjasOZC2B+pVbOBCzet/shwZOY
	XakG4nCp41VwUmG7yBXcS1EiOLVkkDoSU1XBL7xB4f0JWJR2M8MbtzBeXSkfLyLayR
X-Received: by 2002:a05:620a:19a7:b0:92e:7533:ef63 with SMTP id af79cd13be357-936b3a82f84mr533659785a.13.1786552718202;
        Wed, 12 Aug 2026 09:38:38 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5dd3d4dsm166040385a.3.2026.08.12.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:38:37 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: sashiko-bot@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: stmmac: convert DMA address to lower 32 before assignment
Date: Wed, 12 Aug 2026 11:38:31 -0500
Message-ID: <20260812163832.271742-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812163832.271742-1-elder@riscstar.com>
References: <20260812163832.271742-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_093839_626744_92D87D9E 
X-CRM114-Status: GOOD (  13.59  )
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

In jumbo_frm() (implemented in both "chain_mode.c" and "ring_mode.c"),
there are places where a DMA descriptor is converted to little-endian
byte order in assignment.  The DMA descriptor could be a 64-bit value,
which makes the 32-bit byte swapping operation seem a little sketchy.

Explicitly extract the low-order 32 bits of the dma_addr_t value being
converted into a u32 so it's crystal clear that we're doing the right
thing.

Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/chain_mode.c |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index ec25193d287bb..66025e2509e91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -37,7 +37,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 
 	des2 = dma_map_single(priv->device, skb->data,
 			      buf_len, DMA_TO_DEVICE);
-	desc->des2 = cpu_to_le32(des2);
+	desc->des2 = cpu_to_le32(lower_32_bits(des2));
 	if (dma_mapping_error(priv->device, des2))
 		return -1;
 	tx_q->tx_skbuff_dma[entry].buf = des2;
@@ -55,7 +55,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			des2 = dma_map_single(priv->device,
 					      (skb->data + bmax * i),
 					      bmax, DMA_TO_DEVICE);
-			desc->des2 = cpu_to_le32(des2);
+			desc->des2 = cpu_to_le32(lower_32_bits(des2));
 			if (dma_mapping_error(priv->device, des2))
 				return -1;
 			tx_q->tx_skbuff_dma[entry].buf = des2;
@@ -68,7 +68,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			des2 = dma_map_single(priv->device,
 					      (skb->data + bmax * i), len,
 					      DMA_TO_DEVICE);
-			desc->des2 = cpu_to_le32(des2);
+			desc->des2 = cpu_to_le32(lower_32_bits(des2));
 			if (dma_mapping_error(priv->device, des2))
 				return -1;
 			tx_q->tx_skbuff_dma[entry].buf = des2;
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 664d8cfb58cdc..f7949419eb9fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -40,7 +40,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 
 		des2 = dma_map_single(priv->device, skb->data, bmax,
 				      DMA_TO_DEVICE);
-		desc->des2 = cpu_to_le32(des2);
+		desc->des2 = cpu_to_le32(lower_32_bits(des2));
 		if (dma_mapping_error(priv->device, des2))
 			return -1;
 
@@ -48,7 +48,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 		tx_q->tx_skbuff_dma[entry].len = bmax;
 		tx_q->tx_skbuff_dma[entry].is_jumbo = true;
 
-		desc->des3 = cpu_to_le32(des2 + BUF_SIZE_4KiB);
+		desc->des3 = cpu_to_le32(lower_32_bits(des2) + BUF_SIZE_4KiB);
 		stmmac_prepare_tx_desc(priv, desc, 1, bmax, csum,
 				STMMAC_RING_MODE, 0, false, skb->len);
 		tx_q->tx_skbuff[entry] = NULL;
@@ -61,27 +61,27 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 
 		des2 = dma_map_single(priv->device, skb->data + bmax, len,
 				      DMA_TO_DEVICE);
-		desc->des2 = cpu_to_le32(des2);
+		desc->des2 = cpu_to_le32(lower_32_bits(des2));
 		if (dma_mapping_error(priv->device, des2))
 			return -1;
 		tx_q->tx_skbuff_dma[entry].buf = des2;
 		tx_q->tx_skbuff_dma[entry].len = len;
 		tx_q->tx_skbuff_dma[entry].is_jumbo = true;
 
-		desc->des3 = cpu_to_le32(des2 + BUF_SIZE_4KiB);
+		desc->des3 = cpu_to_le32(lower_32_bits(des2) + BUF_SIZE_4KiB);
 		stmmac_prepare_tx_desc(priv, desc, 0, len, csum,
 				STMMAC_RING_MODE, 1, !skb_is_nonlinear(skb),
 				skb->len);
 	} else {
 		des2 = dma_map_single(priv->device, skb->data,
 				      nopaged_len, DMA_TO_DEVICE);
-		desc->des2 = cpu_to_le32(des2);
+		desc->des2 = cpu_to_le32(lower_32_bits(des2));
 		if (dma_mapping_error(priv->device, des2))
 			return -1;
 		tx_q->tx_skbuff_dma[entry].buf = des2;
 		tx_q->tx_skbuff_dma[entry].len = nopaged_len;
 		tx_q->tx_skbuff_dma[entry].is_jumbo = true;
-		desc->des3 = cpu_to_le32(des2 + BUF_SIZE_4KiB);
+		desc->des3 = cpu_to_le32(lower_32_bits(des2) + BUF_SIZE_4KiB);
 		stmmac_prepare_tx_desc(priv, desc, 1, nopaged_len, csum,
 				STMMAC_RING_MODE, 0, !skb_is_nonlinear(skb),
 				skb->len);
-- 
2.53.0


