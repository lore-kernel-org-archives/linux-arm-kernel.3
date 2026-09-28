Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86301CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzYghY6HWYhZ8GOsdQtxcMIBkmho2rmuPEtIPMf1Kg4=; b=hl4RTzIbLAR0DiyjtktMlAx7p5
	yDbo3TpROFkTcqabtNnwYe9VuNQanbCmbOXcIJiYmoZyYzX2HZN6e4CFPz5r5I2zrHdZFhDlwzR6o
	SpaRfah2e+ZAooPKE+BvIbfpBnmaA3eYDEW7lKBtvTJgeO5FjWeJhfHc9qz5NdCtuuYgw9PU4/H3v
	iX/HETXZ8Uzhllc8R0nyT9EzVATqGZTAQ0fvlQTZb/jn/dNrlCri84tAX/bb3sXdXOT56tGI4H6SE
	51bEq/B9LoAW88yMlGNhNQCUIm5zW6CgaLj70r7dD702KcvEO4gXG9YgF907tGog1RUdO7vPe9FkE
	PhdNVSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEXJ-000000014jy-1NKm;
	Mon, 28 Sep 2026 16:49:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEXG-000000014jE-1NEk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:49:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe0v32864007
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzYghY6HWYhZ8GOsdQtxcMIBkmho2rmuPEtIPMf1Kg4=; b=oP/YsMdHoorYP+5t
	GCVGTUUL8KucpLH/NVWusJQA3+Ekd+N8UuFHXYNUgW0qWjVUcDXeGiun+tZNF2qV
	L/OERorCUYWHbw1unasgEYtM9KhBCOx2tw6jMKbb4xnp12TK/phFvchWWRhQygym
	WpGVWpnz7i3pUlCu4lwek9ububqXhepuQH2qj8QT8LoG59flUK9z/fd9JiuEaAU1
	I2ceohsJhli4PAjKUFvMVGhBhmOqWH7bmwoi7x+z0ZF5sGmaubDA/Op1R3qM9f1A
	17gCGgFrpS+YGecrDhfo0ONYDYG4LgqEO0CLhJ717jTySF94AwduAzJaMFi8julk
	e658RQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t2jb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:49:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b2f700b30bso674299137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790614141; x=1791218941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzYghY6HWYhZ8GOsdQtxcMIBkmho2rmuPEtIPMf1Kg4=;
        b=ac7kZM27jkVeT4EdDIAThk4pVnmGrkC3K3F/dWdBTthaY+9D3LXg/XYwxkAOptORUq
         Tw0/Vx0tdHK13kaFXWT7Wk7fyYz7B9AkoRp83+FZuBtvcmTb/uzTX78vTlG/TwJRKymx
         KBsQWoDoSeGovjKlO+vgZqx/XY3NfJYSAQiHVW8ezAcmOlZbsAYuZ/FYLI3NsEc9mFu6
         IPJDMBnsH5HojxAlVwgAN+d33pagM4tt2oAUT4RCq8BLy45R5lMkkZK2BSnGlKgftVdr
         2lxJF06ybs9lX9B31HJV60BLc3Edvq1DJhOJ2+Zl4Pembvl5XM/D/tMKu+dCfYAculgm
         96mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614141; x=1791218941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzYghY6HWYhZ8GOsdQtxcMIBkmho2rmuPEtIPMf1Kg4=;
        b=iKQ+9MGfHgW/Q8Q65AXq+T+usga3Ru5mR5o/y3/FTuyI1kPAzlsnk9tZuvOjtS+stx
         1542WQAjeV6DuWbuvof/tHkh4XnoQZtCigWncQtQciN3/O7ZruQEcfH9xMHHtgpsuyvB
         BIJf0Seq6nyQ6KNt2PoPp6WLChgxD/hO5bcB6zMyUFo1dF1ekMm58aKDfzpqxpnlO81l
         HRk9B5Y21gqDNsObh3iE6f3kQi6tvhITdjbQ6Y4WDI+LLlKm92ayKHO4RVIZeQWKFAzB
         5uPyFmjXA9Vll/Vpmlbxnbknc78VDzbMatFDv9mByeezahsudgaITS/UC+aCfvl39Twj
         vtKg==
