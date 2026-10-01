Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D396CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oDFYsh9mnWtMPcaBpFSVg79NtIgY46+tkUCTRyhxGc=; b=kPPi/ROZ0sK9eC+28BINX+fbXy
	bMw8NeWCKVsVUPhtF6kIhfQVZYo8JIknn118wXgPddYjRtSDiZ3DawVOlmtee9aNV9yUmnAO7gYq7
	nLmBN/wvgZ1LHMdZpgpONvxo9bJVJRfE2KKWAotNKGs+8EUS/KIZI/5bomzC2CjIoIwq7YOyrD6qq
	cqh3JFsDjpvJJhpbZ6o/yQ1Gi5abC8cN/ozsaZC7JZAGgR/akw46u3e8IYifXZUUutrzUNJ6QOBQd
	L04+gUWRwlFOcmwaxCSzOgvMra4jLFZdiq408AsiKbWyezrlCdWmfJoQB6440nodvyWD0wPKTtVey
	k/0DPv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBb-00000009HE9-3dUM;
	Thu, 01 Oct 2026 13:51:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBW-00000009HAm-2OBu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:50:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjHuV2403843
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 13:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oDFYsh9mnWtMPcaBpFSVg79NtIgY46+tkUCTRyhxGc=; b=k9FCl05ReU943MH9
	OT91GQ6Ht2jIYQrVhIGbKhUhBB4JQETwGL1qkhcRLIfYvObhIgTnidJqosss7QRM
	bkwA1IT/4PwJxyvgVUPVlAOZsfMXrfjjK3iazILMDen+aHV0KTnT+mSuSsZNsMtT
	LH7zY7BlfPC4qYDtsDEKtO+gVNwLgMu8/u4maup8UZW9f6kbb2nlcDF9pfww82DS
	6RqsKY4EgpavSGIE7oKVX2nh9sFVggDjJwF6G8GjmOcVb1jjo0ueb0X/bZLeE6pJ
	viJXFghyVIwH+uiKogZxwrAkX2X5guznIG9tfWTbQNdjDXOB05oMwaI6Z56nkYag
	PoolNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sv0tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:50:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so109697485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862653; x=1791467453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oDFYsh9mnWtMPcaBpFSVg79NtIgY46+tkUCTRyhxGc=;
        b=cJHmgeEkVy+5AQ4NWvXfZSFTE6REz8Pdwm2gEZTCEF6d+SPCGFr53kVt/K/g74kmUH
         OqiDWBf1T+epjSFmmv4lucbwEsR7RIyp6cl8kh48zWB6tbBiuY7kVr/nYVJHHVa/Unw9
         QveGcHrFrxKQpOVxvmag4+hD1mKPyD53TA6GzGFbPoRoUykExcJNmq7paynvJ+GOoTNz
         qHDlC06VYArMuH2L38bQLcDjfLj0xpwKiYkxmY7zxp5WORnoccwTgN92o8567+31zEb9
         7xhNdJ6D4Bdr9ULTPwNs6g+okrLiVilysDJaUVow651PZrjajFScVAjEQdljHRXmVnS8
         o4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862653; x=1791467453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oDFYsh9mnWtMPcaBpFSVg79NtIgY46+tkUCTRyhxGc=;
        b=JBbVpP/6vFRoOqE1PQAXrIAzN50YkTzYZstYzktTw/0+XC+i5DVB+DzzwwDfHL8uCo
         xhDaSol7PaQ0fzCymU9dL5w9LkwTw0IIlmo5yfZAqPa4TwlIV0FNp43m7i1EJ9fYgron
         UdGh9K0Oti7F0NOeTkrXWrLNKbXxa6DSD6NgjLmJzKCpPAqlflkgxSxULkTh4UI+x/4+
         gvjyZKmgxH9pgD7sAEUXFACDDPuomTBNpbNUyJhJnn3V30hRSyU/u/TRs+AQtrj1HFzJ
         MiT03Eg+P16sUKIP8FZAEvVKpB3TOBeHLWb96A4M5n/O5riK2qYf9HgeLo9+uv573STp
         s53w==
X-Forwarded-Encrypted: i=1; AKwUvBzzRZRD4J5L62X9rQdrWiTVhd3h4186d8kK4vcTDaE7GunVYRCoWXwCQTEIn2+CgQb7BSzK25HWU3Anu2qPRbNg@lists.infradead.org
X-Gm-Message-State: AFuF++mwHmIWlDm//qGfTdKmY9XrRSnTzWnrD7Pnk6IhlzMXrP7gYS7X
	e3iU6s6zpfP4cLErrLq+rWb+NDFuIr/VmRZj2FPt7+LJiF5m3MV+imgTj34JJ9FjK3gpXY4HOGt
	960hZ1QTj7z3dO1biarsHHD33F7z/l65Ao0u2BXwnZfj61ae1yRyIGYUyMLzUp/L15pi7/XCT4I
	uc9A==
