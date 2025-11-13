Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F65CD5BCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SDb3IoUnYaa9Sf7IDgbAoj6rH/TButYUORUNpr7JA4=; b=rAyeVL5BH0Ktj38Mv6APoiZRbF
	eVQNiMxNc3W6g2dnPBJFYN6uTDhhNhFKsrlevUbmsKqsuY3IF3YOA3pSik07GfqWRffuUGcdDnFI7
	gX9kQqaRBDWKTxUfEdDdgjp1DVmTaqr4ZsNhvbCxMsI1dSsRQCRYmIPqXff40LQAY5Z2pr2U4XYJA
	vbOgx+olUExAtY0h5W1M2kphnqOkgU52M9d4p7XJ0G3DQRcXrKaHzu4baOrq+7n17W+FvWK8aFxZw
	IULv1C4g5y8F+8k/g7i1jPpr8iVtAvXbBz+uBYRCXutU43G79QddQ1yQ0OcRiYuqEW9YCtX8l4PpJ
	cojNRveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVUH-0000000AO4V-0wl6;
	Thu, 13 Nov 2025 11:27:37 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVUE-0000000AO3d-1EF2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:27:36 +0000
X-CSE-ConnectionGUID: Z4y3QjuaTqmsgxq+sukCIw==
X-CSE-MsgGUID: ehtI6f+7QGGN6QAhnXukJw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Nov 2025 20:27:32 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.175])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 25CC7428B0E9;
	Thu, 13 Nov 2025 20:27:27 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	boon.khai.ng@altera.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net: stmmac: Fix VLAN 0 deletion in vlan_del_hw_rx_fltr()
Date: Thu, 13 Nov 2025 11:27:20 +0000
Message-ID: <20251113112721.70500-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
References: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_032734_440303_5558FC66 
X-CRM114-Status: GOOD (  13.09  )
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

When the "rx-vlan-filter" feature is enabled on a network device, the 8021q
module automatically adds a VLAN 0 hardware filter when the device is
brought administratively up.

For stmmac, this causes vlan_add_hw_rx_fltr() to create a new entry for
VID 0 in the mac_device_info->vlan_filter array, in the following format:

    VLAN_TAG_DATA_ETV | VLAN_TAG_DATA_VEN | vid

Here, VLAN_TAG_DATA_VEN indicates that the hardware filter is enabled for
that VID.

However, on the delete path, vlan_del_hw_rx_fltr() searches the vlan_filter
array by VID only, without verifying whether a VLAN entry is enabled. As a
result, when the 8021q module attempts to remove VLAN 0, the function may
mistakenly match a zero-initialized slot rather than the actual VLAN 0
entry, causing incorrect deletions and leaving stale entries in the
hardware table.

Fix this by verifying that the VLAN entry's enable bit (VLAN_TAG_DATA_VEN)
is set before matching and deleting by VID. This ensures only active VLAN
entries are removed and avoids leaving stale entries in the VLAN filter
table, particularly for VLAN ID 0.

Fixes: ed64639bc1e08 ("net: stmmac: Add support for VLAN Rx filtering")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: none

 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index ff02a79c00d4..b18404dd5a8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -122,7 +122,8 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 
 	/* Extended Rx VLAN Filter Enable */
 	for (i = 0; i < hw->num_vlan; i++) {
-		if ((hw->vlan_filter[i] & VLAN_TAG_DATA_VID) == vid) {
+		if ((hw->vlan_filter[i] & VLAN_TAG_DATA_VEN) &&
+		    ((hw->vlan_filter[i] & VLAN_TAG_DATA_VID) == vid)) {
 			ret = vlan_write_filter(dev, hw, i, 0);
 
 			if (!ret)
-- 
2.51.0


