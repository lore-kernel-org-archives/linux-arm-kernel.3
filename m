Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF5CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFLLUGu2HiBjJj5EPsQ0wYfXMvvqmqcb0LYvPjjspzA=; b=uCYq6ZW0WqOhsB7VMYa19U01dl
	KNRSL0wnYUHbbS+8FG3tQvghvNDTzx+FAhdwF4zVqPgCOrbCheM6vM4sL+gAvtHBZGR6dkF1ovmdt
	L3IbtLEKNVw/weNZugow8tEC3kS/672Q6w0B8wyWIPV83slFrMPf5psrbrQXDMoIMqu6MFMGN4tB7
	jLIGTPPzNqQC2FVeI4FS9O1pmqW48a8KTYoC626vq3+yRo4gIwYYquOxXJf5cy4AGTlvLglGg+rmH
	wYfRvFfYM58DwjOE9BhXCNsOIrZ42aPVrejLL7KMfFDw0HEkt7I8wOpS3uCQClXEHTo6JTtQWGEfr
	LBoj/OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT2w-0000000FHHe-1cQL;
	Sun, 04 Oct 2026 20:42:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT2s-0000000FHFx-1DI5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:42:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHQh53858897
	for <linux-arm-kernel@lists.infradead.org>; Sun, 4 Oct 2026 20:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFLLUGu2HiBjJj5EPsQ0wYfXMvvqmqcb0LYvPjjspzA=; b=ee//qSgmhlyap/nX
	bGJ5dFdrAImlu1oN38GGoFftuBf709oKkZ7sKK+p2svzEwCYamY9dyDuAvO9U5yQ
	0MhcZ8NfFaTHVMUGUVJ3RXTOwHs8ZgK35sv5eh0XJpZ7S541/ifKOkezoWGRtgE1
	K/LvfiBRrJRw65ImwxPpA/VepFP1M8sE9sbfkAJvo0sPNn5t0yhyBh7yhzzEP1j6
	i9+PBlmkwIqEzJq9HQ8DzixV4CVezxLsAODcJga04oG4w0ysWJE+50yz2OmsvJlo
	upDbUW72YgTUtgw+O69EpTtm7iPt/EaqTcFb22+7GPWImQEDJKzIO3Wr4Ktcxpve
	U7N4YQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssubqjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 20:42:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso258434785a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791146573; x=1791751373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFLLUGu2HiBjJj5EPsQ0wYfXMvvqmqcb0LYvPjjspzA=;
        b=ibKqKAdNA2gza6Xde1dHITI4AysR5v5Illt71w351SihHXOMGpNL/+x4gc2FTrVv1E
         uEwBmYLU0UMIvAFyJdNyYgnxZyXJr89MKKCXjQzdgLExQQjJeuypPT6+0PHj1YfN1YK4
         uKmtGK9b5rl+d4wwhXJN1pT99XuZbKQjeiInssFrGadbJPdJfI0s0aoqJt/pXcYeyIrJ
         QhTkA3FIJ1Mz27AyLWoODxms+92/2X89BdKAhk09HvxVSXEzNKANWWOlO56WxOqV9y95
         OwsQCBtg6tcjTYxZBj/kriahLrBo33Q5LspPh6kWp+N1YvNlZ/ZeWKt9JCFyhOKC9PhL
         YZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791146573; x=1791751373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFLLUGu2HiBjJj5EPsQ0wYfXMvvqmqcb0LYvPjjspzA=;
        b=wiCHNl1VQjxDGkK28uOlURIRmB0WsUdNxFG/XOHE/x3o0TeJfskT/VAYryscjHxq7k
         N5djsAohA41TOBIAAsF6SCpanKE0nWA32mtTrvIBVgmMRaTvJ/W+e7pxMJ8UUOPNVSDI
         RFwUKKipWJynwzQQnRspUY6Zs+itoa19t2FhdSMQCOLm1V71MR/SCLGeU4mmAMWQaRIv
         9CS2TczGT+XTyvO6r75/D+mS3Kzdk3E/mMRi+BnnA/QnTAzRwkcK5GVFAQWC3D2m7MYz
         OX580y+Da9Tmamw008nAspVvRYLCz3nngHghD229xobV5QWUhz9e+hJaDDnuy2dPQSCU
         AqEg==
