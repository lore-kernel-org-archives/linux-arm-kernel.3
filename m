Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D9CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwwFqusyj3W8mMv8gm9OleasHbtMZqzOjU08z4jRKqw=; b=fLr+dryaRRUZDUYt8e4k7HgWkz
	spSQSeUe46FRDyTFTKvdDNQ2bgO3/tTFn/F5RGNqFbh/TP1H4bk4dVAcLmvJ7B3xBDbs1A38siuD4
	TRgz4nQqy87+Ptu0aet+jLLoSOKAmmj1juC++kWaLvOaqp+WftRMW4nbkj0JXH9f8k9KWpJf9H6bX
	kpRzdzJ78Hsq7ofoxDJOdoxyIVWivKtZyNuGpS4bOMdhrjBxzwimky7vnyb7BRN+nia5xNVu1i5Qi
	vPWZk7rrHtN25y/ynoZYOIlsPLBbCefqNJWZBgkCxisCjZ+ZVMUkyqAthfBbNS+TI3lR6YcPInCqb
	OrI0dzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7oY-000000063PG-2ITP;
	Fri, 09 Oct 2026 10:26:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7oT-000000063MU-1Vyi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:26:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHBY230902
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 10:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwwFqusyj3W8mMv8gm9OleasHbtMZqzOjU08z4jRKqw=; b=WH5chU5YRSTtrmzY
	Gn/J+q8jTB5lVrxY3FKRpZAZBt3KqnI2ZZpb4VKoTc+E3HbBC7kG1e/Y3jUKkBKA
	r0nFrYUTwrOLHHsWGSFBqoM7vxSPH6jFy93L7JvKc00Rbnf3D4OBAiLpOsiO3AkM
	nh4Wrtae1aCaWWaPF46KpqNkyW/SwdxbcZqN0k65NwQOdMkJPuapoMqYOzN9LhnO
	9hmg99wTtvE6hRnOgusqjORSHiFGTyjeNB9dmM2HIRc/q+fJJf3BORK0B5xN/5LZ
	tcq9F1KmdS+0kZShiF7QhmcfKKniXDwopl2dHKSTsYbQbWQnz8pGTID+tHTWgbTo
	xb9JeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu33fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:26:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so1706517285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541611; x=1792146411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwwFqusyj3W8mMv8gm9OleasHbtMZqzOjU08z4jRKqw=;
        b=c/epoXJ1HnQTlOV3H1r6ddzBtcnLXEggISkWsoHrw+2u2Js0v1Ktncvf2FdxSgsMj/
         B8YovVWN32W9w/8+fs8c7DsqT6urEwRt/RG7pzARV7uNtu7f4z72CpIlMTjOFJ+GuZXk
         VGm6tw6bjVoEyIqJaOooSoY8VnPTW7hxokVU/U9q3OQDPUySzLvv3iRKVk1rE8jjViR1
         3MtIRTTba+yN2NBu68nadbjaMYFAe+3L4IuIiqjrIidFJhpsPUE6zsZvN+EITQbYoH9X
         yL03ojNEhP4dRtVw3V/6XrZLWLDfAAjYOwhPFBsXhGxYFsglcYAWYRpqLWUlB+h1thsB
         p+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541611; x=1792146411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwwFqusyj3W8mMv8gm9OleasHbtMZqzOjU08z4jRKqw=;
        b=2XKl8TL2CHC3486cD3CzfF96gX6HSVkCXDccogpb6tIr8nVKODoEfchGsEb64NyqBc
         BVpNTsRzUax91OSxZdQBVyUYtsnVGSicorcrZXfLHknjF8AQC53MJMLfbSmVW8tSZJ7V
         7Mlv+FCwsWZ1GxOAk9hOSjrx028ga7Aodw3QTVApR1mtzY/oD1weQPuXW+IxX62Lrf84
         qzBmHCa1awkOtqygCdF37qlpqYS2dZDa3/NXX+UDTu2BamKXSJ+7iGLWAlF4s9Tz/CxA
         MJ4pesp3gNmnTpVwEsS8pJGverRbdumiOVHkWWxLEm/VOVYJt765tcF+w5s8s4hnbbir
         7NDw==
