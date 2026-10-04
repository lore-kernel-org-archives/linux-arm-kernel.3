Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EA1CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOQF3KwJpXPP6Uhuf5YGNDwiIZtPQjwxBMlkXfxGx0Y=; b=YgJwpo7zK5aL09j1Fque76iIHg
	Z+udpoSrLXG8Nz9UBWEnKhX+06li80STcBRZ4jhZMFzaoyS+10melq3IysxN7GArynRx+RtdRa2O7
	7qWXT3QXROtUaeRtmxWnmJYfwzzwC16WI234/NperwV2quwuGrhral28RsXg7LS8w1tW3W/p5Nxh6
	zDFwqyFiH9NaY0uzKDV6/H4sVQcAHD2OvmmkL0CUR5P7OQuPuAJHWJmhFD8zlVhlrY+2qjYAAf7i9
	dG4js8jr0KDu/0No8cxX3CtCl+WGiMnoWM1aDvA4kgImN+QC/rvsG2WdiUJZSJG/6AF05fHBI+Wy4
	ZfOtw+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT2y-0000000FHIf-2Jra;
	Sun, 04 Oct 2026 20:43:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT2u-0000000FHGm-41X7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:42:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHnAC3673006
	for <linux-arm-kernel@lists.infradead.org>; Sun, 4 Oct 2026 20:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOQF3KwJpXPP6Uhuf5YGNDwiIZtPQjwxBMlkXfxGx0Y=; b=k/BNmkEekNQUyb0l
	vd30k+sDY8uGRY9UsrQzBX7lVlaP94iUCyJ1xCfdn+rSrImalrrZ9luMrDoxErb8
	jOJIp/MCtHo0hWGnpdoyoDmFQOVvvVLJdCF1vGaXYHucaGfDtNKT8PU4rC1REW8Q
	rM9l5QdR4pqIv7IB2ztuiOv3pHQsrQ/cLczY5LOsYFQbe3hr0I//yd5e+FGLbcHZ
	UZCY70edyy8+jLq22FpeEG29K593jYnIrfQrAUYxnLrqWKTQ7+eskfD72pGoVtBE
	0joorQSMzXAYY8S6GmH9DaTUNUWBIZCqhRX0+poMJ5VTQmjrzthaJzIKJRLkt0ua
	g52s6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06uqng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 20:42:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc7a6e4e1so306809985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 13:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791146575; x=1791751375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOQF3KwJpXPP6Uhuf5YGNDwiIZtPQjwxBMlkXfxGx0Y=;
        b=M0IgExoUqE6M6lXf8HyCkbagkOwBYbXXDoxrA/a9A/aYmRTC2aYRG3JJIcnMtNNg08
         M4ijIrBzsLU8GZtur4vRnpVT0ajU5K/Ec3o7Hlf14Ke/BlqAr8G63sMjGfRrqhlxUIxr
         k3EXklWGWxDqzhzPoyehefGARJl4kTfKshkOFDZt2QeUHrPWNLczK7h8fjftRb3eTXn6
         0/CfOEFEfqrERRtGM58YVX2RCfqj74F/U9zkRyIc5FUJ5sBXZM0Z1pHfVwY81zlIpdh3
         ZgrTwX5HD6JSqxSBwr2Z9lecmBfOFauISImwfqvcxgBCiaI9Bai51zNUZE4rw/GY29Ni
         hKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791146575; x=1791751375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOQF3KwJpXPP6Uhuf5YGNDwiIZtPQjwxBMlkXfxGx0Y=;
        b=HhHD/ovAOXMDD1t6NGpzi35xECo4vZksjP79p7VUeINCSFnDR94z4Y1H6Y7++GCCtC
         Lqf1CGDwrtKQEvblLdGkkAfJdAq3q6FQYpkYdg4GdfYx845Dt4ZpMb2P2ZdCFDX0mXW2
         3IASF9uqRxZRHjk70+N4Z8faByc30pQ5eGFn/uamtYSYMdqgzDjA+FhQUTqXJzZRZCBs
         DuJ7evogqXbuPPhTe4NU1lcRO8fzT9F7BWpIWCBNbGosFUmEcttS26rQ5spLjAVKgIRK
         GI4wspDZL3UZkOefcHuQN8fO4vIoajQGuavjOJ8xuom18dhTi4nqvmZw9NxwwdkYcTLn
         gdQw==
