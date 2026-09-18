Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEACC982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KVQCxOchq17ufR19Hr20P9fWQwGc+HwZsCrDbG1gqaM=; b=y9CAapCHdVlHo+BMnx6jlNgJFY
	dazUutS/GFjyWesAUIwRmmcZHzXnbVm3LLgDnZb3MFZXqCrQMDM/TdEUcm56w7xZ00/OyGCiyvSIF
	IoFyHmqH7Nq9Hk1hJNk5EVBylnDNz0fp6Qw0ydfYeo62Ofr/NZi2h69WeEjrYppQcjK2e0mGSb+w4
	QIlnYdKOVtJ5iXuUvpC94hQlniuD5NV9nFfDsib/1qX7x1CJiSysX/v4th7SDWtvtAB2Gj6wr17kZ
	S3rS1J5NFyBEjGBFXrMj347s1TwGMri3EnqEJYvVOjLHMTwOK32CwpBXr2lCm5+0D6IFs4B+GVfez
	6duPoFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WxP-0000000EH1w-25If;
	Fri, 18 Sep 2026 11:40:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WxN-0000000EH1T-3FOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:40:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3csk3208460
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 11:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KVQCxOchq17ufR19Hr20P9
	fWQwGc+HwZsCrDbG1gqaM=; b=HfrPwgBmhZeY7wunZ2OWshFLnjWv2LMsyIGe77
	3ZZxVEoqPm/ECwK4ddayKXQnuRQpWM87EmciQ6lv9Us7YzgotYYAU/nulqEv/uYH
	BNrCX/wkHQ4JgUCj61EIyqz1RJuYRlafHOcHGMjahGOOzCVH/xNXCyTVzzkvZZ7y
	2yAJIQwN30ORHNRWN4ONsHI0MlkMAFug57mgFmPop08iG5kRllnhAfoUv2wkREwW
	4soAXsbdLOpy3vb2gUP0Ui/9+YNduLP8cPWcSNxz/92uj5qqtcprNYsbnwBzd30Q
	iik9s0fAQEkotnbzWiGB2h/L+V/Wqt7Qc+GBtaoKpvDjZ3Sw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgasq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 11:40:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso124842185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789731640; x=1790336440; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KVQCxOchq17ufR19Hr20P9fWQwGc+HwZsCrDbG1gqaM=;
        b=I8voRNjN3kIppO+d8MdefW4MgELkBT7wajoyqtq5HB7v5+waTlls96esr4VOkK8YsB
         UydCyvfBWZ088Wp8sUN2tiv1jO1af3l0BEJzXeSAWaujDv986d0uvRnc5lj6+h7iWm3j
         KkcQJD+8uI7tfn4NCYk2hm0JYujuymIbTcNTAQtCagxQ/vlUqUTr3XVDe5E69RmktxlU
         fzCIGLXIa+rkG/HzvNYopHh29BZm8LZq4911HmK61k/9oLZy2r0/Has/0VbxDZWBxJ2Y
         sLduOpv2hzp0mzptMbvafmtfKfaVn/L0jyzDZp0f/0F76sOoUz8R+4EYRbU/W2g+yI8E
         cpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731640; x=1790336440;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KVQCxOchq17ufR19Hr20P9fWQwGc+HwZsCrDbG1gqaM=;
        b=iNIAaIHM8W8SJxHrDZPsERxJ2LUeD5xF+xTt+jYeSHgxmU/8XBciwVbkc2uyCtqaLr
         T0HNWGqEA0ueI+/GzFHrVwtCcq0dRQJ4ZxIa4vWZ3il7KEiREcHEim+vgdVM98fLzneN
         hs5eljGvqMtEwq0lqPYs9kUZ2Bm48Hjs8BIAyw4OzvzzyoFW/oHOYCsBMBM7cVaZNOB+
         iANqxg2iE2KxLssc0t53ivELORAUN1Xvvnpun8pnpcpi6vTa7uZSG98Hbj02eGrkgMvC
         HkZmr5clYKMZZzoQXxo9MvsoMmNZHy4mPYeJZrxx1SQnqQ8B6n1YvVgDICidJhHLr2sV
         vxWg==
