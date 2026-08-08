Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7611DC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IVuWzrtf/RLqHaO1jhaG0E05SMtt0qVsGUroudHlfw0=; b=qYCAUsSorV0kRgXFPkHvKnPeH0
	kjbgLhWfX/QHoIZyHSjHc8xlbQYLLx5jRL7a3Umek4Ft6wPVlJ99g9WAncl4zTs3FP6PJ5jFMzFIm
	Y8HnP093I567V3lATbGLtO1FujcmPoDORoz5IzCRE15qne2zcNQU7hcF/PLgRp6qaOFEmuBFkTYOw
	f38Ee2TYRfLUeUQY+noMX+HGl6EvQ1Masm3lZXMjwKAckc9D3g+YvBsZbcSj02Qgbjqr5nh1qNR61
	N52Ph3hAnjOaYNhrCjpza+H/TFf0oQRGgva2bEAnPbjHcf5MlZYrSXE7dQMQDhCyq8fv7gMXDYjpT
	6ZtpCRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wslLc-00000009Z6C-0z0b;
	Sat, 08 Aug 2026 18:00:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wslLZ-00000009Z5h-33rT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 18:00:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678Gm1nc3812789
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Aug 2026 18:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IVuWzrtf/RLqHaO1jhaG0E
	05SMtt0qVsGUroudHlfw0=; b=XzNmG57S8qVu5/ei/MH9cPykLIB8uXlwVXyejm
	WlG51iKnsWDui5Z7Y1to4w5+hwxy4KVLzghEAOoAC047H2LwQeEE/LmSJ4KXpgYG
	nV3g+e6SidsV9WcunRCftwJ93K4SE5OqbUor6tkVEoCrTC9uUFpc3pK75Jec/0NK
	pYzG0PcSpVcomEHp0FRtK7HrP7qo8kXdAeqMZnslWXm56fgrJO4S2bn0lG/uXdLq
	YW//70gNUabo5uKUZ4hsjtrt50SOp3SUFVHjWgQbdpGhSewLTd93nzwjyuQEWGR/
	LgNgh1gcut1LCCV0VLVs6ctJkrpSfI9BmHRbntXIJAmkOIQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgsabt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 18:00:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283fa0656dso38276551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786212036; x=1786816836; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IVuWzrtf/RLqHaO1jhaG0E05SMtt0qVsGUroudHlfw0=;
        b=hg9SsfWMs3Q9AZLyhi+hsXNy+G3zXci8wolW6g29ZXXnsRJNIqnxdKysPP9qJFu4c2
         kPdh/gF1sStxLRI9qZGaMWJOlT44lbeBx/YdKUdsp/X1LX3W1pN8NevR3eCCST+l1JkE
         n0nWOT2joc1Vd5NRHejflfzhsqouLKlvhxAEUVB1YzXSCxjYD2uTcOQPGCsYhJT7SXac
         SXkl5zev56zq7wyUIPy9eHXtGoSkabBP0MdKG8r/fRPn6sKF7nQqZTexgIX8KB5++3DM
         Cv/UpANqq7oA3gdKEJc6YlAzzdDHK2dxmLJRzpcyY6DM3h5XCRDjnblTRRJTbOtRhEGN
         q5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786212036; x=1786816836;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IVuWzrtf/RLqHaO1jhaG0E05SMtt0qVsGUroudHlfw0=;
        b=GEdnJOZ2wcB7pXfCk6g+9+sJPrKWpr8uqrcIbghQubygtOWWBUSvTTfz6j00P0PGh5
         WArRvvfxGxRCcO/6yBO/xy0ZVo/mfzL0FW2y0qAeS4c4/j3M4W4HrbftUmG9UAjSGqjI
         tYdD4qRddgQjaIz8F7GL5ejsuJruKfaN0TnYsAox3lzQq5sUnKvrsdHLbDchDcTMxccD
         xgsu5cGTnSBWqkmO4nspDsyO3mP0bw4EqmbMTZhMPhXS11gtCBAzvWCm5pdE8aYPAuzn
         eJ9hNwaPtqku5iukEKTlxqS0aOy0vdpTfkRYl8nICsvebYOJVkLE3cNtoWlXGiZcW+lK
         9O4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqGdIVjCCvOPeRCa0bd+AnyJ99Z7KdpoZd0wc9TnvEpv+gr97TqSPaArNzMFbxl670DrqK/dOhT+MyY67qfbRTi@lists.infradead.org
X-Gm-Message-State: AOJu0YyAs/pzFKb2JI9qieDHO004oa5D/NcBq3mox5zKWaNSi9+Bw9uv
	YC1A9M08it0uImdsbBsLeh90LhCbm39tJHFxzXv3nVdNOTAT9Q3S3+xTJjdl4edtMzI4TvcGpbR
	aAVSUB7v5eeUAh6Ei+a+OL5j+1pKpFgzE0EzAYlAsyA6nAcAgI6ymFVR8Edk1s8Abqonzule+Vh
	/abg==
