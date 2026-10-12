Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E117ECA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ErFr+tQW2NzUZN/muqWAyknar+olI/llznWFgISvSBE=; b=zXO0u77haSFKMbUlNOCadpAkHg
	wyQ96b+2idyrK/1rVRZzdGZjDbFOM83Fv6nLCfLPYhUBRDq+QuUWMMBLbF3iWmgJoNEFDxJMXYwjc
	Pd/lYqVQspkJCc1HGN+eHUznY+28RhIofAaGoAY1vp4AHr9TBZ0/t9EMwL61mNAG8Bav/C69uYiZ5
	HW6ussTH9iisL/tSjSdJQleb7jgiMAgvmquh5ypudQZPgFnoEhHu1V289Df15U9jYKXtNQ88bQipB
	ROwjc32iCNbjYAyw6F21RasECABNZ3RAW6zWftW0ycwjc4PB/HCxD353WupfRmnpUU5i8Fi3qH4xi
	NBdEdCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNLs-0000000BWtm-3ebt;
	Mon, 12 Oct 2026 21:14:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNLq-0000000BWtP-1jUN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:14:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJMl21079967
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ErFr+tQW2NzUZN/muqWAyk
	nar+olI/llznWFgISvSBE=; b=cJ4edZc/Fi06mbdf/WbGGhh3RzqU0Ljyu4H5zu
	1LtYqGJHY/OGuW+xeDgtzKzlpXMFP8kSgeA8GZ/PmaIuKu3B1fs+T9Px7FQ5QjFH
	yI7C5kpT9Ssr1tC2yNtzi76MloPJMBUmQh8RPuGiZwUvSDNeXCmfHm00tbMB2nP6
	wskQnkFTKQ1/P5naOPEj5J905SrIJUfcyGd3mis+cPHudpkGdGehtSD4AGeKtQuR
	gcSey1FFaq8Rfgyy5ZHT2A76VCAwgHhr6v5lGPKI+CZvH4titlg/QDob5ZzxEsJL
	LU4S9WF/9Z/bBzct3M1FLxvMpnmrdUnm7/Cs6U1bK7B/JwDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3kfd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:14:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so554547485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791839669; x=1792444469; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ErFr+tQW2NzUZN/muqWAyknar+olI/llznWFgISvSBE=;
        b=Rwt9EBHQnsTz2bCj9UUG9X9tSpwLRQ6J+qO6wXH0oDAnTBhZ61eB3prQ6u/Lq88vc0
         u3O1iIaG0tTAgaCqAeo4kiFiq/2hzJyA4jkOt0hhZLENoEo0ci2YwIULXhMKjm70qlz3
         Fj+dAmC1HYz6S1FwHQ40tX5QGECPgocSkITTTxYeYSNLxTRNxz47vyI97+CM9WOy7pju
         QNklxTPV5d4WNtir6cmpPIhKBwljo780eEst6Hw5OuuWso0d69kgJEbZ3U5GszS+6iKI
         RTFYK0r61/gjMb4UBk7mHRiHwGhnpzYZKSkXcbUcmmMrlW8Uc3Ul/nfIcF23HzNKEXVx
         +Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839669; x=1792444469;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ErFr+tQW2NzUZN/muqWAyknar+olI/llznWFgISvSBE=;
        b=zL8lSBbt+etzplOROqE8qeqTmRnuAkLIT/0n/z9UfRKAckx73OSXr81PDmOmGzHiWG
         2EQ4kwFf94mKLFDyF4ROS9h1GNLzpn28320bToiDIL5H+3WdvMMPjGsC8djWskTmPS3/
         Sd8orS+TYnzqpfj/QxXpMGY8e8jDIP3ONCV8UhJ0fSKMlRcnZwDk7a4baZYMMeoQ2q0Q
         kWlgmBRGkUbW6qNaTyD7VVggjfu96GV70MmO1GpEI2K212Enrg5BUuyzrDKg19IZPTlO
         P3qjUZj4aZ3sQacb6FWlF8mAb34BXIJUJpsGHPaENuc/H+uQt2v8Fy44JeJywQjiLXVS
         NMjw==
