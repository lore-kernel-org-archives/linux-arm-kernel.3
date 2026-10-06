Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5376ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkdaTawAeWTd5xZOK+YRjCbD0V9u8wUiR43gGegjqfY=; b=vAawjk34cG9JHRmLQ5XWyP4nQb
	+29YZKyuh8uvX7LEoV1/7byOJEiYiGAJYKP26IjXQXqWZY6ie/nGQIp6iMnwus66yIve8t48KTShB
	KNXaqxNgXz8B0FqfHI7LbizB8QpF12jkb7v4PWwzo53S9A5/WnVZCn1BERm2L/p8JvujkPTtmduWt
	CHpEVybCboN5rXnNHwSzAoPXC61+45zi5GyC8yHr2JkPomFd0EpI+IloPspZa0abXKvBODijAjg2w
	KoukR0a6FCQCEqTOj3UAYepnlicxupFwEQydpxDBemxgMAYH+tmgj1zY46sELFMHQ6L2bKh9+4HcY
	2u0C1iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2h4-00000000YJC-1W6n;
	Tue, 06 Oct 2026 10:46:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2h0-00000000YH5-3LQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:46:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARHkf590772
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rkdaTawAeWTd5xZOK+YRjCbD0V9u8wUiR43gGegjqfY=; b=okYiRRBwMVMFXqNS
	DRex+TQ7mHWktpekgYsceIKXKkX2S2qF8p5JdR6wY6y0WXf6LiqixX+TEFgcutJa
	iiz3Wif2r9ZtR+gy9MJPn2M30pJUzrFq0Xgenm1aU5B3trIvgKWblfb4246QR9OK
	6mrNbxPqtC+t8BHjAAmkTFnN1sbJ/KAK+pvGRH8NmWElDmMojkjjBxOddF09EEjf
	74n+TKZLbdf9OvRph0oBbtiRqvcnRjsYfomMJ1XgAIpjBBGaWnYZEzu/wP+f9qlV
	0Je9zUyLDxzXHWwjuXUbK5v28KO7Auw1CkEafVlYE+br6i055zHqdOfo7T0wR8/I
	nDxKiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3k762-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:46:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so677777385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791283601; x=1791888401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkdaTawAeWTd5xZOK+YRjCbD0V9u8wUiR43gGegjqfY=;
        b=OFrAHtwm5NXvhNTLjq9mXUfSXfsxYARnml/bVCNJjNdbr5T9btU8Nkf1WgZcpT1oiM
         jI46TS4wmA+atSUrhC+FCVLL+uyQgeiia5QmNRTJRJM/pf+ZpIW4GFVEO+Y9HR+Us/lP
         r7iC7WjPOTz5jYlDJw8ejC5kOmI+DsuW1lzKY/DT8/Q1tQDm2JmCqb+18xMq64254f8t
         knaNe328aNnF8rf70MS9oi7cA+zsSzOe0pl14+9t3l7wyRdfEm6hpO6+MLSLNKywEXz8
         ZRWoy5RMtkjZhUr+VHBeqVDOw6SiUpZk0FQmbwZd7dk1MpGQYUvI/Doli1tNtQUVxDd8
         SHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283601; x=1791888401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkdaTawAeWTd5xZOK+YRjCbD0V9u8wUiR43gGegjqfY=;
        b=TkC3o8WkoiMWNZIwscfKaJLPx4KzwDjTWmyaTeFpHG8jwS2WIYw/ZTe3dHzGSofJAl
         DnBBUI04F2EekGwryB14Wt9K4OWGYEEOVZ7gF+NeIxK8sI8caG8ipbNJgHXCXWnPZi2A
         Spa2uYgH7BYJZnSTh/TKLczl/YQRFYrd27ePQ/NkIWZZt1y2pDpu06OibQ9BcFoAHlvn
         FYb0hY7GLQoLQHuisgFhauoEs2mvSFuK9FQscKEiuUJ751bTwGoXVW4ZgIz57avHo9/I
         KLZLU/U7mttdJxiuyWBWk9aVsKVQT6Ufk+wIeH2OAnkj3uSWOi95g8WDSbT3YldAGvHv
         dpww==
X-Forwarded-Encrypted: i=1; AKwUvBwZ42iRyOeTwf/KczzEqAah4CzJ9xNdX25hLtob5FSFVMkKjDbEWw7iElxIS7xB4qyK2VHJm88a4X8PzxCo4/+k@lists.infradead.org
X-Gm-Message-State: AFuF++n/abM1ZCT9roJn2sBkSnVLavjioKtfpyadUxdxCaWEr9+iHX+L
	g7733Z4/ieltfr0fAO8hyIgNx3e6y95uoizEB18shyvne8VaA/wvF6cH018aQewIzpgqFPt/pR5
	YJpX3FiULZbRAnDCAFdQEsVr4I7GVdCqN6D+9T1TIVKECuX2tUWRDIrHDYicesQ6LpJC324iFG8
	wDo+YBOE1dlA==
