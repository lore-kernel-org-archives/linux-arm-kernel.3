Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF4FEB362A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2XD43DryUdS/IsryGYk2uTRqtNUtD8TjkJnCFNY0sk=; b=xoZ7s50iJhyeGOLlf1ycqMEtOR
	+w8quTtHbS6ukYIQNq4y2qH5/o4Sft4Bf6hUY4A/+nn/JaWjmBHO+PTw9vVvoVO9oiYO4ClETViQn
	0GcHD9162ULMh8LVw2GNnwehbub3T/vDPJ9dgaJbAYoHbsch1YT10+eb9CeSxsoVkgaBfD3vF8KVq
	q7YS4dF82Uj858gOOkvXLNupuBguiS15sS2HZrdYykEdJxHT2FJp3aqLE+4GtV38lB/YakEOI5jgS
	x1fwu45QxlWzeP7svRcWMnfrCHoiRduoHcr1cb96qZEPg2YIcX26UMkSZvjV4ns9DBJp/Gj1YqUhA
	Gfkz/AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qW-0000000Dff7-0lWg;
	Mon, 02 Mar 2026 18:18:20 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qT-0000000Dfek-17kO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPFkJHe6lqrgyblp3YFdhCnuKzPRZkYVhY/GKeDEPZPkE7VaktbD71qXI5QSPCWxN6vjCKbTPHAqRSqe5Yn3jNvOTW7xOd6loKjKEALoJ/JvIqCpdRzn/wJ5LL4TdymBVMMcVtKaPfw3HwOghStdvXTREMlq5I8K02T5TglQQpkhj1YADP+hoGBmoUY29Ve7/5ANH8danNRgHLu2+4gC57vrxMA3bGktHSnBHX+DEg5oFcZxkrN6JggshjPlWBmDBEQQuIykYvou+510rSZWa7PlldU8eE7MpE+IF3izVoyRguo40HsLDIBXZ8PJtng/Qa2mrT5YNN2vfLEixjzmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2XD43DryUdS/IsryGYk2uTRqtNUtD8TjkJnCFNY0sk=;
 b=AOOZ0dUhcVaQVrWA1QkxDD1C4zppRcIj6LbrusIMSIL1QxSFLmM6x0UqHCzwQVGKlDhzZC7asN8y07n57iNgKtg/tCq1qeRSNXf3Aez5LO1b7jkBSnw62JqoVf+/jCjrSVLgAUIN4ZGF7wD0Enagk6Dg6jfAenjGdHL3P8B2Zv+WGTu9FEZwWnCc/sNsXaRfkW3XxGL4ALW8vPfqGmXa1pLuYWtHyirrVbrEFT1qFQ/TE+FcA9A153irPAABxF19U+30nlYJsqEklLYeXhvh7JumG1oqbaS8/fTImcCf6nzMWsSY8hfdYIq5Bf2vHxBWVYz/VlxDeZoFNCR4WBTGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2XD43DryUdS/IsryGYk2uTRqtNUtD8TjkJnCFNY0sk=;
 b=Q1uuULvUwk9xYY4mQP5sNchFOjAd7H7n4ylv7Fk2fSdPbXltBRKKIkm4CZEUvDIdEQNQFYixdsGRBoptJpeHG5cAOHKfWuCVVMsmzoUy44cbrpYXolEk/a8QA37MBKYV7wbIdXsu/bgiRdSQzoEP4yP86zft7jcleoVSYqI6Lmc=
