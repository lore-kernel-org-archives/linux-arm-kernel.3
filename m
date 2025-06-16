Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A49C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0c4QBC7WWkttZj1LFgU6+xpW1qRJsbxIqlk+okrSyU=; b=fnAlsqLMB67oWmPU4MKVBSBndt
	lJ25aVskkMjan+iNNkgNd+Yg4XX/hADcylE70olFyjMsvwrJE4AzfbrPXUl0fVcCqVSc+9VcfPGTq
	Dv643e4zIuiL6rqf5C/5xWqEigWPAa4zK3gcEW8GUoY4zy+keUc0hihNGArHwnU6yKK1bJxm8p29Z
	yStiG2rT6AK61+3BIP0zZiQMo1blhlFeT1gwVODrALXEpS9rB/PHlEh7UiMfsuvOSN3uWgtAgjKfW
	jm6IXnt+li5OMdAP4kYDI2Bw5YqHODDx8wnnh8MhfqGRsJB2A4ovDt+gjfJATCK2Qg+iHrczYmcnL
	5i92pRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCqJ-000000051dl-42QQ;
	Mon, 16 Jun 2025 16:37:55 +0000
Received: from mail-bn8nam12on2060a.outbound.protection.outlook.com ([2a01:111:f403:2418::60a] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRATa-00000004eBv-3Y1Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o21WgiSP38ukUIxJKNwdyyyq8/EYRxqAfGOZ1W+eFiYMTkmahIK3BoyxJUbtgm/NvOTLMu24DTqheomJjQGG6GEQoxpxAEmDnbq3MqEw5b9uMtVYcXOOKPG2HnHaOg9DubtDUZAyO0RFHGRnekA1e1/yq1bhH1ddMRac+Czn8H4G/SyEccYLdRwrvwu1XN2TF6cuogQrQBU4vxY99PQEQFwjU1bEUPPJoNu1OYet4YfjpkqHVWSX+/a1S2YSs0uDX56BZ3jiaiSBtHGc2JpIIzwwX+NX6IQ82IUrs/Y+XS5/qHrt4F3xkPFokV6ckwxqG2B5Jr6NR6SU6xILL2cJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0c4QBC7WWkttZj1LFgU6+xpW1qRJsbxIqlk+okrSyU=;
 b=VZEGmk86kWDoxE9Jf9XUj4UxuXo3f3Qro1F7vsZ8iG0lhu41X8qrEA466dlozJVmdZAXNBDvaJhshd7AruM/2/MDQTCbx3IUzR4P5SisBEBcvnjV1LQg9RwYOF3qCsCDfxOi1RFbMEfoonHuKYs9594BEDcAMqiku22L5Oi+ms3Gw7gwoV08eRTfDHgcS7ehhrz/266tDsSXK8+DQRLdS2TpQdoY9NtiGoQCTXc5TjaVaEJEsHRLKNXuo+VsjeBddLDB3/5mXyqIw00/6rMlEh7RDNAJv53uu/53A/JHHbf0Iz+CtXfknwyo+M5jTuQt0FxSYOtttVTNcA7Osyo3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0c4QBC7WWkttZj1LFgU6+xpW1qRJsbxIqlk+okrSyU=;
 b=kEHvATcuCqX+g2qa3ovtzEvZEinwl7UL9P1pMd680MkdRhdfFDkPgmeAUsGbQDj5D2bL+F0zd8r6aFTeXGemd3GMNDw90Oa9xhHDs4lDmFR0+PZcUXs8Gf5kblhlSS7U56V+dZYHY/5oExB3l28n758moyj/8U2Fx2wWU2+b3FgG0FB0qF9lgouQ56zs82f6JUIS+1sdJ+FN1VJGCiedNdloyCi1RRah1B8oFRwafr8iYDCfuraqxzbC1JPOi6LU9LiMxtwnNEMECAcKro34Ow55D+dpcXBX5PnBf8Slcwdrdt9weMl5qsOawEEoJ+k9rDcs6aDeu73s28qu7rUG+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 14:06:10 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 14:06:09 +0000
Date: Mon, 16 Jun 2025 11:06:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 11/25] iommufd/driver: Add
 iommufd_hw_queue_depend/undepend() helpers
