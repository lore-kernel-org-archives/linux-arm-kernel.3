Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5346DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFW53CjZNduCy0Q+hc3yAmFJBHYv3Pp7ej1eBLfdZoE=; b=O+tNxzEjiXmYlFhb1xHUG8dLvq
	iX/8/fpCtEmxyBSomvtg9VV6cynLaOT6WsM1SBXDyJB0s+zssijM1JnDTMefDkZ0Kmwgj9mhMqu6h
	NkrGRTXAQYlBI+JC1xqriN1yb/n9MiEXNcUw1DNkdh7HiUmLvJSZHcQUQei+pUH8PqDl3sDqXuD99
	h2XKDS4vCkLTYu/snBPQjbUwC+lCMamgZhEuDk0YQZB2ZjyBfMYt5l1ViobF8VIXQvWtRwoPX1p7D
	OOmUxWh6gUIZ6GDIKGqvRRDFX5Ky6fq2XFIR1hMKQpm43G2Q6ZXpMLoiSKmNke9jblrHT2ozjy1d1
	TfaY7MXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOgG-000000074sp-2uwp;
	Fri, 08 May 2026 17:08:05 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOgD-000000074rs-3K4F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGlltZ1QUKoXB205WDhss/zwfR/K69ge4iDOnYuzqMw+EtV9AdF9J7yc6/022t5RHgdAon8V/1gmtbBM4bDxZZ0lk9cwe3qrgRwmsgh92kO3RuWQMX2nrYlCwLHAC5WhLOShZs7m4VHHVsdANSMplDkGJ7NEprhVu47l8ljpCk9osUbDnMAp1wRQOINPZ6egseZhweEuZ0kHoCmUB2r1uZ6I7RCBwHOtMNs1SkOAkuAmijoB7YjSeJGJiWGnMuV8w1EnoosIPiU85YmwyqtG9QDhmlewUX/rsgZKcD6qR2EMz+TNYkJ85ZHqvKE3gyjkba+6EgHF9dxW7ODcr0GbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFW53CjZNduCy0Q+hc3yAmFJBHYv3Pp7ej1eBLfdZoE=;
 b=SYZzq3MfF/wMLCyv20a6hLidIv8kX/zozH6o87e6bIWCanEd7INOeYpa00ROYdNokVP7xiDWuyIlH099smYK03LrIQ4erqFjTN1/1V17+jjjL5FnVOulO3Q+7iF1Cwzoe2tpkEck4uJegcBGD6wK7fWpfNwjkH/yTaW+NVVODVKu46dZdJTGVPEq/Cu0cEigUb2zq5HhquVIwEOiNb4IgJJhfV7SC7Tk2K0mgZMwkodiItbmYOej67pNtv/YdBp9+z2Tp4yV9ULuJTuD+MDeaj91U68Rw6oNExcm/tWt7zuUY77XNAS1VpokydWdAe7UcpwnR8E+45S4MFiOpQawow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=208suo.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFW53CjZNduCy0Q+hc3yAmFJBHYv3Pp7ej1eBLfdZoE=;
 b=We/QBqpImQ/j3CtvRJ1QGbrU+IDT8P82PL/YC730bM2dQRrRmRpbiO4JvoEbvHOWr2in6q2g6p+hf5efdsnMLHskc/X4shde6JWM1UIiICmV09V2jAN77k5WUNaIx4G9l7lWB/8ai303yFuXrNUePJwd6xH0wALWwM/7QOtYY7E=
