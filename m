Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA012C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nETtsjmxrugp4tV//lzw0MHQFdBsUIyGf8iKZqQcwDc=; b=y/ToTHytyl2Vb+tE3aajpuSewq
	EihrX9CecEti/pFgLpwNaGh0aWs8uyGk5Ns4dwPIrvHvDkynM43H19Fjl2hxxq/3cj/RbkhAIUoSX
	Ik6PWLvq7rr6um+MQ8shK6i34nG9+d4+j5+Srv83Lz+s+Bsah5soryQl8qmS2lkQAY2gMxVblCmcV
	xB0tJOO9RSOFJY9500Ckem9DLOBvAHEDIGIvjSdTYLMd9YsYXwjp+UZzpD3tRoTqawhgPmILQ20Yz
	udZTDJZYUr9lOvdLvQbHdoUQ5ubAtUpA/u/5beurSQ3QJR2EEwApykoY548EUCHzVaVNaMZxshXSU
	a1YXl0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNW-00000009Svi-17vp;
	Sat, 08 Aug 2026 14:50:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNR-00000009StZ-3oD6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 14:50:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678DbgH5275057
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Aug 2026 14:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nETtsjmxrugp4tV//lzw0MHQFdBsUIyGf8iKZqQcwDc=; b=KYf6PhJEFvz4/nhh
	Ytew27sbTF3K+wSnqftdAkWQ1DoOiTYvM7hsc1oTTDA2Mr7BVYMH3zzE+U9PT0Oz
	MxkAIaosBoWBLYDI+qhMfST2Agiee58Wx8W6mPBbENmY+/K/05YKgTENnBvjbjJo
	Z38mUUv5273FXnAS6p4Ajza9+Ff8O4oiDSlJnD8il3MXPyIcPAf/XM9o0TVyb8RY
	GPe0bdc/Vf27Ye7jKYG64fIQA6gPYZpGgk8VvMrFCBbJMUfWsiov7pIE3fj0SnTO
	c5sWSEnk+clEF1pBkJuXPZHAw0xNGiFYQW3k/uGkhNMOOAL4cMQTBOtTNG4Ux4L1
	MPLU9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf795w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 14:50:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so5649091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786200620; x=1786805420; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nETtsjmxrugp4tV//lzw0MHQFdBsUIyGf8iKZqQcwDc=;
        b=Y0mPi+zb7Cuft/ExdhywqhAG96T5ehSyBnrTTy4ZZctJZxeI+ZYFCFu7nyqO5e3QlI
         J8lXXR94Zxf8KDwmZqVSJpD4BFhAS3C8Ufg9W6ysfKcQMc/XiVOBzuQCQVzMiAICLdhD
         4fOdvMSXRPzX6i1kqqItuDhkPV1z2sLfBsNufU8/cdMEsuHoKMkQshWAPPjPfSlssGeF
         zLbqb2BbGZO+VKmmn4S89Pe8fzT5uAHGEe/p4biYJ/CYMIlAmM1X2iy7h4lPCu7djRJJ
         IiwzLKRY3pn6soS73IB09AXwMAtQYeYJ9UJVig0gDSLRy10btCwBD0BvbF/M6zlshB6n
         fk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786200620; x=1786805420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nETtsjmxrugp4tV//lzw0MHQFdBsUIyGf8iKZqQcwDc=;
        b=JpoFPKQxYoOm3MJGOwZPT2fIQN07kI0EUclEgZo2JQNjTA09tsoxBr2e4XDxVD/rt2
         EYMM78UuFP+/Xpd7+rnhl+E8CPZXxcloMuduZQ4ztwZ4yw1IYAYwDjNcecjkuSdyQW01
         uX+D8ic0XoAlgZ8wk48qL17/kR3PkruiDxvfFUz+2MualSJyShDVWxtchyPwpK2hpo5z
         IErxcZt5ZbDyYuyLWSB+dsp/EsQguo7ZmbzULArM7bjHINRpT+HDxf4CAULoCPF3X/pU
         /IDtS6iaxJy4tmyGzW1kCOTJM2+BvEfBV3QFfN76Q4az/zJJ4qok0t02NTEETri9+aR6
         vq0w==
X-Forwarded-Encrypted: i=1; AHgh+RqO/Gc2CxOK1P/PeoxBhdq0SvAwzQyz2Xi4/Rp9e5IQlRS5ICUTIgn3FeFnQ2t069NsFe+ue2SPpHwr2ZOmQ7h6@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXYRjdgfBz4XG/MOL2fO8M5H/ut3jVDhA8BpMFK3Ohy1MLIha
	HNKVVvF5iai6eSnkUnMQyeBg545Pq9ZN86O3A9sySakS3S3NijMR93r2y718aMPymqkpDRA9jpU
	1xoTsXy/wNQEneh4/NUP9tLDCBJRdUTgmN060K526cW8/19AtPdjDHmJsyXdHttdplFdR50xwmI
	55wg==
