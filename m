Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD9DCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+UM7fuqdRbDcSq7RdvBDoC9dhPLseEVaJ2k9PcLRJ4=; b=lG+7z0Yp6UGiTXGk61NGcqU+q8
	DX+ZJ1I0Gl0KfH8cPrEYw6pVMZ+vljV1V9eImKIv0bPvyyVsGGCfFCf6TUjNAPA6Waxq/gFBMH5Hw
	a9iePVR3DKHmtkzP5ojwJUQmZZsyRq9smkmul13nL3v8fcBMOkrDsSP1gOOHHS5V1mAm/Vh6l26Kv
	aX/ki0pd2c+eJawwvqIfGelROof/R8D93tC0dyJ9Q1EgQNRh/aeaij+mljdE46PPHFITd8wO29FHr
	1a4txBP2xQKcmQjwpgZ59+Kw6EsGDs49UqwFvPc+kQfasvS6pfrdLelQkW/R/j+KyiPgMm5UDMhVa
	j2NZvmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD3m-00000008MJ5-0CJv;
	Thu, 01 Oct 2026 09:26:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD3j-00000008MHE-0MCh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:26:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfex1511891
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 09:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+UM7fuqdRbDcSq7RdvBDoC9dhPLseEVaJ2k9PcLRJ4=; b=eFbw+y7pfdUVWcyu
	GTpkgoNYYoHAQRm7YWSXlU6iuQSLLe5cwwKC7KD42FVqm3oxvr8ddP0qeSd+mZuX
	SJwz+qtnW6zxtMf2ep+Cc3HykeFT66a5E3utJaAkY8wCQ3zXgGjOph9hkr+w/epT
	mmsgb5C9qNoW3uMVe5DvHhaWD8TtIRz8bcs9CQINxw+vg0oNxRAigFxI7VpOsFWh
	TR3xcbh8ryImoBe5vIEFtfTTVhnm+ISiXJ7ZxPM3y+hBdnrDZ4DQEpxwEDeXs37l
	WXiekUSjpwSVwhAs4T7tEZs16KyDbRHHfJwG+dw0J9f+qPJdD3bj8FAaLCfmv1FN
	6z3JYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188stve3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:26:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so671769685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790846793; x=1791451593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+UM7fuqdRbDcSq7RdvBDoC9dhPLseEVaJ2k9PcLRJ4=;
        b=dtU67JMEmBwe1KghLkznRmMLkg33CyOj/HiHyVfFEwzca5kmF4Bldkbl37tBDZkrfW
         foz0SOVtflphDn2foYxiEzC/CBJJ5nC4E3XMVwWcPX5kfr8bRagfctkWZW/psIyuaFkT
         Ye3ygNwTkgZHpPQZrQvVVPuZjkYNc6BSwWgvb2wiB66S9XLXZgeO38HHSDNrnSPeLTSj
         QJxARBmxUrXJzkaqKJZfdd7ejdt51IZ5ayyWJbKPxtQ1lCzwSdBs2p+2q0AAoDe2zNeX
         P5y35jOX/i3Sf+3ce3oVNBh7T/aJZ3XVjvEjOfEOIfBNbTGELK8Yk76JV23djvRiewJz
         9jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846793; x=1791451593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+UM7fuqdRbDcSq7RdvBDoC9dhPLseEVaJ2k9PcLRJ4=;
        b=lnTEeU8DPTi9OojJt3D5zfEiQnz9se4E2jjhClnjbWKPy4EL4gfN9jZrmGZp+EpQFP
         AJWnAfozydmZdF+PUD2X20xa1oi3ZVpG0HYOlUgkrxhN7ptdRco3RR+vfpdZiWq4HmKM
         h2V9v8ZRjkltirQsSSDsH3DUY9xhXtNoHVLv6cdopQa3pJ6+B8AR3gDFzdQooY1+KWS1
         JSSjeBdLZYoaESx3lsaOXnGPhAfl2ulND6u00m4vHmszQvjA006XIBI97HMZYLv3IKde
         baLZ2nkksqC6AcYAZxEbtKdidRHPbalONoGG10dXy6ArlfgVpEzGVPXmfSX6Wsp6FZN8
         qcUw==
