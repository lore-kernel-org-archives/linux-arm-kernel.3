Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D120CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx9m3KoyXG+64l0VuwtMujcGUymxe716+I4+2iOeJj0=; b=T3DqWdRVaobdODVeJdxGQZJYdh
	ezcBylToFPAr03lqMQ0+0SajIHTBZy4A/X/r/2c+a0mGhWu1658sv8ogQSm1FYvVHtgX+UQ5kbY+O
	VYXh4Y+O5zkczT6diLYWnNh31XxbvKX/BvFRzBtD9HZfZEy11i2p9q6oNgqJJWkw4Ld5loYtNhoiS
	McXef+RFKbewj8umegffTLntUZ1cJPakfCTcGVSdZct4VBJYZW8CEptJ9xQ6LHXb7iMs5KMqlr71x
	MIO2pdhacgKitauaowqyPa5TNSaLSpIc12GUji+YEwcrVkvwgSKYOJrD+sIrXaINNhuxbUyBQ8Lnh
	sO/L7Oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2h8-00000000YMG-3uLb;
	Tue, 06 Oct 2026 10:46:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2h4-00000000YIU-02EI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:46:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARO211544138
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dx9m3KoyXG+64l0VuwtMujcGUymxe716+I4+2iOeJj0=; b=JZ8Xm0VWnv/GA+bl
	LyMi+DDxKUXV3Uvxturok4+sagXN+jyJr8J0BrBcKhnySfqEhj511gsyJwW4VFR4
	P/gTEZF1rL3aR8uyGr7ArWMc0XLFG1JrJPmLKb6IXpzRuyGyrYOqV/fvzhH9rxEN
	HwEW4KSOMsyjBxu4XRMmFZMXdKlkLOuhN7Dd0naNMaxYyLY+xyPYIHmCSmwgRIV6
	y9uIhi6/bpllvpK1pDVUrF2v981efQaUr2m0UySfBPSz4OyLr/lZ3zdH0cE44Fzy
	Q8hpoH8nzwBBNg/hG+8KqT8qBvdVhfzDbNQKCZ0MnehkGfPsw3F2Z9glZNM6r8RJ
	Vvzk1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4gu04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:46:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so574410485a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791283604; x=1791888404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dx9m3KoyXG+64l0VuwtMujcGUymxe716+I4+2iOeJj0=;
        b=Wz2o7VORiD6HnpYXnOFELNtDwEt2ayvFYlMdp+CMY65BJRE11CS/1zh0M6FoQvG2B8
         /RrO50du87HdaI44e+z/LQaeCV7RB9s/oOVETTIr91/YKjKVVusjX/McX6xltGLbtHs9
         Sqk+upvKyTmoewJbrc2wsVeyHccDewd7tpCNtO+/ubNBeWGIdXdn034potqSPi5fRaVM
         ts/pFggcGXlWTpFHV1OtkeRZFfE+WvaYVXmYJCgl0Hsh6QqtDfrak6YfIseK7HXfkVTd
         Pi5VYI4l6KBgzs+GlTUzXnD3Y2QO2fntEmzZMdGK5S+fnGYh2IVhK1atO4Jx9XvIG8Pf
         Lf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283604; x=1791888404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx9m3KoyXG+64l0VuwtMujcGUymxe716+I4+2iOeJj0=;
        b=wkiGY8GEJqhUd7vMfSMI4nFx9bxvwtBV4e96TSytFyjCCCTbdt8gZPLJ9AXukMgmx2
         4TxjTNXVcj6NfS6qLXWHSu5yHqq/55JldpzkHkkEHppv0+Nz1rvG0rWuwkF1eQ15R7Zz
         fEl55Hz56dWohWc6z5s4MBe7O65qRgY5o8d9sETGJhT+YGwQN2puf1mdDUMEE+CGyh2o
         0TRreu10mkg91X4inZSEHGEGaDPY/sonHRRtEhcXQhF/NVe/EC3p1z5+pKMpbLIY9lDO
         002u8xmMseIAILUY1Ok0yy52ZPBcWsS8ftjEjmTP6pwWuPh26W0HNKjayI1VrrYrI9iR
         IRBw==
X-Forwarded-Encrypted: i=1; AKwUvBw3ZTzXFEVFr99osMUh8QoSr2LpiZ+64iiOmbGLsr2QLV1qq4tAt2VE787HI38fsbRR0/n/kKD0jY+OkKBBCpcn@lists.infradead.org
X-Gm-Message-State: AFuF++nasSt9GlPojWTOK7cTa/lCgVx4a884I3pE3rEF019uWekR6X/f
	wIYLEsz/nyRbGntZfP9RXtOfpXK4MyWF3Xa/DrlaS3gYgpeWpt13ZmnEruUgl916ciZgBQWLWIG
	joI2IqJAivmhUjAePHSvpR2JtDCj+bVNACNwv+Qk0DqBLUF1mWgS8CowAuZd6P+y46ISv4hQB8K
	L/st3VvLEn5w==