X-Gm-Gg: AR+sD11VKjc7DYLBVEZL3ugi48TzAVLqwQyBzhXeDCShCQ/rUB+yPLSh4FWN/zktocO
	5uA5bdvs+r8hIL7jlNml5Hd6OmKTDVGRkKPw54LU171edMDHD7aYb1PAoj3akrmhmFdBF8IN2BH
	zYXQO4bjqCrFNI+vMoRi1m4+GCzZ0ekSy/BpHI+qNiuKImOUJQGdJPKsUVHzSAYw7Yb0P7cUKVa
	DGIsJEjqR1T/DWZU4MNGDaG4V+6Jz0GTLK8+1PYuqKPBcfIRUWaFa1LdiE6nCDtqqMMjcmjd8iB
	F0Ft68kaCNoE9/vil2A5bg+wgDYUuTF4ct8Zd9L4FLCMOFNSMf7sXdeeEoVQ5Ae20Rxdh1g1EsV
	qvlymom91Xy9llys=
X-Received: by 2002:a05:622a:53c6:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d23856240mr87301491cf.22.1786212035863;
        Sat, 08 Aug 2026 11:00:35 -0700 (PDT)
X-Received: by 2002:a05:622a:53c6:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d23856240mr87300571cf.22.1786212035383;
        Sat, 08 Aug 2026 11:00:35 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm137632185e9.4.2026.08.08.11.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 11:00:34 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 08 Aug 2026 20:00:13 +0200
Subject: [PATCH net] net: stmmac: keep gso_enabled_types in sync with
 netdev features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-stmmac-fix-tso6-features-v1-1-f82b17595052@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X27EIa1Kb+ivQQ4ovdg1GyaSmI/
 27wODAzBymyQGlsDsr4icqWKjzahsLHpwUsc2Wyxg7GGcda1tUHjvLnotvAEb58M5SfcQ49Xl3
 nYKnme0aV7vVECYXe53kBS/HbH28AAAA=
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE1NCBTYWx0ZWRfX2QJx4jzBbKVn
 3O3QjJyML4VMbe0/oC/EY2KaULTG/EsPtrc4sGEc+t5hbh/S/RqPVyEVk4qcQqtGj/Hk4vmZXI/
 ZxLo3ZJzQ2MjBCvnfKQQo20noORkkho=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a776ec5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3uZi2X7aTxeIN_KhKxEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: S2Rc0IedzaE3_rIxNs4n0dG7AtYKoiRX
X-Proofpoint-GUID: S2Rc0IedzaE3_rIxNs4n0dG7AtYKoiRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE1NCBTYWx0ZWRfX5b1Bo3LBpmku
 m/LzQdydix3XGXeJSwXn1MDZe7fBVZseFPUELbkN0T0vNrq8plh+tyYsgRzBC1tXKjr+obRI6wG
 gNFcl/kOXHWiFpLSqnTOneS8vNNBw5T7yIWP0Lqlb+rU0S9gcXmU3jLr5n256HHvhYKzzLn2kVW
 lfHN3mHnqTNJAUeD5gVfuVtlEVLiQef+u79nAVPI1Wq45MuzLwFdekpuh1SvQepTf7UeO9ZX39j
 wGoXXrjKiSVhd1ipHoloirFUXH+eTBGRuSKlE43b+L/mqot3UlAGisW6R5n8zN2xDLUvDRw2oVF
 E9w16k5DUcdGOk48/a/bp9aY2OZq2Q2Z4g3ZzkbU1pNDqB4KccrhlPLaZxxZrXBhM8LHeAg0S+G
 BvfZfdlX0uHTlScuQD5Cb5YvAbd+q/mBf4DuwMwg6LQnWy8r7o93Ge5ZMrCKfR+SVQQQZzQY0zB
 NNTXc4MwMUSBveZvxjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_110037_781251_87336158 
X-CRM114-Status: GOOD (  16.44  )
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

Fixes: 2e4082e4b739 ("net: stmmac: simplify GSO/TSO test in stmmac_xmit()")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a71f0df26378..3d3042afcdf4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4371,16 +4371,18 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
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
+	priv->gso_enabled_types = 0;
+
+	if (features & NETIF_F_TSO)
+		priv->gso_enabled_types |= SKB_GSO_TCPV4;
+	if (features & NETIF_F_TSO6)
+		priv->gso_enabled_types |= SKB_GSO_TCPV6;
+	/* Manage oversized UDP frames for GMAC4 devices */
+	if (features & NETIF_F_GSO_UDP_L4)
+		priv->gso_enabled_types |= SKB_GSO_UDP_L4;
 }
 
 static void stmmac_set_gso_features(struct net_device *ndev)
@@ -4416,7 +4418,7 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
 		ndev->hw_features |= NETIF_F_GSO_UDP_L4;
 
-	stmmac_set_gso_types(priv, true);
+	stmmac_set_gso_types(priv, ndev->hw_features);
 
 	dev_info(priv->device, "TSO feature enabled\n");
 }
@@ -6198,7 +6200,7 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
-	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
+	stmmac_set_gso_types(priv, features);
 
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;

---
base-commit: dd057113ac7ba5bdd2aed3d9405305911152f911
change-id: 20260808-stmmac-fix-tso6-features-7fdc5e9448e2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


