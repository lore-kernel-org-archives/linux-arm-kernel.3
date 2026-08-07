Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217A5C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX2RD23vRIQz/ABHyG7ytkQUqMnN8cwrWXqqSeRQ5do=; b=0IsAfHBN0gGeHyqyCw69xq8zNZ
	pbDHMeoXDJK7uB65UAIOxlP1qgjJ73UJ7xCStQ18/TTNubVcu2MhfEitdFAyNPHI+c0fXbFkfjnzi
	Z4BCjvYOx6NaIioRL5PnW2gnU/K/YFoE8Mdsvjgunozrp2AIc0t/lj6IXXoRzC5VNWVXAonV9Pvay
	VgxbawE7gPuwq+9h3RzeLwSbCYmwx+0AW7h94qmn0O4RDRTCQssYW4MHA2L8eHSh9pSJVLL09L9ou
	Q9flpb8wk6VutqSQFMuRK7t0GFAFNx/gd6Pluol5hP/L7ba57R2eCB0be6mj65MUWWi+fPDgFTZMh
	QOo2h4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG9l-00000007S4Y-2IBz;
	Fri, 07 Aug 2026 08:42:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG9j-00000007S4E-3ORV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zX2RD23vRIQz/ABHyG7ytkQUqMnN8cwrWXqqSeRQ5do=; b=gfC1PSS5dQRk0ZmOWq5Zc4FP+Y
	rWer8LkQkhFK9xtpSOsaLhJd4I26KH/lmwZOkxLhfhfNXzgpi8JZCP1y1kq08QDFe7SBe9avFGi70
	EunD8Jrn6qS67hOkqse1IpqTNgyYvzaF47Vtpe4w7SrfjmPQAorzDcJKB7nnUfpT7iXPN5nOcgnCo
	/Rab14FYLuTbhl+bcXa4zybCGiSSbdjvhIZTDPgJ3e8IBohGwekbyYPyE1eCN7Zh4ZHl5f6mEf6B4
	mWpR2LK4STxpzHE8EPjjVBqI+Pbc45XT35bfpBcOJjt3eDPPmXgvbYQNEvLGMPQrY3fmFoffB+eDT
	MtW21lzQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsG9g-0000000CDCu-2CWP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:42:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67781BKi3179140
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Aug 2026 08:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zX2RD23vRIQz/ABHyG7ytkQUqMnN8cwrWXqqSeRQ5do=; b=HwuIsKaDj/jFg5SX
	k4Kno9mUe8Wkt7cg46CjAP4BsjvqRff2FBYlrAV+5dUdgwwUCiDBfa4oQD8QOnLs
	l3DFyu6IciUuq289EqkLafZzHJ+5nuUYDay+MZYlkJyFIZUHENKg+7HD0dvds4I4
	/OZ3Ve+ig9kzf89xBoox7meaIS/0Mhd4WzZxfzOMB6JIInMD7OJkCjX+xsLBaDuz
	sHoth5mWI2jzGVEPhN9QNgXeW3cK5UbjAHOoZZuhtkY788wpry9GEN6tT0aTa3+r
	NP/tJesTne/ZyuXByoNn+rKENKsbIofW/QPg7oe7ZF2vOwZEY1d4Sy33Jh30Kbwo
	njmGJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jk10m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:42:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so53214001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786092131; x=1786696931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX2RD23vRIQz/ABHyG7ytkQUqMnN8cwrWXqqSeRQ5do=;
        b=UhZmnhzlPvy1VwB+AH7mXpiljeyL9gHVZWG5VzVS/KL8ur2Kv+tqjVL5gwyW8Nw3Yx
         Ma3Z3CvyBBhJwyjkLB5Tmf0+MkWf7IanL/ZThnowJfC20Py4YQNEo6vMYOMeunp3j7mG
         I5Ue6wH4nae1YUEV2I5aOZf5UgIz7oEkf41u1BArNBUSsorKiqDoPeseNVwGz9hMUxU/
         1tiwvOjx7oHyM939KnTkbq17UCs0c47C6t9hcUyc+2BoiE9wh7mGPpDx2uGIJDiOz1jH
         jq9fLt1zDMFqds7Bp6m8sf21he32fnzRMS/C6KCCQ8WBNYfRsqK944i3yxFhP0YQWI1E
         n2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786092131; x=1786696931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX2RD23vRIQz/ABHyG7ytkQUqMnN8cwrWXqqSeRQ5do=;
        b=j3lgGuNRMQkRIh1n+D86SzSXrL735vjYdj40nWO5Dm0mVi6FganwsnVM3bkGsiwhen
         vBfDjmQtH02MYZAn44+neYdvMOxKMDKAb9ZxUnGNHUUyN2dyKrppnbTHjbdClG99pk1c
         wqd6Bel+pePuUt25kmej1XvOdwj1SehXTcWCuhxFXoL1BSe5B7hNYKgBfRvi8hUqZeFp
         gEbpRm24ObjdS5zFd10Y10SleQhLXUn6HadJZu0GyBLCIPeA3zuPrTrdaFga4wDUgcmi
         B6lNRSL0w+fYQsj+BQRvU3SFiv68yY2aFHGtaoh7iq0T5gumVP9NU5MLrg7jHXqHa7ev
         ChhA==
