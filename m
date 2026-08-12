Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177E2C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 04:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KdFIJwL/ItKbdlpitmpynsip1Jdt+5SlhtYQlqlCk0g=; b=y3vn9np8d5Ue55xWaoAJcuJwQ+
	BPKr8EAvYYR0wmBmlxh+u/+b5R1MZvMFdLSPNKAp50s5IznvKYzDsqmNGwMX4zvXUbx3Xem3oWX5+
	n2vNcdC7D/epf7I6RhVmA98iqsXKCEWVHHbM8gI1RKwcjvww/kRKvKIw0nWzZF/+TaFD2nS5+V/3U
	HRL5TUTRdYyOJeTUeiH2boPRrCaRjE2ePoe8R55ighOBmKy9SsmPjDu2QcRBhAIL+ZIRHdibN7kKf
	RDibbrbfayKtzaUQn5vtMbMtbZ9fc2Hne7PU3N5kwkVGzQspFp5kpETTdxPRF0Oyt5nA6vbhHOob5
	7qDYwC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0jh-0000000FPBY-3nFA;
	Wed, 12 Aug 2026 04:38:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0jf-0000000FPBE-28oc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 04:38:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C4V49B1991464
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KdFIJwL/ItKbdlpitmpyns
	ip1Jdt+5SlhtYQlqlCk0g=; b=dDGKzETudy29AjLkkhcrI3J8T/ooJ3pvWamvwH
	aZUQlH8jGMRBYkLFtMn/raO7fadcVhwKMxeuuV7MSztfP5u11IiyIO8HO/IMeSSs
	rvegBRhU5LL+tvgGSLgRy683dW4zN1LxG8T8mRuzHWt0vxtRKGVl2kxMDlu4HiDL
	TJnDPG7ITzrNvFPowflV2TkY2ePiTi4D2wp/hcKHlMQO4f5J/MzsWYO5VuBAz0CX
	dKgWC+8apkGrGHVxjJCdat0AA86TXXgaNRHyOhorBUkNaisfVotUPF4ZSPC9O1pw
	XuX37hLw06XvveTz/9ifCbtdvM52at/9Ee0+1wtcMxbNG3Gw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g3dwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:38:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacd6d37edso9775165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 21:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786509516; x=1787114316; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KdFIJwL/ItKbdlpitmpynsip1Jdt+5SlhtYQlqlCk0g=;
        b=Y9L/mh0A4GFgZnoKl/smRxgpg/tq48nPwe2FQQmmcYtWmbxlwa56smldRuz6YU+Pcm
         VrKwIzcZYdiGBvYJ+MKopJB5UXy2GgnnWjHENv7cI+9/UXKxdnXFmdQZErGA/YDLR1X9
         GuTuL5MRYzarJ5+zacUyTJK54Bf+YznlO1sq5dS0W8LYHBdWKzO0e+ICd2YtYj7X4my5
         x0eY7rYqnBPboVzB8vlMKNNa3iameQrjZrlkTQqNTv2egbGFn4M63HeDHR08dtszA0nL
         Sl5asqXibMk/yGfdXX+trWtgbp3xn6wACFRrGAhqVVXDRvbH1NFXYetIZWNrixt+6C12
         JSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786509516; x=1787114316;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KdFIJwL/ItKbdlpitmpynsip1Jdt+5SlhtYQlqlCk0g=;
        b=clieT4FD/fMrtbLziywkEU8YF8qrj/YjBTG58pxKJKyWoNcCWmwA8aLj/GP9GHo64n
         cqhqbS9ytkg7IPOIEK52nF7bJZuIo/mg/+e8k9SyJTAMdWbIWoS7rbQUaUV8IxJqtsH0
         53eXDV5mp1M2q/6mbmEd/dwXVAS6N87S29CDe/J2TMWwg9pSzB5q6z5Ens0HPCkj2Ugb
         NNnRnGzIvFpR332zW/ekvYGtwwPDOhT1Kr7bjsm2I8EU/g4OSWA1ku4gsXwVTFuT/zFN
         Ypfp6oLgLX7zZq1Loc/DmYoRslf2w1w7qs/V2Y77g8JqCXLGCZD1Imv41lwMSelmsrGF
         UMmA==
