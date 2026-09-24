Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960D1C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8kX1AC9McmtvJp26gjlcijK+PPuWWekEP3S+wzXhis=; b=sw82GqhX2rNTCiWX7X2KypkSe8
	zboQfi5KAZvan+axFA7IkioVte+3tmCuB90P+e7a3r9JsN/k+AUpecUDg75uUVu680haIJoe5vVi4
	dzXrSNSKQOiYqna1CoJ5oPGp2cILuy7ks2wrkzn3VgF9boI1xBGuKiSHasyDIewFNdq4H7ubpWt/i
	RO5ljpzhWW2aGGU9XiQox475NwVQmtqY/neXTr4sPpN5uQz8Y2P6/6TXlK5uyAB/k/EwSgZ040W3B
	Aqo5Fc0nbiz3uN3U3rUr3mnVgtFey7vfdh56K8R1e+CYAhyizKpShK7tSi738lrdhr86kTJCLBHum
	5ohZVdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gz9-0000000AmJz-3HnO;
	Thu, 24 Sep 2026 10:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gz7-0000000AmJ6-0Pto
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:47:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PhkR1270240
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8kX1AC9McmtvJp26gjlcijK+PPuWWekEP3S+wzXhis=; b=SdoiF+mgdITetG53
	1xBEk/YzJVbZAo9S4apTS4DPolvofyqgyQ1VyL+CM6ODihQhF+5SMpC/1owGQBdT
	8V/whnTYyIoXaeVzg962ICINAFlZQ+AWJFFDC/26DfRzx/VaE8FTp9aOc0C6haWc
	6EiA8UX/XprP8DFW6IGEp8MQQlCXfoQcyemI+0suh3V9xJmfEp49t3p023PI/25L
	bOom8rtNCHkmU9WQndov3+GhQ9jRiRdWf5rFNeRQTN57zNX1PnXmYm1Eiv4/Vvq6
	9e6Gb4kuKg+8MbNaxZ0h8vo18o7OQ9hrKQ4P/nSC34n5+gUVp99lhEyhLAbTHZhU
	lxdZKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90akm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:47:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so453129885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 03:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246843; x=1790851643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8kX1AC9McmtvJp26gjlcijK+PPuWWekEP3S+wzXhis=;
        b=fGor+tKgLQzXU9D9FuqYJfGBvqDY2arYMu41qf/hY8MUcjcxDDP0N0H/d+TlNvAhAt
         BoHvbv5CETHCT/HOHo8tg4r7aoK7hGnqYpyv6BvTbDFNrt4gdgEGw/83NxqbuTJ39Wj0
         KmXrwWwPpnot7ceWHIPMvDQVwjwBAq9DmsogZycp8u2wrr1Lh9EZqD3uUEXiabjQAXH9
         WjRIy1yqMDHOnp9DO/eZtGuqNyf95YXQiSxOPd+FPbSmvKjlFCuO/2L79Zej1GkYST8o
         wOYVxD4KCpdmVVSgswU6/iOYeA6W6JhlRucPgo7vAxNHlc9MC65iGrxqNSVeS0k1XPrX
         Gf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246843; x=1790851643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8kX1AC9McmtvJp26gjlcijK+PPuWWekEP3S+wzXhis=;
        b=e6FtdgC10cLDHHcgwcWRV/hWJPKaMbITG8KQdHeCltbpq1+rQKQHNULAL+h0qKZxxo
         sNcqgZHCd9MsZrldOD9RhPl0OSgXtgXT5+FjisPX/22i+CmpEV3KdeWCKm8fzry+8fFA
         OG44erUKB+EmdAdP9ki6+V7LL9eQ/G+6qwwZgUGCpa3zFXbKqJaN8CNOXkx/TsCCgFgl
         RHqkAIctNa48tZ7SsMd6NzZ7R+VKRHPk65pAOm/+NcQDqCYuhhkV/OPaBJtXr8SH+c1d
         WZZ0/RSBZKbSWj5LlvUybogfELzmcUd4Lkw2TlBXhTefxfnoWUu7S4y/XSaZXIe9NKAU
         ZKrw==
