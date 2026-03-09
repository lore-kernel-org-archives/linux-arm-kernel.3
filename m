Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C071EF417E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXRb6qnnbK2YAws8SbzPGnxRQqqbu4D3zdPBAsYT5YQ=; b=p7MFzYhMCdcg1JdhZR8x0q833J
	xT6Dbwq7RUxOcgyOxwx1mMxZ6T8izfyhEPopUqjWsMyArloeZ6+UKfo1L2LWTotXqXpkxvs7gXa4Y
	neCqsWvXiOop/R08cYlYRuCRFnOc0Z/weT+XgxSApqx5D6XWbsf03Jtp46XyVC940eDpHoDHxEZ+i
	YhEoAaI+2QKwtALyTK6LVoYkZ1li5azUhRYz4qdNZw0LZpGRdS5dO434wvffh8kkmBrUXMhf274Du
	+2UgVRSBX8lNBLfCu03wqHuwE+gtN0TT19iKkZxr3kTZzYmT7al43sCDvGB7r+eV5lB+n86A0wwGB
	UlEXI4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbl3-00000007UPx-3ufR;
	Mon, 09 Mar 2026 14:38:57 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbl0-00000007UPY-1n9Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:38:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2RiNV8eYvQpcERjL57AE7yuMgHZ3rgIhc2XN/khLQyd1Nbncq//uv2dgxf5st2q9xeTswWI3xlkanvKPxGSnUjfKEXFnA2PQgkRRs7yjQdGZ5N0dv37J5PCn0IyGDDIC/GKpsc9Xj9SB4DXjyCM0W1/5GZhg/d5NqWy84i/k7//Ouw1p4SG8yDHXirSAYeG1mKoKZ2qRULzpZSuQAi+muSA9MaRJXEduA+eTZN01XZ+ouCicZVEP7Fq8ImWzB+A0boCKHjEDwuYXnTG9YvC25xtXBdpA+pnnt2cMsLeyPcCcbu1MpJKHvgVI3jg6mFYF4nTlTB62ie5NFF5cS++JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXRb6qnnbK2YAws8SbzPGnxRQqqbu4D3zdPBAsYT5YQ=;
 b=KImcgrquOpb8n0VmP/FqFmC5pkTBcApwMPapYTsjegL0X3PHhErf8utJWzrS1WOE+CKqxQftpZrUlb//h1Sm/LrQh32c96OymB5UtiwujatS33/i+ZD3qNcQxLDXXxgqnJaft4E/j6zSyw9sq5jJ+bJzMoOixcvnFcN3nQUEYeiFG1xnGjaqoCJzAFT7Qu3QYweLsoIEixbYNrjzFw46E23dhcNSvLRptGP7/+2uBHubdpf3bMkTYaQBZQKXQ8Mw1nl2Sgt5Fmfl95Z17t6clxSczSzEUWFnXhXYYc4huP3RPC18ACaO/IT1AYniXQfzGEIkL8ZinVygShOUHIXhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXRb6qnnbK2YAws8SbzPGnxRQqqbu4D3zdPBAsYT5YQ=;
 b=fbnxyjGDEFCWuJ9pzgPp6JQPtXAPHeqnLpVP882jO2PFXj+14lOIEDda3x7UpdAXr08YtoQVKT71JRT8k1hPtmuaxdqjlRZLHt6gQEstZSxH4J/S6LOtkvTejJUABskvaLyhdhxB2ru7eHkgMbWGjiw/z4lK+ZkyEYspDeGgacE=
