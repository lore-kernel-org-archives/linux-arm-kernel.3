Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5178CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 05:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llgtxgTHE9TOzql9by189XrkhFTZZLPUvu0FB7ZL9nY=; b=j4Rwi7kO/NfC6Eda+KAlnr97mI
	gyH6WZ08e42hJNJtSXOwFljWagD+uqrsyme5uQJyhIXaoX6y4GN63c/iO3kxhPZ/YnsntUXrCguQe
	h8zQh/1F8yDhZmx/Xt8T+gtqDya7fNdmSq89MEzKpk9N9NeeoiC2iQEa/B93u7F3A5+OKXS+Yw/5G
	gpbkf7pp3YLr06Ja7t9JKOG2yAU4brMI0rHD9Z0h4pEkx1GlDzm047T3oX9OjXlDKLJz+QP5gd/3Q
	BXA62QbOOWBUkL1OCfbjueDJ7wlWTNuxT6lA/NAZhdf2/HCd31ue8RvoHUGbkB/M6qaGqEiqwoQe7
	xOVPLYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxlP-0000000Fs7u-1KCc;
	Thu, 21 Aug 2025 05:23:03 +0000
Received: from mail-bn8nam12on2061a.outbound.protection.outlook.com ([2a01:111:f403:2418::61a] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxZz-0000000FrHV-1YFK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 05:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0KYhNm9olSos02UmUCK6P1jRNJWH5qQis88SJ3myiaAXF1Eaow02JFb5I64aBp2gG25OL/U7aWerZzaM2JwHyshTIMspjTkT5s8olmrg91UbZU7+SMPEjJ9VfdJEHyN9J0A4RMKrOeSRksMtijXsEC2z0vGMoK+nw6c1vvMKJ2pKa8eTc3r1KWUKPqj8ogiDv6MibLAwcb7Lth0Mpw04+QgSX+PIve1MJYC1kPlg/OX5MEAql6xqd4HNokzvaDi4X6qnMaJSwSd5E3yWRxuobUnR/UPV+plZ8f9kKj5PhVceJMhdRm9OJGHoeb6wwT/AXyZyWkv6igRwWQBIHr8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llgtxgTHE9TOzql9by189XrkhFTZZLPUvu0FB7ZL9nY=;
 b=PgSNiOVk1RSg2CP036+/ofYiKsVCE10KGHpVs7ADAUajR3/KR21IDngMqOAoPY4WQH9J8xmBseiRwfltVNxN7ua/3CpJbiJItu4ht5O/GpVg1fEyJcsWF63jereFzwkXpBlddMdp+yjSBBeiBpfsij//St/a83C9Pa3sicCLvSa9Vl9D1G+lZj6ru0ZewI18E306Sscz10xrvxo8QOFT/hc8uv9lT2fiEpK+0XN2jhGPY24vdek+1zY7H5GNf9WtmF7kHmu8gQtG8XMzgrxidI/h2Y5y1X9MG3Gyf/ggCwoJyziT5r8Ny4U3fDoI+IeSr6b6fzBMWXNpgtfexqiSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llgtxgTHE9TOzql9by189XrkhFTZZLPUvu0FB7ZL9nY=;
 b=MJ4l6ZGbeZikTxI8JyIo3D7RswXt3i3vwPG8IySjbULlH51u/ufxH0I6REKefrJuOJXAZmakObRR9fpWBGGIIJDflrnR+uX4PE0PBJoRIDrWhJsWS+O57Volk3yxd93u+OKTN78d6aQwvW/+wVWLDUWbpFKFhlqIj964A+xWKb/Abf9ZvQQ4np+kOt9lVG+ML6THaov77epHcuq8MynC4A9FEV9IPfcSu6pq5FiJsujUOmfoteM+Yo9OCaxWKjgl4Z0UNh9k/higAMaR/yCkSl6o0ljSb2XZrI4QePaBI0GCz5Y+XdqJ9vJIlRjn+AdqxAldLiG1ppczC+uShugO6A==
Received: from CH0PR04CA0107.namprd04.prod.outlook.com (2603:10b6:610:75::22)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 05:11:10 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::82) by CH0PR04CA0107.outlook.office365.com
 (2603:10b6:610:75::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 05:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 05:11:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 20 Aug
 2025 22:10:51 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 20 Aug
 2025 22:10:50 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 20 Aug 2025 22:10:50 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
Date: Wed, 20 Aug 2025 22:10:46 -0700
Message-ID: <20250821051047.3638978-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821051047.3638978-1-donalds@nvidia.com>
References: <20250821051047.3638978-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ffe3ea-3fe4-4510-1f5f-08dde07123fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R8+fl0qekNuhvJRQrihlKrPcf+46n8fV/qklPEEn1C3GeYfi2ETsa7/E5AKJ?=
 =?us-ascii?Q?gHRLfZPjyC3dP9OMpVp9a7iwaBoOyBJGE4oXaP659jyATPcpTRIUgxND2FOR?=
 =?us-ascii?Q?x2FJSkVFh1BA9dFo/H1wW53E2fvBy1SmfNnOZyKv/+Bajh8Qv0IcZGpFGN1D?=
 =?us-ascii?Q?uyUYu+MBOtZF6kIs0Atd8r7BlKDwa1VCes9VwWQ61Uo008P7sEj2PdPoD9yZ?=
 =?us-ascii?Q?B4HqDxzPlFo00NPMII2Sf9R3PEAZRutlu3NsaDe8LdtiM6tf/TW/FHDwnCk+?=
 =?us-ascii?Q?U+OHa9bbjFU4WoowvuFCKxNtfhN2MU7l9BvNqB2IKahhBjLUacl52JjHEOct?=
 =?us-ascii?Q?USTrvbTde6PgO6mKm1Zho7N5LOSWvlgpYEcaNmDqcmwNENPUXxNvDVAqs8PH?=
 =?us-ascii?Q?LbM9yaDOcksBGVLGW7D7+2tB7iNLzH01kc0WNwfDlP7widffvYiB1ffglfw9?=
 =?us-ascii?Q?BnyjETvWlfiQxuwXbck+kgdcBJpfImKoF24CLQmDAjigDZOXRWW+/JghWM7C?=
 =?us-ascii?Q?mAPdM5VEy/lPcKdqqMlfNdmOUVebKiFkubqP3PbQOE4D8r/sGP0IUWK3CkCI?=
 =?us-ascii?Q?QvsuXs2LMIOhcHDfr9QIrGZlvBjJTLsBVE1KM3KBj1F/KbIXNRYE72D3deaJ?=
 =?us-ascii?Q?wwHgZfHKrFwMYdipN5NBPfHu/45btm6qX2QeP/CgpuITwYoJ+dajC87AyQkS?=
 =?us-ascii?Q?2ndQbHN3jvEjIBSMTSYszzaXS0GR3j5SM8kpB+19l60KbUm3fNZsN/CdCWdF?=
 =?us-ascii?Q?W7KHdROmim+miylrzQXsiUSbI/4Tz7c8YFGBDz3BafbHl9yuWbJIzPrIDYlQ?=
 =?us-ascii?Q?kn/JLelnA9b3NDi5eybRC75HtLhMHekulYAiFU1JXkRKKdc0LVx+ut33dJJF?=
 =?us-ascii?Q?uziQwFQXyIjEG4zB8M0qdw0FUSOqrzurYgsbnnZrQ6y1V6OuRpEJsf0aFM2y?=
 =?us-ascii?Q?mEHeF2cGTphfg8pRy3iIjiv7FEsCBbQgLMt8+AosgSSgf2la4IFUg2yrCDcm?=
 =?us-ascii?Q?CSijhqzAozYE/Sxh8pVcxe47tjjGDV8r4yGIhb9mG14iB4b16LaNxw4OPZUK?=
 =?us-ascii?Q?qSh9v2u2IQ6lefuIQHzS2tgrUjm2S1rvcLFQKHQEgZRqp5YAKmpJ/6v08lIo?=
 =?us-ascii?Q?bDWxeL2pMnLgZRjGo1CTXHI2yM7MqTQcrYhupyxB/k6ujFA2Ej/7yPrvFPx0?=
 =?us-ascii?Q?Ufs89mkBofoIiCOQJd8T2GUQUbwcRSvq7Cp9emkrNen4FcY3AlVszkeKmZCh?=
 =?us-ascii?Q?E3Dp8XZbZKBDIoqF57M9zbYNoys6JNJHEQWmhnYFqMyW+ciHQUyKQLr1Sz4n?=
 =?us-ascii?Q?Ugg6yuohvMse0EEvJYUWQgVyVEpW3uuSwI+oBjlrgkxO8Xz6+j9RLILH5RYf?=
 =?us-ascii?Q?Xcn+Txx6w1HAfMFpPsz1qv7S5Ky+igPZ4O6W5XTaO28HTjtpRs2Fzef7gk2G?=
 =?us-ascii?Q?Sjr3JvT2ws1c2MGlvdAwme2c/UZSpxIcldpGsLPTHkl+qECwOeITuQVyYIBy?=
 =?us-ascii?Q?k9nn/FiVMv4ArhbCb9k7Np8Nm+CC4090B9vd?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 05:11:09.4822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ffe3ea-3fe4-4510-1f5f-08dde07123fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_221115_412681_A609821B 
X-CRM114-Status: UNSURE (   8.20  )
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

This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
platform.

Reference to Ast2600 SOC [1].
Reference to DC-SCM Spec [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]

Signed-off-by: Donald Shannon <donalds@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57..11e17e9ef15f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -103,6 +103,7 @@ properties:
               - inventec,transformer-bmc
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
+              - nvidia,vr144nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