X-Forwarded-Encrypted: i=1; AKwUvBwBgxmZ2lZCm0gP3oIFg9i0qiuI2KlqNJSqCd3K56kT1PS7MGMrGDnl2iXzn/uImmtSlpMeT1MehIrSNR36Hqco@lists.infradead.org
X-Gm-Message-State: AFuF++kqz/xCy4m4+6Mw+uOodtEHFqfnQNP6dtqbsCB08KUC3oFfrOUg
	Oxp8yXINAB4vH0mTGMnzbC4EHq1Nj2KRvj5hIuwpp5Gh1yWIDeQb1QUItgZ6zxqkulw0HgUeDkI
	Im14bvGU8lmd2RmZ53JvBwW+SYc7i6hnYVb8JYesV1qIYxd6dxe8hsIRo3vVZvECNZqc0GJo8Z5
	evlg==
X-Gm-Gg: AYBFou0M20JVpzoO1Dw7sE1Kue+/GMS4yyvUCwr9bJhnY2iVnWdtfOGu81voIN1R0Z4
	ZsKL9aNqjB7XHvPvBA74bqZEzpd4kO6VppPmdyO5YFP+SGBH+uAuJMKeuvNJvSEZ7dXDod5X8uH
	8qqWUtYU1Ib0xL3xGzhxEZFKI3BOqq6MGt1h2UNUAkSw8kAP0flkNOJLuSXW2n82R0m4mzcdP2K
	de0dYBG1fwViQczuOmDRt2DQGcze5FOmOrkSNKBvsyzlp3w19Mgj51WpIOuRmbnj98P5KsueCeV
	Gfd9pwAxxvWpgHSj6+vYufKZPBQIozKtDBGsp6a8+qsMdi7NKMkH61M1vvVND9gsE3HtncNOPk4
	BodUFx0MaTtmR9w==
X-Received: by 2002:a05:620a:8806:b0:93c:62a9:d5d8 with SMTP id af79cd13be357-93cf19d7e66mr1682679985a.39.1791146575014;
        Sun, 04 Oct 2026 13:42:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8806:b0:93c:62a9:d5d8 with SMTP id af79cd13be357-93cf19d7e66mr1682676285a.39.1791146574410;
        Sun, 04 Oct 2026 13:42:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07a9sm22099856f8f.12.2026.10.04.13.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 13:42:52 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 22:42:02 +0200
Subject: [PATCH net-next v3 2/2] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-stmmac-rx-mb-v3-2-50fa171af9ec@oss.qualcomm.com>
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac2ba4f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3m1Th_6XD4kmAsSG_yQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZNQjdbLeiugCx4DO6t9BhqYYTxGAHIHA
X-Proofpoint-GUID: ZNQjdbLeiugCx4DO6t9BhqYYTxGAHIHA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA4MiBTYWx0ZWRfX5Qn9xIBjQ7HX
 hwfOqLfgZ45TrluCK84qS6XeHGe4ctkvVKUrs33uE30SHdBfCLbKjBNKfpWGsU++5bhK5GEDlvH
 66cXlhxSgahQ5epb0uHx4feYxoddv6FmHZGCpWCU21A28/VHO4WkEiHtO9vz8DFy3RdyReE2cn/
 USam73IBn6QnjFlA9JoPHtVblgksh5F3dyLdokgKH12Fozr3vnPtleL9qfuz4VH33Bh1TbkcP00
 a2eSThKr+ofGw7okIaJm/lZvCRh5dy8U6ccEmIkOP4KQMQeaGvgFmT2BRHJr+vIEZ6oqiGPaJHS
 iLEvlNsPOfW5oMTtmb0uFfaP8RB6kaH3yLKPjXJc5643HBZwICs/QsohDpUqB62aGsmh9L3nwSz
 9hgNb2yprCMlIL++D+CH4VAa6WOHiFMvcxdMGS6+CH8PiWTcE6+iUB5xeQgZ0OwJmV9/XV0yUa1
 Z3Hjf8AA/7j6HDukEAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA4MiBTYWx0ZWRfXxQj8VVtObd/M
 VPWolJzhrVTLj1Vi/NtSke+Ycay6Pi2U/emGYT1JwpZf0en7juuFaH/QUAJItALbNFvNVdCzr75
 xIrwUnM2uqPgp7XPIyNh+zgqkWHUYuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_134257_135034_9BDF641F 
