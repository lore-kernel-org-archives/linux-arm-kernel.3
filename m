Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4EBCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RacppeYCgeq3f1KkQtct10fppYkjQXDlUYfhvjTHDBM=; b=nGbGR5p21Rxt55Bv+EWa3LmGKd
	NEr3JIi8HtmsMETRx90FMZKEDQFP28WD+lk6QFug+P8b2eSTB7oDeAg79yNfMb2H1niv79QZG5BTn
	ZrWlLl3xW65+edC+oXL0CxzQkRScxcuPhz8PwmNypb5p9WxNIUPsBHuXyPnTVZiiYzM5/mEIY6Nov
	ipvKmLfbJBBQMK8r92imIBdqerMHrWwqyriN5HOOVZv0iAtTukG3Kw2ZkgsrP2S57YnJAcrbyqbUQ
	BjEuereDCYd99n6HBXcipqFLU02C8S6kWW0VIfFTyLe1hZUUB8dKnjP+OM323O7necwn7LFMoRwMB
	q1sNW3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsfh-00000008SGB-2wpr;
	Fri, 15 May 2026 13:33:45 +0000
Received: from mail-southcentralusazon11013015.outbound.protection.outlook.com ([40.93.196.15] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsfe-00000008SFU-3azH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGjspElMEWhasil5JDQIawt1LdHPaNw+P9aaEmuFrcac48CjmMxpvSIEJi7tayi/a+pnG15Tfot75p8315Uj731iyv0uV8VsWvlZHhI3Mt3UIJ+TXUJV3AW7dR+ue5FeE736vFuGS/GqtkUMwAnL4+d259LBQTTczDPmXj2XuqrP0pfeFEUI0h0Hl2Q1j/AS4/phGmFivtybk9JZ7xkx9Tsq5goRGXiZM0X0I0M2djHcLrBiDOSeJrHivG/L+I21bhAGrFKvu2Dff71FFUfkEnsEr3RV7xyyyoqKtPveKo6vfdt8WxN/Lt8SrR2qoFVJlx9girGFGKJxERezGYdyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RacppeYCgeq3f1KkQtct10fppYkjQXDlUYfhvjTHDBM=;
 b=dbk/G4Tmf3wPJfueJrrycplT39l4VgYWkoxmzdBffOIKRTFN5+utslbHK+sD+SSCc0+pcajjhal3lF9WU/zmExYe72CHV0lILpFyZx5H9IaZ5oHJCHt1oGQ753DvrMXOyS7e6fnWi7P4xEmo+sNTXzD2LRyYZG8u84rVSKraFoZtA/yO+oUL4LuMvAZ7efxvc0lstKI2zRqHqNz/5Y1m/ms8BzWbp7RDLBZs8qNkYfEWFE/RnIr1rv0HdrdxIrcgbE2LdtrUUznPkBiRlHOKLoKcu35se/5JYfdzFQulGlhCD1ET2LUmdRGpbj+Z0TrB4X43kaAX0DFHvEQYmagdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RacppeYCgeq3f1KkQtct10fppYkjQXDlUYfhvjTHDBM=;
 b=K5BBJVRXTbZUvQZvJdb6qyzuVdaJAeSdos/f9fJX9+rsUMY9FkOxKXEO9um8AxxuDqlPSbYdMhuQJvSgNM3UkPlWY/uFeo1o9KgawzacPULmO00vweTdZaPGV9oew7w2+Pj/vfgmONxer17DlBZNTp93oZ2KZpP3psUc0LPWjb4=
Received: from MN2PR06CA0005.namprd06.prod.outlook.com (2603:10b6:208:23d::10)
 by LV0PR10MB997588.namprd10.prod.outlook.com (2603:10b6:408:33f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 15 May
 2026 13:33:37 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::ab) by MN2PR06CA0005.outlook.office365.com
 (2603:10b6:208:23d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 13:33:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:33:36 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 08:33:36 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 08:33:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 08:33:35 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FDXZqx3973738;
	Fri, 15 May 2026 08:33:35 -0500
Date: Fri, 15 May 2026 08:33:35 -0500
From: Nishanth Menon <nm@ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4: Add GPU node
Message-ID: <20260515133335.6k3fptntggpnr2xu@numbing>
References: <20260506-j784s4_gpu_node_upstream-v2-1-23d6a2565ac0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260506-j784s4_gpu_node_upstream-v2-1-23d6a2565ac0@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|LV0PR10MB997588:EE_
X-MS-Office365-Filtering-Correlation-Id: f12d0370-e1fd-432b-a48a-08deb2869158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: BhzgHcpwzTifKC7pQspfZ0IfY2vdB8o+9xeL2U6j2/IO5w7KWXTezd9VnQUn/VXrW0USLrK28PqI3EQwD1Z5IzpAadgWF9sluzUZdBwWXht6fCeI7D5NCynBvR7zfj5Rp1eQ20MGJhIqhDip1t97kfvd1xjfWtpsaZFmBhyJGCC62IHrsBvaF+Wqy2/zCNVDN3fIBu5xcrWFotKRdgfbq9wfombvdeIaiE32BEi/kxDcSkGrH7pnyRX3oPk4/5SJH9A9c9sD2YCjtiviNy8SnCpcEgagcpTcbONPTXT8h3iWbouDpAYl2cFvDFN6iYxrOVrSByXskHY79fky8HyUzREDMW2Xr75ad5gpdo27bGofsnI+SUbYmMN3wSVClbCy90L6RFr36iUc/hh9QArJdeEzoljyel4dlGQ0YznKcDbTH+d+KlC7bsfUwaqh0ovAXXyRX7kUFwNPeB4IfdHzdZudjVAYpKbLbUPpH6CPzHIpY+WavENhLuRlwpBX1VYresMgJOkzdBIi6TIH4y1fjIxMqoZ+DPSC+VfhAts35YF4aZ2yHIdfaPsH2eMVaSukgUgG+hArTIstinsGBDQVFeFQSWkQuT1Q/5Mzc1jFkmC8wLBisOPR8t2XPtkpxuF7tPS4k58u6mowKpVgC20D9ai+cnJADfu/QF6SgfrVVwhiloxQZC+L/f5uL28Ltvm+vmupcLR7Pb178L77gxQ0wyuj838ByuqLTYIhuL8PIWI=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wyics0sq+omgUoWoZT+207vlit6FrUZPNBg3gF0YSAZKiAk4Zj3uagaN42qp+unSPM4P1utfPYM9ZvoU8h9LZyXVXxxCXeXmjZt16AKVC70nmBaY5i59WPYMWGvSaqlccta60Ktm9PNBHUZwBOFAr+P9JhC4dNK/mGljM8J5oTNFOw7m7auAVx+AGrB36S/ALCMWNfLfT9+So+bevIwaPGsiA7xAANouQHMphfj2Jb2LayTr/HTlNLtFWYWpiIM7Uwdm4cdVig88N0iM3FaOdo9Uvncl3ryUAQD5UBZy9zMD1HPhBMdoBxYk2pBvOfbklsMsL+LNZDLFv07kOpIKmSuK6NNuFL+yvsWneGuf/uRlLS2tVcqCt6EeNlQkyfLMjNpN8ur2lmphcu960brb7NZO22X5pOaQOold7aUEDbZky8xQXf+stfrUZz9ZoH7v
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:33:36.5849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12d0370-e1fd-432b-a48a-08deb2869158
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_063343_113704_099C5670 
X-CRM114-Status: GOOD (  12.34  )
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

On 15:18-20260506, Antonios Christidis wrote:
> Add the Series BXS GPU node for j784s4 device tree.
> 

Adding documentation why j721s2 compatible is correct for j784s4 is
needed.

[...]
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> index 78fcd0c40abc..ddb9385cd942 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -137,6 +137,20 @@ serdes2: serdes@5020000 {
>  		};
>  	};
>  
> +	gpu: gpu@4e20000000 {


https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

"Nodes on any bus, thus using unit addresses for children, shall be
ordered by unit address in ascending order. Alternatively for some
subarchitectures, nodes of the same type can be grouped together,
e.g. all I2C controllers one after another even if this breaks unit
address ordering."

Any specific reason to keep this patch ordering?

> +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";

^^ j721s2-gpu: please clarify in commit message.

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

