Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35D8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb79vdBkOaCXJXCWGEig3ehFtAUhwOpt6CJ3ulTSq8E=; b=NJX9Qvnrwbs16V2OJxV1XodEei
	qfwCGiPx6CYxvS9q7XQXXFVR0S9BpYEDravhA/jU+XOY8+NkeEIkoLSOybk0PfQ1OvFeqNZ6q1zRU
	qFXtELzGiK3CQxITKRDVEJl/tgC5uCsGfjpL736tWzNGNU70fXC1SfU5QJiPBq+vBQWf3VPZSNMqb
	Oxwjbk+SJ1j++2s3xPTqRBdF1jdW+wgjRZouIH48iW7g415rOFwStk8OjQDvJCyQ+PI78UY8Z1sXf
	jc9yalJB4DLM5CnR6ZOzmJjuZWz14QZ4YceQEjYf7RGVK/2YBvrb8OOA2I8Sqk34QsOkyy9znjrKN
	6MuG4Gsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBlL-0000000H27d-00aA;
	Thu, 18 Sep 2025 10:21:15 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBlG-0000000H23q-0YbE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:21:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbG1zY0kqSuyqB4nVDf3Xmts1+qxckJhq3LATFgFZrrqN+4YdLa15PaDgBJ1JJanjF192gLrHmyulADYRskobSoSJUhK0p26sk7UFsyUvb62RKDwIi4+XViZ7TzK2zrCgt75CvWNKW1KJUf3comTTpJEggck556ANdgC8FNI9leG15tpPrppX333jDoPClfCRjxnTCBkKgcUKlZHvVXlKGXhLfZO1uNcZTqFEwtlqiPZOO2bD3BIhpmi9j4cLeNMY62q2UA/Z4OqQXEspK6m/rx4bckoxaLvfglCFJ1zpGSMWAf9Af51Cp+iXCWhUumdeiZiChqgrny/ceZLCsjGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb79vdBkOaCXJXCWGEig3ehFtAUhwOpt6CJ3ulTSq8E=;
 b=HLsyTp8nQ16pg/QVvGzP+0Z29GUd1c9bg+U6a/FE9PJgDsiq3ZqOMq5H8IaHL+Zylm7KoahhObgJxMiv/Q1fGZPDLKBPX9PvqMVeBkX2qz4pd9tYzCXl8ZQ677j7WdbzzrFYBQ2Y2bTPHjBfbkhzMG1BGL2qvdZO4i/iwwn0e50rgsqd0T97r0m7EWc5NOZZjvwtNpSEwn807JqEW3vayaIcaShtlvDN5semkawmCpSNvu83tCNJkjdoNTyXkHaEW0HM9HjoKLgp7ekNWX/vA45CdhysbEXcVa6o6lwbWVlrJfmzUT/bZBOwUYcib3q97X6hRmwZeiuiLa7HBcgA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb79vdBkOaCXJXCWGEig3ehFtAUhwOpt6CJ3ulTSq8E=;
 b=gA6r+fsZ4blzzo3odmdQO/l1ei0DvtybhWOBIa3EmzFHPwWcuEXZbkZj7Cp5plmm52yLnf+9NqbDsn27OsPirIGa7esOoxfOYUjtW+bZF4uARlQs2jRbSpCSanN2stH6U5EddyQDMqYORTpAlNSYV3AIC0ewCcnXznrVEwIHX5cD33AQNPuZ6DIXNynnF4LQfIP6gmCLRqd5WZH0FdylFUyLIEByZPo1E1oisYnupqhmCNSlxmtT5Al9Lua2ex5FKTuzMM6tdvxO4Fux7JdekYibwRyedpFvbqilZtWOLpV1cWkv8e9w4AV9bvsZJnob1r3PqCKz2QrdOoOACzMXqQ==
