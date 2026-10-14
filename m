Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39418CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcCs3sohxCHYV561RCxP42Zr6CFjBiLneuemdbNXbEY=; b=yAcrPgFXnacsJnXFZf7k+SINYU
	BAVX2irQbmZ22I5VEG4xAq5ijt6S3++/zHOSp/BVpDNZ47e6bCyfRmnp5oUbSKGkPFLe8CMuBa5IX
	4xaQ6FBl4CM455U70ZB/VOIXa7/VHkBp+x8Nbba+4qaqp7yHUsuLtBWl2+NtN+RgDkSzI5QZVLQJm
	AJugpzf0aBvD2ZDZCaD5Go/iDYTPjCG80LnQLpfoj7FcM64FlRhnpm42PXa8L9FfbbjZ+WLmZ8sXD
	nrQTNHApFtN4vLN65Dcb2KCXv6KYPDTpu8zbvutFLygtO5t75Jyjj+RCPY9t/HhqI/yU74Pyfz4hW
	aED2JSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSR-0000000EbUg-2BbZ;
	Wed, 14 Oct 2026 06:27:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSN-0000000EbSh-1lek
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:27:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso31429f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959237; x=1792564037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FcCs3sohxCHYV561RCxP42Zr6CFjBiLneuemdbNXbEY=;
        b=KNdmWQUy5wVRSoVW8OklmPhbStiYdMCj46YVqhKxGQRHcVRd+ACvCemLSd6qzhHmGA
         oL6J9AClHQXcSB44KX1Yq81myu9Y1/XAUve2VMF80cxS6npmfhMWj/j6Lqk9/FnHVtnl
         pXI91jRFRMMLyye/iLOJ8GQiZjD4ZDwn1GQdyiAUqMl6gpTyxUNfklldsohAcZR8JHLm
         gMbUIoP96eFlEf9k2U8a/iOwl3lupHQ/WwDK7uAJhZWocITbcmx6QTx2FvVVCWvoYGKK
         OQVKZcXVX3EH8wUywXaCPcVbmr5lGojxmXBiNesRmRjYHdw/LPF1j0DoEAruhTILjIfm
         7SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959237; x=1792564037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FcCs3sohxCHYV561RCxP42Zr6CFjBiLneuemdbNXbEY=;
        b=Hy3RfvX3ER9pk2Ifj3+qGe8LH3zZARB6q5043hyT4D0DknvYDIvbtA9sHRRNUH8RJh
         47ZInxQa1ACchxeZD9Eng+AtYwyYLrLEj/XNR1fAD/BYW2zvpme+8v0zAiUZWIAoBL8d
         dYPBMaFSXMSzJuc20aUJIbdRE4VqPIZ5OZRBKQva9nZ1qbX5CSH10lJDq0InuRP2J2+P
         UW3a0ug4upo59AQ8ju1FY3kSF5TyWTvf3Y9bm9T5SLRv5rkbwYOzG58X+kJiELkNObWC
         /qGT6AhiiMMHr1sfol3hwinNp3tVLq2qQhJzWj3Isk5Lofjplzv3BDGznbCkkKV1CxaH
         WCCA==
X-Forwarded-Encrypted: i=1; AKwUvBxpjJ2WEClyNVeF1peY09TusgpYrSQ1TE+dsjI5zxS/wIuc/XDe1Vhklo+OpeeJp15P7n+uFyEn0+vh1OZZg4vw@lists.infradead.org
X-Gm-Message-State: AFq9FYKYrDqoruiIgnsEm9JzP6AYVgmRFzezZX5Ku7C3ETjjgn0eb4Cb
	ox9uE1xcWXCNkXDRKht7M7WZzNJ/HugmTpYnKGaFxRnMA/FaQXP5Y9iBGkvUCyDe
