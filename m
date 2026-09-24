Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79CEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGtt6oOPDflvCVTF/PzLEyT3/NUsOJSkR4n7ZpTv6F4=; b=qyoLqLaxuBbvOwFoS63jhQC95j
	n/WE/nIgViGvXA2QLGZoYc7DzBR/fY0VyeZ64L5T4O1773eAGVeNZKqumRIWeg48+RAq7z6DPef6y
	GMs3VFBoJic3Ld9POTs/+J0EOhZ/SUTfIdFRp4NET/5AbgMnylxF5JRdkkMaZW1ynYE1GxOjPINUC
	6X9WFeMcoUzod4OAeTXolh0O8ilCUeN5LDQrldKrzl7X2UBObJlDDIsCmEY+d8N1VZEK38DxmP/zF
	cUcw/9QtnHQxbIT2XcOqmvxAocpGGbjLsgRACIebGU11jpQKPZ5GK44b7t5RzxE5zon8zu2I/7A0A
	t+Ad6RhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gzO-0000000AmOP-0DmF;
	Thu, 24 Sep 2026 10:47:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gz8-0000000AmJU-2Lvn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:47:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PMQq2919243
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGtt6oOPDflvCVTF/PzLEyT3/NUsOJSkR4n7ZpTv6F4=; b=ph3BuZ4UY3g4iV7W
	tCphTQ2JdfUJOe3gQLxweOpyEcJD+M64dfqSjIQA1II8okUvKUSs/hp0gTLKC5kF
	jumZNvKSKQxX9pfsSaCzM0FUtQZuXwj2E64LScFdWthhVIS0HiPOwDRb+VTw3TQu
	2PylJGUHskxw+DiHd6WGkh3nRZWvGWaPlasZzY4jxfGvNgD5Dm1J+t+Neto1t1Be
	4KhqgGBmT6jUN4hpjNoaSkFmdGTc62AQCuRtyFvwFI4RSTqL0nCllXAPVWswZY7Q
	DqxCY8VQC7odDeD3/0jPjmKkg6sVyPp/PwQ9T0cOzpgJkLuM7O9Z/VQfpvWhDphl
	3lOLuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj57n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:47:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so389453985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246845; x=1790851645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGtt6oOPDflvCVTF/PzLEyT3/NUsOJSkR4n7ZpTv6F4=;
        b=V+DLIw7GH7v/Qz4yNHKeShMd9DGil6KD4R26tp27gxUAk834nnq41ra1LfQ+qlkF2x
         9O2cRaztQm79fQo0VtMDl7pYkvJ1KK7QQE0hLeHWSq4YgeyZAWE0wsYlEBhTVFNNXZ3e
         CdB6RKRc1ZRuI9fi9vTA5leu7dInNEk2qpmg48YhR6RpWQuQNW0q/j2xzwpZlgoePIc2
         S/AwXoMIt1iOiXZdYrnq1PPNoOY0urqtu9M5UwkwtgUnao8OXt15/XviQPXRXaWRI5Vx
         FhaDQ7U/uaI8HRg15XklHhs6zk209KDqzteQpYppE3FhfJtsYS8iIT4amd9qPE+qfEjH
         zezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246845; x=1790851645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGtt6oOPDflvCVTF/PzLEyT3/NUsOJSkR4n7ZpTv6F4=;
        b=mvYpG6jAOK5IcNh6cRIiltBQitvZXUDFN7SLy3ueTcL0cY5nDkG9ssHrhmrNiFzbol
         WSayDEtnIYoTLPytPVS+PjBbdvCd/FlkHTVIHgAtBWxc7FVA3pkp9MyRbLNS4YG3RZrO
         E3XedJw5ct2EYn9KpM2zTKACnvvKrY/45trJWeaeLL6IWVLJ/Ek5yS/Htdb9S8q9Sacx
         SYxilR/hE9XffAHFcND/3nrgsbMrZ7rSE9WiINMT2BmA9ZiXyKBC9ETHcoU6ESNCUplK
         zhS/QOgHxjd+IOjwKQBw1hlgcFjwF0tsB0K9ueeKLMajp1eCbQN+L/gIlDoVJQ8H4jNK
         RCUA==
X-Forwarded-Encrypted: i=1; AKwUvBwi3ih9pTuU7MQRIuZJqH/XPf5NFkpxOM06VZAgeAefQ96OpzY5i8qi8W8PPLZdWqrkCzz9sGLJB9sZD7kLPATv@lists.infradead.org
X-Gm-Message-State: AFuF++nSKzKNrQKfzXi+7t0apCSEaGqIM++C5KWK0/bugDB67NgHSy7d
	BO9+OX5WEnkYrj0m/9JYfGi0Mly7d5YLr2T84o6QpQv2AzcFJy+cfIjsiUZr9ERjwUD6+eXacF/
	w1zo4ffonsoCFFXjaecgPEMzSOmQ35qPCL+p9Xr0zFxUzFI3baAjX0sQnQ08hnpEAKeX/wnWZ/Q
	g9dw==
