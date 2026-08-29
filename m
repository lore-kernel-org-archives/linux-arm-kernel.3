Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB32C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eleVcLontkK7Ez1NeoJaXJcOarHQZdCSrncowtlaLBI=; b=Q0nHj7gfLPpEvwOZfSByyMXDSV
	fe28Rzez3CvtK9cFRr1qIRbpxojOOmd433PP1pdJS/uHuOSc9fGLm+FMOI6utCvm87p0j1+L2NrQB
	D2JccZJhWanQdRO9YKO3X4Gvtlhu2ovhO/8cbxW/gpQ5N2rNnFmfGUzA7M8TuEDmAdMt2C/b8uhYK
	M/tiEDxwKgBHXPIwwFZ8ay/8O4ZWMTCQJmPCyss8BAcTmlEkPBoqFKP/j5Jwr1PTSRD6qo3iEb98Z
	PAVeZgFc/FlMW58cJ5ANlMTT0lACDrBFuWE7uLWxglwJ8wLxXB/RfRG41zxHyt9uYUlsalq/57fMe
	SsaH9a3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ERM-00000006rI9-0CgM;
	Sat, 29 Aug 2026 08:29:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ERJ-00000006rH7-02ce
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 08:29:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T808qa165109
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eleVcLontkK7Ez1NeoJaXJcOarHQZdCSrncowtlaLBI=; b=Bn6nQx7epfxonEsd
	qX+Vtjefa+TFtcp0Xnqd3ABAq5OLDJuBUHVF0M4FZts2QKkeeM7d7mq4ffY4sw8m
	SiGlLQEAEj8smwGatVoq+4/l/r06mAlffmL9KJebv+FlwsZVVt4lbouJ93//1wzH
	8mYHz2n4yq2MO5iveXz7hZkDHrTDVi2xYw6aiiKK0IYec2QdIut340Fo4x0fAfnp
	eL7XDzpYSDIiYo8dhZ42tZVXL8sXaxGAdtoSqspmj6xrd2pdqMw+MGw92QnON+Jj
	kxAgJCtBummrnPK5lFfJ04fQ0Y9+Mk+MQv/uT/SBL466YLltqR3KZsDKv3dYvsS3
	O4ZegQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgrd3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:29:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52faa0dd18bso48351611cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787992162; x=1788596962; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eleVcLontkK7Ez1NeoJaXJcOarHQZdCSrncowtlaLBI=;
        b=Y0orAAnV9mK11oY36bv5O62X+hsghr1egqytG5LR81OzA7dqjXYukTbjbJ59Qf9EVI
         HksF+aQVwqJ3iWSaxxjOrNi3KEY9V6n6ayxoiUFsYv/QinHrutaU/TOHjXsD1n9LJnbk
         YPjj+DNV/AA9Ngq7BH3MR0cNkleZGDWRnHdd16s/hJ0p81ExdD9mlVk3Cfn+Mv3U1wXM
         ulsMWAjDwnWWv3EZeAHcYIUiDB602O+SFmLu0tGFZFep9gXpEIJf4D6OOjmjZnbRD72B
         Fjl0NItzy5I48yZmLcvi6B8VMdIqBTF5P+8Nuqqi9UG4JoYoahEjhXlFql84EhL5q1aT
         PG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787992162; x=1788596962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eleVcLontkK7Ez1NeoJaXJcOarHQZdCSrncowtlaLBI=;
        b=KtX//ocLBIlx5vee7jelxPbMPQhGbWnBCz/yg0Ss8fXFdtBoUXTcdQqbb68lSzB57Z
         q8pcM2mMDan0vncJSd/dt9c6N2G3CAMTYiwRdnRa73Od27H9xefn/JokMa5yUj7rosT+
         CTQr5ltmEYricz9jpypJtpZ5LuKveB/HMTABgB66kceGDGIeVp/7/632vBoOh0kAubsB
         R01D4He+OTAigLD73uiMw0m6Q6y3qxlmLrN54DX9XilVWrQbDwKpwwpGezJj68yTYcHc
         s1KOc0dCJomMLvVXRkEKVvRpmhget2mFHcDMPu2g4uKjAYcgKN19oa7PujMsG88w7jMz
         WCoQ==
X-Forwarded-Encrypted: i=1; AHgh+RohjkaYRTqkeeYeTANvc29xDj00v+ArbI4zowqSMNBxUi8JG5Uh6tg7xFVnNo4gWfZJBMyFNnbqL4hrHsYCmvkp@lists.infradead.org
X-Gm-Message-State: AFuF++l0m+oSSKEZFzKOAf/7w0NhbVE2ZfQHNno/z9Kg5y5C++5ZBynt
	1HQezPuq0wJX0rcx7I5QdbzTpFO/6lRV1DvH4EvbjVjMSNyol5fwLTJkg69nMD4/mhUgA+VP6Se
	4g7PDfDPDmJVrY4oPVyC/uNDCN1CWLdif+v8n0RvP7Fv0qb1JrJOrqPZKD02SDAjEjoywaXy7bo
	0sSA==
