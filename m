Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Drh7nr47RmktzpGSg9HIsYIvZ9oCqisJanN48gX/rgw=; b=pDSfbJLZ5dlPI3RcLLeW3UceH2
	PdOB2JUYdLPMEXqkpEFPWefORaJH+mqA9y9ZH3ylWhIJqxOl7tyC9NIpghe5FrRw7bvqcFtQPEXQL
	wmNcr/BEGFSCf0qEWfwtv9XVnL3B84cH7I7trJpC3FOxtWuUXwpxdFpTFwSoA+WOOq6yTtIJlP3Ne
	Ey0elyYOoVHeL5/7+PMlaqassSRBJIA3ZQlbq2PsPS+cATJq8zNNOFWBDf99bCo71J6jH5jiDdfBa
	TbMt5LWNzz4LHEwRVVMdxigcZIkXVGKws0SKDJcmcYsom8kai3ZaG2QkbOCRTZU7mfSTiSXaxdrWF
	aDsSkQjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDIT-00000002Taf-17y8;
	Wed, 26 Aug 2026 13:04:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDIO-00000002TaJ-1EEw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 13:04:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBlLd3983273
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 13:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Drh7nr47RmktzpGSg9HIsY
	IvZ9oCqisJanN48gX/rgw=; b=eAV1yzk/KY5o5a8IFVz0qzgCHS/F/g7vZchrT/
	Iqix0XOyGTI79TN7XZQ0VbMfzmBuJBMkyRDPBiwebaf59WLjO/WGRIk+M5AqH0/f
	/JHrhvxTqplpdr2rTJjCxvFFcFl8boRZoKXQ4rQSWbkHYHj/pZINL7r/3UVwNlqv
	t5P6ajrosXgz9WZOYS9H5Q7p4AMqUMv8OFYZ4/+LB1cg/H578OjZdQOac1UJsRNC
	1YstFrJFEIyUwDs0dk6bv/ayioiFiANI4FRTTJx9MKlciioKKIQ5UQLIKAjS8Zf8
	blHN4uhHJ7jObDpCfK79rzxHhX27zMa/0B98CZoDjmFQ7IjA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqrsqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 13:03:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97ca6578487so718095241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749438; x=1788354238; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Drh7nr47RmktzpGSg9HIsYIvZ9oCqisJanN48gX/rgw=;
        b=VMYCuP49ld5HJmiGW7DQa3JjvuMbd0nrBcZwXsL2fseG/EI4McLfpiQe17FzyG5SBS
         q+OVIQk36RW6ikcjmoq5UswXMvvMpVzURA1nEPNRfN1FODENM9CgpdR+BitM+6q8PJXR
         a5ERVe7QmzTxUUIVxYI3j3oslLi4la4twvXfeaP6l/foD3YIrCjfK+QHn8Y84C0QATjc
         GEWJnkvgooOjSfqEKE8cIAhx7cKXrJNE1/47zCECU08QWzy0UQwzamcVkYZdPL7+E+iw
         KYB/qkqmczWwUauy8dP2hFE+AURxDuT238/D/PscFUhq2OA/fwEU3p424xJ9qnvswQe7
         3fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749438; x=1788354238;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Drh7nr47RmktzpGSg9HIsYIvZ9oCqisJanN48gX/rgw=;
        b=TkfeSC1WxnldiLBqCohiOm5RFqRbIVz/LXQ++vxRn+8mlrk5qLA+0wzhwfRvCGghD+
         S2flnm+jyjPq1o13BdzMT9AV0x429F1n+Gz4jbuuwkGTZuM1mTLnR2naq2j05xcbY3I6
         yrAc+ek//h4JTd+EtJZujo38YgtNjwVQQymhFojj0C4stsIf7eJNiSi4FIsIWDMLkkRZ
         4XVEhmakSywtwVoKXtpyHWATNPZ45H+9YfosxR4WGV8Aq2UOOH01ymCUIihFbCzAbl2X
         FKmAd5/z2EWSepmpp77Z7x3oq2NIMTCCpmiGLHH7kuQyTCAZqq8bnPDE+aaGb8pAp49b
         nIVA==
X-Forwarded-Encrypted: i=1; AHgh+RrkYjki2NA1YbcAAmjq0Qfdps6QsSNF+KSsO6IbDbNsq+S7fHYV59vj8ZBDZmUb65mY7nnXVdpf9R07qaRH0mXO@lists.infradead.org
X-Gm-Message-State: AFuF++lHCD2z2r3JhXZjbuzV34UFg9wk4xEKRjk5k8yBo4nEoMc4il1K
	0Kfj8cf7kssjppD0uWdMxfV5oDpxw9oPE9AKLCi8dBMnWAqNoiH076P835Uj1S+uT+pQnKXcEIZ
	wBXtt8v8VfW/RPaTh7p91ZSbS2rqowShcQzEES7vcaFc9TbSJCsjlXwWvyk33WOlyYrmsOZ9jiw
	+oAY/N9Hy8Pg==
