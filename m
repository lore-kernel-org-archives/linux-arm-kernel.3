Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552F3CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrQRBTmL2QElj1OdIKBi4dLiSjrCHV8ryD7nPGM4RaU=; b=MNalQ3ZTmlxJzpVu2ncwIrK/Pw
	ZeJ5kt6mhBSE39N3QAU/6tsUItChnN6GvXWJhoIQVDnLolfXZCF+0SmnLxKD65+j5dmGsL/agANIE
	CHlPeCg0mtxWnl9UR8asOxiR+eke7Dyhv+0CuzoEH9174odxNgQWGJXEs6dTROcxhK2z+T36TK0xg
	vQ7Z8Lkyaal8ZIHQQkBQeLjzDH2g03oMiMWcu5dwpHLc5I540uRiAWMbFb45JgYmniVk3AU09WfOF
	Bmu7Sn/I617YCJKPYQ27GzycybgDhbvZzXwZDjinpDHG/YDDEOrDqpqedH5GFWNWFR7EYLNYziByt
	cRJlevZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7oY-000000063Pb-2rFO;
	Fri, 09 Oct 2026 10:26:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7oU-000000063Mq-0kAh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:26:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KMt32369655
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 10:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrQRBTmL2QElj1OdIKBi4dLiSjrCHV8ryD7nPGM4RaU=; b=NNOJ82jIrvQaC7gr
	S7y0H6qn0uR+BGyXnmBQZUvkyf6TdsKaFvywPI0dIEuJjV4oO1MZ7PBWgJvNwMr/
	ny/W2J5c5ehGINVu2Mox/WGELpjMj3gpr8o5B/lXEYqFllB5GgBOYmdbOEQoy3+s
	cNgsxjvFNr3ThEpqCLcKlolfpzlY6Am0CW8tLAWgjm6hiIxI9aBE4iyW0H4fhnkp
	WTs7CSJB3xwJCBlU0wlvUYVZ0FLacCZxSPk3o1Dnb/0ZM9o3ZXnfRcb4ause769t
	uO3Pud0cULvjl/In+IOErOe7gSteXgo1v3Ph61/XiyVjLCRHT4y+r04QFDLzdacp
	p1grTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwb4dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:26:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8067974so561195485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541613; x=1792146413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrQRBTmL2QElj1OdIKBi4dLiSjrCHV8ryD7nPGM4RaU=;
        b=Xaij00BoyZXGeUH9JE/bjN1E8foFTcyantApl+JXLxpdhsEUQGUPJBklBL83DWbPLo
         6kWOBIAyPTSHNpJSLrJt6rqUvvKsv+NKIkVLcTkwi476k5PUyyxXYQA+Pdc37EmuL3+4
         kzryT8kRF3X4qCVW4M2pq/Fit4kr4It5I1vzdrXWKM/xyQECPxWUG8Kn7g7HNWH63w/Q
         Hwf+O0Lus4/Ul/bVt+c7aoiynlMiGPqfr5wJWR8kEBYU0IWCrILf21BucDr8g1rCDfqm
         VKGJapE0IP7mKgEILdZxcoJrMRq8u04eCx9FUZYWJv8eszbxedg5E4ao+GFOUvxPa3oZ
         CyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541613; x=1792146413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrQRBTmL2QElj1OdIKBi4dLiSjrCHV8ryD7nPGM4RaU=;
        b=RczzGFGPuhrlwvYJULuvSfE/wyIaQDZNQHc1V/lLgohGjG17dQIZeFeQSdtDFFBdK5
         pdZ8CGDRAkP0OlPlT5X980k3V609GCw/T5cZ76YYB1E0oO/f6SyJZDwVLNVRJ6VXXHWM
         zjwGFSTt0KDmr7dsFd45/j8AZtUBgaj7Bjyi5WdwF2rdf2jPyzlFHwSl/xOCERloKswr
         s73o0vLC6v0FDhJfFMABsVuk6HkSex+B0dFaM7T5aDolIJvPCYTliwTRd4j4DZh5dU44
         nbYw5KVEHaPVaowmOfVtZ8P9mDCykh229uhfR62uRe2Ygwm5pHZw10hWZgPlqQK3ZG/i
         PlZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYnyJMyEqAI3AjMQWEjB4HT7P0xgNUnR5y/svVrIyOrp6thlBfIt7TpwxyC8ev10t/8j/er8BJ0qFgtqddieAl@lists.infradead.org
X-Gm-Message-State: AFuF++l30+FwUvILx3yg4ybzHCzZ4yuG1AaH0hiEfm5s9aKhIC9K9RZN
	pEwBXY/cVBA7Pmb9kXDS6W+tGH8ORoevdOahH6ZCtvvh35vZXfSaurIm4icSrhkCMV5nrtPgBSG
	JonVdbVb7r/HnzVp0Us3YcUz6nNm94V/qRutmilRAuNRc1PEfnHe8nOYxrk2hnft1TI5zsXocu6
	+uwA==