X-Forwarded-Encrypted: i=1; AKwUvBxX1lUBOU22nrWSWrElZQr8YzkBB2+hm3kWZ2YgZWvnah2LLPI2Lgk3mMvgUHwY5oujLXxfi0qKh46qZ1UZxc/8@lists.infradead.org
X-Gm-Message-State: AFuF++le3nankDKHmTi9jF7qJH2Vrr4sWIGbTu+CzEw/kaoSM7AnhYsr
	8KQomqCz2DXNk6w1A6wBSB4tYeKM8ALLmr7VW/JRciifKOEKHzClyUvAwHLsDmCRV1mQuUl3kdO
	SAg3LByxG2EKxEdUL0UznysEZzPF6r1l9dq26nwiN9PyKGXww9mN0a9XpLPqwuXviVBDieybeKV
	0eRw==
X-Gm-Gg: AYBFou3l3ZeJJkC5x67JIf4+lwrc30g62yBtjLsWx4MuHrwT4hbbA8rwvNcfPMxXT4i
	a/hfVwDmw1/4Yke2ZRccWZwgY3XDh7FgksYdT/xXXq5cmd+mfsOwpaFLdUs4B/NkU/0tR8VOhSW
	HkbMmgEzrUUgZP0CxyDdlErb/2LLpN7ew54KpGHZt8z+Z4HR6p+bGE09nzYjy2vMyWDdpuEopki
	/ItJF4hu+HOkleUNcJ72x4IYUOpF0ktnnjCkvNrJ4tcVTyqxO+WdLzR1fYt3vg0uJWQeiGHDZF9
	zoPTomkFGus1PHnAwyROvS78XA5pWUhxBfzrN+uO2iGGNdzGy1rRp7TvED0EMHatqbCZj4lPWj+
	q27bn8viZJ4bz4A==
X-Received: by 2002:a05:620a:710e:b0:939:1222:b9f1 with SMTP id af79cd13be357-93e50bea455mr981063685a.0.1791146572512;
        Sun, 04 Oct 2026 13:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:710e:b0:939:1222:b9f1 with SMTP id af79cd13be357-93e50bea455mr981060085a.0.1791146572001;
        Sun, 04 Oct 2026 13:42:52 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm227604135e9.10.2026.10.04.13.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 13:42:51 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 22:42:01 +0200
Subject: [PATCH net-next v3 1/2] net: stmmac: take ownership of saved RX
 state at poll entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-stmmac-rx-mb-v3-1-50fa171af9ec@oss.qualcomm.com>
References: <20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com>
In-Reply-To: <20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com>
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
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA4MiBTYWx0ZWRfX2ijpjRTp3ZF1
 l1dWuGvwq/J4Fz1Z0z48WXpSKc/YrzuU5nJmROySeVIwuvJIG6QewbBLwYNBQVqDcMvD1zZ8+5T
 BR+/Z9BV125q1gHFeAGqZj5CSvRnl3A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA4MiBTYWx0ZWRfX0Ny840azQmf1
 hDyGa8nDDSm+qge0mOwBE6OnKa5Mh0GwtX5bVvBJaDCWBPKpl7HkKL9Uy1BP609+BUYGxIzYqOR
 SUP9wMfbI7ey0dCeUmnvzD3GaSg4yrp4BcCfwavrL+kPRtqw/vSBQyvdtvPlWPLfzi0WdNn4kvS
 F/10fu+zwpBXVg06GMBZZG2ihHWYAeu9hzWT6Ce7ABrygNz4oKEPNwjR4GzF0DUEZvI8+MSpolN
 RXFdtUiX3V5znB1nvv5+lC2B0ixl0qu6h1nnwM8pjnG4n9nVc+2TjqiXgj3sUTWxlV1zEifuU8v
 SOe7SOU3olpVTgj+Fa+CLDrQJ1iYTaAH2rrU7pe5ZgyVFyHjv5g7fBLNt+Z18ndxAfZyHtRS5N+
 U06srQdc85Ko1+JdlwEwDqBryri8O6Y0G02mmd5o2e7Of9B0+4wkVrfxweZANHkpwfq9behWc5/
 yuxVZimcSWNPDsPCFJg==
X-Proofpoint-GUID: hH3Rwdxn5bg30tw-3nQj1nGxHKRaW5cJ
X-Proofpoint-ORIG-GUID: hH3Rwdxn5bg30tw-3nQj1nGxHKRaW5cJ
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac2ba4d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=Wh313J_-GvSRXK7hiU8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_134255_013434_6A8F440E 
X-CRM114-Status: GOOD (  20.82  )
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