X-Forwarded-Encrypted: i=1; AKwUvBxgtf+i/WgkFm1x1njMwJ/ZEVVLQq1VcZCGqcpGBiTbLIdGV8Ul2ILe9/xCDW1/+r4a1joTnDqSb7iNpYMarAbs@lists.infradead.org
X-Gm-Message-State: AFuF++mE2wvQPSPuybFWluH846+pu2y/sW39uWA0t458C3A25VbkyJrt
	GYQyaezmTJ6e9A/1trROjDiD6KP0zLf4LrpR0rlZgGyxDF5wSJRjBD9eydcd9ixeMfQE0EWOpSC
	mWxVW/D9kYxA1Ss/ZLJPqpUFHufrzHG65s/IAqLcy8uod1c53CvkK7q+GVj4cqOiMiYxa21c8To
	Ksjw==
X-Gm-Gg: AYBFou1ZNZ+0oD7Az62ZelUTtQrvoyaXzIiwbWd/NYq3EnIIWAQlMiUzHUagaipJWaA
	lr/AijTCtOsVn8SwMrEF7w7Y+/HTX4DOYuUXdzciShGLNYSaw7AX84XuQmp5r9rFv/uwOKBbiLW
	7YeOlU0hOsAl6s22r0UdQf0uwSukESf0xgqklNB9X1DnCecPfRf21G8v+9u6ztfKltow3O8RVxA
	Ss96rRsq35g739KSWGsx8U8pD298fN7yXIL8G2mr2CzSBS807DbiqQ74LFigvVFE19YefxBTOaL
	dK5Lb7SfrzVPXqtiW3SQqqLFqBHjbKxw8XsEWLM1z9fVk/AYqeFCmbOBsbCK/V/4UnpRUwvOa0k
	VNjK9rMRVunv4BQ==
X-Received: by 2002:a05:620a:2245:10b0:93c:aa75:71e with SMTP id af79cd13be357-93caa751be0mr535601685a.55.1790846793347;
        Thu, 01 Oct 2026 02:26:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2245:10b0:93c:aa75:71e with SMTP id af79cd13be357-93caa751be0mr535596985a.55.1790846792654;
        Thu, 01 Oct 2026 02:26:32 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9482cdsm52568825e9.11.2026.10.01.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:26:31 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 11:26:12 +0200
Subject: [PATCH net-next v4 1/2] net: stmmac: fix TX coalesce race and
 div-by-zero in XDP/legacy path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-b4-stmmac-xmit-mb-v4-1-664e0c3eb289@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfXy9Wqlx/aihvO
 spyZ0GvSkkclbEhIL3a/ZTCuRwQk2D/SOQzv8LvnvSkhIlZl4KqAuDlFt1JF81caAf+gRXwgQKF
 zTy77B2o8LQ+l0cTieqg0bCkBHqVw9Q=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe274a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ot7w2pIUjTT4PScZVSAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aKf5Z8NJHjUcYv5Mp8L8A218sWOfsnwm
X-Proofpoint-GUID: aKf5Z8NJHjUcYv5Mp8L8A218sWOfsnwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX9HCdZ0v2cmoX
 +gql6qEYrAhXST67gerX6EPgQr3auP5nk0GhYdqHbbMXFva5hxbLi+/1LiCQs/fcTVIF4EdHH1g
 ZVt61mpiYBzuCm90h6cqK2qiLQqcwT7GkY8YhKcbfZR8F/hg+C1MQp7u4vKRrXy5TywsyDZFjx7
 QJ3Xsa6eTlCrCcqyp4Kk/qMHOkbIGx7N83RaGqomWCDRZivYvNNJogGYoeGmJhFcv+WILWMU7Br
 3Bb5LgJA8e5+uI8kPPXHz45pl2sdzJsPbkqb/nBWVrRAGHahs5K6mD//hAUzQShyos9PtxG8vAU
 0I7vkGo0BwZ252/qNpgTtHXtuJz2qsY+o2ZwmnLmtacDQJsPP+awwgT2H09c2e9nXBWrz/PCc24
 EpkNQ+X4xDy8/nAJcpPnyfTWWn+BUhk1SRtDGYYoLxiaF1Gi5ITCm5EhxxeC6TXXXQWIR3zbBXf
 x/7SWaHF1NGiXyCT2jQ==
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
X-CRM114-CacheID: sfid-20261001_022635_251010_E5B34FF2 
X-CRM114-Status: GOOD (  22.29  )
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

