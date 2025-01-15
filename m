Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B410C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8jofsVUx8ZDCJ6z8E8sSP3dj56gjS3NJDcAVJdYxeo=; b=oLLR5SLJcLHMGwBe+kqDSQNyq4
	kgPkpjmUOWSwkIGgHGpTUOEwe2zSSroKW63z8vffnRPcJ+NME+6QyIINSd9vVhwngzSkPCRs8a+Gb
	r8w34J2aBp304ZQBz/WKRH8e5mbkv4aWsyjUz+6xVzSLTighgaUcQJkW64+Uu/0Q0zVos+1ScdHZD
	681pzc4UwmJw6h7pGNdY+XPB/gnkoSszYm6sh+hPJk7xhi/639hGGmimksTLymrZbX2Iy8qPIhRUT
	t2iDrf4/MwCwJHbe0Ah/0E8/zZOh/pTfnieb3qamCEr+KIvhA1RZcdcPTqkKsGuzwNpTA08Jx8oPX
	7dSet0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu92-0000000AW1K-2o3d;
	Wed, 15 Jan 2025 03:32:41 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu4D-0000000AVGw-3rbv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 03:27:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21636268e43so146462855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 19:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736911661; x=1737516461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8jofsVUx8ZDCJ6z8E8sSP3dj56gjS3NJDcAVJdYxeo=;
        b=NXZBRpH8nSepMEPcbzKp2iENmxTCM1lq+letP8p6GBE+KVsRBXi27suWbUPruJ0WwV
         j6ALJ9jc6TaCvjGJbANNZYsTYRxz7p9Z3dhlHeyxCIyQ1vZ5qZfnpwstTxjwGp+h9Vah
         94cCD0f2yXgqyEKFSiLxg8Zs3TbV9H6oz9jOZIWq7v56GynJWfNEP0OQdCmRx3u2Hy1N
         iHQXjmf7Ibi39BH3PRnWMuAmiN0iUmpcj50fWwr0Sr7d7w2uM2s5CaDhwC4s/tZVFidd
         BYymJtbnhIeUu2hj0YIM/Q38SoMsZW3gWj6NNDTHhQdxhyaL0HfyZE4ZF8KUik73J05C
         FIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736911661; x=1737516461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8jofsVUx8ZDCJ6z8E8sSP3dj56gjS3NJDcAVJdYxeo=;
        b=GN2QFM1kk7GCUhpotEs/LieUD4a55rY0DLvK7KYnU4hBAmFJqU71XrvxzlTs5MAiU/
         5NCHj/rtB2SY4f/aiiNbKrcu81SxkPiiDnz5lFyKB2gXexg3gCyOcn3+ZtTDTNJVFv4l
         ry/xkX8FwKz5wgGnE0IefaHUrWMBVr0MYE3gnM99ZSdSbX2b7FrjMakfpFmc6nnwGMgp
         YVrxxnD3tWrzXIKgKAfKe9UlEkZtEatd0RPhNchMR1BGy+DYEVbaGowPfwipD8CJj1fo
         6SVhRogw9akf56PpLFElljW5T12JesRvkNr8g6hondwCvaZl60n2Bd3SLhEwGsJCKOQZ
         se0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUruA78vymXYSICBDvgsYoPvt/U11I9q933JXY5geo6R6tLNDq75lDWuZWOP5BprXpCsZrXm7fGb/u633kBCwwz@lists.infradead.org
X-Gm-Message-State: AOJu0YxWxcSs1DA4q+q8Vw6j3Q9OzkLBRLEl8Sh0rJ8j54WhPahveLYv
	nJfJKQzhuFasiZO0a0ho0sEHC/e8ghnpsJKb5UKYP34injk4XuR8
X-Gm-Gg: ASbGncvKgFs306QrDwepHpsjfMun5aNIkvUsVDECNi8DIBGHXTzhEeM2bCGea8NSMne
	yxiDnYbVZqGWs6l17xhJ+8OmG4g019KH2Z3XSGpfUktr3eTUmQ1ice1WhVVihQ2qtb44IoaEXkR
	WnNZZ830MhKrCIb//zrC+Sllq/VE0mHhNbi66vpwQeUpV4wDHx4SelEl1qYdGJtE5uqPimO3xRH
	52P4c6wT9QQLS7p3FEXBIObaOYmntjlgfGughJfkni+keX2gy/KVpM6uGAg0knRVSrx2w==
X-Google-Smtp-Source: AGHT+IH3vKpIs9HEB7OG2AlV/K4DtSeYgzdkPcn7TCEV2c0jCWcevtA7LwBwelnqC2AKojzBKBFAxQ==
X-Received: by 2002:a05:6a00:3c93:b0:72a:8461:d172 with SMTP id d2e1a72fcca58-72d21f4537emr43075844b3a.3.1736911661159;
        Tue, 14 Jan 2025 19:27:41 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:27:40 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v3 3/4] net: stmmac: Optimize cache prefetch in RX path
Date: Wed, 15 Jan 2025 11:27:04 +0800
Message-Id: <2574b35be4a9ccf6c4b1788c854fe8c13951f9d5.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
References: <cover.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192741_955443_4979E7C2 
X-CRM114-Status: GOOD (  11.51  )
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
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 811e2d372abf..ad928e8e21a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5508,10 +5508,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Buffer is good. Go on. */
 
-		prefetch(page_address(buf->page) + buf->page_offset);
-		if (buf->sec_page)
-			prefetch(page_address(buf->sec_page));
-
 		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
 		len += buf1_len;
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
@@ -5533,6 +5529,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
+			prefetch(page_address(buf->page) + buf->page_offset);
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
-- 
2.34.1