X-Forwarded-Encrypted: i=1; AKwUvBx4rysN4u3ENEqBGBp7cTdfwIkIR6LL/AfGyCyc2B74MLGJkTDyELpogdyCClB9fp/uX9ZIHJvswq0XvRL2yxA4@lists.infradead.org
X-Gm-Message-State: AFuF++mb05CPpZbmAIGHaY2lOuAFO/hHv95RzQ8zF3N4FiZ6JNhzvevT
	O1F7Iy/VAIXfenCS2PVcwkorCkuHXTR50hFQXBR/FKi3BiozyCo8Q+VRZGz1gdeRdkj58BnfUHO
	/iWbKg98t4+dXDdz5ybrlkQn91qK2f7NqGHtXNxjTuYfnCchlCb6AC5XRcwDf4uhoY5lEC4shm5
	Gamg==
X-Gm-Gg: AYBFou2HvDUT8UVlMqw7gwlEAZfe7Mp04RnfRR8WxmVIZ4uXomYuDF63KY0QAeTpBXd
	9lGAyC61SSjU95oFv1tzV99txadlPThhjSeiNAEBJ8rV1EQ2zhDNHbqUAaQGc95JMqfPbIBxENh
	VokPO0YO5TrTTlPKemJmnTQSiiX3EvbOp7zp0J6JNnXlIxnW4ie3MVskfSb8coznJ5dmgvCi7zA
	rDacgXTfrS+39f2RHXXgI4p/X16e264ckkFi3IwXcmAWhIvkwrd/DiZi003bYknA7GcmJci2cTI
	qrxUIHV8g5HKz39XUAvCpWWWS4PAC8CymD0X+xNNs9FuwXwzJmwyzUcpZu0GNaMiz9VWNLjeyeK
	Kffl6u9GcDhEyTw==
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr218703685a.46.1790246843176;
        Thu, 24 Sep 2026 03:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr218698085a.46.1790246842436;
        Thu, 24 Sep 2026 03:47:22 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm75450165e9.3.2026.09.24.03.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:47:21 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 12:47:01 +0200
Subject: [PATCH net-next v2 1/2] net: stmmac: add tc mqprio hw queue
 priority offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-stmmac-mqprio-prio-offload-v2-1-fdd8b69efccf@oss.qualcomm.com>
References: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
In-Reply-To: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+e/1etHRVEgx
 sUGxAyN2i2GFF/3ynGQmoQA/vwkIAkoEXBPB+lapU1Y4lysqP+cWtBrW/dRxHtgYNlryr3wBrKP
 EEVVQ29p/8cJyH/Zo/rTaxqexdWC6WU=
X-Proofpoint-GUID: sXnrwib4jxfFjPjvu3Ci_OcoPzPJA0pz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+zUvB+KReNPD
 bh20re8eQeGjW9QmUis7BdzTe5UhFjtS69iLO70wXbQ5qAdUzc0ykC3k/1LFmDyg+pAf0quoBZV
 zilEIb1ap2pCOCXF8AVx3eraZgQn5bn7UdM5TMRHDiGQcVKGy6Qr/z+JokLkxiarvGKN5TKuJna
 +EiaaYig8zNQShNVZZtSeSbnfzp6zASRq8VNifTvZ3UlPUO3twLmAdh68pZMX+mGKSJI9KSnbKE
 tu0qrrW1YbIXr/D5lnr+6nPkh8i+pyZwmaRNynLQN+7YM4fGqXbuA0I+v9HsYs+kX3z8CqOphG9
 EhG6eFWsH8FlX/jeRCv9Wex7xOYnBn1QEblklr8rb8BpkFofq9mIQDyreXc/MdjaN8NwdWVhAsH
 JlGaNF/AU6y8sbGvFNLAWYv/cN6obzuJLW6JkG7xIMnkBvj24JgpyK16f3+hmZeNcBJFFm89Ipj
 Aw8WzPtFByseF7ruThw==
