Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQftZt+v3sQ5XblbEila8btNC4ScPcFZn/SZpkuj1iY=; b=XPs4GMBvb2bMcrBXF1cu7V8lXH
	OoAQZzkxmpVmT+A9UGe0yyKMvOksXqQ+U6c5azRyM8awdgVLSGQ/nKUiwDs9vjK8NTU7s87eA/Gxb
	wIkuZ7fbbRfjwLK9QrpxeF/nazn8KoZvEQf7sXGm1v7D8aJVSDMxe9Sjy//WfIY2d8TnNZkOFtIEW
	+KV6XwgzKJqWd832MNv2qr6asEM9g3VXJCCbSwKfdeJ1uVHjxNh49B2MGG+fZmM2hQ08ecAdgA5En
	AjhdUdyr/u5ov9dZq3Zs37S8ZLrUmESWewxGmwhN3eJwSkh7BLOvrhx9bAG5iAEeJotI9vLwmSw4e
	CCiFY8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu8w-00000003QC9-1nvT;
	Thu, 09 Jul 2026 19:10:42 +0000
Received: from mail-eastus2azon11011000.outbound.protection.outlook.com ([52.101.57.0] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu8u-00000003QAF-16ZK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmPbgSVE32zytyEE5XFk8Qw0ivUHVv5lkCYiolzqgyLQfrFS9Pw3QIP2oMSQ6aiRDN11Q6QXycqQQFhDTD/EleC0jGJgB1q5tu2H7n2HWHeQEa+oknawBAKTgvFeJkfx87cukj7A7jGQqvDVCGTo1PHlr28MoMi9+lsdNmq5RZEJeIaCJvXlZoVQp8TKP0cfLVHubdrXeI11P47+9KeIzzmSOmic0aadA2iraU05ibJQXGYtrV1lynrJSHAfNThs0IBwYkjGD4J+ZFV81uPP+WsF0flnynrvL7KNzGsQNft4+uViLkWYNu9O2zU/IBK810j9uibFFdkbElnDd1JHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQftZt+v3sQ5XblbEila8btNC4ScPcFZn/SZpkuj1iY=;
 b=ejnOtvC4tIMkAjGqH3RFhUVnnIo3d65wHOwZM8Pn4qs2kRZjeH6NN/sdE81iG7TyrAkZcqKqMoQKVVbezuF9RDiDCenzGf3sddKZq1DFWfW/3CTKvHKZAxW5tEEHsE3cL7lt7ASGTWr6HEm/B9U4oamoIWO/luklplTo0Kz+spUNdFHwfZCqtcu3l9YR0i/7xiKYzkcJZVDfg9f0ZnULnZ+F/6HADKwxf/+VH82l9lr8vojXgwhjebBVpAAgGcDHh1w41+gGRxgWxrynUpPEyzy7R3eNgqIk5jlj4N6aXZH/NAq35WkPf2tc3EyYr/HkmhnGkTcHtk6fkgJPUD1KzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQftZt+v3sQ5XblbEila8btNC4ScPcFZn/SZpkuj1iY=;
 b=XvaYT33djWZlNRlNODenIUowJMNaR+E5ccD2+xo/MIo7vGLcIytja+3j3QhYIXl9YAz74u8kET1gth97/ySdwnfRZHJev8StxOV0rS3aGn1jirv3JKLzj8gpHcpZg3kAT7lJ+98BcpAbmqxQvBPoxTvo2+DCmZerN8aWl4BYAlfs8kkWCEB7rsQU0a6H/LrdrvccYUJQRkj0lxab3bjR755aCY0XfOMGMwgDOGyon94NYF3PiyN04IGTa+mimXJW9bDiQKwpVMbBrmuN+idaAZ6UuU/Xiko+es5HuAFMyy4T/o/4Qap5Zr8j1DLIA/49lcqMMdSky50JgRorxEQnbQ==
Received: from PH8PR21CA0001.namprd21.prod.outlook.com (2603:10b6:510:2ce::25)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 19:10:31 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::8a) by PH8PR21CA0001.outlook.office365.com
 (2603:10b6:510:2ce::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.5 via Frontend Transport; Thu, 9
 Jul 2026 19:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 19:10:31 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 9 Jul
 2026 12:10:07 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 9 Jul 2026 12:10:07 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 12:10:06 -0700
Date: Thu, 9 Jul 2026 12:10:05 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, "Pranjal
 Shrivastava" <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 5/8] iommu/arm-smmu-v3: Precompute the invalidation
 commands
Message-ID: <ak/yDcoX5R7uWjrH@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <5-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <ak1iOWrvLv/6ACsP@Asurada-Nvidia>
 <20260709120744.GF422027@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260709120744.GF422027@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 405a7290-5f3c-4895-815c-08deddedbf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: KEn7TTBQjBfNlQAmSlIJpm4wqVg43Ak97Z+pH0UWtGzumc6wTBIb+VU0BG/d1H+Jpoc0eY24p1ko7/Hv7QBWkubQbi81gtOufabll2Ct9AHjnFJlhwnH+1dLC0HOXeyDa5R4yUccpfDoBpq0sxZxJzBl4itiX1tSHtremHsoOvsr972dC9/z5RVZSQMG5UikveUYdPtJ47fdDge04kFXj7XLKBmGuOsuFu5sfBDNkGL4RHfxKAl93FvL7yDxX0VI16LvQtIJn1QwECDoPwBGIySUbiZjc3jwDkE87lYHGcXv1wFCvAFdtz/mUCJPzTEyuLBYB51X78/Lns/ZmneHpOidmYORudBlV4OEC/bgVCXTGAZqJVZ8T7pem6v469AYGO4iE9zI65hlFsbFtkmLbjm9jUPT38V20E8Rgl6Y3hhDws+k7UFx25/HpLO+l8mJW8FvsvBwcyE0629OUb2zxto9lz7JfbVOPO51h+qcGIn+Excev4vz2kBOJZti0BuBOOITd4hmC3aikqek0mDjktCKJmDNbXp1tdlY2NQAIuKAEqVvd1JoH1IKTFpdKphLte4w8hfYHUW1wzzhVxBnGSqDwd8uclSqW6SWn2KjMNvk3IrIm499l5iZRNejeOTXpxY4EeAJlnXHx8YJL97e0dZnFR8OQyFuJh3UiSQT6rLsJRoP8ED+1ZsJ/ugZXsatwJPX5Z1LSNP5IltBj714dA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /m/IlXKDkESwzLoreDvmLMiFehGmoW6DNGeaxftjpLTuEC3sQk9+mbmMDmKk4Jnuy5EYf0VkBjChg0kfSDpb7SzoEM/pTwk4scDA7RvIW/+Z5BRzFJHHI5q1YKdZVIm7OwNljCtDBNkJg6z5dn4lF7DIW3UyYiMuy+XeKmMNzBuqMQwe9x6FNmFVk78oOj98pT/NfbWDjAn/KGlumEfbBJSK5M/CEBbwCM3ex5ceqFYmv0kO2+Flc9JU/+6keiHFWg8a9oflpT7QRCgF+8vPAbRLIkrXD4b2arK4cS/QPSnsb94P7TJottRCwFPoIiHfzc7Mbkr9g3hyFkaJfVRA6euF1N5S1BBvONdWeBPrSO2hfS5nUXVHkpaZamU7EYstXdlHWU9/7pSVJRnVx84BsMIuYZJusV7oVK5zxKxn9rzxauq0FV2Ph7UdILBskoea
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 19:10:31.2945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 405a7290-5f3c-4895-815c-08deddedbf02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_121040_309573_A1B456F2 
X-CRM114-Status: GOOD (  10.04  )
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

On Thu, Jul 09, 2026 at 09:07:44AM -0300, Jason Gunthorpe wrote:
> I'm not keen on gotos outside error unwind, but how about
> 
> +       tlbi->range.data1 =
> +               FIELD_PREP(CMDQ_TLBI_1_LEAF, !tlbi->table_levels_bitmap) |
> +               FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) | (cur_tg << tg_lg2);
> +
>         /*
>          * SMMUv3 H.a Section 4.4.1.1: TG!=0, NUM==0, SCALE==0, TTL==0 is
>          * Reserved and causes CERROR_ILL. Single page uses NUM=0, SCALE=0 with
> @@ -2472,11 +2476,7 @@ static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
>                 if (WARN_ON(!ttl))
>                         ttl = 3;
>                 tlbi->range.data0 = 0;
> -               tlbi->range.data1 = FIELD_PREP(CMDQ_TLBI_1_LEAF,
> -                                              !tlbi->table_levels_bitmap) |
> -                                   FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
> -                                   FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
> -                                   (cur_tg << tg_lg2);
> +               tlbi->range.data1 |= FIELD_PREP(CMDQ_TLBI_1_TTL, ttl);
>                 return;
>         }
>  
> @@ -2513,11 +2513,7 @@ static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
>                 FIELD_PREP(CMDQ_TLBI_0_NUM,
>                            DIV_ROUND_UP_ULL(num_tg, 1ULL << scale) - 1) |
>                 FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
> -       tlbi->range.data1 =
> -               FIELD_PREP(CMDQ_TLBI_1_LEAF, !tlbi->table_levels_bitmap) |
> -               FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
> -               FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
> -               (cur_tg << tg_lg2);
> +       tlbi->range.data1 |= FIELD_PREP(CMDQ_TLBI_1_TTL, ttl);
>  }
> 
> Which removes most of the duplication

Yea, that looks very clean.

Nicolin