X-Gm-Gg: AR+sD12qlh//eOXVDizDGtNaoMKkdrWpm4+/wasxc/VBpo35810JAJYDPvc33p5Go1k
	yI/wGDgJKBLA4w2E2RbhMMkEnAwbaSDcbZfXgpsJeBXasyQ9n2O5VObZTVwYMfyuKZx5q+FHBAv
	V1yNluROFdauWCIXVbXyzc09WhNObzptC8Y27lgGs03JcVgu5yzQCXxu/YXtd+tRh1YEvT7q1hs
	xy0PCu9em/+m+61jAw/tzXVzFPs9qCxKaCPrEtb8tNRJHstWkpE15O2f3xBLnVZ3gB91LSfjNTj
	LzepIZtOcv/yCa0F/GAyp3TrqdjxSx6uiiVcCc76adLOwNewio8KIoFBL4xfRzrumrzKvQ4F+az
	DJolJiqrYe5EQDw==
X-Received: by 2002:a05:6102:549e:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-782bf9bed0dmr2002243137.2.1787749438303;
        Wed, 26 Aug 2026 06:03:58 -0700 (PDT)
X-Received: by 2002:a05:6102:549e:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-782bf9bed0dmr2002205137.2.1787749437769;
        Wed, 26 Aug 2026 06:03:57 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250bbc5c02sm381231366b.61.2026.08.26.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:03:56 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:03:15 +0200
Subject: [PATCH net] net: stmmac: fix dma mapping leak in stmmac_tso_xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-stmmac_dma_unmap_tso-v1-1-a2753d1576ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrDIBBA0auEWVcwBqz0KqXIVCfJLDTBMaEgu
 Xuky7f4v4FQYRJ4DQ0KnSy85Y7xMUBYMS+kOHaD0cZqZ6ySmhIGHxP6IyfcfZVNTdGFGZ9jsF8
 LPd0Lzfz7b9+QqcLnum5HTg4TawAAAA==
X-Change-ID: 20260826-stmmac_dma_unmap_tso-3d8cfa71c6b6
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Hariprasad Kelam <hkelam@marvell.com>, Furong Xu <0x1207@gmail.com>,
        Simon Horman <horms@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX+yeVAXWwNqDU
 ml1x9u5kL3KGrnkGL+k8Eayb1m409nkjrhVde4aL0+33Pb2GJVrQs41nmBOBK7IRVZhshkWRGha
 DhUzKn3G2jOcWJbmdpPSlSxYYUVvTaM=
X-Proofpoint-ORIG-GUID: i1fLjfhRxpYSQSfOX74rw5HMYwwu1yXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX6pr/DBjxxABw
 FXHWZUPtett5JKsyApEWMk9KYf3/ot9w6bdShDJPCfu70NM7HjWJQhEE0zGCqUqDi+CeYCsbh7q
 +wEj6YatA8RlGHujuqXhYziu3yMFucmTcOhS5wdqdNvieE+j8pz0Osok2Yvwz71w09tQggEx8aT
 9EdYXg4X2hjS9a/Lm3JFBlyDVclcfn7iGqd63G5vmlqnhSRzMsQnxsTRTt0CwTuBqnjPT0tE/2N
 VZjqJPTeDMoLitX8XMzes79Bm+NJql64xFUJsHPL5iC1QR+t/TINTgTlvXCr64SoCsgYV3Cu+kI
 Ft/BUDNXBR3i88rg79aM4ditdbUSnYGrFOq0qAxpCHqMJispEOnTUAmDYl/Fm4wA8dMzk1PwExu
 mKfBGDr4QpjNAoroj6SuCfsxSkgQwr24koovSryPueAE6JeR/G1Ptb2H9DZIdilRgoEF6iAH0Yl
 +jA6nC736Asa5Yi13uw==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ee43f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gCaaR3UEgWr7BH7gueUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: i1fLjfhRxpYSQSfOX74rw5HMYwwu1yXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_060401_253117_6468CBD4 
X-CRM114-Status: GOOD (  20.38  )
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

In stmmac_tso_xmit(), if the DMA mapping of an skb fragment fails, the
frame is dropped but the DMA mappings already created for the linear
part and for the fragments mapped before the failure are never
unmapped, leaking DMA mappings.

Fix the leak by walking back over the descriptors used by the frame and
releasing each of them with stmmac_free_tx_buffer(). Moreover, release
the descriptors with stmmac_release_tx_desc() unmapping the DMA buffers.

