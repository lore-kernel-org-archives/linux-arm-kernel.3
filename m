Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1E4C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3HjjQY/dE3cRcwJS8qtQGYaELgdNeUTwOrJbPhHwVo=; b=1Zz3kzPKk1r5m+3ZYfKVSBZnzB
	KP/keTjoX3/W4GcLFDsx947c65zFXBoaRwqcaRHcnrTAyQocVXGvseUiz+MRMciEh7tgUlmYPOGmZ
	fMDlmEDvdpl4RLcsskLjYfkAyBmYCn6s1ZbSFq0PKlfLFxUEG7hdKnf1nieEfLXBVeOXKIef403+y
	A20e7aCUegZ9YloaQS4iUHB1SISjU5WnlPAaSR5r4Z+FeNfbQPpFQXHM6Ud7MM7qGzxgX+Yke7986
	dPKktWn0HFO5WoMr03UOHmnx58p7BMhi10aByPTDjbQTP4vaV6WBSDwyGXskBDOxgewKLUxx99J75
	FBxoDmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x60-0000000GCOZ-0nNU;
	Fri, 11 Sep 2026 08:58:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x5w-0000000GCMr-3TGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:58:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7khER3844988
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3HjjQY/dE3cRcwJS8qtQGYaELgdNeUTwOrJbPhHwVo=; b=bb9GhZk6v5YdCdz0
	z9I3/NWv4IgzM4Qpy6UCFTE4kdcmNjP7JesW1i0Uws6npYyc9T2B5GEmzgyTtkU7
	5CgFuqnXdaawrCcix6Fm9uL4YPLq3truxMDNbrW+yb4Yni5rLVGsdhAQQbir9DtP
	ZcWeVP8+QmSzcqMdEgnkXN/f2llVSsBPgjys+L4ZdOG8zapc6X83ebkM5nzU/ZP0
	IR4mifLM/+UHZasbWLx4ZTEjb9MzK3urTeBQYKI0IeDLqrOiN1HzfRz7pzzheEzt
	bQTPCV4/OVOYPey/ztl4SWpcuhTjLZ0qHR4alOGog2r8etypiaeCG6UuyFHfBeKc
	+pCVMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q421sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:58:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93917f4ccb4so90070485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 01:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117131; x=1789721931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3HjjQY/dE3cRcwJS8qtQGYaELgdNeUTwOrJbPhHwVo=;
        b=jSR7/AG0DzX/CeNd2YnVNWLcduzCy5ayIRgAER5XKuP0/gYCXhlpfkiSUREL/N13no
         13SAriicWKomBNhMLg7PhUzZZtvr/HM2f7vqnXLHyIrb1i5lgGpPNtmrMIDeYiw0bEHd
         2kuF0gAAszdx+LF3BNyI4IL4zCj6MrxfSKaNNXzyPcpYAKQ0If8VdvrGw8FzE5y8c387
         vGtf3QELWipfGGk6eEmGU1KAemH1rqLsUtNekAHpuoUAfMXtVSGRdRCUpVq6txROaZNZ
         ugYlQcIKJ4H71yFpA5pRX5gP9bQRignbwTCx3epAhUGf2pYYIN8kISVZ5D7GEkT96/DB
         D9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117131; x=1789721931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3HjjQY/dE3cRcwJS8qtQGYaELgdNeUTwOrJbPhHwVo=;
        b=ciYzkQ7Kn3Of3mcM0PYhWdpMUnv79Z9bBHMcdoFk1bOQV8SthW61LjwyaUxH9Wrz/j
         Nb99A5eFfbBZ/immr9xkkRb3w5MY77yjOoGiF+4Ls5M2fwLBpwoTmBCwwZavLoXLsUhP
         VmsysBn8UAEPBjtigxZ9eyAk+IhLVKomw7LHcwXdjDYVkFs0ji6DIpVSAmFLhceDxtvy
         lqXKj6qJ13vI38Twyjih84YanT0H0zfho+97K7V0xuufvfSrVTqN+yY4xiqsKvR1fCgq
         4WUVcsIMerLEOR/yMtXMq47eBKcK9FAhSrqay1cZ5G69Wk59aWsgUK5wv1CVFKE4s39j
         4DyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFfW3UgxECtuREhj14Kz570lN7bXs+VQqsmUqL4xeJfSbHbLaFJy2Qow2RHS7bmyga5sS89Ss9VgzUBXVIK1Ke@lists.infradead.org
X-Gm-Message-State: AFuF++l4u8/49xQCGR6vYNjMBsuKzOKG+65l7JTYZviRyf53idHv9Bu+
	6Io12SDjSEvpM3IjqgK5Gjq4lR2DIO94n4JviGiN0gReUwrG+dyYOc1Nq4IX/j+twPPYm5SYNkQ
	mA3Bp/ZiUGXU/RqJIUEAtMU3W5BE0gnR1IdrLh9QOWskHy8vOety0dvju7/ZZSAVh3xgapieFAb
	05Pg==