X-Gm-Gg: AR+sD12NH9KRxrxbx5X2vLjsiJPCQQvIZvdepU2gsyWF0rsTPmbW4LaeVHUyx9WmMGP
	vjufxUT3dkaDkEciCLQpioArljc2G9AW1ePgOGTZlV+f4/IjlvAG2xpL//9d6RmOI2HMeNFOQNZ
	BiNmrcAagJKIWZJ0QeB9pQXAHhdeELFIiw3VgUkeNm5+nCZo22+G89CJvvhVTdMlyqDnNjbRFHD
	UQXiSGrWFm5hVwoZUVUfmdlZln+N3uBzg1O2WKsO1Wv00ddDrYspey/YhKFokjvc4ByLIYbjnCq
	+mnEGPHJfWPcJqne02iBLYVTfh/xc/eYhn+WlWC/4MxcADe2ZP2ne21oSZKpdVd3Zr4LD0wkp6E
	GuXkg/yv5AAM8+no=
X-Received: by 2002:ac8:5ad3:0:b0:527:9603:8123 with SMTP id d75a77b69052e-52ce5f611e3mr314352781cf.2.1786200619789;
        Sat, 08 Aug 2026 07:50:19 -0700 (PDT)
X-Received: by 2002:ac8:5ad3:0:b0:527:9603:8123 with SMTP id d75a77b69052e-52ce5f611e3mr314352281cf.2.1786200619322;
        Sat, 08 Aug 2026 07:50:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506c0sm14670677f8f.11.2026.08.08.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:50:18 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 08 Aug 2026 16:49:58 +0200
Subject: [PATCH net-next v3 2/3] net: stmmac: add tc-mqprio qdisc offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-stmmac-ets-offload-v3-2-b714466142b9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfX2+LkWE+IKSR/
 MKfHwcbjn93g0GbgXJia1AiRQ7K6lImzXUC5rfTqZJjE9n/c/OUcscoMwZzsublTW+sigZDy45b
 Q5alD6d6BFDksHkBMTuYvXZvyv26wkE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfX00ha4xWDIhCc
 Qq9Rklt3gGuvaGI8dLq3DEGal9yWpvyEy88E5oACRfTiTB+kIQdmU8r0ITyerSqH+Lavt+w5PgL
 6QEszWOEa8+1J3k6GXBznU3K6LmKcqBNzGvCCepuh+CPBObcWp9PxYNILCdxap/ANKahjj8B+0P
 h2d0gGEqnKHk4xiXUzvc8R21SHy8fN+vYNzv7UAI3QG5MtBPAMbC51BaiPoPizZK7OopxaaINz8
 l9kBjt0kMbIb0KwiXGwRdFzH2dlvIreEj4KYlDadB6eWo6q+Larmvvuj6kChIIHEcFIoq9LI5Vq
 ZqRL8/MEdmJqyTdek+MEghyik4kZwIc/SzOGyzzzDzebSna7sh7I3oNXwBPY6yCcGWff5H0gwdX
 UjfBCLgVGsY1/8D7dUZ2vm7DHLUqcRpP/q2k8lny07ZcDXX1ZyP+6Vph5JanaAkO5qAj2ZR14do
 Yzisl1D57bVkANh0wGA==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a77422c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1M5hV_b7PZp0XbSsqqoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: rh42Nlx3Vyo4btRKOy98xMpsuq1FTI44
X-Proofpoint-GUID: rh42Nlx3Vyo4btRKOy98xMpsuq1FTI44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_075022_085852_9C583879 
X-CRM114-Status: GOOD (  23.92  )
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

Implement offload of the tc-mqprio qdisc in the stmmac driver. The MTL TX
scheduler is switched to strict priority, and the PSTQX/PSTC priority
bitmask of each TX queue is programmed from the set of frame priorities
mapped to the owning traffic class (qopt->prio_tc_map).

The offload requires the DCB feature and a 1:1 TC to TX queue mapping,
with the queue ranges bounded by the number of queues the MAC implements.
Configurations with AVB queues are rejected, since forcing strict
priority conflicts with the CBS algorithm.

The per-queue priority bitmasks are stored in the unified qdisc state
(priv->qdisc.prio) so they can be reprogrammed on device reopen, and are
applied through the MTL TX queue priority map registers. Export
stmmac_mac_config_tx_queues_prio() so the mqprio path can reprogram the
queue priorities, leaving queues without snps,priority untouched.
Destroying the mqprio qdisc, or failing its setup, restores the
devicetree configured scheduling algorithm, TX queue priorities and TX
queue weights, unless a different offload is active.