X-CRM114-Status: GOOD (  29.47  )
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

Build the xdp_buff by accumulating all the descriptors that make up a
frame, so the XDP program runs on the full (possibly fragmented) packet
instead of just the first buffer. When the frame is not consumed by the
program, assemble the skb from the head buffer and the collected
fragments via napi_build_skb()/xdp_update_skb_frags_info().

To do so, store the in-progress xdp_buff in rx_q->state instead of the
partially built skb, so the accumulated head and fragments survive a
NAPI poll boundary (mid-frame dma_own or dirty_rx break). The state is
saved only while a frame is in progress and cleared once it completes,
leaving it untouched when the poll does not process anything (e.g.
netpoll invoked with a zero budget).

In addition:
- build the skb head with napi_build_skb() passing xdp->frame_sz, so
  skb_shinfo() lands on the same shared_info the fragments were
  accumulated into;
- attach fragments with xdp_buff_add_frag(), which initializes all the
  shared_info fields and takes care of the pfmemalloc bit;
- release all buffers belonging to a frame when it is dropped on RX
  errors, instead of leaking the ones already attached to the xdp_buff;
- drop the whole frame when the number of fragments exceeds
  MAX_SKB_FRAGS, instead of delivering a truncated one;
- strip the Ethernet FCS from the accumulated xdp_buff with a
  driver-local tail shrink (stmmac_xdp_shrink_tail()) for both linear
  and fragmented frames, instead of trimming the skb or the first
  descriptor length;
- skip zero-length fragments, which can happen for non-first
  descriptors when split-header (SPH) is enabled.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 348 ++++++++++++++--------
 2 files changed, 221 insertions(+), 130 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..0148891dbcb4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -132,7 +132,8 @@ struct stmmac_rx_queue {
 	dma_addr_t dma_rx_phy;
 	unsigned int state_saved;
 	struct {
-		struct sk_buff *skb;
+		struct xdp_buff xdp;
+		unsigned int frames;
 		unsigned int len;
 		unsigned int error;
 	} state;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2d20628ed21..3098fd6df158 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -158,6 +158,9 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue);
 static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
 					  u32 rxmode, u32 chan);
 static void stmmac_vlan_restore(struct stmmac_priv *priv);
+static void stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q,
+				struct xdp_buff *xdp, int sync_len,
+				bool allow_direct);
 
 #ifdef CONFIG_DEBUG_FS
 static const struct net_device_ops stmmac_netdev_ops;
@@ -2180,8 +2183,10 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		dma_free_rx_skbufs(priv, dma_conf, queue);
 
-	dev_kfree_skb_any(rx_q->state.skb);
-	rx_q->state.skb = NULL;
+	if (rx_q->state.frames && !rx_q->xsk_pool) {
+		stmmac_xdp_put_buff(rx_q, &rx_q->state.xdp, -1, false);
+		rx_q->state.frames = 0;
+	}
 	rx_q->state_saved = false;
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
@@ -5758,6 +5763,118 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	return failure ? limit : (int)count;
 }
 
