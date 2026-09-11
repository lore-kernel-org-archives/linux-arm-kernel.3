Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF800C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=; b=kdIzW7kynupwequIP7PGsgcKLQ
	vb0MJTM7926SAWPDuYBZ6SEI9xd1i3Rgp7Zik6cUBJ8pxp4lic1IOgvOtRYE2ZNYbNTBU3R1/0kMh
	tqwIg9P2H4fzmg/1DyYFlaSmeytmukkKN6ezClobI4VlTdyH0u0c39ooQfiCpcP2/0P/072B7M9Lq
	B2Hwo+vrazzMjipZFh5MbxEsLMZfVTavAfS3jFLizM0IDcHTb6VKMii42UdHyNnNiiiUHIP1Wj+lU
	8PyqK58DlkA3wErjGbDv3NWynis4DBzMa+5tqgztMpMwyTwMyYUxVAL7iSrz7kKPcopuiETMKYhSH
	752cbY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x60-0000000GCOJ-05GW;
	Fri, 11 Sep 2026 08:58:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x5v-0000000GCMF-1y11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:58:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfHC3366283
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=; b=eC7qJIteabQid4gH
	KjuhDbmfHgB79/NN2RHQ3WXZT0MHM/MYS/bIHjOIugZmlI67jrJtgS2eeyR55o1V
	pS2qAU7+1BYPHRIDb+EEvJ3kJX0/O+PkiQWMUJCn5jc3FvJIdUlUnvcA/Lf55BoZ
	ZoBIw8jf5n0B7JsjGwUzX2xLQ+N+Lce5wrCKwd+i4KBQywX7yQE49gfeRQKzjYvk
	nrufWJi3447ZKRxxP8HtvmPvAypi6wwRpWacP1AaBfThWOeI5hZ+PLW1W81my9K2
	bQ5+HhiahkS1cVHc0PY2Vt1g+48lGSjBAmiJqeIzwsO2neVfqCnCLykhqiYvRkm3
	B6E4IA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2b09h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:58:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so127290785a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117129; x=1789721929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=;
        b=A0TfcHoIafBgNrAdP6aWr8nZChewf2h/B33vIE48RyWyAKxbypifR4fh21X7fZFqwD
         lpoZcffMJ3BRQ9Ykxcnwuaj3mNR5WBEy3YRs/xilkKmiQ9+F13RAz6aGBnIn9POUzUnV
         OrsVea0i7ju/8jgxr0Y8s2BlExQfxGzvnTF2JDdN6pYGn//ghhSV2dvez1WCLwrKlRFF
         P6/ZWD70P5O7Vz40kE4GqSnxpZSfKgFdl0n3NWNwXpsIK4mCNQhKp2IBwaeu+6KmHSQo
         O0YJDXD1IKucKHwuRWfnM4aJIsBA05w8nVPZj8vCJcVC2x1J+2a0CgzBeY0zXwL9U0vX
         5qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117129; x=1789721929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=;
        b=cqjx75JG035HwXkDnIT1C37Jp+/pVeNkL8puamtDQiqIH+vHEcjhlmWgEQJXzo4f2i
         2ks9kh3w2Q+bHy+Yoe0HyeBRsNVB1IY303nEsQU1teQY7B4gyl7/hzJfgtjliYwLwrZa
         Ro3Jl3jrXuyD7aildYNhiMeenZZenRke1ElaYT7IUU4kr9T4wlMs+u8gi429+jo91e//
         en/aBqAIazTkEnbupGP8/DiwFD2TwDDqdbwCWb7PmWurW6RFhQqtWMKCOh6fbfm4FFQc
         Ne+xCn0Eumc8MbyCJwF3Lyvw/P34ZE6xdJ9WUCVslzN0wDmrOG7WLO6Cn7LnGyILVunI
         QkSw==
