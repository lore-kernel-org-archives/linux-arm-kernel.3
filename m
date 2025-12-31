Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43233EE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pg49SxLvfHY9TySVxPdGl7/qZlYYFhmqYAnv45GrqEI=; b=is01twVtgw8ODlmt4zf4zrEo39
	khGiqUGnfJQCsujgrrtbtAUdHj2joyPppyJ5YTjlf8WFv4vcNri6F6G8fJ6oX/pf0qD9YamxUzjIu
	2ThpWJKVTNMMXuSqkUWRZ6XkcZg8o31Wv7WQUDIj9x+dKKHNc/gEQgYMR7t403GEZBHGlb4T4NpMw
	UTXtkSmwePqAYDrniU3tvPeVGx7wg49OcDDAJ1x4OEkVhLd4ppZrjvYtcxxg5ADM8wo93L0HdXmwp
	0+4O21+JBv0F6S5MD4pVzVXJTcMVKK17E0A+/xPyDs5HbQhO6pm549XsqQ8G9sQkQhzr50Z41dGB7
	yntFE/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6v-00000005a5a-1F5X;
	Wed, 31 Dec 2025 02:38:53 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6m-00000005a2x-2kLF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pohYe9TCKVKdPUz5HogvwHOi14KnR2hsXx4PtLYlNRGqCdA2pUWy+Yn79qUye0cCyqKcNZta+W461dhH6OhbPqbDJ/0IOfRJp5r4/Ig6M2Sdre7/sIVOWGCOHqeOW/9gCiq9P7kEXJK/jWaVavAhC0puXraFWTwhMBFxlSypYOb2578mpP/nok/BPEG0zs55rRgUthhzx199pHDq4nfsYRgl/nLC+Lwj7eeDMLJk5vhHSOiRd87WNHF3tUNoP6dGELeuacTHFsu9hyZadlyhHo485ODOjySUh8Hg/UMxd0FRhOYPACWCHvzX9Uu3gLay/KpCbYp6L9xWozRDH1Cj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg49SxLvfHY9TySVxPdGl7/qZlYYFhmqYAnv45GrqEI=;
 b=f5vI3aeh1pOkx0SKSOSbdkMjACBrs44dJmOfQibQRmlDwIJeYOFRnpYo2aBd0GB3um3oRA3/KQg5mrqXhzAoFIbTx2CaL9mQLExRyY6rYX15rMvEGEbT+1a1sf8Zsy2v+H8kvaEEDOOp+Cp4aRIOF2rjmMVBHz9mTfsw/OIlBQnsLhmDhqbk0O4uQzYafKNCaC8V/rHoDdaxqb43NY9+OPtXRv4LzwmHZWoThmmRK9+ulTufr00bpFwPP3LyKRHSOhsS7tzw7L6c9tNDGQlt8lvPlsWAsfPF6ObDwZ99H6fqfjj3O/zVk2wODxkPOaereMsad4LRdXt+pdyrO0NgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg49SxLvfHY9TySVxPdGl7/qZlYYFhmqYAnv45GrqEI=;
 b=cZxPetEletpMrt3uR0x/+vZBV2Orb1xMkMN3jENG0G+DaxkU4KB9EN5493bHpjUaV2D3hxoTPxRAsOJEynrtA4YU85KYiSc8HkNJK8KKVZuS4EHb8c9UfIPfUgj/Sdsk5LzqoeENCaW5ix4/4L7NQkcDOe5600tOPrEBJGg2OoE=
