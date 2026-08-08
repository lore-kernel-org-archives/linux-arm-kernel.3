Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8E9C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akVGAgZib2CdSWpzF+niALVDAdDMLrO8tnmr+N8zhn4=; b=jXQQQQVvJjRpWdpEJzwdKSaFy8
	16PRh/J1OZBnWs8OHnbAiIX6OTj+t3nlVIDxWW52wIaEmdjv5dGk4f6gWk+mwIj6NIBozETxQjJI1
	+XDjUHfgy/vbknolrXKpPhcdKWzRp1ZbB80PwavzjvYWj9vR2Z+dD4nZvq3mx7lZoBntu/UsT96Zd
	GYbSeOxWdCDMg6rg6ptXuOtNTOPmtbfDiSDEZqRJbF4tyPwe9DQ8XuO/E0W+BIHJ7I6O08gofpLif
	RT2iqnhdbAHE78wlHoKI6uXQ3Df6d6TvPnTOIPi5wIfcxIQ+ul1eucO+Uvinp5PsW73n9souw6oxY
	JhQsC8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskkd-00000009YFJ-0yoV;
	Sat, 08 Aug 2026 17:22:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskkZ-00000009YEs-2tOA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 17:22:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GmNW0651040
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Aug 2026 17:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=akVGAgZib2CdSWpzF+niAL
	VDAdDMLrO8tnmr+N8zhn4=; b=aK9wCVMJ7GAy1foQFvWPl5DIEyhhOLeadNtvBe
	JSbMqaTiaddyGRn9rmM3d16CK4TOakauf7WwKtGqkkPXZmepQ1N0eqNtxfbFGFx+
	ZegjGv5vUYZyVlon0EBEbbtyBGBLCyTE1MwLRJHpSOMd7jebrYgIBsDajphkhRVw
	CUlWQiqtsoB1Zy4XsxcrdkD6e6xvgr58x36lIyoaYDatjC19cmVbw2R8ByuPXw0N
	t2ffbV+XOdmtQDnGTBRHasOi2g6qdCrCuKM1HAxuV28IXxvtFgDcPMl4mw1loIVm
	RF7N+WpsRK6kfli1az0AHTp8IgU2ai1GHzwXPlBb6Tomz7Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1y9e9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 17:22:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so6008511cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786209742; x=1786814542; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=akVGAgZib2CdSWpzF+niALVDAdDMLrO8tnmr+N8zhn4=;
        b=KDBZSZhXF/D1Qa7NOZSP0wjLtg2BULxtfiWwuOqWuDBv/H+TyH2paRF4F2o2S4jPLE
         DOmNRqnSVPsRTNcLCzJa0M7UCoN48cJGk8JLPq/X3Gz8Byu/S5og2teJXPGQgFtvFNXF
         OjAHZYQ1+qsjOxWCqcNmM+F10cpBuSollWi1I7QWupCEyFSxw392ssX/JButVsKcdV4i
         ux5yvfDvc6VThaj8ifJ2AtOugQQHxFN+Bomm4uBiqavklTLfHNPG2ZQd8xm7MPPvwaVg
         XwwIdlPSABveZ4gmpvJkRa95Bs+h6BlcKtgKZ6UqDalJxlI+eKwnZUI7EXFVWHf1PATp
         RtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786209742; x=1786814542;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=akVGAgZib2CdSWpzF+niALVDAdDMLrO8tnmr+N8zhn4=;
        b=cMfpLEVHxC2zyJSkdokE5iPGlD9pRLrZb2Cd4G47QvYYLHnnKAxkOE4DpMEmbr8XfM
         c6NmokKMb6TP2D1rf/HS9yF6Uf8ZrEa+wCDzRF6Q0N7OQVCYPvbSXrhFVzhCaFFW6W10
         q9XBfdcNXJWXg85P2zt+N6Ze+hfF+ntZwBAqR9wX0tYpTOz8bGuxgLOmDHNGRg1QExMl
         gXcYuFFsDmojYN2FRbNtJ4pIwmQiKLgJbjhRd7rW5qQDdnP0kjk2vpz1/bnabAqaC/xW
         cz47tehPFQaGx6NUgdq4ZwlG9I2+gEyuGzLBOuh6IpPdcsNn/8kXzzhG645/VVQFtW1R
         6ssw==
X-Forwarded-Encrypted: i=1; AHgh+RpCkudv7DXIOx1o62DyegUSy2dfqIhqZfN42a2+Dbi5eZ28yWHClxnK5EPfRTpTWXQrXS+uhWeqhdr6uAjIwWT0@lists.infradead.org
X-Gm-Message-State: AOJu0YzEejtagCor9gJIlpLyYOYHBSpneNFRrmQ4VgK852A3HSLsUwEp
	2IKUi9IqFgMBOAvScAkjHFDkgKQZ6/wQE3WGQ/xkzfuwBSVtwVRNTnkI6aCaWSl9RqLYcIsqi2u
	9F2GtWvIm+I93MeneYzMnB/Jt8U0uqtMUXWJf7puh9n0oOEDDr+vfEwOPBNRHKNRsMTS7oN0J09
	MQDQ==
X-Gm-Gg: AR+sD13A2KHi9aOpnhwTrkarbA0zI+B2zbl9L+3HmmwUtA/6kZorU1ADIRFpgoym8kl
	uDyka2tzHn4Ohq5U5QdwHr3nI5HDVw6LjzfpzcbbIwCa2XwC0bJ3mYn1mtj1epPzsNtKZo0aXLX
	DdtLeQA3uho0aKHGldMCMyBGbKO080PuiNt93cw9MnuvBtRMvwXAPNK88TXQXErG/5Z2DpFvNFh
	XV0HKHCTHmrOIyQAEwoQOJV/+2erDZxvmoQSZcxGgg2HmnsQgcUzfKQ0EE1Csey2XDG+3iecMVL
	5yCqxijqXuiHrniuskBW93Hpb9IpoXGuJCcNjfJL6l6esB9CAwu8LaYYflpLox/2EY8n/mh0uWr
	HleTHNSMkFdxJjqU=