Received: from BN9PR03CA0486.namprd03.prod.outlook.com (2603:10b6:408:130::11)
 by SJ0PR10MB6327.namprd10.prod.outlook.com (2603:10b6:a03:44d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 18:18:13 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::93) by BN9PR03CA0486.outlook.office365.com
 (2603:10b6:408:130::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 18:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 18:18:12 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:10 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 12:18:10 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622IIA6w1232767;
	Mon, 2 Mar 2026 12:18:10 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
Date: Mon, 2 Mar 2026 12:17:57 -0600
Message-ID: <20260302181800.445653-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|SJ0PR10MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 643df358-7195-4385-678c-08de788810cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: lh30GBERNcYYsSOhs1bY1uNCjiYsaVeP2oS2hTmp6axfhTmo1S1vwSO2m1m6kusDxvctJbM/756qywSD5F01rCcBfXQB4gfJLZa9Gc1G8tP/RL1rc69jkoK58avZAyTvUHJidyjr4nLMyOHjxdXoPsJmLUJN26NnxE/t3rw8+05ZIMFrA3PejfigIKjDy9sHEdfIbF1dImbfSY8uz7j7R94UMlIO0S5f34wUvYy5r8Wipqu4aeuGmNUdjyImLS3SrJf9eI8DWR8i+lYo1L2dv+RJZBIIjSeI4iOqbu6lo/rOOkYE2nqC2ZDEkmPDJCl9tjjReYPRgA69MeOIv6BfefEgh8Hfi7Df7+gKOJOGjjB0brZPujSLjvAnDmCNSR1MyWlxC+rbbSj8VcQRytIAHibfVIQecJD2NWbcNRcRuy7vr4veJ2vM827Sg6I7jM6MRQSsoBnVY4dht5uyqPvZ2t5dUuQqne3kKRGJkC8aQtk+DqJ0BW45HzpJrme/Ajx2dm8nUQo/T71NUl6l7FqA4PDK+aZwCUKufIb90FxquWIpWCA10Gh3/f/u8xkQ7MkCRicEHJCSxS5Yhamjq+PwOE67VF/SJVjcb4s87Of9TRU+rmLbBy8rj4G15aBRDvi4ncfQZaDgK5j92Tnqu/h4/rKDSNmj4LKvL6K2shHAJiaOhH0D3LKPUDIXyfoi0ykvl1ZSuZUxVlB8xJGL9Mh3eiBj3nSoWmmwc4xlgPOqmjrT7byQWn7a2/8gmrojQ8h83xro6RG5Elr9qP4zMibku5b7FhZvJG3lDBc8lgHp3zaSuAdhjODsRDiUeEMoNCNo2M4Wiy24NofqbQhaglWadg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RcMSP8uQ9cLy/eZ9eedm5Ha8y0eiW2K7PXAfeAIN/0NWHWl5T3VaWvkEvjWw4ySGHOpQLg2WvVvNY2MyN57UcVG/3Dhjv4bSwmtxzdgAuq7T+jeil3wVkeK0hn6S4xitqmI8fuTdYXdK1QKzzfWQFip41aFmC523EJ4Lt/rPoeoBbTi1wQiYWfs20i9dhIp1+YGQA72wnRjj3ciDe5sdc2x6atUOSLpO35NTkXBh3GKwmKd6iGsJXrfnPTm+x8KwT+GcBW3e11fhhPk8hugmnNUzPJn4Uq2MmeXmofZXXF2JK6GPhXePxDHm7FEQ7DwSXgI+ZR1S6RWZrhaAGk9UjOgY3Gw5Rc4pYikSM0sUfktz4hf5StG25a+M5vJdasoed9///aa56rZcPciROsh43ccXJmQBjE6eP/ItXiE2Q7Ec2NWPAYFYec/dt5jq+h1C
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:18:12.4728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643df358-7195-4385-678c-08de788810cb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_101817_525731_7017F0A6 
X-CRM114-Status: UNSURE (   8.24  )
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

The NavigatorSS (NAVSS) address space contains a 64 KiB on-chip SRAM
region at its base address. Add an mmio-sram node to expose this region
to consumers via the generic SRAM allocator API.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 80c51b11ac9f..7b1ba34ab719 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -785,6 +785,14 @@ main_navss: bus@30000000 {
 		dma-coherent;
 		dma-ranges;
 
+		main_navss_sram: navss-sram@30000000 {
+			compatible = "mmio-sram";
+			reg = <0x00 0x30000000 0x00 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x00 0x30000000 0x10000>;
+		};
+
 		main_navss_intr: interrupt-controller@310e0000 {
 			compatible = "ti,sci-intr";
 			reg = <0x00 0x310e0000 0x00 0x4000>;
-- 
2.43.0


