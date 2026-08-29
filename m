Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24612C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKn8lekjkFoQYC6eM+ArO7Rdiu2dZ1XkkIrsn13g+Yc=; b=c55RX7yS9F3qiETMIifB+tW8tL
	j550wLISVlmNZTrUi0N24RTDwv9SPYH+SHlvdNigs7cNRWrdTYSV0R+gWRE5co2vkziVuqhfIbR29
	ut3IzEvcIo1w+NoOdM+sjWhZuKlBVe/39edigGUmxO4Dap6TY0j5iSVFWyqCLWprDU3NkCBoTvrjO
	8nxmkOwSZPEgko8S38HZb03LhhzGPldmHPXv3u2xwK/3fFHWH6qfg/H6iKn38LF9b/c71tgiO3+G3
	l+lnr0xjqNbvUxljBaUivHo83FELcbxGUUEa39WOrBSdStHBqgYLgkhsrdZ0XeWO1K7k1mzaCKuqD
	vfdwp5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ERM-00000006rID-0anE;
	Sat, 29 Aug 2026 08:29:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ERJ-00000006rH9-056F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 08:29:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T8020L647625
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKn8lekjkFoQYC6eM+ArO7Rdiu2dZ1XkkIrsn13g+Yc=; b=cJKBSSSoupBmZTTP
	T/dTW7GGPzY3YpdwrZQJwEKYl05vFjdYOjrRErAisvoVkfx2pSypT9ySWKmbgk0c
	msp6sDG3C0ubEIg7WI0P9WDQMX+LIpiz7zML6HaQrRfw6xBDLv4b69RkCoTwwSpr
	HoweePevxdxn50qlPJ8O/lQ47Bygjvi2LdSR6X2fe4UdcGvXN5XRGuo1va4Of30y
	dvW8MXn7tNMXsCSe9gvQYW8tbTlLgvZSpO7WihBsP+/laT827SnLASq4JhqibO6/
	/n16/yY6eKVrBgkz0TCevRvQEuTaj6KTX7xi+fZiNBqNQFLLXdkwg3OxudjFB/2y
	engASQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq80chn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:29:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52e7a49452aso25188661cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787992163; x=1788596963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKn8lekjkFoQYC6eM+ArO7Rdiu2dZ1XkkIrsn13g+Yc=;
        b=AE6MVciua4uY/hIRbLp6cxZwt1zSxqzbmeGak7hMGQ0J6FtAhcpZ0FOS97C7jD2cKe
         Vpn17E3SKccU8qUQthszFFxiVPyBCsjVCZZiHuFSZao1fd4mVjKcREnbMvA7EBLxxhHX
         JBWhts6H4G1CilU9807d7DMCZk8NE0pluzeZjCAtZINsDT9O3quzMIlqjf+yXsBdKZJ5
         axxJQ2C8I2Xl+0cdDPZUMxaqd7HVR/J1yxogo5PKypuGl9hqRN9Dx9FJ6hKQnetaU+21
         pKjSpbBsviL+YNnMHUPQNhIjVvHkLLf4sKClhpazu9SigZubVHSpiqREoJBIqtSTd2Zj
         1vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787992163; x=1788596963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKn8lekjkFoQYC6eM+ArO7Rdiu2dZ1XkkIrsn13g+Yc=;
        b=Zi7hUePCXoD6AnIdqb4TrXY1p40hxI5jKdNO/Hj5r4ZF7hHg5Z3BAngHGwwIA380+P
         Fsk0z5oO5pHC0LtnHwIBbx2+zYL8oJVA/2xzjBIvFYL/wDh7EbSy5/EBCfizf2i1HzM/
         uEMAemuV4jWig7hyzSZfX0NwoNsfHf2wSt9KinJ43Kg0daxRDBiPjWNtFs85+l7K2Etd
         kz/7egZ1G/QpMyLteWfC2Of9Q6qhyutXXrQPAiPbphNNPHNofITVwuZkyjZfLEEQVp+e
         dP1G5Si0N+v1E7nmdultl3n9hbUk7W+n6W/4dRy4/aEz4/gy4DaVJNEG0WyNEnt+CXeF
         jW9A==
