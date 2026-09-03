Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23EEC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nm0b3decWts16dJvCGu7/4gLHqIVSBuSg/h+YMAas2c=; b=ngFaf7RmohyJ60HUSaG2mHRLUz
	kAGazo0A0K9/igNG8ksmb82f1cbgGcWiN6KqRdkiBe+m5n4eGGaQgsRUV3p9iU8NYGFS5YsfodBld
	Q6kXWueVI+co4w2dJMYjLvyytt+p3y/ipyID6vDIyxljKlVOQTmEtnJRNTJVn5ge0uDEhRgQHGROS
	djPQwZEfWj/2h6lpXK1sQRCmID8vCB0DYwALtzXXyb9+sUk5dcISTScn/dzMwxpkA76Rxwca9suy6
	tpFlCQv0A/riWMm1WgwHFGP6/VKinLBAXfV3EwBinocY0cgsKymxdJcPf4DLfWvkIhKQPk1Jw7Ep1
	oRAdLOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Rf-0000000Gtsj-317Z;
	Thu, 03 Sep 2026 09:09:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Rc-0000000GtsK-2zqy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:09:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6839244j155431
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 09:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nm0b3decWts16dJvCGu7/4
	gLHqIVSBuSg/h+YMAas2c=; b=UfBn7RhRJtjrWytUbJFGvf0MsF64YrLjo4VdZu
	CeXHuCjaSF/+Di10p8rnF0vghqCBzeyX0MF7cJgyC3Hw9sbp0YYB0sZTc1kL5g0m
	uhRMKuvCGQ3XSYzkPZLP+/WUv23evKLfy6mmoHxNKL1NoabKO4mpwJXO4dg6ZPgU
	1bIp73cyI7IIq74FObcFWDKTrPjr+BEKJ5B/HNJA1r28B4QlKjKspY/5pH2NBnsA
	cVZA0JE6EexEVSgstmTjaynORI+Hiqi0WlcE+O19cA2zjLsQ2napq0ftnuU5LNrD
	RiegAhoRB72knvTSH5lnrJgCOJV+T1g+MUfB/x0njSo7c2ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgdqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:09:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53018848232so14324211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426555; x=1789031355; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nm0b3decWts16dJvCGu7/4gLHqIVSBuSg/h+YMAas2c=;
        b=Tk6EX0X4q2tUKM9Wp4tGybtdLQNI1g0IDlYT86r3PAGc3qn/VaHoAx3WR9ZbJIqiOu
         R9lNSuZylXEMtlQIzfAqd7RntNVPVTKk7GNwAge5UE5AGd9Xd28v3FeJ/hiv85uo9wlG
         cskDaOqpOTJeuTLCK5yATrG9tqJdvF9cNSwlFmks6GoHQfMFJTdpQRkaGG00a9jLIKUS
         mV4zq0HyILreBqBGDzyjUWRANMniS3JeL8N2v77AaZZXpjRUdUuo4L5xcYR0rPrFdeFm
         h3pkfqip6SGVGPiuP7aeCH9d3sa8nQq8qNUYmcGKELIS3Uw2QunrjfvcYLuYI3O/IaCV
         JFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426555; x=1789031355;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nm0b3decWts16dJvCGu7/4gLHqIVSBuSg/h+YMAas2c=;
        b=hJ9VwVSmIcIIpzhgvcalBgmXYysNPcwzkZcyr78a1AUmwS2Weh6o/BaAw01awxfXwz
         ISufVG/fYd3Y7RRB+B9Dwm9uuldna0ro20tubZX6LPZjOdWNMOJJV3VixbO7uw2D474h
         VdctQHnDaXTw1IErKTdec+fY6zmgIxtWxlviMdwd8Bb55Z3AZnLdwVB01T6Y7+BfENF9
         hsph/5CEhIycQZ5N/BRQa0J9nEyCxS+lb9J+W/fMruk3vMEn09bxUZpn2T3+rX2RufOV
         vpmS1uPjnUV1R8aDDHax+WtVmODlGHvid/6wMdsMgdp4CgXRH1hYW4izRLEe907GY4PL
         5iSg==
X-Forwarded-Encrypted: i=1; AKwUvBwS8J092v0GMYJNJREiFA1prkyXRKRBiPxjOG0ydA3GRjv/OReILCIpZ5KFV2lHquopERAFln90qGRCUIk1UU+Z@lists.infradead.org
X-Gm-Message-State: AFuF++mexzVik6kQ5qELUwndXt0QCgn4AU7f5KyxuLFePz7eiCY567B8
	SaKFjEjnODf7uM77+LXha7EEogrsKGHirBklpocNSUhJmfvCzyWwi7+6ukGzE46Bhn4D8dNDoyW
	+bxSPyRAdA4LMMh54V53R0JWHrnj7HJGOs3jdNksSAHEjihB65riHcyJtkxWAsVNnQh7OHOVxHE
	EOAQ==
