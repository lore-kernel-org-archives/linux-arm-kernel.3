Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41333C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtMn0vuZ1S6fAeVGasp6DFeMidREg8EdpU12F4TnYNk=; b=c4QAdhMnFtB9//54ljxpSjpQ+/
	f7BrkQ3D+aF+bghHilkgkk6KUPaInKYzU3VmXVSlE77u6E2KXMz+85+sQBeFC++RrlQMfIgcdQZH4
	HmRYHIqtI45o8RlarNjF0sk4OByvAG+F0saYW35o42ufltxXA4BGo1/Vd3uMvw13X9tOVCVZaCqMn
	M/f8glLxP50WuEZqD7aRlNCZUSlD+QTlvphoqpOCnjULt+86mGljn8OmGsxsJBL4bPdPk5bkHQQcs
	fFCtRKxiFZcl9R7eWzCI8cA5/9/8VmOkt5JqVjWCXFJzidXwTGYOppX2L8WimEZGVkiYqFdu4j75K
	zgsZJk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOc-0000000FqRH-0ZnW;
	Wed, 02 Sep 2026 20:17:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOZ-0000000FqP5-1EIm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHIV92417909
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtMn0vuZ1S6fAeVGasp6DFeMidREg8EdpU12F4TnYNk=; b=Tg1l795eo2aALyo4
	SVpxxhv2JL+3yDCzn1mmt2lEk1/Y9nt22uT+/ZYeSdHrVNLeuk1Sn43N5pMWefk5
	htHIUi31zQtAuZ04Dlcjy55hmfA/8fWYFQCONOlEOjuwY/DAXtPypeht0d+kZheC
	ZdPHbqDYVr1LhyN4DRUZjrX6hT9FpgNedxuwmuKfgcvHrtE+ZAvks6nbU4DiT9I5
	wElkGAvxcpSCpO1HuvmuvyJiZgnOQUeAH3/c0F9BHDFC2cYEKiIVq4o7ZWfr3UIv
	iab0KClEsPtZc6E+7L0MNRACfFYqM50gHjwBzc3f4L9wlBM2iuiUV3f8W+1Xg/iP
	2eZYLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsem3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so307226185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380237; x=1788985037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtMn0vuZ1S6fAeVGasp6DFeMidREg8EdpU12F4TnYNk=;
        b=VpHE9fpk/eKsmJpk/mdIKIQHnJL3PNmkK1W5M3/T+urKgznqBAXneo9aP0zk+IuF6l
         oGb118P4t+aVNw/v0WME7IrarVHsGVeGn7TPU1wdeb2LKVKSKfnggCH65wXH3SYBt8tV
         yXEOWgy3ydUdmVAQCJA8gnAtD9yGXeIzCEFUyJYgVJ88zhp2K9um8g1dYlHNi9aq3BwH
         SP9WyRcMU6Gs8g4W9xgn8g2L7PSG5Sukgk3UTW88ZhZKDpQQXFfGwFNri0LQMY+B2wgC
         XQ5m1EX5xObZoXBPDLJ9hLM9N0INSSBOvXhaw7IIcy1RBvlvOvaP4AuBN87lDZzbOfub
         dKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380237; x=1788985037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtMn0vuZ1S6fAeVGasp6DFeMidREg8EdpU12F4TnYNk=;
        b=XhcNKGeGC0RyFUoln87/BqF/1pzNzwiSYwokcZEAXXlTEq1lcPTcFRPRrZWcYfEl6q
         gRMVhI9OCZOcxR+0s03yL5KIOa3SUn06SKOxVWB4kuGuKrfjYMj5LzcjdTUug8PQvLIr
         kOizKJ+B1anipzSkRyCZ9AXFbwhCpRGJwua59EhQF9/jgfH5+fEU6kYOJDAQyp8nZYYH
         gGbyaNqCzW8SIKCDwfK25Lt+0UltHP5pTkdEkvCeSKvnqP1RrazNIrPFHEuslTSh4hl6
         TXt6td17YftWju7DiD0e0HJ4f+p5nLi5BVE7NYWE0KjJpvPXXK4KvGlArz5N9dGsfgUB
         3/xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHvQst12VAn5SP0yGjQlqiV1PcyFAZ43pX0AnzfC2s0VC7pEuWWGZOAPmEcoqeLE/Ndsq/SFVZGUXY5sPOm7eG@lists.infradead.org
X-Gm-Message-State: AFuF++n/RDpseuWFyeK6cE+PuN8bzN25q1igjOz/bzQaH8qqwsHSyQvG
	ITNrz7B+xmld+J6s3vZW7frsBLiEsAiiAk0kl3BV2k7gr1B9HWZlF6mglA4eoYff6PUPzc3WxUp
	fvfGha8Yk1LzRbC3qxM5JO7xF3QEvhpvz+lc938SpPTPHg4t0XHaHbFT11+eprzA1pxhwq7wFV2
	m/yg==
X-Gm-Gg: AYBFou2m3WMObZ/Q7zkiASf/yO0It9F32gtZy9gVugJO31tDUvA0vOq2sx4Q1mGBSa5
	mMLcP+QvcI/8JM6pVr8Nwti/TfsCX1A587odWTpCd1lM7ms8Vl65Fn6okPnv9uLAeKLxtWaYjtr
	h0NDsYDtQdeL3TwJTZ1a5O4eMZs1hCfibwvV453sv5vB/dXtLU52etoQRSu6FhXlJaKkVIIHt53
	FjtE5CnAeleFpFD6SLhshm/XN+skJvGo9b95m4cHIwhTiyNtq/6vmz2dTg5/0e5kLwiveHXyvOo
	fV46+7BnjuOdzzPlGPlKaCzBpu4BvPcIT/3YBx5532Gb3erCuCJa/vNLPqdqVZNSGKvxHNccqvB
	Im7arHYz9K6miTQ==
