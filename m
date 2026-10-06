Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6472FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN5c5C6mMFvL5ZPcPquH7i2hkaLLpvXIcmDHaSD6DKg=; b=Pac0jkRM+MIYfVmctDUhuri2zg
	ZXuRxDMuBsUxA68kiMr+uoHARvX+/PvADxn9FtLQXKk3YtOMoiEifBZ/J2V1EPSiN9/TUmxeyzLur
	dNdNsvdhgioW4Pldmz6xKQtKAys998t42Czs4ppL9/TfjIcwrKg5lmy29uRuavTGM+L3JMS1lSIsX
	00NWRXU+7yCbhF4VNlcAONckgAZyKki3fxRvXX/cAP+lzyE+t9q9yukEbC2RuZh4SiaTVTOAEnXnj
	1BmULC5HHQJL+fF7MdyrhwtrAtCTSCl9/dd+N+I0HYewIFA3vKtzQbXdl0Dx/tLFsuK4joEAfVz9n
	azzfndZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE21B-00000000Rw8-36wQ;
	Tue, 06 Oct 2026 10:03:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE217-00000000RuD-3dA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:03:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6969UTtT084408
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oN5c5C6mMFvL5ZPcPquH7i2hkaLLpvXIcmDHaSD6DKg=; b=lbaf0yuIoc7/Xhua
	2E7x0tB7/UVjy+2vHp164jVYHcqc2SgXiAhaqd9AVFmcshBiPcklrIAm3PL3iAVT
	2LQVCaRfXxsEz1W4wQrl8mthsLkhVTgxEUeiCTXT6We9aTXIqieWl5/sku5c1JP5
	Lrm71EAQpMGFpTtgToTm96ofmA5zZgHk9KsF8kuCr620X1WLZ801xoetq+MxVKyD
	9Hjlad/LxfrkZbBbJGkdKzRi8db5YqtBY3Wlu5rJQhSMy6sN347AJ4jy9LjR+KnT
	ve0b5wOzb6EYyYX1w86i4KeIyAIKxZMqSpn9yOVwfF1NfQ6uqxCZ8NvWF39hFJwZ
	KkyUOQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdu83vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:02:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso792001137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280977; x=1791885777; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oN5c5C6mMFvL5ZPcPquH7i2hkaLLpvXIcmDHaSD6DKg=;
        b=UN6wYdJdBjY4TfT56s484uDKUw4nKC82+z41NpYkZsvq0JIpfisH7fd1C612WZpcTB
         Aki7sbqjGU8iHobquI3fgHdMoLTJKKTsi6Wz4OOz0/yMEkxf5t8XstSuKm6HcTml7Qnj
         YR9PNZulvVojIiujOu4YkLAGx7vMDZI/G1xo6wBGFlwGF9rQi7kFlU0SNTUCa/5Bw/1e
         oT4kEAsnuWmxsUDWyaE6bH0ZwsQpL0O6RkiD2CBHlLmx8LjLIqkjGS+be+VkwNh/Du7M
         jdNRfAMsepgRubCgiR6tKKi1xriPyQ8PmsE/3Sqj7ihFnZjpuX5O5u5EwvkFY2pLB40K
         xemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280977; x=1791885777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oN5c5C6mMFvL5ZPcPquH7i2hkaLLpvXIcmDHaSD6DKg=;
        b=kiLPDi6LEyZ19h2E+GRVTWMm4JCASDg6w9Bo1tTZrnK5MOOYjGyqIvwWDa29ab0oT9
         D93s6qT8Odk/6dc3Tb0N4o//uxm5i7uKlOt1NRbqALgWTDnU2xvn/jXvVt3yZnn47O8Z
         Sq+W/FAL70tck6+QYAxjNnDSWLkkX+bnsP2c452SYEJ69k4QL2Ma+gwd9Nbn4m1nlkEY
         GJ3B4MuoBbjCxFF21A1QD8xNpMzZXVWG9o/Se9wvglhf2a8dVWitCWdcc9r961pVZeq9
         F0mXtGbBYdaZFqTU5sCNMXtMISV/Yntfiayl3qCrrFFw5xvyfm1Pg4DXtlY7xiTFpZ5U
         l2fQ==
X-Forwarded-Encrypted: i=1; AKwUvByRFOkRFm6g+u/joW+UqA/ntIIDpGbTxQ41HhtgEyJxbJpbptOnmB1Fmiyr0GgcWMZoNM1YdcHTzr6irCOI2PFu@lists.infradead.org
X-Gm-Message-State: AFuF++n3p4lqOJuhwtX7XckGyyjYOHtQ51J1klaR0WzR1y1xNOkFbkc6
	jPFHkwiwoQc7nTZzGAPxTWkwCqW0uw0BbMYmybcSSvg4kemfiIQtj5MwP2inAkaZM7u/muYlS/n
	fciadaXJOJQsUfev7Rc0lKb+sS9pMlpttO9le0rWRZDfMGhNEbEeQMCEGyteDIB6sQ4SgDt/pae
	rgNQ==