X-Forwarded-Encrypted: i=1; AKwUvBw6vHxr6N7/H1twYn46+o0F3T6tpNoJAt93nTuODE9QmtBwzmCdGjWrGuYLDcHnM+F0S89N/IqmSPClTLVccB7i@lists.infradead.org
X-Gm-Message-State: AFuF++mj3i7l2goVWrKCRucIh1GNjOPN4bD7FdFoC5QTzrk0J4ZFvevx
	kKPtDXAxbxtuVoYBVa8jjf6jeGco/VCZNKtVo9c51rMxbJJKC5uqeF4K1ZxDto3+6Es52+LeT6J
	F3VBHveo7/CQoZEYtOqhYwgY4xtNcHX6djR1QV3imY0qH3g/W0WVUB0d/I5wkc96zt2K9lOOYZ8
	nxaw==
X-Gm-Gg: AYBFou39ofZMAZwtICQCsJ8sOubK1r+Z0xT/VpgoAWTladEAmFnFEnA4ARmp+2U/aqi
	GEwxCyi+tfGTsIX6Sk7lXZd24dHLIOfOjXpxCdV4igN37iLQr4X2Ah5SCicqNF14oLysJ6PgQeS
	SzCtO589UrYB/4vbO1iFhCmpZq6D7cruvD3t3UuqHBu27chTeUHuIhyBmwcnBoyLVRNfLLBckJf
	z8PvSxZSrm4F0ajPk8X1gckWr7N8jEA7MiUIf7Gr9h4lgMbNDN6tshf0KTEQ/1A/U7XM+SPsMJc
	X4l2V4yLRjUQS6w/PTyDkG26B3q462cS0cZrAlnbSYhVm8/dtx9nvRnK2clTF1j9CveIXP9Si7v
	wyw3j5gvibFtL4A==
X-Received: by 2002:a05:620a:44d3:b0:939:78da:5c2f with SMTP id af79cd13be357-93bdb47d41fmr333137385a.43.1789731639987;
        Fri, 18 Sep 2026 04:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:939:78da:5c2f with SMTP id af79cd13be357-93bdb47d41fmr333133285a.43.1789731639369;
        Fri, 18 Sep 2026 04:40:39 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm3741482f8f.5.2026.09.18.04.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:40:38 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 13:40:14 +0200
Subject: [PATCH net-next] net: stmmac: add tc-mqprio qdisc offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stmmac-mqprio-prio-offload-v1-1-5328157fcb58@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqFIBBA0V+JWTdQBmX9SrTw6VgDqaXyCKJ/T
 9pcOJt7Q6LIlGCqboj058TBF7R1BXpTfiVkUwyiEX0zthJTdk5pdOcROeCXYO0elMHOSGHkYIe
 fllAGRyTL1zefwVNGT1eG5Xle5/0MknYAAAA=
X-Change-ID: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE2MiBTYWx0ZWRfX1+utdopoNy2U
 Un2eXlaSKqXwZsi/mNx8l7c9KNeM/7xcQxcvI75Y94OIPNbd6+y3SuKKroFDsdNKRd7ZyfSexmS
 3/6nbjCAE3d5XB4YPWu+yvxuOWtJ6lw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE2MiBTYWx0ZWRfXwlbCqaL7vqQD
 Efhq3z/cSYiPZKvLXk2JYDp6eNZqbxPz6qKYW3s61SM45qwBHZmWvJWhu5K7A2QjIZBIEC1n8dN
 18sn9bq4DIja1guPp+wufx1ABEDzyrS6dQR/UlSsI8RgsaVeKq6yunYiWXy/mgoQGwAY923obJo
 3DvN/V8V88kVPKD7Wb94843/a/aOfJokE7rQ901HQE4zKlJqp21Noo9/D0EEBaR2A4tc/xKUhC6
 apQ3pjb9aB4f4a/XCwbQkmnOUbV8N9nRiLSzS9/bEgVR70bDirAzy2MP0QKNEpovHcmCoSR2JH1
 eDXlT5NkUdJpDS5yaoHj1J+qKxGjryBVLdBJXdb9wEvXEH0/Rn/j5g0jrD1qburtVesMUw3dxV3
 RjzIYeASvdzyhfeX790NTmiOKPbmg54LOsYPtMuYC1IFsQ6mIbT+4Sr1pACZwf1vVQtTaHkTjve
 LAlmFty0wMdbeISkiuw==
X-Proofpoint-GUID: f1QH4m6s38nCfyKSUWbnhAg65SeEQKpn
X-Proofpoint-ORIG-GUID: f1QH4m6s38nCfyKSUWbnhAg65SeEQKpn
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad2339 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=saBcvNNEQVSn8UZTesAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_044041_826076_989AC95E 
X-CRM114-Status: GOOD (  26.38  )
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

