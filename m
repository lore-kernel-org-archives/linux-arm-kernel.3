Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F275EEE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HscYRMEmz6foqwlXW3aP5YrZvAZMD8uLvd/VNgYVl+k=; b=XnGHHWgYDRrQnvU5bLXpmiIc24
	JXybcpLIoWztRSfGY34Sf9n7bhFif8JhKSHXUrxFswGxTnORYgAUQOl9xccLAvd7yzsIe2q7l6B5O
	tiTS7WXa7QVpxM+ytTBRW25WJ9XiKUtK96j5xv+mM7NoKuv8qRVn7PXmclyyPp94kP9PFNlwwFkbX
	GwzLnGEDa1OrGKgjRuDCEhG1Z43mTb/aH25oZnNI7igSp8fE6jdiq02M01AZVxjl61B9ugDRq6PLe
	3YY2S8cqstWKLogvni/oYiqZrbjgE1jiWI8tc/eBwlOrXMpaGFOwaYESvUY4bVvwfye1Ii0UHPJMO
	rdHzZ9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6o-00000005a3n-0juS;
	Wed, 31 Dec 2025 02:38:46 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6l-00000005a2X-014O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlH/hVe7lucYF+V2cJYlQhHuxcRq9qi2qNfMyjMo6lGLmc9lbl3LJhSbparsuQypV08qve5r5cV85In7MjSHqxYDZmW+5LngMb3bYp2xOULmugV6Xmejqg49C6UBmjG5hbr5aibjCUqSbWeM+TVTtx/ybb3rL1txgzAA5/Zd+rnmSqjXm4BGLTUI9KyOQyqt0KBLfv/c83udY2sT7NvApbpCglKxl18RHZSUqJlWVOJl6GZBltooVl8FbEFsMlP9JbnoD8aoxGYGvdw0zMhZjkZ0zxuJ9vSE6RSQ1Sy+FMAJ6HqBpsqDOPTm1dtf3w7V4SuG702PTh5Ov8fLcUYhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HscYRMEmz6foqwlXW3aP5YrZvAZMD8uLvd/VNgYVl+k=;
 b=hUwguKAKUWy8ui0xbpK9wcApK0t42fnK5zDSd0EtFdkVsPYeOCwAmCX1GYM9EOMdiZDfyM7aJSXuuZPFk8mE2PiHOPkfb0gfcDgdhbl16IEMcNzBXb2Qn66rbJ+H2MiqyD4L6KyDIgMJ8TrqQH+sGG2njB07SMXj3ChBtTrrtnA7kvxUi7zEEosqPAkKtkdiWwpULK2fT7OqhmDqIr/4oUwqzD8/qJoEmxDucT0PnHw/RHZzUyiouOPqW5owmjYuYAOY/ngREwlV8SjcyAToQTePFOu6HYrbA+Rl0DWehKzGWvGHH9WQbyx41NBtq96MGXbMZNQYZkdHeyCmPeds/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HscYRMEmz6foqwlXW3aP5YrZvAZMD8uLvd/VNgYVl+k=;
 b=O9QdFhmHy87Y++TYgYI/ExxOZ3sR6EEzqno/pbQ7b0twAun8XYYCxFTlAYMOUbvXU1MOI5udJNiA7HgFFQmva3V1M4QGASWAY8J0n31e3MzvTx6QVIA5M7RBqetMUXBUsxvJos8kJwZN7tT6penRqKLpwHIYhiSHw22EQs5mcR0=
