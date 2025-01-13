Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A81C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Y3BfZz7MekY1Z7yjTuQ+MWMRBeT+ElDKi7mbMigxYQ=; b=xw+jX6wM0c8glFY+JVgOlR5GZP
	SqY8WXDq/O6DR9auP/ZC7CueT2BWu5T/dqxh1U6jMu6PmMDu8qJjO+Q1TbakCncmSeQWJK74U2ex1
	las6Q/0iFyLFb/8e9oEsovbFpCQKMD3w330k96GIDQcnPnlM9q905lJpc7ZEKO+j7NUqeFJPa9DSq
	Bh8YlMM2R5SJJ22IhAHhWYUiHvY4m2bMrDnpMN2DLwNKYBg7oOoAzLLjE6uGRfVlbcwPzPYZ6YRVo
	+Wd0KRMr+zkgsTab9QgOrrREFBUs2q16iUqnkefjZfpIpbi0h2E83SUBPo3dBwQndmG0XKBxSU8Lr
	NeZOgkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLO5-00000005Ohj-1KRS;
	Mon, 13 Jan 2025 14:25:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLJT-00000005NrU-2xCH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:21:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2156e078563so64067055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736778067; x=1737382867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y3BfZz7MekY1Z7yjTuQ+MWMRBeT+ElDKi7mbMigxYQ=;
        b=JFuvk12evjJ6ft0KidjxK/ykhOfXlNBFMIqtMlfK0E9k3dHJPcIkwPVAT03FbObAZD
         98Uxf8tdkdoRHbAkP3vWWS4OmnzgozRkAUb4Zw4tTWUtxmBebAwAeHJxY15rOUT3JvfV
         0Pw8Xyuve+j4NKdIZp3OS65q2NF/R0PSEwGqFAxA/tLOBjVJk6GFrXBYOskrc4BH7pHh
         HQYDrPh4sSBIjAg4yBZk7Ihx55I/HCmA90szoO4A/5J7I7CiEvG9ODO9rLR1CQ2F82rl
         2yM1OQwpqSe3nq5bkRa8lTzDEpDysHqGmdHjw9vvtiZeARqPHDz2f2LgoC1Zk/b/QDvT
         Eg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778067; x=1737382867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Y3BfZz7MekY1Z7yjTuQ+MWMRBeT+ElDKi7mbMigxYQ=;
        b=B+sqTnn6/sBuR/sNKcFL83tTKSS3tqbWGuu6u63VAL559n+p/+Tz4qyoAqBEudnbLO
         wIfUdFCbQ44cwF+SRJ0l5EPsH6jFfflQjrCww2/gbhcmMUUcmTMpH0b8+0dtz9/+QXbJ
         jcWLCw//nDXVCQ+jpr2ZM9av1hkPvlBUKyBxqToOrknsQoKLyeqT/VbI7VZJ8KhEH1PZ
         2EmLlIkAMOS82grQYBhg6LnzI3tyBieKko32GmQfh6KvlYarWiwIyWMNhFxIdXC6k8UX
         U6eyzSPw/jawbJ5WD+rKteAlHHbRCnQJ+dbtaYq3U+H/2Sb446ezwID92ELlM4JjCeu3
         joRg==
X-Forwarded-Encrypted: i=1; AJvYcCWZX3ze3iQxSnTWuTwXV1EuJm0OaOUUZBVw0LNmiyfQxPKMNF1rzrVKzLSyZFYXB4iRDiAIXQ08PjOwc2OAZG3G@lists.infradead.org
X-Gm-Message-State: AOJu0YypNjjQHiHdIFPw38JLmXG+MuBP5MIgogeiwXj+qz6/6joGtmME
	LhBPbNlPW5h78KHYPydCLtv2fFZlcrPlp2C1mx2Mc8tuv2HuAgvc
X-Gm-Gg: ASbGncv4fyJsjshu/OsPRZ+YHsnwTyjxc9Izmps9ETQ/S2lVu8h8bF1jbAsg0tcRejL
	2WOPDJShcZBdcCl+Pz8C9w9YyU4hS2N9SHlxW3kSjGxe3Z+F4pAzefuBTkg/zJyVrs/89BGrRhy
	T7lWJ8owCsMid5/eqzNGSP/B398AGyHNDUz9jQNkOuXzByl+E7D+XJjtDTEm/ZW+Gku30i/Xg8K
	0o+L1enSnA5t0w6BSrXPHcWa9l7f4X0aAO2igUDXF+MdSQh9CS2o7Z15nz2DUPwHafh1A==
X-Google-Smtp-Source: AGHT+IFg3sXPhg66pW+bXzniVJ+GWukBtXItLNm4Jyw30Z7qC0CWxK5D402KdXwOTZ+TRgV9PNNiUg==
X-Received: by 2002:a05:6a00:4603:b0:728:e745:23cd with SMTP id d2e1a72fcca58-72d21f113a1mr32141933b3a.3.1736778066667;
        Mon, 13 Jan 2025 06:21:06 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:21:06 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v2 3/3] net: stmmac: Optimize cache prefetch in RX path
Date: Mon, 13 Jan 2025 22:20:31 +0800
Message-Id: <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736777576.git.0x1207@gmail.com>
References: <cover.1736777576.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_062107_744713_736713ED 
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

Current code prefetches cache lines for the received frame first, and
then dma_sync_single_for_cpu() against this frame, this is wrong.
Cache prefetch should be triggered after dma_sync_single_for_cpu().

This patch brings ~2.8% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca340fd8c937..b60f2f27140c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Buffer is good. Go on. */
 
-		prefetch(page_address(buf->page) + buf->page_offset);
-		if (buf->sec_page)
-			prefetch(page_address(buf->sec_page));
-
 		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
 		len += buf1_len;
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
@@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
+			prefetch(page_address(buf->page) + buf->page_offset);
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
-- 
2.34.1


