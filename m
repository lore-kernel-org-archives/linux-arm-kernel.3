Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F880D2FEF4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 22:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOogdrnGIebrW02NVCycWG7iidAg3/Ag1KMXARH96kY=; b=fkeqJLC1qJCGoEF8WwTWayRTf2
	VLau47GjclcCAa+ZlI+ef7xJI4bGwjaDxklMSPAy8W8bvEAi6mtCNXwLHPq4sq31Un2E6NTvJGLB4
	tgtrULg1/RZt9TIXBumn5vf82gIaRdjIHUhX+HSypGcKrGOSuHggGcJWqtjjWSvgoU6nPRvHNvxv2
	iYrNEkYMWkPfk6ABWGL7tTPMYYv0JISVmNIXuljLkspWcVRIj525ngwvWwXD6vSov75CmDMe9cVAE
	+TSJztOx5hKovRFMw11VR/ag235+lm2n99rO0JEo8dsULga8Q3I8q2KaY3s66RFt9++Y38Z1tkgXz
	j5+d2qyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrj1-0000000F7cQ-25E2;
	Tue, 27 Jan 2026 22:39:55 +0000
Received: from mail-southcentralusazon11011052.outbound.protection.outlook.com ([40.93.194.52] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrix-0000000F7bW-3lEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 22:39:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIKvA5LLqXbOc837K0tbqLohhwRrQO7kf0luCe5x7uP88hjrAgitcPNpiDWUlA26GlQTOHY61a0M+kkXUduprq5IuIyC5L/rRF1nJiiafc3/vt7SnPs1MPZznNM8cUTIlc+nriCC/RhrfEls46FO6kbUwkVocDSCOgJxfOj6e5GhfeLNOT6Q+BmZ1gPhGOG6jqlMnj/P0DDwEkhUb5PxLjW900KguIB98ujJtAZtZbIT87lO7mSBfDbPRcJhVSO2rLbOoxyr5JUTkpT81wpWCfEkBDurhwq5DnoW0E65AoWUNtn0FftqEC4SJ8z7Kfz7WuNGesJZ9GVkV8aQrBZyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOogdrnGIebrW02NVCycWG7iidAg3/Ag1KMXARH96kY=;
 b=Eiv7Z+CHCjV7cHbUzhdv6lkeXaSIt5ehOt0ZngUfTMXq1F4CzMCHHTDu7Mmu7yGXXBcF3FjMQcZ8tXdWXc1rgO9/t+Dqhr5l6uX4llEQEGytxnccWhBGZFqv5/DBEsnzmomMKnoBT488G1L7m38wTb5WK+LnN8GHZjQ3Af8w8fttgV2XqKYWFMvHZoUNQ5YKVof7cpy3H7GfnAeWqHHN3xrQkLhvV3bHInKviJ9nXgF1PWopg/iwdPJbd1A1zNclFQ74DoUzLNqbZvjOCTJG7DF0RfwklErI0vPjg+IGyjuxCOHC0ReHts+JZEyxEQAhb8uKUuYrN6cp+iH+v2HSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOogdrnGIebrW02NVCycWG7iidAg3/Ag1KMXARH96kY=;
 b=fVMNX5AclG0uuokflmhQ+0QlIjBWGnRS5dz+3os7haDxXgMA+MB1vguInkU2/SWrrc07MVuwCBR9IY1ZQdkJ7fQkzX59+MSvJVC+K2AA/8yqHBypCkXYxUi7iLmkRwvCCT+Ipdw1pFZIF4k71H+lVmJAody4QrlS4gL+nidCxxc=
Received: from DS7PR07CA0004.namprd07.prod.outlook.com (2603:10b6:5:3af::13)
 by BL3PR10MB6065.namprd10.prod.outlook.com (2603:10b6:208:3b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 22:39:47 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::37) by DS7PR07CA0004.outlook.office365.com
 (2603:10b6:5:3af::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 22:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 22:39:46 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:39:46 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:39:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 16:39:46 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RMdjvG1270209;
	Tue, 27 Jan 2026 16:39:46 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 27 Jan 2026 16:39:39 -0600
Subject: [PATCH v3 4/4] arm64: boot: dts: ti: k3-am62l3-evm: enable
 target-module node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260127-v6-19-wkup-uart-wakeup-v3-4-e7ccac761f3a@ti.com>
References: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
In-Reply-To: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Kendall Willis
	<k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769553585; l=842;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=4D8z3sA2IzHguP0weyZABI0N9zuGMtvPUycmWIp0tIY=;
 b=ajzz+BYj64Cg32PwszwzSz5FSBBP75aj7eTzNHzHrA5j11tHmfwvHPLD7ThQ57BIo1jndEzrO
 spFcw8tVaNeCUtoX5wVX3kBBSAuw7coDd4inDxM8qiNfixYf6WewJ9V
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|BL3PR10MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: cde9abc4-fbba-4029-c97c-08de5df4f952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUpWT2h4eGw5V3QxUWV0T0V1d1pDcXZnQ3J2M2lwOFgrY2JXbTJZVVRlemF0?=
 =?utf-8?B?NklLL3JpdGl4RC9qUkt5SXBLLzdQUkoxUmNQSzlFL3lZZWpLRk9yc0NwZVpI?=
 =?utf-8?B?K3UwMGk0bHYvS1FzQXJITjd4VTBiOUVCS1o5N1U3YUpkT1hPNVN1YUltajgv?=
 =?utf-8?B?d1RMc2FyNmpKNmdpbWZPQXVobUNKejdBVU11Q3hXTDd1NVY4V0E2MkZzMWpZ?=
 =?utf-8?B?Sm5LWjFTVlJYRk4vMW0vR2NnbmFXejkyUTlwOFd0aDFibWtieTlLcW85YndU?=
 =?utf-8?B?aEZhak9wbEluYVFpaFJrZHhoZ1BWemxrNU5OcVAxbGFNREhsWkFyWFkyYk1H?=
 =?utf-8?B?Y1JNUVQ2djZkVXBDUUcvZHVPUlEvTlVyN2JrZ2VkRG1XZ1ozT0pvNzBCbDJq?=
 =?utf-8?B?R24yNWlJRE1tdDhHbHZYRXJzLzdPK3prZThicno1N2pmUE9KWUtwWlY1NFAz?=
 =?utf-8?B?YklvemxpSWgwc3ZZdXYyZ0JLWTBjb2k0Ry8xc3lTSVdrMUdvaGplRVBKMkdS?=
 =?utf-8?B?V1ZsZisxajRpeWhSbThNTUZ1Wlg2ZW5zeXMxSVJacTRYQjR0UGY3TW1LRm1I?=
 =?utf-8?B?bEpFYjFWZXhrMXFyak55dnEyU1hrTHBLTElCNXR6MXBCZDBpSjVaZWRwMTRI?=
 =?utf-8?B?TkdaR0pPVGNMQmpwaUZCR2NXeFNFZXFQSW9hYXpHaVZtSFJTYXdjTUU3eVNF?=
 =?utf-8?B?NmNYMXpVTXBhVThOZEhPSE82SjJFRHVFRW1QKzNvZGsvY0l0aWw1THVpODh3?=
 =?utf-8?B?VXJYSS9YemZCWlNCWUlFU2ppNjNLT1VhUVJ4bEZpcFUvYkZJSm5ldE5temY0?=
 =?utf-8?B?bnNxaDZ1Ly9lNk1TWUpDSVlSZGpHa29meHJ0WlJCanBWV2FGMTR4NFI0eDFa?=
 =?utf-8?B?QlBrZDYwV0pRY2dCWHh4OGowMU9ZZ3F2MTl4T3F5UXRNNzMwWGxJSWw2eDZH?=
 =?utf-8?B?YlZVdDU0S0VienZFdkJQTVprM2RwOVVtQmRaMFo4ZmlBYmZYOVdJUGNpK3di?=
 =?utf-8?B?emgzVzhxaXJOa0x5ZzUvUzQ1S0ZsUys4S3hhT29JaDJBc3F5RHFiY2NpTmhU?=
 =?utf-8?B?akwrQ2NpbHYrRGJ1UVVmaGE2ZE9pdElYTXoza3QrQnVZdHJFOXd3cmVTeVFU?=
 =?utf-8?B?bEFudUxTY1FWM0JEaTgxbUtGb0M3N2Y4Y2dNSVRPU01VVkpnOFlUL29pMUpp?=
 =?utf-8?B?dEo4QUhTdDR5clFHYVRRNTFlaTlJMkF1Q2lMLzVvVEplY21qNndhS2piOUt4?=
 =?utf-8?B?QXZpaE1CWWQ4NkY4OXNtRUlYRGtDRVNKRnFvVERHOTZHdU1OSzhBaFZiRGgy?=
 =?utf-8?B?c2NpZEFRL2tOM2xDcUFkcXQ2YzhWWUpyaTBFTVRUdWlIZkpiZ2RZK3BpdHlZ?=
 =?utf-8?B?enNZRFhScSttL1JrZzl4VTBWUm1sbVIxKy9zT29jTHczWlJ1U3ZoMjJiRWhW?=
 =?utf-8?B?OGJTZFJxdkVSVWRTOEZnY2JTN1BtenZiOU13SDR4Qm5FS0k5QXJhQXNFZXBX?=
 =?utf-8?B?TWwvOCsxY2haeUt1dU5ucFl0MUU2SGlUdUpMMmlDZU13ZVcvM1dKVnF5Q0sz?=
 =?utf-8?B?RzdpajVoWGpHb013dHprdVRkbEZ5aFBURlYyZTEwWXZXdjRRalRHUG8wMVdG?=
 =?utf-8?B?U1RGSEdlUyszclR0dlM3TExSSEllL2JzNzhrZG1yOXRlUzBPb3ZKRkJmNG9O?=
 =?utf-8?B?dzJzdGdnemVZOVFVOEhpV050RU9vdmhzZmlNbGtmR2tTejYrZkJtdjROY2Uy?=
 =?utf-8?B?clNqSldrc2d1cWU3a2sxY0lSN2hVZmZWN0xFVm9IM1MzNU1SNjJwWkJmTGZr?=
 =?utf-8?B?WEdMNXVCRGxOdjZhUEt3aGNLVFIvcVc2dUdKOFZvREkvQXBhd1cyS0N0RUdD?=
 =?utf-8?B?QXJQQzVXSU0xaWZudUhCSzBYNVV3UUZJYVhRa01kL0FCclVnOHk3dWVZYnVl?=
 =?utf-8?B?REVxa1lpVlUyYnpFV21vYnVZb1h2TGgzbXF0Z2hseEliVXlDOGNIek9tT3VW?=
 =?utf-8?B?Mk11Zno3ZlJPTHErRk45SGRSMDh2QTQ0QlZOclVaYUhDYjY1OVFMd0YzdG51?=
 =?utf-8?B?c2Ezd2VtakxpVUNMM2QydlpXZS8zUUhPY05OQkVCN2VZZEI0d01nVHhTQjRS?=
 =?utf-8?B?M2UzenhSN2pndFcwY05ZWVc3aDZhdkRiTGFVL0hDaVQ5V3E5Y2tFS0thV1BR?=
 =?utf-8?B?RjRoR0EwQXYyemZudjBHdDVmOVNvdkhURFlaek5ZN3VlZ1JaZFg2Sm5TdTdj?=
 =?utf-8?B?RHhFUkduQTJXK0doYk5GZTlFbHlRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:39:46.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde9abc4-fbba-4029-c97c-08de5df4f952
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_143952_059861_66088F9B 
X-CRM114-Status: UNSURE (   9.94  )
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

Change the status of the wkup_uart0_interconnect node to enabled. The
target-module node sets the UART SYSS register to allow wakeup from WKUP
UART in DeepSleep low power mode.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 3ac9a2d0d9cb78d87479c4a8aed5c0b1f1cb3faa..37379b86582c9e412f94c18ce7fa81857034375f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -370,3 +370,7 @@ &wkup_uart0 {
 	pinctrl-0 = <&wkup_uart0_pins_default>;
 	pinctrl-names = "default";
 };
+
+&wkup_uart0_interconnect {
+	status = "okay";
+};

-- 
2.34.1