X-Forwarded-Encrypted: i=1; AHgh+RratSK9Z9P9zL6Zb5tTejK1xV11GFx3X3pg+fCSxul4QJEm4eZ2HdBOQCKAI3TRGgww8SAtktQ1ANshjkgLCeYL@lists.infradead.org
X-Gm-Message-State: AOJu0YzufHRqkhk3Dvdr5vAQdjIVpsN1pEhpC8Mex1oMb5MNA1QQCXzN
	OgFaTw794hTmCNt1mzOQYFE0pn/6doO5UsrtySNxONrB2EN4y+djRfHTFETxkJEl17oTqeosKjD
	vIgbfKkL3mmI5JgUgGnJsX2t/KnA/znKgBmF2E7QcdZlrIuIOnD4FBZ+NSCFJeU8kPKt+qD5AAY
	O/mw==
X-Gm-Gg: AR+sD10tsN9wZjuXD1VwPDVecyhXyqIbsnnVGxs6EuwXf5t7TFU7WE7ywU1G2PhGfFK
	UBfarnLT8djy9+vymZsHf29Nkhfh0ln8NnUbXT5H/3bylD/GapE0++GMJO434vbmipgH1XNVa5V
	fezJYHb5BMrourx/K3/ctPoBYGstrIJOniTLohnbVijMSt6VjXJ+c9F0Kv6xyS68AXpQvPkBqV3
	9SGHC7yxdZ9coWNK1oTtBihmwP9Xlt5JCzS8KfpBVtkZRIPQaRy0QPdqJWiEXW5udhWdF7R1y/b
	T1sNWSq4JDhsi3K+C5EOkqvf8oMBLofwImyk1sYLyoxSL+fmmzK1v98X3CuflmNXL13dwDpzgxj
	GR47jutRbd0VLtCM=
X-Received: by 2002:a05:622a:a588:b0:51e:aa39:4fca with SMTP id d75a77b69052e-52ce61b3533mr233391451cf.34.1786092131223;
        Fri, 07 Aug 2026 01:42:11 -0700 (PDT)
X-Received: by 2002:a05:622a:a588:b0:51e:aa39:4fca with SMTP id d75a77b69052e-52ce61b3533mr233391001cf.34.1786092130775;
        Fri, 07 Aug 2026 01:42:10 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a404sm133680465e9.9.2026.08.07.01.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:42:09 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 10:41:39 +0200
Subject: [PATCH net-next v2 1/2] net: stmmac: add tc-ets qdisc offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-stmmac-ets-offload-v2-1-9ac67af92cb8@oss.qualcomm.com>
References: <20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com>
In-Reply-To: <20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NCBTYWx0ZWRfX/v+HKT2IU4NP
 YyFdRkbXEKW4EbXS530hcSGj3laHLowgsnj6HkzT5Sf89mV96O/Hob3cqTnp1EW0BgMXsZgzj94
 Zl4jIK4D3UUYCsm+4jHhgqBunJyA6y2alF5TWMfcQq0CXpzUHEUMgM/jdXWXQc5q7QP+eb4EJTx
 9gfZkyqYVYx0GVQ3KhaZeaZd+86PW6VP+0+PH33wLy1nvOihIn5kYX5yfRyXK89PtyBdPj/a8eX
 R1da85hCR+T8qnypK0hhXorCkPIC9D+XC6Bjgf1T0+tGLaFnyEU3lrJnhuKP3/A8+MJ7dOBjxTj
 5uh9cw9ohDLpD19iMPAUwhNhd9f4Paon6cVd3aY8ewNUB1PpxTstaGpthsJbhqXyYfczD6dN6RD
 9yT56q7impfbN8eaKXRD7ayw9wGAwzjYkSS5a0sJW/hF0E6s2ntc35fjr8HLhIbXcGy+gh+Tu4I
 6Lid8pt9J1JfZ096HmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NCBTYWx0ZWRfX6Nm2hL9/sgpQ
 yKC4x9Ji+OxeQBbROfNfakk5CJDVSEmIDdSpPDVh3kGBewP1rsttfFIokbUiTRv43xgvlRd7kjw
 1rMqmxZxOcgj23bY1TEoCTDproIrZ2E=