+static void
+stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff *xdp,
+		    int sync_len, bool allow_direct)
+{
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
+	int i;
+
+	if (likely(!xdp_buff_has_frags(xdp)))
+		goto out;
+
+	for (i = 0; i < sinfo->nr_frags; i++)
+		page_pool_put_full_page(rx_q->page_pool,
+					skb_frag_page(&sinfo->frags[i]),
+					allow_direct);
+out:
+	page_pool_put_page(rx_q->page_pool, virt_to_head_page(xdp->data),
+			   sync_len, allow_direct);
+}
+
+static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
+{
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
+	u32 metasize = xdp->data - xdp->data_meta;
+	struct sk_buff *skb;
+	u8 num_frags = 0;
+
+	if (unlikely(xdp_buff_has_frags(xdp)))
+		num_frags = sinfo->nr_frags;
+
+	skb = napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
+	if (!skb)
+		return NULL;
+
+	skb_mark_for_recycle(skb);
+	skb_reserve(skb, xdp->data - xdp->data_hard_start);
+	skb_put(skb, xdp->data_end - xdp->data);
+	if (metasize)
+		skb_metadata_set(skb, metasize);
+
+	if (unlikely(xdp_buff_has_frags(xdp)))
+		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
+					  num_frags * xdp->frame_sz,
+					  xdp_buff_get_skb_flags(xdp));
+	return skb;
+}
+
+static bool stmmac_build_xdp_frags(struct stmmac_priv *priv,
+				   struct stmmac_rx_queue *rx_q,
+				   unsigned int len, struct page *page,
+				   unsigned int offset,
+				   enum dma_data_direction dma_dir,
+				   struct xdp_buff *xdp)
+{
+	dma_addr_t dma_addr = page_pool_get_dma_addr(page) + offset;
+
+	dma_sync_single_for_cpu(priv->device, dma_addr, len, dma_dir);
+	if (!xdp_buff_add_frag(xdp, page_to_netmem(page), offset, len,
+			       xdp->frame_sz)) {
+		page_pool_put_full_page(rx_q->page_pool, page, true);
+		return false;
+	}
+
+	return true;
+}
+
+static int stmmac_xdp_shrink_tail(struct stmmac_rx_queue *rx_q,
+				  struct xdp_buff *xdp, int offset)
+{
+	struct skb_shared_info *sinfo;
+	int i;
+
+	if (unlikely(offset < 0 ||
+		     offset > (int)xdp_get_buff_len(xdp) - ETH_HLEN))
+		return -EINVAL;
+
+	if (likely(!xdp_buff_has_frags(xdp))) {
+		xdp->data_end -= offset;
+		return 0;
+	}
+
+	sinfo = xdp_get_shared_info_from_buff(xdp);
+	for (i = sinfo->nr_frags - 1; i >= 0 && offset > 0; i--) {
+		skb_frag_t *frag = &sinfo->frags[i];
+		int delta = min_t(int, offset, skb_frag_size(frag));
+
+		if (delta == skb_frag_size(frag)) {
+			/* The whole frag is consumed by the strip: return it
+			 * to the page pool right away. Its ring slot still
+			 * carries the page DMA address until stmmac_rx_refill()
+			 * re-arms it at the end of the NAPI poll. This is
+			 * safe because HW cannot touch the slot until then.
+			 */
+			page_pool_put_full_page(rx_q->page_pool,
+						skb_frag_page(frag), true);
+			sinfo->nr_frags--;
+		} else {
+			skb_frag_size_sub(frag, delta);
+		}
+
+		sinfo->xdp_frags_size -= delta;
+		offset -= delta;
+	}
+
+	if (unlikely(!sinfo->nr_frags)) {
+		xdp_buff_clear_frags_flag(xdp);
+		xdp_buff_clear_frag_pfmemalloc(xdp);
+		xdp->data_end -= offset;
+	}
+
+	return 0;
+}
+
 /**
  * stmmac_rx - manage the receive process
  * @priv: driver private structure
@@ -5771,21 +5888,20 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	u32 rx_errors = 0, rx_dropped = 0, rx_bytes = 0, rx_packets = 0;
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
+	unsigned int frames = 0, next_entry = rx_q->cur_rx;
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int count = 0, error = 0, len = 0;
-	unsigned int next_entry = rx_q->cur_rx;
 	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
 	int coe = priv->hw->rx_csum;
-	unsigned int desc_size;
-	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
-	bool fcs_stripped = false;
+	unsigned int desc_size;
 	int xdp_status = 0;
 	int bufsz;
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
-	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
+	bufsz = rx_q->napi_skb_frag_size;
+	ctx.priv = priv;
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
@@ -5798,23 +5914,25 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	}
 
 	if (rx_q->state_saved) {
-		skb = rx_q->state.skb;
+		ctx.xdp = rx_q->state.xdp;
 		error = rx_q->state.error;
+		frames = rx_q->state.frames;
 		len = rx_q->state.len;
-		rx_q->state.skb = NULL;
 		rx_q->state_saved = false;
+		rx_q->state.frames = 0;
 	}
 
 	while (count < limit) {
 		unsigned int buf1_len = 0, buf2_len = 0;
+		unsigned int pre_len, sync_len;
 		enum pkt_hash_types hash_type;
 		struct stmmac_rx_buffer *buf;
 		struct dma_desc *np, *p;
+		struct sk_buff *skb;
 		int entry, status;
 		u32 hash;
 
 		if (!in_progress) {
-			skb = NULL;
 			error = 0;
 			len = 0;
 		}
@@ -5851,20 +5969,24 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
-			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
-			buf->page = NULL;
 			error = 1;
 			if (!priv->hwts_rx_en)
 				rx_errors++;
 		}
 
-		if (unlikely(error && (status & rx_not_ls)))
-			goto read_again;
 		if (unlikely(error)) {
-			dev_kfree_skb(skb);
-			skb = NULL;
-			count++;
-			continue;
+			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
+			buf->page = NULL;
+			if (buf->sec_page) {
+				page_pool_put_page(rx_q->page_pool,
+						   buf->sec_page, 0, true);
+				buf->sec_page = NULL;
+			}
+
+			if (status & rx_not_ls)
+				goto read_again;
+
+			goto error_free_frag;
 		}
 
 		/* Buffer is good. Go on. */
