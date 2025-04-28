Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEAEC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+GVsZWnoS5nmRtEMNMV00DrIRXTh5+Y65jXU6cuPT0=; b=dGtd3yhTukAuMCEnvR2GmhFYea
	M+/mmF8yZqp79Wbe29+1DRA05bQsn6iHvgQA+UlhUGIphfRDs6UQGMxaJVK5cJhYzSJp25YH5AiqY
	GKH6DzAL9SQjRDARbDjlw+8kj2CYsJbSE0/sAKuoRYNVdtbbf/IR68zFRRfFBYxjXUSfARUhpYwyK
	upNhrXbmgcHxyok1pe7Nlfd2BuoQBma2YGuvIcFyAiQzlSU0mckp8P2JTnKY/vG2KKAAyFs8IZV+K
	v+wNgKYIGDBqHJOalTrrgxvN5dl41eeRMIo3HPtsQJmvuRbErDexGnBCWcegLAXVjpzNR+kuHCwT6
	rVqFG9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nm9-00000006Dwz-2iMY;
	Mon, 28 Apr 2025 12:39:57 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NEl-000000065yB-35j2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:05:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC58bi3393345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 07:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745841908;
	bh=q+GVsZWnoS5nmRtEMNMV00DrIRXTh5+Y65jXU6cuPT0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o30MvfUpVOOWvdaeaNAsbGIIfBoFVS/pLK1CiYc5QzyJcmUtkv7gfGWDG8SUHpZDY
	 9RJhqMVbdevNacaVsdqoNvU5Y7gy3j45zG4ovjhbbQC+3q/r8NPswb/DlZD0vxGE8U
	 cj+qUeHdtWQDGMDQToJqR5VkfXRr/aHsOnLu63M8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC58WJ119440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 07:05:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 07:05:07 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 07:05:07 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SC57is098201;
	Mon, 28 Apr 2025 07:05:07 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53SC5687026332;
	Mon, 28 Apr 2025 07:05:07 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <m-malladi@ti.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 1/4] net: ti: icssg-prueth: Set XDP feature flags for ndev
Date: Mon, 28 Apr 2025 17:34:56 +0530
Message-ID: <20250428120459.244525-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428120459.244525-1-m-malladi@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050527_862946_007542DD 
X-CRM114-Status: GOOD (  12.53  )
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

xdp_features demonstrates what all XDP capabilities are supported
on a given network device. The driver needs to set these xdp_features
flag to let the network stack know what XDP features a given driver
is supporting. These flags need to be set for a given ndev irrespective
of any XDP program being loaded or not.

Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 443f90fa6557..ee35fecf61e7 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1109,11 +1109,6 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
 static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
 {
 	struct bpf_prog *prog = bpf->prog;
-	xdp_features_t val;
-
-	val = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
-	      NETDEV_XDP_ACT_NDO_XMIT;
-	xdp_set_features_flag(emac->ndev, val);
 
 	if (!emac->xdpi.prog && !prog)
 		return 0;
@@ -1291,6 +1286,10 @@ static int prueth_netdev_init(struct prueth *prueth,
 	ndev->hw_features = NETIF_F_SG;
 	ndev->features = ndev->hw_features | NETIF_F_HW_VLAN_CTAG_FILTER;
 	ndev->hw_features |= NETIF_PRUETH_HSR_OFFLOAD_FEATURES;
+	xdp_set_features_flag(ndev,
+			      NETDEV_XDP_ACT_BASIC |
+			      NETDEV_XDP_ACT_REDIRECT |
+			      NETDEV_XDP_ACT_NDO_XMIT);
 
 	netif_napi_add(ndev, &emac->napi_rx, icssg_napi_rx_poll);
 	hrtimer_setup(&emac->rx_hrtimer, &emac_rx_timer_callback, CLOCK_MONOTONIC,
-- 
2.43.0


