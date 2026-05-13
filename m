Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89637CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIYzMd3/FU+p9LsoI3YtvX7YYOGhd11Gjr4AwPp6ujE=; b=oLfTHD9v3swmhlNo8Z3uRwlsIJ
	WcV8yzK4RxpPlUDPeSiQ/n1UNadtfu6OldTwV/Yt+P+tdkeEBxjdDMiklIY7ccWZ+8HTUhKhRiWAl
	9mgKUCl+R9sM02JLN2HLX4EouoI2A0hn2DZXok8ewr6ZLCob31fjbMCu7WvobfL1bT0WBsh9LQ1+s
	O/GjZAQiuBRn9ChrOoMsJavIqcwhoD5NqATSR1nfvbWpkEhS80QdvEDp1uNJjWKCGDF/8yFIHrhlw
	wDc3gKGtoXS2UoTu2So3qBa9SyDXsP35v5My0jFE4waTdpG/tIpdGRfLcKBmoou5tNGm2VQmUiKJC
	IbpNB61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ6W-000000043x8-3Y0Q;
	Wed, 13 May 2026 23:35:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ6V-000000043va-2Ys9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 23:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iIYzMd3/FU+p9LsoI3YtvX7YYOGhd11Gjr4AwPp6ujE=; b=RIJFSTU4+5W9X+Wl9D5ysvazvF
	lxj3d7OyGCVZc8NPpg8+oxauyAJs+s/yEir3gg5Y3gfHbXNq9sIxzMVMKqd5d0HoN8nbFJsCpA+Ie
	ibNudkolbWneKs67uOmpD7etTZ8bHQHHQJ+YE04RzW0L1nwBX6QOFZ09MHcdEMvRXu9l7n2nFq8+3
	qNx9edNuC2OSBvgsFpTb8I8YP+WBOl+OnvPnkGzh02KoTmr1Uwg14hgelHYjvTT4ATWg5nd7/XG7a
	JWDmbkG+079lH7mcEiP+xqzh8caC2sDLXTK1ik4UJRXwnewGJTus7ngKe3U2ZTH06bYJnR06Q1ZCd
	fNfNN0yQ==;
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ6Q-00000001l04-1AcF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAPsMVmBRaeoJx2xozZfo5hrZhbE450ROH3mhEXwPvWe9o23x7OLiVJ1SNcTdhCRG8fjnUhKIy/w2Epwd5shjEEZ1VFsx7zLXvM1BUV5PV+KFVUoDjVS6Wd9iRVFvoiqs64S7YpBztW8wTfS3hIAOaF/t8PmQuvmz94t6PaxIVBn7CVqgrOgPa/OByx+4w9/eCLMzlOBkELO1v1L53rscDOFLGk5JmQnzgo4f5Won+PRSQ37rri6yEUBu0igTfU00cgoIeNcVJyGfHuTExX6Rh8LT0zYkQU7IqRE73mUMStxjVIHezIgnyr45V3I8qhP/Wps75xlaWj1fObiQxcxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIYzMd3/FU+p9LsoI3YtvX7YYOGhd11Gjr4AwPp6ujE=;
 b=qo91m2ypdjv2V3Uyr+uWoOsWfmHHx8STSp1JbpgojrOSbosITjX8VYZk1Q8J2tA8IUfMDG/XuevJbFo4GOSD+tIxvJ3WdU7HTseOJEx7xyspjRtXkVW/x45Ln5SBs66SEifEItr1XAl+QAdaWBeCEQhS7789dY5NfLFilQ+roYl6kNBR2QMtiZpTgH/zQguEEevs01e+zy7aeHku71SGlsibbjoIaboqD1btpRfMnFLEk5ZbdqGJY7vgOUoKzv4pMutdBSdaxfq4PLAYk9acXz7GY3imIl5cWOeeIssHbeFMtg9d+JKm1ovR+AOpN30HfjET/u/tuBSkKxQoeqnSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIYzMd3/FU+p9LsoI3YtvX7YYOGhd11Gjr4AwPp6ujE=;
 b=UsXYg+omsVI8fM24b8ylpkrKz18TVykosmp8g6AhtOvaifbTnBTwhlpigBmFBopyZF09Vtxg91MQGSB0mIcCK7eFUoAab3qWETYziSwqhLde37uQD7LSqfk2kxqaq/8gMCU7fVks73Wv0Mr5aUQFNgZo17z8qv8ob+FA1MbKJ2c=