X-Gm-Gg: AYBFou2VoPMn7p/eFTOnP8TCZMQBZKU6+eo2jxK7HGNuAa+7utkECBjTZtgdapzzmX5
	9tN26HaZLh2nItIUz30z2HNGjS/DhGgbOEF3NB7Ehlfdm7PovDyNMQZFJxWMOq0CokIlI7smPoa
	i0M4s63os99bG/nk3KjMfUdiBt5EIzidNe9gwKuPYx9f3+bCcB/pOxFxPah4wKzTskN65MRrEhw
	+qxKu/CI1KgdHg4G7fvako4PGE5g9FCEEB2ZDTJkTAldCiQjBQWOI+Ftk0GAxdZ4MuHhoE0A3ES
	OeFlVf9doSxDRgPr5oSMpibGrWuLVmzi07R28oAAlgQvAQ9WViS2r4Rt94RxWq7iJP9Zl5fQxZ2
	pNJZS+LArG1p9hg==
X-Received: by 2002:a05:620a:2845:b0:939:3a81:326 with SMTP id af79cd13be357-93e8f4e49admr163679085a.37.1791283601206;
        Tue, 06 Oct 2026 03:46:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2845:b0:939:3a81:326 with SMTP id af79cd13be357-93e8f4e49admr163675985a.37.1791283600689;
        Tue, 06 Oct 2026 03:46:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c69be6b12sm4139542f8f.45.2026.10.06.03.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:46:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 12:46:26 +0200
Subject: [PATCH net-next v5 2/3] net: stmmac: align real_num_tx_queues to
 mqprio configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-stmmac-mqprio-prio-offload-v5-2-d7da93419784@oss.qualcomm.com>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
In-Reply-To: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rGdrqrgrZe1FxuMZXyANUFkKF_qxTYCY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfXxgmZ7tF6LvFt
 rKxEss5IQKA/2vwn61ZX8xQuPebx8p7S/meTjC9HAF/xDBhMSxADesXnfUi8Zh5leFNKvD2V8ke
 ynsrAhmMw7Rp7LAtAOfYY1ogkmsWKoc=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4d192 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=EUmjA8OtTW9buVhb6SYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfX62xI8Y4+j75I
 AUVevIHG9w8+OEsiKPQPGTd5pgV4uuKlMDrB5MfpaPW2OGYIICdEuEtoEEO5lNKyfftO60f4vN1
 l9P4K2A4MbBCb+AbL76RX9LaezqkrSbsanADNOZjkv2NbbvS4CpSvgrKc96BjrEfS9oAscSVBgI
 DQrTf7ZKFmaVhmKsYhsRoIcEgaBAJSG4zz5u46wB5eU+Wh3QfcfbTDV+qKwdLiM6mWipu91Vh1A
 vTKpRjLRhJzkvs8JFqGxZQJByPOXDs3j1GyEPDpuiIzNqlNUmfrmrsPHgGf+ci5fPt88v3ROpeT
 dNx3QA4Uu0uSx9t/Ez4vohJlULky229SSy5ohIK3pnWKZ1zSqtH7QW4rJz06nT5iEvxWq/CL0BS
 t7KX5Mje/9dE2RX14BSazg23n3lSIVVNu49CCAxcC5SWmtzIwV1Ae8SqTMGsX+srj044S8E/IM/
 1h+AiLSP7578TUvhdzg==
X-Proofpoint-GUID: rGdrqrgrZe1FxuMZXyANUFkKF_qxTYCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034642_850176_BC0F92D9 
X-CRM114-Status: GOOD (  27.33  )
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

mqprio only validates the requested queue ranges against
dev->real_num_tx_queues, which can be larger than plat->tx_queues_to_use
while the interface has not been opened yet. Reject a qopt whose highest
referenced queue (offset + count) exceeds plat->tx_queues_to_use, so
xmit_qdisc.num_tx_queues can never be larger than the number of TX queues
the driver provisions. Otherwise stmmac_hw_setup() would expose TX queues
without an allocated DMA ring.

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
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 13 +++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

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
index 0c381ae0d0ff..9c03d21ebfcc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3780,7 +3780,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Configure real RX and TX queues */
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
-	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
+	netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);
 
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
@@ -7707,6 +7707,10 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
 
+	if (priv->xmit_qdisc.enabled &&
+	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
+		return -EINVAL;
+
 	if (netif_running(dev))
 		stmmac_release(dev);
 
@@ -7714,6 +7718,9 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 
 	priv->plat->rx_queues_to_use = rx_cnt;
 	priv->plat->tx_queues_to_use = tx_cnt;
+	if (!priv->xmit_qdisc.enabled)
+		priv->xmit_qdisc.num_tx_queues = tx_cnt;
+
 	if (!netif_is_rxfh_configured(dev))
 		for (i = 0; i < ARRAY_SIZE(priv->rss.table); i++)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
@@ -8025,6 +8032,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
+	/* Default qdisc num_tx_queues */
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
+
 	ret = stmmac_tc_init(priv, priv);
 	if (!ret) {
 		ndev->hw_features |= NETIF_F_HW_TC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 1aa80d51ab33..a7721b2eee96 100644
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
 
@@ -1299,6 +1302,13 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 		ndev_prio_tc_map[i] = READ_ONCE(ndev->prio_tc_map[i]);
 
 	for (i = 0; i < qopt->num_tc; i++) {
+		if (qopt->offset[i] + qopt->count[i] >
+		    priv->plat->tx_queues_to_use) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Queues exceed hw TX queues");
+			return -EINVAL;
+		}
+
 		tc_to_txq[i] = (struct netdev_tc_txq) {
 			.count = qopt->count[i],
 			.offset = qopt->offset[i],
@@ -1321,6 +1331,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_num_tx_queues;
 
+	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
+	priv->xmit_qdisc.enabled = true;
+
 	return 0;
 
 error_reset_num_tx_queues:

-- 
2.55.0


