Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE512C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CsskcMB2dvjU+nJnFs1web3IeTOM4DlaOeuWxlSh7G0=; b=KSNj9NAhue9osK5MVLwmUdzTBx
	kszu8R+VJ1i+VVoknXknLRAANLYI7Ji7rsgCjpTu/VdBCfIz4qM2ajIwFa3rT4umfX3BifMjguPiW
	IWczcCQaB1ZCvPKgsCwDgdOgDwQ2TpfwWen3GrlsxlTqSwDR4zVsg3a9Opa6UyV4YnKulStPqF6nr
	Hzo86BEziMckM1iyHsMXaYP9uYbB7uOrpMhXIlNX4i4+t6TrilS/tB3mO7VG4fniFWYt8sJ3uJmff
	Evb/LI7LRxmwppoGJ/OtXchnvBiM6DXtjXtUnP6NC8BZsVc7uarHzrHSymVYmy4j1fW+LYX2N5U2y
	68LCa8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRT0-0000000GLjl-0rd8;
	Mon, 24 Aug 2026 09:59:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRSx-0000000GLjJ-2yHL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:59:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O994NL2448667
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CsskcMB2dvjU+nJnFs1web
	3IeTOM4DlaOeuWxlSh7G0=; b=OzqQnXk7PY3Vj89vH0FzXzO/QKzZHSFWwtgO5e
	n31jdTIsjDrXr8fPpg68OASzXTFSBd/Xr+n7auB6cJtb73c50vK/goekPELqm0HQ
	tMJLaWHMrIX10NemHdPMuiVst2RhBkgyyngVk558tN7Q5w+GTJCNiC2z/KCruh+5
	EO//X+MIiLN0kyPYI+gjK7ulgE8PQsZPf3N5usaXgYZNpAPpS89nmqr5q5KDzMYR
	9H53stiBKlhOQoBHmrgIainO26MAwG/UJqGDIfCLPbOiw4xOxDYKtaTzYNcl1Xcy
	XtwK0gW7rDR21IHmKcWnl7sPi8Hqe5PUmFGDC/+Df2ylhzuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0hbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:59:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so35404731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787565570; x=1788170370; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CsskcMB2dvjU+nJnFs1web3IeTOM4DlaOeuWxlSh7G0=;
        b=DgAJAGdPynZVaZEjPc2g5gCFEJN7WOHJ8r38YEd7ZYtGvp601ijkCVBLWNjD7MKTrt
         yw6MUBnq5nVn/eiXAxr2aqmhvLN36RjyJgJX3TxwBzy/lkthD3FfBVdV81nAc1p0izIg
         /D4rP1CX7P2csF8EHuQe8YHyhWMFYG/HULSFZwZWFeyCtYmnY/dqtMlh2oo97hCxyQaE
         9ibsum0lMP54ljr98SqPpYKifBNg6i95ktBhjmdUKwVDCJuyOCYMc+UJrK6d+2Vag17c
         UXU2xoMIZhGbyJ8xJ93E7TnIN8RV7zs/cWi77nK6kPJzvKdhBW9iQT36KW0C8te8DSw8
         FP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565570; x=1788170370;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CsskcMB2dvjU+nJnFs1web3IeTOM4DlaOeuWxlSh7G0=;
        b=pvv1Lac/ZV2Kcw2TcI2eisaWtVXC5qE7UqEpsXTGRAkbQcwSRAOQI5PMwAvEcD0Jx8
         yCrSrDix2l73rIqSLL9Px86TbDiYM65VgCAgYhdkoS7gFQdmDbOJnwSDf7uCPLOu1glK
         1+crbsMt93lNrGc9ZkFO9Ca6DG6KGHrvlw1xBaJeK6WEY78gBqp2kgyNsD+7nDszo2wT
         XQgj55/y5PjKFqYCnKm98i1v5huW2bfyPhZyssVwIk5IREJO4rHXsC3fTEtybmr9CEX1
         u1biKYf51H/2xQWK+LFRwtNE51EefyzF/n8Y2fkxkooA1KBHtJuvBvifQsW69V7VmmV1
         s5vw==