X-Gm-Gg: AYBFou2yvPKBFCsUYWE21QcDjYqym6pNxcjJlNUkB53zBB9OAUAeiP56FdN7QSDes2H
	aL+fzFU333zC3B8wKnnEGVir8nmWRgR2+f3dLEhJfjYus2Pz9WhVpEERBnl2+OKwLUWbaO1cuGG
	LrcfIzUpd+x6I+YbiQgOD3cePD76OmBHxNZTf+TYO0pmi4ZcDk63miklcyt4ObnWEVy3QmoLjx+
	1N57OWS9T7E0BtduvRggrHNO0sNnITsjW7rWiAEbbjijnEGM4+KgiqG/Gq9loeLIrEVeBQ8rD5A
	SUmGxyJxkTDiohdASnUUoKObXlrIbNj+8dTIYmH33+2nKdgOn6wTKTrqMwH9yWTYAEVzUdwRuSW
	5oy3y3NKWfcOnlA==
X-Received: by 2002:a05:620a:3908:b0:93c:88ab:3482 with SMTP id af79cd13be357-93e8f35e81emr163644785a.29.1791283604037;
        Tue, 06 Oct 2026 03:46:44 -0700 (PDT)
X-Received: by 2002:a05:620a:3908:b0:93c:88ab:3482 with SMTP id af79cd13be357-93e8f35e81emr163639385a.29.1791283603429;
        Tue, 06 Oct 2026 03:46:43 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62289e77sm9986132f8f.21.2026.10.06.03.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:46:42 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 12:46:27 +0200
Subject: [PATCH net-next v5 3/3] net: stmmac: add tc mqprio hw queue
 priority offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-stmmac-mqprio-prio-offload-v5-3-d7da93419784@oss.qualcomm.com>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
In-Reply-To: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfXweMZGI2xRxEw
 aObbwLBt6ve4gk8BRxOoJIHK8BkZIDFKa8HZ69A24mc3zgt2fLFp6ionlfTzHAIr3EVkJldvGgv
 xk7GhxFAUZLOGs7Em3ssLg0usSHrGP0iGArd2BIZjlQnw7K4AXPmfaMTVQ9VS/7JUGIUbfZQcQO
 R/+oJ7grw3kf38plVAJ4Nac3mj7r4faUZXbjlzVQHf4uDYNPQw4qbrRtxxyfGd8ShO+n1sdJwGB
 hYZlM1RHmasL4RLBdTID8hbIBV20v2UOEXm96zTf/1hOBdtHaBlPPN/bEqjAHxtrycofS/eEx1K
 ygj9Ptq9VtZK7ojFTUsyNUIF/NGoHE7TtI4dNjV9sih++Eb0cTWtd6YfGf7cAsDsMx9D/gYsxQM
 MbJsrbiJOz86YTb+0sL0tD3mHjfwApvyHbrxVtE3Z8SWoH1QUCpYDFghY0RTThGdEHQ6Nw/VfNQ
 5V84yn0ttAWxNnMA2Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfX/O8+d+8ZoqPZ
 5YAf2FQR0zxVCKsEm3BPJATWwYr/q+sSkbE111nGcai88iap7lVSxSKRBesLhwgaHEXXPNkQjXj
 LHuqAkbD3l7DaxNM2BTUh208KFdQJFk=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4d195 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=dYERuBvVx-ELa3hM7TQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: f7-gv6v_5X6kyo_wH_Jzvr_TmIbBQcJ9
X-Proofpoint-GUID: f7-gv6v_5X6kyo_wH_Jzvr_TmIbBQcJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034646_266775_BF06C68A 
X-CRM114-Status: GOOD (  25.48  )
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

Implement the offload of the tc mqprio hw queue priority in the stmmac
driver. When the mqprio qdisc is configured in channel mode, the MTL TX
scheduler is switched to strict priority, and the PSTQX/PSTC priority
bitmask of each TX queue is programmed from the set of frame priorities
mapped to the owning traffic class (qopt->prio_tc_map).

The channel mode offload requires the DCB hw feature and a 1:1 TC to TX
queue mapping, with a single queue per TC. Configurations with AVB queues
are rejected, since forcing strict priority conflicts with the CBS
algorithm. The CBS offload is refused while the strict-priority scheduler
is active, and so is a channel count change that would enable an AVB
queue.

In the default DCB mode, only the netdev TC map and the FPE preemption
class mapping are offloaded, leaving the MTL scheduler and the per-queue
priorities to the device-tree configuration.

