Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6060CEFD1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYrJJJv5NHU+ZESVsxMVCe2r6w4ff0ThEzslSfXZ8pQ=; b=mbFhnV/8eTUvhm7Ilfc06g6yLM
	snQa14SRPcVx7Bz5oDPJSW0dYePaVTsMTIl7/E4s3RASxUz/+Sp5h75FZ+FrXyZKxwBdWl8togId5
	LamhUXy0hnXL/cf8jnY/CjSQ97/oUIvy2FRlfdlY1geN8efmVxRbJU0QqZP815FazgKVK8TVXsv3C
	rbvxSCmblDF7+6JH5tRInAlnYaxG15Eq6QhsCzidoTzux3SQqdZi2HOYjN+5kq/BgrXXtRiCQKvbP
	O6L/Qso2jmboUn2F+NHkeU5NxxqZz7XhKTzQZPVOz19+FZU4HDK+5LRDIIvr3txRIt9NfuE/+W9i9
	0bAZrh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFia-0000000Duk8-0QCJ;
	Tue, 06 Jan 2026 22:40:00 +0000
Received: from mail-westusazon11010068.outbound.protection.outlook.com ([52.101.85.68] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFiU-0000000DuiG-3Kob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 22:39:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHQ6gjpzigl7TrUm6RfAwDLDendjmLpUgdstkGDX4112ARZL855EjOy6G4+xeXb25st+FLmvef1hUUb9bnTsI/uFANKagvlJ3htcM9M57mBR//PfpH6LjtopOJELEIfOqbkPTJpJnhMvWoc99oRWoiJxn0HTTOrus2G7ApsFkU4PWpLblVG5F7DBAbiqWJW9SmRvULSb00l/q7CWBkJkSFWITVltCk0JyQyzpSyWUTz7oSrQLNIRJSNDfMA8P77D2nfLed471wnQtqL045MY8oxuFpqqsCGGh5G/l1mj4jv/upc/G9oYEv1WtIN1j++v0sY3/5GqTKNqkJi3X+66Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYrJJJv5NHU+ZESVsxMVCe2r6w4ff0ThEzslSfXZ8pQ=;
 b=CBUtYqLZZgOy0Mgm/gaiKCvUxjri+LCNU5DtQRz4yujPj0tGheSjsog1nK1yDGzgvtX8ZYyH8Hv1L7eHKNX+qVuSEou0vP4YszQnkGceQjOF8l7yvDsWyng03sNMG2/10k2znonysn+rc9agqXo3Jx833vL23fZFGILXJuUSY7OXbAD2Fp2s2ASG+z1p90msAKir0Yjxa9mAXXrupTU5mabKHE/6g3PEkBY45Uon+qJSPWJyu5oeqR0B0S00L+y/NbZzZgkeSsAVApQocxYO63uSQl0hoJn/ir4T/BK3qc5Np9eTWtJullE5r+CMIYt3N0Gmq/OFKAuneQQ6+S+yoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYrJJJv5NHU+ZESVsxMVCe2r6w4ff0ThEzslSfXZ8pQ=;
 b=PR+zsw63sgYs9ZHYY7rfHs3+wCUCK06Xl1Ac0oZi0gw+PMqdi6xLGQbGicVwCAZ3OxY98ztGCAPxf5kXkQ6rDf/lBIGG5dGyX3v0KcQEtTtvXLaeGnViVrF0/z5bjEnBAPbfUn1cmpjJN5jRXR6/agsaLjza+gWDH6mhxxWRIxM=
Received: from MN2PR05CA0066.namprd05.prod.outlook.com (2603:10b6:208:236::35)
 by BN0PR10MB5159.namprd10.prod.outlook.com (2603:10b6:408:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 22:39:50 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::b9) by MN2PR05CA0066.outlook.office365.com
 (2603:10b6:208:236::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 22:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 22:39:48 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:44 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 16:39:43 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606MdhS73586904;
	Tue, 6 Jan 2026 16:39:43 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 6 Jan 2026 16:39:23 -0600
Subject: [PATCH v2 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable
 target-module node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-wkup-uart-wakeup-v2-3-fb4cbd56c827@ti.com>
References: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
In-Reply-To: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767739183; l=830;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=6z6oIPqLS6m8/2lbknElanlGAg7aG1FZU9s4eqTkUP8=;
 b=bIly9dBlC3Kue9LcN6rL8Ia/a64Qx75ziM9areI48fk1Wj1iLBaiWawLLm1lW6VB27aJCE+ju
 ohmjkh38I0aBNJGgRpzZ30EJkGelmihFIcbhvxYhLC0ZVI2k2o8ZaB3
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|BN0PR10MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: b14586f7-0a87-451a-8199-08de4d747f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rnl6NU80dmI0SVhDN09Gb0c3d3ljNmx3VEF3QzFGV0JTWThkNHN2d0xybm5T?=
 =?utf-8?B?UG5aZTVwYlFRMlNFSGZtT2tyZmFPMUNHcTJ1eFBqQkpJc1VkeVZ2Rlg1ZE1C?=
 =?utf-8?B?N2U1QzAyc1RuZFdtSkRpZVNuSmFBNTVBR0JEMGdzczFIYXNPelBtSGNSMk9w?=
 =?utf-8?B?UzhSTG5hUXVmOHkxdzYyVlFzWDNpZ0hObmp6YnduUTYzWTVNSW1iMGZFWnZJ?=
 =?utf-8?B?YjVuanJnT3dJRzc0NTczV3JKeXJodGtYblE1aWhBK1BjVk5TZ1E3dkNnQVpT?=
 =?utf-8?B?V3RnQmlHRXVrRkgwVkViRy9jWXNRTlNlT01yOWVkaFJTRUxtZENFZkZ5Z2pX?=
 =?utf-8?B?eWM2enAvR1lLNk1ubEd5UjRxblEwRmdEcGZaR3ZSMkJ1bW1yNnFQSk1adldB?=
 =?utf-8?B?RCtkeHJ0NXVHYm95Um5seFpIZkw5aHZoY0F0ZkxsQjhmc2NsZjRRMEp0L1Zj?=
 =?utf-8?B?Qm5IdC9ReVRHQXBEUUhjQ0lSazVSRG5WRVc3WDFYbDhDWHBJMy9oY0YzWTQw?=
 =?utf-8?B?REZhaHlGbnE4SGppK1N3VTVRSWJYV1p0N1J0WU1ITEpKdExwbjkyT3o4eDJs?=
 =?utf-8?B?Y1A3R3liTzVPNUM2QWo3RDBBZ1hxRDZGOEo0TmtwTWl4eGRQa0k3QlRxMUlI?=
 =?utf-8?B?c2NNRXVDWWlrSmt2UjNCZ3FjWTNZSXBRZHRwM2U1b25YN0ZQdDdmUmJ1a2py?=
 =?utf-8?B?UDVSQ2JKZ21pT1IvVVdKMUJiWDlvRmtFK2NEWFhxMDdIak02elJIcmdwNkU5?=
 =?utf-8?B?NDYrakFJUGdiUm0xNlFWUm1iNFF1WndoOHlSRFpTeXV4WDJubHh3eGZjV05M?=
 =?utf-8?B?R25rc0lnQ25odndORXN3OWl1NkFGK0lyQkRQbmpyTGJEakE3WUpqNEJjWk5I?=
 =?utf-8?B?THpDSUxmTnRlVmZRMDZ0YU1PQUovZ3NRSVJSemFXMjFXMTRwdjBVbnZsMjUv?=
 =?utf-8?B?MERHTll4RlExVUw4ellnM0wxUHhEZW12d0xabTVQamYvNjhGNHFBUVVVbjJo?=
 =?utf-8?B?WlFuR0ZCTEdIU2JMcEMyU2JqTktDbVhiQUhYQ1k3N0srajcrV0liVTFSL0NP?=
 =?utf-8?B?dXE0a0R2V210Ums5YnoybkE5QU5mcEdIWXQrVWhHNDdBeUJNU05yS2pBcUlS?=
 =?utf-8?B?QmRjdnJZNjVPVW1EdnJkb0N4QUJJclFGMVh0YnhORGhjQlFHZ3dUMUNmTlds?=
 =?utf-8?B?ZzdaTmFzd3l2ZDZwc3VuelF6emEyZ2JOTTJBSzhrNko5V2NId1dJSThXeDJa?=
 =?utf-8?B?dktzYXh3YUtOOS9UeUNNVkdwTmdDcXpjNGRldCtGV0VycnF1OFU5S3g2SzhG?=
 =?utf-8?B?V0IwNlg4a3NXbThlayt4U0JaT3k2QzZEekplaVJhYlBta2xhZ0YxRVMzQS9k?=
 =?utf-8?B?WGlMUFMwK2JxeGxvdGVVS2h5ZzBMbWRLYWdlL0I4WkxIM2c2WFJDUDQ5NWNu?=
 =?utf-8?B?UjhKeWwrYUR0ZXd2NWZwWTlBenBQNWZKNUxQQ0orWUk1QWgzaTJQc0tXYjZ1?=
 =?utf-8?B?b3htMXdiNzdiT1Q3MG1DTkJzVlM5YzJsdGZPeGU0cG1TZzMzMUNyQUd4WDAz?=
 =?utf-8?B?VUdGZmpncnM5VU5JbWtQTTIraUZsbmxEaEVtZklxMkNibE94K1B5MVZWTGdR?=
 =?utf-8?B?RFZXbEVjbVJGSXBJUEliWTNVM3JoOFVtbm5hZk1iNXd4YURsTTdKSjQ5NHNQ?=
 =?utf-8?B?eFNTcXJIZkN0ekdTdUFkRUg4WCs0Y25UWDkxTC9CWEEyaGZwYXJTcENlR0xO?=
 =?utf-8?B?TUFTVUR4K0M2c1hFRFNhK2c1eW1aT2h5ak90V3RIVzVhK0doRGV6bkRMcXF0?=
 =?utf-8?B?bU55S1RxdnZYQXI0MlFFYjVxMWFHb0YwMW1DT1JoWmpQYzZCbGFDQmJYYm9K?=
 =?utf-8?B?NTZaTTlTbEh4MjA0ZkVqQU5TTlgrMEl6b2tCSWhKYW1seEJOL2lPekdTeDRm?=
 =?utf-8?B?akhYRUVLc2sxc29jdXhiTlNFWDRvd2hUdU1CeG55aXBxMXVwQ3MyeDRpMW9n?=
 =?utf-8?B?VGx5Unpac0VYeDJ4NGF5b1czWUZNRG9PbURCUWNJWHBEK2JoVElmM0VKQVJD?=
 =?utf-8?B?MGdpYnNZZEpGbmpvSU1qQ2xyVUw3dXBCeWJIUVMzWmlIcFhCUW5YZDZpMTJO?=
 =?utf-8?Q?amgI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 22:39:48.1884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b14586f7-0a87-451a-8199-08de4d747f6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_143954_841133_5E3608E9 
X-CRM114-Status: UNSURE (   9.86  )
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
index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -359,3 +359,7 @@ &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_default_pins>;
 };
+
+&wkup_uart0_interconnect {
+	status = "okay";
+};

-- 
2.34.1


