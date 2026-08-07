Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE8CC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rIsPd5DvgYIJc8JzS+AAKx+PsBr87OZdjS81f7ABzg=; b=SIUjpJtxv5VVyzKajcUHHomaKg
	cAFm+TGl7utDOuwljCaCtAyMAYLigGlpnT0BRzAHYidwLwz2r5SMtMEkydqb3BVhn6im59xNo++SA
	VGMW5BCFecIvvtjfX2ZMjza0+lHnU5NAuBt1itInApCkexSa6MLjvy79g6QiWFM7RwEFA1sqdAn6T
	9peRaWTbuFyadnCViL90fNt3zhkNyGLKl4RA8EMJu/rTXX8kPG3cXfjKOv9LHl3gVgiMdDfXF1zIG
	AXaSFnfuzf0F8dp6PGp+2uq7WT0e0ol3IV1kb+cehwQrZuZjJhUqHGtOYX+K+Z/KqzPikIz9UDRsy
	/esI5iZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI5L-00000007jBD-03TG;
	Fri, 07 Aug 2026 10:45:55 +0000
Received: from mail-eastusazon11012006.outbound.protection.outlook.com ([52.101.53.6] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI5I-00000007j8L-2La4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:45:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgqbvFvKDjMGSAewa16OOt++zOC3qdXWNgRSb81U+GcyiNB3d2YZoxOt4FIIIn8AVU27Oq9Trz0HpSxCOvvFKqzcJJRALt4HLhTLVPYSDkvZoG7Wx5xyACqodI2B04SDa64guXt/fOp6H5m3sW4HndnhPDG/sbgZjtCd6npB+UA/LT2Rgt4IORRsmm0g6ECdhAOnnLBJND0VY6nHq7Jt5O6XqVupXrZcwj2saaM02850rUA/o6xkuYI+sTdDQvnW/0SqVaxsRU+oueeWmc/Y4JbYhtKTz9UJbmA7GVITbsS1U2koQ9NU2D/sErqz0dhM1uMoRTd5Mt671AJfGzCyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rIsPd5DvgYIJc8JzS+AAKx+PsBr87OZdjS81f7ABzg=;
 b=lhscueEL0s7/rhLrEKVZH5z7Ml1FMxKEA4PkYLcgClAJ4THnIFaSHrzdm4v8IS5AY7Buiq29JyBLPFOZGuAEA62ctO3ekU0mMPuBxvHC7rJjuGxXCGM8FUtqR78cscgMMTw8sLDQnVo/hFaWHP6IIw6ztp5gyyEv1MpMVjkVhD8Ej7VWzSosFLShaLsE0rNF4vRjTU6WSe9Y26CgFfedrL/tgVqMpIutsIitJgEMUN8aZkeuOaRvJf8aYUFXkg1mKOVmFma5WqdLTN778ckSw11matdnt8kCQlZA9IuS7cbw+3too95rvSKFjdQYeyF9PubBy3kRN3XJk0QB4UsT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rIsPd5DvgYIJc8JzS+AAKx+PsBr87OZdjS81f7ABzg=;
 b=KCAl8mYolEx+zGO4hP+PMbcBRGo5tszvx98QnEHVe55AENIzkeSzsYI00BQO5jth6pW7bhqOZUGhiurhVBEES35ddpfZZqMQVCge/ER9ZMq3YUMGnCQ459q/1tOfFvAajzD01LIgEB424ArALJBjLpSN65+JGW2ItpC+UoA7J8M=
Received: from PH7P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::23)
 by CH3PR12MB8725.namprd12.prod.outlook.com (2603:10b6:610:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 10:45:41 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:33a:cafe::72) by PH7P222CA0009.outlook.office365.com
 (2603:10b6:510:33a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 10:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Fri, 7 Aug 2026 10:45:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 7 Aug
 2026 05:45:39 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 7 Aug
 2026 03:45:38 -0700
Received: from xhdnrottela40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 7 Aug 2026 05:45:33 -0500
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
Subject: [PATCH 11/20] net: dsa: xilinx: implement port_stp_state_set
Date: Fri, 7 Aug 2026 16:14:22 +0530
Message-ID: <20260807104431.157230-12-nagadheeraj.rottela@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|CH3PR12MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f26e3c7-5dca-49f1-433a-08def4710601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|11063799006|56012099006|10067099003|18002099003|3023799007|22082099003|921020;
X-Microsoft-Antispam-Message-Info: 8P921VhYJa7Yj0jVsGgi+410dv32cT5g0BrVLDDBZHcmo5e6BxjaXO/Ud5TVllZevHg3GIX4lKh4bfVFv5uxzBynj5MNsP9jwPbPDs+2aLFCjHkZPM6EPeaybCAWvbI27OAU/Pm1YWyHPkuVZHELcufefEu1l/Ito+h26sx2bBUX2eULnaagJjzvo8nvMY/5NivpnQ1tXWU0Unx5T67OL6plc5Yh728A6JKUM+bsNIoPcoNSJ/50fcRond5QfmMT0f3WgYLjTqXk2q+jfVoHI7i+rB7UADwfvro5Krey6Byc0Sy9/tul629sPs8VopF1L6AHbdJRuT/8ZqJAw07OOBRVeIJzccwAaS48cgFDYBvz0M2IljYo2xaevPuE8+/8C5u4UPQXkEu4hbC5IiCYjhZ/W6WQ/GhJ6eQP7fatFakeUgTnxjaVQJCCZzouv06NcAjsq5uwJgSNFSKB7iGB6WK5ZqOqQvP1z4W+ltehajmGeSN5HrD5aCIVS6WsnranIw+KiCnh2CVrhntPdGioNcqI1VHKbjIZWqt6cgdGLmwwEc2Tjp7xd1s/u+w5n1K23mHIWTgwNGigCpNjUEdcillkJI3zJrNd61vcM5GvShFvM4Q+rFWf1uktVAFM/MgO0GSBugsUu7m0i5qt5htMA064CtFNexoy8v8oRbYWIRO10YYETpf+WvAf9b/cVLIslz7EZ5dHIDJ7HEQOEzVlYhothBPW5N4rZMK2aXBRv6U5u9kq23cCSLx4ueX7HLN4
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(3023799007)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ybU6l0GGxNPi0rrmxJjabq5HhvWPcUH0z6wJ01BJwk+F2ATebfxs6cjA6XjAs9HaAlees210SEcRJ2+2MG5jIY3vaAA6Hu7S1AGDV5Y0GFc4Jj7owIVltfC+j4wmkV2LiEmwu9Arrtwu6oumH9z5ZboaZX54gFqxdEGgmvzua96K3lcVpAHsspszzCt1ptwiLlNTss3I9Q4FRxbU1QXfYojVyGjrIt1nSC/9Jla4JJqf0YFztE+pSBZuHTzTTMnOtEMEW9D3+mDLNyRXgshWInuL4esR0jnnysH8icD33kbGDx/1x+8tActqGuO0wJOV7I0E30U26kKldEn5tDEP7TZnvHCxaUDu0HC5Ia2FI095yQpkxnTGqOj/SwiaR2WM6rwPLttoiQqKJ1OtY2x6LdCpoi2DoZtakdbkPgykINhQ7Ygi1la/m2WrvvHLSLkf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 10:45:40.1077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f26e3c7-5dca-49f1-433a-08def4710601
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_034552_694648_E9FC9AD9 
X-CRM114-Status: GOOD (  19.27  )
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

Wire up the bridge STP state machine to the Switch Port State
Control register at +0x004C. Each port has a 3-bit state field and
a self-clearing commit bit. The hardware applies the new state only
when the commit bit transitions from 0 to 1. Follow each write with
readl_poll_timeout() until the hardware acknowledges.

All five STP states map to distinct hardware encodings on the
MAC ports.

Put the CPU port in FORWARDING so host traffic always flows, and
the user ports in DISABLED so the bridge STP machine drives all
further transitions. On teardown, return the user ports to DISABLED.
The bridge STP machine does not manage the CPU port. Its forwarding
state does not change after setup().

Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
---
 drivers/net/dsa/xilinx/xilinx_tsn.c | 148 ++++++++++++++++++++++++++++
 drivers/net/dsa/xilinx/xilinx_tsn.h |  32 ++++++
 2 files changed, 180 insertions(+)

diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx/xilinx_tsn.c
index 6b285c528724..020b1622670c 100644
--- a/drivers/net/dsa/xilinx/xilinx_tsn.c
+++ b/drivers/net/dsa/xilinx/xilinx_tsn.c
@@ -3,6 +3,10 @@
  * AMD/Xilinx TSN Endpoint Ethernet MAC DSA switch driver.
  */
 
+#include <linux/bitfield.h>
+#include <linux/if_bridge.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -11,6 +15,86 @@
 
 #include "xilinx_tsn.h"
 
+static void sw_iow(struct xlnx_tsn *sw, u32 off, u32 val)
+{
+	iowrite32(val, sw->sw_base + off);
+}
+
+static u32 sw_ior(struct xlnx_tsn *sw, u32 off)
+{
+	return ioread32(sw->sw_base + off);
+}
+
+static int xlnx_tsn_switch_status_ready(struct xlnx_tsn *sw)
+{
+	u32 reg;
+
+	return readl_poll_timeout(sw->sw_base + TSN_SW_STATUS_OFFSET, reg,
+				  reg & TSN_SW_STATUS_READY,
+				  TSN_SW_POLL_DELAY_US, TSN_SW_POLL_TIMEOUT_US);
+}
+
+static int xlnx_tsn_port_state_bits(int port, u32 *mask, u32 *chg_bit)
+{
+	switch (port) {
+	case XLNX_TSN_CPU_PORT:
+		*mask = EP_PORT_STATUS_MASK;
+		*chg_bit = EP_PORT_STATUS_CHG_BIT;
+		return 0;
+	case XLNX_TSN_PORT_MAC1:
+		*mask = MAC1_PORT_STATUS_MASK;
+		*chg_bit = MAC1_PORT_STATUS_CHG_BIT;
+		return 0;
+	case XLNX_TSN_PORT_MAC2:
+		*mask = MAC2_PORT_STATUS_MASK;
+		*chg_bit = MAC2_PORT_STATUS_CHG_BIT;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int xlnx_tsn_set_port_state(struct xlnx_tsn *sw, int port,
+				   enum tsn_port_state state)
+{
+	u32 chg_bit, mask, val, reg;
+	int err;
+
+	err = xlnx_tsn_port_state_bits(port, &mask, &chg_bit);
+	if (err)
+		return err;
+
+	err = xlnx_tsn_switch_status_ready(sw);
+	if (err) {
+		dev_err(sw->dev, "port %d: switch not ready for state change\n",
+			port);
+		return err;
+	}
+
+	/* Bit won't re-arm if a previous change never cleared it. */
+	val = sw_ior(sw, TSN_PORT_STATE_CTRL_OFFSET);
+	if (val & chg_bit) {
+		dev_err(sw->dev, "port %d: previous state change still pending\n",
+			port);
+		return -EBUSY;
+	}
+
+	val &= ~mask;
+	val |= (state << __ffs(mask)) & mask;
+	val |= chg_bit;
+	sw_iow(sw, TSN_PORT_STATE_CTRL_OFFSET, val);
+
+	err = readl_poll_timeout(sw->sw_base + TSN_PORT_STATE_CTRL_OFFSET, reg,
+				 !(reg & chg_bit), TSN_SW_POLL_DELAY_US,
+				 TSN_SW_POLL_TIMEOUT_US);
+	if (err) {
+		dev_err(sw->dev, "port %d: state change ack timed out\n", port);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static enum dsa_tag_protocol xlnx_tsn_get_tag_protocol(struct dsa_switch *ds,
 						       int port,
 						       enum dsa_tag_protocol mp)
@@ -18,19 +102,83 @@ static enum dsa_tag_protocol xlnx_tsn_get_tag_protocol(struct dsa_switch *ds,
 	return DSA_TAG_PROTO_XLNX_TSN;
 }
 
+static void xlnx_tsn_port_stp_state_set(struct dsa_switch *ds, int port,
+					u8 state)
+{
+	struct xlnx_tsn *sw = ds->priv;
+	enum tsn_port_state hw_state;
+
+	switch (state) {
+	case BR_STATE_DISABLED:
+		hw_state = TSN_PORT_STATE_DISABLED;
+		break;
+	case BR_STATE_BLOCKING:
+		hw_state = TSN_PORT_STATE_BLOCKING;
+		break;
+	case BR_STATE_LISTENING:
+		hw_state = TSN_PORT_STATE_LISTENING;
+		break;
+	case BR_STATE_LEARNING:
+		hw_state = TSN_PORT_STATE_LEARNING;
+		break;
+	case BR_STATE_FORWARDING:
+		hw_state = TSN_PORT_STATE_FORWARDING;
+		break;
+	default:
+		dev_warn(sw->dev, "port %d: unsupported STP state %u\n",
+			 port, state);
+		return;
+	}
+
+	xlnx_tsn_set_port_state(sw, port, hw_state);
+}
+
 static int xlnx_tsn_setup(struct dsa_switch *ds)
 {
+	struct xlnx_tsn *sw = ds->priv;
+	struct dsa_port *dp;
+	int ret;
+
+	if (!dsa_is_user_port(ds, XLNX_TSN_PORT_MAC1) ||
+	    !dsa_is_user_port(ds, XLNX_TSN_PORT_MAC2))
+		return dev_err_probe(sw->dev, -EINVAL,
+				     "both MAC1 and MAC2 must be enabled as switch ports\n");
+
+	/* CPU port stays in FORWARDING so host traffic always flows.
+	 * User ports start in DISABLED and transition from there under
+	 * bridge STP control.
+	 */
+	ret = xlnx_tsn_set_port_state(sw, XLNX_TSN_CPU_PORT,
+				      TSN_PORT_STATE_FORWARDING);
+	if (ret)
+		return ret;
+
+	dsa_switch_for_each_user_port(dp, ds) {
+		ret = xlnx_tsn_set_port_state(sw, dp->index,
+					      TSN_PORT_STATE_DISABLED);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 static void xlnx_tsn_teardown(struct dsa_switch *ds)
 {
+	struct xlnx_tsn *sw = ds->priv;
+	struct dsa_port *dp;
+
+	dsa_switch_for_each_user_port(dp, ds)
+		xlnx_tsn_set_port_state(sw, dp->index, TSN_PORT_STATE_DISABLED);
+
+	xlnx_tsn_set_port_state(sw, XLNX_TSN_CPU_PORT, TSN_PORT_STATE_DISABLED);
 }
 
 static const struct dsa_switch_ops xlnx_tsn_switch_ops = {
 	.get_tag_protocol	= xlnx_tsn_get_tag_protocol,
 	.setup			= xlnx_tsn_setup,
 	.teardown		= xlnx_tsn_teardown,
+	.port_stp_state_set	= xlnx_tsn_port_stp_state_set,
 };
 
 static int xlnx_tsn_map_reg(struct platform_device *pdev, const char *name,
diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.h b/drivers/net/dsa/xilinx/xilinx_tsn.h
index 0f9af866bd18..1064cf1ce66e 100644
--- a/drivers/net/dsa/xilinx/xilinx_tsn.h
+++ b/drivers/net/dsa/xilinx/xilinx_tsn.h
@@ -5,6 +5,8 @@
 #ifndef _XILINX_TSN_H
 #define _XILINX_TSN_H
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/types.h>
 #include <net/dsa.h>
 
@@ -13,6 +15,36 @@
 #define XLNX_TSN_PORT_MAC1	1
 #define XLNX_TSN_PORT_MAC2	2
 
+#define TSN_SW_STATUS_OFFSET		0x00000
+/* Poll this before changing port state. */
+#define TSN_SW_STATUS_READY		BIT(0)
+
+/* Switch Port State Control register: packs per-port STP state and
+ * change-commit bits into one 32-bit word.
+ */
+#define TSN_PORT_STATE_CTRL_OFFSET	0x0004c
+
+#define EP_PORT_STATUS_CHG_BIT		BIT(0)
+#define EP_PORT_STATUS_MASK		GENMASK(3, 1)
+#define MAC1_PORT_STATUS_CHG_BIT	BIT(8)
+#define MAC1_PORT_STATUS_MASK		GENMASK(11, 9)
+#define MAC2_PORT_STATUS_CHG_BIT	BIT(16)
+#define MAC2_PORT_STATUS_MASK		GENMASK(19, 17)
+
+/* readl_poll_timeout() parameters (in microseconds): poll until
+ * the port-state change-commit bit self-clears.
+ */
+#define TSN_SW_POLL_DELAY_US		10
+#define TSN_SW_POLL_TIMEOUT_US		5000
+
+enum tsn_port_state {
+	TSN_PORT_STATE_DISABLED = 0,
+	TSN_PORT_STATE_BLOCKING,
+	TSN_PORT_STATE_LISTENING,
+	TSN_PORT_STATE_LEARNING,
+	TSN_PORT_STATE_FORWARDING,
+};
+
 /**
  * struct xlnx_tsn - per-IP switch state
  * @ds: DSA switch
-- 
2.34.1