X-Gm-Gg: AYBFou3txH11ZvOKfuikcDZBd4ZucxsFhiQEqJquJvNOM5bPW1Vxh/Sick9lAbNXWXh
	l4Ps984W7asA2A6HYzDpKiquZCVXf4jN5TBEidFbWIzhsnVPpom+0OKIbYfp/jDr+oBvJRwzref
	qrSxeHOUW8WyI26jqDUhSMD8Hd9h+xHszL447ZloVGyNuT6kk6mCS8h/jp6pvJHphsQtFaBwyBz
	0dgoTQyzsPQ44tdyWvhc6zlVsz7Njat+xS6fmqeIdhr8jmBGaZbq35swQCtaWWHN/8+jI82FnH1
	s2SRGb3SqQr+PFHFQaPeQGe7wgFu+AI0b6UpInzipi3i1lZy9SRoCs1VTTCQIU9V5EE43LY7dcb
	/pkPjPYhQffWWiA==
X-Received: by 2002:a05:620a:1b8a:b0:93d:23b3:508e with SMTP id af79cd13be357-93ebd0c08demr190781785a.5.1791541612552;
        Fri, 09 Oct 2026 03:26:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8a:b0:93d:23b3:508e with SMTP id af79cd13be357-93ebd0c08demr190777985a.5.1791541612035;
        Fri, 09 Oct 2026 03:26:52 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf232sm3175313f8f.47.2026.10.09.03.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:26:51 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:26:33 +0200
Subject: [PATCH net-next v5 3/3] net: stmmac: allow non-linear xdp_buff in
 XDP mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-stmmac-rx-mb-v5-3-c38fa4eaa138@oss.qualcomm.com>
References: <20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com>
In-Reply-To: <20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX+NPl2pRjIJa7
 MiS9F5bQMqAH4Q63nSibEPATWCMsSzYpAzmbVkTBkoabo1xmQUUvXTbPl2VkVwoyuErzKj2D5TC
 PmOh0A4rppMiifwSGBruq6wuBTlOPylB21ZJJuLzgpLCV5EDW/aFCt38/hIPDtgaAhimGr9X76z
 PcP19Bia+wIyMH4UEccH6InPGRSxdzkd9r+xcUefyWPnhDhrnOOL4Zm+w/fXPavZreS10/SFVYA
 vTLj7DHmBngfGC7zo+qLBfwAtxZJK8Skny4R7zVyxpfHtaC2xOtCRO50zgaGGswtO5ec9dks6jB
 MgBCi2gT3L7VUjU62psiQu0zS/UdM03Z7TLeIB01CN0WSFBe/QlmQVrMrhsNW4PFR7ZFGMAKVXc
 72IyasAwMJhdYcNgRiV/5cfPs7qnETG5vjCWqp09ayTtXGzWC92AsyAVQRuU+t71YqqZ3NgAZrI
 TtY/R6tis1ZlJ0Re40w==
X-Proofpoint-GUID: U2AIemh2_F2cCrdd95cX4cVmC8htooJs
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8c16d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=o4XRzpSnRLoaN3dIwwgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX5nR8kFhmyQDs
 gEClIcUod5qqoGl4jPpTrerNv4psCLSFmmS4xGVJGBA5KrRAi7VAPl1hO04LnLaa9RAne0iRj+I
 8mpoDRb7621EMlnehCULL3v+uZXp6YI=
X-Proofpoint-ORIG-GUID: U2AIemh2_F2cCrdd95cX4cVmC8htooJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_032654_560090_E3C92B1E 
X-CRM114-Status: GOOD (  14.72  )
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

Since the RX path now builds multi-buffer xdp_buffs, XDP can operate on
frames bigger than ETH_DATA_LEN (jumbo frames and scatter-gather
frames). Drop the checks that rejected attaching an XDP program when
the MTU is larger than ETH_DATA_LEN, and that refused to increase the
MTU while XDP is enabled.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  | 8 --------
 2 files changed, 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index be2cba8fcbc6..cbeb43011c4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6351,12 +6351,6 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		txfifosz = priv->dma_cap.tx_fifo_size;
 
 	txfifosz /= priv->plat->tx_queues_to_use;
-
-	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
-		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
-		return -EINVAL;
-	}
-
 	new_mtu = STMMAC_ALIGN(new_mtu);
 
 	/* If condition true, FIFO is too small or MTU too large */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index 9af9e0cb366c..f6b3e8628a7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -109,14 +109,6 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 
 	if_running = netif_running(dev);
 
-	if (prog && dev->mtu > ETH_DATA_LEN) {
-		/* For now, the driver doesn't support XDP functionality with
-		 * jumbo frames so we return error.
-		 */
-		NL_SET_ERR_MSG_MOD(extack, "Jumbo frames not supported");
-		return -EOPNOTSUPP;
-	}
-
 	if (!prog)
 		xdp_features_clear_redirect_target(dev);
 

-- 
2.56.0