Implement offload of the tc-mqprio qdisc in the stmmac driver. The MTL TX
scheduler is switched to strict priority, and the PSTQX/PSTC priority
bitmask of each TX queue is programmed from the set of frame priorities
mapped to the owning traffic class (qopt->prio_tc_map).

The offload requires the DCB feature and a 1:1 TC to TX queue mapping,
with a single queue per TC and per-TC offsets below the number of traffic
classes, so every queue referenced by the map stays within the TX queues
enabled by the offload. Configurations with AVB queues are rejected, since
forcing strict priority conflicts with the CBS algorithm.

The per-queue priority bitmasks and the scheduling algorithm are stored in
the new per-qdisc state (priv->xmit_qdisc) so they can be reprogrammed on
device reopen.

Destroying the mqprio qdisc, or failing its setup, restores the netdev TC
map and TX queue count to the previously saved values and resets the
per-qdisc state to the devicetree configuration. The devicetree configured
scheduling algorithm, TX queue priorities and TX queue weights are then
restored on the next device open.

Reviewed-by: Davide Caratti <dcaratti@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  6 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 77 ++++++++++++++++++++++-
 4 files changed, 96 insertions(+), 14 deletions(-)

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
index 42a00446e9b4..a2a9680da5c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1265,6 +1265,23 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
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
@@ -1278,6 +1295,7 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	unsigned int ndev_num_tx_queues, num_tx_queues = 0;
 	struct netdev_tc_txq ndev_tc_to_txq[TC_MAX_QUEUE];
 	struct netdev_tc_txq tc_to_txq[TC_MAX_QUEUE] = {};
+	struct plat_stmmacenet_data *pdata = priv->plat;
 	struct netlink_ext_ack *extack = mqprio->extack;
 	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
 	struct net_device *ndev = priv->dev;
@@ -1290,6 +1308,17 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (qopt->num_tc > ARRAY_SIZE(tc_to_txq))
 		return -EINVAL;
 
+	if (!priv->dma_cap.dcben)
+		return -EOPNOTSUPP;
+
+	/* Forcing strict priority conflicts with the CBS algorithm of AVB
+	 * queues, so reject the offload when any queue is configured as AVB.
+	 */
+	for (i = 0; i < pdata->tx_queues_to_use; i++) {
+		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB)
+			return -EOPNOTSUPP;
+	}
+
 	/* save current tc values for reset */
 	ndev_ntc = netdev_get_num_tc(ndev);
 	for (i = 0; i < ARRAY_SIZE(ndev->tc_to_txq); i++)
@@ -1299,6 +1328,20 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 		ndev_prio_tc_map[i] = READ_ONCE(ndev->prio_tc_map[i]);
 
 	for (i = 0; i < qopt->num_tc; i++) {
+		/* The offload switches the MTL scheduler to strict priority,
+		 * which only supports a 1:1 TC to TX queue mapping.
+		 */
+		if (qopt->count[i] > 1) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "SP sched requires 1:1 TXQ map");
+			return -EOPNOTSUPP;
+		}
+
+		if (qopt->offset[i] >= qopt->num_tc) {
+			NL_SET_ERR_MSG_MOD(extack, "TX queue range exceeded");
+			return -EINVAL;
+		}
+
 		tc_to_txq[i] = (struct netdev_tc_txq) {
 			.count = qopt->count[i],
 			.offset = qopt->offset[i],
@@ -1315,14 +1358,44 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_tc;
 
+	priv->xmit_qdisc.algo = MTL_TX_ALGORITHM_SP;
 	err = stmmac_fpe_map_preemption_class(priv, ndev, extack,
 					      mqprio->preemptible_tcs);
 	if (err)
-		goto error_reset_num_tx_queues;
+		goto error_reset_xmit_algo;
+
+	for (i = 0; i < pdata->tx_queues_to_use; i++) {
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
 
 	return 0;
 
-error_reset_num_tx_queues:
+error_reset_xmit_algo:
+	priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
 	if (netif_set_real_num_tx_queues(ndev, ndev_num_tx_queues))
 		netdev_warn(ndev, "Failed to restore %u TX queues\n",
 			    ndev_num_tx_queues);

---
base-commit: 4bb9710c6a68d35207f123aef55dcd50e7195ec5
change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


