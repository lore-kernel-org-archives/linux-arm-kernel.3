Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F02CCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pEeSSGWf3h8SCfUjIiXsvhaOWKWqwR/7CfPF03sEub0=; b=pkbjEDzMEm/+6E6+ac6EWi36J4
	wNRaIdbJrNJY0XlIma/Aq68aaB/3MbXisIc3xGX5Fq0HfgZ1kb3PrpZ0DV7oJm8W1w8csUrNUIkci
	h86PTnF1eT2WlkEHhY1QSFXsuUX4DGH5O3KZLlu5qGYndM61EMWQW4iFQFkNdFwy+BD2QGwCcWUdH
	C3eh2KLOK4iabdPrR7L1JGiHvCU/JexuQ9Plkn6SL9+bT8iRZrb94/037zbER5Owt34MhBGRixk3S
	DJxvXlHwiqR19gq5RBhqyKI7ClUUiIAWCkqZg5JQW4aBpaW9tgXA5uKp0P9SdAuvORFTh2viFwxuQ
	41KP136g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoga-00000009KwJ-32MC;
	Mon, 03 Nov 2025 07:09:04 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFogY-00000009Kvn-0ovc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixu5bl+xwMg0Izo59pRha8cEv8wVmlInczKWYqUuKff2SOPuPvb2Jc9CkYwdarJ6trrUZV/htV9VhovgVYliIyetUKXAFFfQYneLNJ2EbzgYEwSm9QoqA7WC8wnQ+mCn8KCvMiQlQeLNlKvSyHyxb8lhX7qVG2AofuvrVnl54owZcPh9B/FnFOnXd8/ce5Mvm4VcxheaTrmrC/SqM1EDqWFR0Hch2QkhlARZCRF1uRpYuEsIf4S1e6Ppa+TyFSv3Fm5bO0ihRMGcviNTlWO7z0KVGw6ZTyBRpFkpaursKT2D321I4h8KIJwiawtRpM+6vekqxGOSab7lLETp1P6p8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEeSSGWf3h8SCfUjIiXsvhaOWKWqwR/7CfPF03sEub0=;
 b=kEvfSTwZizRbFaURaDDKbzbf0Kf4KZBYOVqKF5XLHqGIzixsxrFdaU9ftqi511jea7Svc8tQom8p3q4J3Ovo/mrFfNR7OXbXn1WBHZSmZMgsPTpwiqz51outuuKtBx4xjzPNTCfn0uNCFPDZkeLv4HvBBsoBSZwyST6PQdM2BfXzRTDECCLLs93at9Maq5VAS3rywjw0Hg4dOBC7002Q3QLL5Pt9gTWciUR4J/K9YJIUVJN/Vob1G+0TnIuLzWOrpsFWGhxKY/Q+zhQi9soGCShdQPRqyIw20d+FgUm3WlTvYF5FJ2WIWFt1voYldO0ds3PvKcL5XjXX+BMVa721Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEeSSGWf3h8SCfUjIiXsvhaOWKWqwR/7CfPF03sEub0=;
 b=yMnawsSE16D6EuSO7AaZf2wfRsNxhUXwCx6B5YWZ5DCoO0DYxnIGUMc4akhELkwgIqDRiK1D0Z3/L3KUmxKiTJKv1/uqPy1YG08Waj5R2yQfhubHrQIch62qXahFd2/Zq26MXrt4sV6BhicRfH15Q0F/yuoaB+bQQW+eJriP89s=
