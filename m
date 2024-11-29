Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B46D729E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NntSOf22pUnkoQu/tPH8YaYQYYArWSMXIV2VgWQ1mHo=; b=TEhlmjphVcaY8dSplMJlAa6Vdd
	JUm7kfaVWkvBhK+D5L57e0n1WQNAWntlBjjnQfwrZC9KbsQPUfMjKOnRxncpRSkH9UNX+gQsrQJqR
	tZY0Oe5AIDARFCbWWMSpAJEGD+Xuzrnzz+JkQqiGP1yU7GgRj2bMcFwUYFuKqGlayZEbyK+JN4jQB
	AxQvvHcFy8OFIXsKukInjHxWfuFACpdJBFpam+1CEvixQisvczofvFVsXMJnlROUTZCHgnbgXlFqh
	gNqfA9TbIHM7sivljQpoxcVdHnfVnMq3nf6TjNwN+9tAinplM9DjXL2g67tzgByplu1BAoZRccIoH
	s7x7q+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH2ar-00000000PvX-1Hpv;
	Fri, 29 Nov 2024 15:07:41 +0000
Received: from mail-co1nam11on20604.outbound.protection.outlook.com ([2a01:111:f403:2416::604] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH2Zs-00000000Pjc-3QGc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 15:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUoqbO0MlNi+Sk17+Cc98EZcvAyw48k6tIlfqICuWw+y1siWB2tGtVpZqxeEE4jdpOwSVtZxrVOFGcXh5EnCUZ2lYwAACA1bS2mPdWYmgTAuHLPmJxcm32lAkAKW5GA4uIUc+IW6SkElFjP9zIbpOEvpIpybhqElKNukWpuy7HyQhOtkkLxLvAvTPQS3kTyaXLbp77RmJmDXMLHNZf0EEaGlO+2GqZmLBf45Cs9bXYbQPRU+RkEy8CXA7GluCsaw4Uwst2WyftrlUPshXN95WlVOaF0S1XI/AVdxxS+JjXBAI+MV32P1A3vkHMIe7Zmdyub4Mal92QUzofaM9oPVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NntSOf22pUnkoQu/tPH8YaYQYYArWSMXIV2VgWQ1mHo=;
 b=Cw1YNoMmQ+vRXrG5/TAWUZE7vo70mOzIxrtlNC58RfqAvpwFcaQAhMbTM+K25IUVHMDtNGpTHhk/ONiq+3k+Sqx0PRGuun0LR/zu30hUNUIVR6RVJCqIrbSqndAOGsguZ+Ne2uwGdtv2ENu6PIyHm4uNNURwzBtHSxX+5EVGekxfGtOSWQU/BQZvk6i7NKZk9Fz0wMMbzgT4kaa+742J9IaYCHrOLrY8qoZAHGMZ5AlU5ck6xLV42MYrNzbF6WhB22H/GzRSL+nf2HRRc84zDlbFrVdnGEmuahffOqUJ37gDXkSoFZQBaTaecqv3AEbfeML/45vBFsCkkgh/1Qd7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NntSOf22pUnkoQu/tPH8YaYQYYArWSMXIV2VgWQ1mHo=;
 b=LZArbEMX9y211vjMbGTTKq8gEBR0nJIzrHTGP+FQwgG72jnU+/7q++T4yugmwetwVYhVB81k4GVwipgnUKbCXqdrYWWbsMqYVS+F0zlzmR+iR0+lopM2dRGppN6p9p2epSigidECWwMrhHR0cgRDjXy3TwgqKk8sEgzlSvL2SOujufsD6R0BCcZwyDcRIG6THNaJqlsHeP6uNof8dXUcQCswL8ReAso+Kw5LFkwAWyyZcvJK0aUbN/9SplrIw+D3Gs56q2QAYV0BFsc236TFBgQ1mCh1IPMz9LBFj2n7VBJYEV+SMa/8Efw4MYMaq9MHV9+YyoiyJlxosrAAnbL1CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN6PR12MB8491.namprd12.prod.outlook.com (2603:10b6:208:46f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 15:06:30 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 15:06:29 +0000
Date: Fri, 29 Nov 2024 11:06:28 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Len Brown <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	"Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v4 08/12] iommu/arm-smmu-v3: Support IOMMU_VIOMMU_ALLOC
Message-ID: <20241129150628.GG1253388@nvidia.com>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <8-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <8128e648ad014485a7db9771a94194de@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8128e648ad014485a7db9771a94194de@huawei.com>
X-ClientProxiedBy: MN2PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:208:23a::35) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN6PR12MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: f70e9bda-e79f-43a2-fe8d-08dd10876706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r+/43IpVE9MPbWR1jehxSIh9+UEiN/8vFbGx8x30/ftud+NAaBvv1dUnqvZf?=
 =?us-ascii?Q?emszQ15Vw9wJH1wq+rr67Twr0+9Cc04PkHCcrt4bRUKqdNX72JXeusE3ikTH?=
 =?us-ascii?Q?r7lAYr0y8JdQBOKa7INRZNDVTqRho7DGJqhb0PBTuSRwvwyspQNwtKnnrz8f?=
 =?us-ascii?Q?GsB4LUYD5KWy4qDQm28ygsuZs3n3dF/ArXc+FeTmYjhdOkPRGkIQCByc+Flw?=
 =?us-ascii?Q?qzM6HgjC7OY0nBe8PZ3j8d3OBnbQc2zkiVEmrc4K31eYiRmXWy3vxFy5XY8z?=
 =?us-ascii?Q?Unk7kwfiLZsvcosEhTI2P43OWm7CgGwIuqUY1ijscaXmm+TWc9NmLNZbyVZO?=
 =?us-ascii?Q?7N8lYWXxW9o2oCIoDPtXWXQfU28BQNDpU7pRb8HKVNQoI+SKu5E9igofisqZ?=
 =?us-ascii?Q?5OwhALnDq1KsZjiS0D+kQaBjdeu/FCOneds+Epp4SFtz/STptlTkjsiSd6V+?=
 =?us-ascii?Q?vPngVmULrppW7lLM0Pk2ETvZB2pWpj/q0V6bGEha7pWntkxZbbeSkleltjYN?=
 =?us-ascii?Q?Ax8np/rz+Cb236CUpAw0AHqbp7aWdkNv9p67krbD8tLx3V4awIWuAEsaJz0j?=
 =?us-ascii?Q?ueRktzf0nl7R00vNqmGtS9+aKv9r1ByiQr+gyCpfA3XjVBnITqN1bNKhNZzx?=
 =?us-ascii?Q?KDEJA70+533Z4ZzNwr9ONF+gIZ0YQWu+oWutX7SET/0GXVKKAV36+ygElQdr?=
 =?us-ascii?Q?Q7jc4B8Mribqpzkh6sVxVo1Xuel/Bhm0ZhhAZwBz8N/a2HYHqCBgNmOGqx+g?=
 =?us-ascii?Q?qbVFwPyqe821u91zah/TaAgtDQ+zOe5QGRwP3/a1m+IMYPQowUD6hTMD0qfz?=
 =?us-ascii?Q?Sps7B9jGFwjF/AJeRWSN4/MDXp4FJLfihsLkOi/UdRdMs0Un2nj5eLw3MFa5?=
 =?us-ascii?Q?CFNurxWv4l/nnXlswQKoUqjGkIL2g7qenHhBup8Kff3UK52bh62dX8jHtsOS?=
 =?us-ascii?Q?dpqqx5LJH0FQAG/XCgkDzLaqtqZ0dgAF2KRJ9LEC/Ff18uIo6Upk5eXRTtLm?=
 =?us-ascii?Q?9e1C0+ZeKXZ1iGVWSsuWFgpQrMdQL6bkOXbfsYixy+jMUkpZ0uaq6WTd2zZM?=
 =?us-ascii?Q?J+NVRU2rB6bpujBhpXfEQ0/Djv03F0CVlB1Ri30BP4ioxQ0WH5y/GZjd3mUF?=
 =?us-ascii?Q?C+tTmTyRTj7mG3YuKYly7dDrjjxEDhSyr52MVY6mPFCJYGRkdxPDlCiS3feI?=
 =?us-ascii?Q?yZbahZzv9Ea5b6BclnvyXnzCyoL7cXx++k81ZpMk+dil+KVAOXogeJNFs0Fy?=
 =?us-ascii?Q?p6z6061LWlwg0CADBanbvmLGSI5WPwMfh9dLEvdsKGH8QATq3JRPLT8Ryfbr?=
 =?us-ascii?Q?4LuHOSLO0BL6os2DKCIieuo1M8u2Kgn52kvL1M7OSGpQWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LksTq4vBTLKuo070UIyAZciYPYiee3GleKY33uIJWEg+dayPVvJo03wvdCq5?=
 =?us-ascii?Q?T9rvALdQ67umj45ZhDmkuUlEksoiasnsUGk8/qJwtgkjCCdj8qasFkq6aVCT?=
 =?us-ascii?Q?mGbvb8UsBI8CSa1P7yf5w5zLoZofUkcS85td3h+DKiRwUrqCIHvYkKOCY490?=
 =?us-ascii?Q?QkHoqVEANVzZm2uRUig9kPVvu2hKD3rb/oN5IP1XVgT9eDlBAQfzKRriYEX2?=
 =?us-ascii?Q?6hYwmeF0NNFFwIlIQu/83TcQanTrw4YxVMOAldGLmhwwKxpFq/sg2NYYuY4f?=
 =?us-ascii?Q?/gIWW0dqtznmuyymc62NoREDi0/dFbudeq+Lc1pbNTg+F1roNoG7fsAC05mM?=
 =?us-ascii?Q?4cX7Z20Kzjkfn8pINw1qkhxK15qwhgfCCJwxGy6SQ2otTysg/tPkFtvg0jFi?=
 =?us-ascii?Q?QL37ykHSC6TGlelqzx4sQ37u3aJ/QCWaAMJalVYD7Tdo4yfmtXjR67RAwDuN?=
 =?us-ascii?Q?MSHcKpP/xUuPJtVSwMmi7048cti4cxRF9zsb/pdE75njEOA4eBVIQK43Gmdo?=
 =?us-ascii?Q?P3vMj576YL0NMYg/KhYurK499MfUyOhNTIxUufCEia4+iK/1+8bI8XVkj9Oq?=
 =?us-ascii?Q?PK20ZmD0RbK4zxvdGo41TvAvHS4LLyxL32QrmtSa6YEtsoJMVK+sx0MSd5/+?=
 =?us-ascii?Q?0d4EX6430Yc3UHq5wfcA68UvQO8NlSxCPXzvRhwzo4PhgoVmVn1dRVq0/A4H?=
 =?us-ascii?Q?fVD9axMWdK7/NvEnF1uco3KtLGTYhmfcFS+9XYRsc9YsSwxj5OLiNImpAeNQ?=
 =?us-ascii?Q?YyMYG3E/txo9nXgqlmIRpHcCHE3LJFByD14zgz4sOyIhlBJpGsDMiwUvkNmF?=
 =?us-ascii?Q?oqx7Kllc0AhYQ6DnPXjFTtIFEe6tPpVyWqqjj8KA5awsVP3qAAbzdz6QTUIc?=
 =?us-ascii?Q?FEUWcDBtSO5Fj8+iuCKjNx/yqJ8KIqewY4+XUFJNwhMgd1i8kD7TxracgTJb?=
 =?us-ascii?Q?CnRl4BSaUQJUUq+cXSwypml88Qrd9ojyYS/3mq0sr0rJSk7drU9NutdsusTL?=
 =?us-ascii?Q?mXsJ9n+sNYV7iPghnQzbAsopapjRBIpFfTjH96Aa/0+ezMsCgRIhBfUoPi7o?=
 =?us-ascii?Q?OHvBoEwlFmgHDymxwm0s3cuWjAQzI4iUfN5V3UDghokrMS3F2NjVHh6OZIj+?=
 =?us-ascii?Q?CsMr+AAjMxenQ13PZXX/nsKnrVV3wwSj3uTbLrjUXhW1eDZdviOHXQl9K7J6?=
 =?us-ascii?Q?INO13SLVF232HvOSu7wLFmV8FO45SfvpOPJx6nSplX6lx/u9PHiiqYySBQ7v?=
 =?us-ascii?Q?fdqnCXYF7Z0l8FSNQM/ajXevNFXfoz7lBivEjsJ546ketOFfSRgTOAJu3kdC?=
 =?us-ascii?Q?t8iDPWKlg20+OXe6MlOC8DNJDXup9sb7QDMQPY8Hq9C0z0EsqbJSNkussSDt?=
 =?us-ascii?Q?dPo3dQRFqScwDj5A1XPHCw1PJj2W0H5oYiZ1P9jE7+/mKDhnsWSrs37h8t8U?=
 =?us-ascii?Q?Q+dr/Fwh1/BXU0QnsCg9wyXQ3mFQE54I6q4xXAamC5hkg0/qwtTE4XVCkyOa?=
 =?us-ascii?Q?3JVcWdKB17gDNJB8dCxLn3Jbz8PtOmXZvHRvlEXUEYelkRDtfIxwfSXMIwEG?=
 =?us-ascii?Q?BxBYhvwmmhTf7s3+CG8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70e9bda-e79f-43a2-fe8d-08dd10876706
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 15:06:29.3361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RmBWcKkPhhDaaZipMUQTMw+iqRkyKkQEDrYXp10DxzRl3D4hlOjjsf+cd8d9j14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8491
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_070640_868853_2659746B 
X-CRM114-Status: GOOD (  15.85  )
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

On Fri, Nov 29, 2024 at 02:38:10PM +0000, Shameerali Kolothum Thodi wrote:

> > +	/* FIXME Move VMID allocation from the S2 domain allocation to
> > here */
> 
> I am planning to respin the " iommu/arm-smmu-v3: Use pinned KVM VMID for
> stage 2" [0] based on the latest IOMMUF code. One of the comment on that
> RFC was, we should associate the KVM pointer to the sub objects like  viommu
> instead of iommufd itself[1].

Yes

> But at present the s2 domain is already finalized
> with a VMID before a viommu object is allocated.

Right, this needs fixing up. The vmid must come from the viommu and
the same s2 domain shared by viommus needs different vmids.

> So does the above comment indicates that we plan to do another
> S2 VMID allocation here and replace the old one?

I have been planning to remove the vmid and asid values from the
domains, along with the instance pointers.

When the domain is attached in some way the vmid and instance will be
recorded in a list.

A viommu attach will use the vmid from the viommu, a normal attach
will allocate a vmid for each instance.

This will also allow S2's to be shared across instances which is
another issue we have (10 copies of the S2 on big server HW is
wasteful)

It is simple enough to explain, but I think the datastructure will be
a bit tricky to keep invalidations efficient.

I haven't even started typing it in yet. But it is the next step in
this project. The vcmdq has the same issue with vmid assignment as you
are facing.

Jason