X-Proofpoint-ORIG-GUID: 1omgoxGDbBZ5xH-QHbD2of8zVAIUgszr
X-Proofpoint-GUID: 1omgoxGDbBZ5xH-QHbD2of8zVAIUgszr
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a759a64 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=D5QsTFb32KIK1CFUdN4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094217_181658_5A8AC385 
X-CRM114-Status: GOOD (  26.48  )
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

Implement offload of the tc-ets qdisc in the stmmac driver. The number
of ETS bands cannot exceed the number of TX queues, and strict priority
bands (zero quanta) are rejected, since sched prio is not implemented in
the ETS offload but will be implemented in the mqprio qdisc offload.
Weighted bands whose weight is zero are rejected as well, since MTL DWRR
would never schedule traffic on them.

The requested weights are applied to the TX queues and the MTL scheduler
is switched to DWRR. The TC_ETS_GRAFT command is not offloaded and falls
back to the software implementation, and TC_ETS_STATS is accepted while
the ETS qdisc is offloaded but no hardware statistics are provided.

Export stmmac_set_tx_queue_weight() so the ETS path can reprogram queue
weights, and wire TC_SETUP_QDISC_ETS into stmmac_setup_tc(). Destroying
the ETS qdisc restores the devicetree configured scheduling algorithm
and TX queue weights.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  4 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  6 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 78 +++++++++++++++++++++++
 4 files changed, 105 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..b70883a53b09 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -580,6 +580,8 @@ struct stmmac_tc_ops {
 			    struct tc_taprio_qopt_offload *qopt);
 	int (*setup_etf)(struct stmmac_priv *priv,
 			 struct tc_etf_qopt_offload *qopt);
+	int (*setup_ets)(struct stmmac_priv *priv,
+			 struct tc_ets_qopt_offload *qopt);
 	int (*query_caps)(struct stmmac_priv *priv,
 			  struct tc_query_caps_base *base);
 	int (*setup_mqprio)(struct stmmac_priv *priv,
@@ -598,6 +600,8 @@ struct stmmac_tc_ops {
 	stmmac_do_callback(__priv, tc, setup_taprio, __args)
 #define stmmac_tc_setup_etf(__priv, __args...) \
 	stmmac_do_callback(__priv, tc, setup_etf, __args)
+#define stmmac_tc_setup_ets(__priv, __args...) \
+	stmmac_do_callback(__priv, tc, setup_ets, __args)
 #define stmmac_tc_query_caps(__priv, __args...) \
 	stmmac_do_callback(__priv, tc, query_caps, __args)
 #define stmmac_tc_setup_mqprio(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce0..823b40212233 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -301,6 +301,11 @@ struct stmmac_priv {
 	/* Protect est parameters */
 	struct mutex est_lock;
 	struct stmmac_est *est;
+	struct {
+		bool enable;
+		u8 algo;
+		u32 quanta[MTL_MAX_TX_QUEUES];
+	} qdisc;
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
@@ -394,6 +399,7 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
+void stmmac_set_tx_queue_weight(struct stmmac_priv *priv);
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c729ab127afd..7d1473fbde54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3419,14 +3419,18 @@ static void stmmac_set_rings_length(struct stmmac_priv *priv)
  *  @priv: driver private structure
  *  Description: It is used for setting TX queues weight
  */
-static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
+void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
 {
 	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 	u32 weight;
 	u8 queue;
 
 	for (queue = 0; queue < tx_queues_count; queue++) {
-		weight = priv->plat->tx_queues_cfg[queue].weight;
+		if (priv->qdisc.enable &&
+		    priv->qdisc.algo == MTL_TX_ALGORITHM_DWRR)
+			weight = priv->qdisc.quanta[queue];
+		else
+			weight = priv->plat->tx_queues_cfg[queue].weight;
 		stmmac_set_mtl_tx_queue_weight(priv, priv->hw, weight, queue);
 	}
 }
@@ -3570,9 +3574,15 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 				priv->plat->rx_sched_algorithm);
 
 	/* Configure MTL TX algorithms */
-	if (tx_queues_count > 1)
-		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
-				priv->plat->tx_sched_algorithm);
+	if (tx_queues_count > 1) {
+		u8 tx_sched_algo;
+
+		if (priv->qdisc.enable)
+			tx_sched_algo = priv->qdisc.algo;
+		else
+			tx_sched_algo = priv->plat->tx_sched_algorithm;
+		stmmac_prog_mtl_tx_algorithms(priv, priv->hw, tx_sched_algo);
+	}
 
 	/* Configure CBS in AVB TX queues */
 	if (tx_queues_count > 1)
