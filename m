Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F8C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhLD3Q/dBFwFjktbvaON48ujDZRmGhPcZXPnB2PUgwo=; b=V3BNPd6RlnmJqIIGtu24MJOxA9
	CiqFKPn8cddx+sHtLYwcbq9fIxX/43oICFn/mVojDLlnzTaiwQmT70g4HzdVk0nAL7l2TK/0Ff5k4
	jzdRJHnLAVvdfugf0aqeiYrVuh6MHXtf/+IU4n1JLr/erSjdtQxrNvJBEKH6NpgMHHmvGKjEBe191
	RJ3W0D4d2Lagvh+ngXEFLOk9xXiRdmSnUkUQtcqEwO51unyfdUV0JgPKBfU9pqbGESDajfNPgFVvS
	aCldSXrNNDoXquhkw0H5FNy4lg9cnzuKT1TaKJtEhQ0xcPDGZpve8baUmkZKavH+1GKSUU4JNWsm9
	AofAgD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNT-00000009SuZ-0fHD;
	Sat, 08 Aug 2026 14:50:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNP-00000009StC-3qQr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 14:50:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678DbPa03419504
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Aug 2026 14:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bhLD3Q/dBFwFjktbvaON48ujDZRmGhPcZXPnB2PUgwo=; b=XuhAVBQskDKEk3hc
	AqVbrznt8a/VTdBkVA5WtUUYwY9daWR0em1SFJuvvA5CugdIWLYhW/zWIqL9V01j
	XmCifA3+A+Ag3ypxNUCd7nPjrlJuOlkO1vRDFwaVAYHpmyiwUlWKO2+bJINJ2Sxz
	fadRd1bWxj8gSb/Kc1ZC5HQuYd0RLmd4bnoIDqOEo60eWGQuK++jd3IVolyD383g
	zQkl1lE1NS3/gsgZDCl+Ow981DTpRTrXeAgeVszewD1t0mXYMMFdxW/FNN5WuBdM
	TGy8BP2eEUhpqTD0sv1CMibXOGzuebMrpP6TaWrnjJS4b34wCO+/BbVnuJK5HIbv
	VgJotQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgrx1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 14:50:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso9578161cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786200618; x=1786805418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhLD3Q/dBFwFjktbvaON48ujDZRmGhPcZXPnB2PUgwo=;
        b=bjqEkxDuIvNOiqQUb/og2yCbjlG/6EjxOySENBcCCMWt36Tq4Wk/9A5/4hcISmrTnj
         2lUUqt4u7QfBViGvly11SRz4l/PJpekbMx8wIHMpdDZOwC42DGwMYmQDKaCmRzXC0x++
         J9TvhB9GpWgWB86oWWiLR9oU+3Y3BKT8/5+0Mq33Vj/Pna4gjSEgR4CS/BWKIszDk/Ih
         8BoBvEgq/aa/dYfVOEBvOcxbfUIPXNKJgUeHWKLNsjNjBpJxyQ2lEy41JtcHatTiq+B/
         OPh4bgqp4V1okXKXa37CFAntHjPxQww3bKqzEzBboFqDYJ7atYPyQG/QMVpkmB/9MLb+
         GJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786200618; x=1786805418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bhLD3Q/dBFwFjktbvaON48ujDZRmGhPcZXPnB2PUgwo=;
        b=eEnf8dESKr310zIm866LGWP1vy4P5W0VX+z2ZrNkYrlEHGY4rLhNdd7+SSvCVdq5kt
         93uk/Zk5TrLDdQ5BhAUAIL2lCtfwb6o/eEuxn9VXp1vIWB/EzTUm9f1CHWtpc4r8fBAy
         DEHQR+iz+lq4BiSAVRCyo1/TlGPwiKQwnJ0ZpfWvwWVh8f8Zu8oa9k9Z7uQ95m78p7j0
         hrMYHv9kb5g1ghowGM2ziH7h8cpFV/wCjVKb2glRUc/n8BdmMtYAQ6oFSp2K7F5QnY/9
         I1rSfOu2+ULxq7N7Tnc350wIoWFhCvDXaJCuQPhJfw40tBdgfLb2PJgxC7R0Rz8Hs949
         w4lA==
