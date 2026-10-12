Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88472CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avi+XkrV3WTbZAOaZMmBOeG+lzogrfppC5qF3amD0t4=; b=iVSgmbWSoDkZtrzRgiB+4BgB+3
	7gRz/seinDbO05VPMfkXs0VpcSbvygtSp6lmrD5r9RX7q2W+Itj4DPt+vFO+9TXkWWu1lraYboBeO
	rty8vWOKMji+aC7y0ysMlCql8SlauUZCoQN+iW23c/591TRyExzX0eLYfzmXvxHN31Fkbd9L7S/zE
	VHU+KSSe8YmudMBhw/sORnWgB0iGdYhrskyegNji2wrbOJRKg8SFaTpMkDJPYqr+s/kUib7tm5nnh
	ReKDMmQevFoQRFiS3qEukq+UP+/nYqRlomhdEQX2CfQEnXmKELE3MxuXwYjxNkxqkxYvuDwH1tALG
	WyOPUSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8y-0000000B0XC-1mNr;
	Mon, 12 Oct 2026 16:44:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8o-0000000B0Pd-2Yt8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:44:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf1IC2175397
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avi+XkrV3WTbZAOaZMmBOeG+lzogrfppC5qF3amD0t4=; b=kzPAHmLutDUCWOIo
	TeKbEZ26MR3CLzAgFhnsG/ta5bEZzMI0YqJwwsHqoCABr7wn+WdxDDZYDYuWIdnv
	0f840MWLQuxHyrW3M0dMLOeLQQ2KuxEkDLuIdmBIvdAEK8Q6i107LW6bzw96leFH
	R8Gl77woPwRsCHIiKETQHAuSrrz5T6L62W0mDyfIAwcHNqJU3fqe8FkqsenXqEFf
	y+KyHyqQU94ZGvztBjCOO7qu2PCrK9ZSr7TSjILjuen1B9zN0FyBnKY4qsVMS4t1
	IKpTIL7TgavlCEFW6ecE2ptyLnKbnnR06/Xw47L3w/NHgGuhW9ozck63pO9g4NXQ
	kNTcQA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1u5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106fce784dso57129366d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791823485; x=1792428285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avi+XkrV3WTbZAOaZMmBOeG+lzogrfppC5qF3amD0t4=;
        b=O2pUqXzZKgzyEA7nM4+NvST1pcJXHrcNNi1f6oX4K2ZqbXw3rS7yB/GuWRvWdFidkA
         1tXNe9jXBBGYmoC5Ukhuqvy/whnzQOFuqK+XuA2KWHNImmEeMyeXZJX9SNUsE12eWiGn
         GCcTY0bORoDQmQDG9LjSLgIxvSU2FKlVok6+/9qz5PGGFCt9pD83SmsxDr0APxRj6ZEL
         tezcCCGOTstgqw42i+/NuQR6B784odNBwiki4+S/L1/GMc5SZ2PHFTB3BuOuTwg9lxOg
         2p8rY42ndc4lJGS4vryXSQBoLy0ExmAf+8G4UVHBa8Be8hg9AzSQKvRJzM7zhWp6JnLc
         Z0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823485; x=1792428285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avi+XkrV3WTbZAOaZMmBOeG+lzogrfppC5qF3amD0t4=;
        b=tJ5qXxELX6D0FTvu50MG6K7EBzWlB+PtdNiR0+ygZW6zOVhKZtJC/zPzWX5J6jEpS5
         k8TvJQrB/xK+/Q2ayHMwv0sPotU0gecXoBhC9dp/vaJKA9+nxPO8IeorkV7VCQaki1eF
         HziGCtpjY1dTggzKldO3W+mgDP9XEM2pTz+NQoWrB9mF/zoy1Ds+Ty6Gc4/7VQT7+cGz
         tm91fH/OwQnlM3ZB77FTnuQtronf05hojeY0tDEjPVKWwQdiOhQ22sSiCHn0WDY9hKID
         y6iPyQ8DHJRjXl0QS09Xht8bY8D8WvI+JwXIe3XpR1NeNeYrmcvoms3lHSE29U6V/Ikn
         A7Bg==
X-Forwarded-Encrypted: i=1; AKwUvByyU3XB/F9Fx7NZtttq2CavGctBbw0CfzeYwQUBxwX8Yc3+QjDtTqaMgiB2OzNmFy7asjUWq5Xcb4jZLEgWyJ2W@lists.infradead.org
X-Gm-Message-State: AFq9FYKIMnIXaccog9Srd5yY7jQSM5UEwh1spxstoCCpEeXAOJY8kDSm
	PWNOuXpELhwRqa/nvOen+kqGRUreYJu3r5XncJvjwRyNEFzFi2E5smmiQPqfOjyiP+wHd3pEqzA
	n1vDtBm581Z7dlSAYutFBukYuTSzhEKjxXKWgdZJZ+By7trfymDsXjMEFvSXyDsT106RPmRDoUg
	6E3Q==
X-Gm-Gg: AYBFou0d1HEmht2sgea+9XV/Fr0V5f8KSRUXFklpcx1DW2iV4oM3UabUv/mIHX/h6TX
	zx2FW1AsxdVpg4870Z/jWqIPNyX7fzdXiV6j3tFJR2nGgveLRXIyVr1uRRiepBMwLaO8Y1GkFbd
	k7c8lYmqn7Sh4MFJ+b8hhH8h8AL08BkQu2JQedNZvQ36tGy38lY9lp0bGqQUMtzhgqLhWtOxw61
	NXdc/q6S6K1vBVLw4zaX4xtYckbYIPNQYi9H6wcrgNge0rEi2unLiHRnxRC2n1Og3hrDP6RrrQ8
	Ws2DfZ0lvZy61qyS0nTHIIcemU9Rg09oZcpelTe4EascNhoj2e4mnTpzQBGYlz0Og71QtXdiq9l
	cAP0L88MQZ8+wwA==
