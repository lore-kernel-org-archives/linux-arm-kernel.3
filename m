Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF21CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 17:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzwC/zJKlfxLCWUTfxSQcRAYGVmJ1awZ4A2jt/xfnek=; b=DD8hjnIh8kH4wahOLZpW8hWpqE
	FFSUr7SLT5sZzNXoN/0ZPhG3A5tUQ+ifF/8RheyBVeCE1vvYQE0jkmy9zJvHpF5fr4Igz/LW/Wys9
	j1J26bYKn/7AEEkX/TawD4GBJPb5CtdCi0XXWgtz2iO9etWZht2uiUMNPHEKTSS4gBa6TrzUk0OXU
	Jwf5l4SjwHEKd2aHWlQStIGvgwPpbRTsQYW9kQ/wOir4W/vaOMALikZhGrhVcdeGy5CCn2r7SABiR
	js/kD9qNwJMK482yQKEJBQPjhU0OuRHtAijy+oimHodVMpsHoykgdr32cl6+bVFCLFMeuTd7XVA1t
	I1XfImqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUM0-000000064T7-2UcJ;
	Sun, 18 Oct 2026 17:07:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIULu-000000064Q0-2z9D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 17:07:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IF7fwb3215879
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzwC/zJKlfxLCWUTfxSQcRAYGVmJ1awZ4A2jt/xfnek=; b=aeK0M6XQZxPUNrvZ
	jITxHfdSVnnePip4Y5uyB7W2MsVwuTeUXQMF8+WgRiWv9I8GzMpYd1k3YFcZP05M
	+f7lqOFQizgS8nJHbxYyhXQW7LbrKXqB7EmzqfInypFQXfwtJlnBAO2UZsWHmLvz
	ekPVCIVrOCJPs3cyixcPv/fBK0/GB+9myRhextYI7UcBPol4qlRTxXQydoP8STVG
	hOg8fxoUgHlt7Y56RdNYRft274qXKWKguAnFGhso6Nf+q+n85wQO+e8/4d4JSuTy
	FL1NY6X3Lk96oRmb9fpUaDc/bsHYWe7eYURvmeMiJgRZ9OB6TKvNU98OO5M2HNpE
	fPeQKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7ufgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a2de2cc1so18051926d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 10:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792343237; x=1792948037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzwC/zJKlfxLCWUTfxSQcRAYGVmJ1awZ4A2jt/xfnek=;
        b=bStDhZN9g1G8L7PwA0lHKlPt+5Mov/RZ9rg8np1+yr/yM9VQQhYWiBEBdItD1wphKf
         lNNpu2NR1hm8ehvn2wikZcdzJqJIsjg1OL8/iNmuv4UohgJFV6KIoSopdgbAzqY7BuBa
         lJGO0bECWmCGnrBoybU0r+HGt8kfOa5CyHbBwPTpZL+ZwlVwcJ+QtXqsnw8oxldmO9Gd
         e1V/5APu7ML+8l8TPko8FF/ZwupiGcdvZ8QFKOgtugKixAV9AidKHXKo8YahEVXz+f5N
         sHPmkF2nLkJu+sqFxhWw83+ZuDstz3l91UsS9hsZG5HXMN/E77g7biDlFgZhKZijFTty
         ag3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343237; x=1792948037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzwC/zJKlfxLCWUTfxSQcRAYGVmJ1awZ4A2jt/xfnek=;
        b=MDl5Dm2Vdj4a3vIk3Lf7ZE6B7TAeoTD33vygzx/nBGPjes1CyCsSeXvSZ7R7x8V+Od
         5BPvtb/iRgSuVIkMi0JCUfNUR+OKfdy3DoMywnBDMxR3NML9LwhbGi2i+Ro2ABznDHe/
         pCk9FJpGtLvI95H06SB6+XlYWHjZhRKWdDfeONxoZDHjrMtoE3mMtG3pk8o3KRfus/JG
         nnedFOdrOdwEmEweT37W0R46H9Lg1aEJUaJn9B1HfskTrPoK07mZVQg29GyscFcdL7Be
         qSheKyGLbRAYJ7vFQrD7Atk7DqndcK4fMAG+Y1gWPAN3Z7Fth0BY+lPyKc1crMApOhzy
         4UOw==
