Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986D3D3A68D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiOB2wltWHCN0fjGbJT/S58hg7bcU1SfsLOXajfWGjQ=; b=0zCA2XjnTVCG09VnmhJve4LN2l
	E14r7c/nEB9ICtLjPN8BErvSmS2fA+/SkdK97evJYNSMn47nX/c65geLZNMfuEJdStX1l8zHhFEsP
	uqGFIESk2EaEhRIQLZvByd3ocHIlEN7THSuQqNlAAiDyT9DLYenaIfceYapwE6Zx/WiS/t6ZSgwdu
	F/r/WFCTDHaUk4PXTkhiY+dTGAGePKf84nukTUxZ6Ek/GOxP8hlhRhENewWZPMnGLkRWgIE8IynTA
	JmPVSNBu7SPN9QnDNVuQarjRr5IgaHX1XoDJIl+Oerv/1gVk1FNYLoANKo1ixnUk2z6kuYYIAhF9O
	gReznk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rSw-0000000FbYe-3Nnt;
	Tue, 29 Oct 2024 19:01:18 +0000
Received: from mail-dm3nam02on20605.outbound.protection.outlook.com ([2a01:111:f403:2405::605] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rNu-0000000FaVt-3iqw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 18:58:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kok6E6P3n2csZBvDqOuIn4Yk8nFRLO1iItQ2Kbo4ux40Ayfl6VSmXNBylNhMS6GiLOWwls4tGkIAl+Y+dIQtwjnsKmNwm97ixK03wrvIc5xCo/ZDPwjGaYzV01fouR4SyrhmP/oDQxTL1Pf4M+iMllXBH0sOWSfgoM/bfAx7y4ZnKwAIJ7I6VuyR839nJcnL/Pgv5I9CdFCfIppXrXoYGiITLw70KqA666xdPCReRgP7ILGwcczPw0UlO/uGGprW94YjsXPNktKas+6dBN4CEAjKrHiaUTDZFwTSbKEsf+zs8eSHHXTr9Cxil/jYHo1olqsaMxiU1W/ZHMXGdGCm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiOB2wltWHCN0fjGbJT/S58hg7bcU1SfsLOXajfWGjQ=;
 b=jIB4uwTBS9JmfWNa9Y4BVXUD/tFTi/p+q3xEAj96nDgNnlCZlqan8o22lxBC6b194XsWRTWRU4K/X3auPp1aUHkksJrJDNgqVsm/CmNjopkr+JTkShYcBipFaq0Or1TvWiRVfG58KHrWJzKe5Gk3o9nqmVl1O4z86W8fcuDu/ROFhU2Gy60W+LF4Drj+wQoeBtg+6vK7lvOZjJvt6x5AHIKtHOQdPldcSY45rBRppbmUyS1hyNnFSlSZNsNA5t3rBebzQftxfvkFr+Gz3TVPbnDLVJGKhaIR1Hr3BPEmIkKSXHDmVeVF1RYqfHYH8ur0i9jn95aZMgUhDJUCISaCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiOB2wltWHCN0fjGbJT/S58hg7bcU1SfsLOXajfWGjQ=;
 b=howAgKlAHu69Z9Lj//2LVubzxVUbLJHwvJSjncUNlYor8lJpSTXwjSbJHBUD4sy3aobxmu7l12WB6u6bxwmY2DJ/73kAcHVdOM6gEjrEqYvN5vWOQYMKqf9eunMyI7C326/pcPAmy8++5WGxxnEF1ceMDZDV6xEOQB86/hHUwp3lgpNYzxDnV1vqND+FHoT3f7xjhHJY+tqzxEpsPV2zxF7Vg+EojJCHV8gW+LtAcoOs4LQVStI5ll2KsG40ZOdjpCmHViYA3aeeFqswGlPIc5ZC6ihTEpbCxdquOX9qizZjygKltf1oYlxpFW6jLe53TeoLwrGkq12aWYxjHMEg+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 18:55:59 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 18:55:59 +0000
Date: Tue, 29 Oct 2024 15:55:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	yi.l.liu@intel.com, aik@amd.com, zhangfei.gao@linaro.org,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 03/13] iommufd: Add iommufd_verify_unfinalized_object
Message-ID: <20241029185558.GZ6956@nvidia.com>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <e99946ea0128370349373c94339d465397946137.1729897352.git.nicolinc@nvidia.com>
 <20241029144907.GB209124@nvidia.com>
 <ZyEKvcpgUsS1nCEg@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyEKvcpgUsS1nCEg@Asurada-Nvidia>