Received: from MW4PR03CA0204.namprd03.prod.outlook.com (2603:10b6:303:b8::29)
 by CH2PR10MB4357.namprd10.prod.outlook.com (2603:10b6:610:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:38:39 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::aa) by MW4PR03CA0204.outlook.office365.com
 (2603:10b6:303:b8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 02:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 02:38:37 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:34 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 20:38:33 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BV2cXV81704518;
	Tue, 30 Dec 2025 20:38:33 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 30 Dec 2025 20:38:20 -0600
Subject: [PATCH v2 1/5] arm64: dts: ti: k3-am62l: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251230-b4-uart-daisy-chain-dts-v2-1-fa5257ec54bb@ti.com>
References: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
In-Reply-To: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Kendall Willis
	<k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148713; l=999;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=dFbXGH7jugapvbkxk4Itu6Ca5wdrU7jCicW8zMgMdAM=;
 b=fRnYt2BjZtBjOjAylOB7xC7DNttMn+/SVfhdfBCNwv2DsEynWeOGCo2qhVuJ8DwEhv5Skf80l
 PDe5EIRlF4bAJLeT383Qyo61D7gkt2M+EYVeGr1llD8ysuyeY4rJaQr
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CH2PR10MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 9362e172-7cb8-4399-3dc2-08de4815b390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWhwWDNrVC9UR1diZWN0QXE4bkZuK2I1M1M4YitnRUlJN0dpbDI4WlhibUVW?=
 =?utf-8?B?TENYZnJjQlEyMlVjQVNaUldBQ0x3eXlNYWIrSkd4K2syVEJaSUdoc0NmcjNr?=
 =?utf-8?B?ME96NGd3WTgxejZGMkFaVFFmUG9uakkrMENKcy9VVVdLWjZ1cjd4dGJUTjkw?=
 =?utf-8?B?YU9RV20xdndnSTZHb0FDbEMvZk94aTB5Z1hERHRCWlBqWTdrTy9jamxpN1ZW?=
 =?utf-8?B?Z2pqSXZhYXBUaHRLK0ljNk56RFVRUGNWWGxJck12Vlk2eFhrMG9ZMHA4bWhm?=
 =?utf-8?B?aTZ0NHhETVhtN3RtSk11SlNSSWc3eEMzOUVVbWNyWjRBK2MxeWUyRlMydkNL?=
 =?utf-8?B?R3YvMXlrWHh4M1BzclBtcXhWdmRNdFJ4d1U0T3AvVHVTWjFzVU5wdEY2czFv?=
 =?utf-8?B?UXlkcDZ5ME5hVDhCTDZKWFZIK2tLT1ExNndvZFBIdXVOcEhESkxHaklCM1oy?=
 =?utf-8?B?dlR3R0xwMDBuOWt4M2NhRi9ERHBvTzFZRzM3dXBmRE5pdWhjck5lWmNCamMx?=
 =?utf-8?B?b21HNUNiaW8vbkR5UXVzajN1VVBIWmRXdlVLYUFMeFdKaXA2bHljby80MmJr?=
 =?utf-8?B?YWxvM1NaSFRveFdoMGNtTlFPcitDR2tuRUQrVU5HZXpicGt3anlGTjFJcnFS?=
 =?utf-8?B?MzdtWE5BLzh6bmxJK0syVDRTNEorMDJVYzNsMzE2dmRtWjVEdGxZMTJnSXFq?=
 =?utf-8?B?WVR2OHNMM0h1REJUd0p3L3RZdmV4a1FOK3VmQWRWZURRcnFLTGpXRmx1dWZw?=
 =?utf-8?B?Z0JETUlxVXR5am93K2wzVnNLMUV4YmlOMWViUWlpajVmTnErSnpNdUY0SVlV?=
 =?utf-8?B?czlLVGZqWUZDSnFxVmcxbkVxQ0NWRENuaHk4cXVWcG03aHlDVklZUHRvUDkv?=
 =?utf-8?B?ODhrNnJHN21FcGd0UkpZcERjdjhkL3BKQXZJTXQ1QnpVTUdoT2c1dDlkWTBY?=
 =?utf-8?B?c3M2TG9HNkxjTlpkNFl6K1FyWUVUMUFRZkZUdXFCRTdpTkhmRDJWdjFSYUxG?=
 =?utf-8?B?STF1d2IvbmJQOGM0cGlleUZXMnVMenh5elo5MEhwTXNpaFAxbUM0WW9uS2Jq?=
 =?utf-8?B?YjR0d0FWZjVySWhzWjQwWDZzclhiYWJKcXA3bkZRNy9IQ3lkSEpLVk5UclU3?=
 =?utf-8?B?OEwxWGpwaGp5OGxBRlJHbGN6UUlVVXpEdjB4UElpcHNXSjRYT1V1TWpvUUVm?=
 =?utf-8?B?THlteFlaVzY1THRxbzdVbUtpdUFWSTlOT3RUMnpuenovN213RExyM0tMdmZv?=
 =?utf-8?B?LzFTcG4vRUZXNU1xNkpnSWorOHU1UEluK1pMRWY1R3I0Nzh0cHFWZlUzdVcy?=
 =?utf-8?B?Wlp1NVExNFRNcUYxWjdPdTRZRlB1emhpOWJHY1RsNDF4T29kcklsOTB1UDJu?=
 =?utf-8?B?c1hQZTBFUjZyRWh6bUpqQXR6RHhYKzlJUnhnTVBaeEo3NUgwUVp2Y3VSS0dy?=
 =?utf-8?B?bUxyWWQ3RnlJZ2NHMTFreTJLbXJNOTVDK2pDQlBQZGEwbndWV3l6cEEwVjZZ?=
 =?utf-8?B?NzBBZUlYWnZ5YlhSbldydEg0ZXBBZ1Zod0N1ek9wejVDSFdWeXhrUlBQRWd4?=
 =?utf-8?B?c3VuRVlLb3kybzNxeUlJalFuUGp5NVJ0VUwxcXBTTXdPdVc0cGtxME5KWTE0?=
 =?utf-8?B?RHFGRHZweHk1Y2pEVFB3dHpMQnhHL2J0dzN5V2hjYmZHZWRlQjg4R0NCaFlQ?=
 =?utf-8?B?a0FqenYrYXptSXlZaWl1NEZZQm9GckRSakZ5VGpaS1FkT09TR1hyVTRGRFh0?=
 =?utf-8?B?aDFxVGVrM0NXY1UzQmdVdGh4dEJHaUsxS0xWQXlIMUwzZHBhWlQyMFhrOUVU?=
 =?utf-8?B?Wks5NVYzMW0wcWNjWTVKMFM5N3Y0NmhOL0RDaXBsam13YU9YOWR5aEp6Y3Q5?=
 =?utf-8?B?cmUvNCtmOU51Ym84YjJwcGVUcTl3T3ZIMzhxUjdlVmg3Wnk4K21CTzFPdDhM?=
 =?utf-8?B?QWdmN1dCaGdvS0Y5MUUrNGl1VTRxTDdqaVhydU9pcXgvVDgwOVpZc1V5bEI4?=
 =?utf-8?B?b1AyYy9PQmNJTERyaWNjZnhUYml0c05kNklTMG11MHRRYWlJZ1N5SS82T0ZC?=
 =?utf-8?B?YTQvSldzS1p0MkNPSnYwNVJ2YkpzZC9weldjelorTS9qd1VCT0ZOMGxGOGdp?=
 =?utf-8?Q?BWYA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:38:37.6495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9362e172-7cb8-4399-3dc2-08de4815b390
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4357
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_183844_697087_A11288A8 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Add the system states that are available on the TI AM62L SoC.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
index 23acdbb301fe38e6045c0ef3ae340196009ed217..3b84ac9be6d075f5eb469c3e503b2e494c62be27 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
@@ -64,6 +64,18 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_rtc_ddr: system-rtc-ddr {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-deep";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		compatible = "simple-bus";
 		ranges = <0x00 0x00600000 0x00 0x00600000 0x00 0x00010100>, /* GPIO */

-- 
2.34.1