X-Gm-Gg: AR+sD11xiaSl4SJ6JeOGl2lvO6tLRjcV4OhmgcRCGLFKIk/AKFA2rSJILFtD4ZNikbV
	0HpV/o63Z1XQEQUYokPpPZIB1BpqpdZsJI++wiK/dEnYYMY8tdOUF3AUmfNzOdlBCZwVEZaCaNq
	EYHyNomfLdEK0FQlZAO/ToSQlrefpNma/ahfWokec0Uhg/zzhlOomckETvGORLkyV5fGBBA/vnA
	7Hn315GM5vK7gyPYYwRqICbOUkMJKjjl1cLPacod7800GIv1WbVELkbJBu+sfoK3uvZTzOrXwIH
	NFVf8CeSZEPMoCIC9YJYmrCIklN4RyWwUv/5gak0raAustMPnfw70ldoiC/quvAHAPPYjmShbeP
	PxOX+/5RwRNrqXw==
X-Received: by 2002:ac8:59cb:0:b0:52d:6de2:906c with SMTP id d75a77b69052e-52fb94297ccmr149837191cf.14.1787992162206;
        Sat, 29 Aug 2026 01:29:22 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:52d:6de2:906c with SMTP id d75a77b69052e-52fb94297ccmr149836681cf.14.1787992161713;
        Sat, 29 Aug 2026 01:29:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb34ae6sm10017652f8f.37.2026.08.29.01.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 01:29:20 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 10:28:49 +0200
Subject: [PATCH net 1/2] net: stmmac: preserve real_num_tx_queues on mqprio
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-stmmac-fix-graft-overwrite-v1-1-a4f84c4c264e@oss.qualcomm.com>
References: <20260829-stmmac-fix-graft-overwrite-v1-0-a4f84c4c264e@oss.qualcomm.com>
In-Reply-To: <20260829-stmmac-fix-graft-overwrite-v1-0-a4f84c4c264e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA3MiBTYWx0ZWRfXzh5svB9m3Bds
 rksYCAJR1kimevG1gG5IiN8P1T/PpGbJnXTe/hvZ+3aqC42LsPYDvc8GheLGkkbzoVKRr7CvgIN
 p0+2M+wivIgAkbc58emXfY7pfbLtgU9xufj2sJpvCOQIK3rsLiRC7DWq4CHfAEgjQMPMJsLcs3/
 MnnYo7iT1gE37GHqZdHQCsmskAGDyKDRqzQCsV2Y0ABU+4RlPLF6BW/1DCXkdvL7rEO+yjmIRQq
 9r6xbae4lBFRdwmaGG4FE9vMEbsPW/D1MxEBj+CFykds1TULrniZ5PW1+zQrk2hc8G0bPfsNsLH
 aCXnehWE1eCndFFBuHL2pgUVsl9sWd1k6PDeoJAJnKEu36BCR6cQSAeplJuZTUheIlGFJXR5xFC
 8rg+IfBwEOwOJnm402kGOSM5i1lKR/Hymk8WXDsf39DVy8n3T+NVWIMKfnYTwIfq3rgpHLFpA4q
 lwNd99D6WHXKAscAjeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA3MiBTYWx0ZWRfX31MwXNwu5jJI
 7ZANXNelKE8dey+33hzTGC7q86cGQS6VCy4yGbC989s20M3nl+SUkN9Dk+fKgLNKmyNdBu7QQeU
 uDcINsqADcUqni0DpAqs7UbZuw6TxGI=
X-Proofpoint-ORIG-GUID: JzZVHQe612xnOjP5XtKpnAUreBBHEGtO
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a929863 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dfU3YGO4DwT6tcRypCgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JzZVHQe612xnOjP5XtKpnAUreBBHEGtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_012925_071762_267A7183 
X-CRM114-Status: GOOD (  22.52  )
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
restored explicitly and the TC-to-queue mapping is restored to the
previously saved values.
Introduce stmmac_set_ndev_tcs utility routine.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 75 ++++++++++++++++++-------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 14cabe76e53e..be8ddda2aa76 100644
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
+	if (ntc == 1)
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
@@ -1250,45 +1274,56 @@ static void stmmac_reset_tc_mqprio(struct net_device *ndev,
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
+	ndev_ntc = netdev_get_num_tc(ndev) ? : 1;
+	for (i = 0; i < ARRAY_SIZE(ndev->tc_to_txq); i++)
+		ndev_tc_to_txq[i].combined =
+			READ_ONCE(ndev->tc_to_txq[i].combined);
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
 
 	return err;
 }

-- 
2.55.0


