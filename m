Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FBBC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AkCHfC41wPyIPhNPVFyOA62GFwV2gjFvUh4M3ly7uws=; b=pGNj23STtcLUYSX4O3PgY/CFBa
	jZDjmvACxWH8qTQEna2deZtJif4Kja740F2jQC7gYPrSWWczmesjeR+ctzeFJ/uSE8Mj9HMYJ8607
	4VsAxwwZlRJBk9S1PBLDC2Ymzz/hMkp+KfHLMkaGXl5ewA3Sf0RZd5gfoTfv0s/tTfNjHIt2RJwXS
	PreC8hBgD+kDBNrNhB1JfpmLOUO38EvqJfO/X+uvG4mGluGowsZZmwt6eIozk0vRPW/HEUOplAYiR
	CuipjCDSFDQEvG07Li4fFY61WfvSaWHcLzm/VHutSc+BeoFzX5hPQmdUIHYPHdpjoSxheZJoOqr3g
	8XaBwW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Jf-00000002bcH-01rt;
	Mon, 14 Sep 2026 07:41:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Jd-00000002bbt-0Dpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:41:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7S2c73351621
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AkCHfC41wPyIPhNPVFyOA6
	2GFwV2gjFvUh4M3ly7uws=; b=IR/lnCNb+Z5gL/js+SLokR57BNDv2zkYuxQCro
	K1zGpAsoxG891Kd5fODtxDP761szeAz33WfQHhkZdpk/9G0ti5wMGPPIiDiJENpu
	OqjG1gL0pozmJ6Mrl3pJx5BMMYWePjXlN3wi46O5ke3hX/TMiYM+pPkLAG65eNuM
	t55lxTz/zEKgUOzAFoh+XTMZ+5NtuuXt22zzcxD3Jfu4pKEql0qfiWUXemzkSS4o
	T8di/A5GL6bV/oVx7QkTiA4wWTb7kCuD+e0LkFf9AP4ijO91uLV8SIxo2hzH8nwP
	T9nAYjuLSaUTevTwW7yriTDdhnp4CUE1fX4LvVxjSBrSMEIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg01ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:41:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91214e93c2cso41455086d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371683; x=1789976483; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkCHfC41wPyIPhNPVFyOA62GFwV2gjFvUh4M3ly7uws=;
        b=AExIwOLB/YG206RayeiOYLQ1fKaubbsuvzPGIkknVhmAl/c28bmpAJzO+CkmTKzI9d
         DdyOanpvdGRYUh2eFilITz0XXHC+LvrgfH5LCJ/BBZaf5BUNsdr3EW0JtXlAYdrrqL2J
         FEC69S4aS2qrlCSj4tCO0nU0JJjfgAAHz56RocTvSeMh926JQS8HxhFGX7MzIs7DCmzT
         S7f7a68f+fGBd9YW0myCkumZIGLQc0g/9evxndqrqNm6lTBWSo08lYSFqkUMJ8zOIfZJ
         DdkLsmjo6cauDnYMLtAdOvUqcmoMDYR4iPqCzcejHM0SkoLMDOz8/X7mFX0UUX6eIEt3
         CH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371683; x=1789976483;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AkCHfC41wPyIPhNPVFyOA62GFwV2gjFvUh4M3ly7uws=;
        b=ih5pgcseyJQPsv9Y2bR9udtmmC0RpFxNDmTMaq2zrqZMqjk4z772EV7qm61pZrjgPT
         e0IYsFS4XLzVfoRV5Irr0MPZXlOloxoNe3h939+WxiM1b/p/YGTA9yzEh5kJuaA3FYrl
         AjEhAQWobK1ToR9nuPnYpe+UeN/zWMidHNHfA8CjzDrN3QuIVswoPsdHjsrykXlDry1g
         4+zU7wlp2sxsjZJ8y58xuaG8ONDiwWcX6xdvfza9A7rGMH3v7tQirTSVI7NIjfXORfD/
         ATxkZNfLssr2fGP5QamudEfxyF49eOoVkQMkmOOXTll4jhxm1LSj0fmn6iJj3jxHUFkI
         Fy6g==
X-Forwarded-Encrypted: i=1; AKwUvByqReAxieN9e0SNhv2N9aQ8u1Gphn9uXXqz3WEHIvmKQt4U2z17FdDfERLyLYZ7r/AfTsOnXfThHGdPw+SZvNpW@lists.infradead.org
X-Gm-Message-State: AFuF++kRTEZHtDB2FbYNjPwLXCSU/m5uZ81k1PZVNQUWVsAuXFC3rrXL
	d1bCe2v+Xye8BoxammlIc3lKYiKnIXlatHsGzxmLLkqeMYlI+mYT3unTPeAxpq21fmyQ5lx20X0
	bTIvLnY+32Jx5NUv3lSn47kb7zBsILs5AyCo2KrPJcI/2M+eaJMiMaZoJ7PF42B27b5raHWaLj4
	llIw==
