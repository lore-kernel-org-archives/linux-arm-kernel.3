Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE1CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4crrq+kperLPKrz6unSPTu6Yz68NeVuDjB50rFifJ1s=; b=zsnB6l6edBTLgmul0OJXybwLxA
	Oa6P43IZFtI2lz7aTPB9YRhKqoKW3ojqQYs90qtnqHj+4AqKmZrUVrN2DHJ1bxO4ZiLjgxZ5ylUwq
	pC6tJqbVvSjK3yZq+xb5f/oBZez7tUznN7Qnp/LS2syloTobDBIvzCbsleZzqfCC2MvHGokXddIZu
	rd/081mszhHnEbtcXe4HwD6iWjZTR+DDJhfQT3ipEjAAV1vaAdZuQK31C0k2F8Lo/yu8vHc2jWN8c
	9U7hE51qEReJzI92wOrGR0GaAu+714Z8KxP++DxkoGkFRLKVQlK4h8pbCf5AJcV8f4SjU7gXSECub
	GR96BVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD3o-00000008MKX-0r5i;
	Thu, 01 Oct 2026 09:26:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD3l-00000008MHz-2H8E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:26:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xh2M1512010
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 09:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4crrq+kperLPKrz6unSPTu6Yz68NeVuDjB50rFifJ1s=; b=Tp2BabzkHq9z9vYo
	q8Z0L7YolKT/pK3m+ytWofLtyiIkzRmbJt6QP19Xskob2jDb3y+zRc84q1q4CTfq
	fJHDnIk8igUspsHxKLzvfaQDzZlpIapSDqEKBNxJW5NTsCQ2JARfevP4M3GBPuFQ
	T3HeHgRHjOg8z7gSFkzY37v5oruQWIOu8EnfDEiEresi/V9i9jQns7Ce1sMBkZpj
	PjRzUn3s3wBvYWoCGXR/ze9VLaMYo7ZhA86o1rh7V95cU6j37dnBnQgpoNBOeH10
	xdbogkVk7AsMv3NAW30Wsxywah1Ivl6RSlUYsKPbtT5nCkYod6WwwlJeXp619mps
	Maz/Og==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188stvea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:26:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5ab5c136so866634585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790846796; x=1791451596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4crrq+kperLPKrz6unSPTu6Yz68NeVuDjB50rFifJ1s=;
        b=AcXBnaPX4uV+pe5Zf8RufrhqmGF5RqRQovdbUwKFEeB/78R1RBLq7rSCVt2YD1pSO0
         xaQzKm24xJCIuYL1FVSKzZBZ1X5+WAkt3Huch4dyd4J9Ef1jcrdJz1kZQ9sJyjyIb9OK
         0FNAtCUKLRiJgiZ/UHAaCga7YsgRpHHRps7YmLipi+1puD867LMLtIka0djXf7t8xiAw
         uQTR8wzSWoU4WGXjseQAnkloaBV/D8M6BTFePAWZ+gOjnNV/FAPxFKM34NEYK7/21vpr
         fpOs6S7/0DNbmGYR/eiwCg5om8wjam35QN+PMpZWBnw9Z+mZUpAlyxVAgTt9HGWjahge
         JCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846796; x=1791451596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4crrq+kperLPKrz6unSPTu6Yz68NeVuDjB50rFifJ1s=;
        b=2tqdyFJVVGAomyHjbQGpG0mzY3tXd9E1tjrFYMhuctICP9Dig297DiqnSUFEtSZUgd
         cQ1Ygk+GSwLibS0rDwKfchj5HRaAOW/TFo61DbX3jfQto8dP1MkgpXBY5Kqi3mcNE8mX
         LX1Z8o8IckyP0dQdbR/guXSB9xX+FvzNNSf6yWwR0xPz1i1mBUf4rAuQsG6J4AFy/Arb
         7loAsQuOsagXdHdCrF4mx1WxFZJxisGkd7HRuonEhXG5iF1eJccy1ZwBMXY50VYLulq3
         tcv3NWE3s4Dh9oBFBAxxP/EsNKwwMUQ5gM6TGP3mHZFqyBn2hqO3g9eq+OlswGJyPON6
         kmLA==
X-Forwarded-Encrypted: i=1; AKwUvByfTq3jhcEgw01JD5Lu7Xtq3kRvrINLaT2IIITpd++ThgruQsS344ulp+AL6H3wXaxOQby19qHqYSs+w4QUOAuW@lists.infradead.org
X-Gm-Message-State: AFuF++nlNr3Wua/D80HjQodwAjkTpVX1k41X3Jq8ZLoahhSd10kpHhIa
	Z7R6tsa8g4VaQBJ2FYJF7qhb4Gn2kNQiyFnMzR7LWFJWl9E0NdLO7tWrZGZlVIa/ctR2O5cbn/p
	DgHc1qKcCWf8nY/M2QHbuGQZ/42JWZV7Ng589Me5prhMchdeWs12zXo5tEdokG3SzowpuAcwKCa
	isTw==
