Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC2ECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xdl62n1wiBc9Gn4/M7T/49FaHFU4dsJOFf9sXgcFNlQ=; b=15Xo64diRLYVWVUsCvC+fpMiaO
	5Pck8O6gvAT2SJ+8vjpeeqrD3JGpLW2/1SCQWa8DAvvfw/gTfLS2fhzs+N+GFkMbp0T2Zfm2L1aR9
	wKXeALFUOCZxnIIbRS0VJ4ezaGDAYqWhOd6CYVKHWlmoX3/UG3izhka4wymUl8bcyG4RmB1iX/Q2N
	xCfhrOibfcxR2a/9Y/h5mOUQKs3FjFjKVGJzWUJxSnZzeTSB6qj1BfFt6xwgUpbY6HGrIPOEQUJHa
	tyCzm8DajWDhJE7kBIgUzPkhfwIW3TGBpP2UJmh6NpxuW599POzKuc7eRacROHdnFPqJJmpdV4CG8
	EfVErGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBY-00000009HCA-2d8y;
	Thu, 01 Oct 2026 13:50:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBU-00000009H9x-2VFn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:50:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjNQg1970266
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 13:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xdl62n1wiBc9Gn4/M7T/49FaHFU4dsJOFf9sXgcFNlQ=; b=UK5Y3x5EKAULBZnR
	Is5cPX2YohIAPUFKMMxXm44D54vpKJMdaW6B11I/PJIISv0/rK43uE6pOkcmFVkB
	LebSOeFxWjBVG38PdM4A2b+Tt/m9VZhpLbH1qu2JZOxEW0DxE99YOoR3IWDjztnQ
	yleSt5L35x7u2e3B8umxqoFMgxeUj6EX/IU/zV651QZRNhp9Dp6I/P6s/SZnJ+p3
	/nYeUdzp3x/MZU4svGrxdIPBkX8kA1laulj1gv8PFQiuE6BYWQA7bB2qo6pu1t3R
	iL2NSXI3d+krF5b5LvejG0oiBGL3SAxEIWpu8WSJTaJRuBjnkUuEBOGC7r6dazhh
	NvjxIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvvf1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:50:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so34674726d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862651; x=1791467451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xdl62n1wiBc9Gn4/M7T/49FaHFU4dsJOFf9sXgcFNlQ=;
        b=esgiSbD8BGY0ettwkdhp03nkBGO4W/tLMwkSSHmEu5n2deYTlhcgB2cejMJzwfpinD
         aA3JVGZCAnrnC0vedeE5ozWcHorDKon1sj6kb/Qlt1Fbon/GyNz6412MT5LpGBxGbwD+
         ltjv72ruCJ6CZkPFn4vr+sFm1Y7CiKeMEGmeOq2jtsYEjX93WSyr4qcpZnHDvAVppo6R
         y/LCqiizUmBZcs4h/uV0RIWDT2Fn3pKpO27pueqlY694LrlcRY47KhSIYN/ZoJjh5JOY
         JfwFOWhJnQduS9DhAmxPvtEUjBW+JZIdx7i9dn5mKDOiEvHWGzxt8EqSub4g9Xgnxv5H
         PgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862651; x=1791467451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xdl62n1wiBc9Gn4/M7T/49FaHFU4dsJOFf9sXgcFNlQ=;
        b=J9EzAnypKz7Bh1T3OciKm6XjB2L7IuAGm0QO542yqc1yzRc/ZoS4uvU0pLK17f1VQc
         2RILR6gbEY9Wi8f1W3MoUOfSxAeeGnkCaijP99GwIWxCnWdhCKxxo1u80cYuht4i9p/o
         67xc06xTi1G7mnwHCoVSaEglgAviFXPuMLY16YhT+jYiaNSTKnY9ZFIVxJc2odPpFIWk
         SvJYwzxRwOCACYFSmoFjdUiUBgw32VvfDVaMMWRTmZYJfds+P36UYbAMFiPw79FdiQ8M
         tX9xMkQTUAHEo4qT5hZvZcVQDXJM+QxJIbpDzD0YHthKf/hclwPM32uNr8i/ydEOntu6
         lyrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTZ+bfKl2KTOSekj7CjIvEv7AQ3ENJxxrSS0M4+a0OQE1Bre5MRIWrnjjojBrv12fP9eKCf7MoA9nQWeDpkiL7@lists.infradead.org
X-Gm-Message-State: AFuF++l/hVXApjLkUcS7TgZeZXvVJi8S3kj3U616nnSgZtT8k0diLiEY
	6BAfll9Q51HePxRzT/3V76Idcl1v1pPX2zbXWHS7jlu2sM7rS2c2j1Ctxui8bQig8HDBc5T7SLl
	XS7oO9qIQ4xN6NUAGSsyG/hcI8je5/yVrAvGnDRL0VTR9bVqDnsaKHEMnP9q1Eer2Fmfm5u6tJO
	rdJg==
X-Gm-Gg: AYBFou0oGeYhfy19vfTRYRUcK0HQtyY6LDU0l/DLI5tr/9l4KKbJnBz8bsyLtGOqTsD
	4blCjGSjaDOl3MKFKBd6YemFaOOpYaAtkvvXVCxAjl3nevw0w+dBVg5KhjavRpMrOt2qTAdma1Y
	W4bM6CUt1IKTa9yTguB6kHsjvr+aA0PTX1XKsp4Snq4paqL79+cgJ9m5lWMYDuniqPgMpMIqqM5
	Oj381DpIHVY0XZZ0/PkduO3p2/TPEvNq7PhVb9Cvp1Fl3JnJRDahgv5KUB/GIsGa7+sRkwe1tt/
	s/HpgUL67Y04e3bdSTq8AC2mEqE4+7tFKggdP8urcYqux6CiYknM/R0lJcQFvUeweyNyLGuU/o+
	OyllklHf/pUrnzA==
