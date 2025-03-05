Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC03C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pUoO09MYFSY7H1znYvfGa7jL/ZGhwkgxZ+hya5/sw48=; b=gTh/9H7shtNYfC7wzBfMsueadR
	rNAuENt0MxpslWnvQ5kouy1fuu9snA/yF7FvSWkRjbDrBGgXs7lKwjdkwct2iIFeFgnamB0m+r4tQ
	5UsHihgJ5R1DeoltBtWSPya5Eg5+AYILY1BUSXjxFDkAH7uZs395HD5TmqQ8BO/0dTHDSFW3NFig2
	hhVpz/VKg1io5cKO+CdNDU1gH3+Sg3RzsuW9qqc+bI7Y1t3/suTp46q3vKKtNM2nc7ttCuDgvojsu
	6HCn1HdnFWcjSisnUUKCirOPEgPYq6TCa/Iea3gO4Az07fPBdIbTZz15ReDHOnI/CQomRd6XHdyFd
	U5He/6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnYm-00000007xXn-434e;
	Wed, 05 Mar 2025 12:09:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmjc-00000007pHm-0rA3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:16:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525BGBwo3933778
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 05:16:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741173371;
	bh=pUoO09MYFSY7H1znYvfGa7jL/ZGhwkgxZ+hya5/sw48=;
	h=From:To:CC:Subject:Date;
	b=FzhJGJGNYNeIBow1V/v7Va3m4j+tDD/yAR5RSBeFtOa4L7ZMKLXFQ1bEFP4aU3jhQ
	 C5tvZ+Mip0EAc4pFQeqVUs09Q/Y4i7MCuRZaNjPG2x/sZp5MoTCiO7eS3FCvy7xrB2
	 nSzllldVO/ZSJuMgnkNsdOAn3Uv3KNvSqlaGwyUM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525BGBKv120467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Mar 2025 05:16:11 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 05:16:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 05:16:10 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525BGARA106207;
	Wed, 5 Mar 2025 05:16:10 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 525BG9WE014392;
	Wed, 5 Mar 2025 05:16:10 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Meghana Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Lee Trager <lee@trager.us>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Roger Quadros <rogerq@kernel.org>,
        MD Danish Anwar
	<danishanwar@ti.com>,
        Jonathan Corbet <corbet@lwn.net>, Simon Horman
	<horms@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>
Subject: [PATCH net-next v2] net: ti: icssg-prueth: Add ICSSG FW Stats
Date: Wed, 5 Mar 2025 16:46:08 +0530
Message-ID: <20250305111608.520042-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_031620_339962_CBA65D2A 
X-CRM114-Status: GOOD (  25.41  )
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

The ICSSG firmware maintains set of stats called PA_STATS.
Currently the driver only dumps 4 stats. Add support for dumping more
stats.

The offset for different stats are defined as MACROs in icssg_switch_map.h
file. All the offsets are for Slice0. Slice1 offsets are slice0 + 4.
The offset calculation is taken care while reading the stats in
emac_update_hardware_stats().

The statistics are documented in
Documentation/networking/device_drivers/icssg_prueth.rst

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
v1 - v2:
*) Created icssg_prueth.rst and added Documentation of firmware statistics
as suggested by Jakub Kicinski <kuba@kernel.org>
*) Removed unimplemented preemption statistics.
*) Collected RB tag from Simon Horman <horms@kernel.org>

v1 - https://lore.kernel.org/all/20250227093712.2130561-1-danishanwar@ti.com/

 .../device_drivers/ethernet/index.rst         |  1 +
 .../ethernet/ti/icssg_prueth.rst              | 56 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  2 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.c   |  6 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.h   | 58 ++++++++++++-------
 .../net/ethernet/ti/icssg/icssg_switch_map.h  | 33 +++++++++++
 6 files changed, 129 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/networking/device_drivers/ethernet/ti/icssg_prueth.rst

diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
index 6fc1961492b7..cd5f31dd07ce 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -55,6 +55,7 @@ Contents:
    ti/cpsw_switchdev
    ti/am65_nuss_cpsw_switchdev
    ti/tlan
+   ti/icssg_prueth
    toshiba/spider_net
    wangxun/txgbe
    wangxun/ngbe
