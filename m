Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA51CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAjrHrthD+d9yJ/h9IUzA7T7e0l7hItFjuvkQ29tYwc=; b=fkSw63wIvIrNJNM5UcLdDCf+3V
	CGW8lJwd7OU8o9s9Q2rAH3530uUMKnxkEJSxEa9Jhnr05CQDKtJ1xK6nhnIY1D3Dzuic0w8pG1Yuk
	CEZuQQTIR/4MgNC4GMfjpfrRxhFc3om1ft0WiNT+Rs/DoxZB0mNa4LdZECtfhqPzBdbX7XEiYgcwh
	g9oOs+lvCwUAFVN1NfTCQS3Uqw0ZEZat6x5ZTBiYEFAyocCE0UVS32h1gjn4zE3W0AKoyYPit5a+M
	AUNNk3MzW/akbdUN4HuxsMkMJgswFotjlaqgD3XHH1wi+MpCtf0BiyNr8INuShEF0hX0w9EfyXcz1
	vKzzrdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBlC-0000000H21j-2gjf;
	Thu, 18 Sep 2025 10:21:06 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBl9-0000000H1yo-31mC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rv/0mQ7RFJ9DqIwoLUuDrNQXYU5gwkK/BF+ApXQTlN/plthHHSwOYoOrkbQ0Z1fm+cKoamgmW75nzTpTw+NvBJsaGs0fQ4SpjrFygH3oumUdR7U3fUsTPXxQMFWv9IPki4956JfPlBvghsBF+KHVxZ2G6GOlDmyyyBVjtrgKuxFqmKtfg9HEmHHIE7JNGJdjS1cjlImZDPge1TFyFI7j1wm/MSQYvoaxiQqJzJB4dexu9WfYPhTzLckxV+h91wWw8WgcU/SVJ8SKAvr2H1ququkSmMVG7aWvmt1cHbQKCGOJrhhVsnVuT2VnFy6g6Z6GQhgFWQZTEpm+A2fR2C0fGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAjrHrthD+d9yJ/h9IUzA7T7e0l7hItFjuvkQ29tYwc=;
 b=yg6T9R7lehkgaxdR7xr0tl9AsFIW4uhOfqVrbPzTs7iIo7AB/MGtuKymL+Gc1tQLj1kLWtHbDe3c3DTvUqv8GgZz+fGySvxaKgYAGgQLKTBeJt5K7FKQMOZrxhdkFkBEnTiorjKIgQj1WDJTK+FMXelsTBYcq+9DWcdT4QJUAafv1FDypTi7KeDekxbhkk+JPLlg75T5jPL4VG5ADBueLBEhS46OciQV/2vukJtkpkorIg8EWZzSeEFFrXHXb9Mr752DfiQcY1y07bMfwlda2duyo9sKhm5z2M8uoqxEtI1AXplvwy96Jw9AUsi2b4UJ7j6Vu3xJLfudSM2O32GROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAjrHrthD+d9yJ/h9IUzA7T7e0l7hItFjuvkQ29tYwc=;
 b=laZQhrPk3snxHU06dThGckRIw6z7cv5V8dc8QCs8ZnUj82FNHEiyji3EOeU5MH7e2mAuZyKXCL9KIVaBi8eJbCJmw6wOgU+Gkc4GijWaDq35zdbEnQUYHHMSSn6Vby3PFFCl/eMxm5XhoSYBSURhhKQnpa7L+VWnGx93hk4ieCHp6KMLQxgW3rh+UnrBE/UtpBiUnHjrSwnueRasdwyfkVtdOQ8rpzjxEmmQQqR4N6F5yvOD0HuE4b/qsaxy5JJ4hPj1oghm6EXTdBWsCZX1Aw3p1v74+6ECpNoD649YNyuTpImVfKc5+MnRyTzq+wPlW/yNanSI1LdY280Yo2tzPA==