Received: from BL1PR13CA0198.namprd13.prod.outlook.com (2603:10b6:208:2be::23)
 by CH0PR10MB5145.namprd10.prod.outlook.com (2603:10b6:610:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:38:38 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::9d) by BL1PR13CA0198.outlook.office365.com
 (2603:10b6:208:2be::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 02:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 02:38:38 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:34 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 20:38:33 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BV2cXVB1704518;
	Tue, 30 Dec 2025 20:38:33 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 30 Dec 2025 20:38:23 -0600
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-am62p5-sk: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251230-b4-uart-daisy-chain-dts-v2-4-fa5257ec54bb@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148713; l=2076;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=QJsB7RjcpW9MvLSEzaR8YSjscnFNERRZrvVGEUYzN9Y=;
 b=4XU+gi6qL0f82xKgrIwHxrcRNP/bb3eMxocVgCodTDz8rIEO14RVbEEHMAHN0Gyy8UFUHnvVF
 anc/3JXvCtaAtUoQ8rc85AvKKcz3OQWo4JcY/76LT/KBlb7Y/qRDqIO
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|CH0PR10MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: fdcc6f87-d5ab-42d2-bba2-08de4815b3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlliaU5JTjU2NGJaN2dUV0QycklBcmpsa1VsRzlwMmdFVHd4ckk5a2JtSHg3?=
 =?utf-8?B?UjBabEtNSzhZZFhaMm5GbWg2SGE1SGZDVHpqVkxtbEp4VkdnMGx3TmJqL1hM?=
 =?utf-8?B?YnRjRjQvVU1IdDZId2VSMlFwOWpvQlZiWjNqNWVZQ0FORGhrbU9XOWw1MnQ2?=
 =?utf-8?B?cllPbjRIa2VVbS8yRkF6ckhwSjdHeVVrUjdPWkp3aGdpUmN0MTJseGIya2tp?=
 =?utf-8?B?aDdZN09ZUG51ZEdsMzFRK1Zsb0lWUC9JektIRGZyTUU4V3l5VlVTUlJkMG42?=
 =?utf-8?B?ZkdaL2JSTjBRNWF6d0RFOU0rSytyaWpnR0R5bGpkOC9SK2hIWGl1Wnp6RG94?=
 =?utf-8?B?MmhxM3ZvS1JLdERXMmtodk5FWjE4R0wyVHRFTk5ncUdvUzdLNE0yTFUwSm4y?=
 =?utf-8?B?VEtQbjhKdFRqOG1jYnZZdnhqRjFpQkxpU1c2MlMrZzh0WFhWWTJjUVZuZU9s?=
 =?utf-8?B?b1hGdW9qYmZySkVhMkNsNXRTbk1JWHN1UGlBTW90bFpiS21vTGRralZXa29a?=
 =?utf-8?B?b3hyaDJ2SGJrc0g5OFdaWGpONVFxdjFpVmRYblEwTHpSR3NZb3hTczRCRHZT?=
 =?utf-8?B?L2M4d1VVR3ZUcGQwWjdFNFU4NzVVbFVGMFJrZGtkNng0aUZ0cWZzRlJZN0tI?=
 =?utf-8?B?ZXRIWVRIZnJLVGpqZ2tvNkFEc20xNUFFbXZFbXBzQ0lmZ2NDQUtFUGRTRlpP?=
 =?utf-8?B?Y2tYdi84VGNpQlgzVkozQk4rdmcvMk9TZDQyNzVHUmJuaWpBeTJtMCs3WTEr?=
 =?utf-8?B?U0poa2tWZ1VydEZwMThraGZUcUNjUWdYc1N4UngzZndCZmVoQUc5c2w1M3V1?=
 =?utf-8?B?RE9wWE9BcnpNZHdJUVVSczlqbWZEazl1TGt6WDNXaE15cGp4US9pZG5WSnI0?=
 =?utf-8?B?cEMrMmxyUDRXQ090TWlWUWh0eFVkamJyYS8xZVdwNDF5bUJ1OU1ZTkQyeXA1?=
 =?utf-8?B?NmxOU3NKMytMMjJyckpYbmxXRE1oUk9URXBWbDY0Sk9wT3ozNTk5NU0zVVhw?=
 =?utf-8?B?amZlSGo5d29SL1Jabmo4QVAydTlvT0VodlkzdGJ4N09Cck0rMGl3QVNuWW0z?=
 =?utf-8?B?MDdqcFVaMldPY3BHS0tVcHd6aG9vMlN5cjJUUXBlTStub3RpVXZxWm45TXJj?=
 =?utf-8?B?REFSZjNtK0R3WU5sdmxqMkJFL0R6azgzZlhOVW1UMzJHdFNwODVsZmZIS1B3?=
 =?utf-8?B?RGZaV1VNS1M3SDUwVEZxR1l2RTlzcUhCdVBlVWdQRGtaZ3dqVys5c2FETlJJ?=
 =?utf-8?B?UE5MelRFWHpLelVtSVhSTVR0YUdEdTBMSS9UWHROd1F5U21Fb2o0Zy9xQW1i?=
 =?utf-8?B?bEZxS0twSHQyeFBVdGtzeUFYdkJ2M2lhWW1kS3ZmZ2tNMGNYOGRIZjRDOTFL?=
 =?utf-8?B?dUpSdlduT1Z4cGgycXo2ajg4Vm85SzJkYUlKczRRRUpiK2U4NUV1NEtOQzJU?=
 =?utf-8?B?QlAwZ0RTdTNBYitiVFh6Z2llUUsyb3Rnc0traFdyRW5LVXpKQ0thSVJjbmhk?=
 =?utf-8?B?MG5YRERTZFhSMlZZUGhnOGlYcjRKRm1vQ29hd3BZd1g5YmlFTmlVdWlQR0Zp?=
 =?utf-8?B?eGMxaDJsU01BbHliQ2RrbTZpUGJSYSs1ZVZkSS95UmVJQ3NSRWVuVGIwZWYv?=
 =?utf-8?B?NFZyNDhOWk9CYmk5eFNiKzdBbVJmSGpnVGRjUG5sZTBjVzNiRFdlYll4QUht?=
 =?utf-8?B?bURSV1FSME5FcTFobDQ5eTZXd0JjTTFKOWxwTXRGR25IdjIvSU94bk9OTWk5?=
 =?utf-8?B?NHhDU3hnbWlmcU1tU3A5dzFoUGtTcUVaWHg0djBkMUNMTHdTeGpTV1VNV3Rv?=
 =?utf-8?B?RXNtQ25TWE9UMTlvblhqUUVYVlNDVGJPdm5mbFhpQk9aVmNDUGtRMnRHRkdW?=
 =?utf-8?B?UXZabkdpd1ROMlpELzVTZWlPUjQ3c05yT3dvNCt6aEUyTlhGdjdpQ0s4OGl1?=
 =?utf-8?B?ZWR6Z3J4M3Y5MCthYzNobitmT1BjNGFkbm9ubzJPNUVVYkFvcS9sS1Y0b2Qy?=
 =?utf-8?B?aXdFVE43V0wzZFpGRzNQYzhuRlU5QStOY0dMTWNDT21lUkl6K3A0Tjh1QTE5?=
 =?utf-8?B?YTlCK3V1WVJUbTV1YTFlYUF1eG5XK0ZFMFJsK1p1TzRLaFhXNmMrTlZiS1hq?=
 =?utf-8?Q?6rn4=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:38:38.1085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcc6f87-d5ab-42d2-bba2-08de4815b3db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_183843_152790_AD10562F 
X-CRM114-Status: GOOD (  10.47  )
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index ef719c6334fc094f01d9e8185992f2f58320e17d..96bba65f4f16792834567324db6f7f2bdee7bc06 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -328,14 +328,26 @@ AM62PX_IOPAD(0x0164, PIN_INPUT, 0) /* (A20) RGMII2_TX_CTL */
 		bootph-all;
 	};
 
-	main_uart0_pins_default: main-uart0-default-pins {
+	main_uart0_tx_pins_default: main-uart0-tx-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_IOPAD(0x1c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
 			AM62PX_IOPAD(0x1cc, PIN_OUTPUT, 0)	/* (B22) UART0_TXD */
 		>;
 		bootph-all;
 	};
 
+	main_uart0_rx_pins_default: main-uart0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x1c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
+		>;
+		bootph-all;
+	};
+
+	main_uart0_rx_pins_wakeup: main-uart0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0)	/* (A22) UART0_RXD */
+		>;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x0194, PIN_INPUT, 2) /* (D25) MCASP0_AXR3.UART1_CTSn */
@@ -692,8 +704,12 @@ partition@3fc0000 {
 };
 
 &main_uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_default>;
+	pinctrl-1 = <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	status = "okay";
 	bootph-all;
 };

-- 
2.34.1