X-Forwarded-Encrypted: i=1; AKwUvBxi11FU+x+d1ihXXdcST3AgYVNahKIKK9HZOUXCUIsaGT8oy6nB+VRpSh715jkCHNBGlrGaCYZM2YyUDZ1F7DKS@lists.infradead.org
X-Gm-Message-State: AFuF++kwHbL57hycTJkVQINwZMVQbJi4fNAuu7t3mJyLYI75FXnEK2d4
	fH88/++VHpiKvJk5WaFkv0TZhGEEJNE9hrhTCedT2ZMHfx1br1rk1IXpfIi0nDYiNE8PsZLk2kI
	t2+yheEVRRW5Ic+YD3MBqu+cPZcJwAd7K+GcwfEe6w+Dhxe9iG9AUaiiMBMWUVp8zHvg0SLTC2h
	a5pw==
X-Gm-Gg: AYBFou1S0L0ktKVRrMrrT3+qd6W9bjwkaBSyeYS2HIy+TwiR4txSLd2x7RZjKG6kl2g
	D6Ia8jz0aJ2GggUwqoE0Yf9+6qkRZjzmXjCcVlq57kGxE0pJI60XZ8Jjrb5UTGK8ftUMUHvecG5
	UNsoE689yxD+X8O5oX7aCJV2StjFf+G0jJAPZwiol0Y2BaB8GFRfzKyep/gJFGTKWdA2dbH1V+c
	N2SELIgIRF4ixd1/2n/gDP+kglZyeN3+DIKV9XsN9KIk6oLJuOrpIodBLx2760AMiXG08hLS/7u
	sb7xWw8Sfp6YfVyTuZ3NDx5skmTCYASFCiWaf8xOwRZX9B/u3tUzVAyBT0VX6NnoSyeILd/KkXB
	prToI9d4qUYyyJg==
X-Received: by 2002:a05:620a:2243:20b0:939:f49c:1b29 with SMTP id af79cd13be357-939f49c2c10mr69663085a.46.1789117129524;
        Fri, 11 Sep 2026 01:58:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2243:20b0:939:f49c:1b29 with SMTP id af79cd13be357-939f49c2c10mr69660185a.46.1789117129096;
        Fri, 11 Sep 2026 01:58:49 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a7a686sm40481645e9.1.2026.09.11.01.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:58:48 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:58:29 +0200
Subject: [PATCH net v3 1/2] net: stmmac: propagate FPE preemption-class
 mapping errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-1-a76b1e2547c1@oss.qualcomm.com>
References: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1@oss.qualcomm.com>
In-Reply-To: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3c2ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BTyLBLs5qSdJAr6D0oQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: IQ5Rg6gbZK9u9B_BnZpDOI2OZB9fWblL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX7wCpsXtFi7ga
 52LVKNpB0WavDIXPI6f2fYvPAvGENy3Nj2ZkVFAi4KYIyS1jazBA+ZDtnhlu8L5cjcIvEiOjaZe
 8sejVI2kJtPafys//r9rtdlWt8r58QQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX/s1SvxM0VJH/
 YtCn9NT59NkreGotwnKwoiE1dfqfRVzZuDeahAU6uYZaMWM4DkumEORVPgt2jNttGMayDP2+6CE
 vO9P1qNCXSNPpbHp37P4vmEUE4/WCVtxLr72EIDO5Skdo7V36zOi3cFz9hJvueGghJvAXN7ahs/
 E+M1LN0WTdne8D5+mWQ71qK3oEKz2dirfBAzL1SroP0KcfCBVUUO8x5zZoaaFPm3JdSRXm8hyUn
 SumNic6tRLI06YB6LUfRxX67pYU5d3p4nB4wkVT2PBtOBkJLh/aNvgOHTG8N/QIlmf/xZQDMvhI
 fVC6PjnjhVLRWSw6yQLrkdbCJDidluRpc55psqLBS//sYAqwlERrS76TpiYcPSGQ+bHYRxMpjB/
 DvrIff0k7cV10Gyw5FQDjojD3evjOToEQEIwborCkmV5msbwLIzAr53dX0HZ/WqO/XAGQgXIyqv
 FNNK1OyzK/F+shuYFHw==
X-Proofpoint-ORIG-GUID: IQ5Rg6gbZK9u9B_BnZpDOI2OZB9fWblL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015851_617192_D46FDC33 
X-CRM114-Status: GOOD (  18.52  )
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


