Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB93C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2lFo4rU0Ba7jvad7tnnVpuQHRU3WRtEnqr17/6RqbY=; b=jWiAtNCWFAw6ztpZrARMdI7jH0
	gxR/fOrsVZnB61xTZl9d43eioUjCU68Ph2VmuuEDmohzuT68vyZdiI0DCqWwmuAV8nxuYdbzRgSvl
	HUidl6bkKEHKQdUtkdMyQl63uM1cHVx9zHz6sobZ1dUMCXiopWAFmoBco4CTebxCZk0qo7BKH7J8K
	q9qS/Ien5S3GfUy+7E/6JY3Vx9i6+8u+8K+ju56ouOAvtanTK8HDqLDff08mDnVnVYv2nTjTvDjEL
	gcKyMNGe2uflxqdcC6iWnoeiA+Nw8mIRBYgYyQUnNk2cbqTsKuFEOtdX9/e94+eadO8yyUVle8T10
	8XfBiW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkf8-000000060My-2XhU;
	Sat, 10 May 2025 13:54:46 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkZ5-00000005zm0-3nmR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 13:48:35 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso495793a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746884911; x=1747489711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2lFo4rU0Ba7jvad7tnnVpuQHRU3WRtEnqr17/6RqbY=;
        b=GHeBj84Q3xiEW3gy8G20qDAulFn7VrCptFsjmfdxH0ryGjq5Fb8cY+JE8LCfqmlRVT
         q39guRMRr56uq/qkr6tctkBqWMIzGUmPTCOgurbjQ7pJCl4xtw1B1c3IX5d6qXrMqPc0
         QbogQr+fH2QL6deoZaQggaGd3RaDAuDXf8nPaXTWW/Xc20U/aWOfbhAMG6+PN0Pru39a
         kVHfUsbcs6h4Ul7H9Ap1f/0RHFxbdqCKOEP6j0Hj1BkWq9GMqY+HOFMtGM8CE1/N/oDl
         xQMaTsyiFZgNy73Pz1kuoduIcWiQTUZyf3zERvI9CCdDLRzMr4t+siN3464Wo6w9Gwkn
         G1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746884911; x=1747489711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2lFo4rU0Ba7jvad7tnnVpuQHRU3WRtEnqr17/6RqbY=;
        b=GJSzvlw6Z7Ccwk0TVvsE1JEKIDi+1ggD6OtgWEh4UjJnWciCM8xj0GHQz5IAV9ULkJ
         wMQoN0Z2i0I5kyFaxXqHIHtVMwyoRY0KDaz9iV3lFgur8+VzaUbX1ESND4N0uV3ax1rd
         JmyvFQZEiNhBQsS2cNRY2J50PGgtL49SpG/d3FAOS34O57ml04BZVd9/nGyjXW20UTV0
         Dd3jBk9juvqNVKY9R1OuKB3MmgBiuOYXtr7nHXmW3kOSzaUssOJggUMuDHuayLMONhIm
         OUEtJdY2k/MRb2XvTNCgFPyPDwSlQFKS2KZZV6QcwCZ8xWLg0bqemKSsIDTL8P2WZWm+
         XckA==
X-Gm-Message-State: AOJu0YwHWXRZOXRjR0DV9COsAjwIRddvhGRf0KKnHBM/h0LDLt2OSYrI
	YuVAUdCFAiFnmixqEBwGeCtxk4yrA4juydSp7/Iwb7YToZVGNSoF
X-Gm-Gg: ASbGnctRibld4qcPUt1xL3TOYuruaXMH2JYusLsJIUNJGYcgJhuXiN8iyItRSLyMpPI
	VNuzwMG/9LbMZIaZMAJmxNG6kBTNR9xgbi1AP4e45Q9G06c2j1PV7fnnakCBzjBfYwBbU9zMibX
	MINgYXjT4qnJZ2ZuF6SMncpecg2vPpTbVrOIq9uOfnp/pRQ0TW4DqperA+q9TjI3t4q14nYM1/t
	HAJWdOrJ708UlvUY3UX7wDLhqyRRKAaB+sdwRaaQy4Lk+Fi+FqM6RtLX5RePGK3aRhTl2bAAsqR
	gvfyEZVJcq7Fh23TdxPcLdF88f9Qn1WqFlWRhnPEpwtkXKChc0V3u238u9jg0YiIRrQ9TBJQ4NR
	Rg1DnVi+1lLRvgQ==
X-Google-Smtp-Source: AGHT+IEMbAmm46fLf2DuEv+Kvl0O13z6zOYqVX5wWUuEzOYPM3fBcXq+0jclt4XxJpuuYSO1ZkOrxQ==
X-Received: by 2002:a05:6a21:1788:b0:1f5:8655:3287 with SMTP id adf61e73a8af0-215abd23189mr11179733637.40.1746884911027;
        Sat, 10 May 2025 06:48:31 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([114.253.36.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773939fsm3360424b3a.62.2025.05.10.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 06:48:30 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: tariqt@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemdebruijn.kernel@gmail.com,
	irusskikh@marvell.com,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v2 2/3] net: cxgb4: generate software timestamp just before the doorbell
Date: Sat, 10 May 2025 21:48:11 +0800
Message-Id: <20250510134812.48199-3-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250510134812.48199-1-kerneljasonxing@gmail.com>
References: <20250510134812.48199-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_064831_945548_F329F7FB 
X-CRM114-Status: GOOD (  12.32  )
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

Make sure the call of skb_tx_timestamp is as close as possible to the
doorbell.

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/chelsio/cxgb4/sge.c                     | 5 +++--
 .../net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index f991a28a71c3..f2d533acb056 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -1533,7 +1533,6 @@ static netdev_tx_t cxgb4_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	} else {
 		q = &adap->sge.ethtxq[qidx + pi->first_qset];
 	}
-	skb_tx_timestamp(skb);
 
 	reclaim_completed_tx(adap, &q->q, -1, true);
 	cntrl = TXPKT_L4CSUM_DIS_F | TXPKT_IPCSUM_DIS_F;
@@ -1706,6 +1705,8 @@ static netdev_tx_t cxgb4_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	cpl->len = htons(skb->len);
 	cpl->ctrl1 = cpu_to_be64(cntrl);
 
+	skb_tx_timestamp(skb);
+
 	if (immediate) {
 		cxgb4_inline_tx_skb(skb, &q->q, sgl);
 		dev_consume_skb_any(skb);
@@ -2268,7 +2269,6 @@ static int ethofld_hard_xmit(struct net_device *dev,
 
 	d = &eosw_txq->desc[eosw_txq->last_pidx];
 	skb = d->skb;
-	skb_tx_timestamp(skb);
 
 	wr = (struct fw_eth_tx_eo_wr *)&eohw_txq->q.desc[eohw_txq->q.pidx];
 	if (unlikely(eosw_txq->state != CXGB4_EO_STATE_ACTIVE &&
@@ -2373,6 +2373,7 @@ static int ethofld_hard_xmit(struct net_device *dev,
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