X-Gm-Gg: AYBFou18+nsK/MXZRjGyGcXuDMi6ZNwT4enru0FRGiIXmW74Rmae9mhuBVaTV+L3LkO
	02hoXHEKDqHAErL9E26sNXKbvmo/8pNYOyepiKn0dv5LRL046idKYkpSMLZ8DqUg6YTaoBDkRHM
	p34zDSut1YwnHNa9M2YuObOYFNNu1Dy5L632GjqEbyCMDkjnmw11uQ47HEPiejbwRyJ1WmqVa76
	zXSQeWoSs4qPSv0p+4bLsbzJ2My0kHTYKsZw5DM+MwHoxq4icKJ6PQBApYaDndENQSry/WCE5xv
	BMmmEt0MHxwkjH4SzvXBuu8Wo9Sj7gx21tNr+VuaP5I9kyj2zDkRiToA21L18BGVvo8xpY9gebK
	HBMnSUyJIBK7ZGCPpVryvw/T+CVHvFrN888D/Sbb0hCeRZRqNPeaKIdGvm1ApCE3Wwct9gVPnH7
	BPqrLklLcAu0FKCVT75zUbD6mmIoDNlw3KPCrOedyzlvuTMNerLfDRWpJV96Y+yy0WVea7BOiRG
	qmQd/itMA4ZzwACnlN8Ikllzb3Z9Ac4uqpQ6R/bLyywhkEXbAFrr0Pt2XiByIkelYA8e7Hx5EPA
	GAigg4OafUmLqgF0x+QU3qIJvwECgIdqFfJpiBkbSZbsaBDAlEx8u9+EZKpgBlPi5y8z36prtcz
	EzQ==
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr307794635e9.6.1791959237236;
        Tue, 13 Oct 2026 23:27:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm528846745e9.4.2026.10.13.23.27.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 23:27:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/3] net: stmmac: handle partially allocated DMA queues
Date: Wed, 14 Oct 2026 08:26:59 +0200
Message-Id: <3537f9a4f3e875291812486982b907b3b02bec15.1791958735.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1791958735.git.kmehltretter@gmail.com>
References: <cover.1791958735.git.kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_232719_500989_A2AC9CE2 
X-CRM114-Status: GOOD (  14.80  )
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

DMA allocation failure unwinds every configured queue, including the
failed queue and queues not yet allocated. The cleanup helpers then
dereference buffer arrays that may not exist.

Only traverse allocated buffer arrays. Clear freed pointers because the
queue structures persist and XDP reconfiguration can reuse them.

Found by inspection. On a BeagleV Ahead (TH1520), fault injection at
the RX buffer metadata and TX DMA metadata allocations reached these
invalid cleanup paths before a test guard stopped them. With this
change, cleanup completed without the guard.

Fixes: 54139cf3bb33 ("net: stmmac: adding multiple buffers for rx")
Fixes: ce736788e8a9 ("net: stmmac: adding multiple buffers for TX")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27..495ff7aef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2144,10 +2144,12 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	void *addr;
 
 	/* Release the DMA RX socket buffers */
-	if (rx_q->xsk_pool)
-		dma_free_rx_xskbufs(priv, dma_conf, queue);
-	else
-		dma_free_rx_skbufs(priv, dma_conf, queue);
+	if (rx_q->buf_pool) {
+		if (rx_q->xsk_pool)
+			dma_free_rx_xskbufs(priv, dma_conf, queue);
+		else
+			dma_free_rx_skbufs(priv, dma_conf, queue);
+	}
 
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
@@ -2161,13 +2163,17 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
 	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
 
 	kfree(rx_q->buf_pool);
+	rx_q->buf_pool = NULL;
 	if (rx_q->page_pool)
 		page_pool_destroy(rx_q->page_pool);
+	rx_q->page_pool = NULL;
 }
 
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2196,7 +2202,8 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	void *addr;
 
 	/* Release the DMA TX socket buffers */
-	dma_free_tx_skbufs(priv, dma_conf, queue);
+	if (tx_q->tx_skbuff_dma && tx_q->tx_skbuff)
+		dma_free_tx_skbufs(priv, dma_conf, queue);
 
 	if (priv->extend_desc) {
 		addr = tx_q->dma_etx;
@@ -2209,9 +2216,14 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	tx_q->dma_etx = NULL;
+	tx_q->dma_entx = NULL;
+	tx_q->dma_tx = NULL;
 
 	kfree(tx_q->tx_skbuff_dma);
+	tx_q->tx_skbuff_dma = NULL;
 	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff = NULL;
 }
 
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
-- 
2.39.5 (Apple Git-154)


