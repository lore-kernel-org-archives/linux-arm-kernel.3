Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F064C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZygfEXp+XuyY5bPWF5ht419bC1Ri82wC3UKzpd1m4is=; b=GAfPKBOJBLU5FjSuaQdMpeE7jP
	GvhgOB6rCmKyf5zGaM3ksxFvJV1lIdHwdhHp5HsX8slCr2MA5MMSy15Lhgf1zYZgSN5Zm8L04HHBa
	D/suJf4IbVT280+9dNG2CpUEga90xRDWR8iqQ895wonb/+3tlHDgsk7OE4zKcASCupLfunKo6pUln
	/JoWhIVnKgFgi/rVr6QTAiFvNT/GRTwN8sXe2F2otsM21UVHlf+6jeGCnkDon9zsrTc2GdX62BXss
	DJG8s+xKvzQXeoGRuz8pe1SvlqK+o9MUY7UBDaOq2k18Fo8nGQ9nif0zu9zdbSkm/y75prOKgnVbU
	S+2HPwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG9n-00000007S5p-3WyO;
	Fri, 07 Aug 2026 08:42:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG9l-00000007S4U-1Hs3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZygfEXp+XuyY5bPWF5ht419bC1Ri82wC3UKzpd1m4is=; b=LAhhS9cMPnZQGKY26l1mfn5fCC
	R5lZoWxgqCH8LegLDZ91bJKOjWbvLCmxaMf1iq6uXZ+9/d4MGmjK35hZxadKb9ecS8A55prvPhRXm
	kcEtGb68LNIna+0MXik/4+FuWyUSOfl6iXdPWOlFWq6ouzZO1Phi80fsfXFdKmCA/ssLFiycbteC2
	yuRqgSpCVOPAZt7e4Lbs3WNcb/dqLDBa5L0IVS//jg54Qp7qqSi6eHTDSgiblyTGqp/gTUn57Xc09
	eYvR1pHuCCKNF9bjm2pM333moYk9vHT4vroXsFYaJrkxxVsl6Kr5dcMrtV3yF3u5itNRJdBMJ7Phx
	uZ3g5CUw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsG9h-0000000CDCw-1lMd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:42:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777tvu23176997
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Aug 2026 08:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZygfEXp+XuyY5bPWF5ht419bC1Ri82wC3UKzpd1m4is=; b=UR6bVsCL627Xw7R9
	/5KbCRhbM665eGxF+yrmI/BmwyDiUmR5PO9FoHiTTkQ9nMq9lLi5Vue4RTNoW+FH
	723vM8U5z7jnBwSiaq7i0VnQ1fZKGKzNHJo7NWQyr6qQbVUEKsW33F/d1pfjSNXF
	VYOxQ3h+twoOjk8JOR/eselrHo7J3jMUdUJasKJh9LKkCXlA2yi3H02xwUfwnl0X
	43FOb2lXBQW5pj+DDRVb3W4cYnaRI+bAG0K3oEaKAWUZSsiRJiwyACXd51/ttcuB
	IuNOqRWhJpM2Rg8zFqKCZhj8ppLOj045mlbGxZJoL9xrA+ZoiV3LKCTKoG/L7gYd
	aia1Aw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jk10s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:42:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso53180321cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786092133; x=1786696933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZygfEXp+XuyY5bPWF5ht419bC1Ri82wC3UKzpd1m4is=;
        b=aOJ1Ki6iTKxx581q9tlkfhv/vuNqI+hbU+mQs6gq1rOMLMQN08aMlAhK2t/COa0zF5
         5vEs0KJHLAVRRAP8wY7zy1QHDTsc7e7SWG6s184jhdv1SxyFz6mxQAYrREYbcezhVhq5
         89SwrgaxR/E0bNP1xpVuPufwVJQcgx/0QSSX9KehmVAf2MbD8ZNB+nTtdSHtdrbYna3t
         Y2Uo4Ua1oQgrV9obPTJ2looOxXCNF8B9MkL181ne2mE8BVQqqlJa2DO3SN5RnB/eby8v
         /8Bif0l3sl6c12MJ0927aukwbA6IrhWh4p6yY5jWybM1whcvbEPtU1di2j7tWdGFXQxV
         hOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786092133; x=1786696933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZygfEXp+XuyY5bPWF5ht419bC1Ri82wC3UKzpd1m4is=;
        b=sS+k4QYYG0y36cGV6tGl95ZIcVCcpEfqumeggwx3L0qt9ADTp6Y5AhqZv9xVjbtkA7
         B9JmSerhqgHBPcCLQ3Eq4PkhFQQvsUG52HDY+nbEguMhraznFc6ijtLHXtWuDEsxymiV
         RqANSmsdRrzZ5CrqCxua71yHbty0Lp50+VCGWH/sQmvxpAq4oSQkXDb/85EGbK77Pvqp
         gzhotcMFclf1KQuY9AO/5arPQNNTgmLw5FbTuuo4XBsc+0QsThzV5rgDfnODQeMZClnl
         +QfgDIFKrGi+K79UrNS19JLKAeHC9Zf+eXVdkPnDwCzeoNZSjVuhQ/9MMjXVa3584Ild
         vOGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+u5jmXXE4sKJ8hcUoJbZvgwSgziu/ACW0k1u9JQtdSvExL4ycPmhXkB5lE29x+UJ2dxALgn1FWdQFf+DCOSB1@lists.infradead.org