X-Gm-Gg: AYBFou2yJW6p89Npa7NlXzduxDjlSwF3+1Vei9kDvANTxrCcwC5/epm1XjwErpN5gas
	FeKqF/OLvGSkEWGG2/eiuv3pgVATkNbAETm3bQVw+s3vKHQoOTrPFyS8oIVpEEz8Yyllf2E6XSZ
	/lMOByVgJ8f55ZrClAx2YcQU3dvkZ1dxcdbisLFNLC/RxA8GehLO2/GxEbP0nmbdZ6+Azk9vGIy
	/plW/1j+8qN0a60x4AP92UdoGK/ho9J5IFEZCG50tqShv4yeJ+FocaD5UfZXyjWbbyTVHYbe4e3
	c4tuaEh6y1qQdM8kDuuf3J936LDPsdFpkFI8x5R1EZDONGHwFklLJYrf9T9kcL23+LFdnw9h8w7
	b6l8OGXbLdm8y0Q==
X-Received: by 2002:a05:620a:4885:b0:93a:14c:32ad with SMTP id af79cd13be357-93a29460140mr213423185a.0.1789371683496;
        Mon, 14 Sep 2026 00:41:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:93a:14c:32ad with SMTP id af79cd13be357-93a29460140mr213420085a.0.1789371683026;
        Mon, 14 Sep 2026 00:41:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ebe4sm21213536f8f.14.2026.09.14.00.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:22 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 09:41:07 +0200
Subject: [PATCH net v2] net: stmmac: do not overwrite phc_index when no PTP
 clock is registered
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-stmmac-fix-phc_index-v2-1-bf3d90373fe4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/31NSw6CMBC9ipm1Q5hRMbjyHoaYWgZpYlvsIMEQ7
 m7DAdy85P0XUElOFC67BZJMTl0MmfB+B7Y34Sno2syBS67Kmhh19N5Y7NyMQ2/vLrQyI8mjo9p
 aKc8V5OqQJAe22RsEGaHJYu90jOm7XU20Wf9XJ0JCroTEtHw68PEaVYv3x7xs9L7IAM26rj9ES
 SjbxAAAAA==
X-Change-ID: 20260912-stmmac-fix-phc_index-1ebf19cce076
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gal Pressman <gal@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Carolina Jubran <cjubran@nvidia.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7a524 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=Ikd4Dj_1AAAA:8
 a=8J_TXdTtfbox2WkpGzYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: dxyIGzI8CNQ1M6bTTY91bdkJWmmXrykT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX2+JCAnw+hijn
 z0elBMt//s9TV50ckoTMFQrGE9wFQOxaSsinAfH5JeC233IEbJFoGIE6wMXA68HRMSc1Cb4sKf7
 oBT7odr9oBalujIwxdc6ct/412af0eM=
X-Proofpoint-GUID: dxyIGzI8CNQ1M6bTTY91bdkJWmmXrykT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXz7Z/oWx2IMu6
 l+0dmpQNhcYhkD3Zk4Qye92RsZiL55KCjgadPmaR9BCw5yoDkztwhYP+BElu5QHQokXODat7Hq2
 eA7m/myA0zwuVaNGE83xPmLAXvfrUaBEewFoUJNIQKqVhb/F2KpplCJYZt822YRVAHKxzOaV937
 UgWzl2cGl9LkB+Q++aUe8L4xj58K6I1Pjt4mizHthIfnl5QzwhT46umDKKGkbmvQUlRTEpr+f6l
 05w7p8Ztt6f09EKhVN7ycmJhUBsVOFnGhc67GlxNdtIzH2OofoDjKS7PFmaVh81qIa7gZWbM8Xb
 7sFbSgMRXFJsqZSEX/fP4b6wSWOMO1i+6qNAZoLB34QLtWNpT/21UICL9egaFM9Woi/0nmoKhnA
 WjzdKhFp7ROqyJuhCLyQUzAYbPyyVx2FV40dbxXVn2cm5PmbzUJ81wc5ryDpfp6uWkgjnCOD5cQ
 yhIR9z1j9tsEpWtwdxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_004125_102489_993DAA2F 
X-CRM114-Status: GOOD (  15.59  )
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

stmmac_get_ts_info() reports phc_index as 0 when hardware timestamping
is supported but no PTP clock has been registered yet (e.g. while the
interface is down). Zero is a valid PHC index and would make userspace
resolve the wrong clock; the absence of a clock should be reported as
-1.

The ethtool core already initializes phc_index to -1 before invoking
the get_ts_info callback (ethtool_init_tsinfo()), so just drop the
erroneous assignment.

Fixes: 9364fa7fcf12 ("net: stmmac: Remove setting of RX software timestamp")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Drop phc_index assignment to -1
- Link to v1: https://lore.kernel.org/r/20260912-stmmac-fix-phc_index-v1-1-26e1ead25324@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 154cc0c7623d..1be5310ca766 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1016,8 +1016,6 @@ static int stmmac_get_ts_info(struct net_device *dev,
 
 		if (priv->ptp_clock)
 			info->phc_index = ptp_clock_index(priv->ptp_clock);
-		else
-			info->phc_index = 0;
 
 		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
 

---
base-commit: 78445023439506ebd83b86d40b1e428a3b309d4a
change-id: 20260912-stmmac-fix-phc_index-1ebf19cce076

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