@@ -6428,6 +6438,8 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 		return stmmac_tc_setup_taprio(priv, priv, type_data);
 	case TC_SETUP_QDISC_ETF:
 		return stmmac_tc_setup_etf(priv, priv, type_data);
+	case TC_SETUP_QDISC_ETS:
+		return stmmac_tc_setup_ets(priv, priv, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 14cabe76e53e..5dcd18b5808e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1210,6 +1210,82 @@ static int tc_setup_etf(struct stmmac_priv *priv,
 	return 0;
 }
 
+/* Max quantum value supported by the MTL DWRR scheduler */
+#define MTL_TXQ_WEIGHT_QUANTUM_MAX	0x1312d0
+
+static void stmmac_qdisc_restore_dt_config(struct stmmac_priv *priv)
+{
+	/* reset to the dt configured algorithm. */
+	priv->qdisc.enable = false;
+	stmmac_set_tx_queue_weight(priv);
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
+				      priv->plat->tx_sched_algorithm);
+}
+
+static int tc_setup_ets_sched(struct stmmac_priv *priv,
+			      struct tc_ets_qopt_offload *qopt)
+{
+	struct tc_ets_qopt_offload_replace_params *p = &qopt->replace_params;
+	struct plat_stmmacenet_data *pdata = priv->plat;
+	int i;
+
+	if (qopt->parent != TC_H_ROOT)
+		goto error;
+
+	if (p->bands > pdata->tx_queues_to_use)
+		goto error;
+
+	for (i = 0; i < pdata->tx_queues_to_use; i++) {
+		u32 quantum = 0;
+
+		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB)
+			goto error;
+
+		if (i < p->bands) {
+			if (!p->quanta[i])
+				goto error;
+
+			if (p->quanta[i] > MTL_TXQ_WEIGHT_QUANTUM_MAX)
+				goto error;
+
+			quantum = p->quanta[i];
+		}
+
+		priv->qdisc.quanta[i] = quantum;
+		stmmac_set_mtl_tx_queue_weight(priv, priv->hw, quantum, i);
+	}
+
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_DWRR);
+	priv->qdisc.algo = MTL_TX_ALGORITHM_DWRR;
+	priv->qdisc.enable = true;
+
+	return 0;
+error:
+	stmmac_qdisc_restore_dt_config(priv);
+	return -EOPNOTSUPP;
+}
+
+static int tc_setup_ets(struct stmmac_priv *priv,
+			struct tc_ets_qopt_offload *qopt)
+{
+	switch (qopt->command) {
+	case TC_ETS_REPLACE:
+		return tc_setup_ets_sched(priv, qopt);
+	case TC_ETS_DESTROY:
+		stmmac_qdisc_restore_dt_config(priv);
+		break;
+	case TC_ETS_STATS:
+		if (priv->qdisc.enable &&
+		    priv->qdisc.algo == MTL_TX_ALGORITHM_DWRR)
+			break;
+		fallthrough;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int tc_query_caps(struct stmmac_priv *priv,
 			 struct tc_query_caps_base *base)
 {
@@ -1308,6 +1384,7 @@ const struct stmmac_tc_ops dwmac4_tc_ops = {
 	.setup_cls = tc_setup_cls,
 	.setup_taprio = tc_setup_taprio_without_fpe,
 	.setup_etf = tc_setup_etf,
+	.setup_ets = tc_setup_ets,
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_mqprio_unimplemented,
 };
@@ -1319,6 +1396,7 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.setup_cls = tc_setup_cls,
 	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
+	.setup_ets = tc_setup_ets,
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };

-- 
2.55.0