X-Gm-Gg: AYBFou3w7tDgLq2MU0T//dJe3ifE83LltmwcqVsRIt+5Lprv4hfaOpjIvEGwmae36E1
	pCYlqtCUPl6UpHuiL+c5ac/9tPJvOICC+W2h85Beenxq0xTJiiCE4Vc400ACshelzWZWQqiPClI
	PwokQEkowI0nZ5GOY3mnXSgNcXwM3/lwdRCmpnevgaujPyOj0oqGwO/gHVaiwQybJ6tr01u8mqc
	qI2PInIq0ZpFLf8gqYv+Vfwhl5GPFmUKrzzmeYjM+qG84JqFdin9O6YqCZL3nIR9ySQULZ6udl8
	dI1j0QsaiyOv5nR+jEkhO0jJs3pYzrEcy1wcM/MfJETPbQZ+mW2MoUePKnCPjXCYtFkyi1zaro4
	Hwcvt1KO+0pBMyw==
X-Received: by 2002:a05:620a:3912:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93c36442b35mr224255885a.51.1790246844741;
        Thu, 24 Sep 2026 03:47:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3912:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93c36442b35mr224251985a.51.1790246844171;
        Thu, 24 Sep 2026 03:47:24 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm63615395e9.8.2026.09.24.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:47:23 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 12:47:02 +0200
Subject: [PATCH net-next v2 2/2] net: stmmac: align real_num_tx_queues to
 mqprio configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-stmmac-mqprio-prio-offload-v2-2-fdd8b69efccf@oss.qualcomm.com>
References: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
In-Reply-To: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxiB1QvIa9ehn
 vWgZ5T4APg4sqk2cGtEEz2U+SyZnD0BseItD+AOxoKeHwwuzyiOGr17jfR2zeFAoEXeMwnvw51y
 ol5nSch5hKVqLchuKWeRSx6OxZQ/cds=
X-Proofpoint-ORIG-GUID: 5YhYuQfgwmE6WCvLUtgU-fM5trrwFyun
X-Proofpoint-GUID: 5YhYuQfgwmE6WCvLUtgU-fM5trrwFyun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/UlkTzkamcxI
 AgpsKnHiwPDPVYwU8rucfFwR8EJpkekTJapKudUPE31bUudsrqYZFVQNJWiTjmCGoHL+QHatVNi
 ElFzluXQee6/kX95lNT/AiEpmmv/O/9lHCs2T96CFUb+V8Ma//ge01yp71TMutQsFXB0Q3ni65g
 c4ll4LaJVQDvqbKi87OSIN3hd31i6DStwHPXDjGFqnLKc1VG1M4bGrMKZv6SycjUy18MysaueqQ
 UdWNXSiRIpLpjxXAHWyIEizbB9knRQV9rx/OaCmJKhFD5igPX0t4FeYqxEE/Dy+EnszJhcFRxtq
 7T2vjTs73u0LHxV0sfAWJYqEXBvA2tQNdtDc6xdJy3CtQHgclNQTx2b2tTilYSSIRUUKhhuBBdG
 XmuHwckyom6cCRHbRg1uog524vIKFLeCJfSnI2ygsvWa4+o9TZpoPu2rBWLZy3ciCzxK8oHJlAt
 Yrhkl/3zMhOaH2cJcQw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4ffbd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Td2Y5uhiG6mrzya5eswA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_034726_610042_39A0E02F 
X-CRM114-Status: GOOD (  23.06  )
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
the devicetree value while the netdev TC map is still the one programmed
by the qdisc, leaving the two inconsistent.

Store the number of TX queues enabled by the current qdisc configuration
in the per-qdisc state (priv->xmit_qdisc.num_tx_queues) and use it in
stmmac_hw_setup() in place of the devicetree value.

The field defaults to plat->tx_queues_to_use at probe time and is restored
to it when the mqprio qdisc is destroyed or its setup fails, so a device
without an active mqprio offload keeps the devicetree configured queue
count across reopens.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 69b400e9b138..a8f06192d696 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -302,6 +302,7 @@ struct stmmac_priv {
 
 	struct {
 		u32 prio[MTL_MAX_TX_QUEUES];
+		u32 num_tx_queues;
 		u8 algo;
 	} xmit_qdisc;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0c9083f8846e..ad6be5166b95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3772,7 +3772,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Configure real RX and TX queues */
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
-	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
+	netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);
 
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
@@ -7923,6 +7923,7 @@ static int __stmmac_dvr_probe(struct device *device,
 		priv->xmit_qdisc.prio[i] = priv->plat->tx_queues_cfg[i].prio;
 	}
 	priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
 
 	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN) {
 		ret = stmmac_msi_init(priv, res);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 54242461a860..1accc8e962d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1285,6 +1285,7 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
 				      priv->plat->tx_sched_algorithm);
 	priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
 
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
@@ -1427,6 +1428,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (mode == TC_MQPRIO_MODE_CHANNEL)
 		tc_mqprio_config_queue_prio(priv, qopt);
 
+	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
+
 	return 0;
 
 error_reset_num_tx_queues:

-- 
2.55.0


