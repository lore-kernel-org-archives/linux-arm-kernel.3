Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185B0D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfFsXCilJAWJMiM7vp79c/LdD1Soku/0QJA8c8QwWkY=; b=1nCTZXSAY2smfSZztk4pM2P7gq
	FmyUYa+M1FJLQYlZlEfoVrkKTg/uLVUmNpkWwISu5a8vPzUxWyswrJDQqB2QFtoibztK0zbZUaK/1
	Pg3cFfghOoSs/Rawe3kj/BdjY/P9XzU6UUwmvZzbmsvRIJT3VZTaI7i1zkwNNV2JedivRalwQlEK0
	L7QHvm3bGE7+4kHztRxdQlRJfcyJvAip3zFptc0M1Rwk5gTtoK9DtxG7BDA1XpSWdVKxgZf15ylwp
	hKK9sSDCqYEyUTkl871eG93tPBDk8qaZ408Cb/kjLBZ3axKlEIwVfm4frn6FneYKmK9hW8S8bqtMS
	RkJdq2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ce6-00000002cG1-1Wk5;
	Wed, 06 Nov 2024 09:48:14 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cAP-00000002TIY-2zkp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:17:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HHux048286;
	Wed, 6 Nov 2024 03:17:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730884637;
	bh=xfFsXCilJAWJMiM7vp79c/LdD1Soku/0QJA8c8QwWkY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ArqnVZKWwG87Er10+uMO1WqEapkRMC14fbSvdzAA408LuPBvdsFGjZTgkvQanzSVE
	 Nv5SMg/MgVWvPbQ3LWwXV2/4yAxRQ30gNv5r4AUaktLOqEdwYncVF6DjlD/TElWsBk
	 A3iYrr1gmIcWcPS+LWACPuDzkJ+AxQFzJ/XdQ8GA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A69HHdg116859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 03:17:17 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 03:17:16 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 03:17:16 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HGNn081242;
	Wed, 6 Nov 2024 03:17:16 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A69HGN6020787;
	Wed, 6 Nov 2024 03:17:16 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <jiri@resnulli.us>,
        <w-kwok2@ti.com>, <aleksander.lobakin@intel.com>, <lukma@denx.de>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <horms@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 2/4] net: hsr: Add VLAN CTAG filter support
Date: Wed, 6 Nov 2024 14:47:08 +0530
Message-ID: <20241106091710.3308519-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106091710.3308519-1-danishanwar@ti.com>
References: <20241106091710.3308519-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_011733_869554_A7CDE101 
X-CRM114-Status: GOOD (  18.51  )
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

From: Murali Karicheri <m-karicheri2@ti.com>

This patch adds support for VLAN ctag based filtering at slave devices.
The slave ethernet device may be capable of filtering ethernet packets
based on VLAN ID. This requires that when the VLAN interface is created
over an HSR/PRP interface, it passes the VID information to the
associated slave ethernet devices so that it updates the hardware
filters to filter ethernet frames based on VID. This patch adds the
required functions to propagate the vid information to the slave
devices.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 net/hsr/hsr_device.c | 80 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 0ca47ebb01d3..9e64496a5c1c 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -515,6 +515,77 @@ static void hsr_change_rx_flags(struct net_device *dev, int change)
 	}
 }
 
+static int hsr_ndo_vlan_rx_add_vid(struct net_device *dev,
+				   __be16 proto, u16 vid)
+{
+	bool is_slave_a_added = false;
+	bool is_slave_b_added = false;
+	struct hsr_port *port;
+	struct hsr_priv *hsr;
+	int ret = 0;
+
+	hsr = netdev_priv(dev);
+
+	hsr_for_each_port(hsr, port) {
+		if (port->type == HSR_PT_MASTER ||
+		    port->type == HSR_PT_INTERLINK)
+			continue;
+
+		ret = vlan_vid_add(port->dev, proto, vid);
+		switch (port->type) {
+		case HSR_PT_SLAVE_A:
+			if (ret) {
+				/* clean up Slave-B */
+				netdev_err(dev, "add vid failed for Slave-A\n");
+				if (is_slave_b_added)
+					vlan_vid_del(port->dev, proto, vid);
+				return ret;
+			}
+
+			is_slave_a_added = true;
+			break;
+
+		case HSR_PT_SLAVE_B:
+			if (ret) {
+				/* clean up Slave-A */
+				netdev_err(dev, "add vid failed for Slave-B\n");
+				if (is_slave_a_added)
+					vlan_vid_del(port->dev, proto, vid);
+				return ret;
+			}
+
+			is_slave_b_added = true;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int hsr_ndo_vlan_rx_kill_vid(struct net_device *dev,
+				    __be16 proto, u16 vid)
+{
+	struct hsr_port *port;
+	struct hsr_priv *hsr;
+
+	hsr = netdev_priv(dev);
+
+	hsr_for_each_port(hsr, port) {
+		switch (port->type) {
+		case HSR_PT_SLAVE_A:
+		case HSR_PT_SLAVE_B:
+			vlan_vid_del(port->dev, proto, vid);
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const struct net_device_ops hsr_device_ops = {
 	.ndo_change_mtu = hsr_dev_change_mtu,
 	.ndo_open = hsr_dev_open,
@@ -523,6 +594,8 @@ static const struct net_device_ops hsr_device_ops = {
 	.ndo_change_rx_flags = hsr_change_rx_flags,
 	.ndo_fix_features = hsr_fix_features,
 	.ndo_set_rx_mode = hsr_set_rx_mode,
+	.ndo_vlan_rx_add_vid = hsr_ndo_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid = hsr_ndo_vlan_rx_kill_vid,
 };
 
 static const struct device_type hsr_type = {
@@ -569,7 +642,8 @@ void hsr_dev_setup(struct net_device *dev)
 
 	dev->hw_features = NETIF_F_SG | NETIF_F_FRAGLIST | NETIF_F_HIGHDMA |
 			   NETIF_F_GSO_MASK | NETIF_F_HW_CSUM |
-			   NETIF_F_HW_VLAN_CTAG_TX;
+			   NETIF_F_HW_VLAN_CTAG_TX |
+			   NETIF_F_HW_VLAN_CTAG_FILTER;
 
 	dev->features = dev->hw_features;
 }
@@ -647,6 +721,10 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
 	    (slave[1]->features & NETIF_F_HW_HSR_FWD))
 		hsr->fwd_offloaded = true;
 
+	if ((slave[0]->features & NETIF_F_HW_VLAN_CTAG_FILTER) &&
+	    (slave[1]->features & NETIF_F_HW_VLAN_CTAG_FILTER))
+		hsr_dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	res = register_netdevice(hsr_dev);
 	if (res)
 		goto err_unregister;
-- 
2.34.1