diff --git a/Documentation/networking/device_drivers/ethernet/ti/icssg_prueth.rst b/Documentation/networking/device_drivers/ethernet/ti/icssg_prueth.rst
new file mode 100644
index 000000000000..da21ddf431bb
--- /dev/null
+++ b/Documentation/networking/device_drivers/ethernet/ti/icssg_prueth.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================
+Texas Instruments ICSSG PRUETH ethernet driver
+==============================================
+
+:Version: 1.0
+
+ICSSG Firmware
+==============
+
+Every ICSSG core has two Programmable Real-Time Unit(PRUs), two auxiliary
+Real-Time Transfer Unit (RTUs), and two Transmit Real-Time Transfer Units
+(TX_PRUs). Each one of these runs its own firmware. The firmwares combnined are
+referred as ICSSG Firmware.
+
+Firmware Statistics
+===================
+
+The ICSSG firmware maintains certain statistics which are dumped by the driver
+via ``ethtool -S <interface>``
+
+These statistics are as follows,
+
+ - ``FW_RTU_PKT_DROP``: Diagnostic error counter which increments when RTU drops a locally injected packet due to port being disabled or rule violation.
+ - ``FW_Q0_OVERFLOW``: TX overflow counter for queue0
+ - ``FW_Q1_OVERFLOW``: TX overflow counter for queue1
+ - ``FW_Q2_OVERFLOW``: TX overflow counter for queue2
+ - ``FW_Q3_OVERFLOW``: TX overflow counter for queue3
+ - ``FW_Q4_OVERFLOW``: TX overflow counter for queue4
+ - ``FW_Q5_OVERFLOW``: TX overflow counter for queue5
+ - ``FW_Q6_OVERFLOW``: TX overflow counter for queue6
+ - ``FW_Q7_OVERFLOW``: TX overflow counter for queue7
+ - ``FW_DROPPED_PKT``: This counter is incremented when a packet is dropped at PRU because of rule violation.
+ - ``FW_RX_ERROR``: Incremented if there was a CRC error or Min/Max frame error at PRU
+ - ``FW_RX_DS_INVALID``: Incremented when RTU detects Data Status invalid condition
+ - ``FW_TX_DROPPED_PACKET``: Counter for packets dropped via TX Port
+ - ``FW_TX_TS_DROPPED_PACKET``: Counter for packets with TS flag dropped via TX Port
+ - ``FW_INF_PORT_DISABLED``: Incremented when RX frame is dropped due to port being disabled
+ - ``FW_INF_SAV``: Incremented when RX frame is dropped due to Source Address violation
+ - ``FW_INF_SA_DL``: Incremented when RX frame is dropped due to Source Address being in the denylist
+ - ``FW_INF_PORT_BLOCKED``: Incremented when RX frame is dropped due to port being blocked and frame being a special frame
+ - ``FW_INF_DROP_TAGGED`` : Incremented when RX frame is dropped for being tagged
+ - ``FW_INF_DROP_PRIOTAGGED``: Incremented when RX frame is dropped for being priority tagged
+ - ``FW_INF_DROP_NOTAG``: Incremented when RX frame is dropped for being untagged
+ - ``FW_INF_DROP_NOTMEMBER``: Incremented when RX frame is dropped for port not being member of VLAN
+ - ``FW_RX_EOF_SHORT_FRMERR``: Incremented if End Of Frame (EOF) task is scheduled without seeing RX_B1
+ - ``FW_RX_B0_DROP_EARLY_EOF``: Incremented when frame is dropped due to Early EOF
+ - ``FW_TX_JUMBO_FRM_CUTOFF``: Incremented when frame is cut off to prevent packet size > 2000 Bytes
+ - ``FW_RX_EXP_FRAG_Q_DROP``: Incremented when express frame is received in the same queue as the previous fragment
+ - ``FW_RX_FIFO_OVERRUN``: RX fifo overrun counter
+ - ``FW_CUT_THR_PKT``: Incremented when a packet is forwarded using Cut-Through forwarding method
+ - ``FW_HOST_RX_PKT_CNT``: Number of valid packets sent by Rx PRU to Host on PSI
+ - ``FW_HOST_TX_PKT_CNT``: Number of valid packets copied by RTU0 to Tx queues
+ - ``FW_HOST_EGRESS_Q_PRE_OVERFLOW``: Host Egress Q (Pre-emptible) Overflow Counter
+ - ``FW_HOST_EGRESS_Q_EXP_OVERFLOW``: Host Egress Q (Pre-emptible) Overflow Counter
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 329b46e9ee53..ff7fce26e851 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -50,7 +50,7 @@
 
 #define ICSSG_MAX_RFLOWS	8	/* per slice */
 