X-Forwarded-Encrypted: i=1; AKwUvBwCoLxpaE5VzC7BAxdsXhH/hLXDS4/ENALDH6z01QefmZpQH+OLaU3QrQSgjiarnfw+6PXVh+/9RK1L0CAsrbtg@lists.infradead.org
X-Gm-Message-State: AFuF++lHLhvHjNObDJ1MUdDtEOtOZewMlx2u91a71japdMPO0WyFjN4s
	lyzYo7sZb/H94oEv6qI/QsU79ejBLuSZuYuuwiSwugPsiv3A1Tj5Me5Z+8Ymrz1hGQutrGELb8K
	51Ae/y1FnCkOanM/ChK7XKPvIY2elBXd4YcMV7fDlm2xJcPP4KyxSl6wMpvIU6lIvqjt3nlDYUd
	jm4Q==
X-Gm-Gg: AYBFou3IEyOf9cqRnHDIHdB8TvgQVlJMzBXCdoZh+2P7G7W7iZfPkuaHMm3u+dpQrzc
	7UvhoxLXkcHYd7Q4yVQVa4uNyIN5xHScZC9Ogsyc56efivyCmqwccZ/b6ClWz/aUD/cACPXPtbC
	AwKsFpRApE9bFf236LrBjHZbBMnhmO3FpGgo0Ees89B9nLiBcUu9s8/MCd9u4/lQSbgbUIF6L9e
	dVY1K/QSC4XIvk9QTX9xFcZSRJvKWOYWGnU1I44mbcL4iOVW0iyyuS8AhUF+liYEXiWec8ap2aX
	N8nsBnS09YLpG+tOlYUogayg4HLG+U4AV6iPRPaotwGlB04vTCig27kiP7urGQbJYJSmWKV133k
	FI46vbeVTzPLZWg==
X-Received: by 2002:a05:620a:6602:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-93ec12d1001mr97217385a.68.1791541611125;
        Fri, 09 Oct 2026 03:26:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-93ec12d1001mr97210885a.68.1791541610340;
        Fri, 09 Oct 2026 03:26:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm70784135e9.2.2026.10.09.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:26:49 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:26:32 +0200
Subject: [PATCH net-next v5 2/3] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-stmmac-rx-mb-v5-2-c38fa4eaa138@oss.qualcomm.com>
References: <20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com>
In-Reply-To: <20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX7hpdHVnCRF74
 2OFLtLCr5V5FPYOXtx53/fstPl9XSE4isAhRRL8Etid5r2uz26KUGHb+VI36k17OoX3iV+gwCxp
 wdX+EMsN50MOj5TEW345ct0XGGirl0a5A6xUkQ18dckYFZ16ZI5hA0aeVa4QIDV1vwjGTYNJqQK
 nvuOqejRovaPWZYe6fPELpDJDSu0pgAN564fOHtyWFZCQPyI1hwqzstqg/FN1D1gYnME+979lu+
 YOnfgG2hm54Jkgt95SKak/a2m4udy5Cbq12F+5zxWgbqh9LlAauGtb3hjvgpQqkJk1bmfmz9kWv
 nwyy0f1X9950K35OdOTSzvBXnlZmQmJ4WeqqtUVtFzK9m2WJmYLlFoicQyc0/PY41FZe9SFGg7X
 iTZuZQxC3HVn/58PF91Lj4aNo1JyzAQXgyT8b7ZyJyKkYKGbpoimwD4Q9O6YOU27p0UVYJCrllu
 KCergn32PSjGEkUUkng==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8c16c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=flYnR0XiPPvn2sS5u-IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: C3hf_e4knZbAiMuk3i9bBBuEH_ysRHuI
X-Proofpoint-ORIG-GUID: C3hf_e4knZbAiMuk3i9bBBuEH_ysRHuI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfXyPf8pYbBeMvs
 dhPSG+2bjKboUC8EOo5McTo1JT9U4sfGBnxvO+HpeyQy8cO7u5IQPbmjbWvNuIrPwZ4icwLl85h
 75gWY4dFElQ6qekZv9p5LUqBj0lc60c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_032653_537824_A28A11FB 
X-CRM114-Status: GOOD (  30.45  )
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

Note that XDP still rejects an MTU larger than ETH_DATA_LEN
(stmmac_xdp_set_prog(), stmmac_change_mtu()) and disables SPH, so an
ordinary frame fits in a single buffer. This path is therefore exercised
by frames that do span several descriptors (for example jumbo frames the
MAC admits through its jumbo-enable bit) and is groundwork for extending
XDP to jumbo/SPH; it does not enable XDP jumbo support by itself.

For those multi-descriptor frames the old code was buggy as well: it ran
the XDP program once per descriptor buffer, so for a multi-descriptor
frame the program was also invoked on continuation buffers holding
mid-frame payload. It also subtracted ETH_FCS_LEN from the first buffer
even when it was not the last descriptor (its second buffer empty),
dropping four bytes from the middle of the frame while marking the FCS as
already stripped and skipping the final pskb_trim(). Accumulating the
whole frame before running XDP fixes both.

