Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CBBC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QR9ClPuBMuHzwg6AqtRW2NxHD7YJh16VACOa8a1PgRc=; b=YKj+2XA8xI7F5+nCNTougBuE+J
	6fvBBCg2DbJ4tOnqZVJ89MDcCM6MHBJnA8jlI/Eb8vrJCJ/bwc9cnDS6kSCkWmSE+R/9VPxdeat4z
	RMBSq+W+RNd7338wNYo95Mo/tdiCxq5Kh75RQ/UeJinY65RXbamEiltjYxZPh3Y8HhnAVDn5sUuRj
	m825HqsYtCv4W28zu0igZ5ZT6g0/KBy46OaOWIBjHnzAJPKkH7OPdjPpz/e9nhHUqNrVrRXinJHAF
	HoytZXn2XDutBInsecTi39A/4OD5YfQ4u4CkfFdojVyzcL97e+iOvMXZLZNniL1z8Q4YpKTC8eMuC
	eKasn6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJid-00000002b1q-07qi;
	Tue, 04 Aug 2026 18:18:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJia-00000002azZ-1klK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:18:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0LEo333203
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 18:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QR9ClPuBMuHzwg6AqtRW2N
	xHD7YJh16VACOa8a1PgRc=; b=pSsd4KLiwt4RvnFgf0/q4JxacmupQzzv+PwYEG
	2uISJtni6NcGSu68UEX/B8DuiHGwvDRFuf/Ah0Ol/zK6H1Ei+UqbIxmfjO/+MbTm
	eLavw6L9V0SHgTqgRC6REEVGS7XpNvpUNzt9J3XtPCCa2BJdBou2V0fon/BkBKzF
	uZDUUYEXiphyXRVz7p1p+q3BORQuh+aA0nftm5J6pR+i0N0g4AX+0pqJx330KOlL
	uYSkDkPcFCOQ9WAoUFCk5XnYTjahs+hx+EfH8NI23d5ixStAyDzRMn7Rytb++Mn1
	v9TZ6WGgMHt+LbfqycvSllOiywLoQRaq5XLcT+tZq0Br2Z+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3n8c49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 18:18:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so807871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785867489; x=1786472289; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QR9ClPuBMuHzwg6AqtRW2NxHD7YJh16VACOa8a1PgRc=;
        b=crVRD4W793ustb9AKJPQFbbW4bmEw1w2YKgb3DtcyYdgH6dUrJFQDFN0hu4htDNr2j
         xlYrfprvbAjvBSCBKt3sbjYDtlrm6IM0TYLgck+XVgPKq7hYmivISVavsUKYcdDR0Emq
         vguQ5OGfHPt/F2ghpvlfvxFKORwXnVFGGO6hZnUe8WXYcQR49frhSySbMr9XJ533e26G
         emmGXoSDQAdZC+/g3jC1DtA1Qbj3gXJMQ64D+LJ12EH/CYxCCeylX1LIMy2Ndo2M3JNY
         lYeljY5/pZ2bsB1H05Tm+qwgTMLeRKnEIXU5Cih83bHrMaSe6T1Bu+Fk/Kv6HQ+M+GiB
         6mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867489; x=1786472289;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QR9ClPuBMuHzwg6AqtRW2NxHD7YJh16VACOa8a1PgRc=;
        b=sYFCG2vdoXFEAorMoTuryv2SnFNmOsWOi00YohZNODzL4H3jWUEFyYidGv2PUAESFl
         P1QofzDYFz2bZ3GIsbJrVg4r+A4F/qLTadf4kaKUtCU8FkVfTn7U8eQ0GORsodfA721C
         iJRvx6es13Ugh6THlzPiE1yH4mSHusXZthijmtCIR1cT87qWLndPc1odUGEdrpCOwU35
         vYxWssedP/DI9xtjuAwSW28XtNyytW6XLMpcfpK7os95qnBtAR+CDBQaSb2R54rqmRab
         PVVRcsIifzI+J4jowBSe2xS5mUW8wg4W/VY5ubiE5dFxHa4WfEs67BMMn4Jug96yVlbR
         biYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6j3SSvVN6MfonEF4jsM9gq7ntNcbHbjHDDihKq51wVoVYH5EJC4KXqztl7gjbYSOy/UoFup0cuShEVXXDS7+g@lists.infradead.org