X-Forwarded-Encrypted: i=1; AHgh+RouLZNT4bzOkc85uSeh2VRKxvXdaM90ZMyooP/qrNvnyI2NxNurOqW3WgIVDaEbfOLDT+01rt0kkAUAbJsCoPaB@lists.infradead.org
X-Gm-Message-State: AFuF++lLE61Wn2rzdwOWLBik4g8E3ajJ9JH5RveDLDY0YmhKckLFX0jh
	XEDhhFgBZQbK7/kXBeZulbkoRqbvxFFiiLQK/k7EAHQ9pvDbF04GrnxdwcSl8121zDVF95HfLqZ
	UAfudxE8WTE2RySQKt9vGrsQsbDm285IKnruUfQtb1FGhg6JmRjzUQd4eQfR6WQu7FKoP3q4yAe
	EcRA==
X-Gm-Gg: AR+sD13I03vQIGIjGw2PPPLdVeiCrsUSubKP9N128+SlJluadjK9ayaQ/bhIdOEHqT/
	NymSvEWcqLy450xhrk6ninX0VMiKwAGL+zqr0u719l82eb7OxMVSVL9qiPns5UlSuX2o5+vdJ3Q
	jFsJJ8NKxqhQJBvc1/V3d95+lhPWB1tXrtehgo/7qly4BAyExK4tzeCQRIaPM433VUam5WRmq/w
	HfkGhBT6ISeemMaAByy0rtTMlKbcidCg/4VO4ri1wPyib4xp/HsD8uPxHB9N5EOXq5qm91we8qs
	u7ZlIwNA5BNYw3Iv6Bwe0et0ys7Dr0DPHcZZqAE+KDndftqYhJWhIgIXy7Ypev/x7dicBrOfHC4
	APj6m23yASfChF/M=
X-Received: by 2002:a05:622a:1315:b0:51c:b900:513f with SMTP id d75a77b69052e-52df5712136mr245717441cf.10.1787565570498;
        Mon, 24 Aug 2026 02:59:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1315:b0:51c:b900:513f with SMTP id d75a77b69052e-52df5712136mr245717191cf.10.1787565570104;
        Mon, 24 Aug 2026 02:59:30 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9cbcsm1315592766b.29.2026.08.24.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:59:29 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:59:08 +0200
Subject: [PATCH net v3] net: stmmac: drop gso_enabled_types and rely on
 netdev features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-stmmac-fix-tso6-features-v3-1-c73a7a4a0ec7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNSw6CMBAG4KuQri1ph1dx5T2Mi1Km0kSodgrRE
 O5uw8qF0c0k/zy+WRlhcEjsmK0s4OLI+SmF4pAxM+jpitz1KTMQUAslFKc4jtpw6548kq+5RR3
 ngMQb25sK27JUCCyd3wOmpZ0+swkju6Tm4Cj68NrfLXIf/ZcXySW3CjrZVG0lKjh5ovwx65vx4
 5instsLfHgSfniQvAZM0YkaO9WXX7xt296J0u4HHAEAAA==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX73Ekg3/79/QT
 Q31ynFGEDtnNgpMFQrDHF28QW/XlxG12JmFtmvfu1hnbJfnk1+0af5v8jzCF5rGBJTLDHxnpoe9
 Ejt6jgw+OB5WVg9CqdOt424wW1pUXxvbYb50neLcU5KFy6ZnV6DMsFc/THNnbs3lNJYyQ1IMYxn
 FH+xZiu9zu0uUuOkxQnuxd/BpKhkdynIfjvvncrLJ02rHRy2qdn6kevIyHoy7B7yWWsGqpc/b6K
 ZSI5qcNap7JKJkmmXku3AE5YMqQ3DHIgWyvKJqteV/4iiW8F3tDot1srZNzpolHjefIlEm99vXc
 Vp4cg3PvPC7ubFBwhdxCerxIHnfiiQ/ll5k7s+h252QUkQ57lhMfRSIKjg5Wz7tJPkx8iWT6MB3
 AHqpQreYvSgKdQMENd0EXoZ5R+UxQofjEjV1keZkilv795hZEtPg3plvbCS/7aMXMFQkODZMHKT
 dsnI4sb09S5v8oNnMcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX5Ny+n1rN1FVo
 QkuXhaAwQD5eSuRtUBcwJaBnrJRS8ucTiOBuz7+6MeGvLTjNAjlywowZo30zDhe/ChkBpJCeDS2
 KIOHtxbYV3wogLWOZk3Bzj69oxEhP7g=