From: James Hilliard <james.hilliard1@gmail.com>

When a saved partial packet completes with a poll budget of one, the
old loop can leave state_saved and state.skb pointing at an skb that
has already been delivered or freed. The next poll then reuses that
pointer, causing a use-after-free or double free.

Take the saved state at poll entry and clear the stored ownership
immediately. Save it again only if the packet remains incomplete,
including when the next descriptor is still DMA-owned. Release a
saved partial skb when the RX ring is destroyed.

Apply the same state handling to stmmac_rx_zc(), which also leaves
state_saved set when a saved frame finishes at the budget boundary.
That path saves only error and length bookkeeping, not an skb pointer.
Track whether a frame remains incomplete independently of the status
read from the next descriptor, so a DMA-owned descriptor does not erase
the continuation state.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 54 +++++++++++++++--------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0c381ae0d0ff..b2d20628ed21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2180,6 +2180,9 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		dma_free_rx_skbufs(priv, dma_conf, queue);
 
+	dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = false;
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
 
@@ -5581,12 +5584,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int count = 0, error = 0, len = 0;
 	int dirty = stmmac_rx_dirty(priv, queue);
 	unsigned int next_entry = rx_q->cur_rx;
+	bool in_progress = rx_q->state_saved;
 	u32 rx_errors = 0, rx_dropped = 0;
 	unsigned int desc_size;
 	struct bpf_prog *prog;
 	bool failure = false;
 	int xdp_status = 0;
-	int status = 0;
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
@@ -5597,23 +5600,25 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
 	}
+
+	if (rx_q->state_saved) {
+		error = rx_q->state.error;
+		len = rx_q->state.len;
+		rx_q->state_saved = false;
+	}
+
 	while (count < limit) {
 		struct stmmac_rx_buffer *buf;
 		struct stmmac_xdp_buff *ctx;
 		unsigned int buf1_len = 0;
 		struct dma_desc *np, *p;
-		int entry;
+		int entry, status;
 		int res;
 
-		if (!count && rx_q->state_saved) {
-			error = rx_q->state.error;
-			len = rx_q->state.len;
-		} else {
-			rx_q->state_saved = false;
+		if (!in_progress) {
 			error = 0;
 			len = 0;
 		}
-
 read_again:
 		if (count >= limit)
 			break;
@@ -5652,6 +5657,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!buf->xdp)
 			break;
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
@@ -5724,7 +5731,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls) {
+	if (in_progress) {
 		rx_q->state_saved = true;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
@@ -5766,9 +5773,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int count = 0, error = 0, len = 0;
-	int status = 0, coe = priv->hw->rx_csum;
 	unsigned int next_entry = rx_q->cur_rx;
+	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
+	int coe = priv->hw->rx_csum;
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
@@ -5788,25 +5796,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
 	}
+
+	if (rx_q->state_saved) {
+		skb = rx_q->state.skb;
+		error = rx_q->state.error;
+		len = rx_q->state.len;
+		rx_q->state.skb = NULL;
+		rx_q->state_saved = false;
+	}
+
 	while (count < limit) {
 		unsigned int buf1_len = 0, buf2_len = 0;
 		enum pkt_hash_types hash_type;
 		struct stmmac_rx_buffer *buf;
 		struct dma_desc *np, *p;
-		int entry;
+		int entry, status;
 		u32 hash;
 
-		if (!count && rx_q->state_saved) {
-			skb = rx_q->state.skb;
-			error = rx_q->state.error;
-			len = rx_q->state.len;
-		} else {
-			rx_q->state_saved = false;
+		if (!in_progress) {
 			skb = NULL;
 			error = 0;
 			len = 0;
 		}
-
 read_again:
 		if (count >= limit)
 			break;
@@ -5835,6 +5846,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -6019,7 +6032,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls || skb) {
+	if (in_progress || skb) {
 		rx_q->state_saved = true;
 		rx_q->state.skb = skb;
 		rx_q->state.error = error;
@@ -8339,6 +8352,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 
+	dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = false;
 	rx_q->cur_rx = 0;
 	rx_q->dirty_rx = 0;
 }

-- 
2.55.0


