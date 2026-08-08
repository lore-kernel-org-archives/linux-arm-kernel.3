Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4442FC5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0v8tuSKQe7B2ZFUqxN9wk4L1Itws0CWUrBu40hDizw=; b=onstvGw4AsQKh6V8u/qM8QWpDM
	sTEFcuH4dj1nD4TKgWaJ4NG9jV1ZOkQA09/nw47ucjaaV/YDfRTfNtgW79eREW/xAJ7fnHhlZvTRX
	QDhsum7SP0PWJfjMM+PVrYLSzAta2TauSIbBNsQB6J66kY/QoSt4mi7Wj2/mWsMOlCTWDwNwfcvQI
	B8gSfPqNARD+BAQYhdutzjcsVSVT5eBQ+SutRD0UIjR4vTl17Z5xZIBe47FBwyfMzm277cd6WM5eN
	6AIY7VVpPQcHfMs+ENWsCaFAdeNQ1wqvT0120OEhjqMIryg4BlXP6CAb177iIzqA2fcjQ5uoG5UbY
	5JJ4FHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNW-00000009Sw0-1XR3;
	Sat, 08 Aug 2026 14:50:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNT-00000009SuU-2bsK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 14:50:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678DcTef4149824
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Aug 2026 14:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0v8tuSKQe7B2ZFUqxN9wk4L1Itws0CWUrBu40hDizw=; b=OzbRFzjOzOMQlcuH
	YAQ8iMeLsmGxyB74W9Q6RUp7ZX/C2sKLECiEjOEh0Elr4XKCqJa4cCpyPJGnnNfc
	/jT4ozhoOUKCiwCdZ6ZmXksIX0I8IfGiyIj43yRzg/lgbR8WWiOYuUuvlkKQGISO
	KH7YbQTixQGElYB+Qi1dBQeh2x854UArux92kDCVbZUe4U47qS+olT1tbad7hN77
	OxBCysmPeK8O3Ck7A0MYtIQ/N2oxi3b3OG2M+GXRHmk/ZB9a/2rwIWQuf5JEZVP8
	/wwoDO3rOK4xkA/ASUhxOBq2yn34UBf/6kSeDy8VZBsdmjne9+/ySTRismy+0rIx
	xzh1mw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhv918w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 14:50:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso6998991cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786200622; x=1786805422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0v8tuSKQe7B2ZFUqxN9wk4L1Itws0CWUrBu40hDizw=;
        b=W6bJC9Rdc5vcs9qewQlbBqO+4jiCYYGX9Jiaqs8ZBZGKdUlkCU7dV5ZN5nu+XBB2Cb
         G9nkFFLMozltEO/1wRhPrSHajP601am/fifn/VAyvh/fkDQAOc7WxcjIXetetwM1PwIK
         ZylPYc/NZMzwnBYDg8X4G0eDKg7/G+HewOl0UVoZj5ONKnOCaym0Ar7L3ZiOMyjrmBBY
         jOO7JQBNvXmEA3tAzckTN9KyAdfe9vlH6NUP7fmjXlxYrDztOOLckaXjntMfRCobO3Mm
         zRo6186SAHXahHKk2YT++wi95aLXJECD9J8NlS8p93NmqnEfVHlo/o6Cz/gn/fNOOQXX
         0rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786200622; x=1786805422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0v8tuSKQe7B2ZFUqxN9wk4L1Itws0CWUrBu40hDizw=;
        b=jmgcP7VkO30Bfwdq8fPr/zD35xkLxJjQYpd9qR4KZWhl5t5uvxNpDNxzRqQ3x0UCp3
         drOmY8mYoRhorSTHGFSLnvZc3lPyCMMvKF31g6RPLrZFF4NIIck/i7TeRWW060/I0YCN
         umpS6WhaXCn9c/pYK3nxPxIoBviuJzE51jOXmC2WO3lh4ZydL8+gn+FjwGr4oajDEDwN
         SMkFC/0/p6T03ln4MGfyPCn9CC4beSdS/6qth2GB4qECqRzW5uWgV7WYuXulevRm6zFk
         Lnjo/yu4DF3ZtpN6deLh+TvP+RxyfTO2a+k7aFaRR8MgDzPqf/XRwaHeEcIEaiJXRcw+
         Z7qw==
X-Forwarded-Encrypted: i=1; AHgh+RpgEvZTc4YCH6LtyajBirjEzzq3ZdI6NhXNtmhiBhpdpF36bAEzzd2Q8VBLFYGNFQfHQ8wEAuDf30IIoZ8RKO8j@lists.infradead.org
X-Gm-Message-State: AOJu0YzalZRN5Ey++xWm5b6+4EV59+dYVlolkxWQBmr8rXGjRFyTQVVI
	pK7zSOO4fdUbnxDTKbX9iNnbXGSMdcr3XQOUNxPR6akkFCKoAgWEVgEuWTuE0EIlI5FTijyryog
	GJid+kriVwXgEJhxFHmlfwma2LrJu16SMAApG8ZDduG3NfSVfBmDIyohJIgC2GXuax+ykKrcVwJ
	8ybQ==