X-Gm-Gg: AYBFou3YBxb/0sXjMSz7wVo3YwM34ZNk+DtWerGLVXlmRn/c6vtzBfdKdi0WAj7iwYo
	vk2pqsYA9egT5Y/vgK2RUY/EQCHfrw4v3vjLd0H9Ya2hSchApNcnxYEkSdlPEvr+MWqCBBxdX2c
	YIuq7nmjxlY1cRNnjo6tH+hsgbhpzjtq8qP9p8QhapY0aFS1f1K+q65PbjPV1XZ9ktltK+869b0
	+9UW6uOqNbHn69cEPA7eFg7M2k/zrRYEa0invj+J9PlZFqxxuao8fhF819W43fPUjeCmtS9R7zh
	6fLXYDXuAwh2rIz3L9JhsOd+mIHoZS3xR4X0HfJ8CaA7c+OPgO7aHCFEc7NPN+JA42Lta2QdWJh
	bym+3qBi42WF0iw==
X-Received: by 2002:a05:620a:4482:b0:93c:9e87:de76 with SMTP id af79cd13be357-93cb59f3445mr540085085a.10.1790862652505;
        Thu, 01 Oct 2026 06:50:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:93c:9e87:de76 with SMTP id af79cd13be357-93cb59f3445mr540078185a.10.1790862651829;
        Thu, 01 Oct 2026 06:50:51 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f922ac4sm68023315e9.6.2026.10.01.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:50:50 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:50:20 +0200
Subject: [PATCH net-next v4 3/3] net: stmmac: add tc mqprio hw queue
 priority offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-stmmac-mqprio-prio-offload-v4-3-a74610d7f1e5@oss.qualcomm.com>
References: <20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com>
In-Reply-To: <20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXzlwlfzkWAuQ4
 ORhTxUuL4MrPqi3JyWl6dY/pRZSP0f+CxHi3f5nT4+sAlc/2NvHoXJOmNcK9qDVY12pprzPk2FE
 cpcZrRO125e4GzXyYKS5VMJMRY7BEb8=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe653d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=A-CAKDZ11f75D_VAelEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: Pt0cYnyvSslNa1AESGjq0O1F0-JSRgf0
X-Proofpoint-GUID: Pt0cYnyvSslNa1AESGjq0O1F0-JSRgf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX3PyT4vtmwOeq
 bYMI04sJVcHsGd2g9yro/MNnp8wB1nYB2EveulTy9p86Vqhf8N9goFDsEMrdg0ypyjLiaitR9et
 QANJLbrkI9oNz5/wYD0FWiDHBdo9wTm/pfJ/PkwgigbUJ3d1iTU//ptbkOZbmPa0R02c+K7oUcA
 FGpQVSN93krcpUUF7IaPyCvo5iRFF+w4eNQfCrK14JdCC+Xk6QtmyzpRcHwiHW77ddd9EKwCAZP
 A9oGm/m3Tv06/qYsTbDp+INcjps9e4yLXhotV7rtoyanBKNZBm++U03MOUe5/XIq5cjjHCV2C1E
 sN0BQ2aeMVri++p/dL41+HAe1pl8WclccwyoBnP1RIAvWRsp9BIGqHUb2o5FlUmLMBp+ymk0WL1
 dYsbvKZYsrSsfvzNpgtyRyEO8ZScJ5K1gBc1+rpE/0PyVSRWJayzi/10+ttKCrVpgNgO9Czknrl
 BCjCgVjmx4e4HNoKu7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065054_750095_CBE2D90C 
X-CRM114-Status: GOOD (  26.05  )
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
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  25 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 140 ++++++++++++++++++++--
 4 files changed, 148 insertions(+), 22 deletions(-)

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
index 1dc9218bd4e9..faf7e82d5cde 100644
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
@@ -7941,6 +7935,15 @@ static int __stmmac_dvr_probe(struct device *device,
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
index d0c3feb45789..e697e1c5bd6e 100644
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
@@ -1285,23 +1387,22 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
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
@@ -1310,6 +1411,22 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
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
@@ -1324,6 +1441,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_num_tx_queues;
 
+	if (mode == TC_MQPRIO_MODE_CHANNEL)
+		tc_mqprio_config_queue_prio(priv, qopt);
+
 	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
 	priv->xmit_qdisc.enabled = true;
 

-- 
2.55.0


