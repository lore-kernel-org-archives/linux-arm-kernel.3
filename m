Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FC7C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5UQCFI/el1nQf607Is8vrLFj0vTVoBDdpenBgLQKMj4=; b=cqY80Xqqy2y49LUTu4eOebBQ/P
	wQ3+OUK8870DVKBs9ex4+LG0X+l+DgC8TmcVmd2blx20QuauXcy6sewINEKIEZXReCfKpWzO2f3sN
	5wa3kB0JxJXAqZgP1Ut1eOBs6/tOIKmMUEGC5oKHuxl/EyuOcCW4Ux4IuQ6k5XK4PIOqe5cWIGf93
	MIL3iaJTinF8fzTxKjSyd0wvBEZKm91w6xYqjZxlI7XWDW2IXNgaUGiG8jQBg0IN+r1a3BId9Sr73
	bI3PXVKGfuofyq+eyGdGdl0ILBnRw7qoj/T6dMB1m7eHFp6XQrDPKIiT7+nilnxeVXUASffn1iGdT
	mKkiAg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pqk-00000001Tdu-2vzw;
	Fri, 04 Sep 2026 09:04:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pqi-00000001TdI-3AN2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:04:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mlUI3112835
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 09:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5UQCFI/el1nQf607Is8vrL
	Fj0vTVoBDdpenBgLQKMj4=; b=cS+d0mG/evrjo9csVsye1HokgJ8CfL2R0Jw/yS
	Jc7XoZeXuYg1mYJUH2Ki+44I2X6qhgonEcU1y+1nVvrlCrDaDg6+5d+D/VDv6QA0
	/oa3jVj6sGJwJSRqLWwAMQ4yyfcHkoBjt2YIfznQbXydtrSHstOxk6LSIKQNL2Na
	mbmiamT3cLQ+09jxYZh8c+K7h9OL4HZQ1Rl34+UBg3eGwZXZxD7Fs8CUMDhpE0D/
	fBnHROFRrDXiPyYGhZwR7c8PRBQjq2W7fLKvmiL9yqTOS3B9bngiGi1y/NjJBr2B
	R3pKIigFL267AojgcIYcEFKMxN6ldbQKewKBPSDmoubbDKJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp780ypq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:04:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9382f9430deso139812285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788512678; x=1789117478; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5UQCFI/el1nQf607Is8vrLFj0vTVoBDdpenBgLQKMj4=;
        b=IQ9zYolodd+alQQ572YdpT/Jx9cEEJUAEI8oSmy+t5Drp7NjVGIIQDmofr0uWZ4fKQ
         wDMT6jvH8q7ewdEtFJzCb6cYXXzpz/CAYw7biHKwHLZRdbS025v9uNy1gC6hV+uZBv4M
         QH8ixNOH48PwWwDQ0RPuKVqx6hZmReAr60tG9kp3nO5BjxXHu+Ert276jQUGj3QG61LJ
         kQcfsXzl4OYKPKiQakbr1eRCDM5NrmyLNB1oHpug+3sSTdyd8Z3B9kjJN0a10OL3FXYF
         5KoG4b4epYRJhn8LEEZLnkCMRC9kaTGSx1OVyIY6X8liBQMOx3N8SusHqISurIojMs4r
         sRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512678; x=1789117478;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5UQCFI/el1nQf607Is8vrLFj0vTVoBDdpenBgLQKMj4=;
        b=jQj8DobNmg33+zZELNwvTm3gZCYP9Q8HmMwkw+JM/9muZbqiCMjhYucPHU8IZKgB34
         LalWj2vuUdsGgjtLS1pATeu/AvtpKGW9zW1zjjlK7lbl43AJwDmpuSqTnquA/g+ja+kA
         IHKaAmgYr8QcLY+qG8uJRTIK6xLoDS81leXtX2DcAdYimGlFS7Om9yIz2DLwpGYd1GjT
         VzHKkglf9kO46lq5sMcJ1/k/5mSKbzLxMAG4BtEKh+w7BWZLdW/IhOWlMGc+t1abSXOa
         DUqiYZd3JBlI4qggFpwYg+peG1J0D1Ecw8PW0qQvVIUAG5NovQDtZ4NkLLISFFXo9nVD
         wn+g==
X-Forwarded-Encrypted: i=1; AKwUvBwVd/0cceL6yW8GPQlFz5YJMmxFUFU3GoXIGDLA+vfnZLyBETi4j8su3PMlLGPzCco/63V4Hoc9LKnvbzWRE8ms@lists.infradead.org
X-Gm-Message-State: AFuF++nTRU6z33AEZxabESiqyG+gRVLez3HR8yibZeTA4XOcCWd/v1wi
	xop4Z3C88GMt74iKkTK+tcEuBfTYAhFgpZJ+JAA2uUbEs/972P49Zob6Q8E5ekDg5F4aR90G6Jl
	K/SivEGN9F96rz4wW+vBxGSExysACDTtcZE0uESERgNREWEFTJdz38yZ1f9rurmn/TrdWta1NR8
	EM7A==
X-Gm-Gg: AYBFou1eLC5f3aEcLsM2faYExY94TYbbvqD6V0/xWwXlIODNCsfHHl2XCbrHQ5aO2Q8
	gF+DI5t3RSzLrSOHfgnq693TeABAwcAwU2SinaUHbEvo0K3SEJFqSYlWzjVbZ8vHqkPf3cAp34z
	iEdPtlLdzXkiZcYW5xoqrkSDr6pyRcJdg9OWo3Uhy3r0A81juVMTe0Qe8TB9uCuMgbC9pe/1uff
	Hep319WkWnkBO21xP1XJXXePEfvOUNBXyJwuE/LnqLnEenX5Nnc++dpZXNbEa1//6c5MxFYEc/a
	nhuAi8BP6WKKCMUdGhk91cc54kYBWBK3ktR7JYf8OezKcVcTqo6Y54pnfbtfnu0XXHj6cFkjEkF
	yv6YLekb4lGgaKQ==
