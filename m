Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884DDFD0659
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bJ2M3bRps9S808zgxOPJDGhJ442gDnGi2fsU/Kk5Rzs=; b=Szk2UUm2ZhKFa/kk6LxuK79Qi1
	GNMMFiQ1g2Hp+r0LRu1a3QOtby9EjAez9fumijc7pTr3YM0cv3O3WE3TDMDsH1+ZNAM0bqvcQPl9Y
	ZfN0zZrmZ/stm8WyQRraatqBQigZ1ZL5CQDPAg7PX5U3hIT9qJ9SxBbgGLkVoUd11MtkzKV81KDrV
	RAqu2roTYs9SzqHrjQBuItzhQPvUSPQjhSZq2WYafdJDsteDKr/CkfXgjLbs6aAj6FknZoLlvK6qX
	appmLlW1DGvVvLcpAzM+3qKMlKeFeqHweCubiEqdNjePM0rhmPSPzzc+UGb3lElbcGcQdgYxALRvS
	+HtiF/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ewn-0000000BAnA-1ym4;
	Wed, 11 Mar 2026 08:29:41 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ewk-0000000BAmo-3F0k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:29:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eC7wzMJmK7IUTZ6vCcN22xIVzlXpLyq/v08SoNZJGGfarNiLJTbrdVAG/GNYekl7Daa0T1JvQp9cgDR/PN4MpDy5fvMzcAjqv9E5rNovLO2VZZtEiBhDKKF8ugBRXu+Y+dxbHY6kXy0EamAJjWdPFLS7FhIz4Zd2Ig6Wfih1M+2X3MYuQd1IVav2gVboIt12zCHrQGaIY6t3aV28yhva6Cgg+vuuPygsu2t4wAgKybJNMY4FqDQqrKdxCz6cTnHij6G7gY7D9kzR4KoGHMfeHyN/BdHZLHnK+5izXaoCFBIFYOFYtRk3snchwvGPSCwN4jZ7GA0R5/LCFaTE2hBTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ2M3bRps9S808zgxOPJDGhJ442gDnGi2fsU/Kk5Rzs=;
 b=yvnhz/y/axiQZhv3FwV/FwAf8AEcJA3qNG4r22pdXYFRywP/pe56/ln2hdKIGSNLM1GPJUSou06Ghj5zd635KyZ4/WrNPjPpldvcbwfPOjDhx+qJiMR6VueDXx68twYiJBBYT4SkrE52GDjsEDlnPYLugsIgd4sUoD0r1w4kDpjM3pBK0CmsXoD8tlyu/okMKGhIn8RtgcFMhV+lKHfs+0FsJ/FmERXWQIryEA1xXQgRE9WsjFsvTsyYTzpPjne71+oU4EVo0xyfT9iMj86+GaZAZEiB0CC42AQ70/H2jRM11CBfdOBkcbQtTpsw30zS6vb9FFQIGtKLxQFjkskbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ2M3bRps9S808zgxOPJDGhJ442gDnGi2fsU/Kk5Rzs=;
 b=tOzrAUYMtTl2rdOjxIu/4Ht35ziGeV/Lgxx7gzALG9wu0+oDnT4Ouin4XVD17oFS4h+ChbX6xqdHL/TeX0AblFQ388SLuGmbS7qKF7ywx8nmFg6KBjBMbG6jXn97bYOhC3qLmHH5jv7RZEuL2sB70u3iAUnTxIedrn1V1NVFjyo=