Message-ID: <20250616140608.GF1174925@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <e3b195d74539d065397f6b1382127438fc256ec4.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b195d74539d065397f6b1382127438fc256ec4.1749884998.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT4P288CA0042.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eadb799-ad11-4f65-f238-08ddacdef194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NhZ3RxYToSthjcuRbwGt/qSLF7pPnD56pHdAlvga3SAp9GOKOm9VzkDKxCkP?=
 =?us-ascii?Q?lKXweyQUh+7DwMVvbqO6mG/XCjiH9Qv04u6ExgTp309QdUYS6VoE0sUjBJMY?=
 =?us-ascii?Q?A+2qINiR/rga23DHIInUPiAIUXN/lnfjyHrs/DtZ7VWWbMynXJGp1wwfezJ9?=
 =?us-ascii?Q?3xjlGuTw+gK+aT4OSvXomEydDUUzlKzGg36Z7oP2apn2JLoHsj5m/VmKTV79?=
 =?us-ascii?Q?m58gT7FmCHqKRbfZd1LJPrC5/wXsRR/ZicNIDCFnKolI7wCQnthgjnYuoFG2?=
 =?us-ascii?Q?UA7jT2sb4MqNKl4xEyDbeVzeFI1sNimlgf1l95mJIzDsvehiqdORd32MmvEj?=
 =?us-ascii?Q?aL0nRdAX8Gc/nvtpPdaZ0S/c1/uJg/CSqwufMqqXj1uAcPmGs2z0GflmXqEL?=
 =?us-ascii?Q?Hsvc6qExLuw4fVl/qsOAz1Ev49m8TcWG2enKW2BPwkoOqlHUVQvtyvNxhLK6?=
 =?us-ascii?Q?v6gnfRJ5dhA7ljXD1/+U5eLXbIi2D5hKsOncgwpr5RxdbjX4uvDPLRqJaQVx?=
 =?us-ascii?Q?g00mzrQm5zramVwI+A7TiCZFHHsFasyvFsf6K8zpFguJkjv4Xyx5G6jrQBbW?=
 =?us-ascii?Q?c/FVkfT4N5ADHuYuhFneugt2+B6WMcqkXAsMQomxfCIx0xRElR/WpnCACVJM?=
 =?us-ascii?Q?OgMMGJSp7HSbFxyMzlEaoozE6rmvFsikzAvB4ISdfNUueM5EdTPr4LJDUQkg?=
 =?us-ascii?Q?pSbfMeGeDT0ds/FWnXKv47KKMN6efnQafA7kXe5oI5IZQ91cu2XDVl5xHswm?=
 =?us-ascii?Q?x057orLrxMUuHArBuWsPhq1MPcrB4uROgeZYDEh53dEwAU22VDeYQSMbVFhj?=
 =?us-ascii?Q?Fw47mPVFDBLrjLEceaSrFULOmLY+jfe3nsquRa/sSUP9vPkREpNkGGbEVZvT?=
 =?us-ascii?Q?EyiQ2HQqPKxQ3OWfEBG8l8ghMaqHd/FPyqxIBLdD2r6w6Woo6E9fsJWhRFFJ?=
 =?us-ascii?Q?7IjiQX87wVMIMA8vOTzwEpGa0RQxAah4nitlulIGqWa7o+SWQGyW98qIyZL8?=
 =?us-ascii?Q?VxDnjXgxXJJsRGwXgm5dqmKbdvMPbuxgxzm4yb8L4YcjoHUd18XDV4HebQPq?=
 =?us-ascii?Q?jNkZ8ssoV/bwQ81Zla23X0bPvQhDdrJEnLlc2XQNzWXTaG3ZSwqRZz2GIsa8?=
 =?us-ascii?Q?AuDJcv+D2ChSRaJ6z7TRxPCxZiwaWcqHQF4ziXIXjKHScy/OT98g2uEYGaIH?=
 =?us-ascii?Q?6NFUlSulUJW9vmwNde7XYK+z2TNBmUeSqst15v3MznXzgae0fIURDg9a7/aQ?=
 =?us-ascii?Q?wMFn1ZOFRcnhgAcAVN18JdBxGgtoG9zTWS0qiQThBY4P7Z1qMSHBctItr7Lp?=
 =?us-ascii?Q?Ubut8ovuFUmrDGs/5W68h6eOC7btEj8GuxvyjGni3rbPksFK7MeLDb1iNwQU?=
 =?us-ascii?Q?kM2Egqjvl4rM2mxhE3b7PzTxx3C8V36L6aoIAp291GtB2cB3DYDkv85furks?=
 =?us-ascii?Q?VNA7k8EnDYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+zfS9lYsFdfaUbQsgE5iFTFjgX51u/WHYlURYAIhkEuQKyInYVet+MnSLJM0?=
 =?us-ascii?Q?J7D7aNlf/feXR9Dc9MUBABLIRnyM8Ar2akp2pXgHOGd8ZTSSsXa3bgLXbksK?=
 =?us-ascii?Q?2Ioi1vmVflC5+BX2dqgBxbhtVE9595GP++lIEDWqYT3lfv//+9dHr1w85dm0?=
 =?us-ascii?Q?57CueBDmwgi9Ni04dt2sI/1o1XGPPyLiG+TTQXpQM9lcBoVUBtoq1ZcysCnS?=
 =?us-ascii?Q?R+jqwXByRsCrZahfwAkBepAoJQlv7uX8pXcnuvTLXlwP5BHgkYLa6IFpXogi?=
 =?us-ascii?Q?KAIej/bbGLRIlrFQjmsjRQaRso+49llZo2vT7fDkOzD+odTVYd0gxBvtXS1/?=
 =?us-ascii?Q?gzZN6tEIseM9U337gRXzbjczuH5PSFtUmMm/GHjfacTy4GrGE7y659EhE34Z?=
 =?us-ascii?Q?ujKAquFLbTniMFmRWB2va+UmqvazMxOg8FKwxxoyTxXH1X4kqTk3+42Mcdux?=
 =?us-ascii?Q?mcn+THJmON0xvrCOJTrad401MPFciRZR8L9Ac4ajFivQZE1iIie7KcTevuPB?=
 =?us-ascii?Q?dcd84A8FIJYag9mxwFf26XxObEn/q8VnVsF2Irv2T/AbSREWySnOin7ngpch?=
 =?us-ascii?Q?+vtIR7O9rjNlrh14BAFOoFvEnpJu2JO9BMV1aMcTNgxGOFI9e4GC7EdLri1/?=
 =?us-ascii?Q?/Xu1RZoSBsHPDnfs4tPV9lHmrtax6bg34aopyVIuwQONm/OW6SfDcUeR2eNZ?=
 =?us-ascii?Q?jt9ZrKQ+sut3yeD4DBPbl6Pvg+eDStQHFPj3W61MTZvLS2gPoEPCD6nTA7C7?=
 =?us-ascii?Q?56cYp98yQM5hBj/Wzpao4x3FSuceMdFanZ2KsLZNbf/RLQfG8elogU6JY0dI?=
 =?us-ascii?Q?5N5CW6m2hl0ONC6wKVC+V0AxmBYm5YeYFUM/hevv7VXcrFUFXIxmhkbOWGsi?=
 =?us-ascii?Q?0p+VKT7JIocUPgQ/xoOG+27Pxn0eIlvRhnyajRdhu8e0Ynmqt5Nf0MTxvPVV?=
 =?us-ascii?Q?h3YXEdpuTqTqJAyPOwNnhyx55QAFUrN6nO0m9Sdlbb5aKh5+KKsXpz1dApkJ?=
 =?us-ascii?Q?PJP98B+JogmtULm8SbFeI3f4hz0XkqJ3YsR0MlWYyoqOl5LjF2Gdd0qidMVb?=
 =?us-ascii?Q?N8s3tNW7e5mDyJ5ci0nKPUsbOChM6aUpeO9R6FK61EiSZcEQ1fDSHK11urKA?=
 =?us-ascii?Q?57v2OukFgG6ZmYQFNDzT7esK8ph4xajhG3LqdyY40D9djf0k0kv1di1cF1GC?=
 =?us-ascii?Q?NtpYILFotgxNt082KmiOGccnhdBdNSMzkRQUse8+mCb59GCgoeEKCewk05g0?=
 =?us-ascii?Q?fTiEuSKLkMPcc1HYyN0p/vX23mUqyssdDtUjdgyPaU6vY0OxK8f6QuOrqlrk?=
 =?us-ascii?Q?e+BuPtANczO2wrF1Bn+RPOA9HBijuj7a2/SBZ0mR18iWEGZVsweKs+NmSlQM?=
 =?us-ascii?Q?iINfZVthErH8SjtZOfHbzYs00FjnqptJ40WwpTb/EuF/PCsYV+Fkpzp5TG86?=
 =?us-ascii?Q?q/Px8VObqcHE4rxYRR8HpCQRlG4uPdajMYwaDhB5b8jvEWb/O/maF7dg6cI4?=
 =?us-ascii?Q?bcZjlpEowAigcklN9pY+xa7zozyxeuJPHtdGzD+5m7myHavkcF6w2y1XBKV3?=
 =?us-ascii?Q?3ei0RL+rCKOXhrucIXn6+J99gbkGtnt11ROJQxf+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eadb799-ad11-4f65-f238-08ddacdef194
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:06:09.5990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnK0h2mWHkoTGiZSOIP/c1waG0HRRAW2ilaWo35hq7Y0nUwlXZKPNmUlSlhnWe7s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_070618_905897_BB1DAE70 
X-CRM114-Status: GOOD (  17.83  )
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