Received: from CH0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:610:cd::15)
 by DM3PPF2FC05F2F4.namprd10.prod.outlook.com (2603:10b6:f:fc00::c16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:34:52 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::54) by CH0PR03CA0100.outlook.office365.com
 (2603:10b6:610:cd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 23:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:34:51 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:48 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:34:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNYlSP499089;
	Wed, 13 May 2026 18:34:47 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Date: Wed, 13 May 2026 18:34:45 -0500
Message-ID: <20260513233447.2713737-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513233447.2713737-1-jm@ti.com>
References: <20260513233447.2713737-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM3PPF2FC05F2F4:EE_
X-MS-Office365-Filtering-Correlation-Id: a95e6a3f-f98c-4865-ac8e-08deb1483aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7AEJZFvMbjLkosXFw30AeUGrmh0LB8MnT0eF5U6+zR2RBRdTTDLxDqUta7k3FnbC0vDInz4QDL9GlxLdrHajW+Azu8pjsCqKxSdJkRMQbYuKHt4fbtpCBv+SzB1BXKgaTV2VUUrM4e6xcVat8f5vXabIe18MRAtLVWf3fOw8Wn5n3gQPdcqLRBmbE11Nxh4/0D92SloqPANIKH60HubDJDzFSy/QONYReBPaRT2SBigTAW4BCh+et20cBTZcXgPBs16gPkeAJQe1jEXdFDnrrLGVAEJYW9yStOfXNwslb6eYQLoNFKdzN4dpq2/ZNaPstr50/uh+umWzYYstkwauwN5cW62L5mDpxXBSK5iwJwi5ssnxnQ6FTC6UwZNYisI0xpcG7YC0NJ80ekMT5crPUdcsH9zpw3r2YMA5lltP0eGr/k6FFpyQJNLfo574Yc4AUuhG0O5Uh1zbEV0tI3Rb1xgd666BMjdgfKkCWo0mLnuxNCop27OVb0zywvLUwS2LRk7Pr4IlXUiRtcl2naXQNb/odVkl7yUGi3uoski+ufpV9ht1j9JX/0iQRTD9cKDmG3UYZ+YuZKX4Pn1DsWiWnTWU+KcWQ4HnN1mHYfnFG7F5cV4doIO1UZXNG8hkbr6k93coi2E8WIDnG+cDB09/1WhlM5LpQv9XNQnxkgfjwBA=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nCSEIOHXFTiezjf07pX8vVxWyeaW0suj6JnEaRnvQerfLtyUg3fUUxih9y2kgucZkmI5bWFkPi6RgBedq4BI9Fiwq9Il0h5S2MZjz0b5VJcQ/7nbOCJ7jmxPxaCyYF0L3S7Iw4EY8QD3YYuWNUj17WIPdW6sKZDWCzXA0yIxNfSMH2rUNn40lQVYPGv5JlUM4T6Ak50KQ4xDzrc2tiWn6w+kO98Exh40VC1zoRb766DIboHDgVrhAYHmYsa5AedHL5x2ciGGUISMXNwC78jPc1ruw4IIu8eooSt5KiSwbPU4ksz7fhN5t98c5u/UZBULkL2Fpx8AWHKewh5Tn3dJs2XOh2wmfk/Vm9K0LdTBnV2+OL+CDAUVafNL2YfbPyzpAHgxYDH0Bxr98pEDyv2QitgavRqG1egwU+0I1+QKTfiCSewNHebjKzWZJBCf6JKT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:34:51.1696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a95e6a3f-f98c-4865-ac8e-08deb1483aa2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2FC05F2F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_003458_710619_50CADD64 
X-CRM114-Status: UNSURE (   8.45  )
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

This board is based on ti,am62l3.

https://beagleboard.org
https://github.com/beagleboard/BeagleBadge
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog:
- no change
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23de..d9cd3fb712fdd 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-beaglebadge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.54.0


