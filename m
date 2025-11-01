Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91627CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aH/tpmJM+y2IVVNbPdKuUBlhOjAuLonc4VWnT9mO1FQ=; b=fv9ZLKBr2QK2KpSOQyzZ12CTWe
	KiZudIxr/cE5/MWbO/S/vbZNdw0QJ3OR+ykROH0mMEP1WgscujbSFDnPGyn+LGWtL2ekhB1dr/NoG
	BSNu4wv01pEjYb05HTa1s/BUIsyEIJ62P68lzU3plV3WNfcAsQAdBnGNu3b1t6LJIPpyT90ZvS4vT
	8JpiUIiTFSPxF6rlUdtUVf7wpd1JnNwvfZ1bpMElsx6rSuDazBMXDn+iT/R9nxPWCXUvM9JWohCC/
	Uq5zATLekk2x4rTxFMx0Bx4xlBLuC23NKBrpsRVA9Tj5PygTiHOsjC0RbIoEZtWjDz/1g8s23QRsO
	fCo9vwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEBN-00000007uvp-1QaN;
	Sat, 01 Nov 2025 16:10:25 +0000
Received: from mail-eastus2azon11010022.outbound.protection.outlook.com ([52.101.56.22] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEBJ-00000007uuz-3z3l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 16:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CY4m4aLXlv62aNC/piJLwiOANv4Yi8nQNU8GYOHRuBfCgxsipzV1A4OloPLLJh6fPc3xSPMAo3pRQNX3t41xv/r9JTH4KEKZWfGPPYIA+gwCCy+35xxfXWgrIHbc7owD4ygBiIgMYWpPvvYpz5EwDmyT0TnbdnCVrAnHQCDpwnyGTHf5aZKUUvnVlp4IxvL5lReeED9WJlidsCBpdBtXzwbo1e0+38CRkNXhHC2SjGhMS+Zph4yMJVh0jHY32UyksZ8b5D63N2EZU/Re3HQq5LmzTtPmwN2Mx+wX/jbGcwPa31WessKirRmj8DsD/udXiGp5g1eq4TqHB3uY7WvmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aH/tpmJM+y2IVVNbPdKuUBlhOjAuLonc4VWnT9mO1FQ=;
 b=Usf9LhPP6LD5FKP3l1tG2sGLQt+5zUb9bSKm206U6e4Rfv9wh631pVTlcwyPkYyQi/xW/XW445NLc3sY4Xub0uiHNOxfVDJhz5rAfEN6h06/YZELkMELEEAtMr2yG+SqmmhxqYLKUsjvP6WmeR5O66Eo65jdaF1MNPTz2dr/hu1tOFQQXzRoAeWr0GZMCrtBZ7FP9JMDFN/7R5EJsEhM1G/a6oA4Bz2Llc3Fwphp1kC6yPgMjaeyjw1kFbGP4UTcVblvA16ilwA8et1JAn+KOktizvvsLCK9Ldxq9gEYdrYs9HwMVyqmy8x7sefpb6R8uBMSnY7venFz23nNIRugCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH/tpmJM+y2IVVNbPdKuUBlhOjAuLonc4VWnT9mO1FQ=;
 b=ttpHFwK+s1xUrDssj3xO4gvss7brygi7nVzpmnUhH8DPttR5W3J9GRzTTqpZZ1rnpXbTkw/n+rQz+2c3lGVXXvougJ+Igo2La9Q2XMFSiAzSuZKudv02DwLbcYaPDpOjwFIADT+tzGBMMbb7cPZhe+NHwwVRMyQIjLihUbTOsSY=
Received: from MN0P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::30)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 16:10:10 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::fe) by MN0P223CA0003.outlook.office365.com
 (2603:10b6:208:52b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Sat,
 1 Nov 2025 16:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Sat, 1 Nov 2025 16:10:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 1 Nov
 2025 09:09:56 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 1 Nov
 2025 11:09:55 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 1 Nov 2025 09:09:53 -0700
From: Neal Frager <neal.frager@amd.com>
To: <gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, <git@amd.com>
CC: <michal.simek@amd.com>, <jguittet@witekio.com>,
	<jay.buddhabhatti@amd.com>, <arun.balaji.kannan@amd.com>,
	<senthilnathan.thangaraj@amd.com>, <thomas.hommel@emerson.com>,
	<micheal.saleab@amd.com>, Neal Frager <neal.frager@amd.com>
Subject: [PATCH v1 1/1] arm64: dts: xilinx: fix zynqmp opp-table-cpu
Date: Sat, 1 Nov 2025 16:09:51 +0000
Message-ID: <20251101160951.3067804-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DM4PR12MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 1983d488-b6e4-439c-8a61-08de196121e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J3BpRTUapqMltUF8e6giwKVHqkO8ovKRyxXxMu/y+Gf94E8aA6sTAOUkTJwR?=
 =?us-ascii?Q?HCXILYXNvmMlEoity4dbDZWRg6BaYHz9zK6HnJPtdluo8Qn/lnrMasVcIWKu?=
 =?us-ascii?Q?lSvjQMSbgcpqc+Nf5wU/GFOqXKKMGR+rysjH2k7tN9HIYKG6LkAhbyqINqok?=
 =?us-ascii?Q?9/Th12z0EQS/uIczNiarf4qoI0TRWv+YiZEexIjxXs/qgzo1JxxMu9OXfPGl?=
 =?us-ascii?Q?1ClOo7frQXtY5N6hMBN2P+UF1/sFJpRQdN00Ki3aR2Q7R7Y7hPhj/fa1QSqv?=
 =?us-ascii?Q?EWW+q6tIJOKHHnP3RzHaW+s6DnrzszzI9cEIQxtrv1oXWCYU79JWe/cJnrAE?=
 =?us-ascii?Q?mKDyaEIidDRyjtEEBF505WXKdxWxEtROVBgUldunJn4N661IlveGzbMim9hr?=
 =?us-ascii?Q?lg10idnVLEKV2PfTLfDGq08NBlO14TkQaY83ju8DPtM+IgqmHFGgFt96U7As?=
 =?us-ascii?Q?crkjMEdi0OfpYBa4XRr99GYuyhB0PgOSiVx4cNgkdvdtEPQMYjDaH5gJrjGb?=
 =?us-ascii?Q?uK96BEn78RY3zSfeBCbdnXTVjVhFZ+M9eXPuJjQROvyszX6fci73Od/2rTrP?=
 =?us-ascii?Q?rYBh5OnuHmHb2QfsaD5wYlHC5NOKE7E5Kqml1z51VjgL0vJlqMY978SgqoNU?=
 =?us-ascii?Q?eHYNlk2mCitYncxGiuFT2hEC0bT1pBlcwkyqc9Us8MHo5H2iIg0Qs+cJWHo4?=
 =?us-ascii?Q?dwX5yM5bwqU/QzaLKtrdPkLWusN7zxNFA1Wr2mxHHoB9NHyP8VLT5OQwRXmK?=
 =?us-ascii?Q?UCOTQrVgdu+FMNlASiu+TUh21Q0kpcd4kiiv7KSZfJalYigeCGBbVmlj4p0k?=
 =?us-ascii?Q?EIIE9LkBTlBF4+nE5AItCxtU/6JzDChiyMZgdoQeykPCIMsxpAYFdBS9DRTi?=
 =?us-ascii?Q?EwHa/0Ea/M6Ok92N20wESGUHxlCzkOS5/h6EVf+Sx9y/gtAVauaTL6fFjivN?=
 =?us-ascii?Q?Y04ZnCjXoLctNnlKu0MapKKvU/s6chX8K/5ZVFc2XVS/1zOmahT5r8+bq/L+?=
 =?us-ascii?Q?HM2ccnNozfN7Z6KyZuTf72rddzJdXlP+qr+QUg/UvpNELUQFbcjGHTD5yV4M?=
 =?us-ascii?Q?Q9kgH5bX7FtWzzOghcfiqQ7DbWffJZxm9+J+gkf4P3P4Bo5u4MMsN6s++fDm?=
 =?us-ascii?Q?27n13m+PbyMjwgH6v2gZak3fIpWBmBh50bWJe19vbQjTXblVvrGBXXyQ1QgR?=
 =?us-ascii?Q?Dqt39wh1sxdiegWl6hWLJIWrogR0xzibuXsxAemV5JjiiTYapjn9XylHc5Ir?=
 =?us-ascii?Q?m+EbVNWz1ricq6RbyTJ5ssodw80GoYffs5PLO/P908dn6jLKwrdGgilRj6qr?=
 =?us-ascii?Q?YUomkzTgJy6GvybPJ0ZTJEPRNyxY6D3FF23IhGipw5fo3cmqbQPOWTJ2Hz4v?=
 =?us-ascii?Q?Q4tc2pcgRNxZ2OXzC928p7jQeYDBq4nYc1ckxqlt1SIf1QGzsD6IBVYaAo2U?=
 =?us-ascii?Q?CTvfia9MjCKpS1PFpxfw5zfXoriUd4+pZQmXzpJqQfAf4Gh3qe7aJJCg5L3r?=
 =?us-ascii?Q?hyUN/Lrmvo9K/o9OQfnnClav2asKcJkrgtcbQo+N2Q3YSWT6l9XEZTKbcYvL?=
 =?us-ascii?Q?Q1yDIPP9zhCR+OK1lvc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 16:10:10.3980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1983d488-b6e4-439c-8a61-08de196121e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_091022_044272_9013AFA2 
X-CRM114-Status: GOOD (  13.14  )
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

Since the following commit, the zynqmp clk driver uses the common
divider_round_rate() when determining the appropriate clock divider for a
requested clock frequency:
https://github.com/torvalds/linux/commit/1fe15be1fb613534ecbac5f8c3f8744f757d237d

This means that the typical parent clock rate will be 1200000000 based on the
zynqmp pll configuration. If the current zynqmp.dtsi opp-hz values are used,
this will mean the divider calculations are always slightly above the correct
integer divider value meaning they will get rounded up to a divider value
which is one to high. The result of this issue is that the cpu clock speed
will always be one opp lower than the requested clock rate.

For example, the following will occur when requesting 1.2 GHz with the current
zynqmp.dtsi:

root@zynqmp:/sys/kernel/tracing# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
299999 399999 599999 1199999
root@zynqmp:/ # echo 1200000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
root@zynqmp:/ # cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq
600000

To fix this issue, this patch updates the zynqmp opp-table-cpu, so the clock
rates are calculated correctly.

root@zynqmp:/sys/kernel/tracing# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
300000 400000 600000 1200000
root@zynqmp:/ # echo 1200000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
root@zynqmp:/ # cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq
1200000

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 38 +++++++++++++-------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 938b014ca923..484901dcbdba 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -103,25 +103,25 @@ CPU_SLEEP_0: cpu-sleep-0 {
 	cpu_opp_table: opp-table-cpu {
 		compatible = "operating-points-v2";
 		opp-shared;
-		opp00 {
-			opp-hz = /bits/ 64 <1199999988>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <500000>;
-		};
-		opp01 {
-			opp-hz = /bits/ 64 <599999994>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <500000>;
-		};
-		opp02 {
-			opp-hz = /bits/ 64 <399999996>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <500000>;
-		};
-		opp03 {
-			opp-hz = /bits/ 64 <299999997>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <500000>;
+		opp-1200000000 {
+			opp-hz = <0x00 0x47868c00>;
+			clock-latency-ns = <0x7a120>;
+			opp-microvolt = <0xf4240>;
+		};
+		opp-600000000 {
+			opp-hz = <0x00 0x23c34600>;
+			clock-latency-ns = <0x7a120>;
+			opp-microvolt = <0xf4240>;
+		};
+		opp-400000000 {
+			opp-hz = <0x00 0x17d78400>;
+			clock-latency-ns = <0x7a120>;
+			opp-microvolt = <0xf4240>;
+		};
+		opp-300000000 {
+			opp-hz = <0x00 0x11e1a300>;
+			clock-latency-ns = <0x7a120>;
+			opp-microvolt = <0xf4240>;
 		};
 	};
 
-- 
2.25.1