X-Received: by 2002:a05:620a:a188:20b0:939:5421:3467 with SMTP id af79cd13be357-93960e1950emr743487885a.12.1788380237275;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a188:20b0:939:5421:3467 with SMTP id af79cd13be357-93960e1950emr743483985a.12.1788380236802;
        Wed, 02 Sep 2026 13:17:16 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce592b018sm15234935e9.2.2026.09.02.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:15 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 22:15:41 +0200
Subject: [PATCH net v3 1/4] net: stmmac: propagate PTP init failures in
 stmmac_setup_ptp()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-stmmac-est-reapply-after-open-v3-1-e72a6df5a7ef@oss.qualcomm.com>
References: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
In-Reply-To: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a98844d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g2_bYGZ4nwCPDnqYkxMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fw25FD26GYGu2AD4PCFeDrx2VUejNAwB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXwpfUug/LStzz
 Zv3MljLMNm6+P5Fu+qhLBlkdrEeYjVt9X9AW9ZOo95Q2q0gqvJTg0oh7+P76eiEgHsqqdhOJaw7
 0l6xxW66pR4k1WRjfNbJE1yOggWkKoFhMO4Xr3XqtVRkTY7u4cA64G4blJ5fsdrMo+mYlNcdGK6
 MWgOjxY8MTAqltIM5ueSPYMDB/c3lfjQ1Yj8Wuss+rijBJ3vEarbU3gl0cL7yw/4HlOmmjck2aU
 8wPpdrJyKC19TVPEe32bYUZsLfKUMnc41m/9G8t/lzvzLkpaTWAB310E8P+2fM33hxse1l9/CRy
 Eicps1A+3/0+iae+92rQASAFNQE6SD6QhNGbC8A6c8yRSad5w/UKjZoRF6ky66N0h4jtJQxk1Tb
 3kjSSF1plmZXADXgXTs+/rypS5NTmvgYdG27ejXwvyLL2qpGoJOCQaAKoPUw33zReXhlreU2nxe
 ll1M6w4kczzuZa9yYcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX0SQCOm2Y1IdA
 RoMwxFY5uHuYNUefl/LDHXKaEwWkSXoQKLKKNMzTD84lH/nVMvyf0drLhVjb9jmaaPu7DqgKEjM
 jkHRWKXMSvy+CjxnglDFYYxn5vjEOBs=
X-Proofpoint-ORIG-GUID: fw25FD26GYGu2AD4PCFeDrx2VUejNAwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131719_459966_ED27D16D 
X-CRM114-Status: GOOD (  20.15  )
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

stmmac_setup_ptp() returns void and swallows both PTP setup errors:
the PTP reference clock enable and stmmac_init_timestamping()
failures are logged but never propagated. When they fail, the MAC
system time counter is left in its post-reset, non-running state,
while the driver keeps operating as if timestamping were up.
This matters for the upcoming taprio offload re-apply, which derives
the EST base time from the hardware timestamp counter: arming the
gate list against a non-advancing time base would leave the schedule
permanently stuck. Make stmmac_setup_ptp() return an error code.

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Fixes: 0ad2be79f254 ("net: stmmac: Balance PTP reference clock enable/disable")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 46 ++++++++++++++++-------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d576059c04df..47295845371a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -937,18 +937,27 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	return 0;
 }
 
-static void stmmac_setup_ptp(struct stmmac_priv *priv)
+static int stmmac_setup_ptp(struct stmmac_priv *priv)
 {
 	int ret;
 
 	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-	if (ret < 0)
+	if (ret < 0) {
 		netdev_warn(priv->dev,
 			    "failed to enable PTP reference clock: %pe\n",
 			    ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = stmmac_init_timestamping(priv);
+	if (ret) {
+		clk_disable_unprepare(priv->plat->clk_ptp_ref);
+		return ret;
+	}
+
+	stmmac_ptp_register(priv);
 
-	if (stmmac_init_timestamping(priv) == 0)
-		stmmac_ptp_register(priv);
+	return 0;
 }
 
 static void stmmac_release_ptp(struct stmmac_priv *priv)
@@ -4153,10 +4162,12 @@ static int __stmmac_open(struct net_device *dev,
 	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		goto init_error;
+		return ret;
 	}
 
-	stmmac_setup_ptp(priv);
+	ret = stmmac_setup_ptp(priv);
+	if (ret)
+		goto ptp_error;
 
 	stmmac_init_coalesce(priv);
 
@@ -4179,9 +4190,10 @@ static int __stmmac_open(struct net_device *dev,
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
-
 	stmmac_release_ptp(priv);
-init_error:
+ptp_error:
+	stmmac_stop_all_dma(priv);
+
 	return ret;
 }
 
@@ -8318,13 +8330,12 @@ int stmmac_resume(struct device *dev)
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		stmmac_legacy_serdes_power_down(priv);
-		mutex_unlock(&priv->lock);
-		rtnl_unlock();
-		return ret;
+		goto error_unlock;
 	}
 
-	stmmac_init_timestamping(priv);
+	ret = stmmac_init_timestamping(priv);
+	if (ret)
+		goto error_stop_dma;
 
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
@@ -8348,6 +8359,15 @@ int stmmac_resume(struct device *dev)
 	netif_device_attach(ndev);
 
 	return 0;
+
+error_stop_dma:
+	stmmac_stop_all_dma(priv);
+error_unlock:
+	stmmac_legacy_serdes_power_down(priv);
+	mutex_unlock(&priv->lock);
+	rtnl_unlock();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 

-- 
2.55.0