X-Gm-Gg: AYBFou3PePcr3vXznXR8GWCF3Y8E/BkGVreab2xVoEmq79iRSVSs6o2K9AvVtJvamlS
	V9HWwMyI7RktGXOCzWKlwqJCcAs6DznBWoxASbsMDszRTmg1Rc0HQ4KV6PKmUZ6sRSeNofgdWIl
	dqLkXsIb09e52COdF2KF4KMj7XkFaPsmvdPR+EIR3YxAM9yS7V7G64orwleO56Zh2RmKpmq1hWq
	xmObtB2yJ9CC+3mVs9WGQ3Aot32j+PKaLw1ZKBltgeiirzAENBZ6Yabf2GKKyiyk2g/G25IEpST
	PC+rR2SPP5gFxlh40qyq0RDgkR9Ls2bztUlcynMhWVLAScyoTmZniQg0G0roBGN9Ho25kIbUxhG
	QNq59FGH7XkhDaA==
X-Received: by 2002:a05:620a:17aa:b0:93c:73a:3996 with SMTP id af79cd13be357-93ca977a317mr742131585a.57.1790846795760;
        Thu, 01 Oct 2026 02:26:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93c:73a:3996 with SMTP id af79cd13be357-93ca977a317mr742129085a.57.1790846795239;
        Thu, 01 Oct 2026 02:26:35 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f900c23sm34817125e9.1.2026.10.01.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:26:33 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 11:26:13 +0200
Subject: [PATCH net-next v4 2/2] net: stmmac: add XDP multi-buff support
 for TX side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-b4-stmmac-xmit-mb-v4-2-664e0c3eb289@oss.qualcomm.com>
References: <20261001-b4-stmmac-xmit-mb-v4-0-664e0c3eb289@oss.qualcomm.com>
In-Reply-To: <20261001-b4-stmmac-xmit-mb-v4-0-664e0c3eb289@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfXzQW8jGlONf50
 CW26UT+kaeU9qDD4aLBPvfpvV6CRB5xZcbVscFN+Ivg35ZeKH2F9ZLlpULKQI1Kr8rZN+AzCp4p
 /qQPbUJlWy7n6C1XeSyJ1wH7+NGhlX0=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe274c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JYNNWCGdvEbVgmh2GQ0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: teuW-PUKodTFHKj5TnZi7FDfkcY4680D
X-Proofpoint-GUID: teuW-PUKodTFHKj5TnZi7FDfkcY4680D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX725eWpE3ZBoC
 nOkAWuUaE77Q6LlxEHMeh10rxkaEQ/p4QrGkvuqx3KHrE4KUa/9RQHCJ5eF/Lf1U5KLxjmsEP1d
 p529aYe95STkV2mmaA/9UpExHxW9d/7IeCFTqnX8RsBKbJHcEYHLAvdI4G4WpQlX12Z+bhGXKFJ
 BBB0Of33+X88/TR7NCe8sGxnbQ6ZkcLyneFqzeo3zHLJQzdbSbruVNrUh82GXNoK7KW5b3P5Xko
 7TGU9IYIszNw9pVt3Ph3CNg2AgFPD0uQradueJHdSz8Bsb1JA9chFTlcHvPNRu4W5k1mA5C76SG
 pd1EZp4o3Uakk2Zqn7Gr8UKMX2aObQuWIUcgoSjh/GSRFyz12GfogsdZBOxdSAzdikr4a4MEzyg
 oWFexQzG/jjjDg0kLw59G5wC3y+BkbFAh3JDaOdrq1HVJVNrvTHZ4lyi0ZkDrdJVcej3rs6hJSj
 dDNA+uKrYWkFedigrNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_022637_704076_75B570BC 
X-CRM114-Status: GOOD (  21.77  )
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

