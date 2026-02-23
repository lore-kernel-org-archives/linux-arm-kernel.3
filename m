Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB38FEEC2AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 23:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkNhcTEO1Nv2gJ6tQfoZX+wxPMeOZguEEqkkNQc6Rn8=; b=WLcewvKU8RVVcUJJVxl8HrOihN
	ZKIfHUyAME90FLDuyK4e43x8wG5elzO/G2ZkqrVd5QiHsy0iab/zdZxRwCjmMX33DsqOt+AAAR7gV
	B6Vtt1ILASkDdbjXzJDk5NNwaUcZaL0CJ38POucWvzXtM9oFSw/Z4+d3FvW4SYlVuS5Q4cVVY2/Nv
	GgRrGoj+cwH3PrYdxsHpZsWPP/v/lxdGB20XtlF7emXUZ711ptWSea2FcSKnKBcDXxJYbE2vdgokU
	Hdn/MWDJud70/OhOmhQVXG0yRwznDqZ75LCB9kBYARwTDWmRjuQDjiCOOOxMiMV1uEVZlPsuZDyKV
	Ne9JOt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufUh-00000001C33-2FoV;
	Mon, 23 Feb 2026 23:37:39 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufUe-00000001C24-3b7L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 23:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS45hEt5ZY14eqP2v3IDFP0KihIPhmZOAcrU9WR/ROrDv5M9YfKX1ZKz5NpHjPGcLqVX6aENZ7VlCWDTPXC+a5J3RZ2Z9ShY0MYXq45QamHg33rwGbhQP14wIF1qNsG628HHj+h2zHHiF6G2th9pn6lLw3SD4Sn+aZvGQBmj/Pvo8gBJcteR87Gx2Zf+B6aTmuPhLHyXocn5+3atX+0VQiOgJ8zUjSX/EZ+0o1mlj8gmMB6dE/MUpmeWTv+5qlY0K6+hGdLAat2UFG9o+m8XavJZjMKiMYWMdiYwX7fAxlng44QtBpkqvTGkPDmi2YJ0hiy91fBLoqPhRHfE21xcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkNhcTEO1Nv2gJ6tQfoZX+wxPMeOZguEEqkkNQc6Rn8=;
 b=ihvfHHEYelVH/O4uJTUYMr6W4fPRv220ZLSm+DyYFOHrGBKNAoyEoZ5aElE4QkpPfaf2XIZwPL4C5Hb570HUTh3FrlEOWxW8n+OYvWCYZJ8URVGvWUGdHxNSgRuoDW3glbtvi9e8ZDM7PhjG9gDgI4s/bDfqqCVMCgRo7tiWmBcJxTMcfgjPoXl8HdVJhZ4zLJUKS02mzpOu0gNvOhtV2kwZ59ATzkohj4joWdOU18/mV3Qpm/xINovjUYJzpJK1fFdYuqFV8/Tr6ggw66542SnQaDAd1DiLMhpArSLx1ycNSCAQCjrWH2uudAp49ZPO89WmFWrSdlKSQ9BNHbLL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkNhcTEO1Nv2gJ6tQfoZX+wxPMeOZguEEqkkNQc6Rn8=;
 b=J+qRAv4vgdGY7PQ4UdE+7QocuO9pPCWv4QuvEPheeOglYsDdpAxR0xn6MLQOiBig5SVSmpu1jv2fr2IWQTSr6Gd/jitwtMjaO5PX+e5pCy4/swf1snRg4G9RomoR01a4+40B60wInDqI+t27JRmPwsZ95uWWjZy6MMc9aMfFAZQ=