X-Gm-Message-State: AOJu0YyY+/jSK5yujRS03hG3qKRZOgwZijH3nzbVKfiXyIeswFvdZIP/
	eCf2gpXo25y5jOSzt8pCS2Jvf5lRlLpLNwi+C5aQZcxYKOhmbI6Ql77xgXxRkihegl3Gru+Zew7
	XC3EjugklSoYYS6avSG7SUHELksbDoAEAUlBkv7aI6/4xdo+VvE4EsU05JcVGn2FcvT5em+NQhz
	XkJw==
X-Gm-Gg: AR+sD12iKd8PDGVYOmMLCmpNUMh/CpEkFcYgmbwMMln16Pr96dvWyG8yRYx8P4E+F6S
	tf4HrzrhJvB8MuXVzEIUCuHLStNgCsaMDXtxNQeNSyfB7USJk7V3MCQPsqrjkx0EMSYoPeZ0feH
	ko7M4pg3wSPxLSch+krDhOSOIo4ge6kLXadNPa+I+jEU9z3Qs6Id43byuGhMBAqa0vz5GucbuXP
	VV18iZNwmlGVSeo5VW97FcUzs7JaEIW7ROAA0+Y0dfwjU3y7nzEA2gDn0x9s5z70Ep3H8nNnqMi
	L+sapTmVMnsgRIJyeW5/gGJ5vS+ka5NtFXsvROybgizrEkHUy3GbuYtAXgwWFk74OFHaGsxnIR1
	WEU5cLyd4QdWKAlQ=
X-Received: by 2002:a05:622a:141:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-52ce5f7e59fmr224098621cf.5.1786092132646;
        Fri, 07 Aug 2026 01:42:12 -0700 (PDT)
X-Received: by 2002:a05:622a:141:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-52ce5f7e59fmr224098371cf.5.1786092132261;
        Fri, 07 Aug 2026 01:42:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421fee8sm117205575e9.7.2026.08.07.01.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:42:11 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 10:41:40 +0200
Subject: [PATCH net-next v2 2/2] net: stmmac: add tc-mqprio qdisc offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-stmmac-ets-offload-v2-2-9ac67af92cb8@oss.qualcomm.com>
References: <20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com>
In-Reply-To: <20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
        Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NCBTYWx0ZWRfXzSHNgGuVFD5/
 PKAtLjkgHRot/c14o+YTy/aturH1EJqJI2pc6AwOyX/KOsnktjrpmvA5Y1zlFtpyQi8gmnQ8unS
 B1FSuO9QUgaA6KVRUW4R6AqHlKbiZtRbFcuvOLsgvB1Qa/7ySMQm/gdcrtPsrI24Xg7UhSLX03C
 33Gceftxa3MgRyyIOglFzjJKUg+TZzu0iHnqcNayv5lyVaFeV0hhALMFsCMLlsU07LMJn+A+B9A
 l+N84yKC9iWWla+RwAr6+5Ej4SQP4N0gAih+oD9RN+9cxjsjCAumF8zZPefr9lEerXejvGNe2o3
 D64lIKhnkYIGBYuL3p8lM/8KEGwko5/tF2e9bc8HtXszlQJj9K9vUhEhkn9YqUx5/ehdB4jPqlG
 ZM+MXbSIBMQBpMNWdsEILH3m9B8J9sQ6vME2Wb0Kec8d8UUIsuzIwxDvrTKbhK5XgHFXnDxfHOc
 fTdtPNy5YBBFH+YeT2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NCBTYWx0ZWRfX2NnLrnYkz8kU
 auwM3j0EN9m8g8kCTFybOMn7udgRzOn203C68W/Dv0iSgAVguy/VqdH8jUGxWzKMbwwugxQVqIx
 6pasFI+zaAkL5/FTk5I1edJmT3ozQP4=
