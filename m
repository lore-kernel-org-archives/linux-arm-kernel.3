Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5F2CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K491LnzWM9Tj5ojvjk2Jwr4QE+N/sscu3wT90FEFOPs=; b=K5CDhV/7B83qFzg0ofaxODKbpj
	qFZJhiQrWxDBFzJVg4urSuLyh2xamgmbgAvC2nGomEbK66AAFoc72SDfzcM4LiO+6tUnIi/s76wU1
	2z/bmD9OYZHPs0C4/rXlYZmkUkk19CUEf/hRGtG/nxEJpRy73fHFPe27yrWrB8IJYzPpreNzmolC9
	2jRgBOOs04UcJqHxQ+NAvvrljB3jSphGeIfRCuSfRN1lM5MdAqgF2y8rsl0L4yhnWH5G2v4UxfbJ+
	Km4cewNNqhJ6onkq7Pb5rfGqVak1RSx/EDqZ9I5dmfWUAE2ikIdL4sJTlfyVBDHbHz3xkiZwqBKJm
	FoW/BL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaeO-0000000BLDR-2o0j;
	Fri, 02 Oct 2026 10:38:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaeM-0000000BLCF-1o7C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:37:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692A4ppO1622797
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 10:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K491LnzWM9Tj5ojvjk2Jwr
	4QE+N/sscu3wT90FEFOPs=; b=ODepL0zbDytGOTxfFAVoWGIGNfk3S0eim2j79c
	I9czJIUVMjp463+9vD/Y8WoBWNuEikb6OxFYludp3lpqYgumyky0q1suk9kxNrj/
	SK5yuy3KLe9ZY36Z2rEg+Fms5lCi9KCuAIrQSLee5GpA/WMk3dlmLsaBNIWnRKQj
	LgRTk1YvcCFiaqnBOdhA4bgh9sMpmLApM5oYaqp6LienVDGCWq5Cd+kXg3KyWdTU
	tlu9iBO30CZlCYrQLeopg0pIEPb8VCdbP/3FLI2NfJGL7SNvSJAmIBpNRbwe8fSL
	kerj57JmYonb6lkxA4h2SVcr+zyJy/U0+gdDjo+l4ncVkGHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj002s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:37:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc5f70c8dso116659085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790937476; x=1791542276; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K491LnzWM9Tj5ojvjk2Jwr4QE+N/sscu3wT90FEFOPs=;
        b=ZSVJRb/Yt41xDDrCYq7tYtKoVy8QN1Uj7hmQ45UfYYWNC++Rm2glgXIsA14Udfw0Tm
         My3jUtg6q64rdk+uv3zz4gBuW4c1BZlFYarSaevCuKTZbHaO1s7lztxoNJlDnE/4n0Fk
         aW/b2tg1AHqGwln1U4AGr/xL9whMO7ca7M7G/5l5mHU279f2ASEIEhDaEMI0CqsYyrXA
         mDF4iZr6fsz7c/jOof6E563pFG8jbOnB6uS354oKxDzvxu0Uh7F9zmq9htHnQbOOFcHM
         N31WUqI7GwnFTUMd+jflDRU+olLKWRexayR8Z47YsrzJcqadgrHv8IGbAI2bp4NYtcXM
         dyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790937476; x=1791542276;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K491LnzWM9Tj5ojvjk2Jwr4QE+N/sscu3wT90FEFOPs=;
        b=IJ35oZEB5gTXcSCo8iBxz9iyPlhWUmJOO5ATdWvp8qdQk8/aku6GAydmrGjCBR6cvu
         VgafZA+zl3ffwvMKumJTv1BVpe8IuSX/GcHfQSoH6P81CvG62QgvhDxVZQxQ8DdYdOvJ
         hcQqImL91kr2248Us6IWTGK+hQQSSVtdwninYAEcK8NY9pOafz5kBj74aUVl6YfiGaZT
         9lAEyMqDBAdXVlZwcng52rxAWB84B3H8ceana2YO6Xb5biHZSVnpTAHbc3PP73ph4jRb
         T0BYoC9IQabu8XtYFi2vJW4KVSIB7+vV7LU0F6ABylbEDkRrxdxWgUjRJ01qZ/arSqQh
         btNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfp9F07BQJFqC3/KvoJ57COBaVNPOh0MR/LYm+nK3bi4ajz7HNgUgv7Gqxm3fi6+HLm52B5as8gZmwz99cl6L0@lists.infradead.org