Received: from CH2PR18CA0054.namprd18.prod.outlook.com (2603:10b6:610:55::34)
 by MN0PR10MB5912.namprd10.prod.outlook.com (2603:10b6:208:3cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 14:38:48 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::16) by CH2PR18CA0054.outlook.office365.com
 (2603:10b6:610:55::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 14:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:38:47 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:38:47 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:38:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 09:38:46 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629EckdG1279381;
	Mon, 9 Mar 2026 09:38:46 -0500
Date: Mon, 9 Mar 2026 09:38:46 -0500
From: Bryan Brattlof <bb@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jm@ti.com>, <afd@ti.com>,
	<stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment
 from M19 to N22
Message-ID: <20260309143846.qfnwbonqrnimk6gy@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260309045539.2070793-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260309045539.2070793-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|MN0PR10MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a21cc9-7949-4c1e-d847-08de7de992be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 3PtlTPkr9MSImYQQS8QUTvroMfgAaowWMkCEO7UVKrJWYpGMw0shTgAO4rV1DaWhvf7M7Kgi5J/6FkfGq7hyus7341M9cenQcjMSQeEOEl3AnvmWGcHcnlo7GZYqFN3x+3EBh89auNaufBE4bWr3p6ME7DyJGLyucD310IIMYdSoBkalwGuJkkxUZlxaBfUl73IhJdRbPg/JatBRHCsxxhpW0f8tybtG9gUzwtTVLzSEXVp+frZoW8USRZf9YN717Ad50qSrlqPCBltfokmSRswKs1Rvw5evNrIQ57PmlfVnHDbadea4iapjiP5Y8hmwb6Tfii8V7Y7UI+Oif08ooCYCon0eSrzQp9+06oLvRE5YB0mkl9lxd/2sSixeTdXnGFQWs5qejJvOYS2jZs02d3QdCCDiIj0p1Utxny940q90nBfnkDMeC/RmoMqs7BznhNGpIIlFdvfwoITprwABxS+Fl0DFMmyK8brylpdbhOokxwyDPPRexmb54Y8JR19BoMDNL4TlF/Wu67d0hE6vmROlhT+zm8C669X0AVE2ih2SY+QaWqSQbYNU1y0lbjAl/1WidhjZ9gsBxCKGTGaluacRv2SEz8pOZqRVeifNCObAmOwosDRtHxIwNK/CIRskqzULEa/s+XM9bYO6KEignS+Kv94jXYIFSOM2362VhbNSmcPFW4RMHPc4h1qvk/ZgHDaUBr3xdwTnJZ2HcnEwyoQxBuYLxchLfwz0UdIXlOh+GLflrewYkscGIuuQuELpYjQBUbrt9jNkPlxIif5EXg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VGizo+lDWebipdSF7lPBrcT4Eaqn/XcvkxK6FbmY/dcges7mCZPzJ+upF7fgP21fYk4gFSZxRJZkkersZc6oDgI8054I19cTgvEDUGBuU38LzUQ84UIOG+hVHurPoYEGS2e8oBjmxbGtp1bwpaKz0abVwxBK+hyKU6tUCWAzID+D3ORpyjgD0JZO/4vQv2C2D9CExCX2R7vOpVfQ7qP4n5aEPqJUzU23N9SZdL/MdJp4Fj1y3iodtAORxvKYCSPfsUsczBKt2MvSEjDmZ6GEkUjRff/zJIuwgNDt4XPSX0j0ZQtaB3tiznlPjsqieyuPGkHTzOsdmrYN5dEw1QJ9ne879va3f+blX7iuCi1KQ01u1O0cGzFZRGjceLqLs3I3wQwrsgQIeOILitnlGAkBNzlnGYnaKGN4ajXGFNZDniXHbqo96lmC0SH6q7xThQU1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:38:47.5150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a21cc9-7949-4c1e-d847-08de7de992be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_073854_524054_750A0D6B 
X-CRM114-Status: UNSURE (   7.98  )
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

On March  9, 2026 thus sayeth Siddharth Vadapalli:
> The pin for GPMC0_CLK.GPIO0_31 at address 0x000F407C is N22 and not M19.
> Hence, fix the pin name in the comment to avoid confusion.
> 
> Fixes: 8f023012eb4a ("arm64: dts: ti: k3-am62a: Enable UHS mode support for SD cards")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---

Nice

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