Received: from DS7PR03CA0038.namprd03.prod.outlook.com (2603:10b6:5:3b5::13)
 by BN0PR10MB4966.namprd10.prod.outlook.com (2603:10b6:408:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 17:07:55 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::a1) by DS7PR03CA0038.outlook.office365.com
 (2603:10b6:5:3b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Fri,
 8 May 2026 17:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 17:07:54 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:07:51 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:07:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 12:07:51 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648H7p501807045;
	Fri, 8 May 2026 12:07:51 -0500
Date: Fri, 8 May 2026 12:07:51 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Santosh Shilimkar
	<ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jing Yangyang
	<jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, kernel test robot
	<lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>, David Yang
	<davidcomponentone@gmail.com>, Jing Yangyang <cgel.zte@gmail.com>, Ran Sun
	<sunran001@208suo.com>
Subject: Re: [PATCH] clk: keystone: sci-clk: fix application of sizeof to
 pointer
Message-ID: <20260508170751.3kfpuuoivad6lsjy@prominent>
References: <20260508152321.3683799-1-nm@ti.com>
 <003e3057-971b-4b6b-8645-787d76de2387@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <003e3057-971b-4b6b-8645-787d76de2387@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|BN0PR10MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: e96997db-7d90-4ff2-226d-08dead245849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|22122799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: K+6ne4Onn/p5p/EbPzNPW1u9N+GatI/+3TqCswmXgCdAO43AIuUL53vEmcJkWAWbADQd67EaZcb0Is9R/tjoFSdknpxwO1a8sQeM3nMqKLbCkHSfrhEz1V7xzRHJHFJTK99+K6HfEwEzcDMDtrrlDDzOXtuQWqCQJX5gi71fNTTd/ysu+koRuuhrPsDQ2wASfnKfhSai8x1Rwy/sZ8bSEdLMIfQg3Rueljne6ntb/HVFcBmtyfIUDCeeH2Mr5TfBx37NZNyaYiqtyFRFCq7qmjVRpL5hcOpwjhL8pEWgxcCnMjoxDYPgntetJn4I8cJKfgFuJPrUNuLDOfmep1wacE8SniCim3tZ7zTDJwbW1t1Bi07rFxp84yfm4CJQ0MiyfobEpXgr5JKKgc80Pfvb7CNScJgnteFg9R59ZliQs5i+NmW0T/BbbWEq3tkIbswIhzrnVLEM7zdYAempwyzmVa22AgJbSmQ2J3iE4ReocoK4BcMpNX0DfVKPcdZmVaLePXxGIMAP9AAc+kIde4I8pbtn2PZXfUvDTV2Znh8IIXKAFS4pB+0JAa9iVJIT2Xrv+vFiQ3UVWGR+Pxm8fXdm1Ao0xigkflJYT7FxPPIXb3ET6e0H4u4U96XmZU44or55sLGhfzIqaFOwglb531pEsFY8ohl1NkNEIX7/ERafgYUZgn066IEMwesf7nTDu5YO
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(22122799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8pTZfnICYAueE3+6n2j6MbsgYHHIbf/yCIHPRYOpI4UQ4uZLDBP6Xae7UMzcNKrAf7wXfV9FV1gHFVhSJeQNxLbhvwvlhccFVkpmO8LYRJGCwDSBbp28uFU6r5msnknrHCdmVCEIHQIHLUI8Gutp15tfktzOJ6mTcuYUFBAJZIADwvLa9Uze1U50BeVGsmvcFWre8wVnzq6/9Zn3Dx7OTJ7/w+8Mi3q4T439+OMzRbu/XDOvlsRbRtNLWWVGDh+uDcpDBYnYHN6hDs+d1KjnJvTI1yIbMZ5RWmC5y5Aa3/Px9li28l+wl50PVzTUt0B2PKM3uhC6C7baPcNc2Vp16w1rPKko0IpvlQcx7y8+7W8qFUoh7SW2v3XKXVoXqp49vrRb3SFWtOrZ6shPOc7svFVPxmt77bH0EjERzYtxWQSazYh39U4RhkoLGho3pMd0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:07:54.3771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e96997db-7d90-4ff2-226d-08dead245849
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_100801_841433_57595070 
X-CRM114-Status: GOOD (  12.26  )
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

On 11:59-20260508, Andrew Davis wrote:

[...]
> >   - Functionality: No impact (on Linux architectures), thus no Fixes/Stable tag.
> 
> Not sure what "on Linux architectures" means here, this should be true for any
> sane system, right? You are going from the sizeof(pointer-to-pointer) to the
> sizeof(pointer), both should be equal. This is just to be more technically

Yep (also why i put it in diffstat notes ;) ) - any sane system
(which is what we support in Linux ;) ) - though C standard does'nt
explicitly call that out from what I could gather, it is practically
what all systems tend to do. i had the extreme paranoia about this
and got claude[1] to check it out using clang.. Results match the
expectation.

> correct and silence a Coccinelle warning. Anyway,

Yep, That is all this is.. patches keep popping up every few years.

> 
> Reviewed-by: Andrew Davis <afd@ti.com>
> 

Thanks.
[1] https://gist.githubusercontent.com/nmenon/afa9ac915e189334f048c177f16fe54f/raw/ccd08843ff7193090f9fbdca3f5c76d0a4366c85/quick%2520check%2520with%2520clang

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

