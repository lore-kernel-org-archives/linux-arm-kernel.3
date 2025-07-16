Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAD9C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 18:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=; b=kyRH370Ss52ahZy9eN6VkahzLa
	6y1W6NO+iVwXKDSmL9tm+KfdodTr4yOKnJRzDnfhkIuCa4UwxyVDN/SBz+/KJyKYQLo/pcZY9dUV8
	fKr2gyStOzGVwRyQJMCjltpOEJh5Pkp8NZ6N2pQLoskzAHrjqhwKxgY6dmFCIaXvJ/WgXLqNTsN8I
	jHhSKkdPrNWfh02EtuI6W0U4k4sTyf4zyCxeDEfpOFqilPcrQCrKj2kIxPNFNpgYsKNwjaQHerX9J
	WuwZQ7rN+uspv2x3xIZ23pJE+ks4S1DD7fR/+vvOBjU/VJvCTVhl/cJHM8F8cb3SyRUwfqFvSUOTp
	44MH6veQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6vl-00000008P8V-14za;
	Wed, 16 Jul 2025 18:32:37 +0000
Received: from mail-bn1nam02on20613.outbound.protection.outlook.com ([2a01:111:f403:2407::613] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6mM-00000008NwQ-4AVo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 18:22:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDP0JMUTuooqONabtihGjWKD/JLRlNYeOe7fy12qnDF/zcVrpxyPEXTPNHS3bzkOWIqfUxZSGikHuxlz8fQpU/M0jQpDpdGvbxwyhC6Etow4tZa8mFO82fKkPHqnkzgn2AQ/Ue/Ij9YkkImkZ+be5IP8ohTdCanZqJ+gpyRhn15jy2C/ldAZrf6T29KVn3+k9L1ZbF2jJaH3LlA5hiSMgCJpwiKnTwNT1vbufmVVnp7NJ64vnxH6tqKa52Rf0PUJFhfasc2+SgIthxbkmV1PWQJgwpYszRHWFfcO5u57dGDEP3Fkh6gBAIZgnEKYo3MT5BKryUdF54FrKWJaNtasZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
 b=T0aQYBFdVJL1ANd8jbrD+nbhPXaUqGZ3jQ7JbqFSsZ+DR/m/izXmzY9h2RIzTcLEQ6KEOeKtcL/Meg2Iuuicp/lo06cmjAgliqwuo/elEHFqvHLMcFZh8ORV7ErGDRZm5KhccMZukMM0twYMg7SFOWgXbZLsdL5CIrpkIGZTzbS4izhROz803TZCoFHf+YteSIZocCc4tdks04qwHjIjrItXhh0ALCAekTL90948NZ1A9OE7HKw6LKVtjVpMhEnfEA8lcgOeu8dJrIWoNiCpThg+Kwxu+yhtcC+3TQ1b9QArzv0wXDnaUxvB8b+RrjkiuimAo+V95Tk62pJimE8YFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
 b=Gr9CRyDz8xAsxWx5d5Md2ULMJNJRk88S0YThIdlN/R7h8zi1LHIJgu90DZ5+NE77qnaspCxMrZ2u17qvVKx8WFnEWjsph+IBYZj95xsl+qhjnip5fpahO8pB3W4AUTyWm1wqmjhI9wLD0otRKQg3y4T1PVlpBBoPhHfO9ShiYDuEZCkMjEk6BmCxmuZBdD+bMfnadYEsLHPPzvPDtl1qY+j6W836yl7LQfu0A7+SteMIMrnI1fTLbdnCjwsIgwjX8m6j1lzrLfWm+r5RXMcxKPhWTvqc/j7lp9Xy/LPZNR6I0sEMQy0c65+hrXYOYetlq1LuIHaeauot+Zdj5m/VcQ==
Received: from BY3PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:39b::20)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 18:22:48 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::bc) by BY3PR05CA0045.outlook.office365.com
 (2603:10b6:a03:39b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.14 via Frontend Transport; Wed,
 16 Jul 2025 18:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 18:22:47 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Jul
 2025 11:22:31 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Jul
 2025 11:22:30 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 16 Jul 2025 11:22:30 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Wed, 16 Jul 2025 18:21:57 +0000
Subject: [PATCH v2 3/4] ARM: dts: aspeed: nvidia: gb200nvl: Repurpose the
 HMC gpio pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250716-update-gb200nvl-dts-for-new-hardware-v2-3-9a1a916f461d@nvidia.com>
References: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
In-Reply-To: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Deepak
 Kodihalli" <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, Leo Huang
	<leohu@nvidia.com>, Willie Thai <wthai@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752690148; l=1239;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=U/hb94f62wDxLjqgv/eiUe31gOSf0eh/bOHZltRZM0M=;
 b=cq7KXjzfbD8N3bDaS+iutkJ2gIw9t+wrDSFGUrY7CNrC8hPQhh2rdEGboW1w+C9X2yhCJP9/w
 wmX9JHEEBJIB+4SXXeY+zisxTKFJItyokLTlLsU0KrhWUx9TfzrBcgs
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: a79e7af0-e818-4762-e620-08ddc495c447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHNUcTQ0dzdqbVJDaTAyMGtLaEdwNWw4UGVMTXNZNTZOWGZsUitYMlo4WWpU?=
 =?utf-8?B?b1o3cHpGUDhBMlZVdTNVSHdYSHlGbUVHdFFnQUYwQitUYVYwWit2NXdDcytM?=
 =?utf-8?B?RjJ4azN4cXVMQjhqWFcxQUdPMFpjS0I4WEwrQnVka1FFTHRTRjk3QWI4WFo1?=
 =?utf-8?B?SExpWDBRcDFKQ2pnZFM4b0dBR3pFOHpnNjZvQll4TmlSMHNFREpjVG9teWRR?=
 =?utf-8?B?RytVV2pEK1RXN3dkNEtzNHc1RmJIR2V6T05DSGNmTTdFZ1BmTGxRTENsMXJ4?=
 =?utf-8?B?b2FYYW1TWWk3MlB3QzdMNmZ6d0oxVHBTd0Ftcy9jN0c0aHI5ODA0cUFiTXVy?=
 =?utf-8?B?ZzZhTTR3czZ4UjhvUmtoL2MvNm00Y0dlZ2k2cndtYi9ndmZmZ0w4T1VTVkk1?=
 =?utf-8?B?K0tMTTNZUmlPVmNLM1QyeGJpN2FJdDZpYUhDRnRLN0l4TjR6K01HOUdPOWJB?=
 =?utf-8?B?dGEvdHVEbXB6dDB6R2ZjZjRjNG56TTRsRnd1S3c2WVlGa3loTkcxV0FtUzAy?=
 =?utf-8?B?NEFXWlRpdzZ4TTVsTzMzdnF6T3B4RGl0a0JZYjZMMkY2Tkd0ZUFBcDI1UGJR?=
 =?utf-8?B?OHd0emZaOXhPaW1YUnRHRURBOEVZbHo4Q3RsbDJyL1JVY1loeC9tRlI0SWs4?=
 =?utf-8?B?UU9nUGwxa0xqbmNTbHY2ZmYyZ1A1bzJGamkwSzFWcnVLd2l1ZGE4eW5XTXFp?=
 =?utf-8?B?Y0dzMjBmbFozSkpnNy84eHUrcHZ6bC9tbkRkWkRVdkZKeklPelFEQ1BQOUp1?=
 =?utf-8?B?WndaOUcwekZMbFhyU2ozV2x2Mmp6UGhPY1UxNEVYdGp1bVJtMHI1R2QxMVJU?=
 =?utf-8?B?L0FIUWxGV1h0NytzblJ0VVpwWjk2YmFBdFYzMzAycEFSeHNSOHRDbDB0bDlj?=
 =?utf-8?B?MVoyZmpvNFlzd0JERjBxcWlKbjN1dnh1aU9OU2ZndUhqTEprSFl2c1JRNWdN?=
 =?utf-8?B?alZKYmFzbkZMYk43Q2NHRDd2TTVjU3k0OVd5SWFkUFJNY0FIaTBqM0JQSVNL?=
 =?utf-8?B?VHpYd3ZFNzRrQUR6SmdkcEREMGQwSFo4RWI5RENuemVuUUVuaUFLdDFNamJv?=
 =?utf-8?B?cldwZ3MvV0FlVTM1bW9hbjdtZUF1NzF4MlJ1RDJVVjhwRklhSzNzMFlVMlI0?=
 =?utf-8?B?UUVjWjc1YnZEUEczR1RQWlFTbm91NzdvamYrZUU1WHYzYXl5NWJJa3ZTcU1M?=
 =?utf-8?B?UHd2d0NyTGp5L1ZvTmZ1VmRQOFNEcVpza2ZsNkdwSjJ5VHVIWmFaU3ZFNzd2?=
 =?utf-8?B?bm1yN2prQXhXSVM4cm96Mk43Wm13Y2hYM1dVQWVUOEFBOEpoRmk4bHdTTWJ1?=
 =?utf-8?B?K1lNY0NVYTJSWU9aUVBpRHdNSXN4QmRKUmFxRmorQ0VLa1lTeTVYTEFtY1Ir?=
 =?utf-8?B?WkZxWkpGa25EclpKQTdNdmNsWmRQbWlJazhPWDhjL2xCeWYyd2lBWldPQ2ZN?=
 =?utf-8?B?S3JBdXB1S0VzTVNBei8xemVMbUdWaE5sd1Fta3lIL3kvK1hPQlBiNmpDWG92?=
 =?utf-8?B?dkhPU09oM041VVZ1MmV4QXQzZzFYeUdkR0I5ZHdLN3dEK2RzSmozMGxJcVB5?=
 =?utf-8?B?b0p2R0hzZEF5VFVYNlBtVTYvVndRZXhRdE5rajBHNWdnMXUvb2RwbUorcDB2?=
 =?utf-8?B?TkdPdTdiN1BpZy9ZRVNMazJPTWs0R2JHTndPWm9sQzVSd3BLWHpERldITXQ1?=
 =?utf-8?B?cW8vRFBPNU9PcWdCeVp4c1ZsTk9jekpuMFpYdkZCUzY2cWlQSmRQYjFIaXpn?=
 =?utf-8?B?YlVBU2VtaTJPS3dhSEIrV1RIVDZicUpnY2V0bWlFS21JNk1ZVW5GZXVlUCs0?=
 =?utf-8?B?VUFhT0dYbDR1azZFdHlwSlJFZm92anVVaXl2c1R5OHZFUFc0R2FzRUppOFFS?=
 =?utf-8?B?TWhBdk14MmhKeTEybGZpdlAxaHppODA1MjBlRHkxendadlBOQ1BCeHY2d2dY?=
 =?utf-8?B?TWxPTGdaMWUvMlcyb1BpSDY3U3o2MmlPaGVFT2RPeHlRUEpkRjhLdFZIcDBG?=
 =?utf-8?B?Yld4VURSWlhvQ3ZaR1BvZXhETnlhSkRxL2FEeFA2bjRqV0pMTzlKQ3ZYeUpn?=
 =?utf-8?Q?0Zu7It?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:22:47.7336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a79e7af0-e818-4762-e620-08ddc495c447
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_112255_061305_9F7F07D2 
X-CRM114-Status: GOOD (  10.07  )
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

Repurpose the HMC reset pin to FPGA reset pin.
This change is according to hardware change.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index f0a18adc328759e290bc354ad8ef703f28c1ffe8..dd2a02a6d1d40cd3fe99af83123a7a3a67149a69 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -1126,7 +1126,7 @@ &gpio0 {
 		/*J0-J7*/ "", "", "", "", "", "", "", "",
 		/*K0-K7*/ "", "", "", "", "", "", "", "",
 		/*L0-L7*/ "", "", "", "", "", "", "", "",
-		/*M0-M7*/ "PCIE_EP_RST_EN-O", "BMC_FRU_WP-O", "HMC_RESET_L-O", "STBY_POWER_EN-O",
+		/*M0-M7*/ "PCIE_EP_RST_EN-O", "BMC_FRU_WP-O", "FPGA_RST_L-O", "STBY_POWER_EN-O",
 					"STBY_POWER_PG-I", "PCIE_EP_RST_L-O", "", "",
 		/*N0-N7*/ "", "", "", "", "", "", "", "",
 		/*O0-O7*/ "", "", "", "", "", "", "", "",

-- 
2.25.1


