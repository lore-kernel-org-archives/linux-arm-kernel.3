Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5F2CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wz7mfxq8chkvnSFzZS5pdyEZc8gN5Y1qremQ8SaknA=; b=VzayAWJVOWy5iiZbLcDmw9cJf0
	+x+nux89vXeIGkvWidi5QqXruZqRHpAh/qERAdv49Szx6WaAGL4K6qn+XNjmw1+2g7rYJswSARNos
	nqO7yYVq+H0NT7dEiZaA7zWJpu59AXjDyedeGk4BNU6peXm8dAbRU0GKCxhDqx1DRD6yH6jC36cWi
	DRetida838m4t6dNC4kjvA//zWKJ6lHajnrR8GZfncaY5ITufvovuHWzqvfASld6DKBeBhHfuFE9V
	qBtdc/pxydGzHYpYHPCzoMikLd85m/dhbojNqy59/EotBENbz4AtSGpWj5ovgxrQbvB1fbv34vDvY
	LIX+K7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBl7-0000000H1yP-1KSL;
	Thu, 18 Sep 2025 10:21:01 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBl3-0000000H1wf-2v67
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:20:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaKwaycIjwW+7MEHR7Zbhjcymy1YtNra+VAUaYvXbymVEkKmdluiN6hKbkgTCxfq2cIJc5DdwpYCUKw28MpS/8g9mDLJFqsVh4xpiuqzEVVVW1sI0zJ5HasVDw12dFUZcAGvEeRFHYgiMDI1a+Ur3uVe5lsT4I1R+mIIjKmMsG2vKv70YQSan/ofY4UtXzMYXBMfhnScTDrN7DH9wLv1T1vOIl4EmRAOf+dMYg3KPP2w0VX3PJjaeBBpwv8+nt+bOlRUIIq1fBEWO6p2qrqOnhlQrpqwdYqHSqUqg8tbaYHhTH16Y4CJZfjKYMGWG7rdlu0B6mXWVLB344D5ssb4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wz7mfxq8chkvnSFzZS5pdyEZc8gN5Y1qremQ8SaknA=;
 b=yNHtId9NXA+2oi5V5VGNwwX6E3ufDH3pKYe/6WwAT8AX2gmX/SKpmeUiL0U0NZcDsuTRMki9QKxX4eQZiASk4NRUH7lLm4PNMbH6ioVWXZb7pZdh7CwUgpXxongQ62AEc6uf6XG3Gmxfca799IEOd7sLbAW3wvWt5ilyBc194MpL7yJ96nXJ2kqGXB7EEyOVk0GiHH/dhze3gt1CzgbPa9/kWxnpJfH6Ep3fpRqWUtGW1GFfr7FHgyvpTEdTAj5jo4ugsVn1KU+Qn1glJvYy/YeOUaa8wlY/qDngcP7sRuB1dmRu8NjD64k11CCWtygnZPJMClyvZT0q52kP7uAjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wz7mfxq8chkvnSFzZS5pdyEZc8gN5Y1qremQ8SaknA=;
 b=WGVeooBbhgw3hSxsbXgGWv7HskFuIGRGEz05ZIZ2JvKG+QUUDG3OVeUXmAuXkiaKQqM4tdByMtlbyPVZLS7AMltUHKuOcNVhEoEPrIeirig0GdOHG+w/QclysEAel/dKr6D8swXJGYXlZP50MulnZFdRrwcwmsMHWO1wAp1BIu1uvw+Gy9/9mRfbGpb9FsDn9rEgh9ewmj96PHH4uVgC/Cy9VovrY5qVEgpLjT/RVgs4yRUAg9mU413Q+8ugdVCs0qJCPfepITYEEFB1es2FHHrRBdgVPLhTQv1opWIsdqvD9x1cGk1gEdYKV14QWfgCmGudLEkldMY73Oz5X33w0Q==
