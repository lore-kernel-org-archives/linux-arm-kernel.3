Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F4ACAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWGVPNfS9IMTd6xfqC4cyYiTStTlAu+Zk1w56inDiL0=; b=qBjOia+EKCbIeT0h0qAMj5dApr
	BR+v0il5Rtq7V3zm6IwyGt1nolB+TchOyL6pkX48kIuOsfrcrqsWEqM6YVPpMj42LDmddAQeMfPwC
	lmol7+p2JULcbEvgS9vv/PahMZq/GebG6PTgvS3ibtiP9oR8br+VQYrYtwbsXDt3N+LS9GtMuY3uT
	s26wGGfCzVv8eNn380ehLPebGy/QayIc62XcnpkaFBij9NdJFg15cxbN39qpCxr9FL7j60vKyd0gs
	cn8WnDOtCOHlakSIuqMeXnfEnc8QlWDZQZuIhK8m7SsJB0qyD7J58ZS25l0wJBWWGXcDX5OURxRoi
	ZjXetibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BeD-00000002GZT-1tBn;
	Mon, 29 Sep 2025 11:02:25 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BeA-00000002GXv-0kXW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:02:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHnSn0bpx2nJf4RPnzsLSywPNCfqThnJZjIsBheM/2QDbVK3fzDWPTa5/FJS4aKlOo9oz0B3bdRlcOC9GLk7ToLwA8uHyiSyYlfmlfgiaP8D20WYE0ihfICwV/iFb3oaPWuqAIhLhQDWdXNXwNfdCBYNFi28nx1U8uumwR2j6EHw0Nv4rTLhibJIBvPiTTZXcNGvGXdI/I+gLesqpBvR06aS1oGzxd6l9GKMk5+cj6QDgSRlP+CquErl2y6i/w2YMj8CwSJX37O7jqgebe3szm9Y7RcnL2jjO2Vhc3hyCRGt22YIAGYXYP6R0+WTuxrdvSquRIBlM+AteT0bg+VaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWGVPNfS9IMTd6xfqC4cyYiTStTlAu+Zk1w56inDiL0=;
 b=alSK5lv0SXz0+HMtCS9Q/6I7GPC7eo7J5wZ0fm9DX8S5Tb5ZdPGJq3vHxRPZzfyM9+Ct7ryhXkbcaiCS0kaYB9qpXVpJ3LdQipBE/lXn1Kv0XlhbE6kAksHfQPTjJSytp1vpYIN3JUHlS1iP0BycITLjj+MLjboVDgyTdpVGpnmR/p18JQAG3svo/ZLyfbc/3DvuuQOhhQvds9yG/FH03SeIZ2Q2eToHvNhDeNS+iBGX6QsIb2pJ4rpNzxLGumApIeULVQIJHPan+VKpvlOoJOuWrroEwb4Caf4csW+j/dYARUPW0tt1yb2EYkSL4H/RHsjTYgTx5OPgYwwBZRLA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWGVPNfS9IMTd6xfqC4cyYiTStTlAu+Zk1w56inDiL0=;
 b=OpLgZ2XsCq2CJDlLZTboZJrRXrhWwc/YmrAhSvCryzvVTcN1i1A49dZO7SIOQaO54NoHkFForiqe/YMqdoOvWmSZqnQ3tTfl7WpOYJj5LLGq/+7WH7wDs9zbpLixmb9oOe00kL0Ydsns0+YAMCvX3LShqmpMMlc+oA6DvR9aPVnwgNyi8OeMWjWbs1gshVNbwlxL6GKZBsfSWzDAjdjYCCEZ+ZyYrfIVnB4ET5Ly2sIqBS2QTxFtZouX8JJHteaa2X8BoyZfoHWOtKkumz7K/mS595RgMmG/CoMNQv5GwcURuLjoORLVuoJti0Z1ezfx6SD0pwWqr7vqFr/v9aarmQ==