X-Received: by 2002:a05:620a:6cc5:b0:92e:bc28:5479 with SMTP id af79cd13be357-93ca9503ee0mr922658785a.2.1790862650955;
        Thu, 01 Oct 2026 06:50:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:92e:bc28:5479 with SMTP id af79cd13be357-93ca9503ee0mr922650785a.2.1790862650268;
        Thu, 01 Oct 2026 06:50:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d427besm165627466b.48.2026.10.01.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:50:49 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:50:19 +0200
Subject: [PATCH net-next v4 2/3] net: stmmac: align real_num_tx_queues to
 mqprio configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-stmmac-mqprio-prio-offload-v4-2-a74610d7f1e5@oss.qualcomm.com>
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: MIQCakbmsi1nnIt_-SsAqbWFA3OGFtt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXwrtL9iCW+Yg2
 tsIZzChmhR747wVGwwNen5x1dPFKpkqCiora0Luar4LbsXuyyl18d4l9C4/pEKpcjAyGONGafcp
 66+S/l8AvazEVRRB/3ThJaNNC2qjQ2RuEBBxY8EqY225uwkNgem7xdBcxnF8OBTnTTymMh8rP+L
 0Mns3Px12zCehlbIJU+AWOgwa0DUQTvmMcGB08iMqHF7BJWWUJhPbWrlaZbvkYbRgiQ1fJGQP/w
 umJf98kXtL9Q/OWcKDfGXB/wR0E7kpj5Z/hUKOSiemq2NyTNd5Oe+YeRntGGXLUzP7BdsbWvLi0
 C5gWGRKw15MvL8FFurwmxsj/WxT+0QmL9vSq3Xh7PtwUJTaJ+XjbA+k6NQ45b83bKxXkrFxeUr1
 +avzyw86mQgDkzPZRoIpknARYcQFiUChKiuOaSFg3AqCHlvTgpXhTwc+EUUwZGpLjzfMS5n1Acu
 vL66SNg8J+s6eEC+Tfw==
X-Proofpoint-GUID: MIQCakbmsi1nnIt_-SsAqbWFA3OGFtt9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXwf0brVbKOU9r
 gJH6RUWntgsQbTQt3do1z7DJBC/S/GgN6De5HFEy1fl0coENcsRIkmOnkMHTyl0rt+blANzzbkm
 T4QUf13/7qMArmTQ7tx9V5K8BEZJsPw=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe653c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=dbvV_YUU-CEaD36rsUoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065052_671840_B4E1A840 
X-CRM114-Status: GOOD (  26.19  )
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

stmmac_hw_setup() unconditionally sets the number of real TX queues to
plat->tx_queues_to_use on every device open. When a tc-mqprio qdisc is
offloaded the driver reduces netif_set_real_num_tx_queues() to the number
of queues enabled by the offload, but the next device open reverts it to
plat->tx_queues_to_use while the netdev TC map is still the one programmed
by the qdisc, leaving the two inconsistent.

Track the number of TX queues enabled by the current qdisc configuration
in the per-qdisc state (priv->xmit_qdisc.num_tx_queues) and use it in
stmmac_hw_setup(). The field defaults to plat->tx_queues_to_use at probe
time and when the mqprio qdisc is destroyed, meaning no offload is active
and the number of real TX queues must match the number of queues the
driver allocated, and it is updated to the offloaded queue count on a
successful mqprio setup.

Refuse to lower the number of TX queues below the count required by the
active mqprio offload in stmmac_reinit_queues(), otherwise
netif_set_real_num_tx_queues() would leave real_num_tx_queues
inconsistent with the netdev TC map.

The issue has been reported by sashiko and the patch has been tested on
a Qualcomm RB3-Gen2 board.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  6 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  6 ++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..0052f2129297 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -299,6 +299,12 @@ struct stmmac_priv {
 	/* Protect est parameters */
 	struct mutex est_lock;
 	struct stmmac_est *est;
+
+	struct {
+		bool enabled;
+		u32 num_tx_queues;
+	} xmit_qdisc;
+
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d95482b7f6e5..1dc9218bd4e9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3778,7 +3778,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Configure real RX and TX queues */
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
-	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
+	netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);
 
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
@@ -7692,6 +7692,10 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
 
+	if (priv->xmit_qdisc.enabled &&
+	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
+		return -EINVAL;
+
 	if (netif_running(dev))
 		stmmac_release(dev);
 
@@ -7699,6 +7703,9 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 
 	priv->plat->rx_queues_to_use = rx_cnt;
 	priv->plat->tx_queues_to_use = tx_cnt;
+	if (!priv->xmit_qdisc.enabled)
+		priv->xmit_qdisc.num_tx_queues = tx_cnt;
+
 	if (!netif_is_rxfh_configured(dev))
 		for (i = 0; i < ARRAY_SIZE(priv->rss.table); i++)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
@@ -8010,6 +8017,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
+	/* Default qdisc num_tx_queues */
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
+
 	ret = stmmac_tc_init(priv, priv);
 	if (!ret) {
 		ndev->hw_features |= NETIF_F_HW_TC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 1aa80d51ab33..d0c3feb45789 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1266,6 +1266,9 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
+	priv->xmit_qdisc.enabled = false;
+
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
 
@@ -1321,6 +1324,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_num_tx_queues;
 
+	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
+	priv->xmit_qdisc.enabled = true;
+
 	return 0;
 
 error_reset_num_tx_queues:

-- 
2.55.0