Received: from BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 06:53:51 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::ff) by BYAPR08CA0026.outlook.office365.com
 (2603:10b6:a03:100::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 06:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 06:53:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 2 Nov
 2025 22:53:48 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 2 Nov 2025 22:53:46 -0800
From: Neal Frager <neal.frager@amd.com>
To: <gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, <git@amd.com>
CC: <michal.simek@amd.com>, <jguittet@witekio.com>,
	<jay.buddhabhatti@amd.com>, <arun.balaji.kannan@amd.com>,
	<senthilnathan.thangaraj@amd.com>, <thomas.hommel@emerson.com>,
	<micheal.saleab@amd.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, Neal Frager <neal.frager@amd.com>
Subject: [PATCH v2 1/1] arm64: dts: xilinx: fix zynqmp opp-table-cpu
Date: Mon, 3 Nov 2025 06:53:44 +0000
Message-ID: <20251103065344.4022482-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b598ad-9375-41f7-be41-08de1aa5bdf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G409aUdBwP1oihhC+9EUNBpR/tl+eN+MDi+SE25/AIEA5sVN4CXlP8Wk8wTq?=
 =?us-ascii?Q?55LWW0lW6ZqZMnHg2e3BUYfNBEPBzblEixmz9VaUNW2tjVswn7iDOEMSL7RN?=
 =?us-ascii?Q?+sFhB7Kd+sPjAjPn5p06ZbK0zICqDcx/36z4RCldqRdVsbCHMxF+6yNZ1cDz?=
 =?us-ascii?Q?w7/8JB178zYY4x8+9a8tJjUs5zKr295rUD7pxR5fTqhnds5hpjhUig7D7NhM?=
 =?us-ascii?Q?RxE5MBPLNWNLKgjSQ91NLp3gQhiSzZetCuAnAyZ2YtPQB/2btegORxq+vyHl?=
 =?us-ascii?Q?RWcfEtC2yauQ+geE6qhxSp3JjfwJZrzqfWfV2tLZoN1QzAq152jWmkG3ChWC?=
 =?us-ascii?Q?sqiCR6hM68Ue5a7zZ06cxtp4a/zTVW8CEYI/darPBKVx4wX1XI5PH74WAhED?=
 =?us-ascii?Q?FlxDhbekSMiOmbEY73oCK/7P7ruRVcFdvVCJbSGEtV7YND5OKHZ/KUJWVvoV?=
 =?us-ascii?Q?43wMmCo0ZGHDQbbXr7E94V9msMIEtDTFoxsK44jsx7gFi6Q0RP9QMj3Sjph5?=
 =?us-ascii?Q?QQLUV+8w/RJk8Fp1Fy5mOiPLywbCabSFwBylEZjlVuMSWQIVuarBHNuAPN6c?=
 =?us-ascii?Q?oVKHhz7dsBGv4Q/KniVkTnkrDyHhpDnnZdhk5vr/k//odhO0DPiPpA9DJgTj?=
 =?us-ascii?Q?wQZ8VqPL8rOUTYoSZkq1uHQEcF8aIhHNnEv+EMLN970y6+xTIY5AYqjOKjFm?=
 =?us-ascii?Q?XMo4NjZbTxcvusFDevskTnetO/S1qvt+rJiLOIA9Zfl1w3SzwIMMdrRTW/fW?=
 =?us-ascii?Q?cEb5FVcTwOYCew13WUAaVVdK0h8BOxxUu3ZSdiUB/0l/Q24y5P4B/jQiUJ/Q?=
 =?us-ascii?Q?P1vthoP8eAcXqt0rcXBloJjZ1JW5aS1nAIHuyA+oATApweNoBmFxaMNZxJpY?=
 =?us-ascii?Q?A1sh3nL5bhLsL0/K5D1JZqAz5An20FdZQqAfDFGsum+UimjFI+eWbdj7yoC+?=
 =?us-ascii?Q?V4xNZwEzCfLDYyLm2smRVB6cp3na+fbIpkwNegc+WTPEvK+GTdrCBKfJe+uR?=
 =?us-ascii?Q?cAARKP17nPLxPtH7P78iUaTf0c5ADbLjPJwJhj8a3n0nfkNEm2CCOXkSI2EM?=
 =?us-ascii?Q?x08IUoDUure0d4J2P4iAWr32XHCBALii2qqdu/CX3SKRVS0bl49+oNXb8Nec?=
 =?us-ascii?Q?TnWIqAIzf6hYBOlHLfSSnGxC1kopL2f21QlhFTMtZndSeIlBM7WJ0xeWC4fM?=
 =?us-ascii?Q?+wCsbu+2nO/z/bxPIF0DliZaWvm9fFthBkvtwvnvCJyM6C2g30u5hI5YuxwZ?=
 =?us-ascii?Q?LscxTF9sF3DwNENeQr0Ig0JAOu2Z42vP8XkzeFwQc0CjPVI+n1DI5IemAl/K?=
 =?us-ascii?Q?+opZVRe4ad9JcRnVdRhQtL1IsMcA5AkbUjIaKOTMwwLHy2ITGjM0OadhTuYW?=
 =?us-ascii?Q?A/46Lz7Y5ECaTHN13vzHyyMP4aFLCdQADFWt/rH5MNOExN9XYzFYYMddBdmo?=
 =?us-ascii?Q?lOWVKBo+qtMkIaXQGqm8hQOM9nnMTADeyrlP5wC4YSCyn1MWf+KEVt3ekUUj?=
 =?us-ascii?Q?87gBqTsuILw7zDB5iTZWD0wKBXcVwCR10ZFrcs8MeogAugQxOlZX63luF9U6?=
 =?us-ascii?Q?bs94GlfKOgQR2ZNIXmw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 06:53:49.0632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b598ad-9375-41f7-be41-08de1aa5bdf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_230902_233486_48ABBD2C 
X-CRM114-Status: GOOD (  14.29  )
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
which is one too high. The result of this issue is that the cpu clock speed
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
V1->V2:
- The clock-latency-ns and opp-microvolt values did not change, so simplify
  the patch by only changing the opp-hz values in decimal format.
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 938b014ca923..dd9bd39f61e8 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -103,23 +103,23 @@ CPU_SLEEP_0: cpu-sleep-0 {
 	cpu_opp_table: opp-table-cpu {
 		compatible = "operating-points-v2";
 		opp-shared;
-		opp00 {
-			opp-hz = /bits/ 64 <1199999988>;
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <1000000>;
 			clock-latency-ns = <500000>;
 		};
-		opp01 {
-			opp-hz = /bits/ 64 <599999994>;
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
 			opp-microvolt = <1000000>;
 			clock-latency-ns = <500000>;
 		};
-		opp02 {
-			opp-hz = /bits/ 64 <399999996>;
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
 			opp-microvolt = <1000000>;
 			clock-latency-ns = <500000>;
 		};
-		opp03 {
-			opp-hz = /bits/ 64 <299999997>;
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
 			opp-microvolt = <1000000>;
 			clock-latency-ns = <500000>;
 		};
-- 
2.25.1