X-Forwarded-Encrypted: i=1; AHgh+RqkLPHewRxFrfdMdxacsodPiy02+zAQXDVdn8ryR0zRAVUsztDfagHkxUhc1GIZb9PHBDehpTidj7l/pTeGkND9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8LFt+lT+fW5LUCLHlCAlb5G+m3A/qOTWhJJZ3WZVbqHqpzueO
	lqRG5tvwPFvdhfjZQxePFPX17c8dzIcBDerkVV/1iUVBVKy3a+RJj7QBBjOufscCytSf0y5FcZg
	nNugz9xCDLRMtnP4yt4js8mMxJqLA7SzR3foNOTHdagmzZvCYF3Y8SBTzMgQ8oSMiZOiQYivpDW
	tGS2Yw6BiwsjT1
X-Gm-Gg: AR+sD13nEWWnIRAL3rbaMLuBHL1iUJ5EgIK2zm8Hka2ceEcXXz4/5lf4sbwY6qm6g6Y
	fAN8MiK5wo2F97RhhQo3gL+gX4JkxZilDRtv6+qMGnBsn8MmlbGSBo8Yq1NDOElGzWdyYZ4gqxV
	qCJU0jrhqT3uz0pBbql0k+d/BBTqVN8VgmHJM1V7IX+xWabEsi7mt5fKqUMDr3lAKdzt95SHvo6
	CD18a/PtjnCd8IKDRyxw4lEJdOrlm5b861/b2y0sgyTix8csWglQtYOS43vH13MkMn7xoUC1a48
	jdm4uVZEn4S/PV5dFtMUkIKd0vL7yeokhZJgjtAG8PQAvVqWz7eiUzofGQhrFBPas0b1OdkSGxq
	RCbyYgmqtKzwCGQ==
X-Received: by 2002:a17:903:320b:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2d3450e0539mr33371375ad.0.1786509515767;
        Tue, 11 Aug 2026 21:38:35 -0700 (PDT)
X-Received: by 2002:a17:903:320b:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2d3450e0539mr33370935ad.0.1786509515282;
        Tue, 11 Aug 2026 21:38:35 -0700 (PDT)