X-Gm-Message-State: AFuF++maXTI96Wb2nXeqwIcTbwO4d+oI2zuvD2pk3Nm4zGKyP94Ag/mL
	R9+Voja3Divc3HjjdESPzOFKbvYSSEAr1kHhmEBIauxw9ectYdO0k7GKNM/W8B6/7ZdEo1ii4mt
	XQ/EfNdxqjEjWmSovkOfpy8qEFu757jqZ9wwrApE6L1N510Tqe4X8CJUKH3GTeT8HGBLuCoVxhr
	wnqw==
X-Gm-Gg: AYBFou2Qa4t3mqABSX1v47X0geBnFl2FA3/S4FTnj4qqTWIQ6V9iGcf72mdlt6E6XVt
	A+de+v6W+2VCQ08pwcyWgAg9Ugl2lRv2u4ICrYtH21bKIh/CoVrMmEIB/I7totA6cda8zBTKB8s
	QRWvn7aXEOsirZwGxOFthg0jZxuPj+qlUsa15ME/ri78XrIhwX64COPtInsatq9gSX28c/ctgGZ
	rvBj7aTKxIJdexLY2eIOsodWWoP4s+DxbZLoTn+YiG4WRBGABQjdXCt0ghSz3JY+QVnWr5Nofb4
	eU2kHEYjrCKPEQMmHhvDn8ow7ip34xASp7wyyk1DfMHO3e3mvfhwV2cKOjW60E3rp52rhvSyxFw
	SmVwAf2Woao46LA==
X-Received: by 2002:a05:620a:800d:b0:93c:7d49:7b83 with SMTP id af79cd13be357-93ce7c0ec12mr378983685a.11.1790937475745;
        Fri, 02 Oct 2026 03:37:55 -0700 (PDT)
X-Received: by 2002:a05:620a:800d:b0:93c:7d49:7b83 with SMTP id af79cd13be357-93ce7c0ec12mr378977185a.11.1790937475064;
        Fri, 02 Oct 2026 03:37:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm50479835e9.2.2026.10.02.03.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:37:51 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 12:37:26 +0200
Subject: [PATCH net] net: stmmac: serialize PTP timestamping configuration
 with priv->lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-stmmac-hwtstamp-missing-lock-v1-1-189ce151a624@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnBeonVT0V2SHLmYatlZpigriv
 1t2fJd3gnISVuirExJvorLEgvpRAc0+TowyFoM11tXGWNQcgiec96zZhxWDqEqc8LfQF9/Ot13
 bkWueBKVYE3/k+PcDRM7wuq4b0rY6enMAAAA=
X-Change-ID: 20261002-stmmac-hwtstamp-missing-lock-b6a7979c643c
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX8mjw3s3yHIzx
 W75iNQS4JBejiN2kHhYDGQgpwUMCKpllWRP3OC3VAPUbQ/k4z5oBcnxAPSvzez9IV3lSr8e4vMT
 RG56qoh57IDz6zh0vdoAhR+sweQNkxk=
X-Proofpoint-GUID: 07nhTRZpir8FQbukj73abfEEKohhiU1k
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6abf8984 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PlVWoO2b25ILWCNQflAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX3ZAomU6V/WUH
 CkmT8tTMxP/4lhqk1cTHOHj60vVZ6Kqd+phLJ/xg7mAhxEiuy3aqs8h5+xmROzUejuWiKR2N0ZI
 cbC3p0xkUjOMG2tU0DWSSinnnISoX2FAueN0ufybtsqZGjKjZcjV1NEBMXPPrs1YoG4rLyPZD9H
 u4BXc+B9JKMLF/4PCOBd9WZ2mXkeBIaZougRqQ4MrEPFvfn6s5T9h41v1Wq2gFPjLUUYmSWVM+/
 7BOmHRrAQA936PWd/Wpu0IMztXzqRJ55r16PidTr6N/uj13OSdzvZYcHRaeCP5rf0NXOuEoR8B0
 6AmC8h8rEurULEEXwL1GD7tbQ7WwX4CMgAubQE0bY/HF2JfEZ9ZrjThOUjU3lj8+TLehexVHuLl
 CQPOiBzAHECJGwI+VV40elgjjUyyUJhPgDDY2oqRGuSfFmYoancpnfI7BmneJSzIoHNKy04Xftl
 rdj6wbxrVoskrXF4YMg==
