Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E2FC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxOgZcRvRYGuo3XQn/zJemLPSzBU5dwDiN5STI6YNto=; b=gnGKolkCchU6ooeKX2m+bRalSM
	r5v7zGXfTlkW1P7IoHZpmvTFdQgK6jecZ5wYOkT+c4BQTs9LI5nXIH2rPg2U7y9ZncZjSoW3cg5Ia
	aYkb7eUzbvpx4atf9s/VgbbAFnRlFrQLRY6gMWFkS52yIX5Uo9aPCJeAR8RhVLiSeXwijQn8qoB94
	sErsuy83GgKtwPN9m1nlN0uShisUPEnA3Y8BwbAOhc8d0jx+VRshEiYpnWo9FRcwIJ05V2+pw+tLf
	G03stMaJLqGz3rSSenvy7Ldt+adFV4vkxEk3ZsYzP5e4FKxBI9iayT6zWZnw80NjvbTVe+kOtQH7g
	o08jPOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JG3-0000000Bxqq-1y8Q;
	Wed, 09 Sep 2026 14:26:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JG0-0000000BxpX-1nMV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:26:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DITO42081066
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxOgZcRvRYGuo3XQn/zJemLPSzBU5dwDiN5STI6YNto=; b=Bl/ZSY9fK8jYCkOd
	3j4EeMQEvopYtE8TN4Ah2+TBKXoif/Lhuxc7QW6VW4J9MnInt/08u/uBBJgOHQL4
	NvkG8BjtaIZWuaU4Po8sVz67jBYpWIfLfqhgfCtEeo+FUjlAs8oWjB22yPedtoIg
	Ko7XJfdPm1lnOBYuWgSPBfZ/Dep34ADNO2U7O8ZfSOjKwu5ykrH0SxKQeFqQD+KU
	NhGPOEDZGTOZcIhtFBR3w57IB8nHdrAsHCXW5ICtuSkEgcRKti1Wkv5TQPieeFCP
	hWi2UL7FY30L8x3pFcScn3wHmEsHQW6ltPZGoxbuACOYcnmKXuzmvrya1sKhPUbL
	9zItKQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r0bd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:26:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78350646d7eso5189665137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963995; x=1789568795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxOgZcRvRYGuo3XQn/zJemLPSzBU5dwDiN5STI6YNto=;
        b=Lm+c+gHW+2gyC39+J65ET3Aqsb5oOiGoF9+d638B6oMWYKucGYdAVwdy4zYjyrWX6R
         C8YS9FrUXCsxqBgBIyGrwJmrbkLKl2YiFLavpidKIhLcKef5huUWCSzB6xDtWgyCFTM4
         2uC/7iD+WRRZEPlFDDiy+vBtOrcBRlEKiqBCSUKBBQd4DLbOOElzlxUVqjJoU+siJ1q0
         HbtcCToFqg0QtnocT6gmPrIix//ztLNcpgIZhxacVH/9be3c30dIMDkp7tUjUh2WeaI5
         UicsP91KtSySdCg/ZHIWbF7R2VJ5JiFzNOd5QsGoG8ukO2HeKcSs5G8UYYYgyphYiNRb
         kqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963995; x=1789568795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxOgZcRvRYGuo3XQn/zJemLPSzBU5dwDiN5STI6YNto=;
        b=Q+eMxOHjjthjVTwpvRCg7iTgk+C0+pXN+9lvrh07mukDYv3hMCU5C8FnlaJ5NmWdJ6
         9zhNg3pcOq+YiEoWQKf3MpprPTptE9hilYZDp86c9Q8Bpr7mA3NcUZ1EvcnP6J5tzWD4
         cPOZQX+LuAxIy4jfy/hELM1yIKUXH+RN80UmH66vHXHHqiF+P9SkAuwu6G9xGjm9QK0/
         xDmrBcHoCXZjRLZZd+uei8XqtzSgNYuPtRvSTmLKz1OjQKZ/fTLpHLmQHRx/bbD9cPYI
         dOe0wM8Y0ROosrUB/Fqdy1C9+ak2CM0UF8bAAldsTOMTbaS90FHwIThQ1bsyzwgX2ciU
         LFwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5UgC9esaPisSTxxQ8wN8aWmRa7Bx8uxLPSoFP1LRk/mskcasCybTAMgc4OXa6n6brVwFkcwVVmWGAbHBR3GY9@lists.infradead.org
X-Gm-Message-State: AFuF++kpkZ5Fhj/wRR4rbwaY4GZXsAN47nY88xucptfAE4AwqiEDVRMp
	sufvtPz2JsTR8b357GexYPtLDk4fiVXPBYbQvSTOTaxQ3dFTbPU2s7Rq91paEpjEe0g5XXHJ6Wu
	9LEQQdyJqCiBW7cJnLID+9bsOnlN4pnqKsFfOwBhMo3DhqJBwRqy0/7UDOgaCo3MDThCdlkZqy8
	jFFg==