X-Forwarded-Encrypted: i=1; AHgh+RoXKowfxmHbSBKWkacVa5Pqhv5bCE658enlPQMzFNNpLXPvgM/IUTod6tcaJWcgilt7ZIvqRdtv84A40wU1a0ls@lists.infradead.org
X-Gm-Message-State: AFuF++l92i0QTS922NUcjvYd14A/eAM2jwK8NAf5mp4GPY48loneTN9c
	BYgEUJ2ZgzlmAg1joQrLzSvx+4/9ZtnRWbAmtko16LABBVA3OPB4nj7xI6QPxtBQQJLH4XhTEpx
	8tZD0flel5agT4LtQGzh0bfpmEpQ0CeZrgMqOKtmjPgR8KMdD2URSxKxVCLRSkHb9e7dJMSfs3h
	UiMQ==
X-Gm-Gg: AR+sD10KZQDsWRkXHXm0v/aQeBprMuy00JXZVWjZHyWYhi78QwaR8qnkRZGjudzsgY8
	tjiiLlp0Py4up0+Y8tsNOsM/dLfq7sxsZbpJ58ZjdBeTW2sgdi7UpfLRpjeuG1XNIogBSosmXi/
	XAL9ZwnQsbOx3rNbMArs2L49oxHK2M7nt4D2P26hOhVSFIfJSV9Jew93uM1WiRXvTcYlAJyJIEK
	lwBo/7J9b7VzwKRHh5vuyYUuykEoWIX54hSfzCEQKSh/OswyYQ5rVQI1+UQdLt4nBVAPFhx6VOf
	Kn64AVX5HTHVYqQyMqx5DBqO6ySxHKXmieQety2i5ThOV0femLmpZ4wk/sU3wj0MT4MbP+O7tX+
	sWfhFeSkCg4craw==
X-Received: by 2002:a05:622a:1308:b0:52d:844c:b0c2 with SMTP id d75a77b69052e-52fb9429883mr141022351cf.12.1787992163562;
        Sat, 29 Aug 2026 01:29:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1308:b0:52d:844c:b0c2 with SMTP id d75a77b69052e-52fb9429883mr141021991cf.12.1787992163169;
        Sat, 29 Aug 2026 01:29:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm8640067f8f.17.2026.08.29.01.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 01:29:22 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 10:28:50 +0200
Subject: [PATCH net 2/2] net: stmmac: preserve FPE preemption class across
 qdisc replacement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-stmmac-fix-graft-overwrite-v1-2-a4f84c4c264e@oss.qualcomm.com>
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
X-Proofpoint-GUID: VyXq6o7b-pXZZ9KWOpuSzXt5QqagRAsZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA3MiBTYWx0ZWRfX81mRSQP6BZGr
 oj+rIUJHmk9loEnt45GmPBw1FA4rANJ+HTgPMEDZJ9nCfToiKqjUCmX0h6vx+KXWuM0trqd+MxM
 xLTKtlu1CvY9V8c19mDN09dxk2Eolgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA3MiBTYWx0ZWRfX8WVDW+7Uynxo
 INEuZ3MQDDQ3Zn6tJpYO35BwKaOU6WjKoL8ub9S60Pj202WoZ83hHzIdHIf9dFL/UekVXPjr0Cx
 pCGlfGatc8qjQ3l5oSsCXyu7BN1VaDnmHFKiTShOZ9w0JCKaWrVdITEUYXpNiCJ03Fi0hAegvaO
 QDbMA0NeogJxOyWGQKZwSUFLu6b+ztjrWW4MdgmzZi6rKGI0fK3FTuHC4elTjhCuvDfwfUQAeuL
 tRvpe8Q3WL0BoKt4LctERwUW+HyP8yjXAuNSyqVqqtQz4DlIIrARt2ensIZjB1VLnmDFLkAp2r3
 MMDPvb+qs8mjiYYJ5VbirpW0Foej3ruPuSw2+C4vbJTmc0k1eLGfw68NaXOhBEoCSn2Ysvp8zts
 aBxHDklAbW9LsCrHJyecaUc6NOK2DdHi9OmsaWIe84lIckk4wnUQpc9ycuVLCepC/sliLvpDFop
 4Jv3rpIaYK0hniubCvg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a929864 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Z2yARmqO49GXmbJYkD0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VyXq6o7b-pXZZ9KWOpuSzXt5QqagRAsZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_012925_071645_7E99E362 