X-Proofpoint-GUID: ROrVxYa0YzZapAKCUD4eJ1dMCdeIFJxd
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c1603 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v9nI2CDhc2Qv1RY0d5sA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ROrVxYa0YzZapAKCUD4eJ1dMCdeIFJxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_025943_872259_BD835E4A 
X-CRM114-Status: GOOD (  20.08  )
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

The gso_enabled_types field is used by stmmac_xmit() to decide whether a
GSO skb should be passed to stmmac_tso_xmit(). It is updated in
stmmac_set_features() based solely on NETIF_F_TSO, so disabling IPv4
TSO while keeping IPv6 TSO (NETIF_F_TSO6) enabled zeroes the mask. As a
result IPv6 GSO frames, which the networking stack still generates since
NETIF_F_TSO6 is enabled, fall through to the non-TSO xmit path where
they are not handled.

The networking stack already manages the GSO logic: a GSO skb is only
delivered to the driver when the matching offload feature (NETIF_F_TSO,
NETIF_F_TSO6 or NETIF_F_GSO_UDP_L4) is enabled, otherwise the frame is
segmented in software before reaching ndo_start_xmit().
stmmac_features_check() also validates each GSO frame against the TSO
hardware constraints and falls back to software GSO when they are not met.

Drop the gso_enabled_types field and rely on skb_is_gso() in
stmmac_xmit() instead, which correctly routes IPv6 GSO frames to the TSO
path when NETIF_F_TSO is disabled. This also removes the data race
between stmmac_set_gso_types(), called from the feature-set path, and
the lockless read of gso_enabled_types in stmmac_xmit().

Fixes: 2e4082e4b739 ("net: stmmac: simplify GSO/TSO test in stmmac_xmit()")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v3:
- Drop gso_enabled_types field and rely on the network stack to manage
  TSO/GSO logic.
- Link to v2: https://lore.kernel.org/r/20260812-stmmac-fix-tso6-features-v2-1-72c3b06eb8d4@oss.qualcomm.com

Changes in v2:
- Fix possible race between stmmac_set_gso_types() and stmmac_xmit().
- Fix fixes tag.
- Link to v1: https://lore.kernel.org/r/20260808-stmmac-fix-tso6-features-v1-1-f82b17595052@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 --
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +------------------
 2 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce0..7582fca63741 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -265,8 +265,6 @@ struct stmmac_priv {
 	u32 rx_coal_frames[MTL_MAX_RX_QUEUES];
 
 	int hwts_tx_en;
-	/* skb_shinfo(skb)->gso_type types that we handle */
-	unsigned int gso_enabled_types;
 	bool tx_path_in_lpi_mode;
 	bool sph_active;
 	bool sph_capable;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..3a956c8b611b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4375,18 +4375,6 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
 }
 
-static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
-{
-	if (!tso) {
-		priv->gso_enabled_types = 0;
-	} else {
-		/* Manage oversized TCP frames for GMAC4 device */
-		priv->gso_enabled_types = SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
-		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
-			priv->gso_enabled_types |= SKB_GSO_UDP_L4;
-	}
-}
-
 static void stmmac_set_gso_features(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
@@ -4420,8 +4408,6 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
 		ndev->hw_features |= NETIF_F_GSO_UDP_L4;
 
-	stmmac_set_gso_types(priv, true);
-
 	dev_info(priv->device, "TSO feature enabled\n");
 }
 
@@ -4771,8 +4757,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
 		stmmac_stop_sw_lpi(priv);
 
-	if (skb_is_gso(skb) &&
-	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
+	if (skb_is_gso(skb))
 		return stmmac_tso_xmit(skb, dev);
 
 	if (priv->est && priv->est->enable &&
@@ -6206,8 +6191,6 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
-	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
-
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;
 	else

---
base-commit: 7cbfb180945ce529608e4d4e24a6d483699fab1e
change-id: 20260808-stmmac-fix-tso6-features-7fdc5e9448e2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