X-Gm-Gg: AR+sD119sDNstL+t429Yc4m6sYe5i6HN6UIYVH+Kb7WzghFbaUzxmVVFIVgaFPPjA5R
	0VioNANVh/mEzlLEVLy/jZI3yvBaIHScz9V356+SA8nME7RBz84wKRpoVx78/s7S3HbAfK2lnWt
	Z1e0Z5V411la77GyDwR2/aprGIkz9rv8a0IlyJEeQEqK98GNEwaGplKjVFCtcz6/GRVtU2VcJvw
	EXtjJR/xoDVyCrWIQZdNKDZOte5qCZvy1PjqwBWhNdFeohne9XmF3eX6ZwQ+Jj/HgIP9M4oDlUm
	h/kun8i4Q21tIbTqSvys3Pde63qj/EP4HR3bRP5Yj15oZBkYMQdbHW/DpVlB0lp9A27ap/3dJgm
	QHPdMKxmy5vv24Y4=
X-Received: by 2002:a05:622a:4016:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d1919afcdmr128838671cf.38.1786200621498;
        Sat, 08 Aug 2026 07:50:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4016:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d1919afcdmr128838241cf.38.1786200621074;
        Sat, 08 Aug 2026 07:50:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145679sm14986482f8f.3.2026.08.08.07.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:50:20 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 08 Aug 2026 16:49:59 +0200
Subject: [PATCH net-next v3 3/3] net: stmmac: hold runtime PM reference in
 setup_tc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-stmmac-ets-offload-v3-3-b714466142b9@oss.qualcomm.com>
References: <20260808-stmmac-ets-offload-v3-0-b714466142b9@oss.qualcomm.com>
In-Reply-To: <20260808-stmmac-ets-offload-v3-0-b714466142b9@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
        Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a77422e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jmEaOccbwSVQIUL4fOcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5J-O-zQHLsRm-OhCY5mPEr3cLQANdcD8
X-Proofpoint-GUID: 5J-O-zQHLsRm-OhCY5mPEr3cLQANdcD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfX0Me5EXP2IzW9
 L9MBEdE7NUXA234fJP13cI6+M42YRmgRJPQe7naUYeUhibIW5ZbqywVDJ6chFqEDTi8PRMVv+vx
 lYRxyYwQSMiyUKty9mq/Pw8JZxmTFRcv9IMRHLvSsQk6El/7MPcKF0rHpKgHfzprtIT2v8NGV+Y
 m8lh3GtnZ45lua8PUM8BEh+1AqJSfE7/HZDbKhBkhs/Bc+yWh0nh8wUpk1NuN4/HcqOwdMZp1wY
 Did22zgXFQ0h67tEPwVxihHCSlzHbFU79rwAF5pq/2m5AW+K5mw/AE9ZQhoD0MzIQ0767urrW1U
 WibrPXsXS5D3MpcO/XYHyYCxFuZGTcJVOVR9isVhjfGtyb/q3arvyhLL1UagiLd0tiL1DztcQz4
 f1rIBmZiCJn0oIXXYbDoBEtyehFGgqxe3vATaK04PLIuUjcVnmvfUqvrlyFXcQRsK5yUFXAUHA4
 rUuR3jxmDcXLFgLrdnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfX0AOLB826jzB2
 Aq+c7L70idYwk3knHpoqvKlADvb/ypMvBxs4xrvom9jSpJdhAEEpPgxMjCaPrzUYPV9cNy5/49s
 4xB/g9zYhjxPOBAVBUUEKsFlkSs/zeg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_075023_781475_07FA0B22 
X-CRM114-Status: GOOD (  17.18  )
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

The qdisc offload callbacks invoked by stmmac_setup_tc() program
MTL/MAC registers, but they can be reached while the interface is down,
when stmmac_release() has dropped the runtime PM usage counter and the
device may be suspended with its clocks gated. Accessing the registers
in that state can trigger a bus error.

Hold a runtime PM reference for the whole setup_tc() call so the device
is active, and its clocks enabled, whenever a qdisc offload is
configured or torn down. This covers all qdisc offloads, including the
pre-existing CBS/TAPRIO paths that had the same issue.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 39 ++++++++++++++++-------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e19f75d8c393..5aee03ebe131 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6443,28 +6443,45 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 			   void *type_data)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
+		return ret;
 
 	switch (type) {
 	case TC_QUERY_CAPS:
-		return stmmac_tc_query_caps(priv, priv, type_data);
+		ret = stmmac_tc_query_caps(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_MQPRIO:
-		return stmmac_tc_setup_mqprio(priv, priv, type_data);
+		ret = stmmac_tc_setup_mqprio(priv, priv, type_data);
+		break;
 	case TC_SETUP_BLOCK:
-		return flow_block_cb_setup_simple(type_data,
-						  &stmmac_block_cb_list,
-						  stmmac_setup_tc_block_cb,
-						  priv, priv, true);
+		ret = flow_block_cb_setup_simple(type_data,
+						 &stmmac_block_cb_list,
+						 stmmac_setup_tc_block_cb,
+						 priv, priv, true);
+		break;
 	case TC_SETUP_QDISC_CBS:
-		return stmmac_tc_setup_cbs(priv, priv, type_data);
+		ret = stmmac_tc_setup_cbs(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_TAPRIO:
-		return stmmac_tc_setup_taprio(priv, priv, type_data);
+		ret = stmmac_tc_setup_taprio(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_ETF:
-		return stmmac_tc_setup_etf(priv, priv, type_data);
+		ret = stmmac_tc_setup_etf(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_ETS:
-		return stmmac_tc_setup_ets(priv, priv, type_data);
+		ret = stmmac_tc_setup_ets(priv, priv, type_data);
+		break;
 	default:
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		break;
 	}
+
+	pm_runtime_put(priv->device);
+
+	return ret;
 }
 
 static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,

-- 
2.55.0