X-Forwarded-Encrypted: i=1; AKwUvBwqAOcodvEffMEqQKvBlWYqhY3OLlVpFF3x/Y+js/YJj8Ffhd+47djSXTIyk6TkruLRT/c1Os27XyAl0k9qLHpT@lists.infradead.org
X-Gm-Message-State: AFq9FYIOyzgCSiAya07YG8I6x32do3rtQvplxBcBVkBRyO0QmYyUWHEx
	sSoMAFGruouMPQLobIlfvqcwK+0/LEKXZ0wPtwSOcgYccbwrMHwbLR8vrWqYrhnunAQ1LFR7OCx
	iPNSsfE3R0f/FfNNmh3TIoLZLaELRiUD5rnKAIFPDYzkXROjDaww2PsJ2m8oslrfhLFl9cKHDok
	VgiQ==
X-Gm-Gg: AYBFou2pmCd3lF39NEfhtKpQ42rDUremDM3cmAeDeYhZriK9U6HILd+Oix6wPVXLCh1
	7xki8VkYzr3bO0efCIojXGUrNXR//qe9sXFoK9+BKDSUF6QQprBS/vT3rLu279qDC5FpQ15KSRW
	MF/UFfM0sI9Cdu3CQaMo+eQUCgfT80W8kPvZqWvvQckSwZXzd9hW+9HAKFYT/vyihriNTlCimrC
	Z47yMhqpxiXdYVrVCjMoRkHQHZ9zYOVXfqgtO+7SqpMr/D+clra63a4ae8Px/XRL+gkPj38v8NS
	3ryvz34QdeLMkfilQSetdZG0aS2YC0dxQmijBJ2Ak2YPrFOd3gv3jdJcEyS1JjF6jgoGMe6uyR4
	KXj4jtSiUhjlJvg==
X-Received: by 2002:a05:6102:848b:10b0:7b2:f790:c028 with SMTP id ada2fe7eead31-7b2f790cdd3mr1412493137.25.1790614140154;
        Mon, 28 Sep 2026 09:49:00 -0700 (PDT)
X-Received: by 2002:a05:6102:848b:10b0:7b2:f790:c028 with SMTP id ada2fe7eead31-7b2f790cdd3mr1412242137.25.1790614120700;
        Mon, 28 Sep 2026 09:48:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm28784444f8f.28.2026.09.28.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:48:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:48:13 +0200
Subject: [PATCH net-next v3 1/2] net: stmmac: add tc mqprio hw queue
 priority offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-stmmac-mqprio-prio-offload-v3-1-abbe181f5024@oss.qualcomm.com>
References: <20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com>
In-Reply-To: <20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX81AU1VywZNDS
 cUAZPzTta7UmwQFwyZB3o7E1ZYPgsDm3zRyDV9r0tRMMelC1iwhWFPXt1qPmVZ1P2L+dEKUm1hB
 i50EqRqOh617rOAMOLhjv7CcGiJVurebhy+qYwTsuSlmAULxQPBNVBS/B4r1i6ZKf2QcseJ97y7
 x6GslGMvm1/JmgThhjqVvLK3eirXgBlWsmUMEch30L7Wz/L8a//7WHukWj2sGsyQSC3v/GZeFtp
 r8klxkUVUKXwGm4jV/AcbQmJnFJy2kEFLOsgyISl12269SGUKM2HVka9eVcDQD4Q6SAOe3mJNcV
 HT3TuyANJJqDEazxTdmDK2Y9cigxVwP3W4HgRK2+cnOjitgiNYs2AZkIxHB6K7h/bGaGLJ7MW11
 PzqHlPHd6IwkKoScwf0vFOszQE175s1bmA0dcKCrdPf5e8XQb0L3loisCBZ5dvPQvl2aiZRSk94
 TvatP+gRjMIVpoKCzIw==
X-Proofpoint-ORIG-GUID: hB6pJQcvGlxMA66vGqEh__YVciy_MrOJ
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba9a7d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=d0kHe6nCisoU4kiX0eUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: hB6pJQcvGlxMA66vGqEh__YVciy_MrOJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX1CsVXxj+rKXL
 cx+B9O/M0w98h0Dbo9wYEnTuo+Nl2fKhr4FH7xZSJjDuA7WJ8S9RlFyEpBn1ThRO7Zieacm9M6A
 ihBLSJ+ab9KTxo+I3272UfhO41O/ZXg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_094902_400348_2EDC5A3C 