On Sat, Jun 14, 2025 at 12:14:36AM -0700, Nicolin Chen wrote:
> NVIDIA Virtual Command Queue is one of the iommufd users exposing vIOMMU
> features to user space VMs. Its hardware has a strict rule when mapping
> and unmapping multiple global CMDQVs to/from a VM-owned VINTF, requiring
> mappings in ascending order and unmappings in descending order.
> 
> The tegra241-cmdqv driver can apply the rule for a mapping in the LVCMDQ
> allocation handler. However, it can't do the same for an unmapping since
> user space could start random destroy calls breaking the rule, while the
> destroy op in the driver level can't reject a destroy call as it returns
> void.
> 
> Add iommufd_hw_queue_depend/undepend for-driver helpers, allowing LVCMDQ
> allocator to refcount_inc() a sibling LVCMDQ object and LVCMDQ destroyer
> to refcount_dec(), so that iommufd core will help block a random destroy
> call that breaks the rule.
> 
> This is a bit of compromise, because a driver might end up with abusing
> the API that deadlocks the objects. So restrict the API to a dependency
> between two driver-allocated objects of the same type, as iommufd would
> unlikely build any core-level dependency in this case. And encourage to
> use the macro version that currently supports the HW QUEUE objects only.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommufd.h        | 44 ++++++++++++++++++++++++++++++++++
>  drivers/iommu/iommufd/driver.c | 28 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