Fixes: f748be531d70 ("stmmac: support new GMAC4")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 53 +++++++++++++++--------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index efa35cfecc4f..64d9356b6226 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4319,6 +4319,7 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
 /**
  *  stmmac_tso_allocator - close entry point of the driver
  *  @priv: driver private structure
+ *  @entry: TX queue buffer index
  *  @des: buffer start address
  *  @total_len: total length to fill in descriptors
  *  @last_segment: condition for the last descriptor
@@ -4327,8 +4328,9 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
  *  This function fills descriptor and request new descriptors according to
  *  buffer length to fill
  */
-static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
-				 int total_len, bool last_segment, u32 queue)
+static void stmmac_tso_allocator(struct stmmac_priv *priv, u32 *entry,
+				 dma_addr_t des, int total_len,
+				 bool last_segment, u32 queue)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	struct dma_desc *desc;
@@ -4340,14 +4342,13 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 	while (tmp_len > 0) {
 		dma_addr_t curr_addr;
 
-		tx_q->cur_tx = STMMAC_NEXT_ENTRY(tx_q->cur_tx,
-						priv->dma_conf.dma_tx_size);
-		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
+		*entry = STMMAC_NEXT_ENTRY(*entry, priv->dma_conf.dma_tx_size);
+		WARN_ON(tx_q->tx_skbuff[*entry]);
 
 		if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			desc = &tx_q->dma_entx[tx_q->cur_tx].basic;
+			desc = &tx_q->dma_entx[*entry].basic;
 		else
-			desc = &tx_q->dma_tx[tx_q->cur_tx];
+			desc = &tx_q->dma_tx[*entry];
 
 		curr_addr = des + (total_len - tmp_len);
 		stmmac_set_desc_addr(priv, desc, curr_addr);
@@ -4500,7 +4501,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct dma_desc *desc, *first, *mss_desc = NULL;
 	struct stmmac_priv *priv = netdev_priv(dev);
-	unsigned int first_entry, tx_packets;
+	unsigned int first_entry, entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
 	struct stmmac_tx_queue *tx_q;
 	bool set_ic, is_last_segment;
@@ -4563,22 +4564,24 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	first_entry = tx_q->cur_tx;
-	WARN_ON(tx_q->tx_skbuff[first_entry]);
+	entry = first_entry;
+
+	WARN_ON(tx_q->tx_skbuff[entry]);
 
 	if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		desc = &tx_q->dma_entx[first_entry].basic;
+		desc = &tx_q->dma_entx[entry].basic;
 	else
-		desc = &tx_q->dma_tx[first_entry];
+		desc = &tx_q->dma_tx[entry];
 	first = desc;
 
 	/* first descriptor: fill Headers on Buf1 */
 	des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
 			     DMA_TO_DEVICE);
 	if (dma_mapping_error(priv->device, des))
-		goto dma_map_err;
+		goto error;
 
 	stmmac_set_desc_addr(priv, first, des);
-	stmmac_tso_allocator(priv, des + proto_hdr_len, pay_len,
+	stmmac_tso_allocator(priv, &entry, des + proto_hdr_len, pay_len,
 			     (nfrags == 0), queue);
 
 	/* In case two or more DMA transmit descriptors are allocated for this
@@ -4593,8 +4596,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * this DMA buffer right after the DMA engine completely finishes the
 	 * full buffer transmission.
 	 */
-	stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des, skb_headlen(skb),
-				    false);
+	stmmac_set_tx_skb_dma_entry(tx_q, entry, des, skb_headlen(skb), false);
 
 	/* Prepare fragments */
 	for (i = 0; i < nfrags; i++) {
@@ -4604,14 +4606,15 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 				       skb_frag_size(frag),
 				       DMA_TO_DEVICE);
 		if (dma_mapping_error(priv->device, des))
-			goto dma_map_err;
+			goto error_dma_unmap;
 
-		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
+		stmmac_tso_allocator(priv, &entry, des, skb_frag_size(frag),
 				     (i == nfrags - 1), queue);
 
-		stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des,
+		stmmac_set_tx_skb_dma_entry(tx_q, entry, des,
 					    skb_frag_size(frag), true);
 	}
+	tx_q->cur_tx = entry;
 
 	stmmac_set_tx_dma_last_segment(tx_q, tx_q->cur_tx);
 
@@ -4716,7 +4719,19 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	return NETDEV_TX_OK;
 
-dma_map_err:
+error_dma_unmap:
+	for (;;) {
+		desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
+		stmmac_free_tx_buffer(priv, &priv->dma_conf, queue,
+				      first_entry);
+		if (first_entry == entry)
+			break;
+
+		first_entry = STMMAC_NEXT_ENTRY(first_entry,
+						priv->dma_conf.dma_tx_size);
+	}
+error:
 	dev_err(priv->device, "Tx dma map failed\n");
 	dev_kfree_skb(skb);
 	priv->xstats.tx_dropped++;

---
base-commit: f967455fb2a5a2079b9eb5823e9ccf359174bf9f
change-id: 20260826-stmmac_dma_unmap_tso-3d8cfa71c6b6

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