The num_tc bound against ARRAY_SIZE(tc_to_txq) is no longer needed: the
check that each TC's offset + count stays within plat->tx_queues_to_use
already bounds num_tc, because the TC ranges do not overlap and each one
spans at least one queue.

Reviewed-by: Davide Caratti <dcaratti@redhat.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  33 ++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 134 ++++++++++++++++++++--
 4 files changed, 148 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 0052f2129297..40eab899027b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -302,7 +302,10 @@ struct stmmac_priv {
 
 	struct {
 		bool enabled;
+		u32 prio[MTL_MAX_TX_QUEUES];
+		bool prio_offload;
 		u32 num_tx_queues;
+		u8 algo;
 	} xmit_qdisc;
 
 	struct dma_features dma_cap;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index c889204a7aa5..b6b5ef7c8fc4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -230,7 +230,7 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 		if (count == 1)
 			continue;
 
-		if (priv->plat->tx_sched_algorithm == MTL_TX_ALGORITHM_SP) {
+		if (priv->xmit_qdisc.algo == MTL_TX_ALGORITHM_SP) {
 			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
 			return -EINVAL;
 		}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9c03d21ebfcc..762ac86a9abb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3535,17 +3535,11 @@ static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
  */
 static void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
 {
-	u8 tx_queues_count = priv->plat->tx_queues_to_use;
-	u8 queue;
-	u32 prio;
-
-	for (queue = 0; queue < tx_queues_count; queue++) {
-		if (!priv->plat->tx_queues_cfg[queue].use_prio)
-			continue;
+	int i;
 
-		prio = priv->plat->tx_queues_cfg[queue].prio;
-		stmmac_tx_queue_prio(priv, priv->hw, prio, queue);
-	}
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++)
+		stmmac_tx_queue_prio(priv, priv->hw,
+				     priv->xmit_qdisc.prio[i], i);
 }
 
 /**
@@ -3606,7 +3600,7 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 	/* Configure MTL TX algorithms */
 	if (tx_queues_count > 1)
 		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
-				priv->plat->tx_sched_algorithm);
+					      priv->xmit_qdisc.algo);
 
 	/* Configure CBS in AVB TX queues */
 	if (tx_queues_count > 1)
@@ -7711,6 +7705,14 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
 		return -EINVAL;
 
+	if (priv->xmit_qdisc.prio_offload) {
+		for (i = priv->plat->tx_queues_to_use; i < tx_cnt; i++) {
+			if (priv->plat->tx_queues_cfg[i].mode_to_use ==
+			    MTL_QUEUE_AVB)
+				return -EINVAL;
+		}
+	}
+
 	if (netif_running(dev))
 		stmmac_release(dev);
 
@@ -7956,6 +7958,15 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->wol_irq = res->wol_irq;
 	priv->sfty_irq = res->sfty_irq;
 
+	/* Default xmit qdisc configuration */
+	for (i = 0; i < ARRAY_SIZE(priv->plat->tx_queues_cfg); i++) {
+		if (!priv->plat->tx_queues_cfg[i].use_prio)
+			continue;
+
+		priv->xmit_qdisc.prio[i] = priv->plat->tx_queues_cfg[i].prio;
+	}
+	priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
+
 	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN) {
 		ret = stmmac_msi_init(priv, res);
 		if (ret)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index a7721b2eee96..ea1f97d6f0bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -346,6 +346,9 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 	if (!priv->dma_cap.av)
 		return -EOPNOTSUPP;
 
+	if (qopt->enable && priv->xmit_qdisc.prio_offload)
+		return -EOPNOTSUPP;
+
 	port_transmit_rate_kbps = qopt->idleslope - qopt->sendslope;
 
 	if (qopt->enable) {
@@ -1266,6 +1269,28 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
+	if (priv->xmit_qdisc.prio_offload) {
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(priv->plat->tx_queues_cfg); i++) {
+			u32 prio;
+
+			if (priv->plat->tx_queues_cfg[i].use_prio)
+				prio = priv->plat->tx_queues_cfg[i].prio;
+			else
+				prio = 0;
+
+			priv->xmit_qdisc.prio[i] = prio;
+			if (i < priv->plat->tx_queues_to_use)
+				stmmac_tx_queue_prio(priv, priv->hw, prio, i);
+		}
+
+		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
+					      priv->plat->tx_sched_algorithm);
+		priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
+		priv->xmit_qdisc.prio_offload = false;
+	}
+
 	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
 	priv->xmit_qdisc.enabled = false;
 
@@ -1275,6 +1300,83 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
 }
 
