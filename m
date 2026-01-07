Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEAACF6BE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 00:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFP9MZqGDkW9bpAwu3pvrxMg/IJFRRoZspR6laC4EUw=; b=foZcwAFYC5FF29tvz36cUUpqZi
	Mh0Xj6TmZ9dx64boQfbW0ymNLVFrbVYKAHsxBtDVGBEt3BmqTxiHsdFTqVwcYmX3l2q3RxZQB0Bk/
	hvqGMTBCt9QXlXTUU920Ia3yDLcyOS6enVxODVx6Ct1XSvNNjqz4cLyPV0tB58MCs1umN5oM9Ry9M
	ytWyjSlFCoKbSh7vYFOudW8IXUkzaPg6BZ1Bm1kVx0aQsQ0zbxsuf2FK+N7T2htx9hD6v77J04XPK
	G25A/FV0yG19GVqftiS8CC4/rE7ZJ1cU4ULconG3lbcYlAKocyLVbcoXs8kfKJo8UDzkRQ0NIylmq
	feG/4nTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHdJ-0000000DyS0-3j7u;
	Wed, 07 Jan 2026 00:42:41 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHdH-0000000DyQs-1a6p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 00:42:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pz0g6dxTa4zLIrAAOUwWtKC7ozEx8Bqa/E2pYZ13Cp0tCIvHPyXrZR1d61KgikO7NaBrw6TtHOpMzdu5Q3b/DGaU+DDhx8mMa98QHcPRwbCPHH5sosP0gNyPthEF37WtUJcHIN/Fc2s3MIz4qD/NaQQESrj6dy4uDrEFBASiGFYGbOUwRgEgu/D3+STa9oDrmym0e2gfrf9CiGitHOHIJK5HaPHB6xZMtAkT/0IkbEjbkh6Fc0TIyyja7YoA7PtbDJ7c0gfrta/FivlXBCxC9JvmiiGCaKUqCtdm01Pu+th4TMf0uqnqMm8mt7Jg6z/3RUjsIrQ/oTawVIEK9/a9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFP9MZqGDkW9bpAwu3pvrxMg/IJFRRoZspR6laC4EUw=;
 b=gIKOARrGJdJj2BqiTsRMz394iDgWTQcjgCflqmXEz+YtEjqRRFP1hTw3UuvySX8u6krzuPTGo7qY3Q8or3y/gOmtcacp/dA3hUNYxc5/mayRFyW0i6mmjpyU+0rrz7CVRtj8cEBypOUcWGkY61rC90PKS3kFe0+IjcbQVr/YN5QFJ8onQN4D7ETqdysvk7FQkaK+NQFPMMh9K+jXBJKe5cZhFgWSv7/mgD2rTFeCkh5nZrx+r0ob+C59MIoV8QdY2LnPu75/5R0u1cd85iFCYEOwXoi8hKgsL5M7Nk3QUIKNBf1AygwXv5NyvuMrHSrsk8lkdrdxTcVz1EadH3UuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFP9MZqGDkW9bpAwu3pvrxMg/IJFRRoZspR6laC4EUw=;
 b=rCR5v20BLQoQqe1G6e9YjsMEx76DSkfS469Jw0lqsiTQtgcqUB/QiWe6OZQyQl178xdqtoatkbWs71HT6407rib+seAVECb5X9bUx8ttxCNFIbrHooIBig5Ae7oLZ7nhk5LHSiSWUIYlrdRojH3OAbM97GDwROISpJRARO/7jQ4=