Received: from BL1PR13CA0230.namprd13.prod.outlook.com (2603:10b6:208:2bf::25)
 by IA1PR10MB6218.namprd10.prod.outlook.com (2603:10b6:208:3a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:37:32 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::f5) by BL1PR13CA0230.outlook.office365.com
 (2603:10b6:208:2bf::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 23:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 23:37:32 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:37:31 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:37:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 17:37:31 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NNbVXt1677488;
	Mon, 23 Feb 2026 17:37:31 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-am62l-evm: Disable MMC1 internal pulls on data pins
Date: Mon, 23 Feb 2026 17:37:30 -0600
Message-ID: <20260223233731.2690472-3-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223233731.2690472-1-jm@ti.com>
References: <20260223233731.2690472-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|IA1PR10MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 12429152-cdae-4e75-13b0-08de73348442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8SzF8zC5ZGbUahQeLwPGy/IlntfDyG4wzSEjhVAT7iF008EQOcIeA41l/UbI?=
 =?us-ascii?Q?vxsiubpxnYeXcEEtP6ujRnYgHNa1OSeXRKIA7HuTjFpsieCNRT3X5uGik69j?=
 =?us-ascii?Q?eow3KPQIJbYodp/8PU/7WD8/bV7l89N4CjPxotlZeJ835q0YEuZyH3YSsVI3?=
 =?us-ascii?Q?SbK/SIBVlh6fhp30jikRNtCIT4Vab25Azye63vcSq8s1TWerDZaP/R09KFkF?=
 =?us-ascii?Q?V223UN3nzTDt/Io0LVehRfW3g+vu63Aq4EtFotYpO25Eo64mKoQ3DqxpWIG6?=
 =?us-ascii?Q?HpJ6rlBR83XsgwNhM39Zw5bXT74HjunYSy0J/LEDErP3eLRUYPLZ3EhWADAJ?=
 =?us-ascii?Q?YS/ku6K0QD3zL+X8Mivm0CRW8J3Zx8OvsHg56iWT6eqxsDbaN6W2gV8ZMb5K?=
 =?us-ascii?Q?LA1oUMtJ9cjmmLsVwzg9CDrlZAO4q+nOSq1k8pZabciIt78Ay2frY8skbUei?=
 =?us-ascii?Q?EWFh2TRLFgeixHlRg5n7Jxso4MCwvPsSX0DnmV27Kb0b4YtxLzgbJ2S5xbyR?=
 =?us-ascii?Q?Dq00J0H8v2LKfrdEWNRPsXl4lzfgUa/xyHhbZY2m7HDcG9O41IjB0EEtJv1D?=
 =?us-ascii?Q?WYr5rGR/Fbqrfxpx0lCRvwHRN0R9pz8ZZBaWDi7K+7AYqZZJc/SF81aRAAGl?=
 =?us-ascii?Q?5+6JWyt0kOh8ONNV3rNbJwurR3mhND8GM2FzAuttaScwwiNdpSrQeUCgUo5u?=
 =?us-ascii?Q?YcTWc3/qdyrpQPDc3jecmzzdN207UTT1567wZnHw5dMjGz8NDPMIX5dBjkw6?=
 =?us-ascii?Q?f/0del2VFnMrPQOWpwC5h694+FHFHD/Yib8w48NT6ANZ37TP0kUF6Nk1KNFh?=
 =?us-ascii?Q?mJgOxtfaw1L85aJXQAvkwhEpM+tmuOTZevSy8fTkvuh0d5lDoLbw6NsKgYqj?=
 =?us-ascii?Q?OUsJEWmRKm1poBTlVyJ0H9XpeLWYcSuoeC9X44n8oxPMSRpAvA10ZOTCje+c?=
 =?us-ascii?Q?Yg7kX2xXJ+ONqxZf1v1fn9IilfJtR3BC3Ig1mtKuWY52f/gR9qHNl9deCNop?=
 =?us-ascii?Q?qK9XYGD4teV7vgsACizSmocOz6RvmJa3+RWuJ3FmMa276FMZt2da5FzKsui7?=
 =?us-ascii?Q?/oX7cF/HIvlmXjOUqBWoLeFRj5pKcT+ZIzyXITG1gXSDocR9+Q5fIg+JtTH4?=
 =?us-ascii?Q?O2lMTWNkygkr+vmLriu5ocMrZx4K10Vngxr7b5jUE1/4km3PpbTryJeIscHd?=
 =?us-ascii?Q?1bWR6GlR93MehV6nyMHAjXFRirt+MLAcp7nz2FqgzDpME2IPanfSqqjxC7v3?=
 =?us-ascii?Q?ZR/TrLCdskjYjyRvtb7HvN3dslDGO45Pof2X2GIZf+H8XTNag4KvUsKTHnhN?=
 =?us-ascii?Q?hL/hQuiQKZJO5b/eMBclOClYBoCxq+JgPBU9Bdrn6QQrQ1Hm607W4z0uHnGg?=
 =?us-ascii?Q?av8H7X95uKRQzCaes/GZQ5AHnIpEyqrvtQg3PSw99YSBy6xgbTi+5MDOPMHP?=
 =?us-ascii?Q?fflF6GMfISczsVWRrBlH/q1avvth+e4ymochRr9HMPDjAUzf/UTOAdPyT9ei?=
 =?us-ascii?Q?4JMLYbwoyl3QYRyMkgmPQ/gJHgPCshbhtnt7idKgUzUazJusLhxL7Alb1xwy?=
 =?us-ascii?Q?tEAtC/V6MVN5HuGbLObVzvSW+svJzDnsAweqHL3ynsvyCgLKnEqC2r/p7Oyt?=
 =?us-ascii?Q?D4upI2PDICOxS09JskYX6VcR2Munp8/SD2JLlSfmlFzgqwrd6Sa6ApQngpqg?=
 =?us-ascii?Q?0KWlOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Pimn/k8/pvn6zMGexoStPy22i3tosqXfrabPCXgnQP6ty/iP8LcNWITSg+6wZmTBDhvn/zRUc55eP8KWYiYqmI615p/o3sw/yZckT6WQ3mr+IANbO3aU2TIEmTOhQ9t+DPqZO9xz7S/c09GYFV2oGXQMKnackbakKP6KyPZzCHjrWEKTi0wO1iv+xVaT8bbJ3aw6a/d5IMW4sCu2k6Pm5aVkTVbWXqOlbrGfRjIWpkTgm8Xrc9ZN35wfLEh6KblCIwuDQ/K1MHrWvjKsQOO7InOSFKR8Qv6BC6c9T2QsblSgWG1bAVkRSh3rro+H1hd1QodESXCSSOzL02FdD68G10vi64NI922GuusnJA6WV9LULeamnQ86smD7noIEQwq8W1/j6GH3FAfQ/B57IJuxmy6iIGfwKqJuVX69qoH1Ne8IHv++gnPArwXsweOWX8N6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:37:32.6433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12429152-cdae-4e75-13b0-08de73348442
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_153736_900919_22A48222 
X-CRM114-Status: UNSURE (   8.80  )
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

AM62L EVM has external 47K pullups on MMC1 DAT1-DAT3 pins [0].
Disable internal pullups on DAT1-DAT3 so that each line has a
single pullup source:
- with both pullups enabled, the effective parallel resistance on
  DAT1-3 (~24.2K) creates a ~2x mismatch vs DAT0 (47K external
  only). Removing internal pullups results in DAT1-3 matching DAT0 at 47K
- 47K external alone is within the recommended range for 1.8V
  signaling (10K min, 50K recommended max)
- both internal and external pullups enabled equals unnecessary power
  consumption

Fixes: 00fb4c73b67d ("arm64: dts: ti: k3-am62l: add initial reference board file")
[0] https://www.ti.com/lit/zip/SPRCAL6
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index cae04cce33736..bd876c68aa347 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -272,9 +272,9 @@ mmc1_pins_default: mmc1-default-pins {
 			AM62LX_IOPAD(0x0230, PIN_INPUT, 0) /* (Y3) MMC1_CMD */
 			AM62LX_IOPAD(0x0228, PIN_OUTPUT, 0) /* (Y2) MMC1_CLK */
 			AM62LX_IOPAD(0x0224, PIN_INPUT, 0) /* (AA1) MMC1_DAT0 */
-			AM62LX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y4) MMC1_DAT1 */
-			AM62LX_IOPAD(0x021c, PIN_INPUT_PULLUP, 0) /* (AA2) MMC1_DAT2 */
-			AM62LX_IOPAD(0x0218, PIN_INPUT_PULLUP, 0) /* (AB2) MMC1_DAT3 */
+			AM62LX_IOPAD(0x0220, PIN_INPUT, 0) /* (Y4) MMC1_DAT1 */
+			AM62LX_IOPAD(0x021c, PIN_INPUT, 0) /* (AA2) MMC1_DAT2 */
+			AM62LX_IOPAD(0x0218, PIN_INPUT, 0) /* (AB2) MMC1_DAT3 */
 			AM62LX_IOPAD(0x0234, PIN_INPUT, 0) /* (B6) MMC1_SDCD */
 		>;
 		bootph-all;
-- 
2.52.0


