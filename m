Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94B3C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mqh/nh8e1scV0jQje+BMVthxAKQf7nBklsHsrorkxwU=; b=m0Rs6FTRRGOgReQ+vfTgoBddLf
	azDB43ESl+z5/KR+YXynDK70EZs2ByCvzHfiXoubj5r37ICj4QdTnHpGYhlzbMOo8jl72BvMy3UbQ
	jy4m6r/X8GRuPr3m114HW/yBktUyWmT0Pn77kAkSn/WLT4cyvvZ0EoM0Ub+pAefC0O+jeScQ1lg9s
	K7KVYcB0VuFinoHgxlETYkJ0BHC2C1evNHIG1yzptIfkPqqpEfYKl7DfgkXX6cDW8YN6+lPxCg6fQ
	uHZzEUG7MFRl8Fagx4FJT/SvWd5HbChzeo+JdXAVpuz4jyJZj7ox+ruk8m7QkTRv+sXU7UQXZzraB
	/+GNjXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hBW-00000007mie-1eT2;
	Mon, 07 Sep 2026 21:47:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hBU-00000007miB-3zcO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 21:47:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Kmjuk1771257
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 21:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mqh/nh8e1scV0jQje+BMVt
	hxAKQf7nBklsHsrorkxwU=; b=h/bHmj1utPj8gSxoEjFQUboQGsLVlbU9/WiFov
	O5yu9vB0xQHl4F9/iGeN+rnW2r1yBfkNUvmHuErlAqsiVbBXdPSM5wHJrAbvnuqs
	ufXAeskFGjbLenaU7pYNQO/MegHgAOcV+2d12RkkYJsgISV828HPA6JEuB6RsTFc
	89pRUu+aJKCDUeS9GeAN06DvX+9eKifE1MAXDgVylpmRkjJdxQsFvCt1wmiLbvXt
	BIlrE0F9KuSsySS+nEvf7u/+FgMnagxS5LyehoQtg9K3tEchziLgnrhNbKkWy97T
	BzKQTIMiCun9lZ68QHD2pyK6RfTf5rzbtVQ1VcSQYx2U7wVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyka1fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 21:47:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so628281985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788817631; x=1789422431; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mqh/nh8e1scV0jQje+BMVthxAKQf7nBklsHsrorkxwU=;
        b=OMqMkpC07qwTJu2mbt9OAzDtwzudLvdvQVqhVNg+RD4EdR1obfO03ZzDt79xLiwuaS
         wO1iTiIwhTqAJwGbvgv2jmh8XS84nM5/ucIsAEkT/MRowE+NG5m+WhKZUzFlcVn8814X
         MjMoGs+lfUE9E3K0+fcqgK19Mvv0QylC4O8u8K0CNBXllVXJthc5lZJSIAMJPojA24i7
         TqB1AuGghZAikrdKeVUkN1MxYZrMxNiGdfwpO+3Z6oGtTqhHZaxD/P3fepjzGRj3CZ2e
         aITMICEGTWFHkObNnUszusoTLiisjv+To0Qz9MfNueHQO9EIGKY2H3mQSlhl/MqSZ7n+
         CaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817631; x=1789422431;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mqh/nh8e1scV0jQje+BMVthxAKQf7nBklsHsrorkxwU=;
        b=DW/+Hw8/cxsebKrhupxxXhmGRPYPY4pLQ4LA3qAbVOA18d9SkmaFAmpi/5w/W/LB7b
         ihwnD6dEy3797qKg9+qThVlKk/SQ0UqpMsPC6rhG3laY76Qhyc/eX6gCIa1ipaF3vT3u
         V+NWYNpHcHPaYArpOcJYEkqOr1cmTTZ79NZ0tX279WiobEcOc+aZ+Jr+uoPcYWl8AZN8
         qn5C1u475gRvCw3cWT6G9siP2NdeQoIbH4TPbSfhmv8Ba9tkiseAcHZTKJizcS58QUFj
         d6c2D7hPSnI8hurV2PyIesy48X0rIE2oGK9v2EJPmVHMBw2ZGCyEiNOz6+poS4Z/PNmR
         JABQ==