X-Received: by 2002:a05:620a:8016:b0:930:a635:a782 with SMTP id af79cd13be357-939802f7476mr467452885a.11.1788512678193;
        Fri, 04 Sep 2026 02:04:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8016:b0:930:a635:a782 with SMTP id af79cd13be357-939802f7476mr467448485a.11.1788512677671;
        Fri, 04 Sep 2026 02:04:37 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm3440555f8f.22.2026.09.04.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:04:36 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 11:04:07 +0200
Subject: [PATCH net] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-stmmac-ptp-error-propagate-v1-1-80f01b03dafa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBAF0KvIrDsQQ7DYq5Qu0vhrZ2EyTEIRx
 Ls3uHybd1CFCSo9hoMMP6lScsd4Gyh9Y17BsnSTd35yswtc27bFxNqUYVaM1YrGNTbwlNwY7u+
 Q4GfqgRo+sl/5kzIavc7zD+4+E2dxAAAA
X-Change-ID: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MiBTYWx0ZWRfX9byCn21EZeRO
 SUBcz4drNOCUmm5GjPnpWTiUrhZL4FewckXSvtCX8FmCb8UtTOwGZTZ5q2/JDXbtwaJ6E+h4mhx
 JL5jZKC8zJEgRyiPiRj6B9+Y3xsoKBI=
X-Proofpoint-ORIG-GUID: zsK89uiU1DZoni7nHl46xW1cVOSTGUsg
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9a89a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kkejPvnTCPuT7LAjvx8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zsK89uiU1DZoni7nHl46xW1cVOSTGUsg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MiBTYWx0ZWRfX+dDSmmjkI98D
 O0Is5FQ6Q/yZKk6jtZI4+9yIkAmUHa9iGrevgwE2ReA73gJeZbfDrifMiRx2m4hSPcKkrBvHK8y
 jMTLMktpHnceKOM+qgKHR5Ngo3gI6SkFx2spOD7P0aEmidQ5XEX3dVyjDXv+Jl/F1yXZnt29nJq
 LrL96KjKLyg+QeM2+uFv0SSWaDBYQoCjFKjBkFJPmGlNQ7si04GaUL76iaRV+vkRmn6Lak12I2X
 5KbFHSWcPyMgH3XFcHP1wNGaJS48gdf32SrRxtOYZopD7fzHLs4IAHIm19Kmm80IZErgE7mTGm4
 FgWDFs14xC9oYZizRAAphMzE0m5geEBhNup+S7+QxtZfpsdiIKdgADhSU6CR2DA4BT05SV386B3
 gFhn6FOHAIFrOizec55vpaTQfsDVaJWdLOaEeFin4sfCp0vQR8h1nZFCUv5eycQn67U3XNFbOTI
 Z409xhth3qRMAxrjXcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_020440_937694_D4A846FB 
X-CRM114-Status: GOOD (  19.67  )
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
This matters for TAPRIO/EST qdisc offloading, which derives the EST
base time from the hardware timestamp counter: arming the gate list
against a non-advancing time base would leave the schedule permanently
stuck. Make stmmac_setup_ptp() return an error code.

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Fixes: 0ad2be79f254 ("net: stmmac: Balance PTP reference clock enable/disable")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 66 ++++++++++++++++-------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24656b35350b..d33c82bd3ee4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -885,6 +885,11 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 	return 0;
 }
 
+static bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
+{
+	return priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp;
+}
+
 /**
  * stmmac_init_timestamping - initialise timestamping
  * @priv: driver private structure
@@ -900,11 +905,6 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	if (priv->plat->ptp_clk_freq_config)
 		priv->plat->ptp_clk_freq_config(priv);
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
-		netdev_info(priv->dev, "PTP not supported by HW\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
 					       PTP_TCR_TSCFUPDT);
 	if (ret) {
@@ -937,22 +937,39 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	return 0;
 }
 
-static void stmmac_setup_ptp(struct stmmac_priv *priv)
+static int stmmac_setup_ptp(struct stmmac_priv *priv)
 {
 	int ret;
 
+	if (!stmmac_check_timestamp_cap(priv)) {
+		netdev_info(priv->dev, "PTP not supported by HW\n");
+		return 0;
+	}
+
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
 
-	if (stmmac_init_timestamping(priv) == 0)
-		stmmac_ptp_register(priv);
+	stmmac_ptp_register(priv);
+
+	return 0;
 }
 
 static void stmmac_release_ptp(struct stmmac_priv *priv)
 {
+	if (!stmmac_check_timestamp_cap(priv))
+		return;
+
 	stmmac_ptp_unregister(priv);
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
@@ -4161,10 +4178,12 @@ static int __stmmac_open(struct net_device *dev,
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
 
@@ -4187,9 +4206,10 @@ static int __stmmac_open(struct net_device *dev,
 
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
 
@@ -8326,13 +8346,14 @@ int stmmac_resume(struct device *dev)
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
+	if (stmmac_check_timestamp_cap(priv)) {
+		ret = stmmac_init_timestamping(priv);
+		if (ret)
+			goto error_stop_dma;
+	}
 
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
@@ -8356,6 +8377,15 @@ int stmmac_resume(struct device *dev)
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
 

---
base-commit: 641d03105cc0d2437e32fdeec164f91a4ccef6c4
change-id: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