X-Gm-Gg: AYBFou2AenwJ6Ta5l1m5UaIRediDflGhQoUOTBkC2+1B4FpXTCzKmoP+2/dvaD+JBKA
	2W8d0r7GoMPihJoG4XI5b99VbRDkn2emCAQYlumx+asVhamVVj8TLuQl5lHn2h40DXat5GLsdws
	6oqcxvd9mrSWwiYjELERT1Q3gn1WxTdTTYeMs/aqtp486ez53RwHZkunLJiRYY54Y36mxf/ybJa
	21OSa/ys1FsHGxJAHBjF5ueIlmqM51wgODMR7oZ5izYxzmyDh6tWJ5SO0Avl/ofJh7lKAS7qoWZ
	QWSvXIcd5Lht/88+75k8/BQUu6u7WQnOSpsABkna+MCHyCBxCljtDw+wAlAzFRIo7ERC9qr09Z5
	trwwDKGoaDkmguA==
X-Received: by 2002:a05:620a:1995:b0:939:d91f:1656 with SMTP id af79cd13be357-939ea0e6b22mr384945185a.23.1789117131130;
        Fri, 11 Sep 2026 01:58:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1995:b0:939:d91f:1656 with SMTP id af79cd13be357-939ea0e6b22mr384942085a.23.1789117130679;
        Fri, 11 Sep 2026 01:58:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5765152asm91148055e9.11.2026.09.11.01.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:58:49 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:58:30 +0200
Subject: [PATCH net v3 2/2] net: stmmac: preserve real_num_tx_queues on
 mqprio setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-2-a76b1e2547c1@oss.qualcomm.com>
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
X-Proofpoint-GUID: _hbdan4CBUpHWbFekXb4Q-7iT-_RsFoa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX5RNHqBDlyt0v
 x0caLSmueoVkOYt04Q6y6h7cx5O6JvEuvW+XcBfodq9GXS44gOFwWuxYF5JZ/tmz3J7yW6ysNTs
 PB3fvRdQpFHBlffN2UlSmda/sf8btCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfXyGhIYeo3DLpy
 jlo6IcdKx9FIwd/J4j2gnvzlz5BX2+pJyZXYR+HibEzBYXpau7jyetb9+UIgF3+9QNqP0Qv1nm7
 QuQjYj3HtQfzJ5pxvITsY15ojd9mTgNW5a4D/LA3QcCAKCWPEm+/9JYg9KZohfxSgizn8FiR/5p
 XURc2hNKUFNTfYaX39bVxCA3nLStFBFHFsaoHGecAUD0Nt9ATdQDzF+V2EUmOlJLXHBhe+zU4yA
 ryaw4EyuXWipy43YUrBdviDRwuN13tn6HlNSrBn2xcP7dYBfSuTmt94AN4AF4RJlFln4uFM3XKc
 ePQfZAoR+1NK3ssesQBe+1pIEbWvXHJ+0+z+VQ5oUAdwBgxZ3bvepaZvWaxcYu4klw8ajqfVoDj
 4OhxzFnxDZHfpQ7BIOUexbDQDU24jMKRUZJj/tun8dilJ2VOHtIzCskVaCNmS/S8nmFG/uaqsjW
 yiGWX8i4JjaJ15bLVcw==
X-Proofpoint-ORIG-GUID: _hbdan4CBUpHWbFekXb4Q-7iT-_RsFoa
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3c2cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0NSVpFHRlRhN2sU1BpMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015853_000067_F4F2C231 
X-CRM114-Status: GOOD (  24.03  )
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

  # First mqprio config lowers the hw queue count below the platform
  # default (e.g. 8 TX queues).
  $tc qdisc add dev eth0 root handle 1: mqprio queues 2@0 2@2

  # Replace mqprio configuration with a second one that fails FPE
  # preemption-class mapping. stmmac driver resets the real_num_tx_queues
  # to the platform maximum, losing the previous configuration.
  $tc qdisc replace dev eth0 root handle 2: mqprio queues 2@0 2@2 fp E P

Save ndev->real_num_tx_queues before lowering it and restore it,
together with the TC-to-queue and priority-to-TC mappings, when the FPE
preemption-class mapping fails, instead of resetting the queue count to
the platform maximum.

Note that a failed setup makes the qdisc layer run mqprio_destroy() on
the new qdisc. Because priv->hw_offload is only assigned after
ndo_setup_tc() succeeds, mqprio_destroy() calls netdev_set_num_tc(dev, 0),
so dev->num_tc ends up 0 regardless of the driver-side restore and the
previous qdisc is not reactivated. The restore is still needed to keep
real_num_tx_queues and to avoid leaving the failed configuration's
TC-to-queue and priority-to-TC mappings in place.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 82 +++++++++++++++++++------
 1 file changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 5398616fcdfe..42a00446e9b4 100644
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
@@ -1251,43 +1275,61 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
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
+	if (netif_set_real_num_tx_queues(ndev, ndev_num_tx_queues))
+		netdev_warn(ndev, "Failed to restore %u TX queues\n",
+			    ndev_num_tx_queues);
+error_reset_tc:
+	stmmac_set_ndev_tcs(ndev, ndev_ntc, ndev_tc_to_txq);
+	for (i = 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
+		netdev_set_prio_tc_map(ndev, i, ndev_prio_tc_map[i]);
 
 	return err;
 }

-- 
2.55.0