X-Forwarded-Encrypted: i=1; AKwUvBxerHfmG72Bn8uUQnqruLHbIAmzn0kDxmORlQBhJgwts8tvixeLfPwDo0zjF8s+wk7S/9NOUZ7UoMRvIYJkLVJV@lists.infradead.org
X-Gm-Message-State: AFuF++kzcdyyAhXO5fWU3ljAaaeqs1XIwxFDWquSv3nrzVYViVhuaxwR
	TOiiWH9velQk0F16ANDX4aZDCHURVhZpYxB89kQItoUXqneZxR8yjVbRvvHAjyphrI7mcTQcsDM
	qCQbeyJmoZgGDUyu920331SVRcW0Uov7pJ8DwnBL/sI7RmhxxB7ZHZANNYDoY2X0Q4BxxzIeH7M
	f2tw==
X-Gm-Gg: AYBFou03m2FBQLhcCWEBfdGCQuQxgzg8ZMpfaXdPWjAV9qYLTOPK9p8nrAxT9yFUAij
	uuI8OqSCpe/tin/fM2Np/gScz9vc0/0gmBKlb4daJLs3SPRvn4y3TfS9XMZAMEePr9tR06aXe9Z
	SxZ08ACx36N2vdjmYSTTooElkjGwRtBCrHL9P8s7EcFBvqawmn6fzfoxnmXSIJTdYDFdPnRHe3b
	dKqylCWAeGptL4CpD3rTi9iRFlNc2ng0KpBcBB32ZEtunp+yS7DO0YHZo6WLDAfzDyOcSP9mqpi
	Wae+0zYNNSX4mmYa1F7oyVnPom0zBEaEo+7HYA/Oh5hva32xTVhexQs+dJJ35mjP6BJRPZM+p7A
	x1v3FQkVPiuQ6uQ==
X-Received: by 2002:a05:620a:262a:b0:939:72cb:bae5 with SMTP id af79cd13be357-93972cbbc7emr2320806085a.28.1788817631303;
        Mon, 07 Sep 2026 14:47:11 -0700 (PDT)
X-Received: by 2002:a05:620a:262a:b0:939:72cb:bae5 with SMTP id af79cd13be357-93972cbbc7emr2320801185a.28.1788817630821;
        Mon, 07 Sep 2026 14:47:10 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm461640535e9.5.2026.09.07.14.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:47:10 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:46:45 +0200
Subject: [PATCH net] net: stmmac: fix TX descriptor availability check for
 TSO traffic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-stmmac-fix-tso-nfrags-check-v1-1-328459906cdb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gZqwRn0KuIiZlINYpWmiCDe3
 TLLB59/g0lSMeirG5KcarrHgqaugBeKs6D+isE7/3Gd+6LlbSPGoBdm2zGGRLMhL8Ir+kY4kCd
 27QTlcCQp3f8+QJQM4/O88YD2zXIAAAA=
X-Change-ID: 20260907-stmmac-fix-tso-nfrags-check-21ecfa2ac05b
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDI0MCBTYWx0ZWRfX4G9I2AHTZikp
 Lk8FUeqFGYNNFDL1Vj2sH/SZBzDtlPf0s/jTGOrs8DCnfpx3n0L2MEvyhRa9fn0pjAd+ZZvBrkS
 BDmjkLvYD/I76ocSpRxObXxGgMHrfyU=
X-Proofpoint-GUID: CdQn_Nq6nkgWHfgr0zaFLn31UPnQea2-
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9f30e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qG1sbvjNePByhSKIw2QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CdQn_Nq6nkgWHfgr0zaFLn31UPnQea2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDI0MCBTYWx0ZWRfX5ch1dbDbsoVI
 rGJ6Nl6r9h6Eab/Y0aysi5xTIj53XCbNhXjL8NHIbPcWeBRmZUmJ8wyVOauCTEkDYEwul+iM9SB
 22ipDEMkt2iUPYtFh7nH15wvnSPa0ErhI3DUzowm8KDfZtEPSj3YOsdE7kOaeXOUSjb/iLZmyCP
 WFGFL1vfYpYaDB5X7bXv5tnYKoMjCF3//SNXIdBL8VFRipxdgpSYZN32ii28gM8PFOkjnrCJ+y/
 5f2qR3Thyw7/XF+dJV7m6NdEcVdyb09UtlL6TZ6hAVyCe7EQj9fhVgvN95bmmJ6k9GZwacXJbTQ
 FYo//HG/A2d1JrirD6XFoMmdGp4rSIUTubDmtxvnC7WMkg/qoRAKq2rmRxLuRfTfWqg+sYIwCl+
 IMkw5xrJBGLwfEon2M4DcjoAVhCSlxUNkLhTknCC0LA0iF4zoSWaDzH8k0O9rRW3JTk0f0Mrlo/
 N7xxC8zMRiBcxnDP1pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_06,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_144725_018769_308823D7 
