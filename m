Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280ECC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9E8Oh4rIprG7h/tFPK9w7jSI7Ylms4PmocRKtjCTLU=; b=EpLJQB3MnELQHEOENb+QUbz+Ba
	ZGpXhW4CYSG36FOwAsVTZSsh++LWRpL0Bjb34zZH0rhGlkGbwgH+w/oOwNRBDRbuwAQfl69ruWRvR
	8YNCdSkpR6c+rWAfduqW4XjiM7eSOxjawxR+q4hC7xl34RQJ9GrPKiMRNplhurq1yGEcSMQwBgje9
	UPfp6ntClikH1+XdxBN2G+9N0PP3C8agQ2VYPxdvvH7lohshhB6Wn1dLX3VIOBRi7SNCmKn75gkrr
	2bGoie6eUprJdYk+DjexQhxjORjkz2JC7nZ1GjH/60E4VuYvEEh1W7VWtynTNhoqSYZqDLlwPYxza
	qr7lk/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI5S-00000007jIb-1wQs;
	Fri, 07 Aug 2026 10:46:02 +0000
Received: from mail-northcentralusazon11010002.outbound.protection.outlook.com ([52.101.193.2] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI5P-00000007jF1-496y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBQRaK/IE20f66g5PqLsSZNRjbdWmeJjIv9HG9uGlszvEnj+wCZSAvgUrM03Ke4l+CepY0UamkDlHamnA+3TcjelOf532NjTAnUMjE8h/lm3jFLwC/tA1542lvAXyzE2017hXyuzFf52O6299NCw5rWstRt2osK3k2+0M+XKPAYqd622uBVR9UJl3NnxAeNgZSu4cFRVDE1RKoCEyvodDCd/xsfnJ/G3vploOZPOfEnGSkr9c2aoO8RMse/J8QM08CPiAI5UXZl58hxU8FyO7rgMXr/8hRjby8+Fk5RwBzOno6HGqsFYEglgKBECwaDC7+LK2pukJWq8ya7rMWfidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9E8Oh4rIprG7h/tFPK9w7jSI7Ylms4PmocRKtjCTLU=;
 b=UhOCK2bDonLev3MwX7mw24rGtQrE+TxYUN0iQeMg7CSrCs+j8eXZ17ggflvejfJf0yV1rVYmgY9ggX/AGhitaIDA2sKcD7+XixjBqFxAlYzGzU2IFEiLk97UkMD0oSG1fsuw90ImaOz8in9YYg/ZuvgaaHPmgTmkwoRZhFteH8iFGQt/IV2JLN/k/kna3UNGYSdy6KZc361qJpm4c9MT3mn2w7XvfQ9RP9K9XeoO/E8cM7eWr3YLZoF9pMXC/L7Kv75513FEDqKwyEcPxKETLSoQGDEsH2oPzkT6bkRoeJyqStlxHjdlSxc1VCT6+LB9MAO4Az/0Qtwd4SKL0roGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9E8Oh4rIprG7h/tFPK9w7jSI7Ylms4PmocRKtjCTLU=;
 b=h/lHZVK1BWmDvwMRCS7RYD9+jz549ES/Dpar/WVeFJdWLFXBV0PKeqZMIdjCdPMF9MVMjn1SYV5x/R86/Qt9IfrlkKiqPR1ZWPJrWy8ydhePjTKk2sGEMb5ywWnC8z1CGXr0FHLwQtu1R4+20Ih0oAnSo9lVn7mEVUv+nwvzJW8=
Received: from SJ0PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:33f::20)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 10:45:51 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::1e) by SJ0PR05CA0045.outlook.office365.com
 (2603:10b6:a03:33f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Fri, 7
 Aug 2026 10:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 10:45:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 7 Aug
 2026 05:45:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 7 Aug
 2026 03:45:49 -0700
Received: from xhdnrottela40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 7 Aug 2026 05:45:44 -0500
From: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, Michal Simek <michal.simek@amd.com>, Andrew Lunn
	<andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Simon Horman
	<horms@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git-dev@amd.com>, <nagadheeraj.rottela@amd.com>
Subject: [PATCH 13/20] net: dsa: xilinx: wire up phylink for the switch ports
Date: Fri, 7 Aug 2026 16:14:24 +0530
Message-ID: <20260807104431.157230-14-nagadheeraj.rottela@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: abb933ad-e773-4947-5061-08def4710c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|7416014|23010399003|82310400026|18002099003|22082099003|921020|6133799003|10067099003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: r1CkI5wsU4jjW9zEWWpzDslYpmQU/ALfAr551+ys3bJJ9OPwuxJ4BhR+HtO+uzaKzVv8AyAg0iQuQ/wpNxUhkArRTPvy799rZXj6GVIdxzRfa/fuXx+oaeC8MEj95Dd2Y8z94798zOpxV9/GXB6Xe/WN4Fln32Ma09xoecvQ/lUq/BoYUxg/mp6Eye4iRsfmvnELkK0PIN3DtMoWFF2tOFnjhA4KKj4xNp5JIaVr7cbXHvDN7ieToKiL22vbTrDLZa7xf21J+lsLK/xggugvTcLhvii3ebO/7wNN2b3ufTAqtWRSQ8pOPuRTGHFnAqZ90vPMVRRHLZoAUZTV7gMnWvn2f92YY54YImnG/7jNHxCXOq3QRzZS1OgCwWRrug1uTT9KL2rhGnoVUCcYdh7UsIWFo86X8wsDfu7JOvlAEr75lJWJOYlg6I+7CdpR9N7ONUpMzxdLdq/VHuttVkoqRtiZ1fCxN8fHX5hA77av2OtQvS9cl0is2QoPfctom2kjKqXonn8rS4H8+WBcdT+wArbvwAV5buFW8gnpmBaxTYFSm9qfy7ti1JXrwPReu60Lkc8D+6MrH6/NCIyBFix1fc4GyJCq8UvZLK8VeSJ94zm1zqsDQzwvi1HoLK760H1ci192fEWwLtMndgt5V1R+MqJFKnWs1EuE96Zh5V9hvAE4Bji3JPPw3uolaOANGnVY91pR2OTw0yt8w8TBi4d170mK0zbRPceqGbUtDjgiMtcAWsnvC9bjwbHl1p5fyKOn
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(7416014)(23010399003)(82310400026)(18002099003)(22082099003)(921020)(6133799003)(10067099003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yofZsWMQKYf66pVqe/0CTlTFNaYWkLSRymwGOL3QqinSGjpQs7Ip+sXZdtYHnFakId464+37I1ChOYoXP7+r/5kVtOinHkRMGU89CUUjx3ZIbhx8Z98cg5EVKhiYelar5BP2jlHG8p/oQNqgzHwTxTrGj6w0b+MudK+ZHvEtGYzu6GEZko2ou7EpMW2UgOht8gTx959ZS6iC0s7OIXWDeYtJAmWM78iNCAuTV9AxEapglH6gkY+jOZCw2XSnOSmI3jMd9bnmVSNHXLykoM4IK0u219rFTlW0Vg0upl6s9vWKOxTNgKoGltLnIx9cRdwLNXZNTUqh4JxTSgp6TSoDfqQ2EbGfZNM2NZpsjQELkZxb763k0rwLLaYOR2URHkRewXI+f4BtrDIEpOHLlWMse7cE4ZICFl7/kIBFON6Jd+zKZIhu4J12kJBw1s568Cnv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 10:45:51.1828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb933ad-e773-4947-5061-08def4710c9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_034600_070629_F4FF860E 
X-CRM114-Status: GOOD (  19.74  )
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

Wire up the MAC-side phylink ops for all three switch ports.

For the two external user ports, phylink_get_caps fills
supported_interfaces with RGMII variants, SGMII, and GMII, and sets
mac_capabilities to MAC_100FD and MAC_1000FD. The speed-config field
only encodes those two speeds, so 10 Mbps and half-duplex are not
reachable in hardware. The CPU port has no external PHY. Its link is
internal and fixed at MAC_1000FD, so phylink_get_caps sets
PHY_INTERFACE_MODE_INTERNAL and returns early for it.

mac_link_up programs the resolved speed into the speed-config field
and sets TX_EN and RX_EN to allow frames to flow. mac_link_down clears
them. mac_config is intentionally empty. The interface mode is fixed
at IP synthesis time and there is no runtime register to program.

Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
---
 drivers/net/dsa/xilinx/xilinx_tsn.c | 102 ++++++++++++++++++++++++++++
 drivers/net/dsa/xilinx/xilinx_tsn.h |  12 ++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx/xilinx_tsn.c
index 542b74514ed3..86aba2e8b6e9 100644
--- a/drivers/net/dsa/xilinx/xilinx_tsn.c
+++ b/drivers/net/dsa/xilinx/xilinx_tsn.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/phy.h>
+#include <linux/phylink.h>
 #include <linux/platform_device.h>
 #include <net/dsa.h>
 
@@ -324,6 +325,105 @@ static void xlnx_tsn_port_stp_state_set(struct dsa_switch *ds, int port,
 	xlnx_tsn_set_port_state(sw, port, hw_state);
 }
 
+static void xlnx_tsn_phylink_get_caps(struct dsa_switch *ds, int port,
+				      struct phylink_config *config)
+{
+	if (port == XLNX_TSN_CPU_PORT) {
+		config->mac_capabilities = MAC_1000FD;
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+		return;
+	}
+
+	/* The MAC's speed-config field only encodes 100 / 1000.
+	 * Half-duplex and 10 Mbps are not supported.
+	 */
+	config->mac_capabilities = MAC_100FD | MAC_1000FD;
+	phy_interface_set_rgmii(config->supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, config->supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_GMII, config->supported_interfaces);
+}
+
+static void xlnx_tsn_mac_config(struct phylink_config *config,
+				unsigned int mode,
+				const struct phylink_link_state *state)
+{
+	/* Interface mode (RGMII / SGMII / GMII) is fixed at IP synthesis
+	 * time. There is no runtime register to program it here.
+	 */
+}
+
+static void xlnx_tsn_mac_link_down(struct phylink_config *config,
+				   unsigned int mode,
+				   phy_interface_t interface)
+{
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct xlnx_tsn *sw = dp->ds->priv;
+	struct xlnx_tsn_mac *m;
+	u32 rcw1, tc;
+
+	m = &sw->mac[dp->index];
+
+	/* The CPU port has no switch-side MAC registers. Nothing to
+	 * tear down here (see xlnx_tsn_mac_link_up).
+	 */
+	if (dp->index == XLNX_TSN_CPU_PORT)
+		return;
+
+	tc = mac_ior(m, TSN_TC_OFFSET) & ~TSN_TC_TX_EN;
+	mac_iow(m, TSN_TC_OFFSET, tc);
+
+	rcw1 = mac_ior(m, TSN_RCW1_OFFSET) & ~TSN_RCW1_RX_EN;
+	mac_iow(m, TSN_RCW1_OFFSET, rcw1);
+}
+
+static void xlnx_tsn_mac_link_up(struct phylink_config *config,
+				 struct phy_device *phy, unsigned int mode,
+				 phy_interface_t interface, int speed,
+				 int duplex, bool tx_pause, bool rx_pause)
+{
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct xlnx_tsn *sw = dp->ds->priv;
+	u32 speed_cfg, rcw1, tc;
+	struct xlnx_tsn_mac *m;
+
+	m = &sw->mac[dp->index];
+
+	/* The CPU port is the internal endpoint MAC. It has no switch-side
+	 * MAC registers and is managed by the endpoint driver, not here.
+	 */
+	if (dp->index == XLNX_TSN_CPU_PORT)
+		return;
+
+	speed_cfg = mac_ior(m, TSN_SPEED_CFG_OFFSET) & ~TSN_SPEED_CFG_MASK;
+	switch (speed) {
+	case SPEED_1000:
+		speed_cfg |= TSN_SPEED_CFG_1000;
+		break;
+	case SPEED_100:
+		speed_cfg |= TSN_SPEED_CFG_100;
+		break;
+	default:
+		dev_warn(sw->dev,
+			 "port %d: unsupported link speed %d Mbps\n",
+			 dp->index, speed);
+		return;
+	}
+	mac_iow(m, TSN_SPEED_CFG_OFFSET, speed_cfg);
+
+	rcw1 = mac_ior(m, TSN_RCW1_OFFSET) | TSN_RCW1_RX_EN;
+	mac_iow(m, TSN_RCW1_OFFSET, rcw1);
+
+	tc = mac_ior(m, TSN_TC_OFFSET) | TSN_TC_TX_EN;
+	mac_iow(m, TSN_TC_OFFSET, tc);
+}
+
+static const struct phylink_mac_ops xlnx_tsn_phylink_mac_ops = {
+	.mac_config	= xlnx_tsn_mac_config,
+	.mac_link_up	= xlnx_tsn_mac_link_up,
+	.mac_link_down	= xlnx_tsn_mac_link_down,
+};
+
 static int xlnx_tsn_setup(struct dsa_switch *ds)
 {
 	struct xlnx_tsn *sw = ds->priv;
@@ -372,6 +472,7 @@ static const struct dsa_switch_ops xlnx_tsn_switch_ops = {
 	.setup			= xlnx_tsn_setup,
 	.teardown		= xlnx_tsn_teardown,
 	.port_stp_state_set	= xlnx_tsn_port_stp_state_set,
+	.phylink_get_caps	= xlnx_tsn_phylink_get_caps,
 };
 
 static int xlnx_tsn_map_reg(struct platform_device *pdev, const char *name,
@@ -421,6 +522,7 @@ static int xlnx_tsn_probe(struct platform_device *pdev)
 	ds->dev = dev;
 	ds->num_ports = XLNX_TSN_NUM_PORTS;
 	ds->ops = &xlnx_tsn_switch_ops;
+	ds->phylink_mac_ops = &xlnx_tsn_phylink_mac_ops;
 	ds->priv = sw;
 
 	platform_set_drvdata(pdev, sw);
diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.h b/drivers/net/dsa/xilinx/xilinx_tsn.h
index 025645a83992..6286caff7a1c 100644
--- a/drivers/net/dsa/xilinx/xilinx_tsn.h
+++ b/drivers/net/dsa/xilinx/xilinx_tsn.h
@@ -66,6 +66,18 @@ enum tsn_port_state {
 
 #define TSN_MDIO_MRD_MASK		GENMASK(15, 0)
 
+/* Per-MAC receive / transmit / speed configuration registers. */
+#define TSN_RCW1_OFFSET			0x00000404
+#define TSN_RCW1_RX_EN			BIT(28)
+
+#define TSN_TC_OFFSET			0x00000408
+#define TSN_TC_TX_EN			BIT(28)
+
+#define TSN_SPEED_CFG_OFFSET		0x00000410
+#define TSN_SPEED_CFG_MASK		GENMASK(31, 30)
+#define TSN_SPEED_CFG_100		BIT(30)
+#define TSN_SPEED_CFG_1000		BIT(31)
+
 struct mii_bus;
 struct xlnx_tsn;
 
-- 
2.34.1