X-Received: by 2002:a05:622a:407:b0:51c:1132:c80d with SMTP id d75a77b69052e-52d20a165b0mr103068031cf.28.1786209741653;
        Sat, 08 Aug 2026 10:22:21 -0700 (PDT)
X-Received: by 2002:a05:622a:407:b0:51c:1132:c80d with SMTP id d75a77b69052e-52d20a165b0mr103067391cf.28.1786209741119;
        Sat, 08 Aug 2026 10:22:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145a2bsm16299970f8f.4.2026.08.08.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 10:22:20 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 08 Aug 2026 19:22:01 +0200
Subject: [PATCH net-next v2] net: stmmac: improve TSO/GSO queue selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NUQqDMBBEryL73ZUYrEq/eo8iEuO2Bkyi2SgW8
 e4NnqA/AzMD7x3AFAwxPLIDAm2GjXepyFsGelTuQ2iG1EEKWYlG1MjRWqU7pol07JaVVsLIHt9
 mR1FpfW+qoRRSQiLMgdJ80V/gKKKjPUKbntFw9OF7abfi+v8ybAUWWOqybupeDUL2T8+cL6uat
 Lc2TwHteZ4/7pLO0NcAAAA=
X-Change-ID: 20260807-stmmac_select_queue-tso-fix-06cc586d4022
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: kt8oUN1fq6dqKu9KjSg_uX853APK3imY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE0OSBTYWx0ZWRfX+UQ2s7xIPG0W
 lreZUUTiS71KlHwEhCOuAzN7WeTG2Z8zlMqGfyGamFLyy115bB2JmAgJGVBoqTtGMHiwoFXC6oH
 IEeMwNBwguCtsC1v81i4pnxu2aE5eY9CJXwh+MYGjZbe0PsSwUSX8KP4UAovR+X3t61nOsteg1Z
 yzoe0CyM75mb8wLKAV3BS0pIC6CnFReSvy6yLsJ/sPaGkikqIJ8/yXjYTmp24cJN4km61C70jQF
 b8IEEEjB4O9wY/V3JKpjS5qH3KJMukB7y4ynSjrKWamgeQunX+hnmq9TpcDptHi6QbiCCYDolqg
 vwqNWDXVoQgahKoJ5U5MwKLHS0HX42N5lMZ0+M4uXdCJHKdwR1AS5YKZIHbAgNSftt3vUdgv6b7
 73qiGmEmVWCZBohBTku7OIGruupHhf5YrWQTLTr2rNuDDVsA8J3zP1M/jbHHQC4jIChpCn9h2cE
 zsiwYTpSaijVsXJPMIw==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a7765ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OvAj1FvD3cEXO-Eea-MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE0OSBTYWx0ZWRfX+wDpsk2eJWsB
 U6lhm/fsEbnkCk+ng04/2OOT+1vDBmj8K7+PsYIWiUE7I1KExAkNtfrnTzUW3ytFyliJiD3/7/q
 IX+SJSssH8vIkAPUBDqKeJn+ZI0iB4M=
X-Proofpoint-ORIG-GUID: kt8oUN1fq6dqKu9KjSg_uX853APK3imY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_102223_926211_CDC10BAC 
X-CRM114-Status: GOOD (  18.07  )
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

GSO (TSO/USO) frames are currently always sent through queue 0 since
the driver assumed there was no way to determine which queues are TSO
capable. This unconditionally pins all GSO traffic to queue 0, bypassing
the per-flow queue distribution and any XPS setup.

Instead, pick the queue through netdev_pick_tx() and fall back to queue 0
only when the selected queue cannot provide hardware checksumming (COE
disabled) or, for the GSO types offloaded by hardware, cannot run TSO
(TBS enabled), since TSO and TBS cannot coexist on the same channel (see
stmmac_tso_channel_permitted()).

While at it, base the TSO capability check on priv->gso_enabled_types
rather than a hardcoded GSO type mask, so it matches the TSO/USO
capability actually used by the transmit path (e.g. UDP segmentation is
only offloaded on GMAC4).

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Take into account when checksum offload is not supported.
- Link to v1: https://lore.kernel.org/r/20260807-stmmac_select_queue-tso-fix-v1-1-4c4787bad02b@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..7a4bd0292966 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6445,19 +6445,21 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,
 			       struct net_device *sb_dev)
 {
-	int gso = skb_shinfo(skb)->gso_type;
+	u32 queue = netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
+	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) {
-		/*
-		 * There is no way to determine the number of TSO/USO
-		 * capable Queues. Let's use always the Queue 0
-		 * because if TSO/USO is supported then at least this
-		 * one will be capable.
+	if (skb_is_gso(skb) &&
+	    (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
+	     ((skb_shinfo(skb)->gso_type & priv->gso_enabled_types) &&
+	      !stmmac_tso_channel_permitted(priv, queue)))) {
+		/* GSO frames need hardware checksumming. Moreover, hardware
+		 * TSO/USO can't run on COE-less or TBS queues. In this case
+		 * fall back to the queue reserved for TSO (queue 0).
 		 */
 		return 0;
 	}
 
-	return netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
+	return queue;
 }
 
 static int stmmac_set_mac_address(struct net_device *ndev, void *addr)

---
base-commit: 8ac4255c1e0c83d2e1559a18b8918673116fc8d6
change-id: 20260807-stmmac_select_queue-tso-fix-06cc586d4022

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


