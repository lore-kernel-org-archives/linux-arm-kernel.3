Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB195C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=; b=pMWS9G7NE7MwCJeW4HTyyj+f3V
	RcatRiO4LxKRVft1XseS/ItNqU0L9foIMz/OSbiXb/duUwp8ymlLoOMQq/DIVCNE5qDSE19ZthzMy
	XOZYJZXluLFLGhCUDCGTDM5JyZ2JsZGNcYab58o2w1hGPWCUr0zuvdfPNwevbgglNWPN4JCMPj417
	yK4fWirHKFReq6x8fljJGH8Lz2Vq2u8TyaKwtAQBhOZ5SfMPcsvKT/bC4ztbZbMbgeL+m1bwYqjJg
	CEcJKb4UhkRU1aoGpRNxlN1exgNEYHrrkgMjZTMp2+ts3z+s/K6URfQ2hKsSUDjRwxBzV2YtZnavZ
	rXq/NpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JFy-0000000Bxoz-1F55;
	Wed, 09 Sep 2026 14:26:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JFw-0000000BxoC-0CUR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:26:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1tx1723057
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=; b=eNaocI1QAzjNo97f
	LHIn63a6VUmXPt5ynwA2FMvHMc6uAj1rJmFVGomItFVezOKNdba9LiCQqbJj1TAx
	sbZdKrASy+M0+QlQtDQvabWYRnibrtxhd9qedrMIlo+09kzeNva0DyXtJ1lxm8OM
	DxQ8eOiINGkE3prbXfD819LZrNd589Bdt5kYLC6OIeiEJPwod/wBZXvc9/mu8thk
	vzoW+aCGGzB3JqumzrTgVsRT74OH7rVMJgb1lW1as3mZk/NI11HEfIfqgmWhrvP1
	ous50TwOeIHhgY5loh91vm3YmKEJH6YP+C8HEe2LjYqoMnWYzteCP08XHG64VcGj
	5FQb7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns2kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:26:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so944723085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963990; x=1789568790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=;
        b=Qb5IYIkDuGN9kzBS1K7BCpc+0eYJxbOjwWdMTZJ/yWwZTbJMovY2hzCU1twj6qlC7l
         iC9zM5tOY/n7WuzAC+3QLdt9JAR1jpWSkC4WV9z6tShHPFPNlyY2s7NYZyXfhPBC01Zo
         XTPXNUGww+jLPiNOEfVWa1UPDuwAQDV62S4ECNrJFz7vosMKh6kX9DQghpnPRUbxpQDj
         COc0+8JU83l6aBGSkb7KuhdN0dlEULyR9GTdPLDCL7aeToEAbvwPmBn1L1nHG2/jVRxl
         3hj0mH9JTEW6KTDjbLlBWbwyoD2o0EYBqKjgil4qt/oFbOFl13DC4luos8Ci3K8ENAIz
         zvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963990; x=1789568790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=;
        b=OOi6bwNUImF6LV/VG7BnDjNbuCtlC6Ei2dYzMLPjAoiAfP/Y17M6R5bmWv8e2TU0kb
         Qfdw9+vpX1RNP6hR6abjrQofeMfcSNCdlAnFcjRhyGMmNLPMoD2eE/ARjQsVmsYJy9Wa
         6nInnBRioTq4teyVau7des4AfM8WlbZhKVGqJaxXqE/YMY3RjV2R3Or4Kr+hvOEBatK4
         10BpdWjcm7NyzvJTC8QGZ4iBITq+ZwUSsBACz58FR7ORWGm3ZxBFPxgkIGraI5Hi5QNC
         V0HfcXWVnT7gtP3MafPOZHWmGleOR0OxA9HTDMbRSmxnDljh/bIwaLMTwp46XepKt/IF
         MR1w==
X-Forwarded-Encrypted: i=1; AKwUvBxlLbxhL6RI177tK+nZc9jfraDAzey4N2pSsqzaEv5Qzuo97lVogviVx3ZWNKnCDkfBShhYRb5EYgb4IWeVqE/U@lists.infradead.org
X-Gm-Message-State: AFuF++ncRmi7fr0yA14DxiGh+XjpqBY4mR11m7w2LgcSZxtQnT3lRx1Q
	R5dubIAOj4/VRha08LrdnXD7o2Qym6hn8ofH8FY6YcnPx7/kiwZ1oBeY+qjA8S5QRDsuUIrvD8P
	fCdGlFcnNAYnNHqh2cOuQ4gXFrRfsh/9RSFu9OnHTMR1a1q3Ooh0lZgR35z2ilPGGurDYE69WIf
	r3nQ==