X-Forwarded-Encrypted: i=1; AHgh+RoNSU1+b+W3CozkGpe9hN1lsLmX04mgngkgMXev5KzAfb47KlPxI5/iIOK1qKVSc2xXvCcUwAqqYTEwK5LgHw0C@lists.infradead.org
X-Gm-Message-State: AOJu0YyDq0S4Cd5/1n2P7308uD949v73brVywrgbPYYgVBQdL8NM4TUj
	73ptkw5jC6my3NeG4qwWG0IubQn3XUwE9ywUC90mJKnHTdtogUEFpOiylpbS74kpBjNe2t+iKJd
	DbXvsPVNTreXKMBUxC7NEyog/39xwMr7fxp56Xz2knez/tM5ibYxciz+/e0jRpa/r5RosRTbHQ+
	0KLQ==
X-Gm-Gg: AR+sD12wBTENXB8pTB+PYy4Djp35nJPKizVWLR/m6vCiEveRwTJRGYw/WkdvziV7lx2
	JSo9YHT72mR8wtSKr7IJmAgR8iYW8pu8WTMiysdzgSGWh/OM9ACF2eav0G7JDni2g3K29vOTAjn
	Rkeq1dOmpcmJIqeV1HCuF6A4Wttgootj05cfLcf0C7Y7AWf5hjSDYQz8beSe/PeHCtfsv0SIGlN
	SUBTOkUTVJ4C3MsOh7TdYLdEdVxtMz2UAwwi1HTDaARZkpcQ1IAbZwpxy3wpYTRXibIF7fIl4Zt
	BfzA9nJjjAdyKYzvzu1m3ez2m96Svdg9+IEqjAYIgt2V4PIfqzQVmyBTkEjq7imVH1ikoo9k2L7
	OCDSRkHsCYO0tgOY=
X-Received: by 2002:ac8:5f89:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52ce61fe07dmr322630311cf.42.1786200618175;
        Sat, 08 Aug 2026 07:50:18 -0700 (PDT)
X-Received: by 2002:ac8:5f89:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52ce61fe07dmr322629451cf.42.1786200617586;
        Sat, 08 Aug 2026 07:50:17 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea2e038sm122383735e9.14.2026.08.08.07.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:50:16 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 08 Aug 2026 16:49:57 +0200
Subject: [PATCH net-next v3 1/3] net: stmmac: add tc-ets qdisc offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-stmmac-ets-offload-v3-1-b714466142b9@oss.qualcomm.com>
References: <20260808-stmmac-ets-offload-v3-0-b714466142b9@oss.qualcomm.com>
In-Reply-To: <20260808-stmmac-ets-offload-v3-0-b714466142b9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfXxnvyKDqdPy8g
 zpjnV1XAeVCvak4M+cYvzn6wjk6CviF0uNm0XAxBr7X0nbgp+Acy5lptOReaGPabf3pY4TvZVfi
 9ovkW8rZQeguLYItagAiBxIv752zTks=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a77422b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Wj0ufXod_-a-xOiY-kwA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: xftot2kQg2MNeqPPygCjC9U4ksTD-Zy0
X-Proofpoint-GUID: xftot2kQg2MNeqPPygCjC9U4ksTD-Zy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfX8IBBVJ0ZtqL9
 uZQL052aLewcVkgT+6ixTkDjheFmiGsomCqH+7LSI424lMcJF7orIZiuJVQxTTL4LOx6LyC0JtT
 6p3iSdjpN/2oY0W/B0h7TxwhuWoxDznoMhgnHg9zrDMB+24h5Sj4+vGCLG2ApKabKTiUfa+SOeN
 nxWCOKmo5+LUqjwZABi0IElNeZdfRHnn0fqwzNb9PM4sFQCvJ8gjZAriOSbXgonAQzLeBRwYkBW
 KLJG0UsYQ16iipDa3+xiK3hgQUwno0AyJz6KmOw34eAFfmgw0ZR6CVBtxE6eHj1vRsil9h+objg
 WY77tg3iUtGR4wGVUFEqJ2Vbs2fEIE5iOdZIJvhsmddoX2YdToqcuPgWy26no8A24Mt7RPP+K2B
 N+TENoPPvKNAmCWLpq03KRwORTF/73i6H19KtvytO4QtjNAcAXopTbXiOBTEAYwMfB/R9ZgFv73
 nAl1zJWiaiebXkEmApQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_075019_967611_D722C05F 