X-CRM114-Status: GOOD (  22.47  )
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

stmmac_tso_xmit() estimates the number of free TX descriptors required by
a TSO skb as:

	(skb->len - proto_hdr_len) / TSO_MAX_BUFF_SIZE + 1

which assumes the payload is split into TSO_MAX_BUFF_SIZE chunks. This
underestimates the descriptors actually consumed by stmmac_tso_allocator(),
since each fragment is mapped individually and so it needs at least one
descriptor regardless of its size. Moreover, one descriptor is used for
the L2/L3/L4 headers and, when the MSS changes, one more is consumed for
the MSS context descriptor.
For a highly fragmented TSO skb the check can therefore pass even when the
ring has too few free slots. stmmac_tso_allocator() then writes past the
available descriptors, overwriting descriptors still owned by the DMA
engine, corrupting the TX ring.
Add stmmac_tso_get_num_desc() to compute the exact number of descriptors
needed for the header, the linear payload and each fragment, plus the MSS
context descriptor when required, and use it in the availability check.

Fixes: f748be531d70 ("stmmac: support new GMAC4")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 31 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24656b35350b..3566b33bc34e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4454,6 +4454,26 @@ static bool stmmac_tso_valid_packet(struct sk_buff *skb)
 	       header_len + gso_size < 16383;
 }
 
+static int stmmac_tso_get_num_desc(struct stmmac_tx_queue *tx_q,
+				   struct sk_buff *skb, u32 pay_len)
+{
+	int i, ndesc = 1;
+
+	/* head payload */
+	ndesc += DIV_ROUND_UP(pay_len, TSO_MAX_BUFF_SIZE);
+	/* frag payload */
+	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
+		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+
+		ndesc += DIV_ROUND_UP(skb_frag_size(frag),
+				      TSO_MAX_BUFF_SIZE);
+	}
+	/* MSS update requires a new descriptor */
+	ndesc += !!(skb_shinfo(skb)->gso_size != tx_q->mss);
+
+	return ndesc;
+}
+
 /**
  *  stmmac_tso_xmit - Tx entry point of the driver for oversized frames (TSO)
  *  @skb : the socket buffer
@@ -4497,10 +4517,10 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	unsigned int first_entry, entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
+	int i, first_tx, nfrags, ndesc;
 	struct stmmac_tx_queue *tx_q;
 	bool set_ic, is_last_segment;
 	u32 pay_len, mss, queue;
-	int i, first_tx, nfrags;
 	u8 proto_hdr_len, hdr;
 	dma_addr_t des;
 
@@ -4513,14 +4533,15 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	/* Compute header lengths */
 	proto_hdr_len = stmmac_tso_header_size(skb);
+	pay_len = skb_headlen(skb) - proto_hdr_len; /* no frags */
+
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4)
 		hdr = sizeof(struct udphdr);
 	else
 		hdr = tcp_hdrlen(skb);
 
-	/* Desc availability based on threshold should be enough safe */
-	if (unlikely(stmmac_tx_avail(priv, queue) <
-		(((skb->len - proto_hdr_len) / TSO_MAX_BUFF_SIZE + 1)))) {
+	ndesc = stmmac_tso_get_num_desc(tx_q, skb, pay_len);
+	if (unlikely(stmmac_tx_avail(priv, queue) < ndesc)) {
 		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
 			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
 								queue));
@@ -4532,8 +4553,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
-	pay_len = skb_headlen(skb) - proto_hdr_len; /* no frags */
-
 	mss = skb_shinfo(skb)->gso_size;
 
 	/* set new MSS value if needed */

---
base-commit: 38b6be101006d3e7af972999f45d4f1e8250587a
change-id: 20260907-stmmac-fix-tso-nfrags-check-21ecfa2ac05b

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


