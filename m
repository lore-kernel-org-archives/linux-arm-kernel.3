Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEEFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1u3Ux0aEuDRPRfhGSL7KiSmBbe98RsbxmilJJ1kRyE=; b=m3NrMlzZbpjnXp9/X9i2nmCDgu
	C+bsD52mNVNOAp6gN5kUVoiNowxvhQTp4NDZhSjst2tYud0XDVCr6PbbSi6cllzIVuyvXC2EL+d5i
	j5cPsP7gujvQ41ENFtQdSQV9or7IUZ8kopOf8Dx9tPkuKwc4zLpEUJxMEeE8rQmC0A011kX3doLsI
	4ykanOBd0/p4ggqfKR8rq/vPVFRmq0PBMEPyxDQ1tdurgSUSYZ/KVeG8QPIrNQzRcgKzr35dzqB2R
	KkuNFleeL9cLNpjnwzgv1UgyQ/tLkLP1Fd/3JwFlDldq898XbmTjUa3BdGOrFi5FkY2U4PqmFdb9p
	n0oVnthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs6x-0000000HEbJ-27ow;
	Thu, 08 May 2025 03:39:51 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs1D-0000000HDy8-411J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:33:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22fa414c497so3175005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 20:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746675235; x=1747280035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1u3Ux0aEuDRPRfhGSL7KiSmBbe98RsbxmilJJ1kRyE=;
        b=lyG85I1rsHZhRl9aoxPKjLk1MleH1LhZ3BVe4VnO2CvGZmygiYrs/puDyWyemWbrJ3
         rt+/nDEAKTDXfPiRo5HkjGBt+SeREI1pks7f1n4dadMPhCeDk6Qfkiw71gXvQU2XwO1l
         9qBG/blDZwnNZOw0aTHIJNymjNh6y3zxg7IBK9xWbuDQosSfuUOK+ZqxN0kJ4fdxwJM8
         FRxFo832diTrJ54AzPiUTzL4sCXRySIgUpBf7HxPvK024ZOPN+pwKK5tQeETqMcjKeZD
         Dx7jk/XkIwU43RRjdYojPqpYTDCvTLqwQ2kNzGksD9+Kcdjbj8GPCIBn/CEHzSfvzqNA
         JBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746675235; x=1747280035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1u3Ux0aEuDRPRfhGSL7KiSmBbe98RsbxmilJJ1kRyE=;
        b=DRKfdVddvQoYbLNf+b1PMascBqhv16Scp/XzeJ8TiCmXWFJbVA+R7QgueZCt5TnKvM
         oPjmI/TXDv4IHt7at1px6Cu12TOiqks0Rpn33vflWq2se6jH2HDx/c/H/sikSntN6/5V
         VGe29pEdiNP/DcacTbgiiZevfaaAomShNMXCvYMjF3+EUuSYch4NtYnOgMoRxG7svq90
         JvXiWvp7Mo4tEo6NVbESPqTwmo6LckfpwI+L93/airUIeQuJf9BKBXQVLmn95pT/8cFQ
         x/sPMYYbPHFsf0CQJDEddfVhDlEYaB9S415kaykzyLjtVx8J9o95q0oSkfjd2LMyAYaG
         6C+w==
X-Forwarded-Encrypted: i=1; AJvYcCVtCX60dYDGtuYK3YTqB6a+FxK9t4cI8BfMvQJcjp2QB01AnYXMFKhKMLY4M69MCF9Mof+bSP4jcWLXRNNnGDkv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu1UH4NOKJ9qwbtrkn2MEVtgNufga0Nu5mZesSTNPvFfBs1bqZ
	ZBUi6M8Gwo1X1NI3MABbWt80bipEfCBfcepeiy8GGyAOjZXHwMRw
X-Gm-Gg: ASbGncvzQQ1qyE1R7kzKxr26Zcwk88UOHV0cRX+tfYv0nHrsDdncdFuBYYqR6ZNg50l
	6QF5yBh43Q+IP/uTfFb2h0/6FLjM4B3Y3ScrMfLAydbDmUvakos74WSCUmo+IHdwYAn/k4j2dp5
	nsiPxd7lyb+M4x2RjfFZIBe5Fufm85jXzMh2C4nCqnf9EREzH7bnazueMYr38jVKcQbh4rjcWw5
	zGcDPPQR0yBSTsBn1GrLJ8MJLfFb915JDWqN4jtcUVz9mmwapg15VeeX/P+W9wldmrn+7zLMuZu
	BfxIwPMKRj2dWxhLESwEJDDxsQYYs96yjg4wGC046kHDf+CgYVY0tLlrlhUUeQKyplpHZ7Is3qz
	Dt9TNdJe73io4