X-Proofpoint-ORIG-GUID: 85hM_4H-IdxgSwAkZeRDOT5dFEiAaxuQ
X-Proofpoint-GUID: 85hM_4H-IdxgSwAkZeRDOT5dFEiAaxuQ
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a759a65 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yHRVR-la3UPYDukQr9sA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094218_410456_562AF57A 
X-CRM114-Status: GOOD (  21.49  )
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

Implement offload of the tc-mqprio qdisc in the stmmac driver. The MTL
TX scheduler is switched to strict priority, and the priority (PSTQX)
of each TX queue is programmed according to the requested traffic class
mapping: queues assigned to a higher tc are given a higher priority and
are served first, while queues not mapped to any tc keep the lowest
priority.

The per-queue priorities are stored in the unified qdisc state
(priv->qdisc.prio) so they can be reprogrammed on device reopen, and
are applied through the MTL TX queue priority map registers. Export
stmmac_mac_config_tx_queues_prio() so the mqprio path can reprogram the
queue priorities. Destroying the mqprio qdisc, or failing its setup,
restores the devicetree configured scheduling algorithm, TX queue
priorities and TX queue weights.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 ++++++++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 22 +++++++++++++++++++++-
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 823b40212233..1bb261fdcb0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -305,6 +305,7 @@ struct stmmac_priv {
 		bool enable;
 		u8 algo;
 		u32 quanta[MTL_MAX_TX_QUEUES];
+		u32 prio[MTL_MAX_TX_QUEUES];
 	} qdisc;
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
@@ -400,6 +401,7 @@ enum stmmac_state {
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
 void stmmac_set_tx_queue_weight(struct stmmac_priv *priv);
+void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv);
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7d1473fbde54..c2786ecca530 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3503,17 +3503,20 @@ static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
  *  @priv: driver private structure
  *  Description: It is used for configuring the TX Queue Priority
  */
-static void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
+void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
 {
 	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 	u8 queue;
-	u32 prio;
 
 	for (queue = 0; queue < tx_queues_count; queue++) {
-		if (!priv->plat->tx_queues_cfg[queue].use_prio)
-			continue;
+		u32 prio = 0;
+
+		if (priv->qdisc.enable &&
+		    priv->qdisc.algo == MTL_TX_ALGORITHM_SP)
+			prio = priv->qdisc.prio[queue];
+		else if (priv->plat->tx_queues_cfg[queue].use_prio)
+			prio = priv->plat->tx_queues_cfg[queue].prio;
 
-		prio = priv->plat->tx_queues_cfg[queue].prio;
 		stmmac_tx_queue_prio(priv, priv->hw, prio, queue);
 	}
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 5dcd18b5808e..3ba71be24c64 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1218,6 +1218,7 @@ static void stmmac_qdisc_restore_dt_config(struct stmmac_priv *priv)
 	/* reset to the dt configured algorithm. */
 	priv->qdisc.enable = false;
 	stmmac_set_tx_queue_weight(priv);
+	stmmac_mac_config_tx_queues_prio(priv);
 	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
 				      priv->plat->tx_sched_algorithm);
 }
@@ -1321,17 +1322,19 @@ static void stmmac_reset_tc_mqprio(struct net_device *ndev,
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
 	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
+	stmmac_qdisc_restore_dt_config(priv);
 }
 
 static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 				    struct tc_mqprio_qopt_offload *mqprio)
 {
 	struct netlink_ext_ack *extack = mqprio->extack;
+	struct plat_stmmacenet_data *pdata = priv->plat;
 	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
 	u32 offset, count, num_stack_tx_queues = 0;
 	struct net_device *ndev = priv->dev;
 	u32 num_tc = qopt->num_tc;
-	int err;
+	int i, tc, err;
 
 	if (!num_tc) {
 		stmmac_reset_tc_mqprio(ndev, extack);
@@ -1361,6 +1364,23 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto err_reset_tc;
 
+	/* Queues not mapped to any TC default to the lowest priority */
+	for (i = 0; i < pdata->tx_queues_to_use; i++) {
+		priv->qdisc.prio[i] = 0;
+		stmmac_tx_queue_prio(priv, priv->hw, 0, i);
+	}
+
+	for (tc = 0; tc < num_tc; tc++) {
+		for (i = qopt->offset[tc];
+		     i < qopt->offset[tc] + qopt->count[tc]; i++) {
+			priv->qdisc.prio[i] = tc;
+			stmmac_tx_queue_prio(priv, priv->hw, tc, i);
+		}
+	}
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_SP);
+	priv->qdisc.algo = MTL_TX_ALGORITHM_SP;
+	priv->qdisc.enable = true;
+
 	return 0;
 
 err_reset_tc:

-- 
2.55.0