X-Gm-Message-State: AOJu0YzE/4x7lofasnWTgUGA3NuMWYAZXlRrBTzAeljya0Fux3fMP1Ef
	amcLxGSdBK6QxFWwD+FeMF7Cs0DQC1KsrzrLIRZBwR+7idOJAa/eIadg0Xfkmo++ui4vE7dNvb1
	k4aMvFQAEESX0An/6eBbRutrkBX0V4tL4lgNegrsl/NKuMwF0k2HczrdFokaFjaMyyZEbqOWn5K
	v5tZ0Frl2bSA==
X-Gm-Gg: AR+sD13YIJ8j6BeeftktA/5S2LkHqZWqngY7jZkJ0VaHev3PnqWitho06IKUlW1+duZ
	swWYk7M9GqYkcmD8GW78/N5RTb9IecM6pejxufbzg5UllHwYHUc7CqOhfNwtBRE7U9acN+sF08D
	ctZwVysoCk4sPZoex76VUWA3K2bM9AiLWSMEEwJGBhBTNdUSxrMMScDqfbX53tSsIeEOfprwiL2
	4i00GhcpVKB66eDJ4xt6QeTEZVOaemgKsbcR41dJRERS9GELFicARgmcldWX/H21+GiQhjI28JT
	3onPfiMwZKMgq1APZs4xwQ3NU2i4kuN6ks/CtuzzuhEMqXf96BodoYdJL2gfIIMhcV9iq0dVLPe
	jEW6qGQP/aIYExM8=
X-Received: by 2002:a05:622a:4818:b0:51c:164b:b241 with SMTP id d75a77b69052e-52ce5f71ee3mr12899131cf.13.1785867489229;
        Tue, 04 Aug 2026 11:18:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4818:b0:51c:164b:b241 with SMTP id d75a77b69052e-52ce5f71ee3mr12898491cf.13.1785867488722;
        Tue, 04 Aug 2026 11:18:08 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm109490455e9.11.2026.08.04.11.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:18:07 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 20:17:35 +0200
Subject: [PATCH net-next] net: stmmac: add tc-ets qdisc offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrB2IVqTpVYqLdDKxAzUpmSAB8
 e4Gl2/x/wHKWVjh1R2QeReVFBuGvgP6urgyim+G0YyzeZoJtWybI+SimEL4JeeRyD5msjb4zwA
 t/GcOUu/pGyIXjFwLLOd5AdpkLNFuAAAA
X-Change-ID: 20260804-stmmac-ets-offload-cc936c99fdb1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: u1mH2GlzCx7AOlS6oVcBsB_oA-OarpuU
X-Authority-Analysis: v=2.4 cv=EvjiaycA c=1 sm=1 tr=0 ts=6a722ce6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zDO8lxRZ4TI0GpO-95QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: u1mH2GlzCx7AOlS6oVcBsB_oA-OarpuU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0OCBTYWx0ZWRfX3ICCvWUo11YH
 95/qffhZ8kxz7yO7V4Lmxyyyo/0Wnx/cv5vW9LviN34ozDTOnz9qDjW1f7Rk0rL2ujDiHUi3c59
 tWCp8Q6aJASfBifBYqcU3iw5pmwMYt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0OCBTYWx0ZWRfX7gpFGpfaPjVd
 XH3u5l5gXHb6U/YnE2pTeNqq1HM2V0c8ecLy4SVRWb0hCdWOnSncZfr9rnK75p1bJY4tBg15L8t
 3qk/cfsVTylpLBxxtU2XwIHlDQWDriD+lUPGy066wsPhhhXUYFbEf61FAmdVHfnblxWmjEezkHE
 811Pjwxn0b4RXhcpe+8SxuqhEJhDx5Vwr7KIrylTlJZwo6pm7LwZpx579uJ0SY4JexwcLpU+YeF
 Ds0xOQcallQZnmeB6FoBPN+4w4fmp+wBpRKpL243oNGgQh8AW7Ex/fGttnpuKexsfAmzXtZUzEA
 BX6VId1SqKkvBK4u4LW1TplijOZ8FGYMthTikquKexWryzDXjMj0Zv3BBGRS7kiIcatPqEX65us
 R1wu1mMhBB8qn5+covPMnRlDW0lQ7vigrzCJ6vAqPA9MjTyznYpcZb6KrAzG8H0JomxIQpJzu+l
 ApUpGU+8MX3Yg5YGILw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_111824_579295_363E0CD2 