@@ -5874,135 +5996,94 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
 		len += buf2_len;
 
-		/* ACS is disabled; strip manually. */
-		if (likely(!(status & rx_not_ls)))
-			len -= ETH_FCS_LEN;
-
-		if (!skb) {
-			unsigned int pre_len, sync_len;
-
-			/* Each frame starts here: reset the FCS handling */
-			fcs_stripped = false;
-
+		if (!frames) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
 			net_prefetch(page_address(buf->page) +
 				     buf->page_offset);
 
-			if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
-				buf1_len -= ETH_FCS_LEN;
-				fcs_stripped = true;
-			}
-
 			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
-
-			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
-				  buf->page_offset;
-
-			ctx.priv = priv;
-			ctx.desc = p;
-			ctx.ndesc = np;
-
-			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
-			/* Due xdp_adjust_tail: DMA sync for_device
-			 * cover max len CPU touch
-			 */
-			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
-				   buf->page_offset;
-			sync_len = max(sync_len, pre_len);
-
-			/* For Not XDP_PASS verdict */
-			if (IS_ERR(skb)) {
-				unsigned int xdp_res = -PTR_ERR(skb);
-
-				if (xdp_res & STMMAC_XDP_CONSUMED) {
-					page_pool_put_page(rx_q->page_pool,
-							   virt_to_head_page(ctx.xdp.data),
-							   sync_len, true);
-					buf->page = NULL;
-					rx_dropped++;
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
-				} else if (xdp_res & (STMMAC_XDP_TX |
-						      STMMAC_XDP_REDIRECT)) {
-					xdp_status |= xdp_res;
-					buf->page = NULL;
-					skb = NULL;
-					count++;
-					continue;
-				}
-			}
-		}
-
-		if (!skb) {
-			unsigned int head_pad_len;
-
-			/* XDP program may expand or reduce tail */
-			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
-
-			skb = napi_build_skb(page_address(buf->page),
-					     rx_q->napi_skb_frag_size);
-			if (!skb) {
-				page_pool_recycle_direct(rx_q->page_pool,
-							 buf->page);
-				buf->page = NULL;
-				rx_dropped++;
-				count++;
-				goto drain_data;
-			}
-
-			/* XDP program may adjust header */
-			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
-			skb_reserve(skb, head_pad_len);
-			skb_put(skb, buf1_len);
-			skb_mark_for_recycle(skb);
 			buf->page = NULL;
 		} else if (buf1_len) {
-			dma_sync_single_for_cpu(priv->device, buf->addr,
-						buf1_len, dma_dir);
-			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
-					buf->page, buf->page_offset, buf1_len,
-					priv->dma_conf.dma_buf_sz);
+			if (!stmmac_build_xdp_frags(priv, rx_q, buf1_len,
+						    buf->page,
+						    buf->page_offset,
+						    dma_dir, &ctx.xdp)) {
+				if (!error)
+					rx_dropped++;
+				error = 1;
+			}
 			buf->page = NULL;
 		}
 
 		if (buf2_len) {
-			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
-						buf2_len, dma_dir);
-			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
-					buf->sec_page, 0, buf2_len,
-					priv->dma_conf.dma_buf_sz);
+			if (!stmmac_build_xdp_frags(priv, rx_q, buf2_len,
+						    buf->sec_page, 0,
+						    dma_dir, &ctx.xdp)) {
+				if (!error)
+					rx_dropped++;
+				error = 1;
+			}
 			buf->sec_page = NULL;
 		}
