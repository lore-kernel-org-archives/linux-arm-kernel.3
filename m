Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B8CD44C7D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHSRY75HCmzJLXl9dIwpQdUp8OP46fKJw8PQ/fEZ6JI=; b=pCa3WD8ukqnZoOOmUG5pFrrLjx
	pxqE76zzH1SUxMUKuqMKdsg4lFPQgWzi4s4RowEQZKJsDVfNiX34vmYP4T6m0wo8G0UCLzgkfII/g
	DnGcarscsUb29eYdMXi5x+lubCnWWOFmXFfsbeSdZOxL9u6gQi1BOmr149RPg4U++BPGBGTqsnxQb
	W9xHJ9H4yBPDRX+LUxskeowR6XyNlUQJR7tkVO4m67AItWMKZ+hoY5OMbrxSUMwH5LVJMiiKwubJs
	btyhb25c9Qm68IYjn3/djwwgf+ggqnnPyeQ12sPL39pUGDSlPIKQscxrI12wh04ZDUBEtSZ9AC5Ab
	hQuOSkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQA8-0000000CghJ-1BFv;
	Thu, 15 Jan 2026 16:25:32 +0000
Received: from mail-centralusazon11010021.outbound.protection.outlook.com ([52.101.61.21] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQA5-0000000Cgec-1Xnm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 16:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmykuiUIwO+xzzXKXpawkWQsJQ/bPksL+iZk2UxqmhtvG9SSUhXdqUTKytmoQAvhEzq/wjaL50lYjw9WWna2UknwP/DRmLkpxQcZ3G5gTCjzwgMuVn66J9ZqthwQ4A+ulCcT9CWpGzOWDCUjWb6gTmG0EPyEWh1jxXoQAS7aX+y3bi7kohxYy+2+ZnycJSWaE5W9rOui2QL1ATj39OoCyo9ZTJ70mg+4DE44ssJvUuLC5j5KKaTbcmPN64u7Yfx4RwBhmizZps+DS9bs8ruimtNvULR0l0bCyEEyfsTG2q+Imhgao1izyR9EdmZ4+z2oA5pNKZ7npC0tqTvTxDsVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHSRY75HCmzJLXl9dIwpQdUp8OP46fKJw8PQ/fEZ6JI=;
 b=Oyh9D5tq1Vao8IFxaNYHRStviY64+NRQhlkdeRXp9BI9UVsB26OO8s/8Z9LW03ocCDyxBk90RsBTt8wSIJ/xpMKUuDAfJ0WVL+RaaCMCBAZ8eV2+Ew2bPb/Ubqdh4aMWbYnA8oWp5u5Ca6Xhob7K2oK1uo5ygYJgK/ZOs1ekaSDCoBZzcOlQB3Qq0MXATqienQGullnatlTHp5aryR/NKxFMCwg9GamLP+jNYn0DaeOTtIVzi2r2QGbJotvUPYHd2Zfo/OdOBj43gAl3NbNLbqOZHTUw7bPh5ZRJQa1I/pNYaYF8lhgsdSNPIcjsIsv3tBXCG9g0XrlOlJIrOVDM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHSRY75HCmzJLXl9dIwpQdUp8OP46fKJw8PQ/fEZ6JI=;
 b=VKLs9XtBE0iCzYyv3ooUxtBd4JnuSGM3yCn1yxPGfPkv2YtgS0vErL55LvvJooUgMxQYHT+6IcUEJbKBuXPvixdYuOE8eLGHd6oUP5GIvg9dbfTs9jt0OTnpVHHZNhVWrJlMuOm4tN0CIfL02rT8YW9zE/x9k87ZR/juhBg0sMC6iiUyJ9LiBJm4Th89JoCCucbUMfKny4LQgoWbBnfo4+fhY4plromou3lASFY0qG685eVnYJN1Zlvh3b9jjZCN/obxWFnWEgtN/mGi+oZtfrPX7lXaKmU3ffUz5i8qpP41kRGqelGo/XDqehdRSaerCUAgJXirrVDL7A7UtFy46Q==
Received: from PH0PR07CA0079.namprd07.prod.outlook.com (2603:10b6:510:f::24)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 16:25:23 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::ff) by PH0PR07CA0079.outlook.office365.com
 (2603:10b6:510:f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 16:25:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 16:25:23 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 08:25:08 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 15 Jan 2026 08:25:07 -0800
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 08:25:06 -0800
Date: Thu, 15 Jan 2026 08:25:05 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aWkU4a1wj5jsWFev@Asurada-Nvidia>
References: <aV7OBrH-TDiGRblt@willie-the-truck>
 <20260108003646.GA537728@nvidia.com>
 <aWUY-f3kvM94z4qh@willie-the-truck>
 <20260112161010.GC812923@nvidia.com>
 <aWVETpwlx9Rhs8Kw@Asurada-Nvidia>
 <aWZfUNXEka3GBf9s@willie-the-truck>
 <20260113161253.GG812923@nvidia.com>
 <aWarF90zBqxD0Gef@Asurada-Nvidia>
 <20260113205112.GJ812923@nvidia.com>
 <20260115131151.GA1081267@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260115131151.GA1081267@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b7a9af-5daf-4aca-9f1c-08de5452af0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Q2CitK5fwNAoO5Z4NdE1waujxMFTSow4JLELa4CKQ5iWIJ0H/dC3HXDgFdV?=
 =?us-ascii?Q?P7/iRhJLKAUJ0emXD+ZNwaMZSre4yw7mSUKDSqbuJsEQZvW/R00tK8Rn5U3/?=
 =?us-ascii?Q?R8kG4kdTtR8ZusnQ4L9/o6FcYmN/L0f23pk0g2GbgvV3WEe1Np5uGvgFRG7Z?=
 =?us-ascii?Q?mmHrwR8KmftBG9ukuIapZ6RC371Rt7GHscIUFEMLdZEvsJtaeHykWC9Y0zrs?=
 =?us-ascii?Q?pwKP5hCRPC/gIbqluXx481vNjSXPUq+avnkVIn7kRv9y2rfqUoGivX8kZJnY?=
 =?us-ascii?Q?WntwWeCZZHD4IU9BezJ/Q00FvFarW6kCkB7Kk9Q+dqV8zPP4hh3egMGzQqwb?=
 =?us-ascii?Q?wy1rNwEPvyGEYWoSX6MGc+Bf4rrI8bHQ/yRKUjQsFaMbi9GGUdPMviiZmE7R?=
 =?us-ascii?Q?+C3ITSuZo1wE5GWrzRtlNeKQm5x1bc146lacxcTYFVB/VYB9K+rvUsmWWE2+?=
 =?us-ascii?Q?sDUoCDN8lvfdXFzlb7Hutpjup4ZdYc7Ra+IAOt2kgHP+jjQdL8/P1ZGIbZ/1?=
 =?us-ascii?Q?BJncJ/1/KdjcYfCLm/ZHK4mXFU+o1unqMqLpEku10ldBvTXFBeo1HNSJIJeF?=
 =?us-ascii?Q?n/7bD5lmUoJ3tBC8qRKmWBNH9hEb1P1zXXj2dY2ohmVyJ/msXVZ6u7zcbLlN?=
 =?us-ascii?Q?FQvsZfBZCXcC+PATMS5P/S7z9s0aofnBnKXPUcWAE+JAZ6uqD7hKxGy/zbkC?=
 =?us-ascii?Q?wOIOJvW2olKeGNvjqPYeCM/PamUVU9STtSTn5G9/GddLBtORElsyVjbB+8ir?=
 =?us-ascii?Q?Rv7/WVdoPJIsTnu4Bdef2n+7RQPKcYUKUoNMyRe3LRDYb81av3TBzREjlDys?=
 =?us-ascii?Q?C9Fzjpw2SjhnNDbJGKYqQVzLGRwFhAxWhKCa5f6QjAxMNqCdst79tZkWE6vA?=
 =?us-ascii?Q?cS02K9QLyphIUg+Em0YKLJ7xkQhec+UuWj2bcGYwcwYke2BzHq55SCGvPxjE?=
 =?us-ascii?Q?z5ev4pWDW95ZKEo/n2KorEbCWxraV6hbdsN5e6yjG9hd1CJYOJVm2PAB4QUa?=
 =?us-ascii?Q?HL3YlTktA9Zj1SzkruTyk9BYMBoxnek4NjdMN9lO2nt20iujz7bvZVHJ/Hkd?=
 =?us-ascii?Q?kxFQmksOOaAU3GLL6TH4CEiABcdGxJzNkwayX9l5+yq+kRpE0lN3EjGMAV9K?=
 =?us-ascii?Q?mfcmV8D7/qzLrGHQN/Xcw3bVMAkOwHrhWmUV3o5OZ/y8dqY8zS9UQCnwTb9S?=
 =?us-ascii?Q?c6CnF5qUKVTS8jaRyCOCrH2ap7kVm5VgcsAxHH7Saiyh6UP1SrijCDosrkb/?=
 =?us-ascii?Q?qoYxv/0wRLEuWn1Wa/CLA4a7OXztLYAKdurFprKZ8bQRFcyqMb+QbDd//sWv?=
 =?us-ascii?Q?g86VHxYCXK0pQPptNTG9Uh8FkG099feM2i1qh3R0xfLWS4J/De83l/0PG3Hb?=
 =?us-ascii?Q?uLyrpK2uAx0QXV9LcH9zXge+bxO5M9/UGbcAcEatlBN3Raq8W2FkCFjg2n1o?=
 =?us-ascii?Q?EyKbEfldub2If8UQx0yLIONowys0Ym1edCr5WNXaZYS6oxCte3rvKPH5tfB3?=
 =?us-ascii?Q?kjyyUkF6x6WyEcajjc46E4ac9/ccXUJzTJvMnII6ZzeUclKmSvGDotBqasz4?=
 =?us-ascii?Q?/X6vL0hlgvmTnHiRcDDwDyAkbGc3re+d52izJdaERmLfLym+NXF1a859wzuQ?=
 =?us-ascii?Q?NXWweu2wm0u8HnkVpYXHt8dhkcoN+pJeFFOOMeIaEQkpmtbOzfleKVMOCOos?=
 =?us-ascii?Q?K7+DcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:25:23.3028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b7a9af-5daf-4aca-9f1c-08de5452af0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_082529_632283_0506C3CE 
X-CRM114-Status: GOOD (  17.73  )
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

On Thu, Jan 15, 2026 at 09:11:51AM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 13, 2026 at 04:51:12PM -0400, Jason Gunthorpe wrote:
> > > -       safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
> > > +       if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
> > > +               safe_bits[1] |= cpu_to_le64(
> > > +                       FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS));
> > > --------------------------------------------------------------------------
> > > 
> > > @will, does this look good to you? I can send a v7 with this.
> > 
> > That is an easy way to address Will's observation, makes sense to me.
> 
> Ah, but it looks like it can generate an errant view of a EATS that is
> neither old or new. Ie value 3, reserved.
> 
> I think you should just check if old or new has EATS bit 1 set:
> 
> if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)) &&
>     !((cur[1] | target[1]) & cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS, 2))))
> 
> Which the current driver never does..

The EATS field is completely controlled by the driver. So, we are
safe for now, right?

Should we add this when the driver has the actual support for the
split stage thing?

Thanks
Nicolin

