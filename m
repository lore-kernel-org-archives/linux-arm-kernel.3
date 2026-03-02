Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ECDEB362A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XkV0bajXP+SYsl8v74dHGRyWGqSA+JU1ifYRvUXTeE=; b=wYum8WNME7IDI5KoRG1Wk1/18/
	/+if7p/mMeSI8VRBU6tckNXb7LnTmrjltz2UG36t9W1YiFcFHhlmRG/2HrG55jlWw/UIsz/t4Pn9D
	DVDAWsD2FTBLf1SozoILg9z5dJqn1RLGD15dEv+MjpF6CUOz9W8wc1qoA8Ivj4OgsFWPMFxwHFP9Y
	rJFPokYlyaQV16vyYhH9euAsFAdTbhrAeuvr8N56eINc5oCEOZhOzZQ8iQN08sqGDWzfwS015Kl35
	2B81qeLe56oaSEkH9HTvvz8VrKxM7cdgPPbZl4Y7eaeM1zgkvXDeWbdSBb4SeRB6ZI1yXZKSzye9N
	sJ1kbm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qa-0000000DfgG-25Pd;
	Mon, 02 Mar 2026 18:18:24 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qY-0000000DffU-1HLO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:18:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBJZ5aAB6X/m9lIBTn/iBIcDF4LBGl4a8JPXNO7wU3mlcoI3+3JBT9oZvmHmoCDZA0Qlb3bme105nkaYIVHonXB4ZlHMvgRGicAd6HZsWJ+s9ZlHUjEXbMWBL5OvQMDvgbuqp4FB5GtOAsmwV0WWRl/Fzc6gopgJCVeJmq8NPmX5YoKD8BWpT5jabmiRN2yo0jLrhwPZ9tqYL71XooQawldXNCv7OM+nyXiJr+SwX7chMa8+w+25RvbSEnrWL98YCANDVKO5CjnMa7/GXO/wX9f3EJ6VtkDxRBUIq6iY+ihn807w/Cmf93zU/UBbubYTU3kGLRb6vfV+LJoycDXj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XkV0bajXP+SYsl8v74dHGRyWGqSA+JU1ifYRvUXTeE=;
 b=RC1UFzUbRpzMJpHI2DAww653cAX/qe/5HEEzFNUSGnph/y8K9XvHU8Kq6dVjX/nj6/1/KDy+Emi6SvfnYZs35as4pLjq0zkAlwgH9ahYCPLxos5gS1NR3WrUmUR5BuGR/sLeWFkHvbkuw9J+CvM2WFMdkIkUK8UtjPu8LtC1Ky5ZVTfm3B4Uz9B4qHI//TVVQW1R18Dol/LowVesvc/sWWT9q6H3UeKb4YY3lczJziU+eLq5H4yat+pPi8oBZOqD8AMY5QryrInjAxE7yKRgt69Wca9RQgi2rvPNHCA3NcMdQiZHV/EfztsmdK9IMtLowanPi7dQbWrFVXjumkiXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XkV0bajXP+SYsl8v74dHGRyWGqSA+JU1ifYRvUXTeE=;
 b=o8Pkz638FPMb00Jp3Yw/yZrBVLdopi5Sx3bK+b0KqJ7LjEovChlrMZVNA42EecywGN4yYVUZZgNGQ49mWfFJo3luPJzQ4l7f+2o0awnz4my6DoX+YQPqW45MDnvtCadMW8GeehIbthMOVaaaKwM1ZRBTWV0q4MXX0f6LxRH0ZNc=
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by BY5PR10MB4241.namprd10.prod.outlook.com (2603:10b6:a03:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 18:18:15 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::fa) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 18:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 18:18:15 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:14 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 12:18:14 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622IIA701232767;
	Mon, 2 Mar 2026 12:18:14 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
Date: Mon, 2 Mar 2026 12:17:59 -0600
Message-ID: <20260302181800.445653-3-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302181800.445653-1-b-brnich@ti.com>
References: <20260302181800.445653-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|BY5PR10MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: 15094312-8038-4b82-1b4c-08de788812b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: Po8Cl0L9eoTTSxIR+OtXzHAzUtUzQQlp0FVtxj52rK20Ck+NAY0xXOPNpU2s01AbaldhZwPqUhdr7m0ubh2PlpvlHCqsCD2xKsQWngG4opLD5//H8yquFbUWeuDN89zupcoWf5J0/exJ4+jGCzTti0CNTBFBuuzvLIJdzU7kYwHYk3EHRy10RKmTk1WHXJE6p/y+2zWQQU0nFRsraHKnt92e9n+TqEpeh3qJGFFRsiCxXevJhYMCHOeDu5sSSuYD3GwKrBLw+rhAVjSqFXe7lD/kytl4mUDeD7HfnYSAMHOGkEp7MBo7q0W5Fj2zTIobKdm4Yr76UietRIPzgJo6GG4UQwZaRgyF2BKi+TosYL7vb/isxkbF9p5FvcW1BnzS9ZfccVHKiGXqpvl5wEosiedipCtmGVzFQZvDAtfRgBift79JE2EXEEj6HVyUskW6yVbpKLZ4/V3Fbh4MhvV7sAdxESoQJBnCLdhlQiRMvop+CVGWNjBv5zLGUZSr5LEmQBm41kW1c7H8+Pd/7IRRVWdKl6YOs89UYjH6p1a438ZxEuBTsVVpjagtFz12IzjuCzCi8r22HwVrQ9UxwQoANEWXHbdOxbz7A+OOIYR8N7Li46GKcXOn1ObArysohnKxyhiUgNrV5zya2drcQ9mMtAHXgfmRXIX+NBlUNI3eqMw7giQ7/Yt7AkNyBgPxZGrY1+7phkLGB6HYuNBq4JTPwO1+BnCk4uEjWamhUaW4dvzdneMmyHkCQF9sLun+Q9A3Y8GF9YxXLSfImv8FA0tk8YKfY8dynI3yCvIhIHrWXW99qVFF8ljI3gL/80SNz3EhAyU5GajpEVS9MO/WRUA7Eg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1ayjVDeEs8aTALIxzO9SDYNkgxFgM/6WST7VG3fZoJtQXcL1au3Pg816woyvmiHM81s7Hxq41WmVsT9KxN0fFQ/LoIhHfVPlc16Tfot+Anrt2lFLuX7akE8mVkNr1h/JzXDKkRKfMiq20p5vsei4pugGhfwc1HDR+abVGwRxM50BXBMm1+s5K0SkVfqbzmCwt71SVvptbzpDEVSKIwnnp1FnAg3jyYryP2JUkFUeDhiLIJJqqqC66xM+I1UI3oBK8QK4iNnr2yAE3ZLJJiXNo7J/7X4KLfiNR5x9L2tSYVhTULQ9cIZDgm9Y70dK5CxWS4ut+laCrHaYF9B0YdcFX5J561ssuIqlVgKvuvughJ3Ati11+JI8IYfZgxtGQ28ptjDl/3lCxTXoxLFOZaPMtvDaDOGAMcqyKy7jTc/K7xFiLXyVYbQSp0sqQIj/p8V2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:18:15.7030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15094312-8038-4b82-1b4c-08de788812b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_101822_347062_E2CC41B6 
X-CRM114-Status: UNSURE (   8.00  )
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

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e..92dd1b96cef4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -1149,6 +1149,7 @@ vpu: video-codec@30210000 {
 		reg = <0x00 0x30210000 0x00 0x10000>;
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&oc_sram>;
 	};
 
 	c7x_0: dsp@7e000000 {
-- 
2.43.0