X-ClientProxiedBy: BL1PR13CA0445.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: a971ddc2-7ec8-4d80-54b6-08dcf84b53bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EiFngKcl//n1iL+47ODS+o+rQY35O7cKRBqh9sL/umQiwYX89NGgb9HBzyVg?=
 =?us-ascii?Q?9lz9Lzs3M0qJ6eiQjXS1sDJDM5KRX99YmFcUF9GCV0g5WO9DDh7VHaLecHYR?=
 =?us-ascii?Q?c2A0C0Xmu8ZljD/54VVeXCV13Mv1/YSZetXQCoYC5uWIK1M3uJUpTOD3ZCqy?=
 =?us-ascii?Q?RiDrBpGRnj6pJNGBpqjt/mqT00StASTwqKnO03PXlA3wmLss4SuaIRcyKgS1?=
 =?us-ascii?Q?pQnHrNgTS0xi6ZcSI1qg74MYuEy5Yi59v8lDWHbfN0nMjoj51bIYh4yc5kr8?=
 =?us-ascii?Q?uxCeCUYIrvNgVNQM4jTjkOtFsPFdj0JtrNwux1u4/9OebUm/X9MWuyH7rCsf?=
 =?us-ascii?Q?t5fFkRWDx3rVaxPM/A4PmpcxH1zCYkBgvEi0/dbHPRi+ldluY58NsI//jNh3?=
 =?us-ascii?Q?QSPcPN43ISIinhzMJHRPPjN0lWe+XD+TNTpSat1ZPtoy2Qw9otp+8Vr6CgMc?=
 =?us-ascii?Q?GQRZGpbEQAGJiqPoeg5QgXtYUSBrAG5CsmQpRmNRFji4xEpgHYCvbSEgXzKk?=
 =?us-ascii?Q?tUm5T4f3MnofVI/lz69fMdrx5QkKhQsjfuiFC5XwP4+s8X+zOvmKtAGpI0sm?=
 =?us-ascii?Q?EXOEC93CR+rgmeQUUJSbhsy91qkNXRNViayUSHdFhsDtGYTSqeU1/6TnPkqm?=
 =?us-ascii?Q?FmReuNtl/cKBE8Ntb/HWbNv4AN0DjvC0crlqR0UpxI2CCfdzexLqtNzfU8XF?=
 =?us-ascii?Q?FdLFAiyM3fffzIF+hmjGnkOzh89tnHn+/t7r/IzYAeWomGyQ+gDEtrIC+nsc?=
 =?us-ascii?Q?pgtDSNrSGxbhCQu6gULIqLnKvlphcwsivwztnagQEPOsziIs/c1kRyHrjras?=
 =?us-ascii?Q?pVnXt3jQrll53AbgGH6AMsSCqJlxRfmXOKSfsw4FUa3tJqWE1+hiYNnnp1Gv?=
 =?us-ascii?Q?mSKYSicSPXbfs530OPMTvsIDtFDFUlzlF1oJKo645dJx/SiI+MMlANBV6hvI?=
 =?us-ascii?Q?ZZcMyAM4WbYN1e3qSoM2yQeOeyana8XJPaODEcu5PYBH4CubsGu2SynCECTR?=
 =?us-ascii?Q?HInXsZuEMzXzQbXrdCY5ToEqfgPTfGY9Xfc8UzNW7XeN2rCxKAJKVjZb8lyW?=
 =?us-ascii?Q?1PpEmh3zzF37E7irt1ehrnQlolSzrNCJ+fN2PvppF0h7pgig3gcPipKuz6vh?=
 =?us-ascii?Q?VcubRfLUGxQwy79Pbh814s5+uGhbq7Y3wRNHl9LFnXeDCjPMM27m6eqxXdMy?=
 =?us-ascii?Q?eK2rpYBdmFTSIdjg2R7WDjK4O9FLFhRbGnlMT3QxA/bqrSdt0kGY9eJy7Q2b?=
 =?us-ascii?Q?q8iKLVtSXbs+a1LWFeYhQvtD4r9dVs1jObNC19J0jDWrbWEWkJOx3tH2AiUv?=
 =?us-ascii?Q?MqjFszxoc+4bTURDKmET3ZZJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbpfqU5t0hLNI1PWuPfEozp8oc02GMZ4kEZrTYbImUeGyYLfOooZLJovVkr0?=
 =?us-ascii?Q?wgV8yuFtUxIOl62lBoDXOKTVRZvTsT5zP9Hk8y0pDkICWLJTVEexKuB8tzLv?=
 =?us-ascii?Q?/Wb55U9xS3GcA42ZA3/g3hZZ1xrpTLAq/JLdasAlt6GqRNaZf+oAeFKzrY1K?=
 =?us-ascii?Q?AMkwBJm296pXwo8qwLGNbJRPwLqN0vCG6KsU1H05bXJq0Tu5wH8kXcMSsdiG?=
 =?us-ascii?Q?tjzDYjgS2TaFGlePCaCD3ThwfGjLuKG5wtsJbu+oPO42VbPILOwKOBsWHwdJ?=
 =?us-ascii?Q?2pfhJNWHvUBEfL/FhzvqP8UtwXeTZOpjojE/AeZNW/2LBXHe883sMyJErzLX?=
 =?us-ascii?Q?scQ6+q3ZJ9wOXnYFXfP8OA9Tnt7/uyw/ylB48K3OHLhavjznBdUoYOwiPz59?=
 =?us-ascii?Q?bgbaTlWRN7545UpsS2IH21ZCNMgIG64gGWucLFX+22NQdn6NsaonP2it+TU4?=
 =?us-ascii?Q?6tMOS3jHE5WNdKih5sMLnVM09o19A3Qfzm0PGlwRpTSvt5iY4kAQB46ER1EI?=
 =?us-ascii?Q?08MKOv49O3CArUQCbEx3RyJ0/ZFTulTIP3/vOxD81ErIupel2d6UWipjV2KR?=
 =?us-ascii?Q?NRyLRrTLNRZHnZcf/UsikWXbE7qm2gblLwWpYXvB7wbabmat4z0A0Z6PcaLG?=
 =?us-ascii?Q?xA4l7saMGlKDc6KSGc5avd39ej6EflCqU+/SRMtL8P2xFuiRBwLmvFm/vt9O?=
 =?us-ascii?Q?DItpqXhPL4Tfc9qNUXlfCY/gplpGnLgrBF/Iwpb+z3BckDQnuF3gkswXu3Q4?=
 =?us-ascii?Q?ltcpL7q6e2+W+JiE7oGxOUqGvU8MrrdelYfaNDjJpvqleTdoVEopTf7QA8dV?=
 =?us-ascii?Q?G23FizILhpHwpOjahQnsS6bv4d9ZL261Lom/usgGInIQnah3N8ZhldAscTIs?=
 =?us-ascii?Q?r1PyPletpRATXCsvNugoeW0Nr/NHFxDc3ZL+ATOX1siGiV/Zu3KFQAizfE4S?=
 =?us-ascii?Q?ii+F4MKSntea8mujltI9KiTy6SJyNjm4hT/nD19RcfEKyHRl3ASO8+yMxTuV?=
 =?us-ascii?Q?Ah5NpioAYC7yw0ze/6LdoWStXiqrlR1WjgnRLN/paBaFyMXSeOySHkvZL1Kw?=
 =?us-ascii?Q?QcyJaCFacnbFiCarNXk9YcaBkKax2zjW4xdiLoEJxkLyIGNfCbbfERqjY68m?=
 =?us-ascii?Q?FR8WvO04UArtXccp8Elsvz/j7qLcI2pNonLkf//+orSpW0lSoiYPrMmuKShJ?=
 =?us-ascii?Q?8XhjLMVWC4opODDNr2uTWlsZt6fe+51HXXg6ta6cWwSuqQMoifC/mwrUunH7?=
 =?us-ascii?Q?rjxjz8F+ofpxYfHIaDdFfFIdglzA5pvmpXVF62L1PEqcbRA+ONYCDuKWY+Mj?=
 =?us-ascii?Q?Rd7XPlrG67/zGphE8Xt+n5hbuaylQa36WAO2zURw76QGf3/0U8uNXeOKjLJ0?=
 =?us-ascii?Q?nn8GXdQNskaCs+g1o8WfGCzNW+2bqgI68BLKRRzPjy69lNKqDNd/X8Gx3nS6?=
 =?us-ascii?Q?u7sdgHR4rsSVj8aTAqGdD0yIKMQBLgXCS/3g9dlyglBGkWNjVshKGFvFdlkw?=
 =?us-ascii?Q?GhlV1nl78EzVq8JvYnnsCXV1/Ii9pg1/ZDqyTWV77SGu3gTusONE/kmJFn7n?=
 =?us-ascii?Q?rtL44Brfu2YA9SfNcoE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a971ddc2-7ec8-4d80-54b6-08dcf84b53bf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 18:55:59.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8x/B0slRZQiaw/N4D+TW2J+ENlmC6+470DZx3K4y46uYydmDhwkgVYV3Al/ym9zZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_115607_138772_F7735EAA 