-#define ICSSG_NUM_PA_STATS	4
+#define ICSSG_NUM_PA_STATS	32
 #define ICSSG_NUM_MIIG_STATS	60
 /* Number of ICSSG related stats */
 #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
index 8800bd3a8d07..3f1400e0207c 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
@@ -11,7 +11,6 @@
 
 #define ICSSG_TX_PACKET_OFFSET	0xA0
 #define ICSSG_TX_BYTE_OFFSET	0xEC
-#define ICSSG_FW_STATS_BASE	0x0248
 
 static u32 stats_base[] = {	0x54c,	/* Slice 0 stats start */
 				0xb18,	/* Slice 1 stats start */
@@ -44,9 +43,8 @@ void emac_update_hardware_stats(struct prueth_emac *emac)
 
 	if (prueth->pa_stats) {
 		for (i = 0; i < ARRAY_SIZE(icssg_all_pa_stats); i++) {
-			reg = ICSSG_FW_STATS_BASE +
-			      icssg_all_pa_stats[i].offset *
-			      PRUETH_NUM_MACS + slice * sizeof(u32);
+			reg = icssg_all_pa_stats[i].offset +
+			      slice * sizeof(u32);
 			regmap_read(prueth->pa_stats, reg, &val);
 			emac->pa_stats[i] += val;
 		}
diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
index e88b919f532c..5ec0b38e0c67 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
@@ -155,24 +155,10 @@ static const struct icssg_miig_stats icssg_all_miig_stats[] = {
 	ICSSG_MIIG_STATS(tx_bytes, true),
 };
 
-/**
- * struct pa_stats_regs - ICSSG Firmware maintained PA Stats register
- * @fw_rx_cnt: Number of valid packets sent by Rx PRU to Host on PSI
- * @fw_tx_cnt: Number of valid packets copied by RTU0 to Tx queues
- * @fw_tx_pre_overflow: Host Egress Q (Pre-emptible) Overflow Counter
- * @fw_tx_exp_overflow: Host Egress Q (Express) Overflow Counter
- */
-struct pa_stats_regs {
-	u32 fw_rx_cnt;
-	u32 fw_tx_cnt;
-	u32 fw_tx_pre_overflow;
-	u32 fw_tx_exp_overflow;
-};
-
-#define ICSSG_PA_STATS(field)			\
-{						\
-	#field,					\
-	offsetof(struct pa_stats_regs, field),	\
+#define ICSSG_PA_STATS(field)	\
+{				\
+	#field,			\
+	field,			\
 }
 
 struct icssg_pa_stats {
@@ -181,10 +167,38 @@ struct icssg_pa_stats {
 };
 
 static const struct icssg_pa_stats icssg_all_pa_stats[] = {
-	ICSSG_PA_STATS(fw_rx_cnt),
-	ICSSG_PA_STATS(fw_tx_cnt),
-	ICSSG_PA_STATS(fw_tx_pre_overflow),
-	ICSSG_PA_STATS(fw_tx_exp_overflow),
+	ICSSG_PA_STATS(FW_RTU_PKT_DROP),
+	ICSSG_PA_STATS(FW_Q0_OVERFLOW),
+	ICSSG_PA_STATS(FW_Q1_OVERFLOW),
+	ICSSG_PA_STATS(FW_Q2_OVERFLOW),
+	ICSSG_PA_STATS(FW_Q3_OVERFLOW),
+	ICSSG_PA_STATS(FW_Q4_OVERFLOW),
+	ICSSG_PA_STATS(FW_Q5_OVERFLOW),
+	ICSSG_PA_STATS(FW_Q6_OVERFLOW),
+	ICSSG_PA_STATS(FW_Q7_OVERFLOW),
+	ICSSG_PA_STATS(FW_DROPPED_PKT),
+	ICSSG_PA_STATS(FW_RX_ERROR),
+	ICSSG_PA_STATS(FW_RX_DS_INVALID),
+	ICSSG_PA_STATS(FW_TX_DROPPED_PACKET),
+	ICSSG_PA_STATS(FW_TX_TS_DROPPED_PACKET),
+	ICSSG_PA_STATS(FW_INF_PORT_DISABLED),
+	ICSSG_PA_STATS(FW_INF_SAV),
+	ICSSG_PA_STATS(FW_INF_SA_DL),
+	ICSSG_PA_STATS(FW_INF_PORT_BLOCKED),
+	ICSSG_PA_STATS(FW_INF_DROP_TAGGED),
+	ICSSG_PA_STATS(FW_INF_DROP_PRIOTAGGED),
+	ICSSG_PA_STATS(FW_INF_DROP_NOTAG),
+	ICSSG_PA_STATS(FW_INF_DROP_NOTMEMBER),
+	ICSSG_PA_STATS(FW_RX_EOF_SHORT_FRMERR),
+	ICSSG_PA_STATS(FW_RX_B0_DROP_EARLY_EOF),
+	ICSSG_PA_STATS(FW_TX_JUMBO_FRM_CUTOFF),
+	ICSSG_PA_STATS(FW_RX_EXP_FRAG_Q_DROP),
+	ICSSG_PA_STATS(FW_RX_FIFO_OVERRUN),
+	ICSSG_PA_STATS(FW_CUT_THR_PKT),
+	ICSSG_PA_STATS(FW_HOST_RX_PKT_CNT),
+	ICSSG_PA_STATS(FW_HOST_TX_PKT_CNT),
+	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_PRE_OVERFLOW),
+	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW),
 };
 
 #endif /* __NET_TI_ICSSG_STATS_H */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
index 424a7e945ea8..490a9cc06fb0 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
@@ -231,4 +231,37 @@
 /* Start of 32 bits PA_STAT counters */
 #define PA_STAT_32b_START_OFFSET                           0x0080
 
+#define FW_RTU_PKT_DROP			0x0088
+#define FW_Q0_OVERFLOW			0x0090
+#define FW_Q1_OVERFLOW			0x0098
+#define FW_Q2_OVERFLOW			0x00A0
+#define FW_Q3_OVERFLOW			0x00A8
+#define FW_Q4_OVERFLOW			0x00B0
+#define FW_Q5_OVERFLOW			0x00B8
+#define FW_Q6_OVERFLOW			0x00C0
+#define FW_Q7_OVERFLOW			0x00C8
+#define FW_DROPPED_PKT			0x00F8
+#define FW_RX_ERROR			0x0100
+#define FW_RX_DS_INVALID		0x0108
+#define FW_TX_DROPPED_PACKET		0x0110
+#define FW_TX_TS_DROPPED_PACKET		0x0118
+#define FW_INF_PORT_DISABLED		0x0120
+#define FW_INF_SAV			0x0128
+#define FW_INF_SA_DL			0x0130
+#define FW_INF_PORT_BLOCKED		0x0138
+#define FW_INF_DROP_TAGGED		0x0140
+#define FW_INF_DROP_PRIOTAGGED		0x0148
+#define FW_INF_DROP_NOTAG		0x0150
+#define FW_INF_DROP_NOTMEMBER		0x0158
+#define FW_RX_EOF_SHORT_FRMERR		0x0188
+#define FW_RX_B0_DROP_EARLY_EOF		0x0190
+#define FW_TX_JUMBO_FRM_CUTOFF		0x0198
+#define FW_RX_EXP_FRAG_Q_DROP		0x01A0
+#define FW_RX_FIFO_OVERRUN		0x01A8
+#define FW_CUT_THR_PKT			0x01B0
+#define FW_HOST_RX_PKT_CNT		0x0248
+#define FW_HOST_TX_PKT_CNT		0x0250
+#define FW_HOST_EGRESS_Q_PRE_OVERFLOW	0x0258
+#define FW_HOST_EGRESS_Q_EXP_OVERFLOW	0x0260
+
 #endif /* __NET_TI_ICSSG_SWITCH_MAP_H  */

base-commit: f252f23ab657cd224cb8334ba69966396f3f629b
-- 
2.34.1