Extend stmmac_xdp_xmit_xdpf() to transmit XDP frames with fragments
(multi-buff). Each buffer, i.e. the frame head and every frag, is mapped
and programmed into a dedicated TX descriptor.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 122 +++++++++++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   2 +-
 2 files changed, 85 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index df6a329fdb80..508e865f9387 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5249,73 +5249,119 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 				struct xdp_frame *xdpf, bool dma_map)
 {
-	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
+	unsigned int txq_thr = STMMAC_TX_THRESH(priv);
+	unsigned int first_entry = tx_q->cur_tx;
 	unsigned int entry = tx_q->cur_tx;
-	enum stmmac_txbuf_type buf_type;
-	struct dma_desc *tx_desc;
-	dma_addr_t dma_addr;
+	unsigned int num_frames = 1;
+	struct dma_desc *desc;
 	u32 tx_coal;
+	int i = 0;
 
-	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
+	if (unlikely(xdp_frame_has_frags(xdpf)))
+		num_frames += sinfo->nr_frags;
+
+	if (stmmac_tx_avail(priv, queue) < max(num_frames, txq_thr))
 		return STMMAC_XDP_CONSUMED;
 
 	if (priv->est && priv->est->enable &&
 	    priv->est->max_sdu[queue] &&
-	    xdpf->len > priv->est->max_sdu[queue]) {
+	    xdp_get_frame_len(xdpf) > priv->est->max_sdu[queue]) {
 		priv->xstats.max_sdu_txq_drop[queue]++;
 		return STMMAC_XDP_CONSUMED;
 	}
 
-	tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
-	if (dma_map) {
-		dma_addr = dma_map_single(priv->device, xdpf->data,
-					  xdpf->len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
-			return STMMAC_XDP_CONSUMED;
-
-		buf_type = STMMAC_TXBUF_T_XDP_NDO;
-	} else {
-		struct page *page = virt_to_page(xdpf->data);
-
-		dma_addr = page_pool_get_dma_addr(page) + sizeof(*xdpf) +
-			   xdpf->headroom;
-		dma_sync_single_for_device(priv->device, dma_addr,
-					   xdpf->len, DMA_BIDIRECTIONAL);
-
-		buf_type = STMMAC_TXBUF_T_XDP_TX;
-	}
+	while (true) {
+		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
+		int len = frag ? skb_frag_size(frag) : xdpf->len;
+		bool last_frame = i == num_frames - 1;
+		enum stmmac_txbuf_type buf_type;
+		dma_addr_t dma_addr;
 
-	stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, xdpf->len,
-				false);
-	stmmac_set_tx_dma_last_segment(tx_q, entry);
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
+		if (dma_map) {
+			if (frag)
+				dma_addr = skb_frag_dma_map(priv->device,
+							    frag, 0, len,
+							    DMA_TO_DEVICE);
+			else
+				dma_addr = dma_map_single(priv->device,
+							  xdpf->data, len,
+							  DMA_TO_DEVICE);
+			if (dma_mapping_error(priv->device, dma_addr))
+				goto error_dma_unmap;
 
-	tx_q->xdpf[entry] = xdpf;
+			buf_type = STMMAC_TXBUF_T_XDP_NDO;
+		} else {
+			struct page *page;
 
-	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
+			page = frag ? skb_frag_page(frag)
+				    : virt_to_page(xdpf->data);
+			dma_addr = page_pool_get_dma_addr(page);
+			if (frag)
+				dma_addr += skb_frag_off(frag);
+			else
+				dma_addr += sizeof(*xdpf) + xdpf->headroom;
+			dma_sync_single_for_device(priv->device, dma_addr,
+						   len, DMA_BIDIRECTIONAL);
+			buf_type = STMMAC_TXBUF_T_XDP_TX;
+		}
 
-	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       csum, priv->descriptor_mode, true, true,
-			       xdpf->len);
+		stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, len,
+					dma_map && frag);
+		stmmac_set_desc_addr(priv, desc, dma_addr);
+		stmmac_prepare_tx_desc(priv, desc, !i, len, csum,
+				       priv->descriptor_mode, !!i, last_frame,
+				       xdp_get_frame_len(xdpf));
+		tx_q->xdpf[entry] = last_frame ? xdpf : NULL;
+		if (last_frame) {
+			stmmac_set_tx_dma_last_segment(tx_q, entry);
+			break;
+		}
 
-	tx_q->tx_count_frames++;
+		entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
+		i++;
+	}
+	tx_q->tx_count_frames += num_frames;
 
 	tx_coal = READ_ONCE(priv->tx_coal_frames[queue]);
-	if (tx_coal && !(tx_q->tx_count_frames % tx_coal)) {
+	if (tx_coal && (tx_q->tx_count_frames % tx_coal) < num_frames) {
+		struct stmmac_txq_stats *txq_stats;
+
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
+		stmmac_set_tx_ic(priv, desc);
 		tx_q->tx_count_frames = 0;
-		stmmac_set_tx_ic(priv, tx_desc);
+
+		txq_stats = &priv->xstats.txq_stats[queue];
 		u64_stats_update_begin(&txq_stats->q_syncp);
 		u64_stats_inc(&txq_stats->q.tx_set_ic_bit);
 		u64_stats_update_end(&txq_stats->q_syncp);
 	}
 
+	/* Set the OWN bit on the first descriptor now that all descriptors
+	 * for this xdp_frame are populated.
+	 */
+	desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+	dma_wmb();
+	stmmac_set_tx_owner(priv, desc);
+	tx_q->cur_tx = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
 	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
 
-	entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
-	tx_q->cur_tx = entry;
-
 	return STMMAC_XDP_TX;
+
+error_dma_unmap:
+	while (first_entry != entry) {
+		desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
+		stmmac_free_tx_buffer(priv, &priv->dma_conf, queue,
+				      first_entry);
+		first_entry = STMMAC_NEXT_ENTRY(first_entry,
+						priv->dma_conf.dma_tx_size);
+	}
+
+	return STMMAC_XDP_CONSUMED;
 }
 
 static int stmmac_xdp_get_tx_queue(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index d7e4db7224b0..9af9e0cb366c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -135,7 +135,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 		stmmac_xdp_open(dev);
 
 	if (prog)
-		xdp_features_set_redirect_target(dev, false);
+		xdp_features_set_redirect_target(dev, true);
 
 	return 0;
 }

-- 
2.55.0