X-Gm-Gg: AYBFou1j1DXyqElCuqljBaLHzjqbUdcjKkXPOmq0BoJYrfCHr0YW9yN0xBKACzCZNUP
	LEyyWxDUTZbIH8+xMMdbdtwaNx5z97SHgUggfkH8P8l5yyAnnZs7Zem+FRIEeAo/6wWlkMwJrgM
	TXefsDUVP9c1uX5EG2ilTi881bZhMDRAynWA71KSCxzPtqM9Ix+aE1YFZTxMOIuWIFoUgLVKbyJ
	Jz77YBg5O8Px/eBpmc5M6Q7CN/RIWpiO4T4IlIGRUzcUVtJikqx0ryxc6gvBsxofML781A8x9nC
	OWpz8JmtyYp6Y7xdfePKeuxoU8ZTCXGNIF7VRnV1uVQbrO/EoQj63dBF2tqrrH2UfR/1B8iFvxN
	vO6Qq0XHFba9Aog==
X-Received: by 2002:ae9:e707:0:b0:939:6df7:73f1 with SMTP id af79cd13be357-9396df775admr458430785a.51.1788426555011;
        Thu, 03 Sep 2026 02:09:15 -0700 (PDT)
X-Received: by 2002:ae9:e707:0:b0:939:6df7:73f1 with SMTP id af79cd13be357-9396df775admr458426985a.51.1788426554489;
        Thu, 03 Sep 2026 02:09:14 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm11700770f8f.8.2026.09.03.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:09:13 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 11:08:42 +0200
Subject: [PATCH net] net: stmmac: preserve real_num_tx_queues on mqprio
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-v1-1-eb171bdd340a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NSQ7DIAxA0atEXtcSgXS8SlQhBE7jBUMNHaQod
 y/q8m3+36CSMFW4DRsIvblyTh3jYQC/uvQg5NANWumTuiqDtcXoPDZvK7VXseHTeRyVjc8inJF
 EsmBxbcVLmM7aTSaYRUMPFqGFv//ZDIka3Pf9B6jLUIGBAAAA
X-Change-ID: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 7i34oV1vuxJRQjlo7oECveb06NGFGCjp
X-Proofpoint-GUID: 7i34oV1vuxJRQjlo7oECveb06NGFGCjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX2qhzre1ms7P+
 FAcmO7C63noskhXC+IgvAA7a9K5m/gqKiC7txedTD55YloR76OgOimfauURKHitxbivCnky2wm8
 Mfh91LeTUt+6UsBCDHQGQmEuyKKH1W1C5ezVu47hsn1dRywPZKWjHxX21ScUuGg92I0iEdHhBm9
 Kkmto91viporAUYcW98qoDuRyqNSuPI/7KuiKAcwR0q7WjG7UNMBKQqTSajcvglpFrKYTAVkmyN
 8zM7HwSSRcWyJ8JuYL85KLUHOxVsEDwF2aOR7a+P32JyzuEw9mpPOGRxAqqQEwy3EDV6T4AeIGq
 xQEjI3/wqPfSzvtxmpra0Wiry2kHkFjzMpuv8aGbfKOK7NWOIE+zQpDWuEw6LoQR8+abyPGpZxI
 VmbgqjzUvKTuw8B67g9euLPf8FxQERcoJ+jF7kN/FFK9TYw2w9zYM6sU1zx6BZlp+zkoFC0NnGY
 S6uzUWTzpGqR9LguP+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXy83MuhOF95O6
 2v25qv6M6ydrVPasr/AmPkJTjPBvNYbVuloSYS6dEIsf3wlmO1iMrdbJ/wrw9zMGxyC90rFSFpx
 hYCizseZNiIgH626BUB38you+RH29v0=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99393b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0Ze0suNwVZWZK1odzWoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020916_877668_04BEAB16 
X-CRM114-Status: GOOD (  23.40  )
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

In tc_setup_dwmac510_mqprio(), if stmmac_fpe_map_preemption_class()
fails after the number of real TX queues has been set to
num_tx_queues, the error path calls stmmac_reset_tc_mqprio(), which resets
the number of real TX queues to priv->plat->tx_queues_to_use
(the maximum the platform supports).
This overwrites the value that was active before the mqprio offload was
attempted, which may have been lower than the platform maximum (for
example after a previous mqprio configuration reduced the queue count).