Received: from BL1PR13CA0248.namprd13.prod.outlook.com (2603:10b6:208:2ba::13)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 10:20:50 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::d6) by BL1PR13CA0248.outlook.office365.com
 (2603:10b6:208:2ba::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 10:20:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 10:20:50 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 18 Sep
 2025 03:20:35 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 03:20:34 -0700
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 18 Sep 2025 03:20:30 -0700
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
Subject: [PATCH 1/4] dt-bindings: dma: Update ADMA bindings for tegra264
Date: Thu, 18 Sep 2025 15:50:06 +0530
Message-ID: <20250918102009.1519588-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918102009.1519588-1-sheetal@nvidia.com>
References: <20250918102009.1519588-1-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cac1764-5942-48f1-fbfd-08ddf69d0a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U9VfUUV1vsVbvB+2UCUrX4/EIO2nZ224qqIkybRGxTN3rbb8NybfzEm7E9NK?=
 =?us-ascii?Q?OvqcqFT8ldGV7adWzxVeWg+UCi6cEQXbJG2BbnYoLWE7tdvBhpuJixpW08s2?=
 =?us-ascii?Q?rvdwMoUzrOoVyXH5Iski9m+Hw46aa3Gs5hWPeqbTDUSI9S55eD7kYYMlJbo+?=
 =?us-ascii?Q?wzWmjIEhp+iiH4Uh2DnW06EGF28ksjMOYiOGRwsXGY14jMqwZIjuI/0aFHS+?=
 =?us-ascii?Q?cg8QeLtejKzofmBfoy3IUNRZ28QWWvXD0VnppLzYqNsOzqdCdHMSD1CGMmLZ?=
 =?us-ascii?Q?Znexy+qVQw5FS7IhBrSMrlEsbo9MnWIi3u7t0sv70F/lKyuZb1QYhKRiilCf?=
 =?us-ascii?Q?sIghyW08cC3J5tawoT2Xt89uVQUTP2d5aY9ZXTX5siJ5JnfXz7yy9mMlBLk6?=
 =?us-ascii?Q?uJi+/sNPS+i1nXs5DAHln4cNOhx9LVhVg2UNSA5PLL5AfxoBkk8GSsX1A5lN?=
 =?us-ascii?Q?TARDTF35jJk64wvoOkMLRIiKqOZOEBKweXX0gdEvifghHm+/WmgNS6N+gN+G?=
 =?us-ascii?Q?D6BZV5PvKxNHFc8kLysqWO4GtJO81fwHNDtpCdJLbJlqJAqlteWSHOhZWjvc?=
 =?us-ascii?Q?HOmfRfDX2HGcP3Sub0cx5mePwrbJOFRF0y3hbTRfcj32vtMPItyVF+fa0ud7?=
 =?us-ascii?Q?7ynMBYRJ4TLFdCjF6hFIvMgTq9L48ejOxiC+5NX89JM+QOupWMjcplXpip/B?=
 =?us-ascii?Q?rcrta7eKKo54+YlLC2eoJpXrKHJ+Kn+lzAuJmKC9JmEPOoZ2fTOo1PxaH7tZ?=
 =?us-ascii?Q?BDHwS4aDno5JtNnou22vBLQzy0rGdwnSqsaTO714YB1bCS8jLKgqRAJyVP5Y?=
 =?us-ascii?Q?aBJsA+V4ie6N12c6LpsWXuVtbrBNyXMFsu6JlY6UndoXE2/WpC5EKMJd1sYW?=
 =?us-ascii?Q?1R+ntn7BcBuiWAvGBpM6Xz/VaSMloHW8VvKX//5ZtnH190sfLpcH7mv6WvHr?=
 =?us-ascii?Q?MBelbc2IYGzJnA082fKwuPQslVod+JYqQmsFQvhvbvOaoXEZziXJMGlSCAgZ?=
 =?us-ascii?Q?nE6GFwNjfrV+uZgmvAW110R0RjMHLHtemcrIR3k6ICAA5T8YvK12kgiIR4iq?=
 =?us-ascii?Q?YP6qEeI+mdggQpw0U1F5z6LOPoX2B3YDyTzZeJm451qK8lPgvo9LjTi1R4XW?=
 =?us-ascii?Q?pbRYtS7BMcuNg075z37zzUa1G+mccato0rKjFDdsvUwfS294RVIckJUKKGu5?=
 =?us-ascii?Q?xMkMze50YabPbV3pbYTbKul1+K91M2qjMskRUcZXRmDG8oxnGEaO0dDyN6LX?=
 =?us-ascii?Q?52GQc9aAMBUrcsSa0zHFFhlqpK391WTjht/bRDzJzd5CWsZ2XYd6ZCYfzeTo?=
 =?us-ascii?Q?dEU9zk7ZYEu5UhoNLgmarX5LF6PaG2bUHVwyaF6hyx5WqqlvZt1jDGJGZQSa?=
 =?us-ascii?Q?4UcuHk+El8XMa7qbZi6wAUmbNDXxGKP3wFV3Pgya4pSPuH8k2Cd2MKSSlxe4?=
 =?us-ascii?Q?wHgPPf+kQzHflVJYl1LgIfEQg/x1fzgDhOzTy+EXGm66Io+3tJgM3FReMuLe?=
 =?us-ascii?Q?JSyUyEBbWU322b4rLXrJEm5nB5FQg8wfl5/6?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:20:50.2355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cac1764-5942-48f1-fbfd-08ddf69d0a91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_032057_923269_5CB02D94 
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

From: sheetal <sheetal@nvidia.com>

- Update ADMA device tree bindings for tegra264 to support up to 64
  interrupt channels by setting 'interrupts' property maxItems to 64.
- Also, update the 'allOf' conditional schema to ensure correct maxItems
  for 'interrupts' based on compatible string, including tegra210 (22)
  and tegra186 (32) ADMA controllers.

Signed-off-by: sheetal <sheetal@nvidia.com>
---
 .../bindings/dma/nvidia,tegra210-adma.yaml        | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
index da0235e451d6..269a1f7ebdbb 100644
--- a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
@@ -46,7 +46,7 @@ properties:
       Should contain all of the per-channel DMA interrupts in
       ascending order with respect to the DMA channel index.
     minItems: 1
-    maxItems: 32
+    maxItems: 64
 
   clocks:
     description: Must contain one entry for the ADMA module clock
@@ -86,6 +86,19 @@ allOf:
         reg:
           items:
             - description: Full address space range of DMA registers.
+        interrupts:
+          maxItems: 22
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-adma
+    then:
+      properties:
+        interrupts:
+          maxItems: 32
 
   - if:
       properties:
-- 
2.34.1


