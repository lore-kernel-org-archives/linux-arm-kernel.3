Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4878DCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHKcEqme2xcoknVD7+KnaF778ZgT1c2/tD4kiWYN7M4=; b=FRhlxsUw9OqwpI648vYhWUoT3E
	Ltk2r/GQCvrU5+Oj7KFNO4OGeNToeNzq1WqBZP+5uphmkCA1IeMdbp73tOgK5awpgFRRfSELyH96L
	AcIiM6+967GqxT21pTbQtKnMN47ccOUkM2MO4mkEBsxb645LaCBOxxArLCCuCDkR9vpna3OngMqzO
	eBchh87catgdA3y3l+ntW7U4bF/g8dBqobW5lG4dtR1ihGuRDasVIBV8VB4a9N6KLQEvytpxRaFRn
	82AqaGQ7HfIS3e+YnkpzhmwEmAVxKfu5tUaNqEicQDn8WT25VGLgYUp2hJFCX3YL6nviOMvq7RByk
	38hitagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEY1-000000014vg-3QEa;
	Mon, 28 Sep 2026 16:49:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEY0-000000014v7-0r6c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:49:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEds531895244
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHKcEqme2xcoknVD7+KnaF778ZgT1c2/tD4kiWYN7M4=; b=kCOYE/KzLgDosKCO
	klrO/pqum7JBvK7opr4I/Ssw1J8XFJWZUtqcLxSauLRKUigXIpzPxepCZz2U7jYf
	VVoST/WsZQaGMHgtWKAa5icsaZ0IHnFfipia9p/bp0lR3uQ3nmqJDGZfyUURorcV
	CyryFsL3cAWs2E9Wo5aDXydqTYrBu8lxMq2pZTL22QoUfIBSYmU/frIX2POMMERy
	T/+Ueh0Zdyp89t7f+U9rqQ11B6UgUu80IC8z8rxye8TmEHEWRysu0voeDX8CU3wP
	E6Xb34GSMPe7qDedENBsUrNFB3zuRgAs8zu1WEWEqejO3bvJSILRErcMZRzik1PN
	ATg3lA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s2kd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:49:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-986e79a43b4so2071770241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790614186; x=1791218986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHKcEqme2xcoknVD7+KnaF778ZgT1c2/tD4kiWYN7M4=;
        b=JuMVQk4csJtLTqCIf2s4Qvm+LpdKJVmkWgG/V7DvI/nCWD1mZ3vFOrOI6ZLW4TEXbA
         RsybyvcsLPq2gXi6P2QK91pI9TfAc2Gk2cASU5QcaRrir7SuGU+jLgB6Imx16uzFVM1d
         NRR3lhPD8luz37AOE/YxtAPNU5ndy9+Rdhs9YDGZ7xLpmetB4i6QXfYkMpzJJ41uzXrf
         UMA+HFKSjuWSxGNFqxuJU3j7rLlcFb1qu1P9pGTJKxtxDoMxE4AXYw+yJin0jnno+fTD
         BvIkxLzroWv0WKmMP252ODD38HAQECyK9GKymBiO6zoxF6FM9UPsAKMbWOmAww9Ls04Z
         49kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614186; x=1791218986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHKcEqme2xcoknVD7+KnaF778ZgT1c2/tD4kiWYN7M4=;
        b=JKLF+75teUP3a1Vf++gu2UopOW/G4GdKw2lFtaA+eFA6ro3mKjwu+RwJzOlcl2pSJU
         MMUndcLDjCan63Ho4oiP5uZIm1oXiy74eqp33b+UUVGmK/TGuFyXNRi12XYuO//FsLsK
         Nzh8IBfiBILmuwWrd+N10dOd7kBkl70FX7DbayPMipdsQhngWtE9hL0tFo8JFcyoBzAV
         0ZPpNq/Zn1deViPAksWRjZA7cgAT3H10V2B8pjxOWciTUXQbMOKnovQNcFVuc1xW70L6
         Wpxsgw0RTNaa+z6TzwCn5+TrheOPgp40DS7Dvkz6SIx8WZdaEPR3aF/0HO65DaEnyFYp
         8+Ew==
X-Forwarded-Encrypted: i=1; AKwUvBy+k8pPPEOLeQcT4h4+kbVH6C4Gdu4A7fxYjIx3jKGvSandiqdCxo6YLyoKRSJ21ooSireDSpxcZQSKpN7eQw+Z@lists.infradead.org
X-Gm-Message-State: AFq9FYLpmlGDyUWuLbvMqZFVQqCk9btLD/k9r4bcuweDOMA/DrmpHuUq
	6Yw+RjZpe9mFcoFYFxrhcIjoX9uwZrRIqI2UTdl1YB7pCDKA6AMfcRYxPe3S1O3n6nwyqUGIfEM
	36a2zAIdUVKA3m+ifv/SHeQgyreIsOdtfglkEMksmHeicZ0Nb+0C3qnInPttGMwwCICsLUCO7Os
	gIZw==
X-Gm-Gg: AYBFou3LwwOJg+ZBO3OoPKgMo3Y43DiA2zV2yyEst3ep9A2kGRXAl6V0imi+/6NIvkw
	GmQiYhBry5cShSk56WFS6QJ1Zvl7AY6dwCI8H5c3VZAi6YTl3k0+UU78xnsTZ4Dthj/+L/BzvHi
	iUmiRHa1a2y9mq9nLdw+zJjl5dEaqRZL5hzse5TEODIXhFYho+sVNh5yHDJb8QU8BnUyOmSQhov
	39MXh7G4KfveZlCaIJUsyFqfRiQT7cUnuGMYl8ZUYW/RhAf3YOGEsrW28/eDYYFGjYtdL0t700x
	xJynTvk2tQtx4cqAnjrgwdxuNfNx0uoxIWXv/5bk5EZ0+AgSEsVn5yHVzuNUE/dM+KUutAZh6Sf
	s89tSEYsvCMptfg==
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr1639103137.37.1790614186475;
        Mon, 28 Sep 2026 09:49:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr1638300137.37.1790614137480;
        Mon, 28 Sep 2026 09:48:57 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm28953976f8f.32.2026.09.28.09.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:48:56 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:48:14 +0200