tx_coal_frames[] is written by ethtool (stmmac_set_coalesce) and read
locklessly from the TX fast path (stmmac_xmit, stmmac_tso_xmit,
stmmac_xdp_xmit_zc and stmmac_xdp_xmit_xdpf), so pair every access
with READ_ONCE()/WRITE_ONCE() to mark the intentional data race and
read a consistent value into a local variable.

Moreover, ethtool allows disabling TX coalescing by setting
tx_max_coalesced_frames to 0: guard the modulo operation in
stmmac_xdp_xmit_xdpf() against a zero tx_coal_frames[queue] to avoid
a division by zero.

Both issues were found by code inspection while extending the XDP TX
path with multi-buff support, and neither has ever been triggered, so
they are only theoretical. Tested on the Qualcomm RB3-gen2 board.

Fixes: db2f2842e6f5 ("net: stmmac: add per-queue TX & RX coalesce ethtool support")
Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 11 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 42 ++++++++++------------
 2 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1cf0f8820b33..30e0d499326d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -798,7 +798,8 @@ static int __stmmac_get_coalesce(struct net_device *dev,
 
 	if (queue < tx_cnt) {
 		ec->tx_coalesce_usecs = priv->tx_coal_timer[queue];
-		ec->tx_max_coalesced_frames = priv->tx_coal_frames[queue];
+		ec->tx_max_coalesced_frames =
+			READ_ONCE(priv->tx_coal_frames[queue]);
 	} else {
 		ec->tx_coalesce_usecs = 0;
 		ec->tx_max_coalesced_frames = 0;
@@ -887,14 +888,14 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 		int i;
 
 		for (i = 0; i < tx_cnt; i++) {
-			priv->tx_coal_frames[i] =
-				ec->tx_max_coalesced_frames;
+			WRITE_ONCE(priv->tx_coal_frames[i],
+				   ec->tx_max_coalesced_frames);
 			priv->tx_coal_timer[i] =
 				ec->tx_coalesce_usecs;
 		}
 	} else if (queue < tx_cnt) {
-		priv->tx_coal_frames[queue] =
-			ec->tx_max_coalesced_frames;
+		WRITE_ONCE(priv->tx_coal_frames[queue],
+			   ec->tx_max_coalesced_frames);
 		priv->tx_coal_timer[queue] =
 			ec->tx_coalesce_usecs;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d95482b7f6e5..df6a329fdb80 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2731,7 +2731,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		struct stmmac_metadata_request meta_req;
 		struct xsk_tx_metadata *meta = NULL;
 		dma_addr_t dma_addr;
-		bool set_ic;
+		bool set_ic = false;
+		u32 tx_coal;
 
 		/* We are sharing with slow path and stop XSK TX desc submission when
 		 * available TX ring is less than threshold.
@@ -2772,12 +2773,9 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 		tx_q->tx_count_frames++;
 
-		if (!priv->tx_coal_frames[queue])
-			set_ic = false;
-		else if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
+		tx_coal = READ_ONCE(priv->tx_coal_frames[queue]);
+		if (tx_coal && !(tx_q->tx_count_frames % tx_coal))
 			set_ic = true;
-		else
-			set_ic = false;
 
 		meta_req.priv = priv;
 		meta_req.tx_desc = tx_desc;
@@ -3419,7 +3417,7 @@ static void stmmac_init_coalesce(struct stmmac_priv *priv)
 	for (chan = 0; chan < tx_channel_count; chan++) {
 		struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
 
-		priv->tx_coal_frames[chan] = STMMAC_TX_FRAMES;
+		WRITE_ONCE(priv->tx_coal_frames[chan], STMMAC_TX_FRAMES);
 		priv->tx_coal_timer[chan] = STMMAC_COAL_TX_TIMER;
 
 		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
@@ -4557,10 +4555,10 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct dma_desc *desc, *first, *mss_desc = NULL;
 	struct stmmac_priv *priv = netdev_priv(dev);
 	struct stmmac_txq_stats *txq_stats;
+	u32 tx_coal, pay_len, mss, queue;
 	int i, first_tx, nfrags, ndesc;
 	struct stmmac_tx_queue *tx_q;
 	bool set_ic, is_last_segment;
-	u32 pay_len, mss, queue;
 	dma_addr_t des;
 	u8 hdr;
 
@@ -4679,16 +4677,16 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			      priv->dma_conf.dma_tx_size);
 	tx_q->tx_count_frames += tx_packets;
 
+	tx_coal = READ_ONCE(priv->tx_coal_frames[queue]);
 	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && priv->hwts_tx_en)
 		set_ic = true;
-	else if (!priv->tx_coal_frames[queue])
+	else if (!tx_coal)
 		set_ic = false;
 	else if (!netdev_xmit_more())
 		set_ic = true;
-	else if (tx_packets > priv->tx_coal_frames[queue])
+	else if (tx_packets > tx_coal)
 		set_ic = true;
-	else if ((tx_q->tx_count_frames %
-		  priv->tx_coal_frames[queue]) < tx_packets)
+	else if ((tx_q->tx_count_frames % tx_coal) < tx_packets)
 		set_ic = true;
 	else
 		set_ic = false;
@@ -4843,9 +4841,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct dma_desc *desc, *first_desc;
 	struct stmmac_tx_queue *tx_q;
 	int i, csum_insertion = 0;
+	u32 tx_coal, sdu_len;
 	int entry, first_tx;
 	dma_addr_t dma_addr;
-	u32 sdu_len;
 
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
 		stmmac_stop_sw_lpi(priv);
@@ -4986,16 +4984,16 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	tx_packets = CIRC_CNT(entry + 1, first_tx, priv->dma_conf.dma_tx_size);
 	tx_q->tx_count_frames += tx_packets;
 
+	tx_coal = READ_ONCE(priv->tx_coal_frames[queue]);
 	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && priv->hwts_tx_en)
 		set_ic = true;
-	else if (!priv->tx_coal_frames[queue])
+	else if (!tx_coal)
 		set_ic = false;
 	else if (!netdev_xmit_more())
 		set_ic = true;
-	else if (tx_packets > priv->tx_coal_frames[queue])
+	else if (tx_packets > tx_coal)
 		set_ic = true;
-	else if ((tx_q->tx_count_frames %
-		  priv->tx_coal_frames[queue]) < tx_packets)
+	else if ((tx_q->tx_count_frames % tx_coal) < tx_packets)
 		set_ic = true;
 	else
 		set_ic = false;
@@ -5258,7 +5256,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	enum stmmac_txbuf_type buf_type;
 	struct dma_desc *tx_desc;
 	dma_addr_t dma_addr;
-	bool set_ic;
+	u32 tx_coal;
 
 	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
 		return STMMAC_XDP_CONSUMED;
@@ -5303,12 +5301,8 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 
 	tx_q->tx_count_frames++;
 
-	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
-		set_ic = true;
-	else
-		set_ic = false;
-
-	if (set_ic) {
+	tx_coal = READ_ONCE(priv->tx_coal_frames[queue]);
+	if (tx_coal && !(tx_q->tx_count_frames % tx_coal)) {
 		tx_q->tx_count_frames = 0;
 		stmmac_set_tx_ic(priv, tx_desc);
 		u64_stats_update_begin(&txq_stats->q_syncp);

-- 
2.55.0