X-Proofpoint-ORIG-GUID: 07nhTRZpir8FQbukj73abfEEKohhiU1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_033758_594964_8A255F02 
X-CRM114-Status: GOOD (  18.44  )
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

stmmac_dl_ts_coarse_set() runs under devl_lock only while
stmmac_hwtstamp_set() runs under RTNL. They read/write
systime_flags/tsfupdt_coarse and run stmmac_config_hw_tstamping().

stmmac_dl_ts_coarse_set() snapshots priv->systime_flags, programs
PTP_TCR, PTP_SSIR and PTP_TAR, and only then publishes tsfupdt_coarse
and systime_flags. A concurrent stmmac_hwtstamp_set() can read the
stale tsfupdt_coarse, build fine-mode flags, program PTP_TCR in fine
mode and set hwts_rx_en.

Take priv->lock in both stmmac_dl_ts_coarse_set() and
stmmac_hwtstamp_set() so the timestamping configuration is updated
under a single lock.

Fixes: 4347287b8627 ("net: stmmac: propagate PTP addend and system time programming errors")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 43 ++++++++++++++---------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9741f97fa37a..a6793054a179 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -685,14 +685,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 	u32 snap_type_sel = 0;
 	u32 ts_master_en = 0;
 	u32 ts_event_en = 0;
-
-	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
-		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
-		priv->hwts_tx_en = 0;
-		priv->hwts_rx_en = 0;
-
-		return -EOPNOTSUPP;
-	}
+	int ret = 0;
 
 	if (!netif_running(dev)) {
 		NL_SET_ERR_MSG_MOD(extack,
@@ -700,13 +693,23 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 		return -ENODEV;
 	}
 
-	netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x%x\n",
-		   __func__, config->flags, config->tx_type, config->rx_filter);
-
 	if (config->tx_type != HWTSTAMP_TX_OFF &&
 	    config->tx_type != HWTSTAMP_TX_ON)
 		return -ERANGE;
 
+	netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x%x\n",
+		   __func__, config->flags, config->tx_type, config->rx_filter);
+
+	mutex_lock(&priv->lock);
+
+	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
+		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
+		priv->hwts_tx_en = 0;
+		priv->hwts_rx_en = 0;
+		ret = -EOPNOTSUPP;
+		goto unlock;
+	}
+
 	if (priv->adv_ts) {
 		switch (config->rx_filter) {
 		case HWTSTAMP_FILTER_NONE:
@@ -829,7 +832,8 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 			break;
 
 		default:
-			return -ERANGE;
+			ret = -ERANGE;
+			goto unlock;
 		}
 	} else {
 		switch (config->rx_filter) {
@@ -859,8 +863,10 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
 
 	priv->tstamp_config = *config;
+unlock:
+	mutex_unlock(&priv->lock);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -7753,9 +7759,12 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
 {
 	struct stmmac_devlink_priv *dl_priv = devlink_priv(dl);
 	struct stmmac_priv *priv = dl_priv->stmmac_priv;
-	u32 systime_flags = priv->systime_flags;
+	u32 systime_flags;
 	int ret;
 
+	mutex_lock(&priv->lock);
+
+	systime_flags = priv->systime_flags;
 	if (ctx->val.vbool)
 		systime_flags &= ~PTP_TCR_TSCFUPDT;
 	else
@@ -7768,13 +7777,15 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
 	if (ret) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "failed to reconfigure PTP adjustment");
-		return ret;
+		goto unlock;
 	}
 
 	priv->tsfupdt_coarse = ctx->val.vbool;
 	priv->systime_flags = systime_flags;
+unlock:
+	mutex_unlock(&priv->lock);
 
-	return 0;
+	return ret;
 }
 
 static int stmmac_dl_ts_coarse_get(struct devlink *dl, u32 id,

---
base-commit: 232d49dd4b40a666283de9e722899f088ed581b2
change-id: 20261002-stmmac-hwtstamp-missing-lock-b6a7979c643c

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