X-Forwarded-Encrypted: i=1; AKwUvByQpTttLjZPst1yZfn3qQOPb62fcMLI3rlxuLRCnREqmawV1Sl5s6kg0zwfAvVxZfju7s1cbTIvqIN17+1jw38t@lists.infradead.org
X-Gm-Message-State: AFq9FYLh84Zr+7r/KMZDFZI/sTPnEwCqAJM9cjm7yUUYzvgE4Rmby/Tm
	h0mtY6QEx1q+1oIUq/p+ZkcjkIWHFokynAwwppgdL8y/x+YVHGSA+TXv2KHhtPoATi+CrEjkQGP
	TyMIiVi9QvJeixGaSkQZbGSVkeuaYh/7cefTn69RZzefJddVObZlzTYaODjQElQq4JmOYwQ+Gxn
	l0Gw==
X-Gm-Gg: AYBFou0uofcaoa7vXbQC5DJgGETfUUUTxUDhpMYsaEO7daHcyirkKCoaRVLbUfwARYj
	BgdK7QJTDi+m/rerZq/QIxpCN2wI+nLcpLQRgzsLW0LDE3Ec+x2dwiEtX18HsExl5AZb0kHziff
	SZlfEpvRftpJ/SInAZXGbV0H60rOsuUL9WUMDxVtRT3UlQ+q4Adhab8xAU98DCui4RxZ/hNnfSC
	ObiErbytD0IlqMajMANkkDc7AixPa/R2iaqM/OmlRPIqkMnJoipDKm0PG6FZMyAXdSaDO71hv1l
	lbiHcX3lFjx1hnGpZ73yBnNDiNOBV/BkN5y1vnl7Gv7M6VttqUaJziBDOezB/HS9u35KOdFCOsl
	OiLhilgKVBCHqfw==
X-Received: by 2002:a05:620a:444a:b0:93e:c12c:f13d with SMTP id af79cd13be357-93ec12d05e2mr1648439485a.71.1791839668520;
        Mon, 12 Oct 2026 14:14:28 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:93e:c12c:f13d with SMTP id af79cd13be357-93ec12d05e2mr1648437285a.71.1791839668048;
        Mon, 12 Oct 2026 14:14:28 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm366484935e9.1.2026.10.12.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:14:26 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:14:06 +0200
Subject: [PATCH net-next] net: stmmac: fix mqprio and cbs combination
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxA0atI1g2YKC16ldKFprHNYmbsZBBBv
 LtDl2/x/wGu2dRhbA7IuplbihV0a0C+U/wo2rsauOU7tcToJYRJMPzWbAlldpQU5oRdTwvxox9
 EGWq9Zl1s/5+fELVg1L3A6zwvSwLX6XMAAAA=
X-Change-ID: 20261012-stmmac-mqprio-cbs-combo-341f12749ce2
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NCBTYWx0ZWRfX6IvYvV6TBtq8
 qX2TihbT/zCmzd9dWkLtjR9C+2qP5tvs1tjGHzws+rJDU4ywIRYxybRsr6sdioBPl16JpIyT0XV
 Aa7pEYk0yWdqGGYC4dp3K2TtV2+coFZ8VaOgSaAmDxzfOwbILpEG0cc1S8+LXobk5xUhSVLg2eq
 XBiT0di4/tgCH4c+78noYL3d3dlX0JNBjKrbJBuRrLfjCnYAInznlfv3LdUfU7tNp+Acr1aJ2B1
 1MhGnSKwBte6RdZC8Qi9N5FJQK/KD9T9rZQrMq20DpQQpPsrBIAzhxl9sLW+6KBGvqHmPttyTpC
 zXiDBnZxrUKrCOiehbkpNdEDm6ctMeXOOX4T+2ha0nktWbmfeDIf0N7axPoHiIEPYLtiB3kkL8Q
 ODBixV6t9QUVQGGkj9waUIAtm+iza+3HlNw/vcdAYER8m0k86seCV+CWYiXmhi8TqSohpUzG5Nr
 7T1PTHnD/njYWY4/goA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NCBTYWx0ZWRfX0vPynLph27Wh
 GW9eGCg0n7OLDYHzuNrojAl18v9BbS+XV7Hwc3U3ElJp4ZhWnttmEo+eL6+JmYuE11XYcseO7cm
 htCdVNg+MoOlU101H6Va8afivVE+4qc=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd4db5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=RGP7YYwxf8wD1rvbjroA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: NZj44cCwHT5UZeDesOXVnYootBRwxYn7
