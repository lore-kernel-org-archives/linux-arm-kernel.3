Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4435C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/MJ8CM1K7hSS7PTpQXyth/WWJ+xU5GKz7A76cWp6uw=; b=4mjbWPQkRxW1sFlL1l/RrVzmX8
	HzLFcNi1wLguPtZAE/J87mYKCdPDW3l1lIPPc0HAIRNxznJlqAoQcnITq6YoRqttRMECSpRQbVvZ7
	41qsfqpo3+PaWGK7ImIR6wFg9eYPj8stSXIq8C6JRVtiTccqqOUKgZqjrqy8yY/s3yTccR8uw8s7x
	OD11jvbMjWaWZWwqsWH7uqXiafZ6bkp5hc27T/pgLU1lUtSSTBAV/UUj1hSkpIryqvv7AmgGEUdT5
	cCfVT0BJ2t92/E4xdp1PCMvwpFU/5SwOGLY98GLwFDRuUjei7CjjGpIj1UiP2Y/ALbwVfo4XvjOV6
	16a7hQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz4s-0000000Eqbk-1XUF;
	Wed, 15 Jul 2026 12:51:06 +0000
Received: from mail-westus2azon11012005.outbound.protection.outlook.com ([52.101.48.5] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz4a-0000000EqLh-2fJZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:50:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkhUpPabyItYSW8ofMNu/hTFPFmC4djvKPqBDoqZv+Vu97P/gH+7iEjZs6gKggYkg5lkVzbDR6xSEi3O6SLUZwuY9apgjgjI//YFpPvj0759jlLajUIqG0cTvPx+TUxc9Xr+Mde22J0IYAwjNxGAuXjtziuu7thL+Qf62z+FQUKRURsP0wVuxR9EP+zXiu6t6oFWW9Z6KHnhMOArPK569BN0WK4YhekYeZlZhmJPGAbNM540EN2o12DI+t6E0DvN+IeIkMgx02q0CtzlL/G6FIKkdpFkUksHA+a8LL0mYxq2NVIJQ7FEDalM+LT6Cjb6szX2lJOxsP0kGo5QQEOL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/MJ8CM1K7hSS7PTpQXyth/WWJ+xU5GKz7A76cWp6uw=;
 b=GQXRVcUpSFGX3ZOYT2tmw1htHt76033BqOWh5XYkty+Q4ZlbSz/rLhCgQEkYpKuzKqD5teV4Is5iJ06bb71S7NesWH9V/5aIX6vsf6h6QscsHDwxK05HTtbcCAEHKa6YoQ7LDH1CZjFs94gbOQstotSZPJ/RoR2+X4+CPFVWNojblW01v6LaVpvp0+gU9keRp0ESqhk2YwlC3iXUm1dv8tBE8xxEjBUfctJIRK3/GyftpPjbDqvAuHkXKvduV1A/ldiqi4gI9uYTVb6ZZAIf2Jt8LkKHh5Ujhmbuh1faVePRDQutBB192P74Fwm1VPIFfTl5SaliH5ZhrAR9VKI2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/MJ8CM1K7hSS7PTpQXyth/WWJ+xU5GKz7A76cWp6uw=;
 b=aD8YU/swjBMOzO61jIPB2mLP+4hBJWkrxvB1Jvb/z7illxr+CB+p3h1BuSVDgszj6rDK/HpDSF1WwgymcZGf6GyPh11YKO2HIEPdaMZxiDCOPG4JwwAK6U6DPjoaT65zZpkqlnU8wXPqEFJ0BXNVnl5nclS2UqYfpR0PbtNmM24=
Received: from CH0P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::31)
 by CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 12:50:39 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::2a) by CH0P223CA0007.outlook.office365.com
 (2603:10b6:610:116::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 12:50:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 12:50:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 15 Jul
 2026 07:50:37 -0500
Received: from xhdharinik40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 15 Jul 2026 07:50:34 -0500
From: Kusuma Vasana <kusuma.vasana@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <dumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <Kusuma.Vasana@amd.com>,
	<Suraj.Gupta2@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] net: axienet: Clear stale AXI DMA TX/RX status before re-enabling interrupts