Received: from BN0PR04CA0179.namprd04.prod.outlook.com (2603:10b6:408:eb::34)
 by BN0PR10MB4887.namprd10.prod.outlook.com (2603:10b6:408:124::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Wed, 11 Mar
 2026 08:29:36 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::a7) by BN0PR04CA0179.outlook.office365.com
 (2603:10b6:408:eb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 08:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 08:29:35 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 03:29:26 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 03:29:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 03:29:26 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B8TQ16509014;
	Wed, 11 Mar 2026 03:29:26 -0500
Received: from localhost (dhcp-172-24-231-152.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 62B8TPuu018584;
	Wed, 11 Mar 2026 03:29:25 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Meghana Malladi
	<m-malladi@ti.com>, Jacob Keller <jacob.e.keller@intel.com>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@kernel.org>,
	<danishanwar@ti.com>
Subject: [PATCH net-next v2] net: ti: icssg-prueth: Add HSR multicast FDB port membership management
Date: Wed, 11 Mar 2026 13:59:23 +0530
Message-ID: <20260311082923.2962937-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|BN0PR10MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d95eae-33e3-4819-a9d2-08de7f4853af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: UT12ob0TM9wzQCwAFnxkqC5Tn9Q8QIshQdsULg7hItyF+hgogTYo//sbqNbfoR63OlO7j+oO9o4v//noFqkyuJx0gt976YNuPBSjMbRbwlvVA5Y1HL2tRWEBf9pwL+O80z1fJ+axQvbLsH0PtQEAcPdLqZn+Fp6lSMMRQgRPElBK+0yLXYxP/gye5O37ZCvfPwtTc83/nMAJ0zGTY2uMkV50X9+Nw4U10vv9JIlGs6dFoB4aQ0MwRSwnsFppGpCzQuSMUAnpNIZ3roK/lc37UrirafqZ2Ixi8wK6sAZeTPXwpkalowhZYU9GNABqGGM5QA4GJJRgAP7axrVmPj3ggxtofezChaal1trKQCs+nKOBGqsvoRgzorYUybtC2/zQl6xOoJtNfcJt+9oqsw7zfTpNA5lbakVTZW4TN26SnOBSbukXHdFgbXKV0vf3FgZXMVTbBaigiCjzLpS13Hvt9JZcnq07DpfLIJ8oghBG6eBqdgTdALvyS1xa4SFJVwvpCzkWDM3naw+LTeQD1RgBGfrgZxqLjqOfJqxE8QU3QAZiWCvwqOKLdWm7mIklHsjieTcFHfxYfwbEirw1oZ561QLYnNwQpy1jmezIY6TmuOf6QbB8hMG9CpUUcuin6WtEaaqEN6iPwEhvC8Hs1qXoF1CKy6o6OQr0j2/1l9w18/sz9sqYQLni+hr119K9jECgRVGdXo0iMm/Q3VbkWTL6h9cqygjx1/YDHFs+2Ns/hrGuk/ts+QhnhwIvFcdIMU0YWfhHaufWjGV/hDw/DMBE5Q==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O3dnueoMbKSAFyDZHlsIAAs5R/LoWPkG6J86i0pDTzN/YNkt0jbHIirnJnbogTNEUlUN2RSD8ajl6l+10j7XEoNzw7EgLlGrQwuNQxExkvRrnE8WaD0eFO9v8In6px5e39UCUNymmNmbFxMhuqXxOP+kdgWdGxcnyZrCSiYdL7yu5pOfzOIDWgo17yR3MWxh9cgYe6hAoucKkuQMnjZh3dmXOGKhzljFJmLEQGHgCaqGmW5gwyEbkVOx3Ky3S/RVJ+RNm4qLvevvNst2hHH2Du3qNidMTH27NdlgVeHkqH+oUQcjPDRu5kuChRO99nFRdkVffnZFoBU2i4MjjYtGeGzsOMNjbU9Wbq3WmSR4+1rgkbY7rr7vBtYHGYH/zQl/PXfP5IdEfriJM7SfoZyNxGJNrP0obLZt1AtQ72G2wuc9bbpUe8SRGVOlXW23T/yY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:29:35.0474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d95eae-33e3-4819-a9d2-08de7f4853af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4887
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_012939_015371_1C6D6E2B 
X-CRM114-Status: GOOD (  21.33  )
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

In HSR offload mode, multicast addresses can be added via HSR master
(hsr0) or directly to slave ports (eth1/eth2). The FDB must track port
membership: P0 (0x1) for HSR master, P1 (0x2) for slave port 1, and P2
(0x4) for slave port 2. When the same address is added from multiple
paths, memberships must accumulate.

Implement a hybrid approach using __dev_mc_sync() callbacks to track
basic add/delete operations, checking netdev_hw_addr->synced to
distinguish HSR-synced addresses from direct additions. Post-process
to handle overlapping memberships by checking refcount:
- refcount=2 with synced=1: HSR only (P0)
- refcount>=3 with synced=1: HSR + direct (P0|P1/P2)
- synced=0 with P0 set: HSR removed, clean up orphaned P0

On add operations, accumulate new membership with existing ports. On
delete operations, remove only the specific port and clean up orphaned
P0 bits if needed.

Add error handling for icssg_fdb_lookup() which can return negative
error codes (e.g., -ETIMEDOUT). On lookup failure in add/delete path,
default to no existing membership. In the post-processing path, skip
the address update to avoid corrupting FDB entries with garbage values.

VLAN Interface Handling:
Add support for multicast addresses added to VLAN interfaces on the HSR
master (e.g., hsr0.7). These addresses require P0 (HSR master) bit to be
set along with the port bits, since VLAN-tagged packets use separate FDB
entries per VLAN ID. Without P0, the HSR master would not receive
multicast packets on VLAN interfaces.

Track whether the add/del operation came from a VLAN interface path and
set P0 when in HSR offload mode with VLAN interfaces. Update orphaned P0
cleanup logic to preserve P0 for VLAN interfaces.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
v1 -> v2: 
   Added a helper function as suggested by Simon Horman <horms@kernel.org>

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 249 +++++++++++++++++--
 1 file changed, 233 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 372e55803168..591be5c8056b 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -669,28 +669,133 @@ static int icssg_prueth_del_mcast(struct net_device *ndev, const u8 *addr)
 	return 0;
 }
 
+/**
+ * icssg_is_addr_synced - Check if address is synced from HSR master
+ * @ndev: network device
+ * @addr: multicast MAC address
+ *
+ * Checks if the address is synced from HSR master (hsr0) via
+ * dev_mc_sync_multiple() or added directly to the slave port.
+ *
+ * Return: true if synced from HSR master, false if added directly
+ */
+static bool icssg_is_addr_synced(struct net_device *ndev, const u8 *addr)
+{
+	struct netdev_hw_addr *ha;
+	bool is_synced = false;
+
+	netif_addr_lock_bh(ndev);
+	netdev_for_each_mc_addr(ha, ndev) {
+		if (ether_addr_equal(ha->addr, addr)) {
+			is_synced = ha->synced;
+			break;
+		}
+	}
+	netif_addr_unlock_bh(ndev);
+
+	return is_synced;
+}
+
+/**
+ * icssg_hsr_fdb_update - Update FDB and VLAN table for HSR multicast
+ * @emac: PRUETH EMAC private data
+ * @addr: multicast MAC address
+ * @vid: VLAN ID
+ * @port_membership: port membership bitmap (P0=0x1, P1=0x2, P2=0x4)
+ * @add: true to add entry, false to delete
+ *
+ * Updates both FDB and VLAN table entries for the given address.
+ */
+static void icssg_hsr_fdb_update(struct prueth_emac *emac, const u8 *addr,
+				 u8 vid, u8 port_membership, bool add)
+{
+	icssg_fdb_add_del(emac, addr, vid, port_membership, add);
+	icssg_vtbl_modify(emac, vid, BIT(emac->port_id),
+			  BIT(emac->port_id), add);
+}
+
+/**
+ * icssg_prueth_hsr_fdb_add_del - Manage FDB port membership for HSR multicast
+ * @emac: PRUETH EMAC private data
+ * @addr: multicast MAC address
+ * @vid: VLAN ID
+ * @is_synced: true if synced from HSR master, false if added directly
+ * @is_vlan_path: true if called from VLAN interface path, false for direct path
+ * @add: true to add/update, false to remove
+ *
+ * Manages FDB port membership bits (P0/P1/P2) for multicast addresses.
+ * On add: accumulates membership with existing ports.
+ * On delete: removes only the specific port, cleans up orphaned P0 if needed.
+ */
 static void icssg_prueth_hsr_fdb_add_del(struct prueth_emac *emac,
-					 const u8 *addr, u8 vid, bool add)
+					 const u8 *addr, u8 vid,
+					 bool is_synced, bool is_vlan_path,
+					 bool add)
 {
-	icssg_fdb_add_del(emac, addr, vid,
-			  ICSSG_FDB_ENTRY_P0_MEMBERSHIP |
-			  ICSSG_FDB_ENTRY_P1_MEMBERSHIP |
-			  ICSSG_FDB_ENTRY_P2_MEMBERSHIP |
-			  ICSSG_FDB_ENTRY_BLOCK, add);
-
-	if (add)
-		icssg_vtbl_modify(emac, vid, BIT(emac->port_id),
-				  BIT(emac->port_id), add);
+	int existing_membership, other_port_membership;
+	u8 port_membership;
+
+	/* Set P0 (HSR master) bit when:
+	 * - Address is synced from HSR master (is_synced=true), OR
+	 * - In HSR offload mode AND it's a VLAN interface (is_vlan_path=true)
+	 * This ensures VLAN interfaces on HSR master (hsr0.X) also get P0 set.
+	 */
+	if (is_synced || (emac->prueth->is_hsr_offload_mode && is_vlan_path))
+		port_membership = ICSSG_FDB_ENTRY_P0_MEMBERSHIP | BIT(emac->port_id);
+	else
+		port_membership = BIT(emac->port_id);
+	existing_membership = icssg_fdb_lookup(emac, addr, vid);
+	if (existing_membership < 0) {
+		netdev_dbg(emac->ndev,
+			   "FDB lookup failed for %pM: %d, assuming no existing entry\n",
+			   addr, existing_membership);
+		existing_membership = 0;
+	}
+
+	if (add) {
+		/* Accumulate with existing membership */
+		port_membership |= existing_membership;
+
+		netdev_dbg(emac->ndev,
+			   "FDB add %pM: P%d%s -> membership 0x%x\n",
+			   addr, emac->port_id, is_synced ? "+P0" : "",
+			   port_membership);
+
+		icssg_hsr_fdb_update(emac, addr, vid, port_membership, true);
+	} else {
+		other_port_membership = existing_membership & ~port_membership;
+
+		/* Clean up orphaned P0 if neither HSR synced nor VLAN path */
+		if (!is_synced && !is_vlan_path &&
+		    (existing_membership & ICSSG_FDB_ENTRY_P0_MEMBERSHIP))
+			other_port_membership &=
+				~ICSSG_FDB_ENTRY_P0_MEMBERSHIP;
+
+		netdev_dbg(emac->ndev,
+			   "FDB del %pM: 0x%x -> 0x%x\n",
+			   addr, existing_membership, other_port_membership);
+
+		icssg_hsr_fdb_update(emac, addr, vid, port_membership, false);
+
+		if (other_port_membership)
+			icssg_hsr_fdb_update(emac, addr, vid,
+					     other_port_membership, true);
+	}
 }
 
 static int icssg_prueth_hsr_add_mcast(struct net_device *ndev, const u8 *addr)
 {
 	struct net_device *real_dev, *port_dev;
+	bool is_synced, is_vlan_path;
 	struct prueth_emac *emac;
 	u8 vlan_id, i;
 
-	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_HSR;
-	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
+	is_vlan_path = is_vlan_dev(ndev);
+	vlan_id = is_vlan_path ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_HSR;
+	real_dev = is_vlan_path ? vlan_dev_real_dev(ndev) : ndev;
+
+	/* Check if this address is synced from HSR master */
+	is_synced = icssg_is_addr_synced(ndev, addr);
 
 	if (is_hsr_master(real_dev)) {
 		for (i = HSR_PT_SLAVE_A; i < HSR_PT_INTERLINK; i++) {
@@ -701,12 +806,14 @@ static int icssg_prueth_hsr_add_mcast(struct net_device *ndev, const u8 *addr)
 				return -EINVAL;
 			}
 			icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id,
+						     is_synced, is_vlan_path,
 						     true);
 			dev_put(port_dev);
 		}
 	} else {
 		emac = netdev_priv(real_dev);
-		icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id, true);
+		icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id,
+					     is_synced, is_vlan_path, true);
 	}
 
 	return 0;