+		frames++;
 
-drain_data:
 		if (likely(status & rx_not_ls))
 			goto read_again;
-		if (!skb)
-			continue;
 
-		/* Got entire packet into SKB. Finish it. */
+		/* ACS is disabled; strip manually. */
+		len -= ETH_FCS_LEN;
+		if (stmmac_xdp_shrink_tail(rx_q, &ctx.xdp, ETH_FCS_LEN)) {
+			if (!error)
+				rx_dropped++;
+			error = 1;
+		}
 
-		/* Remove FCS if needed */
-		if (!fcs_stripped && pskb_trim(skb, len)) {
-			dev_kfree_skb_any(skb);
-			skb = NULL;
-			rx_dropped++;
+		if (unlikely(error))
+			goto error_free_frag;
+
+		pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start;
+
+		ctx.desc = p;
+		ctx.ndesc = np;
+
+		skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
+		/* Due xdp_adjust_tail: DMA sync for_device
+		 * cover max len CPU touch
+		 */
+		sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start;
+		sync_len = max(sync_len, pre_len);
+
+		/* For Not XDP_PASS verdict */
+		if (IS_ERR(skb)) {
+			unsigned int xdp_res = -PTR_ERR(skb);
+
+			if (xdp_res & STMMAC_XDP_CONSUMED) {
+				stmmac_xdp_put_buff(rx_q, &ctx.xdp, sync_len,
+						    true);
+				rx_dropped++;
+			} else if (xdp_res & (STMMAC_XDP_TX |
+					      STMMAC_XDP_REDIRECT)) {
+				xdp_status |= xdp_res;
+			}
+
+			/* Clear skb as it was set as status by
+			 * the XDP program
+			 */
+			frames = 0;
 			count++;
 			continue;
 		}
 
+		skb = stmmac_build_skb(&ctx.xdp);
+		if (!skb) {
+			rx_dropped++;
+			goto error_free_frag;
+		}
+
+		/* Got entire packet into SKB. Finish it. */
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
 
 		if (priv->hw->hw_vlan_en)
@@ -6025,18 +6106,24 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
-		skb = NULL;
-
 		rx_packets++;
 		rx_bytes += len;
+		frames = 0;
+		count++;
+		continue;
+error_free_frag:
+		if (frames)
+			stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1, true);
+		frames = 0;
 		count++;
 	}
 
-	if (in_progress || skb) {
-		rx_q->state_saved = true;
-		rx_q->state.skb = skb;
+	if (in_progress || frames) {
+		rx_q->state.xdp = ctx.xdp;
+		rx_q->state.frames = frames;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
+		rx_q->state_saved = true;
 	}
 
 	stmmac_finalize_xdp_rx(priv, xdp_status);
@@ -8352,9 +8439,12 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 
-	dev_kfree_skb_any(rx_q->state.skb);
-	rx_q->state.skb = NULL;
+	if (rx_q->state.frames && !rx_q->xsk_pool) {
+		stmmac_xdp_put_buff(rx_q, &rx_q->state.xdp, -1, false);
+		rx_q->state.frames = 0;
+	}
 	rx_q->state_saved = false;
+
 	rx_q->cur_rx = 0;
 	rx_q->dirty_rx = 0;
 }

-- 
2.55.0


