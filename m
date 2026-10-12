Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B4CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7uLNSvnwZ8teVL1fB+yhjFqyopjcpDVtN+2BWDZq7o=; b=gTjf/Y8lmUQgDxbL7zCoDCHPaN
	oEoXxzmhTU2QHUPQu9DYbSFWNYaXeARlvBJm/Jyb1/5wSvQ85n1JWRygnSLGt+8RnqEa2sgkLL77z
	VCjjvihRu/pyoEb+joaUavuu/VGOrd3SpFJCVaMro1MYtKegEHrI1b/sn/nvtyXSr+5UIeKD7Q31k
	P7p5CBCXK1li94PxDr6LRmUXEaSczyrm3hnKSPkbpEYVbcCwLZH3A6ofxzz8hxrlsFZFnNlV1wroQ
	4XKAxda6xgCrxSnezQWzOQWcgFK7vgGISRbAPb3GbJ7P3PpVR5/+/q/PLqBfnpNAbxQIcUlIDevmr
	IFyhSeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8p-0000000B0QV-4C7O;
	Mon, 12 Oct 2026 16:44:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8k-0000000B0Nj-3gp9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:44:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFewqi1895575
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7uLNSvnwZ8teVL1fB+yhjFqyopjcpDVtN+2BWDZq7o=; b=F1tBvOK8B2AxcIUO
	LpM6x2HLcYiRFoLoNFrept/HxD9K/vpIjOlKCSt07FSFKEQqd2u/Y5F/pCh9vMgz
	vzhXSHAvITMZ/d9Qy3I/no7F8ZKTqS006q0rGETsGBqi8Oq0SDsepxPMX1KsfBGo
	bw/p4B7OkSbBKMbBjTkqKUbtLEIp+iR+/k9VFnu3XZX4wKjSkfx8rJePZxCY4NX3
	5ZOb7V0q7P5c81VWFCq3I9h3Bg0WEyn9otBVS1eAGrggzzff7Fdid4QNI3rPBUYQ
	3qy0ogare8GhAuuNiXqQJTykaUi/PJDOeNKWsqWeW8ZKm4skkgMbEpgEhKhr4cur
	dFjn5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kt5v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so355322285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791823481; x=1792428281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7uLNSvnwZ8teVL1fB+yhjFqyopjcpDVtN+2BWDZq7o=;
        b=BAb3pHXTZREuR7N4AK8bWUjoT+e+ScmdKZaPFM6zH+xYlPncZ9EwPTDcteMNT2IA/v
         LHPiIBrTguq5nRR/TZ4ALVHZ+1WGXSb5Ol+84a4HDyDHadF8vtgJCWMo8EPXbJGRjTUO
         p5iCJIKijJEJkssVDd1/S0UuRKFvmKGmpY60GsrDXwLm/jTOkJSHQRsjXIy98uK5GbEd
         u/F7u0fpOqVcN05Nb0DcshfpcT1ZtabCTCztAHPGKfmcqtsuB6qKKuxapDR3BFF0C4Sk
         2LwLM4U6tU6brVI0lzi2ht42yRUWizooYbhGRpSYhJyKQB58tRA7X3rXcfv9qdtxn3FA
         psTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823481; x=1792428281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7uLNSvnwZ8teVL1fB+yhjFqyopjcpDVtN+2BWDZq7o=;
        b=osctjmmCpBM46tWkN5NHbavhHGh+494O6Wkc3GzPE5LUF7HVygaW3Yee+WtGZimrOl
         5lBGkCKtbJhjBNYYYFEkimLyxOYxvxsvotpwTikzCWXRaVOzDXeuq5M5JvQpOLxsT8Dt
         nA0Bh0YktUdDPF6G6HvCReS/njx9VovUvXV1HTjpFaIRR4wFu97/Uw3He5Qjc1YtpH5J
         6MTqJLBR972LJgfFcx1laV/z8x6Y2pC0XpGiFXDjFEPgNRzBGCQFqKUx94GMo8KQ5ncC
         zhWkyuqZ7Vhct1S8hY21VZZb7gOdiA//w1ik9eZZcluX8okb4+ZqOcc4+FuGXb5dx7DY
         dn1w==
X-Forwarded-Encrypted: i=1; AKwUvBzO/pKnQl9dXfePO2AQwgT6MPrlMzKMtBfNtLhs7lxgEjcpWBXNRUY/6C7PC0/C4FzvaaNDxqvUGzNXvXBarmAz@lists.infradead.org
X-Gm-Message-State: AFq9FYKgv8ypKt/7yaHYeS20IzyCZDCBNL8Gh0AsnCqE5bztvOXWtQzm
	ucVcdRKj+cTMYo0f/1z6KjQAf6sp2r06oECFA6550SYBCOsmFy2g4I/JPRYnH6iTgZDlsHA271t
	Ejt44nTwnpgZTIEy7yFWfJ2igfLE63m4LtWo41TaVSMCNHguVq//xP8XpLtBh5rnWADjonSxRWq
	/oCg==