Received: from SN4PR0501CA0054.namprd05.prod.outlook.com
 (2603:10b6:803:41::31) by SJ0PR12MB8613.namprd12.prod.outlook.com
 (2603:10b6:a03:44d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 10:21:05 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::f5) by SN4PR0501CA0054.outlook.office365.com
 (2603:10b6:803:41::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 10:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 10:21:05 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 03:20:45 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 03:20:45 -0700
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 18 Sep 2025 03:20:40 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, Marc Zyngier <maz@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sound@vger.kernel.org>,
	sheetal <sheetal@nvidia.com>
Subject: [PATCH 3/4] dt-bindings: interrupt-controller: arm,gic: Add tegra264-agic
Date: Thu, 18 Sep 2025 15:50:08 +0530
Message-ID: <20250918102009.1519588-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918102009.1519588-1-sheetal@nvidia.com>
References: <20250918102009.1519588-1-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f9ac4c-2b84-4d99-860d-08ddf69d1390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jN4nBfYXYPajjSgRVyPQdgvcDEeca8SGQiAvx+fN8ypaYs41XEJaCSvCEm0u?=
 =?us-ascii?Q?X9HK45R/hJJtDW4m2fwBmBhzkip81SMhQLSRdV9EYSwy5N21kykEadf9ji6+?=
 =?us-ascii?Q?WWJylMjvGS5Q8nSNzM5Uk8NYySN7cA5tLX8gZUPeYgm4hpSCYq6zC0PVAS1N?=
 =?us-ascii?Q?H4z9cEJVem8/7/1G25YEZK+w8pSKphXLtJp32IBWnBTcbQe73kzPGpB2wein?=
 =?us-ascii?Q?A1OQHD9ITr/aV9vV7lBl3C0dzNmhFwUvgJ3l3kyvYlk9b47+Qjx7o0VJg5IZ?=
 =?us-ascii?Q?p3NqwAZYz2079sJVdNNQ0s2Zh948IWBc2o4NmypnIHFTwbuOXMQAXXG75mjE?=
 =?us-ascii?Q?cb67/I5A2/MmifB4AZRrGBU8bIsdfM3LRu9vagqwBPX8TVn+FwPCwiVMgkkV?=
 =?us-ascii?Q?6UG79cI16E6NX+oexKdwEIPn/qqXBL/JYqgjyzYxhodahiZ0h6wG+uGOgwc5?=
 =?us-ascii?Q?xDk/iNhcq9fO7bhms37uJ5gS5beDNaDZVNvBRcM7Yx1mM70eA0hCbrHqdAhV?=
 =?us-ascii?Q?DiaauN4TYczBX/J/0z1bRJ/WjSfOIgQ3JhEKBbPSv/xZis7nDye4vtoTx/8k?=
 =?us-ascii?Q?kmR0wYOoCBLCQ9E2BqbY9eXRm1VnLu/i0lt3XaWAjpCZVl1mwdsq1E24uY0v?=
 =?us-ascii?Q?ZPlyq5VxLO55rQ6CdkF6UjKeiBxI7f8PW9e9hOelWkVgEgCsKBaS5wv7Q3gG?=
 =?us-ascii?Q?piHiHYrt5S3/Qyden/dOBT00P+c1GcShbbCylNisT23hgmTFy5OP8TPuunh9?=
 =?us-ascii?Q?N9sU6RzCRkD3uR+S5J8E+mD8wtklnUc54wkbApISAG8rEYIXFc2W92xmkjrA?=
 =?us-ascii?Q?+5H8WlChQaCqmavDZV6ibsbkCQ5gfcP21lybo3n8RgAOdZmjgJ1fjXbi2kOQ?=
 =?us-ascii?Q?Z4Qu3sFxXFi0+dB8oeULUdFJ4CiDEl9DQIjsMlROyxt05BzNShnVXdyfH2qT?=
 =?us-ascii?Q?r17OZZ90bQf31s1oppwhCHWQ89V1lV9DvPiLRBV6dyFFjjdLrLHdHOV9KieZ?=
 =?us-ascii?Q?nzhp+MI6xXpgfhOxDmu4A/b1Y4L1PBpEBVFTcfzPrKW1J4VdbbWb4jOsb+em?=
 =?us-ascii?Q?jaSJBKDKpX2G2P0vFuiKx7tSaVolRbI+kc1hH1O2Uz4AkIkmT9QXgU3ywHlx?=
 =?us-ascii?Q?4E9JdTkqZkTpbCDC8r7Wfuvj9vL8llkPCufm9jWzIF+/SuqW+YIcElFxjMti?=
 =?us-ascii?Q?6SkJ53nMsQP07iJRtlpPV0LqVtj9odcUeKV8/De5pG4ooWGqU6owwgxOBZWh?=
 =?us-ascii?Q?Ef3jX54PaQR+Z8LV7DAii2dztXt0hSdB7OtQQ3kydlXGtacf7bUggtYYsETl?=
 =?us-ascii?Q?xZcVoUHCj81IgDycLcsS+/T0P2YuwJzVPGyTdsu8hXpz6rc9thDONli0Nypb?=
 =?us-ascii?Q?KcXk3zKOdJHysUDDJCa23VkLBTaD5j7tPWglFEw8UpX17locIkWHb1svCnyS?=
 =?us-ascii?Q?7/F2d+zV/iMAY07uARgurg1KKMvBM1ge6DdV6GiIZcwU22cBnYTKcZyZ/O6Z?=
 =?us-ascii?Q?FZOWtInDg67d5t0mln1DF6I7tAV5/5XzRqB7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:21:05.3560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f9ac4c-2b84-4d99-860d-08ddf69d1390
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_032110_181774_83EA5674 
X-CRM114-Status: UNSURE (   7.87  )
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

From: sheetal <sheetal@nvidia.com>

Add nvidia,tegra264-agic to the arm,gic binding for tegra264 audio
interrupt controller support.

Signed-off-by: sheetal <sheetal@nvidia.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 7173c4b5a228..ee4c77dac201 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -59,6 +59,7 @@ properties:
                   - nvidia,tegra186-agic
                   - nvidia,tegra194-agic
                   - nvidia,tegra234-agic
+                  - nvidia,tegra264-agic
               - const: nvidia,tegra210-agic
 
   interrupt-controller: true
-- 
2.34.1