X-Gm-Gg: AYBFou067e6p6+QFuOj2dWLmXJzY7E9jioJzogjogmUOj1CBdhEOwe/vARVUsPXfeUX
	Qb0ulLC8/IE3jGMzbR/3mjZ0/cgzhcZbYDh/++JyLdD/9vr+wmVIENcvpSXsdxn7HQ4gG7XPwbs
	sgci3iJfvC4wb+lKyLV+fHmLdNjVnPtR4TUJi/C1G+7k1DqL+tNWD4eSwZwDys5Kwvpjov+ktd9
	FL6WPzGI5U6mO3A1feUxQjvHx6HDHEmSWqb9vW5LpMzuqM/izuxAugry61o2AtlCcek+J16Kckg
	QdxIPfmOK9QDWRELiQf9mIjPh2CDv4W2PhJR6RO6hEJTxDqaw/zOFNXwuGq3b0oACpcMHIQ6Ozb
	nuboUF1V0JGoQJw==
X-Received: by 2002:a05:6102:30c6:20b0:780:c9c:bfcd with SMTP id ada2fe7eead31-78a2f00e2a9mr8076677137.17.1788963994752;
        Wed, 09 Sep 2026 07:26:34 -0700 (PDT)
X-Received: by 2002:a05:6102:30c6:20b0:780:c9c:bfcd with SMTP id ada2fe7eead31-78a2f00e2a9mr8076539137.17.1788963991349;
        Wed, 09 Sep 2026 07:26:31 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm128366565e9.4.2026.09.09.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:26:30 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:26:10 +0200
Subject: [PATCH net v2 2/2] net: stmmac: preserve real_num_tx_queues on
 mqprio setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-2-8158b8333b3d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa16c9b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0NSVpFHRlRhN2sU1BpMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX5mmE4Ksv65D8
 SjbLb39oPcImb+GU6C2Xtpd1nu6+ZoWMUgbmzAjkzrc2mHbMfFb4kI3si/51fO/ZwD88xyx59n3
 IXs1s+TLm/wOyqOFsMfYOOd02Fy/DwzLZDp04zfQnGUgRfJ1mwkqA1XOPESGCehGi4dhkc9el68
 FaaCoouQSjDMsgBtk6rs/AplY1UVZx+v7DofDa2w4nOQpgztETd8+EpZG0XNiMZTPtxFRHwKRNR
 AwJGKZYWEhGFksJQMa86otHRXGMwDyr0qyHtfiSVctd+25ANzUhIE5shCBVPSIqcngehhkGcXfU
 H3F1E+AFYO+2TLI32Zeuylt/gBboSiNohxfVRsutqNaZf7iDHbLXAJdkXCdCvRNaAOGD3/YvhaM
 yYR4KcYjU2UKFoVtRrYP1cdcVMtu8+VcU56S0cMXb+GfjPeI0v3OPIaoTwyuiDSqBsGnKZRdanl
 KbNDEcsIWKsU82NpdLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX2kAcxVt40w/B
 cEmJ19vocjP7NXj9ZpeMOXEql6y0It1MC4Shrfbk1y3WnqGi/IGf/i4xIdD7I7ifg9sKj5xG8nh
 tepLOgQd9bpMCa3hc1mcGQ6JUyYo1tc=
X-Proofpoint-ORIG-GUID: uBQBUdIgnz8_zcICMzQNWMnWIppudPtc
X-Proofpoint-GUID: uBQBUdIgnz8_zcICMzQNWMnWIppudPtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_072637_124796_DFF12FD6 
X-CRM114-Status: GOOD (  23.10  )
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

With the FPE preemption-class mapping error now propagated from
stmmac_fpe_map_preemption_class(), tc_setup_dwmac510_mqprio() can fail
on the mapping step. The error path used to call stmmac_reset_tc_mqprio(),
which resets the number of real TX queues to priv->plat->tx_queues_to_use
(the platform maximum), overwriting the value that was active before the
offload was attempted (for example a lower count left over from a previous
mqprio configuration).

The issue can be triggered using the following configuration:

  # First mqprio config lowers the hw queue count.
  $tc qdisc add dev eth0 root handle 1: mqprio queues 4@0 4@4

  # Replace mqprio configuration with a second one that fails FPE
  # preemption-class mapping. stmmac driver resets the real_num_tx_queues
  # to the platform maximum, losing the previous configuration.
  $tc qdisc replace dev eth0 root handle 2: mqprio queues 2@0 2@2 fp E P

Save ndev->real_num_tx_queues before lowering it and restore it,
together with the TC-to-queue and priority-to-TC mappings, when the FPE
preemption-class mapping fails, instead of resetting the queue count to
the platform maximum.

Note that a failed setup makes the qdisc layer run mqprio_destroy() on
the new qdisc, which resets dev->num_tc to 0; that is qdisc-layer handling,
out of the driver's control, and the driver-side restore remains correct
for the still-active previous configuration.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 80 ++++++++++++++++++-------
 1 file changed, 60 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 5398616fcdfe..7d73b0c16f50 100644
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
 static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 				  struct netlink_ext_ack *extack)
 {
@@ -1251,43 +1275,59 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
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
 
-	if (!num_tc)
+	if (!qopt->num_tc)
 		return stmmac_reset_tc_mqprio(ndev, extack);
 
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

-- 
2.55.0


