Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F3BEEA84C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SB5/ELV6yY6ftguJPNKL6+NbN7mrEO1sOuaYvPJAO3M=; b=fk4tVHbhhxipj9iesOxu8sHBzM
	+SaWFxhT59L8aLcmVnl/BwBkV9D4I3Mf16SIUyyToqjT7jm0+d0Yf7ogwxfZoBMPJhxbEumNmC6yQ
	NCs5T4/aiZ4RV5BR1kielIluUUUDo4/nXo/wUEakOtutLSUyGAwfFVZPHuMDEnyuLeSQvzMVi0JHS
	LIW4OVVYl77DU0n5RwIuK+1oqD2vZ3sxNki7HoUjyuZwrfvJAU/RM+UYNh6bW95aAE4UyG/Y1Jqnx
	GthYtm4JKNLsHYFdGhJBz/JS23ghh7zXETAvq08rNsBLzBZ7IgfpKrs9KUhN2wYVEc4Jb1E/OSZZj
	ZbY4kHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeb-00000002XHv-1XTn;
	Thu, 12 Feb 2026 18:43:05 +0000
Received: from mail-northcentralusazon11010067.outbound.protection.outlook.com ([52.101.193.67] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeV-00000002XEG-1CGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 18:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByZne+GxIyYBAs6iqh7semh8Y1yd0rIQqp2RoVlQzXyXUCkKH13Z9sFIFEJJuuD/xp29Vo7fhkzdMKkFJNvJ5OYd7zwVq8XOEaMDiWgiHqkleKL40h6PBMCYkFjUUfojfaWRNeADI7XKEoVHWMp5QFWOYWzW9VMa7eDL+vifhAn1DTO3ZB9ZxNLia4TeCFBwLp6qtUQZQd/vtg4utxP2AG5CXLiN058i8NBdluRgrH41EFwj9eXhaKDNAoGK+xO6H75cvIsr1J8bURedj4oV4kPU8AokU7k3dDkdutWtKOAmL4bDKMN4/7gHK8JPUOZ0T0LL8zcNbYMWk5lOLlUGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB5/ELV6yY6ftguJPNKL6+NbN7mrEO1sOuaYvPJAO3M=;
 b=u7jQ8tLF76BLE2zeRM9y5J0N9N0jV42opRKGGUNv+qFNuwlN0sec5ZWJAAlxFa8/QgSbpPY0JZcbcZ8nZDELRfScB0KPOYvLGRDDeQ5E1W3V6CftKPkih+2nzOlNwjBEuWGBhF2EwzNR9+vKRpjeKU+KYroqtr40UDIW3yymMLm02rfhvcLuX45svb8PA19w7CcejtXmyTyDAMK684aN8v/hM0VLzEWuQzsr91eaNylLbg3RkD9NsCqTfo5Ctd7iv53NCN4x6ZQhB7JeI/h60bVSeeO9xIXlAFPSOCrvD1qDJwLF/chq29hAOGOjOn0Qbs78wnML2ECeBBg+Q+Efnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB5/ELV6yY6ftguJPNKL6+NbN7mrEO1sOuaYvPJAO3M=;
 b=n3kWkEVEQedt8SZ7Ko+OxY1HX9Og7/r/o3a7gJsi2WHY6WlYTWeIp3UjyZyqqb9Lgw6B1nOwzHPy+vpPFejFxLnOOwUHMh5xelJ6W7u7JRMVItDbWXBPaHPECHHpiAsRgweZfWAvlDXYc/HXW+fz2QQ/AQUhab0aDjoJLTOInRI=
Received: from BL1PR13CA0436.namprd13.prod.outlook.com (2603:10b6:208:2c3::21)
 by LV3PR10MB7981.namprd10.prod.outlook.com (2603:10b6:408:21e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 18:42:54 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::45) by BL1PR13CA0436.outlook.office365.com
 (2603:10b6:208:2c3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 18:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 18:42:52 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 12:42:46 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CIgku44002204;
	Thu, 12 Feb 2026 12:42:46 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-am62l-evm: Disable MMC0 internal pulls
Date: Thu, 12 Feb 2026 12:42:44 -0600
Message-ID: <20260212184246.2316659-3-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212184246.2316659-1-jm@ti.com>
References: <20260212184246.2316659-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|LV3PR10MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4697dc4e-bf35-46f0-6f66-08de6a66873f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aGs4lQ8b1pM/Uz8pINEVe6DzfYdUIBd2YOHTWaIvglAoZWircvjYKssGWyPr?=
 =?us-ascii?Q?zuJV602iDjNNCgSztKXwNru2usQZxESBxtMqJFv8THvp+DX2q0RDBy2KX/Fn?=
 =?us-ascii?Q?D+SLorcj/xRMGpJvY8gt2rj7rmrSNOUxZsL9XFn2iQIIfWHmADMQ+4cBYCoU?=
 =?us-ascii?Q?Av9+Uu/27LLNne4TB0lw6Z7dV4Jo628Gg4DYZf95COF6GpBw/6WU4KXhukLK?=
 =?us-ascii?Q?U4DhNEDQfWkNSDmcU+g/K/OmGxT0k+pfnqgghBOSPl3siAvzNYQjaKdLoZ/X?=
 =?us-ascii?Q?44He8E7ZfdeR8bFpWlcf65KjNK2E/HvQ4ZYN4dJXMFhygl6KFZLuCATgCR3o?=
 =?us-ascii?Q?aCcq9u1vQRXk5/uA9zCGsIOI56o6W9qPk5XO/IT62SUNN+ZaS+NVsthwzOLF?=
 =?us-ascii?Q?73JgUmNGjAhXbBSw1UhQ32onKzFhPa4FWz/vkcxZsXuhzoIFD76iv7L0UwV3?=
 =?us-ascii?Q?hlAx5FUOLieqJZ/QMV36LZJJvhDonHjm5l/1Ul3h9rXlxclcd4v2Zj8qHkTH?=
 =?us-ascii?Q?Ddf2jsVNjB/WevnyRnaBBrolmQ97nhSKaH41sMU0kWqxyryAn9KBVAzs2p2n?=
 =?us-ascii?Q?AHHfoy8A7frMblMPFRr6y7YcWBCBAlzg6JnNIiDKb5Hz8BVKindnmlrn1gES?=
 =?us-ascii?Q?efZqDh9uA3sSZCEaVc+ToC2i/tlnTNUha6AohIOD4IkIVTGBBQ1DDD+bBlvn?=
 =?us-ascii?Q?gx9Atxek2wisijH9ZP2eD5ocLT7BXDDOLiuRdM995yxGcHY2qtToargx0XRi?=
 =?us-ascii?Q?JNnhBu/dWCx49gyltF0Ah2uJUKcmQ9MT2UW6Kgj4YtAw4TQUMCFbOQeD+daI?=
 =?us-ascii?Q?9CxIryjJNtSk5WZz0b568dw1HfU7hMIHcjo6IdI11tYYQFpDGFysEqTvYfdK?=
 =?us-ascii?Q?KsLBUDZjdLPyoOsfco+Yueh+AfFWOPYcASkCIg1sRGOBmY5YHNszwPcPOXeY?=
 =?us-ascii?Q?RxMUDFXiJnhFlh1467oIZ8UuIoYh9pZmv8kM098Z/ndUTPUESU4Qe/u7lFdm?=
 =?us-ascii?Q?OwbpLlM0fRp1Ca5zbSptX8F8bzZU9geu2Z/FAX7oL4MSWcwq9qkKeyq47z6S?=
 =?us-ascii?Q?pLPqVTFLuNAHS4RKzUPkDllxOtDGUnzCmyksWhKN1+rxg6J+ksqIaj49fx9G?=
 =?us-ascii?Q?ccTn6al5DY/XVNW89LZ5n9TXjxXp/1zz5hX/lJ0U7eTfojwY+rhJJSATmSGm?=
 =?us-ascii?Q?9mWm0Cts4SjXOQKVh6YbI4ebvaeDGu0a5DDmMuB7RzdGC1S27SXBvBTUR66V?=
 =?us-ascii?Q?jzYShBPDArYT9Hg7NKLFJsC9+ASICCg8vwmNVGMQGPF8Wj6rzzYhb57v+pkm?=
 =?us-ascii?Q?j7sh9yVpxSD0jLmdCYvZot0MNxusfQ8xvzEY/jLynElXN/HsxFV7Zr3Oc59V?=
 =?us-ascii?Q?kL+JrKgNh9g2dNxo5M0J9Kiis/gfqq/6RZ55PU2dy/YvQ9qc39MJjQiDwJd0?=
 =?us-ascii?Q?dJOXZJFmSEkdQmGXLjqScRPUxO5/+Up7ZrNheyoC4yf5amQXRXOhJPzb+Vyx?=
 =?us-ascii?Q?bUqwPOf+ub+tHdOqYPef1VOLjBMV+wIdVaCo6fOjcXKqJptVd1Z/5JWJNuVC?=
 =?us-ascii?Q?72wp+P9Yb9/PwaeDF0rIOYN3CuLM4nIy0XnLJuTSYCMPp3hZStWcnLtbG12o?=
 =?us-ascii?Q?HkJSwbbKLaxINTfbjQxitfmeInKBbhi+3RhxQDuM2CQNmlEKDPvxoPJYBMmb?=
 =?us-ascii?Q?LSwTjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4klzzHw/sUO9nwu7hwzFpg/RtU60s6d07lXpYaa5FBRCYuuc7Bbdtcp2rF1UlfuLl74GmtnRJekSh4nt3LnEPHA0Qpz70x1vp2UxBUZD9JMMFLrGAuGeTBv0aGDZbaia3Q1AMZcd0/wB8gvzHbx3rtzF2oFhQjY8jakKQPoWl9GQYmFMkg6Ab3r9ExH3bPTfGTuK2y1E2UYnFfvgE0EHpQLUPWU5VpYB8Ai5+g19w7x9RY60ItrBbWVF/AUlKRS5c3b9sXYlXkOjCxNEV6T8qX4yXi4538yaR7xbsO7srJMUOGnwW+L4AUhIWDuNXOXSwqRVcEOrA4jtdtaJyoYlGHGNuVDi6wcLfSQbvojGTlsWEuq4JPMCnoRGYpCcs/8jz8objucnynkwzN0pS6K5pmBj64RrzOuKw2CLAdXtLclcZqpB222nWund9ypPZA9z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:42:52.0312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4697dc4e-bf35-46f0-6f66-08de6a66873f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_104259_330349_1EE1DBE7 
X-CRM114-Status: UNSURE (   9.84  )
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

AM62L EVM has external pullups on MMC0 CMD and D0 pins [0]. Remove
internal pullups considering:
- having both internal and external pullups reduces the total pull-up
  resistance < 47K resulting in a value below the spec recommended 50K ohms
- having both pullups results in unnecessary power consumption

Fixes: 00fb4c73b67d ("arm64: dts: ti: k3-am62l: add initial reference board file")
[0] https://www.ti.com/lit/zip/SPRCAL6
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index cae04cce33736..5085cd255fcd5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -253,9 +253,9 @@ AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) I2C2_SDA */
 
 	mmc0_pins_default: mmc0-default-pins {
 		pinctrl-single,pins = <
-			AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) MMC0_CMD */
+			AM62LX_IOPAD(0x0214, PIN_INPUT, 0) /* (D2) MMC0_CMD */
 			AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0) /* (B2) MMC0_CLK */
-			AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) MMC0_DAT0 */
+			AM62LX_IOPAD(0x0208, PIN_INPUT, 0) /* (D3) MMC0_DAT0 */
 			AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) MMC0_DAT1 */
 			AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) MMC0_DAT2 */
 			AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) MMC0_DAT3 */
-- 
2.52.0