X-Forwarded-Encrypted: i=1; AKwUvBz7Ft6RUSnwExcfwbvQhEOZeYwenz0b7tuEyYzosQv3fopbM5UlLfTXk4bC0Grwd0vlZdmuDdFW620cMvMQZeYl@lists.infradead.org
X-Gm-Message-State: AFq9FYJq0DCbzNlm9iiZMKV0F4dZA8Ar6GkvD+sLxYaUlzyUBPh5wEp4
	inwT9qVsinHRsoIkPkbNIXVLZ3fl6yEQLC9/8yjhwA1r17H5eRs5AtpTajc2TXwxIU5DBMhcuaW
	MOf/svUxqIElqy4a1yMsO9LiK76c746Hc7oRDB9yShMCm3G9q5CmH1jdLj8ivboyKaEiunbgGxH
	jnWw==
X-Gm-Gg: AYBFou23KJoO1GzFX3+3X5SmOIQVqN2a6vA4yh1k2nf3AqV1GIOFbXmgh/oBAqRup/9
	QPqBO5rKnjmirPm3irwYW8KO5xlJhtV067aaEQm4tqnq2ET18yBdMIW6uhcvwpzDFFMvhtPOqLL
	Z1ZKA81FHS3Pdr4FYHzQdoOrWct8SIRBMBiJSd/Fs84YIregsd/zBHfcsLB/lDB/aShT+fE/cuW
	ghTBo6v9GjVgx1wIvcyC8r0e7v4yqeCvzBfjALQcmfpuboPFvJYfzNXPaeCT6vJBYIrVG8wK0hi
	uZcubNpMpCyhkIt25bQ4DbOy7Bhg3U/ZSnvUuC2ypAWA0ik+CqIhPX3WIDBTlp7gzSaRaPl69ud
	5mBuLFMvdgKlSpA==
X-Received: by 2002:a05:620a:8812:b0:93e:b7cc:67bb with SMTP id af79cd13be357-93f29d6ffd1mr858465085a.54.1792343236356;
        Sun, 18 Oct 2026 10:07:16 -0700 (PDT)
X-Received: by 2002:a05:620a:8812:b0:93e:b7cc:67bb with SMTP id af79cd13be357-93f29d6ffd1mr858459285a.54.1792343235744;
        Sun, 18 Oct 2026 10:07:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm19002552f8f.38.2026.10.18.10.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:07:14 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 19:06:59 +0200
Subject: [PATCH net-next v8 1/5] net: stmmac: take ownership of saved RX
 state at poll entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-stmmac-rx-mb-v8-1-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
In-Reply-To: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
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
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfXwcNIQeQP/FRI
 baLxof3pJufEM1lb60xlqEDNoK+ZFGUB1Md4YAjuzn9PZMK/nPTLTYzdh+dgYfDrUXMXq1P6Stz
 lp/Qw5UYUFF7H6QtJEcnnhk2EsYTyUo=
X-Proofpoint-ORIG-GUID: c3yQE5xY2aYsXARQvin5WUkwh-E3Ymln
X-Proofpoint-GUID: c3yQE5xY2aYsXARQvin5WUkwh-E3Ymln
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad4fcc5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-gjLCbu4MZEjzEcwt_QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfX1ac0qKsI4UBJ
 qpgnEkqkNbvR6aOFe9/mP+nutf0Pg8Yv5wxKQudb5pMhvvFuG5jksLC3hRcMEtTaRIYsxEfmPBv
 21dCEMr2NQTJYxKLUCOx2mLSiSRtOyQedosY5mL5NRhZqsf/c/nVTyCcPDteHxo8p/8LZeGtj39
 N6ztMubiPqOeUmoP5mjaDyHKwhGAoOK+Jko0JlQPmKa5u63r0gT29ngjQ1gCCiVFgd1Zt9YH1px
 gXHOO0PmHDv+6Cf1ZPaI8DB+G1ioBG9b79qiiL3IHvY55CFuumJhb8q7JLUD+gKsHW3CZPuWDem
 oYTPMvMYd2lhfQviZE8fQh0S5CMd2BL8B4IeL/af8h7j+uE3GkRkDanauQReZsvfC08dR+cvsIL
 pZVxsiGUD1vULYc/rGKVh00Rq8is/EneOSA6dowLLFo9ZMrNH9owRa5qhGp9jl30lQKM/lBEwZp
 PdlVlcwG7fSEgIV6WBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_100718_885087_B7EB4A37 