Received: from DS7PR05CA0014.namprd05.prod.outlook.com (2603:10b6:5:3b9::19)
 by SJ5PPFCD5E2E1DE.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 29 Sep
 2025 11:02:13 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::97) by DS7PR05CA0014.outlook.office365.com
 (2603:10b6:5:3b9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.10 via Frontend Transport; Mon,
 29 Sep 2025 11:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 11:02:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 04:02:04 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 04:02:03 -0700
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 04:01:59 -0700
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
Subject: [PATCH V2 2/4] dt-bindings: sound: Update ADMAIF bindings for tegra264
Date: Mon, 29 Sep 2025 16:29:28 +0530
Message-ID: <20250929105930.1767294-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929105930.1767294-1-sheetal@nvidia.com>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SJ5PPFCD5E2E1DE:EE_
X-MS-Office365-Filtering-Correlation-Id: 427c25e7-1e05-4e5f-9675-08ddff47a51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JCdyiP9T+n/70U6MAwGbiKZvDG1hxZ5vxejGJtmDPVlMsfweEU5rusWwsIxq?=
 =?us-ascii?Q?/vuyKM9y/XpS6OWfuiP3/Za4geAZWThPLzIgcuEwy7wDMGXXkz70rh8vQjc7?=
 =?us-ascii?Q?skXKIb7c1pNRukN1+rtmZ4EsO4lqYRhGQn2DIBOacwioHoAopPEL/S8ss17a?=
 =?us-ascii?Q?QnT1LcvuMuseM2KDOzxPQRESo0KxJMqlgU7xo9FQIlnyrc5zXsw89oGd/9LH?=
 =?us-ascii?Q?eyI/bclgAw047xHTGcbzNdRmWI6cwT8rIGfzOpWMC7sMfRGBsZdeF0xPP+ZT?=
 =?us-ascii?Q?FCMxOFcFtXsEtPdnrXVX/7P2qabz/dSyFLFTVO3ce1QsItZXIQoe29GKOkms?=
 =?us-ascii?Q?ju+Wk03c/6jDbo/FsSD6pwO4HU8PhCAkgxpR30K81rNmgYxS1OUbolTAlBY4?=
 =?us-ascii?Q?tSx5wsg34neo6wIjUfentVM6HEsso4J9p/iO7CY/4RNqL/j8Ga8zUmtTtF6z?=
 =?us-ascii?Q?Uag7jcGWmqiXkCYlrQ4v5ngFGMiaIJPVkc0hpjLRcaAcpSN1Kp/zOeiPqh3i?=
 =?us-ascii?Q?FoLmLmt6NFwxNet7kDU6+p0uutsmn418Sf4iMLBjkCoCOS0opt4YlRWOhTHq?=
 =?us-ascii?Q?bdk8rfFn6IOmfXebYIIe5yTPfxNtTnnFlFsZwfWhmvqvEGqkquULW/nmJ8a1?=
 =?us-ascii?Q?Xy2hD6P3U/Fm7Ad6rCvnbP04cYGu4qjxl1Ow9LWZ1/va1Q0biC5xOlB+HkN9?=
 =?us-ascii?Q?b7AoVan5zBVIsq0qwqkMtyKsbkNqYhELdB3fx5Br4+ycZ7YMSgIOCs2iv34R?=
 =?us-ascii?Q?ciGNGz/8QwqVioiU3nAx252/Lx+zSYTgPC4mQy7Q0REjkEVgD03t/8WB4jjj?=
 =?us-ascii?Q?jSbVZIf7651URt1BYEuNA+9gOks2cOlrKmCCABqucjDAxt0n6m7BNEFGElcz?=
 =?us-ascii?Q?CGUg5fQ234MRbzri+6ec7NdGTUHHLKTdoLDUhyzZjlgSMGwwPytMan2Z/iCO?=
 =?us-ascii?Q?Ql++XfFS0pjCAyKW2esRNbJfb3JW7HtzkIe0FWJp2q0dLWxt4/09Ov7FhKmf?=
 =?us-ascii?Q?IbQA8vcpaPym9ZOMbbQcoilMaGhQ/aHZ73PWybEIMwm/4aye+Zs7ur88Exr2?=
 =?us-ascii?Q?MxV/NQIlsM87xKXIvYZY86xGZtgTBIffY9hKM2gov/ILZgPJWBwjdo1Lc/OL?=
 =?us-ascii?Q?rxsIZXzFgYVzisW8GQcmUgXQjC1hZkZIAGkefCZlkAbXLk+KKOvlKByX37eG?=
 =?us-ascii?Q?/2cchSvdGjHjaJgu5fsZnxGkJyPNWTfY9wVTV7pQ5WymXR8FMn9vO5LfuRDy?=
 =?us-ascii?Q?Hx6KD3duMGsxDV6TmXMypjvI3EA2u8jWOATrhIk03LccutIDrR6cz714Dabx?=
 =?us-ascii?Q?rmc+bb8zviE2eHXp2xjWzaQYTP2NBuZwn8qXdhf4FLhN/QIjXxBKFMQOBdRl?=
 =?us-ascii?Q?255O7iXAuzaNTKo0ZGtfqaU4PEsIkOo2Dfa/KRGy2OM1bEiEAe8dr12/r61V?=
 =?us-ascii?Q?mr0wCkevk6BaMjeXGCj3cS5RRmbBjN3TUENjvD9zl4ou/+MQ8GuFDvY1kw+5?=
 =?us-ascii?Q?/luyNVa4+LP+v1Ga2A3TO7AXNkNLpStAq7AJUnEXsD+w7R6et2EKtAlPc4V6?=
 =?us-ascii?Q?ED0aNJGtS5NvOcAc4Sk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 11:02:13.2828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 427c25e7-1e05-4e5f-9675-08ddff47a51a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCD5E2E1DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_040222_226085_AFAF5230 
X-CRM114-Status: UNSURE (   7.51  )
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
 .../sound/nvidia,tegra210-admaif.yaml         | 106 +++++++++++-------
 1 file changed, 66 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index b32f33214ba6..2ce4049f94ac 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -67,46 +67,72 @@ properties:
         $ref: audio-graph-port.yaml#
         unevaluatedProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: nvidia,tegra210-admaif
-
-then:
-  properties:
-    dmas:
-      description:
-        DMA channel specifiers, equally divided for Tx and Rx.
-      minItems: 1
-      maxItems: 20
-    dma-names:
-      items:
-        pattern: "^[rt]x(10|[1-9])$"
-      description:
-        Should be "rx1", "rx2" ... "rx10" for DMA Rx channel
-        Should be "tx1", "tx2" ... "tx10" for DMA Tx channel
-      minItems: 1
-      maxItems: 20
-    interconnects: false
-    interconnect-names: false
-    iommus: false
-
-else:
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-admaif
+    then:
+      properties:
+        dmas:
+          description:
+            DMA channel specifiers, equally divided for Tx and Rx.
+          minItems: 1
+          maxItems: 20
+        dma-names:
+          items:
+            pattern: "^[rt]x(10|[1-9])$"
+          description:
+            Should be "rx1", "rx2" ... "rx10" for DMA Rx channel
+            Should be "tx1", "tx2" ... "tx10" for DMA Tx channel
+          minItems: 1
+          maxItems: 20
+        interconnects: false
+        interconnect-names: false
+        iommus: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra186-admaif
+    then:
+      properties:
+        dmas:
+          description:
+            DMA channel specifiers, equally divided for Tx and Rx.
+          minItems: 1
+          maxItems: 40
+        dma-names:
+          items:
+            pattern: "^[rt]x(1[0-9]|[1-9]|20)$"
+          description:
+            Should be "rx1", "rx2" ... "rx20" for DMA Rx channel
+            Should be "tx1", "tx2" ... "tx20" for DMA Tx channel
+          minItems: 1
+          maxItems: 40
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra264-admaif
+    then:
+      properties:
+        dmas:
+          description:
+            DMA channel specifiers, equally divided for Tx and Rx.
+          minItems: 1
+          maxItems: 64
+        dma-names:
+          items:
+            pattern: "^[rt]x(3[0-2]|[1-2][0-9]|[1-9])$"
+          description:
+            Should be "rx1", "rx2" ... "rx32" for DMA Rx channel
+            Should be "tx1", "tx2" ... "tx32" for DMA Tx channel
+          minItems: 1
+          maxItems: 64
 
 required:
   - compatible
-- 
2.34.1