Date: Wed, 15 Jul 2026 18:20:28 +0530
Message-ID: <20260715125028.2104305-1-kusuma.vasana@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: f046b9fb-0e9a-4837-fc82-08dee26fac14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: V3rsDPu7R0yAY9ScQU2lPU8CTIRs5LRXRUbW3FShVaYp2C38x62X3HcL168UjjXXmozIQCCX6ar/p98r9mtMH8stxNSL4+iVhVC4IC1Qkla144QBDWeOjrE8j3Y2BXoowyxL/MJulrBeCTyah9VN74Qc2BXJzi58NOUWoeUHQcnY0sXs9QjMz0xMrxbcog51ATZ7iGvZuSyM1gYVLbUIpJlhqUTjExBn1sbNCys4uaxH/qgx/EU0moyaMX/meKMY3S2RG1a3Al13hAIqhbdY/5Fu80wuFrLezffDW+U+KMoNAJCSCTQEqgpo29eN0GqydJq7QxPezZxoBUC41DWGVwT8AxckddpxM3JhqMqaBVvTx8oUet0rczz2eJ0Pm7U5njwgbr2EIdjueE6ADp0ZFxNoxPwO4bM8tnFcYIVonwFnQiqF33wRJGZvXgXznovGMUop3vPJqHFKfHxUhJhtPJZ9eQ29aVamISo8NTF16YGkUht/kMMTnKfAo3QtDn2S7kuM5sDkEy/FQ1R9VCkLAsb9YxdzO+7DTlD5KGMeZmO/JrfuC/VwEFZrD2HYVjmqMXq84MjY8Tt4B12D9EQu8NZjx/trTRCHYnEZJWwyOxVYEZmGkcJ2RyE8E+dLK3u0GoZLcGBLSKMCIfv6ljRRnvh0I4eGrm1AvmJJvVQNM8gF+ymZBdIhpGhAoiZKZGMxbMQStbE2L/tZ58J01JjlHQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Atwr19n6I2OyV1P7SBldyN2wSnotG51lbiminKBIBgWciAPIQBvYBuvgg+fGhLa0IQrh5FEU+CjCDNoAo6ZPZ5rW4xD4D1EP8S6GdS26BGWWskHLup9QVTVc6Kn1TyKJ4ozCiCGdZqKDSgmsMQmQ9TPr2JS+Vk+05DsVk56IlD4plSNoNtGyD6zxlpOSS7yK6fK6ZROl+ZpGpBLQs+xZtoNiKowcaVnrdnovtIsRKEE+ZEKFVW4PmifGzLAGilv+Oe5axUFfxJ9dk1BgAy2pzJrcPNFpwL40FhqADnhrT3NJqN/phHZ1CfF53w6meRiPh5Uykv1NguieHy8Fqi6As4GM45gelS1fT7n/GGli+aqJdxIHOUk+xiKipGlBaQrwFFsnhupCLHXcmeTQdg0w3FpRXeg/tZ5iZa8zPZv7MRbvo8mNCGM0LYIFXj9wrVO2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:50:38.8951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f046b9fb-0e9a-4837-fc82-08dee26fac14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055048_712321_45CF3952 
X-CRM114-Status: GOOD (  14.89  )
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

The AXI DMA interrupt line is level-sensitive: it asserts whenever
the IOC (XAXIDMA_IRQ_IOC_MASK) or DELAY (XAXIDMA_IRQ_DELAY_MASK) bits
in the status register (XAXIDMA_TX_SR_OFFSET / XAXIDMA_RX_SR_OFFSET)
are set and their corresponding enable bits in the control register
are active.

During TX/RX, interrupts are disabled in the control register while
NAPI runs. Completions arriving in this window cause hardware to latch
IOC/DELAY into the status register regardless of the control register
mask state. After NAPI completion, re-enabling interrupts immediately
re-asserts the IRQ line due to these stale status register bits, even
when no new work is pending.

This results in a stale interrupt and redundant NAPI poll cycle with
no new work pending, causing unnecessary CPU processing.

In the initial driver, the status register was cleared after polling
all packets, which naturally consumed any status accumulated during
processing. When the driver was converted to NAPI, status register
clearing was moved to the ISR before polling begins, leaving no
mechanism to clear status bits that arrive during the NAPI poll window.
Fix the same.

Signed-off-by: Kusuma Vasana <kusuma.vasana@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fcf517069d16..29050c8d04e2 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1018,6 +1018,13 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 			netif_wake_queue(ndev);
 	}
 
+	/* Clear stale IOC/DELAY bits that may have latched during the
+	 * poll window to prevent a stale interrupt when there is no
+	 * work pending.
+	 */
+	axienet_dma_out32(lp, XAXIDMA_TX_SR_OFFSET,
+			  XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
+
 	if (packets < budget && napi_complete_done(napi, packets)) {
 		/* Re-enable TX completion interrupts. This should
 		 * cause an immediate interrupt if any TX packets are
@@ -1293,6 +1300,13 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
 		cur_p = &lp->rx_bd_v[lp->rx_bd_ci];
 	}
 
+	/* Clear stale IOC/DELAY bits that may have latched during the
+	 * poll window to prevent a stale interrupt when there is no
+	 * work pending.
+	 */
+	axienet_dma_out32(lp, XAXIDMA_RX_SR_OFFSET,
+			  XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
+
 	u64_stats_update_begin(&lp->rx_stat_sync);
 	u64_stats_add(&lp->rx_packets, packets);
 	u64_stats_add(&lp->rx_bytes, size);
-- 
2.43.0