X-Proofpoint-ORIG-GUID: sXnrwib4jxfFjPjvu3Ci_OcoPzPJA0pz
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4ffbc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=YMusGnoBK0k3reyp_EkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_034725_153605_AF1A37D6 
X-CRM114-Status: GOOD (  26.66  )
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
priorities to the devicetree configuration.

Reviewed-by: Davide Caratti <dcaratti@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   6 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  25 +++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 129 ++++++++++++++++++++--
 4 files changed, 140 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..69b400e9b138 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -299,6 +299,12 @@ struct stmmac_priv {
 	/* Protect est parameters */
 	struct mutex est_lock;
 	struct stmmac_est *est;
+
+	struct {
+		u32 prio[MTL_MAX_TX_QUEUES];
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
index bf9e7e4cb1c3..0c9083f8846e 100644
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
@@ -7921,6 +7915,15 @@ static int __stmmac_dvr_probe(struct device *device,
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
index 42a00446e9b4..54242461a860 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -346,6 +346,9 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 	if (!priv->dma_cap.av)
 		return -EOPNOTSUPP;
 
+	if (qopt->enable && priv->xmit_qdisc.algo == MTL_TX_ALGORITHM_SP)
+		return -EOPNOTSUPP;
+
 	port_transmit_rate_kbps = qopt->idleslope - qopt->sendslope;
 
 	if (qopt->enable) {
@@ -1265,6 +1268,23 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 				  struct netlink_ext_ack *extack)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	int i;
+
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		u32 prio;
+
+		if (priv->plat->tx_queues_cfg[i].use_prio)
+			prio = priv->plat->tx_queues_cfg[i].prio;
+		else
+			prio = 0;
+
+		stmmac_tx_queue_prio(priv, priv->hw, prio, i);
+		priv->xmit_qdisc.prio[i] = prio;
+	}
+
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
+				      priv->plat->tx_sched_algorithm);
+	priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
 
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
@@ -1272,6 +1292,73 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
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
+}
+
+static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
+					struct tc_mqprio_qopt_offload *mqprio)
+{
+	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
+	int i;
+
+	if (!priv->dma_cap.dcben)
+		return -EOPNOTSUPP;
+
+	/* Forcing strict priority conflicts with the CBS algorithm
+	 * of AVB queues, so reject the offload when any queue is
+	 * configured as AVB.
+	 */
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		if (priv->plat->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB)
+			return -EOPNOTSUPP;
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
@@ -1282,23 +1369,22 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
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
@@ -1306,6 +1392,24 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 		num_tx_queues += qopt->count[i];
 	}
 
+	mode = mqprio->flags & TC_MQPRIO_F_MODE ? mqprio->mode
+						: TC_MQPRIO_MODE_DCB;
+	if (mode == TC_MQPRIO_MODE_CHANNEL) {
+		err = tc_mqprio_validate_chan_mode(priv, mqprio);
+		if (err)
+			return err;
+
+		priv->xmit_qdisc.algo = MTL_TX_ALGORITHM_SP;
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
@@ -1320,6 +1424,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_num_tx_queues;
 
+	if (mode == TC_MQPRIO_MODE_CHANNEL)
+		tc_mqprio_config_queue_prio(priv, qopt);
+
 	return 0;
 
 error_reset_num_tx_queues:
@@ -1327,6 +1434,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 		netdev_warn(ndev, "Failed to restore %u TX queues\n",
 			    ndev_num_tx_queues);
 error_reset_tc:
+	if (mode == TC_MQPRIO_MODE_CHANNEL)
+		priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
 	stmmac_set_ndev_tcs(ndev, ndev_ntc, ndev_tc_to_txq);
 	for (i = 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
 		netdev_set_prio_tc_map(ndev, i, ndev_prio_tc_map[i]);

-- 
2.55.0