To do so, store the in-progress xdp_buff in rx_q->state instead of the
partially built skb, so the accumulated head and fragments survive a
NAPI poll boundary (mid-frame dma_own or dirty_rx break). The state is
saved only while a frame is in progress and cleared once it completes,
leaving it untouched when the poll does not process anything (e.g.
netpoll invoked with a zero budget).

In addition:
- advertise NETDEV_XDP_ACT_RX_SG, since the RX path can now deliver
  non-linear buffers to XDP;
- drop multi-buffer frames when the attached program was not loaded with
  BPF_F_XDP_HAS_FRAGS, since a single-buffer program must not be handed a
  non-linear xdp_buff;
- build the skb head with napi_build_skb() passing xdp->frame_sz, so
  skb_shinfo() lands on the same shared_info the fragments were
  accumulated into;
- carry the XDP metadata written with bpf_xdp_adjust_meta() into the skb
  via skb_metadata_set(), so it is no longer dropped and TC/BPF programs
  can read it through data_meta;
- attach fragments with xdp_buff_add_frag(), which initializes all the
  shared_info fields and takes care of the pfmemalloc bit;
- release the buffers collected in the xdp_buff when a frame is dropped
  on RX errors; the previous code relied on dev_kfree_skb() recycling the
  skb frags, which no longer applies now that the head and fragments live
  in an xdp_buff rather than a partially built skb;
- drop the whole frame when it would exceed MAX_SKB_FRAGS, where the
  previous skb_add_rx_frag() calls were unbounded;
- strip the Ethernet FCS from the accumulated xdp_buff with a
  driver-local tail shrink (stmmac_xdp_shrink_tail()) for both linear
  and fragmented frames, instead of trimming the skb or the first
  descriptor length.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 346 ++++++++++++++--------
 2 files changed, 222 insertions(+), 127 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 9278378407e8..63020e8edd8a 100644
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
index 6128e6d9504c..be2cba8fcbc6 100644
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
@@ -5460,8 +5465,8 @@ static int __stmmac_xdp_run_prog(struct stmmac_priv *priv,
 static struct sk_buff *stmmac_xdp_run_prog(struct stmmac_priv *priv,
 					   struct xdp_buff *xdp)
 {
+	int res = STMMAC_XDP_CONSUMED;
 	struct bpf_prog *prog;
-	int res;
 
 	prog = READ_ONCE(priv->xdp_prog);
 	if (!prog) {
@@ -5469,7 +5474,8 @@ static struct sk_buff *stmmac_xdp_run_prog(struct stmmac_priv *priv,
 		goto out;
 	}
 
-	res = __stmmac_xdp_run_prog(priv, prog, xdp);
+	if (likely(!xdp_buff_has_frags(xdp) || prog->aux->xdp_has_frags))
+		res = __stmmac_xdp_run_prog(priv, prog, xdp);
 out:
 	return ERR_PTR(-res);
 }
@@ -5798,6 +5804,118 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5811,21 +5929,20 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5838,23 +5955,25 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5891,19 +6010,24 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
-
 		if (unlikely(error)) {
-			dev_kfree_skb(skb);
-			goto next;
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
@@ -5913,131 +6037,89 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
-					if (unlikely((status & rx_not_ls))) {
-						skb = NULL;
-						goto read_again;
-					}
-					goto next;
-				} else if (xdp_res & (STMMAC_XDP_TX |
-						      STMMAC_XDP_REDIRECT)) {
-					xdp_status |= xdp_res;
-					buf->page = NULL;
-
-					if (unlikely((status & rx_not_ls))) {
-						skb = NULL;
-						goto read_again;
-					}
-					goto next;
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
+
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
 
-		/* Remove FCS if needed */
-		if (!fcs_stripped && pskb_trim(skb, len)) {
-			dev_kfree_skb_any(skb);
-			rx_dropped++;
 			goto next;
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
@@ -6064,15 +6146,23 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		rx_bytes += len;
 next:
 		in_progress = false;
-		skb = NULL;
+		frames = 0;
+		count++;
+		continue;
+error_free_frag:
+		if (frames)
+			stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1, true);
+		in_progress = false;
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
@@ -8068,6 +8158,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
 			    NETIF_F_RXCSUM;
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
+			     NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
 	ret = stmmac_tc_init(priv, priv);
@@ -8388,9 +8479,12 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
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
2.56.0