@@ -715,11 +822,16 @@ static int icssg_prueth_hsr_add_mcast(struct net_device *ndev, const u8 *addr)
 static int icssg_prueth_hsr_del_mcast(struct net_device *ndev, const u8 *addr)
 {
 	struct net_device *real_dev, *port_dev;
+	bool is_synced, is_vlan_path;
 	struct prueth_emac *emac;
 	u8 vlan_id, i;
 
-	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_HSR;
-	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
+	is_vlan_path = is_vlan_dev(ndev);
+	vlan_id = is_vlan_path ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_HSR;
+	real_dev = is_vlan_path ? vlan_dev_real_dev(ndev) : ndev;
+
+	/* Check if this address was synced from HSR master */
+	is_synced = icssg_is_addr_synced(ndev, addr);
 
 	if (is_hsr_master(real_dev)) {
 		for (i = HSR_PT_SLAVE_A; i < HSR_PT_INTERLINK; i++) {
@@ -730,12 +842,14 @@ static int icssg_prueth_hsr_del_mcast(struct net_device *ndev, const u8 *addr)
 				return -EINVAL;
 			}
 			icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id,
+						     is_synced, is_vlan_path,
 						     false);
 			dev_put(port_dev);
 		}
 	} else {
 		emac = netdev_priv(real_dev);
-		icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id, false);
+		icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id,
+					     is_synced, is_vlan_path, false);
 	}
 
 	return 0;