Reviewed-by: Davide Caratti <dcaratti@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 55 ++++++++++++++++++++++-
 3 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 33c37f843336..1967279a4ccc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -307,6 +307,7 @@ struct stmmac_priv {
 		u8 bands;
 		u32 handle;
 		u32 quanta[MTL_MAX_TX_QUEUES];
+		u32 prio[MTL_MAX_TX_QUEUES];
 	} qdisc;
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
@@ -402,6 +403,7 @@ enum stmmac_state {
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
 void stmmac_set_tx_queue_weight(struct stmmac_priv *priv);
+void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv);
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5acddc9cbd3f..e19f75d8c393 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3507,18 +3507,23 @@ static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
  *  @priv: driver private structure
  *  Description: It is used for configuring the TX Queue Priority
  */
-static void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
+void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
 {
 	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 	u8 queue;
-	u32 prio;
 
 	for (queue = 0; queue < tx_queues_count; queue++) {
-		if (!priv->plat->tx_queues_cfg[queue].use_prio)
+		if (priv->qdisc.enable &&
+		    priv->qdisc.algo == MTL_TX_ALGORITHM_SP) {
+			stmmac_tx_queue_prio(priv, priv->hw,
+					     priv->qdisc.prio[queue], queue);
 			continue;
+		}
 
-		prio = priv->plat->tx_queues_cfg[queue].prio;
-		stmmac_tx_queue_prio(priv, priv->hw, prio, queue);
+		if (priv->plat->tx_queues_cfg[queue].use_prio)
+			stmmac_tx_queue_prio(priv, priv->hw,
+					     priv->plat->tx_queues_cfg[queue].prio,
+					     queue);
 	}
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 15949b5d9f32..336350d6786b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1219,6 +1219,7 @@ static void stmmac_qdisc_restore_dt_config(struct stmmac_priv *priv)
 	priv->qdisc.enable = false;
 	netif_set_real_num_tx_queues(priv->dev, priv->plat->tx_queues_to_use);
 	stmmac_set_tx_queue_weight(priv);
+	stmmac_mac_config_tx_queues_prio(priv);
 	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
 				      priv->plat->tx_sched_algorithm);
 }
@@ -1345,8 +1346,16 @@ static void stmmac_reset_tc_mqprio(struct net_device *ndev,
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
 	netdev_reset_tc(ndev);
-	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
 	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
+
+	if (priv->qdisc.enable && priv->qdisc.algo == MTL_TX_ALGORITHM_SP) {
+		stmmac_qdisc_restore_dt_config(priv);
+	} else {
+		u8 bands = priv->qdisc.enable ? priv->qdisc.bands
+					      : priv->plat->tx_queues_to_use;
+
+		netif_set_real_num_tx_queues(ndev, bands);
+	}
 }
 
 static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
@@ -1357,13 +1366,24 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	u32 offset, count, num_stack_tx_queues = 0;
 	struct net_device *ndev = priv->dev;
 	u32 num_tc = qopt->num_tc;
-	int err;
+	int i, tc, err;
 
 	if (!num_tc) {
 		stmmac_reset_tc_mqprio(ndev, extack);
 		return 0;
 	}
 
+	if (!priv->dma_cap.dcben)
+		return -EOPNOTSUPP;
+
+	/* Forcing strict priority conflicts with the CBS algorithm of AVB
+	 * queues, so reject the offload when any queue is configured as AVB.
+	 */
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		if (priv->plat->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB)
+			return -EOPNOTSUPP;
+	}
+
 	err = netdev_set_num_tc(ndev, num_tc);
 	if (err)
 		return err;
@@ -1373,6 +1393,15 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 		count = qopt->count[tc];
 		num_stack_tx_queues += count;
 
+		if (offset + count > priv->plat->tx_queues_to_use)
+			goto err_reset_tc;
+
+		/* The offload switches the MTL scheduler to strict priority,
+		 * which only supports a 1:1 TC to TX queue mapping.
+		 */
+		if (count > 1)
+			goto err_reset_tc;
+
 		err = netdev_set_tc_queue(ndev, tc, count, offset);
 		if (err)
 			goto err_reset_tc;
@@ -1387,6 +1416,28 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (err)
 		goto err_reset_tc;
 
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		u32 prio = 0;
+
+		for (tc = 0; tc < num_tc; tc++) {
+			int p;
+
+			if (qopt->offset[tc] != i)
+				continue;
+
+			for (p = 0; p < ARRAY_SIZE(qopt->prio_tc_map); p++)
+				if (qopt->prio_tc_map[p] == tc)
+					prio |= BIT(p);
+			break;
+		}
+
+		priv->qdisc.prio[i] = prio;
+		stmmac_tx_queue_prio(priv, priv->hw, prio, i);
+	}
+	stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_SP);
+	priv->qdisc.algo = MTL_TX_ALGORITHM_SP;
+	priv->qdisc.enable = true;
+
 	return 0;
 
 err_reset_tc:

-- 
2.55.0


