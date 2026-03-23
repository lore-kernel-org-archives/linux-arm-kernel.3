Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8822FFC72D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 23:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSic01ODIordQZ3/dpCEBcpNUx1w4jSEGqhQElAbruQ=; b=Tm3Vq5woI+HAebL9BChjcS+8Dm
	3pgg/O8BbdTelqZfUQUIaWeBRuniA/1eWQ6+DdsE7cywaKWMlBB8FvABI8XKT6MkkqSbj6tt6IN2z
	5NifcXNtN9y0C15/bq+XWFT9WF7LrV08r+ODXZ784XIl3ea/ZLThKp/xu2eSHFcyY3+9GHzXixHBu
	HF9BRyk1mufmFTr8A+hXn2lHLjnXi/xkHrBBGNu/zx7SvLn7ReWeXtgwbOvyuUqdYOJRZ1OnotemZ
	cAyzmgs0Xvv4X8qv2hMEXgpyAIT34ZEoffGglymxAp0aFaEqzgGMn23VTCAFKC0ZzXQyMLIobouWV
	ThGeejMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p9r-00000000BAS-089X;
	Mon, 23 Mar 2026 23:58:07 +0000
Received: from mail-westcentralusazon11010003.outbound.protection.outlook.com ([40.93.198.3] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p9n-00000000BA2-2Whx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 23:58:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYvzN4SpJpkz7mDfHZhx7fT0QPxewCpMXp/JZ/ROVJxu3K50UcrV78ANGxOHD/CmJe6jEb5ECpKpDW0PS93Rq4zx/qcDkmnkfXgCyGzsk655v30n34U6/rgU1sc7jt6PiU/S+H55ZSTABwuTq4NmulltIRjYJrl6wrE9Ob6at6zxBCrWPpUIc31vvSCAksLDrGK1wx0eNJHNjOlFNmWcwcFcni5Kq5VIssiOoYe0w6g6DrwOUifnbdjo3LbQJz9VGVIJhBL0IPQklmfY/y5UypeG9xq6ekAiTOvDnLXIQpuB5xqpN3ut92cdoy9jFdufX+Q5HGUWPuGYTWfKsxG4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSic01ODIordQZ3/dpCEBcpNUx1w4jSEGqhQElAbruQ=;
 b=uzyQif0TOlVmTtyHHOi1tCJDcfGwlA8G/r0MJrpM5p9BlqVJvq8BQbO7U5SMnMGDdLwF3BfL9MHOioeZ2bGskzXiKn0YdJVsirNAt6SSpurkyfMjpJd6ssZcqnYzZt6TnsS4yAyPjDUNt05BQQJuYzOPp9OC+V/1FpPNZHddXj+usHwFW9DzjwnAkLIVWlczufqkl56tJBTvkVFhKSaox/SeEbOELKRRdvDmRufGKgbhZbeOkKHx0I85gAMTRNDX2gTxxkwQQDVDhDn5QsiW0zrx9MoLdOQ8L9FgCrNkAuklwgRab5941pfC+WnhWB4YDZ75faSIpsfdU0we3SIIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSic01ODIordQZ3/dpCEBcpNUx1w4jSEGqhQElAbruQ=;
 b=jPwCaQKFToYlb3b+3WNDsPrDRzYNJ/mZob5vhTJ6mKJA6IVbtsF2W5nqi10TKasm9MUZVSLm9pEozuLWOL3IEUkHrpw9qJld/NASfFlXV2+gS3JiQ11WkXmmlMpzCaJZL5il1yWSkgeJ3EIu1xb//jSDrUl5NZ5uxaG3+V6ievnSANXymm9qTbrC0Hz2nEstTLTRQGpTt0SC3L2Vf2D6hxqPmSRO88zMCf/2+USxdCrwl2zaxB98Ysn2P32YC0uS3fMxpx9w4d9PbK9w+fk2x5+FC54LWUrs/9bWhLmEz7Zy5PS7ddk1UqRmO6neI+fArYke+FrR3iUblODKlpmukQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW6PR12MB8998.namprd12.prod.outlook.com (2603:10b6:303:249::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 23:57:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 23:57:57 +0000
Date: Mon, 23 Mar 2026 20:57:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	rafael@kernel.org, lenb@kernel.org, praan@google.com,
	baolu.lu@linux.intel.com, xueshuai@linux.alibaba.com,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	vsethi@nvidia.com
Subject: Re: [PATCH v2 4/7] iommu/arm-smmu-v3: Mark ATC invalidate timeouts
 via lockless bitmap
Message-ID: <20260323235756.GW7340@nvidia.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
 <absfAT4jgL2f3UfR@google.com>
 <abs0CQCrFlCsV6Ls@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abs0CQCrFlCsV6Ls@Asurada-Nvidia>
X-ClientProxiedBy: BL1PR13CA0290.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW6PR12MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eeca47a-90e6-45e4-439c-08de893801a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: C7HHXzbrkt2XDc3NV+u8WyhVlxFiZxKooXxmUpKIdAPCpckUszG25Oa8/owt4khdGH/P3WCHob6dP0ePvyH3XcfwHCmhD21G1EwgHrszwEbXFoQb0y2ww7R1dNPcUs4y5B7V7M5m6W8ScSnvbB9XQ6Il6V9kgUArWcKLbXffwiC2QRk+8xfjywMcOfVtbTbYUPjPjeQKc1xRg3wU3cmP9y5ospHgPmb6ZuK2UWtH00VhG4dpM7Er4ks3D8twujuZxnnZv/3eRzlgj8lAFj6GprZw2OhRGA5aVCv5kaJtI6TTF6ujegjvAlFV7uwJ3u7P/F/ogSsYvNMaWmRDnuYyn+Phy1R7oag3/tNiJXcwJOQQdEmtiZBP9nTJvKS7QbzthQCmeDRMgDtlnJfvMCUMptYWt7Wp5fC9SMkl7exRXf4C01ikYc9bfV2Ek0+eqBXwxMRgh0okMy5KGLnDaci1/52FLog976Fq+j7WIpsLYpFsTEmAvE4GvS4O2AiX4u++ZWwIcXtLsxcnvHEgS77lkeuFlusZgGyvEpXIxvT4+OtmaZ48dqLHGpFofA8/97tqPCbSiVHx8vO0w4PV3ybXpcLvwP4/DKVcaBKIV4FIfZUGVzLkn72k1gBmp1KTmy8Z6twlozE6EZFSfVckgrDXoFcIa4fy7gk7/jIL6Pirn/qFPEBp79KDKEZAZ8XLPhgDGSHYVqCtmComkqhAjXZVW7wa7qwYSgG0auaaG/PLtAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XR1fnN1vmgls96UzeR0dv04BxbJj+g3DtxkFXAFI3NZXwqO8FezC0BIsuMp0?=
 =?us-ascii?Q?TzeYyGjCTR48JHWD72+bYE1xcPbvkZFx5VFQiLIqjbVkCdaKpzDj40ZKUkM5?=
 =?us-ascii?Q?3I931f/etdo4DwTJMfbi+tGqvtOG88vhrF/xDBjzuvoB0V9mGG3Z2puNpdUF?=
 =?us-ascii?Q?BwMs8Ma8pVx4AwbpkrhxMKH4I8lahu2/XEviFFS7GUVUQXxt/yFQG88FyGaS?=
 =?us-ascii?Q?QcTPnwZ/l5ak7zF2f9tVcTyIzbNdpyBwqHTpCvPmnj+PziCoO2Bq+XVyU7hL?=
 =?us-ascii?Q?xeBlk5MpUXdfFp8EHi2/o/0RMCFMURPTGBBqvSWEZwA7yoSyIpneLvSPVq2S?=
 =?us-ascii?Q?Ohh+yj7WuofWg7r9UiiFa054AXYCkjuQ30SvBQCtUhFCf+M7vppJP7OodhX1?=
 =?us-ascii?Q?5T1zMUQgFqjU+tmYBYTvtsO8BRucSJqQaclO5igUopad5sjvoaK8T0YxH2kn?=
 =?us-ascii?Q?epfQThRsx9Ut1ShfWJhlQ4HOkfdUNu2aQmQAv5HTLkN9OBY2tVRHqHLACuyK?=
 =?us-ascii?Q?wHtgUP4oR9jRw7D9VsF8KJgU/bCpegBojo4AES3Roe5aLSVVaifYsAjywh8y?=
 =?us-ascii?Q?JYdp3+qRiHGoystkYviPiFekFFD/3SDjw8Yf1L4K6otTc27Wn2n2YCaxDk3r?=
 =?us-ascii?Q?hwEL5RyC9W3pwffSKCp4lWwUAqf671M1Q67NJQhcsM+0jGX7Ded+vcPRqaiE?=
 =?us-ascii?Q?oPqNgpAeawyjQN6PgN0FL+12bC8WsUP6T5yJp7c/6I2UMtpfvqVrvR96aJh/?=
 =?us-ascii?Q?jsWxDNrjGTla6HcZabLVlCq3r/2n3QlTGJ9XZQphQ8PRgJQ0entg3zQdTirY?=
 =?us-ascii?Q?nkDfcmRIfCOCgKnNngu6Fe+UjT8FPnHMEwyNAVMnWzWBfSV35ZplesllZt6/?=
 =?us-ascii?Q?xy3KOBJgJVE+XtNTWPfsJbB0m97LE2IFre7E5PdAOVM4HrddZzUO4cc28MV2?=
 =?us-ascii?Q?BTcav/JlrQMpLsYeGpH3OvC5/SWdCPgm8Ilyi3vDdlO/5hUWUmSp5xI8BRXB?=
 =?us-ascii?Q?nispYvkDue05QYm6QPz8ieg7tna3FKjL8v/YSrar+BFKUfo/Qhv86nHVIDdx?=
 =?us-ascii?Q?GBbEMdpPeXeciA3ukix0yAVq3TqVUkyO8IdJ6erRdRXHMChWczng7CZ09TN3?=
 =?us-ascii?Q?62Fz5C9FLsaPWKquN8nHsFpelZ8VEm4B6PDCbDhjYKh2ljGrhQ6U5XjLOU7K?=
 =?us-ascii?Q?6VL5kK/4JQvY+yESdFgTjNP8QNuAhw76v6UmtQ62UwvrKrpLsESe1lb+UXYV?=
 =?us-ascii?Q?btWMV9LbpNRbGf1h8MFmZe6ykD3Poss2UFj4h+kZCjKcmXyxaB+hZe0bF97C?=
 =?us-ascii?Q?s2AFqIMDSH4Nlhe2wVzliFNxyrv5SaT++VMqPLcHBM/JP/v6RtfF7ybg3Z9o?=
 =?us-ascii?Q?WdZDrj61TKXMGCARgAtK+iFzw/7nLv6fbBo3ibDa5t2z0aKvPChEEs01Pono?=
 =?us-ascii?Q?j97Ngbj7uf1amZp8tfpdikItlnMcQrFkQ2/G/gMOqjr7J9+Vq/1U67Lcb47c?=
 =?us-ascii?Q?WTcFM3w0DsKH1cKvTDTc5Vo2MagaLBd7aSUD4hFBuV9Hph9vyzjfgRescthy?=
 =?us-ascii?Q?NyJ8heLXofSanPnkF3a0awrxxZIKYxLTHtPwaGF30dN7SAi3O3kt5X1WiiBe?=
 =?us-ascii?Q?SCU1SKEO8FSZc+DUVDxc6LChsLMsC8c4nBR+bgrqaIWYmEd2u8FzpP2fPDfF?=
 =?us-ascii?Q?0U928JpBcggI4JZk8ieuQyNDqzyFN+D6lgYfmI86fgnYRjPe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eeca47a-90e6-45e4-439c-08de893801a0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 23:57:57.3427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hokSXuU2JUwaaf0x6XOM2fccPSH940SR56mTUp5tuVnQefU3TqOVYTwAyLGs48+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_165803_645178_A6D7432D 
X-CRM114-Status: GOOD (  11.93  )
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

On Wed, Mar 18, 2026 at 04:23:53PM -0700, Nicolin Chen wrote:

> If the software times out first at 1s, it means the CMDQ is still
> pending on wait for the completion of ATC invalidation. Then, the
> caller sees -ETIMEOUT and tries to bisect the ATC batch or update
> the STE directly, either of which involves CMDQ. But CMDQ has not
> recovered yet.

Yeah, I don't know if the SW timeout flow is really all that RASy here
right now. Without somehow recovering the CMDQ it is pointless to try
to continue after a timeout.

And we are really in trouble if things like normal IOTLB invalidation
start to fail.

I think the right thing is to somehow try to recover the cmdq and then
restart it on the commands that haven't been SYNC'd yet and just keep
trying, maybe with progressively longer timeouts.

Just ignoring the error and continuing doesn't seem safe.

But that's something else again, as long as ATC invalidation reliably
hits the HW timeout first we should be OK to ignore it in this
series..

Jason