X-CRM114-Status: GOOD (  23.10  )
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

When a saved partial packet completes with a poll budget of one, the
old loop can leave state_saved and state.skb pointing at an skb that
has already been delivered or freed. The next poll then reuses that
pointer, causing a use-after-free or double free.

Take the saved state at poll entry and clear the stored ownership
immediately. Save it again only if the packet remains incomplete,
including when the next descriptor is still DMA-owned.

Track the frame-in-progress flag independently of the status read from
the next descriptor. The old code keyed the save on the status of the
last descriptor looked at, so a loop stopped at a DMA-owned descriptor
(rx status not yet valid) could drop the saved error/length bookkeeping
in stmmac_rx_zc().

Drop the saved state both when the queue parameters are reset and when
the ring is destroyed. stmmac_reset_rx_queue() is reached from
__stmmac_open(), stmmac_xdp_open(), stmmac_resume() and
stmmac_enable_rx_queue(); without draining it there, a partial frame
saved before suspend (or before a queue is disabled and re-enabled)
survives while cur_rx and dirty_rx are re-armed, and the first poll
resumes that stale skb with descriptors from the freshly initialized
ring. __free_dma_rx_desc_resources() releases it on teardown.

Apply the same state handling to stmmac_rx_zc(), which also leaves
state_saved set when a saved frame finishes at the budget boundary.
That path saves only error and length bookkeeping, not an skb pointer.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 72 +++++++++++++----------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 53782ab55e12..8fd2acb25fb6 100644
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
 
@@ -5614,12 +5617,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5630,23 +5633,25 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5685,6 +5690,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!buf->xdp)
 			break;
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
@@ -5757,7 +5764,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls) {
+	if (in_progress) {
 		rx_q->state_saved = true;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
@@ -5799,9 +5806,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5821,25 +5829,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5868,6 +5879,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -5880,11 +5893,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (unlikely(error && (status & rx_not_ls)))
 			goto read_again;
+
 		if (unlikely(error)) {
 			dev_kfree_skb(skb);
-			skb = NULL;
-			count++;
-			continue;
+			goto next;
 		}
 
 		/* Buffer is good. Go on. */
@@ -5958,9 +5970,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 						      STMMAC_XDP_REDIRECT)) {
 					xdp_status |= xdp_res;
 					buf->page = NULL;
-					skb = NULL;
-					count++;
-					continue;
+					goto next;
 				}
 			}
 		}
@@ -6017,10 +6027,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		/* Remove FCS if needed */
 		if (!fcs_stripped && pskb_trim(skb, len)) {
 			dev_kfree_skb_any(skb);
-			skb = NULL;
 			rx_dropped++;
-			count++;
-			continue;
+			goto next;
 		}
 
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
@@ -6045,14 +6053,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
-		skb = NULL;
-
 		rx_packets++;
 		rx_bytes += len;
+next:
+		in_progress = false;
+		skb = NULL;
 		count++;
 	}
 
-	if (status & rx_not_ls || skb) {
+	if (in_progress || skb) {
 		rx_q->state_saved = true;
 		rx_q->state.skb = skb;
 		rx_q->state.error = error;
@@ -8399,6 +8408,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 
+	dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = false;
 	rx_q->cur_rx = 0;
 	rx_q->dirty_rx = 0;
 }

-- 
2.56.0