X-Gm-Gg: AYBFou0kP86UlDbZ1CPeLqlb7YluXr6rmfBYtJyWYRPzFMoF0jfezqa1lxiwvaK90bD
	x6UZXZWXYl6bTuxuVOcgzsVq6fUvKGwiIf0TMiWBjLK2qweso2xqUYzf6ty+R/+9MEiJYSI29TS
	IkRuT2zaKK7gKgc9v44Lz0XOyF15gCbV7maXXOk/hc7CQuBUNx/2ImGila9hBkz+l490uhg8bpC
	ghouw60Xxm9FDNQ/9sb2vDA26SHez3iQA2nMF38dqgjbwoLwQWdYhfgzOGO+153n35kgyjneEcK
	Modvc0OvazMwZ4ej8tlBxpbDQ0JR/pyfFNZrg65/g2WAbcWFDwI6/OKgloWmpO0zxdKxv/tjmMl
	26203bqKExSp3mQ==
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr229049585a.5.1788963990222;
        Wed, 09 Sep 2026 07:26:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr229018485a.5.1788963988272;
        Wed, 09 Sep 2026 07:26:28 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm54890715e9.3.2026.09.09.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:26:27 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:26:09 +0200
Subject: [PATCH net v2 1/2] net: stmmac: propagate FPE preemption-class
 mapping errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-1-8158b8333b3d@oss.qualcomm.com>
References: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d@oss.qualcomm.com>
In-Reply-To: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: U6w7qYbrh0Zrsw1PBAYXX1YqFSFInlCr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX3gBP9+0l8Kkd
 a38o5jWOtkH4z7I064hMC4nHYGiy8mYfq4eABu0/3bFQ7lS9XZl7Wq7qnpL2/MNwfGAwROREIsG
 eMyP6jWp2dh6Y5eyDChLmpCRbRo9aNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX0d0mrs9H2cWR
 3Zn7bEOYeONhRRfHSssdBVqlAw+48e9lwsf8Ndl2MVHeiZiZjZtifHZgHQF/Mc6RVFmxw9iq7JO
 yIWBZpEiDokhx5Ipl4QZuiKxKNiDJRcojzrD5hfDCAyNK+lpM+9/VpHImz5ebwcw+U8Mfga+NuG
 9MiIryKslDHylrSBN/pk4PuSzdkPM7YFw3MVgrLXRXg/3EFIfAfPWvjfoKoGwiXbCwH5jq8ZFEU
 Y0ea4BZL50l+dRNmTF9RfK94Zm+ERclpzwb2uQTaWrJYDaAoZPg6dTcBlFvpsNNGrRmtwtWCP2S
 w6s0Up2G4Hvn1/fCTVGzmA37m7gxgWhr0RItU/kcKksYmiTCapnbg21XXMP8b0fL03j8kINYsZG
 iNN06dKh/Py876mC1BcmcBj4BW3CbeR02ygKlK4HHCIagHU8rNI2Ix79i1O1zq1TrHfvZumzwXt
 GxERBBvYV0K1KxDoeMw==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa16c96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BTyLBLs5qSdJAr6D0oQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: U6w7qYbrh0Zrsw1PBAYXX1YqFSFInlCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_072632_208771_D9B76592 
X-CRM114-Status: GOOD (  18.95  )
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

stmmac_fpe_map_preemption_class() dispatches through the
stmmac_do_void_callback() helper, which forces the callback's return
value to 0 whenever the op pointer is populated. As a result the
-EINVAL returned by dwmac5_fpe_map_preemption_class() (e.g. when a
preemptible TC owns more than one TXQ under SP scheduling) is silently
swallowed by every caller.

Switch the dispatch macro to stmmac_do_callback() so the callback's real
result is propagated, and honour it in the taprio and mqprio qdisc
offload.

Note that the taprio "if (ret)" check in tc_taprio_configure() used to
be dead code and now becomes live: a preemptible TC spanning more than
one TXQ under SP scheduling cannot be programmed in hardware, so a
taprio or mqprio configuration that previously returned success while
leaving the preemption-class register unprogrammed now fails with
-EINVAL. For taprio, the failure also runs the disable path, tearing
down the schedule that was just installed; this is the intended
behaviour.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 19 +++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

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
index 14cabe76e53e..5398616fcdfe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -970,7 +970,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	struct netlink_ext_ack *extack = qopt->mqprio.extack;
 	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
-	int i, ret = 0;
+	int err, i, ret = 0;
 	u64 ctr;
 
 	if (qopt->base_time < 0)
@@ -1120,9 +1120,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+	err = stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
 
-	return ret;
+	return qopt->cmd == TAPRIO_CMD_DESTROY ? err : ret;
 }
 
 static void tc_taprio_stats(struct stmmac_priv *priv,
@@ -1237,14 +1237,15 @@ static int tc_query_caps(struct stmmac_priv *priv,
 	}
 }
 
-static void stmmac_reset_tc_mqprio(struct net_device *ndev,
-				   struct netlink_ext_ack *extack)
+static int stmmac_reset_tc_mqprio(struct net_device *ndev,
+				  struct netlink_ext_ack *extack)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
-	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
+
+	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
 }
 
 static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
@@ -1257,10 +1258,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	u32 num_tc = qopt->num_tc;
 	int err;
 
-	if (!num_tc) {
-		stmmac_reset_tc_mqprio(ndev, extack);
-		return 0;
-	}
+	if (!num_tc)
+		return stmmac_reset_tc_mqprio(ndev, extack);
 
 	err = netdev_set_num_tc(ndev, num_tc);
 	if (err)

-- 
2.55.0


