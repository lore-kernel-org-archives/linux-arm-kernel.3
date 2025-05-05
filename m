Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9805C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hUcbONjA5JopsfleQ3q+kAo/FcAr+FGSXjXd+tCe6A=; b=bBI2ojWtddVDy6gRSJja5isdUo
	syOia00l6PA2ffLcsuKJP8g6zWE03Yek5oJeJLf5xexgsfK3Zthee9ZlG9jtPkHwOJb8Njs/DthSm
	mgPjZmgprhuSrTecgfBI08hFehE35AUjBM05V9N47t8rGEMz5qCd4q3HakhbFQfpipHVAEF556zm3
	iMERyC9hkpJxYP7pDJ37/09rRtszxhRY1TIE5Xq9zVdBsfjLABUpxNxxcPOCrLJjRw5Vl1I/OOyJA
	0j8W6AP1GXQcg/TSqpRnrXyE8ZhOmCtT3ext3P5Q82SBWJ0m+5UymkDagK0/IgshALGJGUr5oC5zj
	4ZJEUXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxUi-00000007lq8-28BB;
	Mon, 05 May 2025 15:12:36 +0000
Received: from mail-co1nam11on20631.outbound.protection.outlook.com ([2a01:111:f403:2416::631] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxJu-00000007jcZ-1vvb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:01:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuDQybL4fu1847F2VNfgDTW7bU6EvA2aS89bS57xqO6S7I9uAUJiJDz8KMPJ2J0OG6x4ABlr+8KwV3W5VY6aU4Xoz+LeHd/R9s8A2Xx7fSJEzZVC8lOlwWgAxPlsfV4ZbZcBSzp1nlQrrYdSA1dSyCmrfYfGB2ghg8twcldCuZgwPR3yxN/6rAGKG8jbmC4NrhncHQRN9vOsOZHdD9NQcIvhNpMX+s8JSjNPSrZfV3MmXcmn6lmBnfs9kTDWSOE4Q7B1qEmKGji8avHsMxdEVlLccM4Br+j5nW7A1R1TUQEMJbj3I2bik59dF9Ho87JVjkikQ7tArLXXYHctxGxldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hUcbONjA5JopsfleQ3q+kAo/FcAr+FGSXjXd+tCe6A=;
 b=AMkijG7mYG+tMu57FzSdqBlocvD9bXDfsxNTK1E4NIXEkqQUSi6waVi7j1mcbrbBlQsxScfO/N5CVR/udlQ+YwrfX7OSgNuCy/+QeuHJBsUNEn1v3v/245mg10fclPXHxABc5a4sg2FBZnO9e8GslmLFlotekRXKU73xRs075WPPiDRosSYsChT1fjJU2KlovHx9NfB3+FxkUTmbqpBdDslazrAnbWh7iN16wc+t3hKgprFTJ5j8EYgQcNQRCvBrFsqfub79Onk7uBzKZsegzEi0WYZC7xLLLy1FtLorxBilhTKpp7RU7nxNCSN1sC2besONXcZZGijMBYWKS79M/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hUcbONjA5JopsfleQ3q+kAo/FcAr+FGSXjXd+tCe6A=;
 b=Tt1jbWbbqcILXJ6aWOsGmESS4iku8skAlsy24VX06LiIeaBPbK2DMMBDlWBrzAj+qtutIyKr4/+YWFLUj9KVwTnVa0JqQP5I21rciOjtFt4SutGYYHzsJ/4B/Q6TUf8VdUvaUilqMTVY9IGqNhxKPWVzDiouYNg7E+zcqjHa3Vkpynnp9FENm2oLrp++up1vyQeLwtuaN5eA21uXvn2TBA7CFjJf2xJ5jWfk7Zgq9sSGQ9u/fI4iUT8WZ52F25TLYCfu/7Kd/ccNfvH/35nbVCvW5NsG+/DZ9hd7sb1yv/zM1IxTCs82c5YSrqyIu2dtAAdFCsAZRf2HZtS0dCky8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB6096.namprd12.prod.outlook.com (2603:10b6:8:9b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.23; Mon, 5 May 2025 15:01:12 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 15:01:12 +0000
Date: Mon, 5 May 2025 12:01:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, praan@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <20250505150109.GH2260709@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <376566b4-6c13-45ad-b1e5-8cfe2de437bc@linux.intel.com>
 <aA+92fNNbDI3Qowk@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA+92fNNbDI3Qowk@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0881.namprd03.prod.outlook.com
 (2603:10b6:408:13c::16) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b18626-7aa3-46e0-f26b-08dd8be5ac97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vX5COlzExasYxqOwZiNvXgPWuDhpsEvy7TMOTnWiphkpdoWg24uymEvPkLga?=
 =?us-ascii?Q?y9Ajjei1fgDpmMpVOXYrMPh6EL9ikQJfy3NX2NpwNjIWW0UXu6qffW1SS1uU?=
 =?us-ascii?Q?9Pikx7T9smoPN3hRgNJRQiLxF3Xccg9m27k63mu2llVrJca5hA5GzCr5cWKH?=
 =?us-ascii?Q?I7YP2GNZveIfJjlU10q2G6xB6ipJyRaqnnFOUUoffj0LHlLF498LzfS/vc5Q?=
 =?us-ascii?Q?ZS+u3BfV6btPLyv2L6Y7MA/44ZviuIg6D0xD8Lla1SIZku9i7fhX0duwX0lh?=
 =?us-ascii?Q?Ejo4lwq+kuyNZCLSr8jo0ahaWLT9RI9k3KQnolLjtqQsFYPdNCkruNRlQdZ1?=
 =?us-ascii?Q?Ohk6Ne3bR/icGEa/l4zuFQaxTjrjrkrBgypQMPXOiD/4lxnlWmme4i9l/F/u?=
 =?us-ascii?Q?hVERRbCHqe6cZ7KIl2syP/AlSZgeC6sgwFsnbPu7yjmDYysBYZ/RTLMlifRX?=
 =?us-ascii?Q?VuwAbRMYQJ7/zC8LJ95469+PwGcBJC1SAjRGFsNk2K8Ybd7rXHfgW3/7PSxJ?=
 =?us-ascii?Q?lTuLVFhPYwi1OhFefBGO4EyCePWjNNnxHZksYWMQ5DYB3jOQdXojxaWQOWd1?=
 =?us-ascii?Q?+1vZyKjM4GZiAwcppqaJiluLb6C6vVtsOmfvTybF4sJOgzDkMfi/3Ix+s2m5?=
 =?us-ascii?Q?TukVmZPlpR8YKvWoaiXlkKk/qXIJj5DH1tRmLyMybHchUU/Xjr6ZmeK/2S1X?=
 =?us-ascii?Q?1TyaxMa93R2HmpKyzSiDrgaeurqI4NYQrwypeqsezDt5r3pT40EStUG9wpr4?=
 =?us-ascii?Q?iZZxxAe5iszkdSgtrWl8wrTOZs6npKY+SnjzhYKynemC2ZU8Wm9XCZwPJRJK?=
 =?us-ascii?Q?tP0HRNXCddyg16oZxoWaw0x/6Zsyynal1ltUTt3PNH10+bjUn69I1JljPAlP?=
 =?us-ascii?Q?QmahSmphVmWVrhhwR9KpV2KtnzCpO6B7EzjZWWoGkGqdexjFmNtJDEPOfmw/?=
 =?us-ascii?Q?UXrp4+yHg0H2gXaT8IjNJ8+KzEVet0niEBDHgQLKQlGtz8VjD5zjYeF6XlZv?=
 =?us-ascii?Q?jEGd5N5bfE5l9n0+6Krf+6AkEpW86uHxTPpdbyuhPk8ROqO/xNhXSp9sYbB3?=
 =?us-ascii?Q?iYwqYNHfHiwPEQnbanF0AVQajvhU+0RHqncbCHp7TaSg6zNWEvUTgt/tFm3+?=
 =?us-ascii?Q?Tg40Bc50A87uM8qFQbTb4xz0Ql1VPi7zCNIyGg400ZFjOXhOiNpFcuC57gV8?=
 =?us-ascii?Q?IoUYcuUmZ1Um04cnB2Kclij2iqnrK0Mou3UfmkN2bKwR0lY19cJriJIIm2++?=
 =?us-ascii?Q?JWgB1C1/IZcZEZDYcFuHtkmobYUZidpXRVBbSwG0iXkqNwhfjeEre+3Mh0Gq?=
 =?us-ascii?Q?zWddENN9rKwlORuJwgokoveLDZeu/q3ENofEmhGbHNwcmEVaLTp02Q05pnju?=
 =?us-ascii?Q?r8qKtQIJftT6X2KvoRBrUwCStwwCqW3QCMvMYDb73OiWyc/37Ek3tFCMPWU7?=
 =?us-ascii?Q?MGM9yWT7vDI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHyENSChoql/ytnWGyZ9MUJJ6ddtzC/WaSfgE7SQgzTkRiQLE7c7pdtC57Tv?=
 =?us-ascii?Q?4l2O1YiZHONvmXtlM5kV3o5U+w/5eNBr/WvSQguEb8YEkIBuP88JgIVxShlv?=
 =?us-ascii?Q?UVLTtV0CUElbcMDhEHJUohE5rVjv8p2rDH4AprObdSa3kVcl3chNQLfvAc/Q?=
 =?us-ascii?Q?KX/z3sCGg7yLtj44HEOqYInNMYgxLQq0wnXBFHu3R7GltzWmSRX3F8NL+j9O?=
 =?us-ascii?Q?nDBZmwXQ4GDFfGB+IOY9N+qZx2jP0cFKe2MwdJ/BaWyENU7r2+zMKGJF03Bi?=
 =?us-ascii?Q?GO3XjQVm1N93zlFkTECYuLO+CCQY9mxWP1YFjhKsqmdL2pPhKxWWPKfAVf3P?=
 =?us-ascii?Q?o6gDao+Eod0tfEUomQN7xumYVK0TbFFeo6hy/2B2k0yTHNGHFa0L6JRebL1B?=
 =?us-ascii?Q?pkhauh17hRpU+rFoPVZTOo7giaBxTMjzsHUFkhjhK31I6+mKdetuCYDdjqlC?=
 =?us-ascii?Q?GQa7tUZ2+Bqp71oMbuEMcdeBKULUemghRK8EIoeNhp9HZdjNN6LOt+sfCOqU?=
 =?us-ascii?Q?EbPwQ8id65nYUvdkuP7NqlwSE6QOyRXQAQEbI7Dc0imyiMTLHIucFoyEHVy1?=
 =?us-ascii?Q?oO+f6X0fqFI/XH4Q9UmEHm8SRBX17sT2vShpsziYHTtWerqOS6vIfmd/XnRT?=
 =?us-ascii?Q?LJOlGlDZappwJrt0+N8kNSrvXgfwda25i//FAhVEMHSRgJBVNBkeb/J90oh2?=
 =?us-ascii?Q?8gug8KieF0tXsXctBlv6wnBvkuSRW6+EN2n/4Pu/kMJif3dnrbCbL588OUNC?=
 =?us-ascii?Q?xTmuhuscD8WHcfJIVtbbkWcFtdu4aX50tpbwigpNxFe30l2ijkjCkLZB9xsU?=
 =?us-ascii?Q?WNI0+T+Ca6Zkf0Hac7qJ5/K0q5Q2h4v3k54YLk0xFH+4KRXDOZEzkHwzkx2z?=
 =?us-ascii?Q?lg+c1fQCqKwNqDWXdGauGQuAHqdKxUyBqMjQ2ZMpoLlI0QfSMtAOZcXcIquW?=
 =?us-ascii?Q?HYN/4S9Lg/pJ/J5fdjDuB1dmKnhKTR+QVRv4GlvE9SNUmBbRuza4ZlyJb8LN?=
 =?us-ascii?Q?4DEx/KL6d7QNfndq+2VATOY9UCeEUbBOcrESWZ1Vvhkexa/vXUlEdfxC/CMI?=
 =?us-ascii?Q?ZI6Ozg5u4bAYq9E2GfsSCZcUzKRX7Sxj4omfsFmJQSTy21x1LPmQXCFCKh4k?=
 =?us-ascii?Q?oer+swh8ykJtR6dWsfhaHITuVTh5tqD+Wv40A8byozbN4HwPCL3aXbfI/kDk?=
 =?us-ascii?Q?xwwFulB3rdJwVGt0BCgLPW2TDE2qrzYLu4UEplLYXe0T/BeDT7PIumJjo/4w?=
 =?us-ascii?Q?G/1nP3zPNPUjeOm8/kM8IfxoCxvkWMyiA8UViCW8YE/mt2yNREgfB8Ogypy+?=
 =?us-ascii?Q?EikupOSX55pzjbm+RauQrcm0HvXzNOwQjvZQhLy3JDIKAvdtuGlg6ge2tpwK?=
 =?us-ascii?Q?6LC2c9iDZrhFtf0T2f6l3qPkV4Xllyev9vmsNuklItzQmkaCzLd2jsYc8gfD?=
 =?us-ascii?Q?VIi8ASP4O+kXhgekgmOYLKswEC7ZTJYtgvyzySMKceDyGS11kwftbYAx9gL0?=
 =?us-ascii?Q?xB5AB2L9eWRbd8Vk5EeK4AyYjDaIaACxdIkCKmWeMZ4U4qXbMi4tSVcMAAIp?=
 =?us-ascii?Q?MNRJbWObhgn7U2T9TeH0d5tTpy5Mk7X/oTNcXQJt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b18626-7aa3-46e0-f26b-08dd8be5ac97
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:01:11.8677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JujdOqAaFlYsQ0EWGuAl7U9/2VXsAw+B2LRg83eFnkQXocW6wt6bTKKgWqfvscLh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_080126_536600_3A7DDB13 
X-CRM114-Status: GOOD (  12.68  )
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

On Mon, Apr 28, 2025 at 10:41:45AM -0700, Nicolin Chen wrote:
> > I'm uncertain, but perhaps pr_warn_ratelimited() would be a better
> > alternative to WARN_ON() here? WARN_ON_ONCE() generates warning messages
> > with kernel call traces in the kernel messages, which might lead users
> > to believe that something serious has happened in the kernel.
> 
> We already have similar practice, e.g. iommufd_hwpt_nested_alloc.
> 
> In my review, a WARN_ON/WARN_ON_ONCE means there is a kernel bug,
> which shouldn't occur in the first place and isn't something that

Right, so it should never happen from any ioctl path and syzkaller
should never trigger it based on system call randomization

Is that what this achieves?

Jason