Save ndev->real_num_tx_queues before lowering it and restore it if the
FPE preemption-class mapping fails. Drop the use of
stmmac_reset_tc_mqprio() from the error path: the queue count is now
preserved and the TC-to-queue and priority-to-TC mappings are restored
to the previously saved values.
Introduce stmmac_set_ndev_tcs utility routine.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 80 ++++++++++++++++++-------
 2 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..9314bcb85c22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -494,7 +494,7 @@ struct stmmac_ops {
 #define stmmac_set_arp_offload(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_arp_offload, __args)
 #define stmmac_fpe_map_preemption_class(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
+	stmmac_do_callback(__priv, mac, fpe_map_preemption_class, __args)
 
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 14cabe76e53e..c99d9b7e26dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1237,6 +1237,30 @@ static int tc_query_caps(struct stmmac_priv *priv,
 	}
 }
 
+static int stmmac_set_ndev_tcs(struct net_device *ndev, u8 ntc,
+			       struct netdev_tc_txq *tc_to_txq)
+{
+	int i, err;
+
+	netdev_reset_tc(ndev);
+	if (!ntc)
+		return 0;
+
+	err = netdev_set_num_tc(ndev, ntc);
+	if (err)
+		return err;
+
+	for (i = 0; i < ntc; i++) {
+		u16 count, offset;
+
+		count = tc_to_txq[i].count;
+		offset = tc_to_txq[i].offset;
+		netdev_set_tc_queue(ndev, i, count, offset);
+	}
+
+	return 0;
+}
+
 static void stmmac_reset_tc_mqprio(struct net_device *ndev,
 				   struct netlink_ext_ack *extack)
 {
@@ -1250,45 +1274,61 @@ static void stmmac_reset_tc_mqprio(struct net_device *ndev,
 static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 				    struct tc_mqprio_qopt_offload *mqprio)
 {
+	unsigned int ndev_num_tx_queues, num_tx_queues = 0;
+	struct netdev_tc_txq ndev_tc_to_txq[TC_MAX_QUEUE];
+	struct netdev_tc_txq tc_to_txq[TC_MAX_QUEUE] = {};
 	struct netlink_ext_ack *extack = mqprio->extack;
 	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
-	u32 offset, count, num_stack_tx_queues = 0;
 	struct net_device *ndev = priv->dev;
-	u32 num_tc = qopt->num_tc;
-	int err;
+	u8 ndev_prio_tc_map[TC_BITMASK + 1];
+	int i, err, ndev_ntc;
 
-	if (!num_tc) {
+	if (!qopt->num_tc) {
 		stmmac_reset_tc_mqprio(ndev, extack);
 		return 0;
 	}
 
-	err = netdev_set_num_tc(ndev, num_tc);
-	if (err)
-		return err;
-
-	for (u32 tc = 0; tc < num_tc; tc++) {
-		offset = qopt->offset[tc];
-		count = qopt->count[tc];
-		num_stack_tx_queues += count;
+	if (qopt->num_tc > ARRAY_SIZE(tc_to_txq))
+		return -EINVAL;
 
-		err = netdev_set_tc_queue(ndev, tc, count, offset);
-		if (err)
-			goto err_reset_tc;
+	/* save current tc values for reset */
+	ndev_ntc = netdev_get_num_tc(ndev);
+	for (i = 0; i < ARRAY_SIZE(ndev->tc_to_txq); i++)
+		ndev_tc_to_txq[i].combined =
+			READ_ONCE(ndev->tc_to_txq[i].combined);
+	for (i = 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
+		ndev_prio_tc_map[i] = READ_ONCE(ndev->prio_tc_map[i]);
+
+	for (i = 0; i < qopt->num_tc; i++) {
+		tc_to_txq[i] = (struct netdev_tc_txq) {
+			.count = qopt->count[i],
+			.offset = qopt->offset[i],
+		};
+		num_tx_queues += qopt->count[i];
 	}
 
-	err = netif_set_real_num_tx_queues(ndev, num_stack_tx_queues);
+	err = stmmac_set_ndev_tcs(ndev, qopt->num_tc, tc_to_txq);
+	if (err)
+		goto error_reset_tc;
+
+	ndev_num_tx_queues = ndev->real_num_tx_queues;
+	err = netif_set_real_num_tx_queues(ndev, num_tx_queues);
 	if (err)
-		goto err_reset_tc;
+		goto error_reset_tc;
 
 	err = stmmac_fpe_map_preemption_class(priv, ndev, extack,
 					      mqprio->preemptible_tcs);
 	if (err)
-		goto err_reset_tc;
+		goto error_reset_num_tx_queues;
 
 	return 0;
 
-err_reset_tc:
-	stmmac_reset_tc_mqprio(ndev, extack);
+error_reset_num_tx_queues:
+	netif_set_real_num_tx_queues(ndev, ndev_num_tx_queues);
+error_reset_tc:
+	stmmac_set_ndev_tcs(ndev, ndev_ntc, ndev_tc_to_txq);
+	for (i = 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
+		netdev_set_prio_tc_map(ndev, i, ndev_prio_tc_map[i]);
 
 	return err;
 }

---
base-commit: 2f38e26a5741abdf152c1b56b22144a06d30fd66
change-id: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