X-Google-Smtp-Source: AGHT+IFm+mP1uGj09z6Vf18f5gYApeZ0IE75maU9iP8Ml38OuYBrOos4wiBaafguyI66pVfIF9OMTQ==
X-Received: by 2002:a17:902:c94c:b0:224:de2:7fd6 with SMTP id d9443c01a7336-22e5ecc39demr85915235ad.25.1746675235094;
        Wed, 07 May 2025 20:33:55 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 20:33:54 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com,
	andrew+netdev@lunn.ch,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sgoutham@marvell.com,
	willemb@google.com
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v1 2/4] net: cxgb4: generate software timestamp just before the doorbell
Date: Thu,  8 May 2025 11:33:26 +0800
Message-Id: <20250508033328.12507-3-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_203355_993118_6E036531 
X-CRM114-Status: GOOD (  11.44  )
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

From: Jason Xing <kernelxing@tencent.com>

Make sure the call of skb_tx_timestamp as close to the doorbell.

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/chelsio/cxgb4/sge.c                     | 5 ++---
 .../net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index f991a28a71c3..ee5075b252fd 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -1533,7 +1533,6 @@ static netdev_tx_t cxgb4_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	} else {
 		q = &adap->sge.ethtxq[qidx + pi->first_qset];
 	}
-	skb_tx_timestamp(skb);
 
 	reclaim_completed_tx(adap, &q->q, -1, true);
 	cntrl = TXPKT_L4CSUM_DIS_F | TXPKT_IPCSUM_DIS_F;
@@ -1717,7 +1716,7 @@ static netdev_tx_t cxgb4_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	txq_advance(&q->q, ndesc);
-
+	skb_tx_timestamp(skb);
 	cxgb4_ring_tx_db(adap, &q->q, ndesc);
 	return NETDEV_TX_OK;
 
@@ -2268,7 +2267,6 @@ static int ethofld_hard_xmit(struct net_device *dev,
 
 	d = &eosw_txq->desc[eosw_txq->last_pidx];
 	skb = d->skb;
-	skb_tx_timestamp(skb);
 
 	wr = (struct fw_eth_tx_eo_wr *)&eohw_txq->q.desc[eohw_txq->q.pidx];
 	if (unlikely(eosw_txq->state != CXGB4_EO_STATE_ACTIVE &&
@@ -2373,6 +2371,7 @@ static int ethofld_hard_xmit(struct net_device *dev,
 		eohw_txq->vlan_ins++;
 
 	txq_advance(&eohw_txq->q, ndesc);
+	skb_tx_timestamp(skb);
 	cxgb4_ring_tx_db(adap, &eohw_txq->q, ndesc);
 	eosw_txq_advance_index(&eosw_txq->last_pidx, 1, eosw_txq->ndesc);
 
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
index e8e460a92e0e..4e2096e49684 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
@@ -1640,6 +1640,7 @@ static int chcr_ktls_tunnel_pkt(struct chcr_ktls_info *tx_info,
 	cxgb4_write_sgl(skb, &q->q, pos, end, 0, sgl_sdesc->addr);
 	sgl_sdesc->skb = skb;
 	chcr_txq_advance(&q->q, ndesc);
+	skb_tx_timestamp(skb);
 	cxgb4_ring_tx_db(tx_info->adap, &q->q, ndesc);
 	return 0;
 }
@@ -1903,7 +1904,6 @@ static int chcr_ktls_sw_fallback(struct sk_buff *skb,
 	th = tcp_hdr(nskb);
 	skb_offset = skb_tcp_all_headers(nskb);
 	data_len = nskb->len - skb_offset;
-	skb_tx_timestamp(nskb);
 
 	if (chcr_ktls_tunnel_pkt(tx_info, nskb, q))
 		goto out;
-- 
2.43.5