X-Gm-Gg: AYBFou3GzGjZwRyhWGojiSTHabOHMyJRBwDgWtgmWrIiDKeYBS1+AOq64LB/CIbp8zS
	vqj43WMOqB4+IeH6JsHJO6yZIVbyjpN2Oto2uoSx9byLxefyfexXZrzg5XtNF/vZ325cOxwzZf4
	Gi1qxYj4P6V+mAFk62lnPSwoOu7OZQz9iQlBBEMN6Vr4saXsbsBLtMLw0KtuLNZ7trtLqB2ZdqG
	BNO+rdGHl+8k+g5TkcYYTTNvdJlio6EL1coDglXrb1Zw7wTo55UQ+bybNEI/ZWQw5aznOU18CQU
	CEtrphGcR4BLCFt64csiDyQ1H6d2ZPXVN3ttNLZ2FvppMExS/DvyUdJczomVSfjHxNa2AVEm4z7
	o/npfrT8d7ANCuA==
X-Received: by 2002:a05:620a:a0ca:20b0:93e:c12c:f137 with SMTP id af79cd13be357-93ec12d0800mr1060277085a.82.1791823481141;
        Mon, 12 Oct 2026 09:44:41 -0700 (PDT)
X-Received: by 2002:a05:620a:a0ca:20b0:93e:c12c:f137 with SMTP id af79cd13be357-93ec12d0800mr1060273085a.82.1791823480416;
        Mon, 12 Oct 2026 09:44:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a197c465b4sm134323325e9.3.2026.10.12.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:44:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:44:23 +0200
Subject: [PATCH net-next v6 1/4] net: stmmac: take ownership of saved RX
 state at poll entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-stmmac-rx-mb-v6-1-2225050915c1@oss.qualcomm.com>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
In-Reply-To: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfXzfrw1MiBu/Ij
 W/0PQI8SM27EyFNbAbQBcXlrVdmtzMUYAa28NdXGWVDUO0ZCCUV0iUVZ91McMr56/diXFcEqFjy
 KnTRfrz0CtPr5ghkQEl6k/oAbrk0Z2aWx2l1s9VOJ8MtXMqMnbDzOeRefWkqbZiwLwmkPRJqXWE
 Ualusb49vGW5VVXn3fg4CcZ4GtOnYkWHptD05GGEmhZUHdqQGP1IMzz6TmpjHgO7bNxd6h8RnRB
 p/2Egx/Ohm95UR/YES5bciNGXThkgCJPcWySWEOufuq91FbMB44O0DxbEZy2hrzuQOaSctzzIaW
 B7O4gR+r8PeFmnTcy1TGdr/t+7JzIJAAjVnc8xOQNqa4h3970stkZUPaHKIdUD91vP90+Wn7hZw
 HUy2ZJr2sCV126b3285QAwhUbFArhttD6i50q12pZ5NLeYY8+GMGtHok/Go21sDsEWdcumbvCCO
 E+JruO3DoqxQSekvsPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX6wrkOSAEzh1r
 Qwc6iET8fn+YF8+ZH6GWcQ0Ao8QOHK/dB1otp1qlb9mySTUjxQW1Qsz1LKeknLPjDnFIz6XhE4/
 ILRwhoJMMpk1Pv0AJeQBhZ6dl20/R14=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd0e7a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-gjLCbu4MZEjzEcwt_QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: pqo4e4WK9FiQoIL9O7LMunxDFMGETdsz
X-Proofpoint-ORIG-GUID: pqo4e4WK9FiQoIL9O7LMunxDFMGETdsz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094442_965615_1ECD8EF5 
X-CRM114-Status: GOOD (  23.93  )
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
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 72 +++++++++++++----------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b8b4de4c5b1a..f66b796f7725 100644
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
 
@@ -5620,12 +5623,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5636,23 +5639,25 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5691,6 +5696,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!buf->xdp)
 			break;
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
@@ -5763,7 +5770,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls) {
+	if (in_progress) {
 		rx_q->state_saved = true;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
@@ -5805,9 +5812,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5827,25 +5835,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5874,6 +5885,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -5886,11 +5899,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -5964,9 +5976,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6023,10 +6033,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6051,14 +6059,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -8378,6 +8387,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
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


