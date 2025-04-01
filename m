Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39CDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0z1e4bKkjbmgZ2+b73Zlr9txkiHuSWu2ExAR75lcFMc=; b=bFBUrh1TUpKY/0OGI3ARg1ZYr/
	alKfg0c4YwjiUeaW/I8/bOq+fxHPBH2vyIJa+02JUTTxVlF4211r8QUpL7crM90YkjPHNLuH8FeXO
	IdXv/v74uYPMva65tmGtwr5otvKOIFAAjyKMlCA+MxgbKeQNSqTrZd31Ie+zyuHg0uSLfiFzmRl6y
	0QN8zAsTjejMlerzsotd46HG02tLeQJCp1YOiuDjLJC6MKQhhunzmJtG/LsWtqv4EQi1DkWY6VoUs
	0TOURfppdwbvGbxC8bAZ1qlgBYhV1q8Vn9rVHSL+PQwgMKgTrdgKI8wq8WLzQAAmCkB07shlu/c9N
	0rIBO+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdmb-00000003kgF-2nsc;
	Tue, 01 Apr 2025 15:44:09 +0000
Received: from mail-bn7nam10on2060c.outbound.protection.outlook.com ([2a01:111:f403:2009::60c] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdjB-00000003k2k-3IU4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjOg9AetcYUZWnw9/N2E7HQ4dhAwFgJJ85j5/FVPOH3bJf6zFaFZUENkJmj6MEFcg9wUipa+VhKK7Peg+WDWUJVCrz6DhqgHDEnNkiSJqOXf8J58MixW+E5QaWW5scNl/jZmC3XOPih8/0QHSXco4rr/H1Ly75gnrU1tLiuy6fIbClNHJZLQWE0Nqy4vmqLHgRHKwAODdyu6jZX57ipnJSu6eltm/Brg+saoqviQzskoyotxIn2hvf5jmHic217hHeOVB9m8c8EyNPQ4iuXaZe1Kc5XRD4b3IUv2ADPmt8PGlYC/H1ldvpw8ylosrjzZ/MA7bZF6ZPLF39p92LDdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z1e4bKkjbmgZ2+b73Zlr9txkiHuSWu2ExAR75lcFMc=;
 b=rKfdwnodPcH4YSexVX5WiS2PIaayFX0/IaDz9iD3vAlUVOEqs0Ppb9fIO4CO4enmFFdMJjperfS1WkTKiE+hD51mzpVSkO8hgBi1gV/lq5LhV5PBTR7usf3hAmAy3YO8HT29/CUK9qXsaj+OgUevD35I4guyuJAoUKKJGhN5hqSTAlJtLxYa0zXwqd/C+GWcdvlqQslBgkNF6qlqhpYN0RJ6OD0pJgOPlejEqgMNKQAKRIj6k9CgQCcqYcT6oqF2tpb27vNPiVNndFOXgZBW916NRBqhX6y+NCLOit0FhslQPUqG9s8qXyY53gVjURojbzazW+lpPD5YH5t/D6T7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z1e4bKkjbmgZ2+b73Zlr9txkiHuSWu2ExAR75lcFMc=;
 b=EAJ934thJb5WiygG804JHyxP9Enk/tuBV3fmYHOM6QNilsUhtGzTBa63RvhXCjYZpI3dK0RICtZ1c8NidhGXnKI7tP0W5BO7u9v5V0dYy0ECqYlg+KZA7kCOT2TjBEc+J3yHffMEEJJ090vJr47rurWkHJ5Zm549O52wE0GEAiROBJCeOcoDsfUGiVKp9BrHCX9th9zB5OsULSbuJTlyNXQpTygd1DhDCgQV8PdPz3oG4t88KH5Gyx9VD8t5aJt1U8SrsAplflOVqg6Bxv9QJOBmyxmW4O5YXIt2dI4TAGHPX/+h5twQ3VfFUopoe3haNfZu0DBStg7jrqM89U+yqg==
Received: from MW4PR04CA0380.namprd04.prod.outlook.com (2603:10b6:303:81::25)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 15:40:29 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::6a) by MW4PR04CA0380.outlook.office365.com
 (2603:10b6:303:81::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 15:40:28 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Apr 2025
 08:40:07 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 1 Apr
 2025 08:40:07 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 1 Apr 2025 08:40:06 -0700
From: Willie Thai <wthai@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
CC: <wthai@nvidia.com>, <leohu@nvidia.com>, <tingkaic@nvidia.com>,
	<dkodihalli@nvidia.com>, Mars Yang <maryang@nvidia.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL BMC
Date: Tue, 1 Apr 2025 15:39:54 +0000
Message-ID: <20250401153955.314860-2-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401153955.314860-1-wthai@nvidia.com>
References: <20250401153955.314860-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: e251f71e-41e8-44dc-da84-08dd713387b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Ac1nzmI3DS8eL292+sIhQW5nKooGZT4iUHxL5ssI+LMhRBuKcmTEu6nBvpi?=
 =?us-ascii?Q?dJI3pWy78tb1qc2gmGL59BTZRmqarTC9X0tHPFBE8Hdjg4PPBOjQrGU/rza2?=
 =?us-ascii?Q?emQsWAUnLujywxAG9T+08qkvi1vJpuir4N8++3YdQf7ldaKyCjxz9UCIDAJ7?=
 =?us-ascii?Q?uTzAaEXU5G4WvtFeB3H+rkZmGYVjFcT2/AuSO2uxCAOwfbP9ouvXzr2SBZUd?=
 =?us-ascii?Q?zBSetrg2RW3yjRrkaz3xafPOQ8YHCaMv3B89cGfKA+boltDxWUihmgs2gX0/?=
 =?us-ascii?Q?L8txw+6Lg/tOxi/1f61Z58ThkPhPUV6PuZq3WSuM31U25nh4VGTgSADaFzSC?=
 =?us-ascii?Q?n7fvZjRJXHnBos1DJEkK07lMHRomSaYnzy9ZEZ5XngaHLrb+Oumf+aCaK8s0?=
 =?us-ascii?Q?yGETb35zkLjBr41ost9eRBozyLYFLAgsxY+zGfgCA3z6Fph/htZe2FzzVZv4?=
 =?us-ascii?Q?5UK7lzMjtcD2948IB/GBFTCp3p3tXMNbmeUIoHt0dhWWNkaMIz/eLjSmdbiF?=
 =?us-ascii?Q?UX2SpyxxVsvFKlmSomEb077GubSrFlmzPhGXr3QCkDr5BC1KsSs/n459/i6K?=
 =?us-ascii?Q?tTLNMNZcp6ZoqiIoBMSZQvc8KLIu+qJFWc/KRdmLW0FIgnqcdA92LWkr/9ym?=
 =?us-ascii?Q?SgtOhDh1DXlKvXeBQ0/3Pm41BZLzDSlFB2k0ksxBMs4112Frk6CjzKhXi4wY?=
 =?us-ascii?Q?4MCkZ0+xaHpWA9bo2h28wXzKEAgYcUinQMfSIrYeDoTIh/OeudsFS3d12/Pc?=
 =?us-ascii?Q?+beZF3IwIGE66lcVUvCw1Hg+r3Vx7ThA5SSRa4Ro5P0TdhEWcbB7MYnfjmkx?=
 =?us-ascii?Q?VYgVlb2W8q3R25e2yhvm2h9efspcwLB+RNNsKGuF+gj5kHXO5t8enliQiiip?=
 =?us-ascii?Q?FxC2b1NcwPpILa34+hiUThWrBbkDRasmpxL+8ureUUUveUxeYm5wLBGFgMXs?=
 =?us-ascii?Q?E5foRh3uf4miCuAsMOY6gj6R8sTYPeyJaOeDVoaKeWZVdu8EnKYiTFZKwHw5?=
 =?us-ascii?Q?IdnYow1VS0NnLxiCF9eEWQdc20Q+GwBAhoaZPetw1J2WMZ2vkqdru5gK/mcN?=
 =?us-ascii?Q?dxmF+sgxepKGZ9WPf+pDFjMAt6ehXsSXKNnKuL1un7gYo9QGyAvAVQxP1vk3?=
 =?us-ascii?Q?J/pq3zeLyVxhM90CYNFy7JaWHJWmmCeHHR0ZHRlfoNePqUT/a0pW/65POTd6?=
 =?us-ascii?Q?wGHynVmBasnC3nud+ekTCZjMsx+YOibED6DvToZoK/pqu+ePoWTXaBEjTg85?=
 =?us-ascii?Q?Rf8eyfITfjpubR0qBFPLcChcMUBvUSaNTrLM1lv+I9+tWlaMFUN2ZCdbB6t1?=
 =?us-ascii?Q?++al/ub+cH78M1Z7owueb1CJaRgjINoeLLr8X6uCjKOAwqNlant7ULJddVwI?=
 =?us-ascii?Q?g4h6vPh0kia3ovq7AbDKEr/UtrKC/n9o62nwUWD2ClSdLaMCZ82t2FkJ3h/R?=
 =?us-ascii?Q?Lv96I3yv6Fla6TGQL6SOcmYGgyc3GVFgZtrEGotSi/yyD7N9qYvY4cbHwYwd?=
 =?us-ascii?Q?2zWiCwmrCQikgRaYhUIEmxefK1zbLUN6rawj?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:40:28.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e251f71e-41e8-44dc-da84-08dd713387b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084037_824444_3C3382D1 
X-CRM114-Status: UNSURE (   7.11  )
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

Add Nvidia's  GB200NVL BMC board compatible.

Co-developed-by: Mars Yang <maryang@nvidia.com>
Signed-off-by: Mars Yang <maryang@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a3736f134130 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.25.1