X-CRM114-Status: GOOD (  27.13  )
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

Implement offload of the tc-ets qdisc in the stmmac driver. The number of
ETS bands cannot exceed the number of TX queues, and strict priority bands
(zero quanta) are rejected since sched prio is not implemented in the ETS
offload but will be implemented in the mqprio qdisc offload. Weighted
bands whose quantum is zero are rejected as well, since MTL DWRR would
never schedule traffic on them. Configurations with AVB queues, or on
cores without the DCB feature, are not offloaded either.

The requested quanta are applied to the TX queues and the MTL scheduler
is switched to DWRR. The number of active TX queues is restricted to the
band count so the stack never routes traffic onto queues left with a zero
quantum, which the MTL scheduler would never drain. The offload state is
cached in priv->qdisc and re-applied on device open (scheduler, queue
weights and queue count), so it survives a reopen or a reset.

TC_ETS_GRAFT is not offloaded and silently falls back to the software
implementation, while TC_ETS_STATS is accepted when the ETS qdisc is
offloaded, although no hardware statistics are provided. The DESTROY and
STATS paths act only on the ETS instance actually offloaded, so a
software-only child ETS or the old root qdisc of a replace cannot reset
the hardware configuration of a live offload.

The FPE preemption mapping is now validated against the effective
scheduling algorithm and weights (the DWRR quanta when ETS is offloaded)
rather than the DT configuration. Export stmmac_set_tx_queue_weight() so
the ETS path can reprogram queue weights, and have it skip AVB queues,
whose weight register is repurposed as the CBS idle slope. Wire
TC_SETUP_QDISC_ETS into stmmac_setup_tc(). Destroying the ETS qdisc
restores the devicetree configured scheduling algorithm and TX queue
weights.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Davide Caratti <dcaratti@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   4 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   8 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |  20 ++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  34 +++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 104 ++++++++++++++++++++++
 5 files changed, 159 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..b70883a53b09 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -580,6 +580,8 @@ struct stmmac_tc_ops {
 			    struct tc_taprio_qopt_offload *qopt);
 	int (*setup_etf)(struct stmmac_priv *priv,
 			 struct tc_etf_qopt_offload *qopt);