X-CRM114-Status: GOOD (  23.12  )
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

Implement offload of the tc-ets qdisc in the stmmac driver. The number
of ETS bands cannot exceed the number of TX queues, and mixing strict
priority bands (zero quanta) with weighted bands is rejected.

When all bands are strict priority, the MTL scheduler is programmed with
SP scheduling; otherwise the requested weights are applied to the TX
queues and the scheduler is switched to DWRR. The TC_ETS_STATS command
is accepted and handled.

Export stmmac_set_tx_queue_weight() so the ETS path can reprogram queue
weights, and wire TC_SETUP_QDISC_ETS into stmmac_setup_tc().

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  4 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 69 +++++++++++++++++++++++
 4 files changed, 77 insertions(+), 1 deletion(-)

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
index 8ba8f03e1ce0..8ea6dd0c1697 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -394,6 +394,7 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
+void stmmac_set_tx_queue_weight(struct stmmac_priv *priv);
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 79b71466d5b0..404f4132f223 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3419,7 +3419,7 @@ static void stmmac_set_rings_length(struct stmmac_priv *priv)
  *  @priv: driver private structure
  *  Description: It is used for setting TX queues weight
  */
-static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
+void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
 {
 	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 	u32 weight;
@@ -6424,6 +6424,8 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 		return stmmac_tc_setup_taprio(priv, priv, type_data);
 	case TC_SETUP_QDISC_ETF:
 		return stmmac_tc_setup_etf(priv, priv, type_data);
+	case TC_SETUP_QDISC_ETS:
+		return stmmac_tc_setup_ets(priv, priv, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 14cabe76e53e..17be37e43bf8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1210,6 +1210,73 @@ static int tc_setup_etf(struct stmmac_priv *priv,
 	return 0;
 }
 
+static int tc_setup_sp_sched(struct stmmac_priv *priv)
+{
+	struct plat_stmmacenet_data *pdata = priv->plat;
+	int i;
+
+	for (i = 0; i < pdata->tx_queues_to_use; i++)
+		pdata->tx_queues_cfg[i].weight = 0;
+	stmmac_set_tx_queue_weight(priv);
+
+	pdata->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
+				      pdata->tx_sched_algorithm);
+
+	return 0;
+}
+
+static int tc_setup_ets_sched(struct stmmac_priv *priv,
+			      struct tc_ets_qopt_offload *qopt)
+{
+	struct tc_ets_qopt_offload_replace_params *p = &qopt->replace_params;
+	struct plat_stmmacenet_data *pdata = priv->plat;
+	int i, nstrict = 0;
+
+	if (p->bands > priv->plat->tx_queues_to_use)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < p->bands; i++) {
+		if (!p->quanta[i])
+			nstrict++;
+	}
+
+	if (p->bands && nstrict)
+		return -EOPNOTSUPP;
+
+	if (nstrict) {
+		tc_setup_sp_sched(priv);
+	} else {
+		for (i = 0; i < pdata->tx_queues_to_use; i++) {
+			if (i < p->bands)
+				pdata->tx_queues_cfg[i].weight = p->weights[i];
+			else
+				pdata->tx_queues_cfg[i].weight = 0;
+		}
+		stmmac_set_tx_queue_weight(priv);
+		pdata->tx_sched_algorithm = MTL_TX_ALGORITHM_DWRR;
+		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
+					      pdata->tx_sched_algorithm);
+	}
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
+		return tc_setup_sp_sched(priv);
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
@@ -1308,6 +1375,7 @@ const struct stmmac_tc_ops dwmac4_tc_ops = {
 	.setup_cls = tc_setup_cls,
 	.setup_taprio = tc_setup_taprio_without_fpe,
 	.setup_etf = tc_setup_etf,
+	.setup_ets = tc_setup_ets,
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_mqprio_unimplemented,
 };
@@ -1319,6 +1387,7 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.setup_cls = tc_setup_cls,
 	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
+	.setup_ets = tc_setup_ets,
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };

---
base-commit: 828c4a5a9518117f9f7bdc445a7eeca85fc91bf8
change-id: 20260804-stmmac-ets-offload-cc936c99fdb1

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


