Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77937D46977
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wesr2RZ2EUP/kkwM8kXYOwfl2oFJCrsZ2dlyB/ht9+E=; b=zflFoO9HAsNmH7HYUQw1MBKqOb
	BvB/tMrkGJ8YdpZf/r/Yk3auavjQO8XbWRCaN9HWE3SisMhO+2EVBl/E5sxrQ47tQg4ePBlgxW2Oy
	L0keZq57ZsT96GMz7XSZKhc+Um+WqaIjlkJQbM5FJBzyAqpcdoPLZqrJL9WcfKTPC+X0/K1bUKTSm
	vvgTgV4k4Oa/9uf3ek8dBmCBtu8PjVlYnm96iSUAfUQe2/Oqlf/2+ATuIXfF4AVDrcgm99n5BvF1+
	MYjY5qGjL3/yMZgOr1qZ8YpamdqpwtB6EQXI0boMjd306fJZ9NmLmqr0MEDv54zYydk2HbezZtAF+
	AlINP1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye1-00000007a0J-0W0v;
	Thu, 22 Jan 2026 17:38:57 +0000
Received: from mail-westus2azon11010050.outbound.protection.outlook.com ([52.101.46.50] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viydy-00000007Zzv-311L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:38:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cdf3WyFf3H5OVKtakibsTBF1EEpAtwOmCMlQgDfTSVdaFEOvDbHkRE/qrcXhB80CF/W9EOs1mk6uXmZ1g/LH0DFzZxZrf6QdzlA7ftiyxJbvo451tN1QNHkZcsakqA/Gons/WowQm66PL/ke9ulnLAk8X6P1GUh7pn1KzM15Z12YO9Lb+jDOtIB6QTNwlRm/SP/22HNv86iq98CfZnvNYpHfRTgjiVTtXQrKYG4U4JXsx6ZyQ5/va76gI2En+eiaceMSGbHrJT9J0J26x9b/vHlh5B8Ze3HAvCVVA3SuZ0bmzfuNXYhHpHOjlwfBzMuE4RcU7HoO8K+o31OTdrguRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wesr2RZ2EUP/kkwM8kXYOwfl2oFJCrsZ2dlyB/ht9+E=;
 b=JSW/w/DGEniWmum/BnYGP89RhuAJxTajP7CNX+ctZF1i5isoZLbP0vicV4H+7xLmCrwBrKbYITIu/6n+pwRFuQeXX1FGTeq+Rv2piaV0VK7uOWr/BsqN5U13noUdsSUiOIzbRtbJzbLahGq5W7BHfp3zIODqFVBx1LFwOvHxEYAxScdfP+I0FprDaNiQ+jN9HIEI08SmVtrEqR2n9c+/5BXMlDxrULDqggcrZbTW0bGeimCgG8SXcRIuwQuK0wVUuYOrK7YMgv11doc2s3gl6Y3UvxSmYPz89A99gdf8na02desaNcxbbJGWLPiq23xJZ4ZiYP8E1p9hjwe5yyhIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wesr2RZ2EUP/kkwM8kXYOwfl2oFJCrsZ2dlyB/ht9+E=;
 b=XwjYpfLJs98icn6bBd4bKi2q2UdwyfmTWcZUUrdfe6dNbdxOVHm67RaNAqjsf/vaAnL+oB0DIKXb9jUtPFZhcuu9wVr0rlz63N5S7zwzY6reJ8H7WW4Z71WF9xG9RmLaPB6Y/Lsbb5lMMv5C02taW59A6JOI+7G1SGS5Z2eybrE=
Received: from SJ0PR13CA0134.namprd13.prod.outlook.com (2603:10b6:a03:2c6::19)
 by BL3PR10MB6090.namprd10.prod.outlook.com (2603:10b6:208:3b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:38:47 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::41) by SJ0PR13CA0134.outlook.office365.com
 (2603:10b6:a03:2c6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 17:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:38:46 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:45 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 11:38:44 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MHciJF934604;
	Thu, 22 Jan 2026 11:38:44 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 22 Jan 2026 11:38:32 -0600
Subject: [PATCH v4 2/4] arm64: dts: ti: k3-am62a7-sk: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-b4-uart-daisy-chain-dts-v4-2-cfdabdf5e6c1@ti.com>
References: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
In-Reply-To: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<d-gole@ti.com>, <msp@baylibre.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769103524; l=1898;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=J1q247fmp/yjxkmpD0mCxbuHEfNJBYjhRwV5KoKaNdE=;
 b=bG8XJWAWjYBdQp/pAfMb+mB+0uf1I+UkmxMK5JA0R7kazCbgVjiFD1TlTrgSYMMn7WnVRxmbR
 8tce9KHxzLgBd8d5wipaIvffFZ9rAOAqxGJ7oWi1xNSSX2mg7c7FbL9
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|BL3PR10MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 86bf9cc9-cf30-47b9-8d29-08de59dd1877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG5WNXVkTlVEaHZYQ01pcGxPcHRSeGVLVktndVAzUFdDY3EyQ0hSNlFocll3?=
 =?utf-8?B?Y2FVbTZqbWZCdmc1ak9uSG9lQlF5V1gvSVBsMGptMm9tM0JnMnErQnY1QUJ1?=
 =?utf-8?B?dVprSW90TE5KeFpZU2FyaUJvUldmZXNtWDkxQnpxSVRwWndrc0RBcC9xMkU5?=
 =?utf-8?B?M2kyTEtNUzFRMUZLUC9VOEs1cXB4b3BJaGRwMDVVNVpqWEQxQ1E1dVZlK1d5?=
 =?utf-8?B?aTZ5a3VQeVc4K3lVM2lua3ZBd0RjYXdVbHQ0cCtHOGNhcy96c3lmMmlnK0lW?=
 =?utf-8?B?KzJaZlRjU1dnWmdwS2lDZGlWYjB6dVJQMjZKZ1JtK0hVcmNpMnlub2FnNGt1?=
 =?utf-8?B?bWlIdmUvR1ZRVmw1bzdIbi9KMk5TenkyOTNNZDFHUTJEQjlQTm9RMzAvelMz?=
 =?utf-8?B?Qy9vaWNJZEJ4MnBlcjZxSzE4N3MwYTlrbTVFWXVHSXJFYU44aUZSMW96V1FB?=
 =?utf-8?B?dGRkOTcyTDc3T0RZTVNMc0orQTFTekY0WHRzeE9JdXNXT0tVVFhWbnFUV21L?=
 =?utf-8?B?cmNFWXFKb1Fja012MnZReTJHUzlDOWp5WXBSbWZUVDQycW9LSUN5a1FleDZW?=
 =?utf-8?B?SzV3RjdTNkszdkFqYU5hbmMwWDdzTUR3VDVDZXdRbWpIWis3MFh4OW1KZ25s?=
 =?utf-8?B?bURtTmlGUHkySUhRZEsxMWxTSGF5REpSYk9EVjU3Y09tRGZOZkdLTlUwSE9X?=
 =?utf-8?B?Q2p5ZjB4bGFMdnVEei8vOHRzV3phckxkZCtCZDBucGx3bjVpSGZTeE9WZVBV?=
 =?utf-8?B?UTNQTXE0eEp0bkhOeFBKU2g4NkNyNmNCWFRERGhvTjBuRnJjendra1pUdVZD?=
 =?utf-8?B?eDY1Szd4eDh5YTlrV05UMTY4azQwaWRXZjlFWGVsUmhSMDFqLzQ1S24xT0Va?=
 =?utf-8?B?TFd1RWZyQ1dYbVA0NTBQKzJNZ0VoWUtuM0V4WGc2aWsyZGhBanRtR21BOExJ?=
 =?utf-8?B?ekRiS0tRZk1xckdDRDN6YzIvNmR5Q09zMFFaNjR3VFNmbGRoN29mbFJncTd6?=
 =?utf-8?B?QzNHZHhpTVFjYjZESmt6NTg5MWgrVklSSXNKRFdKVTJjRnJqTEVGazRnZENY?=
 =?utf-8?B?WVVoOXplNUdvdEJhN1c0VlkxN25GeUIrOHpUSjd6NTBabTlmdFZtZnhOc3hX?=
 =?utf-8?B?NnB2MjVhYlkzUEs0L005OFVkUEU3blQ0eXR4RFk5bTFxaStzSHI4SXdTOFZw?=
 =?utf-8?B?RGZkcGtOd0V1TXZ5VEVnN2RhbzJzZnludCt3WXhrVlAzQmlaRStGYUdCL3VO?=
 =?utf-8?B?Ykd5M2JCZUpiSjlSUkFDUncvdjZhMkQ1ZGUxeDFYMzdkL204LzAyYUgrTzZL?=
 =?utf-8?B?UWJyWEplampManZvTStQWEI0Zkp3VktuMzl0SXBsVlZwdkt2bzZOaG1oNkFk?=
 =?utf-8?B?djFHcVZMTFFjenB6WjJrV1ZPbUMzRTNnQkNnOFUwdHhoYmVXam1RYktoL1h2?=
 =?utf-8?B?WnlSNDZjeHFia2QwaW1Mcmpha0I0RVpPc29USGhDQldDWk1tVWRiRFQyTXp4?=
 =?utf-8?B?SHNya2pqT0c3eEJGZ0JaOUprVW9RWXhiVTF6Z1NzSDhKdjgrWXNPVW1xLzJ3?=
 =?utf-8?B?TXFJYVVNd3lUa1Bsdmp4TW8xWWFGQVhEajBETC83dGptSUFxcHNnRk9ZL1Bl?=
 =?utf-8?B?ZVVWMVNscmRyQzlSVHY5S05uYllFc2VDVkl5S3RKTi9oM09pc1ZEdkNPakFF?=
 =?utf-8?B?VDEvOUUrRTlpbEk1Z0ErenlEdHhBQTVlUGZ4Qi9sb3NJUHVzN25jdjJHMHVq?=
 =?utf-8?B?Q3pXa21GK0lVUkhwZzhrOVZQc1lrVHU5U3ZLcVdqYyszWEZTOXFtbWFOblNH?=
 =?utf-8?B?eGhjV2VKZGQzaVhHb1djQXhiM2x5eVNKWXErNU1mQUowbU1lN0NpcHpmRU92?=
 =?utf-8?B?L2RLV3FnSlNQYjk4ck1qd1FrQ3RhYm5maVFTV29RYllqejl0d01ZUVdWdmRN?=
 =?utf-8?B?K2M4bDlkWEpMYlZ1MFlYWVp6Uk81ZnJVSSsxQVVhT2FBbkFKU3lmTmdJaCtJ?=
 =?utf-8?B?bGZ1RXQwNXZJeXhjNHJzUWFNbUdWOVVhL0Nrb1JHa0FtczMvSmdHd21jTUZH?=
 =?utf-8?B?NmNYYSs1cUkzQ1BEdjAxUnY3dEZMSlhKbXg3aDNsYklQM3MwV1VBUTgrZVFG?=
 =?utf-8?B?UDJ5aUpSZDdqMU9jc1VDOGJMU1UzZy9zSklhYVVvUUxiY3Qybkp5cmVXcFM1?=
 =?utf-8?B?ejJyRlJLOE1EWjhSM043Y3lCQ0VtcTVtZGh2OHFVNmF1aGkvWXZvZnducVdF?=
 =?utf-8?B?OFNIU0pEcndtMHNaTmhWUHZMVHBnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:38:46.5090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bf9cc9-cf30-47b9-8d29-08de59dd1877
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_093854_768723_46203D61 
X-CRM114-Status: GOOD (  12.60  )
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

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..112f0f2a3d449b324d479c0e2a7d07d0ee57caf6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -282,6 +282,13 @@ AM62AX_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
 		bootph-all;
 	};
 
+	main_uart0_pins_wakeup: main-uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0) /* (E14) UART0_RXD */
+			AM62AX_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
+		>;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x01ac, PIN_INPUT, 2) /* (B21) MCASP0_AFSR.UART1_RXD */
@@ -717,8 +724,12 @@ &main_gpio_intr {
 
 &main_uart0 {
 	status = "okay";
-	pinctrl-names = "default";
+	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-1 = <&main_uart0_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	bootph-all;
 };
 

-- 
2.34.1