X-Proofpoint-GUID: NZj44cCwHT5UZeDesOXVnYootBRwxYn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_141430_488511_15BB4B20 
X-CRM114-Status: GOOD (  17.42  )
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

The channel-mode mqprio offload and the CBS offload can currently not be
enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
mqprio offload as soon as any TX queue is configured in AVB mode, and
tc_setup_cbs() refuses to enable CBS while the strict-priority scheduler
is active. As a result the combination is rejected whichever order the
two are configured in.

The strict-priority scheduler selected by the channel-mode mqprio
offload and the per-queue CBS shaper are independent MTL settings and do
not conflict, so drop the checks and let the combination be offloaded.
The following configuration, which was previously refused, now works:

  $ tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
        map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
        queues 1@0 1@1 1@2 1@3 mode channel hw 1
  $ tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
        idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 offload 0
  $ tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
        idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 offload 1
  $ tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
        idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 offload 1

Fixes: 47891d501e34 ("net: stmmac: add tc mqprio hw queue priority offload")
Tested-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 --------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 16 ----------------
 2 files changed, 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56d89a696272..51d502930219 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7740,14 +7740,6 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
 		return -EINVAL;
 
-	if (priv->xmit_qdisc.prio_offload) {
-		for (i = priv->plat->tx_queues_to_use; i < tx_cnt; i++) {
-			if (priv->plat->tx_queues_cfg[i].mode_to_use ==
-			    MTL_QUEUE_AVB)
-				return -EINVAL;
-		}
-	}
-
 	if (netif_running(dev))
 		stmmac_release(dev);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index ea1f97d6f0bd..175236ba379d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -346,9 +346,6 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 	if (!priv->dma_cap.av)
 		return -EOPNOTSUPP;
 
-	if (qopt->enable && priv->xmit_qdisc.prio_offload)
-		return -EOPNOTSUPP;
-
 	port_transmit_rate_kbps = qopt->idleslope - qopt->sendslope;
 
 	if (qopt->enable) {
@@ -1340,7 +1337,6 @@ static void tc_mqprio_config_queue_prio(struct stmmac_priv *priv,
 static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
 					struct tc_mqprio_qopt_offload *mqprio)
 {
-	struct plat_stmmacenet_data *pdata = priv->plat;
 	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
 	int i;
 
@@ -1350,18 +1346,6 @@ static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
-	/* Forcing strict priority conflicts with the CBS algorithm
-	 * of AVB queues, so reject the offload when any queue is
-	 * configured as AVB.
-	 */
-	for (i = 0; i < pdata->tx_queues_to_use; i++) {
-		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB) {
-			NL_SET_ERR_MSG_MOD(mqprio->extack,
-					   "SP conflicts with AVB queues");
-			return -EOPNOTSUPP;
-		}
-	}
-
 	for (i = 0; i < qopt->num_tc; i++) {
 		/* The offload switches the MTL scheduler to strict
 		 * priority, which only supports a 1:1 TC to TX queue

---
base-commit: d0bd617658ddfa5a115e64d1ab687bf155f6331f
change-id: 20261012-stmmac-mqprio-cbs-combo-341f12749ce2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