@@ -1059,6 +1173,104 @@ static int emac_ndo_stop(struct net_device *ndev)
 	return 0;
 }
 
+/**
+ * icssg_hsr_handle_multicast_sync() - Handle HSR multicast overlapping memberships
+ * @emac: PRUETH EMAC private structure
+ *
+ * Post-process multicast addresses to handle overlapping memberships where
+ * the same address is added from multiple paths (hsr0 + eth1). The kernel
+ * increments refcount without triggering callbacks, so manually check refcount
+ * to detect and update FDB port membership accordingly.
+ */
+static void icssg_hsr_handle_multicast_sync(struct prueth_emac *emac)
+{
+	struct hsr_mcast_update {
+		struct list_head list;
+		u8 addr[ETH_ALEN];
+		int refcount;
+		bool synced;
+	};
+	struct hsr_mcast_update *update, *tmp;
+	struct net_device *ndev = emac->ndev;
+	u8 vlan_id = PRUETH_DFLT_VLAN_HSR;
+	struct netdev_hw_addr *ha;
+	int existing_membership;
+	LIST_HEAD(update_list);
+	u8 port_membership;
+
+	/* Handle overlapping memberships: When the same address
+	 * is added from multiple paths (hsr0 + eth1), kernel
+	 * increments refcount without triggering callbacks.
+	 * Manually check refcount to detect:
+	 * - refcount=2 + synced: HSR only, membership = P0
+	 * - refcount>=3 + synced: HSR + direct, membership = P0|Px
+	 * - !synced but P0 set: HSR removed, clean up orphaned P0
+	 *
+	 * Collect addresses to update while holding the lock, then
+	 * process them after releasing the lock to avoid sleeping
+	 * while atomic (icssg_fdb_lookup/update can sleep).
+	 */
+	netif_addr_lock_bh(ndev);
+	netdev_for_each_mc_addr(ha, ndev) {
+		/* Queue this address for processing.
+		 * We need to check existing_membership via FDB lookup
+		 * (which can sleep), so defer that until after unlock.
+		 * Save synced/refcount to reproduce original logic.
+		 */
+		update = kmalloc_obj(*update, GFP_ATOMIC);
+		if (!update)
+			continue;
+
+		ether_addr_copy(update->addr, ha->addr);
+		update->synced = ha->synced;
+		update->refcount = ha->refcount;
+		list_add_tail(&update->list, &update_list);
+	}
+	netif_addr_unlock_bh(ndev);
+
+	/* Process collected addresses outside spinlock */
+	list_for_each_entry_safe(update, tmp, &update_list, list) {
+		existing_membership = icssg_fdb_lookup(emac,
+						       update->addr,
+						       vlan_id);
+		if (existing_membership < 0) {
+			netdev_dbg(ndev,
+				   "FDB lookup failed for %pM: %d, skipping\n",
+				   update->addr, existing_membership);
+			list_del(&update->list);
+			kfree(update);
+			continue;
+		}
+
+		port_membership = existing_membership;
+		if (update->synced) {
+			port_membership |=
+				ICSSG_FDB_ENTRY_P0_MEMBERSHIP;
+			if (update->refcount >= 3)
+				port_membership |= BIT(emac->port_id);
+			else
+				port_membership &= ~BIT(emac->port_id);
+		} else if (existing_membership &
+			   ICSSG_FDB_ENTRY_P0_MEMBERSHIP) {
+			port_membership &=
+				~ICSSG_FDB_ENTRY_P0_MEMBERSHIP;
+		}
+
+		if (existing_membership != port_membership) {
+			netdev_dbg(ndev, "Update %pM: 0x%x -> 0x%x\n",
+				   update->addr, existing_membership,
+				   port_membership);
+
+			icssg_hsr_fdb_update(emac, update->addr,
+					     vlan_id, port_membership,
+					     true);
+		}
+
+		list_del(&update->list);
+		kfree(update);
+	}
+}
+
 static void emac_ndo_set_rx_mode_work(struct work_struct *work)
 {
 	struct prueth_emac *emac = container_of(work, struct prueth_emac, rx_mode_work);
@@ -1085,8 +1297,13 @@ static void emac_ndo_set_rx_mode_work(struct work_struct *work)
 	}
 
 	if (emac->prueth->is_hsr_offload_mode) {
+		/* Track basic add/delete via callbacks */
 		__dev_mc_sync(ndev, icssg_prueth_hsr_add_mcast,
 			      icssg_prueth_hsr_del_mcast);
+
+		/* Handle overlapping memberships */
+		icssg_hsr_handle_multicast_sync(emac);
+
 		if (rtnl_trylock()) {
 			vlan_for_each(emac->prueth->hsr_dev,
 				      icssg_update_vlan_mcast, emac);

base-commit: 482aac8b56ca21d06c588517970579474d56736e
-- 
2.34.1