+	int (*setup_ets)(struct stmmac_priv *priv,
+			 struct tc_ets_qopt_offload *qopt);
 	int (*query_caps)(struct stmmac_priv *priv,
 			  struct tc_query_caps_base *base);
 	int (*setup_mqprio)(struct stmmac_priv *priv,
@@ -598,6 +600,8 @@ struct stmmac_tc_ops {
 	stmmac_do_callback(__priv, tc, setup_taprio, __args)
 #define stmmac_tc_setup_etf(__priv, __args...) \
 	stmmac_do_callback(__priv, tc, setup_etf, __args)
+#define stmmac_tc_setup_ets(__priv, __args...) \
+	stmmac_do_callback(__priv, tc, setup_ets, __args)
 #define stmmac_tc_query_caps(__priv, __args...) \
 	stmmac_do_callback(__priv, tc, query_caps, __args)
 #define stmmac_tc_setup_mqprio(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce0..33c37f843336 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -301,6 +301,13 @@ struct stmmac_priv {
 	/* Protect est parameters */
 	struct mutex est_lock;
 	struct stmmac_est *est;
+	struct {
+		bool enable;
+		u8 algo;
+		u8 bands;
+		u32 handle;
+		u32 quanta[MTL_MAX_TX_QUEUES];
+	} qdisc;
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
@@ -394,6 +401,7 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
+void stmmac_set_tx_queue_weight(struct stmmac_priv *priv);
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index c54c70224351..d84b6fdc01b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -205,7 +205,10 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 {
 	u32 val, offset, count, queue_weight, preemptible_txqs = 0;
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct plat_stmmacenet_data *pdata = priv->plat;
 	int num_tc = netdev_get_num_tc(ndev);
+	u32 sched_algo;
+	bool ets;
 
 	if (!pclass)
 		goto update_mapping;
@@ -216,6 +219,11 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	 * "The number of Tx DMA channels is equal to the number of Tx queues,
 	 * and is direct one-to-one mapping."
 	 */
+
+	sched_algo = priv->qdisc.enable ? priv->qdisc.algo
+					: pdata->tx_sched_algorithm;
+	ets = priv->qdisc.enable && sched_algo == MTL_TX_ALGORITHM_DWRR;
+
 	for (u32 tc = 0; tc < num_tc; tc++) {
 		count = ndev->tc_to_txq[tc].count;
 		offset = ndev->tc_to_txq[tc].offset;
@@ -227,16 +235,20 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 		if (count == 1)
 			continue;
 
-		if (priv->plat->tx_sched_algorithm == MTL_TX_ALGORITHM_SP) {
+		if (sched_algo == MTL_TX_ALGORITHM_SP) {
 			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
 			return -EINVAL;
 		}
 
-		queue_weight = priv->plat->tx_queues_cfg[offset].weight;
+		queue_weight = ets ? priv->qdisc.quanta[offset]
+				   : pdata->tx_queues_cfg[offset].weight;
 
 		for (u32 i = 1; i < count; i++) {
-			if (priv->plat->tx_queues_cfg[offset + i].weight !=
-			    queue_weight) {
+			u32 weight;
+
+			weight = ets ? priv->qdisc.quanta[offset + i]
+				     : pdata->tx_queues_cfg[offset + i].weight;
+			if (weight != queue_weight) {
 				NL_SET_ERR_MSG_FMT_MOD(extack, WEIGHT_ERR_MSG,
 						       queue_weight, tc);
 				return -EINVAL;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..5acddc9cbd3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3419,14 +3419,22 @@ static void stmmac_set_rings_length(struct stmmac_priv *priv)
  *  @priv: driver private structure
  *  Description: It is used for setting TX queues weight
  */
-static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
+void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
 {
-	u8 tx_queues_count = priv->plat->tx_queues_to_use;
+	struct plat_stmmacenet_data *pdata = priv->plat;
+	u8 tx_queues_count = pdata->tx_queues_to_use;
 	u32 weight;
 	u8 queue;
 
 	for (queue = 0; queue < tx_queues_count; queue++) {
-		weight = priv->plat->tx_queues_cfg[queue].weight;
+		if (pdata->tx_queues_cfg[queue].mode_to_use == MTL_QUEUE_AVB)
+			continue;
+
+		if (priv->qdisc.enable &&
+		    priv->qdisc.algo == MTL_TX_ALGORITHM_DWRR)
+			weight = priv->qdisc.quanta[queue];
+		else
+			weight = pdata->tx_queues_cfg[queue].weight;
 		stmmac_set_mtl_tx_queue_weight(priv, priv->hw, weight, queue);
 	}
 }
@@ -3570,9 +3578,15 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 				priv->plat->rx_sched_algorithm);
 
 	/* Configure MTL TX algorithms */
-	if (tx_queues_count > 1)
-		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
-				priv->plat->tx_sched_algorithm);
+	if (tx_queues_count > 1) {
+		u8 tx_sched_algo;
+
+		if (priv->qdisc.enable)
+			tx_sched_algo = priv->qdisc.algo;
+		else
+			tx_sched_algo = priv->plat->tx_sched_algorithm;
+		stmmac_prog_mtl_tx_algorithms(priv, priv->hw, tx_sched_algo);
+	}
 
 	/* Configure CBS in AVB TX queues */
 	if (tx_queues_count > 1)
@@ -3738,7 +3752,11 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Configure real RX and TX queues */
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
-	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
+	if (priv->qdisc.enable && priv->qdisc.algo == MTL_TX_ALGORITHM_DWRR)
+		netif_set_real_num_tx_queues(dev, priv->qdisc.bands);
+	else
+		netif_set_real_num_tx_queues(dev,
+					     priv->plat->tx_queues_to_use);
 
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
@@ -6437,6 +6455,8 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 		return stmmac_tc_setup_taprio(priv, priv, type_data);
 	case TC_SETUP_QDISC_ETF:
 		return stmmac_tc_setup_etf(priv, priv, type_data);
+	case TC_SETUP_QDISC_ETS:
+		return stmmac_tc_setup_ets(priv, priv, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 14cabe76e53e..15949b5d9f32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1210,6 +1210,108 @@ static int tc_setup_etf(struct stmmac_priv *priv,
 	return 0;
 }
 
+/* Max quantum value supported by the MTL DWRR scheduler */
+#define MTL_TXQ_WEIGHT_QUANTUM_MAX	0x1312d0
+
+static void stmmac_qdisc_restore_dt_config(struct stmmac_priv *priv)
+{
+	/* reset to the dt configured algorithm. */
+	priv->qdisc.enable = false;
+	netif_set_real_num_tx_queues(priv->dev, priv->plat->tx_queues_to_use);
+	stmmac_set_tx_queue_weight(priv);
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
+				      priv->plat->tx_sched_algorithm);
+}
+
+static int tc_setup_ets_sched(struct stmmac_priv *priv,
+			      struct tc_ets_qopt_offload *qopt)
+{
+	struct tc_ets_qopt_offload_replace_params *p = &qopt->replace_params;
+	struct plat_stmmacenet_data *pdata = priv->plat;
+	int err, i;
+
+	if (!priv->dma_cap.dcben)
+		return -EOPNOTSUPP;
+
+	if (qopt->parent != TC_H_ROOT)
+		return -EOPNOTSUPP;
+
+	if (p->bands > pdata->tx_queues_to_use)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < pdata->tx_queues_to_use; i++) {
+		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB)
+			return -EOPNOTSUPP;
+	}
+
+	for (i = 0; i < p->bands; i++) {
+		if (!p->quanta[i])
+			return -EOPNOTSUPP;
+
+		if (p->quanta[i] > MTL_TXQ_WEIGHT_QUANTUM_MAX)
+			return -EOPNOTSUPP;
+	}
+
+	err = netif_set_real_num_tx_queues(priv->dev, p->bands);
+	if (err)
+		return err;
+
+	for (i = 0; i < pdata->tx_queues_to_use; i++) {
+		u32 quantum = i < p->bands ? p->quanta[i] : 0;
+
+		priv->qdisc.quanta[i] = quantum;
+		stmmac_set_mtl_tx_queue_weight(priv, priv->hw, quantum, i);
+	}
+
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_DWRR);
+	priv->qdisc.algo = MTL_TX_ALGORITHM_DWRR;
+	priv->qdisc.handle = qopt->handle;
+	priv->qdisc.bands = p->bands;
+	priv->qdisc.enable = true;
+
+	return 0;
+}
+
+static int tc_setup_ets_destroy(struct stmmac_priv *priv,
+				struct tc_ets_qopt_offload *qopt)
+{
+	if (qopt->parent != TC_H_ROOT ||
+	    qopt->handle != priv->qdisc.handle)
+		return -EOPNOTSUPP;
+
+	if (!priv->qdisc.enable ||
+	    priv->qdisc.algo != MTL_TX_ALGORITHM_DWRR)
+		return -EOPNOTSUPP;
+
+	stmmac_qdisc_restore_dt_config(priv);
+
+	return 0;
+}
+
+static int tc_setup_ets(struct stmmac_priv *priv,
+			struct tc_ets_qopt_offload *qopt)
+{
+	switch (qopt->command) {
+	case TC_ETS_REPLACE:
+		return tc_setup_ets_sched(priv, qopt);
+	case TC_ETS_DESTROY:
+		return tc_setup_ets_destroy(priv, qopt);
+	case TC_ETS_GRAFT:
+		break;
+	case TC_ETS_STATS:
+		if (qopt->parent == TC_H_ROOT &&
+		    qopt->handle == priv->qdisc.handle &&
+		    priv->qdisc.enable &&
+		    priv->qdisc.algo == MTL_TX_ALGORITHM_DWRR)
+			break;
+		fallthrough;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int tc_query_caps(struct stmmac_priv *priv,
 			 struct tc_query_caps_base *base)
 {
@@ -1308,6 +1410,7 @@ const struct stmmac_tc_ops dwmac4_tc_ops = {
 	.setup_cls = tc_setup_cls,
 	.setup_taprio = tc_setup_taprio_without_fpe,
 	.setup_etf = tc_setup_etf,
+	.setup_ets = tc_setup_ets,
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_mqprio_unimplemented,
 };
@@ -1319,6 +1422,7 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.setup_cls = tc_setup_cls,
 	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
+	.setup_ets = tc_setup_ets,
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };

-- 
2.55.0