Received: from SA1P222CA0156.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::19)
 by BL3PR10MB6065.namprd10.prod.outlook.com (2603:10b6:208:3b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:42:34 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:3c3:cafe::82) by SA1P222CA0156.outlook.office365.com
 (2603:10b6:806:3c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 00:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 00:42:33 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 18:42:26 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 18:42:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 18:42:25 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6070gPrJ3856461;
	Tue, 6 Jan 2026 18:42:25 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 6 Jan 2026 18:42:18 -0600
Subject: [PATCH v3 1/5] arm64: dts: ti: k3-am62l: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-b4-uart-daisy-chain-dts-v3-1-398a66258f2c@ti.com>
References: <20260106-b4-uart-daisy-chain-dts-v3-0-398a66258f2c@ti.com>
In-Reply-To: <20260106-b4-uart-daisy-chain-dts-v3-0-398a66258f2c@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<d-gole@ti.com>, <msp@baylibre.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767746545; l=1094;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=U9ahmbogEyn0mlo6/AjZC87T9OJkbjkG9M+Is1lqIIM=;
 b=chpx8cKPO847ZpG6Wl6YpXdYcAbU7X+/g3e0xzzYY62FkGVfHYN2xTOTPlXrZneIaPl4KkfzM
 W0E+X6u3DA6AzbQB9p/zBUm/At3j2F2NlJl5uQIIOo3X4XLQCBehmCq
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|BL3PR10MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 214366eb-69dc-4506-224a-08de4d85a56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmRWQVFBdkVONnc2S0cxYU1IdzgyM3NwSDRRNmpRcllFTEh1U1h3VExwZW5Z?=
 =?utf-8?B?dkNhZFAyM3NIMDlhcms2eTJlZXlXWjFkWkJHY2pRd0tkenRlZWs0U3BLbVlV?=
 =?utf-8?B?QnZaL2gyK0dZSVA0bXNjWjdadmNTMjJNWm5VWGhhVnpVRXJZRlZ6bXIrRmUy?=
 =?utf-8?B?NGVmRWIxZFA4WlpVVy9OeVRsRWxKd2FFcVdkb0VncHlmZnArK0hZL2swVHZX?=
 =?utf-8?B?MCs3YnlaeGpuTkJ2czRCcnpXWVMzVGJLTFFIcVhKSzhZcGhsa0tCR1dlczhy?=
 =?utf-8?B?b0ZhUWkreUdYdjhtNXhTeitUZm9xcjMrV24wL2F0aGZFSGYwTXpPT0lLZVQ2?=
 =?utf-8?B?Y3YrQ2IvMGRMQzNVdGc3UjhqQ25BUEg5K0ZNaDNWdWFoUnNVdTkwNWZCbGFy?=
 =?utf-8?B?TDBBcjNSRUMyMlhqcFNaclRHckh2Z3NlMGlvRzdXdTA0aW9rK0VkeDZSZkVS?=
 =?utf-8?B?MVB4QVhiUnZLY2k3MU8wYkRoM21USzBRSDF5ZTVGaC9rYjdtQ0F2QnZvVlFm?=
 =?utf-8?B?aHVoU0lsN2VjcGxleFRUT2MzMitQM1g0NW5mSDdGQmllMEszRzR5K0dqbnlM?=
 =?utf-8?B?RlE2VEg1bFpMSmZPNFN4R3U2UDVKUHgrT2svUzlQOE4yWXNOM0loSDRzY2pj?=
 =?utf-8?B?RVZCUmZOZFBvRFZEdGdPZzR1ZFpzTklDODh5U1JTemREUytPbytVc1BhdE8y?=
 =?utf-8?B?Q3NjN0NPTURyaGUySUZwUEd4RUxWWnJzb2U1SkVUOTZXQisvd0hhSFFFdWN1?=
 =?utf-8?B?bXhkdDY0VEhXQ3k4c2E1Z1FoZjJJYmtaMjNleVNubjZMd1dVQTJ1N2VEV29B?=
 =?utf-8?B?SGJoTWp2UCtrSEFUUVlqQWExMnZCcEpsMUJ4ejVHWHV0RENkd3JCMEg3MVUz?=
 =?utf-8?B?QzN2OUxMd3RKQ3BSVkJOWm5ETmFiTzZubWdLZ0k4VlZjWUJFTk5qT1VWQWs1?=
 =?utf-8?B?NDZDMnVTL2prOWxLN0NWRkVMNnZLdzB2d09zWGg1cTI2cVVQTE1veWxWZDU0?=
 =?utf-8?B?R3JFZE1FQ2wvOXhyQ3o2R0pBYmRuZDNLbHhyekx3clZPcVdudGxxckJmamZZ?=
 =?utf-8?B?ZFlTdnZiMWY2MERIMHZqd2xCLzd2c1VuTEpJNk9UYjVmbXZmNWN6VjE1bHRh?=
 =?utf-8?B?SzFNMkd5dkkyRURTcG9KYVZ6RkxiTW82amRYeis2SmxERUpBUTZKMW9MQitW?=
 =?utf-8?B?dzRjWk1iZHoyZ3d0UDdDSEhCeXpMck9TWG5NdU1WaGs2OGh4R0RWdmRvSTNE?=
 =?utf-8?B?RnZEcUZKOHNhT3ZKNU93eHFPZTNZZ1hRTEFLQmk0SDBMQ3c4c3ErVEpRMkdP?=
 =?utf-8?B?ZHpQOFFtRHBqaVNjZlJlN2dXTnFWTGViTWNYTTd1WGNKbnBLeExacW9KQ1dv?=
 =?utf-8?B?YU82NTZIRXZsVlRPdWJZcXROazVvbnB0aUI0eC9mU1ZaaXl0TFd2TVVUWjR2?=
 =?utf-8?B?a0xnTGFRTHVlbUZTUEwyVWZiWk1yV1pDV2x6SGFsQlJyVFc4NDg2QUJZYmFL?=
 =?utf-8?B?NlhNc1RuUXNORTRoSHpCc3dob3lOMDFpWmVyQ1MxaDlzSFozRFpyZnNObzdD?=
 =?utf-8?B?KzVNQkRsOU8yMmtoVXlWRWZ6WVR0MFRDUWlPQUhDelVRNHYxOThpUlJjVVhD?=
 =?utf-8?B?SDJBK3RjdUp5ZjBSaDNDa1Y3cGJxVy9hQTh1UkxhMEpNMjF2anhTUnppSmp3?=
 =?utf-8?B?a1dzS2J4WlpsQjRJbC9vcU5Fd1NYZ0VRV01pU0ZMSnVZMWVwOTlhWHErK0dn?=
 =?utf-8?B?TmZlV0ZnOVRhY2RaQ1pyaWxlbVNhVElESkZReFY0UkQ1V0ZVbEdnQ0RVQ1N2?=
 =?utf-8?B?REo5cDM5OVdhVmNDNXhQQ3hJNkE4WG5rQ0FiREtNQzZFaHdob3lSTVgxYm9t?=
 =?utf-8?B?Mi9nZDFHdVBGSm9oRC96QU9YS05iaU9OMWl4Ty9UdFlYTnkwTjcrUTRjNzZz?=
 =?utf-8?B?N3MwZi9Dd0tWUkJIRTBhSFl5YnhST29qUWcydjVsZUF1bHlQWCtIOHNZNG1M?=
 =?utf-8?B?UDZqSkgxKzBkeE9OVzVVSmx2YVN1WjFjNHlkRWx0cE9ORndVRkFlbXNPeG4z?=
 =?utf-8?B?cWN5Y3AvaWFUQ1JOUVZhbm1CdmhRVHUwUWJiWlREK0Y2VlRmazlVdkJNdTZk?=
 =?utf-8?Q?k4zU=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:42:33.3842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 214366eb-69dc-4506-224a-08de4d85a56a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_164239_421162_B8A40069 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the system states that are available on AM62L SoCs.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
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