Received: from MN2PR11CA0001.namprd11.prod.outlook.com (2603:10b6:208:23b::6)
 by DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 10:20:55 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::cc) by MN2PR11CA0001.outlook.office365.com
 (2603:10b6:208:23b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 10:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 10:20:55 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 18 Sep
 2025 03:20:40 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 03:20:39 -0700
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 18 Sep 2025 03:20:35 -0700
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
Subject: [PATCH 2/4] dt-bindings: sound: Update ADMAIF bindings for tegra264
Date: Thu, 18 Sep 2025 15:50:07 +0530
Message-ID: <20250918102009.1519588-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918102009.1519588-1-sheetal@nvidia.com>
References: <20250918102009.1519588-1-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DS7PR12MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0c1a00-0925-463b-f1d9-08ddf69d0d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iSXeq6z4pAJcZVipxZ5ib9UZGQ2PSeWT2iR6Ob27QwAunuVXVXe5MrBi67DP?=
 =?us-ascii?Q?AubbNq63on/aq1yi6MCSUCoBwY1OO5ltva3kfwvq6Y2ccHbUq0c36y2mtPWT?=
 =?us-ascii?Q?UAz6PoEVweWO+UVPuNQvNgPGkxTEqAf1dfbJimHx1N/Fzvm3qIwgQjcCHJEL?=
 =?us-ascii?Q?PnXnc/dltQriv4WJlo6qNA1KMZClEih6ct8xKnmK1fLu6t+dOVw5Tr8hb9Np?=
 =?us-ascii?Q?b7OewlHD2bH3HlnF2LFwxJtohNjquzDHxTQSl8Ejmkk5m8aoTgypTD/rJ6L5?=
 =?us-ascii?Q?OP88nHiP9uHBoC2f10FTf50nQy5wWliAxcF5GEHVIgvw4iNh52iqH4l2XYRe?=
 =?us-ascii?Q?AuCPBvmYR4WVghNFRx2xpB1rTH3FbKLz3FHjfMsaRdUT/ajlzo2TVg+FQAIq?=
 =?us-ascii?Q?56KxcR5+q05bxPhe4ykBMxeyE303YB882WCjUXJ5YgvKezSgDhha5UMMh24k?=
 =?us-ascii?Q?pP8uu1BPdRPNPSgWYRRZ623Y+FJoL/kzeyH3IX45BtMR0WY1OeIqxebNEZwQ?=
 =?us-ascii?Q?H2G/Zb/KilFgDQImIPzv7Nurgo3DDL87TvVYpTE4UZSfNwJeWyeI7XucNKKp?=
 =?us-ascii?Q?+lR3k2LUABmM72W2dWipzVOqxyjsHS4dGRgWajq86wrFK/PFwYK0bNk8XLZp?=
 =?us-ascii?Q?ZhFwSO77EHfJTVLhKIE+KynLmiYn8Xnn1auF0+h2KQR4umbi+U63uJncIK9l?=
 =?us-ascii?Q?J01FnAkYr7CKawgjc6wecTD4AIwdCnuYGDyH6oQg8UshngdkMsGVtDgYQLK8?=
 =?us-ascii?Q?cWnl+062QEEHe5GTFhOof0bxAsa5SlhoQ+f3xCDuIaB/j4wkAgPaeIApaDOd?=
 =?us-ascii?Q?GouAo1izw5W+W+LiMiKqikd0hyklwqAUOv6Claur1wwzPiEQVCp04+j1ciYu?=
 =?us-ascii?Q?oDJD1sJngQSmlcrOEjH+jUBxC7l/iA4SEkaC9vO4TRDuJLDtrx/ZV9GXK42q?=
 =?us-ascii?Q?q7FgCWUT0i64QDwppMuS2HbfFnvA9oHVLn/ojYlAY8VjsCnoK7gxT31DvbWj?=
 =?us-ascii?Q?7cJB944ulE5fuO5WGaWhsfTNzhor3xbfGb41QDL+M4PwdasWH9BAp9/PSI/W?=
 =?us-ascii?Q?4YIebTKjWPl4E8WkBfmHmWOKcpExBST0H8Lx83naDarA1iwZDc89rINV3w9f?=
 =?us-ascii?Q?CJyi67ymrYRv2aVLxnlmyH7x0B8QkYlvDYdyhL++5V/1wuVHxubtfnB84zn1?=
 =?us-ascii?Q?/gY+479cKMmmXcAAlRSQJI5fmFCFgdRmZll3JkwPtC/c0Bc6LQgu1zpgaaVZ?=
 =?us-ascii?Q?D1JjVoL5HFC0HTQ7Zleo1dFUolSSzy6NXp4pBjpuESU9XQuYNRfCb/doSpvn?=
 =?us-ascii?Q?ta+XTohqegQBj142SPisamSKQUIEjmt7AvKZmAwspL+K4GO4eiUwmzI8NJJw?=
 =?us-ascii?Q?/N80NMD7ZmC+KzMt8tO39NXJcf1WfNkWDIDRarwd1nUUpTd1KAmBQXX5lx46?=
 =?us-ascii?Q?RgWbandIFsKbyCs8Tsch5Rt/fzHG4JC38luW7ocp9wgyT2dwYL3c8UmVHyQ5?=
 =?us-ascii?Q?XczMXwNpo9kZS5oFiPzzE2zUUfZ5Y1yr3BiY?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:20:55.0928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0c1a00-0925-463b-f1d9-08ddf69d0d78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_032103_767543_7CA10925 
X-CRM114-Status: UNSURE (   8.09  )
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

Update the ADMAIF bindings as tegra264 supports 64 channels, which includes
32 RX and 32 TX channels.

Signed-off-by: sheetal <sheetal@nvidia.com>
---
 .../sound/nvidia,tegra210-admaif.yaml         | 49 +++++++++++++------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index b32f33214ba6..f53ecef379b3 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -93,20 +93,41 @@ then:
     iommus: false
 
 else:
-  properties:
-    dmas:
-      description:
-        DMA channel specifiers, equally divided for Tx and Rx.
-      minItems: 1
-      maxItems: 40
-    dma-names:
-      items:
-        pattern: "^[rt]x(1[0-9]|[1-9]|20)$"
-      description:
-        Should be "rx1", "rx2" ... "rx20" for DMA Rx channel
-        Should be "tx1", "tx2" ... "tx20" for DMA Tx channel
-      minItems: 1
-      maxItems: 40
+  if:
+    properties:
+      compatible:
+        contains:
+          const: nvidia,tegra264-admaif
+  then:
+    properties:
+      dmas:
+        description:
+          DMA channel specifiers, equally divided for Tx and Rx.
+        minItems: 1
+        maxItems: 64
+      dma-names:
+        items:
+          pattern: "^[rt]x(3[0-2]|[1-2][0-9]|[1-9])$"
+        description:
+          Should be "rx1", "rx2" ... "rx32" for DMA Rx channel
+          Should be "tx1", "tx2" ... "tx32" for DMA Tx channel
+        minItems: 1
+        maxItems: 64
+  else:
+    properties:
+      dmas:
+        description:
+          DMA channel specifiers, equally divided for Tx and Rx.
+        minItems: 1
+        maxItems: 40
+      dma-names:
+        items:
+          pattern: "^[rt]x(1[0-9]|[1-9]|20)$"
+        description:
+          Should be "rx1", "rx2" ... "rx20" for DMA Rx channel
+          Should be "tx1", "tx2" ... "tx20" for DMA Tx channel
+        minItems: 1
+        maxItems: 40
 
 required:
   - compatible
-- 
2.34.1