Received: from localhost ([4.43.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d352208fa5sm1111035ad.62.2026.08.11.21.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 21:38:34 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 06:38:13 +0200
Subject: [PATCH net v2] net: stmmac: keep gso_enabled_types in sync with
 netdev features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-stmmac-fix-tso6-features-v2-1-72c3b06eb8d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4VNSw6CMBC9ipm1Q0pDobjyHoZFLVNpYql2CtEQ7
 m7DBdy85P03YEqeGC6nDRKtnn2cC5HnE9jJzA9CPxYOUshWaKGRcwjGovMfzBxbdGTykoixc6N
 V1DeNJgml/kpUQsf0DWbKMBRx8pxj+h53a31Y/5fXGmt0Wt7rTvVKKHmNzNV7MU8bQ6gKwLDv+
 w94huD1zAAAAA==
X-Change-ID: 20260808-stmmac-fix-tso6-features-7fdc5e9448e2
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: OVnDDu0ngRvtgbWu6ZIQhvwH_vXzArJx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDAzMiBTYWx0ZWRfX3hx5uBexczfR
 TuxPqp268NCnzXKjHcOqrLKauogZMEKSZw6dsQ4YWLqCOJF6jV9ExBQCCqvyFpvWNg2xkdH/Grs
 D2DUW9tf+UWV1luaYyeWtqQ2+WrTM9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDAzMiBTYWx0ZWRfXyqZ0bEIu2Uup
 QbIXl3xWihRdpctbeJrDUnvvQVXXT7l4FY/Pv8fg9glyhgkEb10/i2WvoqSAuO9a70lU/ZDd2N3
 ewzsjPoKmLl4zpviEaYJPzUCX5c2B29gflMq652ActZ3wnwdVjus+xLFxN+/PWwTzcrsDU+Bcvn
 ooYycJei08Bs1j/7Eq+ixqZB9VswUBG71byUzeZnt32QxEDJ89FsaP961TGsxGb8447Yv39HAKw
 yWvdsrR2OZJwNFy/Ah/ax+bFjvz9sPu/tEdYyUisJP1/3o20RoJOWQ3GBrrWXBAGRMY1YVoMbvc
 00kDGGRVM6KCORffHfBhtOJYrvhkf3yitRNhnT2Rb8qbOe63avXk+K5t1BfhjMGti5v2MUAtaER
 9Jv2iynCtHkTD+q6J1cbF+4UbB4JG5KMTxSjRA2QTNfxLis/LuCCMUp03X4+wZ5HDmVReTSVflW
 0luyP1Ebp5DyuwOtKHA==
X-Proofpoint-ORIG-GUID: OVnDDu0ngRvtgbWu6ZIQhvwH_vXzArJx
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7bf8cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=f2H3biQdujjI0Mw2rri0Ng==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3uZi2X7aTxeIN_KhKxEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_213839_565243_89DA1061 
X-CRM114-Status: GOOD (  18.48  )
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

stmmac_set_gso_types() derives priv->gso_enabled_types all-or-nothing
from NETIF_F_TSO, but stmmac_set_gso_features() advertises NETIF_F_TSO,
NETIF_F_TSO6 and (on GMAC4) NETIF_F_GSO_UDP_L4 as independently
toggleable features. Since netdev_fix_features() only ties TSO6 to the
checksum features, disabling TSO (ethtool -K ethX tx-tcp-segmentation
off) leaves TSO6 enabled in dev->features while gso_enabled_types
becomes 0.

For a TCPv6 GSO skb the stack then keeps the frame unsegmented
(NETIF_F_TSO6 is still set), stmmac_features_check() does not clear the
GSO mask, and the stmmac_xmit() gate (gso_type & gso_enabled_types) is
false, so the multi-MSS skb is transmitted through the ordinary
descriptor path as a single oversized frame.

Derive each GSO type from its own feature bit instead, so the mask stays
in sync with dev->features and TCPv6 (or UDP L4 on GMAC4) segmentation
keeps working when only TSO is disabled.

Fixes: 9edfa7dab811 ("net: stmmac: enable TSO for IPv6")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Fix possible race between stmmac_set_gso_types() and stmmac_xmit().
- Fix fixes tag.
- Link to v1: https://lore.kernel.org/r/20260808-stmmac-fix-tso6-features-v1-1-f82b17595052@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a71f0df26378..df3549f55741 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4371,16 +4371,20 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
 }
 
-static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
+static void stmmac_set_gso_types(struct stmmac_priv *priv,
+				 netdev_features_t features)
 {
-	if (!tso) {
-		priv->gso_enabled_types = 0;
-	} else {
-		/* Manage oversized TCP frames for GMAC4 device */
-		priv->gso_enabled_types = SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
-		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
-			priv->gso_enabled_types |= SKB_GSO_UDP_L4;
-	}
+	unsigned int gso_types = 0;
+
+	if (features & NETIF_F_TSO)
+		gso_types |= SKB_GSO_TCPV4;
+	if (features & NETIF_F_TSO6)
+		gso_types |= SKB_GSO_TCPV6;
+	/* Manage oversized UDP frames for GMAC4 devices */
+	if (features & NETIF_F_GSO_UDP_L4)
+		gso_types |= SKB_GSO_UDP_L4;
+
+	WRITE_ONCE(priv->gso_enabled_types, gso_types);
 }
 
 static void stmmac_set_gso_features(struct net_device *ndev)
@@ -4416,7 +4420,7 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
 		ndev->hw_features |= NETIF_F_GSO_UDP_L4;
 
-	stmmac_set_gso_types(priv, true);
+	stmmac_set_gso_types(priv, ndev->hw_features);
 
 	dev_info(priv->device, "TSO feature enabled\n");
 }
@@ -4766,7 +4770,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		stmmac_stop_sw_lpi(priv);
 
 	if (skb_is_gso(skb) &&
-	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
+	    (skb_shinfo(skb)->gso_type & READ_ONCE(priv->gso_enabled_types)))
 		return stmmac_tso_xmit(skb, dev);
 
 	if (priv->est && priv->est->enable &&
@@ -6198,7 +6202,7 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
-	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
+	stmmac_set_gso_types(priv, features);
 
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;

---
base-commit: 7b53449540502cb21b32bca62a6258e22cd97bbe
change-id: 20260808-stmmac-fix-tso6-features-7fdc5e9448e2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