X-CRM114-Status: GOOD (  18.65  )
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

The kernel replaces a root qdisc by creating the new qdisc first and
destroying the old one only afterwards (qdisc_create() then
qdisc_graft() -> notify_and_destroy()). For a cross-kind replace this
means the teardown of the old qdisc runs after the offload of the new
one.

This breaks the FPE preemption-class mapping when replacing between
qdiscs that both program it. For example replacing taprio with mqprio:

  1. the mqprio offload (REPLACE) programs FPE_MTL_PREEMPTION_CLASS
     with mqprio->preemptible_tcs
  2. the old taprio is then torn down; tc_taprio_configure() runs the
     TAPRIO_CMD_DESTROY path and resets the preemption class to 0

Track which root qdisc policy is currently offloaded in a new
priv->qdisc_type field and only clear the FPE preemption class during
teardown if the qdisc being destroyed actually owns it.

Fixes: 15d8a407a547 ("net: stmmac: support fp parameter of tc-taprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h    |  7 +++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 22 ++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..957317ec1461 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -258,6 +258,12 @@ struct stmmac_msi {
 	char int_name_tx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 18];
 };
 
+enum stmmac_qdisc_type {
+	STMMAC_QDISC_NONE = 0,
+	STMMAC_QDISC_MQPRIO,
+	STMMAC_QDISC_TAPRIO,
+};
+
 struct stmmac_priv {
 	/* Frequently used values are kept adjacent for cache effect */
 	u32 tx_coal_frames[MTL_MAX_TX_QUEUES];
@@ -299,6 +305,7 @@ struct stmmac_priv {
 	/* Protect est parameters */
 	struct mutex est_lock;
 	struct stmmac_est *est;
+	enum stmmac_qdisc_type qdisc_type;
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index be8ddda2aa76..7fe587b47d52 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1103,6 +1103,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (ret)
 		goto disable;
 
+	priv->qdisc_type = STMMAC_QDISC_TAPRIO;
+
 	return 0;
 
 disable:
@@ -1120,7 +1122,11 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+	if (priv->qdisc_type == STMMAC_QDISC_TAPRIO &&
+	    qopt->cmd == TAPRIO_CMD_DESTROY) {
+		stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+		priv->qdisc_type = STMMAC_QDISC_NONE;
+	}
 
 	return ret;
 }
@@ -1266,9 +1272,15 @@ static void stmmac_reset_tc_mqprio(struct net_device *ndev,
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	netdev_reset_tc(ndev);
-	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
-	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
+	if (priv->qdisc_type != STMMAC_QDISC_TAPRIO)
+		stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
+
+	if (priv->qdisc_type == STMMAC_QDISC_MQPRIO) {
+		netdev_reset_tc(ndev);
+		netif_set_real_num_tx_queues(ndev,
+					     priv->plat->tx_queues_to_use);
+		priv->qdisc_type = STMMAC_QDISC_NONE;
+	}
 }
 
 static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
@@ -1318,6 +1330,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto error_reset_num_tx_queues;
 
+	priv->qdisc_type = STMMAC_QDISC_MQPRIO;
+
 	return 0;
 
 error_reset_num_tx_queues:

-- 
2.55.0