X-Gm-Gg: AYBFou28MlthjqrZuNyNJzpWTZzFmZrXYeUFt30IZeB/Wp7Q5SXGzGdSifEff6FRzpT
	vQpf4bnobV6M6Ittta7PZIfUtLNz3hhxSHRZdZh6W7CXWwhoyChnH7hBqF6wWrL3qyUXVsy2+x9
	J8Q/LZzasgdnzbL44wMWmIznG+/xnH+iGx9o3klm4iqAmKZ8s1TjIBNNitkNE7ium+j+gnoxG6B
	jHePTWIVjZ2R4WpYN48IJ1NpcsZU+PKm+QvJtWuyrI5NpxJqzdeACkmprXQpI7ryxj8FEHiR+vw
	+VxX/XnslhZ5iPFzJoHgBbiMf/OhmQh2o9Mrvhl6l3njfXrFQgCIYYEDvNNvDG6eSdfvjclRvco
	A3z/IqxRE6fPo2A==
X-Received: by 2002:a05:6102:8485:10b0:7bc:58ff:2cc0 with SMTP id ada2fe7eead31-7c7e0d78062mr411796137.22.1791280976468;
        Tue, 06 Oct 2026 03:02:56 -0700 (PDT)
X-Received: by 2002:a05:6102:8485:10b0:7bc:58ff:2cc0 with SMTP id ada2fe7eead31-7c7e0d78062mr411790137.22.1791280975979;
        Tue, 06 Oct 2026 03:02:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6229ee60sm8939711f8f.34.2026.10.06.03.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:02:55 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 12:02:20 +0200
Subject: [PATCH net-next v4 1/2] net: stmmac: take ownership of saved RX
 state at poll entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-stmmac-rx-mb-v4-1-efa4ca974e3d@oss.qualcomm.com>
References: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
In-Reply-To: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
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
        James Hilliard <james.hilliard1@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXwuQb/FxFWkak
 UnB0D/eTaCYs59ptUsTw88XuQTnQ6p4iv818XW9SfGezNTch5/po+CWnWlZsb1WeH5R80u5Xx6W
 3B4+yGOSMQsmrNbtjzVFNnGQhSjjjDY=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac4c751 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=C0-oZMIz0aWSf3JA_4MA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: OG8H1y7vkOEoZ_QavRkr0LAC3V4egR9d
X-Proofpoint-ORIG-GUID: OG8H1y7vkOEoZ_QavRkr0LAC3V4egR9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX9oDRg2pIf/7d
 t6R11c27r+vlE2gWtsGf4EuvaCcccGJXwi48q8ud4rhsJb2RZs/hDJ+qguf2Py30tE00Gw70uTY
 fVLpdL+3auhuVk+gSv869H065FvUPu+MTfiMX5VenTxQLYQW+PWPCIAJiAnVkvEVZm4mbJUrukA
 p6fy0xxfxV/YeudCrt0iM1joi3NVlh/kZAKttQOidAgEPy2d3AqmiZlRAXjfzVwRMSsHWVhYArK
 sxD24u7oe0CGLpT7l3ILK8kJ2iVW/SbYtvNB8C6cmJUputqiPgty0peEYum4J7bFMTJfUw5sRj6
 z0oBiGtq0Co6iHG25ILqobly9fcERKbMNOxA+O/W/3brsllsmlWdHEpjuGf1TO4vGt6kMyPm0yu
 Bi5uesmb5MHjkXiJ2YIRBef0OX95OR6czdSgeN5z5sJ1Z1PeKOqLLMvUDNqq6HslyoibdswAIdu
 vbIxIY0QHTS3p16s0Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_030326_032063_AB1A08A6 
X-CRM114-Status: GOOD (  25.27  )
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

The saved state is also dropped when the queue parameters are reset, not
only when the ring is destroyed: stmmac_reset_rx_queue() is reached from
__stmmac_open(), stmmac_xdp_open(), stmmac_resume() and
stmmac_enable_rx_queue(). Otherwise a partial frame saved before suspend
(or before a queue is disabled and re-enabled) survives while cur_rx and
dirty_rx are re-armed, and the first poll resumes that stale skb with
descriptors from the freshly initialized ring. Teardown still releases it
in __free_dma_rx_desc_resources().

Apply the same state handling to stmmac_rx_zc(), which also leaves
state_saved set when a saved frame finishes at the budget boundary.
That path saves only error and length bookkeeping, not an skb pointer.
Track whether a frame remains incomplete independently of the status
read from the next descriptor, so a DMA-owned descriptor does not erase
the continuation state.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 85 ++++++++++++-----------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0cfd14d24002..28e9f8438f93 100644
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
 
@@ -5580,12 +5583,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5596,23 +5599,25 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5651,6 +5656,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!buf->xdp)
 			break;
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
@@ -5665,6 +5672,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (unlikely(error && (status & rx_not_ls)))
 			goto read_again;
+
 		if (unlikely(error)) {
 			count++;
 			continue;
@@ -5723,7 +5731,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls) {
+	if (in_progress) {
 		rx_q->state_saved = true;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
@@ -5765,9 +5773,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5787,25 +5796,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5834,6 +5846,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -5846,11 +5860,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -5909,24 +5922,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   sync_len, true);
 					buf->page = NULL;
 					rx_dropped++;
-
-					/* Clear skb as it was set as
-					 * status by XDP program.
-					 */
-					skb = NULL;
-
-					if (unlikely((status & rx_not_ls)))
-						goto read_again;
-
-					count++;
-					continue;
+					goto next;
 				} else if (xdp_res & (STMMAC_XDP_TX |
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
@@ -5983,10 +5984,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6011,14 +6010,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -8338,6 +8338,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
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