X-Received: by 2002:a05:620a:198b:b0:92e:76a1:96cd with SMTP id af79cd13be357-93ebd1e041emr1762532985a.13.1791823484963;
        Mon, 12 Oct 2026 09:44:44 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:92e:76a1:96cd with SMTP id af79cd13be357-93ebd1e041emr1762527385a.13.1791823484302;
        Mon, 12 Oct 2026 09:44:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc506asm326879f8f.47.2026.10.12.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:44:42 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:44:25 +0200
Subject: [PATCH net-next v6 3/4] net: stmmac: drop multi-buffer frames in
 XDP mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-stmmac-rx-mb-v6-3-2225050915c1@oss.qualcomm.com>
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
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfXxBdEATogryVH
 cmFdrErru2It+0Ueh0TUPb5FskHYPzPqWRMLzv41nQC6IJNR+Skq21s2r/nK8BgQ3oFzLernVat
 s/M1d+OpuXDeReS3ZUXQMX1dRqhcKdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX7IR6/EmGIk70
 Acd+nnRWp8zi0pHXgF1S9KWX9L3gT1Z3+XCqmxnG46SQzJNsMkvb2LoGDjUzSNqPrINpIx0aetc
 5kRJHDjaFiTpLtpZxi8xJ9j/fe4VQjvl4DHHbqx7cBCBOrYYPV/epYdAtnGucEF5UU6G+5l27gP
 n9vOv4n3EPdwAEfvJWP4wXkbpzBJn3GguHSwCMfc+ayX64ymNvlw9ov2CBdpaqrCa/mZ0TtJS5z
 1RLvP+hgPsX4D4AifTCM/gUIjdL5q5GKgtBrfvS2d0Ku6U0vK9I1Ecj1yf1/nXxp1fdgjYDsQ6H
 FaLrQxN2X9G/2HPuqmZj00ACcfti5uA3iYdfG5O+SQtAy8XClxb+fj2AJtWvVOrfQUGnpHGRk4D
 zRc20Rn9S9ZuuFfERxAaMbvR/Yu3mQ9gxZbHvhvP1ssb7sNy2x1B+PRyMG1tSnYKhBQadxkAj3A
 3zeEwfYmbBOA8GncjiQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acd0e7e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DrIia4gTWQP6Z4KYkkQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 3LK2OdkqZjn-9TYybJ_HZGymnzT1Ax5A
X-Proofpoint-GUID: 3LK2OdkqZjn-9TYybJ_HZGymnzT1Ax5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094446_681967_B09F0663 
X-CRM114-Status: GOOD (  22.73  )
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

stmmac_rx() runs the XDP program once per descriptor buffer and uses
skb == NULL as the only marker for the start of a frame. A frame larger
than one buffer is split by the hardware across several descriptors;
GMAC4 enables jumbo frames unconditionally (GMAC_CONFIG_JE in
GMAC_CORE_INIT), so an on-link peer can deliver such a frame even when
the interface MTU is left at 1500.

When an XDP verdict ends a non-last descriptor, skb is cleared and the
next descriptor of the same hardware frame is parsed as a new frame.
For XDP_CONSUMED this happens via read_again with len preserved, so
stmmac_rx_buf1_len() then returns min(dma_buf_sz, plen - len) for the
last descriptor, which can be as small as 0-3 bytes. buf1_len -=
ETH_FCS_LEN underflows and xdp_prepare_buff() puts data_end far past
data; on XDP_PASS this produces an skb whose length is close to 4G that
reaches the network stack (skb->tail and skb->len are 32-bit and wrap
below skb->end, so skb_over_panic() does not fire). A 4+ byte tail is
instead offered to the XDP program and delivered as a standalone
mid-payload Ethernet frame on XDP_PASS. XDP_TX/XDP_REDIRECT instead
falls through to the next iteration, resetting the running length, so
the tail is re-parsed as a full-size new frame.

XDP does not support scatter-gather frames until the multi-buffer
rework, so drop the whole frame instead: mark it as errored as soon as
a non-last descriptor is seen while an XDP program is attached, drain
and release every descriptor - including the last - and account the
frame once in rx_dropped. Removing the re-parse lets both XDP verdict
branches simply complete the packet via next.

Note: the subsequent "net: stmmac: rework stmmac_rx to support XDP rx
multi-buff" accumulates the whole frame into a single xdp_buff and
supersedes this patch; the fix is kept so the net portion of the series
stands on its own.

Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 426bb68c9bbc..8c08d44fdbd3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5893,18 +5893,24 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
-		if (unlikely(status == discard_frame)) {
-			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
-			buf->page = NULL;
+
+		if (unlikely(!error && status == discard_frame)) {
 			error = 1;
 			if (!priv->hwts_rx_en)
 				rx_errors++;
 		}
 
-		if (unlikely(error && (status & rx_not_ls)))
-			goto read_again;
+		/* We do not support SG in XDP mode */
+		if (unlikely(!error && (status & rx_not_ls) &&
+			     stmmac_xdp_is_enabled(priv))) {
+			rx_dropped++;
+			error = 1;
+		}
 
 		if (unlikely(error)) {
+			if (status & rx_not_ls)
+				goto read_again;
+
 			dev_kfree_skb(skb);
 			goto next;
 		}
@@ -5965,17 +5971,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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

-- 
2.56.0