Subject: [PATCH net-next v3 2/2] net: stmmac: align real_num_tx_queues to
 mqprio configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-stmmac-mqprio-prio-offload-v3-2-abbe181f5024@oss.qualcomm.com>
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX/BpRMydbjqQw
 9clTOOq36mV3SxYqaHuHzhzoYKm0X/y+LqkMoFCajOqPxzrS35MC3didS1Kpk/nz85aBwGSqaqc
 gsqhPNj8EJwyDhpBhMcldzbOBfkyZQXtOx1NA/ub75i0WfaksjbCDfbUM/E6f2DdASG3sc1w1lK
 ECNMJ1YeGXx8dPY/tnEZOpnQd7jcE4aFdsg1wnyiOPY6pnPIvjXz2sC7DVSOP5nP8mjRkDS5ApC
 dvNiVwhXUuB1dOSoXmCXfVlHpY1vZtAnpHTSuzfcFsMdspAeIX8OZd+01vSmAKf7M6qXXXYXxkW
 d0lV1oW6UVLjXYmW1DtjxginQjF4zRFgHda+QNGdfreI2jnDwGbw6bT4i/0IlDyIJht5CooQOiK
 usL81SGLgwfW0hGSfv9jSP2aH1VOdXPs8mIAUClnkmCOH4a3QEZxDLrjiXCMsjpSKZBQB/eNRvd
 LgO+k22TnfQHFu9dB9g==
X-Proofpoint-ORIG-GUID: 8gykubtpkWsSCfYOvlorxvbxACp6YywC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX3/xPm/QIK2D/
 VMkQlDtogRknp6LT6ar4v5cjRsgDM0EdpnJpfFNfl3joJX4EZRxXvVsumvITpmNhY+e1Lm3BaGo
 9WhxWOO2aAE9HY9PIKfOJslZ+QV0K4c=
X-Proofpoint-GUID: 8gykubtpkWsSCfYOvlorxvbxACp6YywC
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba9aab cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dbvV_YUU-CEaD36rsUoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_094948_266772_2E39F64D 
X-CRM114-Status: GOOD (  23.66  )
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

stmmac_hw_setup() unconditionally sets the number of real TX queues to
plat->tx_queues_to_use on every device open. When a tc-mqprio qdisc is
offloaded the driver reduces netif_set_real_num_tx_queues() to the number
of queues enabled by the offload, but the next device open reverts it to
plat->tx_queues_to_use while the netdev TC map is still the one programmed
by the qdisc, leaving the two inconsistent.

Track the number of TX queues enabled by the current qdisc configuration
in the per-qdisc state (priv->xmit_qdisc.num_tx_queues) and use it in
stmmac_hw_setup(). The field defaults to plat->tx_queues_to_use at probe
time and when the mqprio qdisc is destroyed, meaning no offload is active
and the number of real TX queues must match the number of queues the
driver allocated, and it is updated to the offloaded queue count on a
successful mqprio setup.

Refuse to lower the number of TX queues below the count required by the
active mqprio offload in stmmac_reinit_queues(), otherwise
netif_set_real_num_tx_queues() would leave real_num_tx_queues
inconsistent with the netdev TC map.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  6 ++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f1bdb65d0fe6..40eab899027b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -301,8 +301,10 @@ struct stmmac_priv {
 	struct stmmac_est *est;
 
 	struct {
+		bool enabled;
 		u32 prio[MTL_MAX_TX_QUEUES];
 		bool prio_offload;
+		u32 num_tx_queues;
 		u8 algo;
 	} xmit_qdisc;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 27e4e86e3c8b..1c25d1c129d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3772,7 +3772,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Configure real RX and TX queues */
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
-	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
+	netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);
 
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
@@ -7676,6 +7676,10 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
 
+	if (priv->xmit_qdisc.enabled &&
+	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
+		return -EINVAL;
+
 	if (netif_running(dev))
 		stmmac_release(dev);
 
@@ -7683,6 +7687,9 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 
 	priv->plat->rx_queues_to_use = rx_cnt;
 	priv->plat->tx_queues_to_use = tx_cnt;
+	if (!priv->xmit_qdisc.enabled)
+		priv->xmit_qdisc.num_tx_queues = tx_cnt;
+
 	if (!netif_is_rxfh_configured(dev))
 		for (i = 0; i < ARRAY_SIZE(priv->rss.table); i++)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
@@ -8003,6 +8010,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
+	/* Default qdisc num_tx_queues */
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
+
 	ret = stmmac_tc_init(priv, priv);
 	if (!ret) {
 		ndev->hw_features |= NETIF_F_HW_TC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 07cf4582ed76..8bdc411e902f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1290,6 +1290,9 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 		priv->xmit_qdisc.prio_offload = false;
 	}
 
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
+	priv->xmit_qdisc.enabled = false;
+
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
 
@@ -1438,6 +1441,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (mode == TC_MQPRIO_MODE_CHANNEL)
 		tc_mqprio_config_queue_prio(priv, qopt);
 
+	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
+	priv->xmit_qdisc.enabled = true;
+
 	return 0;
 
 error_reset_num_tx_queues:

-- 
2.55.0