+static void tc_mqprio_config_queue_prio(struct stmmac_priv *priv,
+					struct tc_mqprio_qopt *qopt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(priv->plat->tx_queues_cfg); i++) {
+		u32 prio = 0;
+		int j;
+
+		for (j = 0; j < qopt->num_tc; j++) {
+			int p;
+
+			if (qopt->offset[j] != i)
+				continue;
+
+			/* The PSTQX/PSTC priority map is 8 bits wide, so only
+			 * priorities 0-7 can be represented in hardware.
+			 * Priorities 8-15 are handled in software by the
+			 * kernel through the netdev prio_tc_map.
+			 */
+			for (p = 0; p < 8; p++) {
+				if (qopt->prio_tc_map[p] == j)
+					prio |= BIT(p);
+			}
+			break;
+		}
+
+		priv->xmit_qdisc.prio[i] = prio;
+		if (i < priv->plat->tx_queues_to_use)
+			stmmac_tx_queue_prio(priv, priv->hw, prio, i);
+	}
+
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_SP);
+	priv->xmit_qdisc.algo = MTL_TX_ALGORITHM_SP;
+	priv->xmit_qdisc.prio_offload = true;
+}
+
+static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
+					struct tc_mqprio_qopt_offload *mqprio)
+{
+	struct plat_stmmacenet_data *pdata = priv->plat;
+	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
+	int i;
+
+	if (!priv->dma_cap.dcben) {
+		NL_SET_ERR_MSG_MOD(mqprio->extack,
+				   "hw DCB is required to offload mqprio");
+		return -EOPNOTSUPP;
+	}
+
+	/* Forcing strict priority conflicts with the CBS algorithm
+	 * of AVB queues, so reject the offload when any queue is
+	 * configured as AVB.
+	 */
+	for (i = 0; i < pdata->tx_queues_to_use; i++) {
+		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB) {
+			NL_SET_ERR_MSG_MOD(mqprio->extack,
+					   "SP conflicts with AVB queues");
+			return -EOPNOTSUPP;
+		}
+	}
+
+	for (i = 0; i < qopt->num_tc; i++) {
+		/* The offload switches the MTL scheduler to strict
+		 * priority, which only supports a 1:1 TC to TX queue
+		 * mapping.
+		 */
+		if (qopt->count[i] > 1 || qopt->offset[i] != i) {
+			NL_SET_ERR_MSG_MOD(mqprio->extack,
+					   "SP requires 1:1 TXQ map");
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return 0;
+}
+
 static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 				    struct tc_mqprio_qopt_offload *mqprio)
 {
@@ -1285,22 +1387,11 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
 	struct net_device *ndev = priv->dev;
 	u8 ndev_prio_tc_map[TC_BITMASK + 1];
-	int i, err, ndev_ntc;
+	int i, err, ndev_ntc, mode;
 
 	if (!qopt->num_tc)
 		return stmmac_reset_tc_mqprio(ndev, extack);
 
-	if (qopt->num_tc > ARRAY_SIZE(tc_to_txq))
-		return -EINVAL;
-
-	/* save current tc values for reset */
-	ndev_ntc = netdev_get_num_tc(ndev);
-	for (i = 0; i < ARRAY_SIZE(ndev->tc_to_txq); i++)
-		ndev_tc_to_txq[i].combined =
-			READ_ONCE(ndev->tc_to_txq[i].combined);
-	for (i = 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
-		ndev_prio_tc_map[i] = READ_ONCE(ndev->prio_tc_map[i]);
-
 	for (i = 0; i < qopt->num_tc; i++) {
 		if (qopt->offset[i] + qopt->count[i] >
 		    priv->plat->tx_queues_to_use) {
@@ -1317,6 +1408,22 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 				    qopt->offset[i] + qopt->count[i]);
 	}
 
+	mode = mqprio->flags & TC_MQPRIO_F_MODE ? mqprio->mode
+						: TC_MQPRIO_MODE_DCB;
+	if (mode == TC_MQPRIO_MODE_CHANNEL) {
+		err = tc_mqprio_validate_chan_mode(priv, mqprio);
+		if (err)
+			return err;
+	}
+
+	/* save current tc values for reset */
+	ndev_ntc = netdev_get_num_tc(ndev);
+	for (i = 0; i < ARRAY_SIZE(ndev->tc_to_txq); i++)
+		ndev_tc_to_txq[i].combined =
+			READ_ONCE(ndev->tc_to_txq[i].combined);
+	for (i = 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
+		ndev_prio_tc_map[i] = READ_ONCE(ndev->prio_tc_map[i]);
+
 	err = stmmac_set_ndev_tcs(ndev, qopt->num_tc, tc_to_txq);
 	if (err)
 		goto error_reset_tc;
@@ -1331,6 +1438,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_num_tx_queues;
 
+	if (mode == TC_MQPRIO_MODE_CHANNEL)
+		tc_mqprio_config_queue_prio(priv, qopt);
+
 	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
 	priv->xmit_qdisc.enabled = true;
 

-- 
2.55.0