X-CRM114-Status: GOOD (  26.62  )
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
algorithm.

In the default DCB mode, only the netdev TC map and the FPE preemption
class mapping are offloaded, leaving the MTL scheduler and the per-queue
priorities to the device-tree configuration.

Reviewed-by: Davide Caratti <dcaratti@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   7 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  25 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 138 ++++++++++++++++++++--
 4 files changed, 150 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..f1bdb65d0fe6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -299,6 +299,13 @@ struct stmmac_priv {
 	/* Protect est parameters */
 	struct mutex est_lock;
 	struct stmmac_est *est;
+
+	struct {
+		u32 prio[MTL_MAX_TX_QUEUES];
+		bool prio_offload;
+		u8 algo;
+	} xmit_qdisc;
+
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
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
index 3ad9252bf6ae..27e4e86e3c8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3533,17 +3533,11 @@ static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
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
@@ -3604,7 +3598,7 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 	/* Configure MTL TX algorithms */
 	if (tx_queues_count > 1)
 		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
-				priv->plat->tx_sched_algorithm);
+					      priv->xmit_qdisc.algo);
 
 	/* Configure CBS in AVB TX queues */
 	if (tx_queues_count > 1)
@@ -7924,6 +7918,15 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->wol_irq = res->wol_irq;
 	priv->sfty_irq = res->sfty_irq;
 
+	/* Default xmit qdisc configuration */
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
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
index 42a00446e9b4..07cf4582ed76 100644
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
@@ -1266,12 +1269,109 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
+	if (priv->xmit_qdisc.prio_offload) {
+		int i;
+
+		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+			u32 prio;
+
+			if (priv->plat->tx_queues_cfg[i].use_prio)
+				prio = priv->plat->tx_queues_cfg[i].prio;
+			else
+				prio = 0;
+
+			stmmac_tx_queue_prio(priv, priv->hw, prio, i);
+			priv->xmit_qdisc.prio[i] = prio;
+		}
+
+		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
+					      priv->plat->tx_sched_algorithm);
+		priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
+		priv->xmit_qdisc.prio_offload = false;
+	}
+
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
 
 	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
 }
 
+static void tc_mqprio_config_queue_prio(struct stmmac_priv *priv,
+					struct tc_mqprio_qopt *qopt)
+{
+	int i;
+
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
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
+		stmmac_tx_queue_prio(priv, priv->hw, prio, i);
+		priv->xmit_qdisc.prio[i] = prio;
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
@@ -1282,23 +1382,22 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
 	struct net_device *ndev = priv->dev;
 	u8 ndev_prio_tc_map[TC_BITMASK + 1];
-	int i, err, ndev_ntc;
+	int i, err, ndev_ntc, mode;
 
 	if (!qopt->num_tc)
 		return stmmac_reset_tc_mqprio(ndev, extack);
 
-	if (qopt->num_tc > ARRAY_SIZE(tc_to_txq))
+	if (qopt->num_tc > priv->plat->tx_queues_to_use)
 		return -EINVAL;
 
-	/* save current tc values for reset */
-	ndev_ntc = netdev_get_num_tc(ndev);
-	for (i = 0; i < ARRAY_SIZE(ndev->tc_to_txq); i++)
-		ndev_tc_to_txq[i].combined =
-			READ_ONCE(ndev->tc_to_txq[i].combined);
-	for (i = 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
-		ndev_prio_tc_map[i] = READ_ONCE(ndev->prio_tc_map[i]);
-
 	for (i = 0; i < qopt->num_tc; i++) {
+		if (qopt->offset[i] + qopt->count[i] >
+		    priv->plat->tx_queues_to_use) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Queues exceed hw TX queues");
+			return -EINVAL;
+		}
+
 		tc_to_txq[i] = (struct netdev_tc_txq) {
 			.count = qopt->count[i],
 			.offset = qopt->offset[i],
@@ -1306,6 +1405,22 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 		num_tx_queues += qopt->count[i];
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
@@ -1320,6 +1435,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_num_tx_queues;
 
+	if (mode == TC_MQPRIO_MODE_CHANNEL)
+		tc_mqprio_config_queue_prio(priv, qopt);
+
 	return 0;
 
 error_reset_num_tx_queues:

-- 
2.55.0