X-CRM114-Status: GOOD (  21.69  )
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

On Tue, Oct 29, 2024 at 09:18:05AM -0700, Nicolin Chen wrote:
> On Tue, Oct 29, 2024 at 11:49:07AM -0300, Jason Gunthorpe wrote:
> > On Fri, Oct 25, 2024 at 04:49:43PM -0700, Nicolin Chen wrote:
> > > To support driver-allocated vIOMMU objects, it's suggested to call the
> > > allocator helper in IOMMU dirvers. However, there is no guarantee that
> > > drivers will all use it and allocate objects properly.
> > > 
> > > Add a helper for iommufd core to verify if an unfinalized object is at
> > > least reserved in the ictx.
> > 
> > I don't think we need this..
> > 
> > iommufd_object_finalize() already does:
> > 
> > 	old = xa_store(&ictx->objects, obj->id, obj, GFP_KERNEL);
> > 	/* obj->id was returned from xa_alloc() so the xa_store() cannot fail */
> > 	WARN_ON(old);
> 
> It feels unsafe to carry on the iommufd_viommu_alloc_ioctl() until
> iommufd_object_finalize() as the function would touch the returned
> faulty viommu pointer? E.g. what if the viommu has an even smaller
> size than struct iommufd_viommu?

This is Linux just because the output came from a driver doesn't mean
we have to validate it somehow. It is reasonable to be helpful and
detect driver bugs, but if the driver is buggy it is still OK to
crash.

So you don't *have* to check any of this, if the driver didn't use the
right function to allocate the memory then it will go bad pretty fast.

Improving the xa_store() is something that will detect more kinds of
bugs everywhere, so seems more worthwhile

> I think we'd need the same change in iommufd_object_abort() too.

Makes sense

Jason

