Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB52C107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow67b7y5mAv0wGYhQo/ymevkVDjcCzlQ7smpV5U0UOE=; b=otUSX/oQt7NEdhAa8Ctuas+Wpv
	buxBzVO5NP/COQ3JB2lSvoSuZQS5bBiEDGEpxDM+efQFT08B2sPyIjQyqb3cRomusOVCOBYyBvUwJ
	K2Zyp4tEV0Ih7mxjQS1dMHul+LWeprBpzsJtOcpuEwHplL8im0WRUKhbE43EVVXpP8313mxQ+P8cq
	gX2RMff44oFLI9PgBqov1A7kiMk65Izkxm7YnMy4PFn1w5E8DV4lm1O77hCs3qIZLLZD+DhNo2PTZ
	LCSy/0mSqBk4YDIISsGcDQQr4d4u61LDEXyCqefTpLNav2PmnwG5cECua7YbEEHsCDhDlAq+p6Bvz
	+au/6cXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xUr-00000009If3-3orW;
	Wed, 18 Mar 2026 20:28:05 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xUp-00000009Ieh-1qxX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAhtdIReQzM10WEavwBsya8cg8jK3MUCdLFIIII9i2OV8dYCGVilAbM0TJnNiK5DI3tDTZJ2Iq1o8lA60Hb8C+ctgXT/twLD3TqU9OxFB1z+hh162FSu1+PBdzqjJoqyrnfnWVWFmOgFTINKyUQ6p2hctRrWDcx3oz6lB34i85PPr6iMQJlePKFnUSatp2d0StsNhOslM50ApNcVCw69kQQ+q+WIrD5M1iikIiu6FJYNqlSMNGkqfVdo3hR3TJ9itX8RTv95w4UqxxOeN+mqTRLGOo+rZICkBl+qxDtR+w87lgi+uxmDXRjgE4XQWKMBlQB8sZwr4X2faf8cPXT65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow67b7y5mAv0wGYhQo/ymevkVDjcCzlQ7smpV5U0UOE=;
 b=BL/lHxCeg+yIxXVrvgga/HR2KSEzZCgTDXCd0dcTlTtseTwfHR1NdUkgYV5o+14EvZwQkjq85pBLVJiKGCRKLHRqzhIpzW+MpT2CS6a7410eGqpX4aZdm+burhvG1ulQ6wnlWVDAUOCwktueAU85fBeq8oWlhnfPRRfIX9I1UDtvUMQIXhkKefp4G4nctdlQBY0mnSTbVnjYxZQRSLQk4fFg4lNDyth19OnScwF/Srvl+jziKWVFv1LY+EBVpiLP4ksQAF5pMp4Cprhz9DPx9vOtKrdeh9VCYDL9U/lYuYGg2UzQX0v2WyzYl/7+bATsE6imClzkrPLd8A5hf/6w9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.alibaba.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow67b7y5mAv0wGYhQo/ymevkVDjcCzlQ7smpV5U0UOE=;
 b=Ul2Xvb4TW5MXNLypITvvz1A12xiyFfwPMNbIn+xUdF9DrBmpLnQuw+V2LLx/mKDeYlYRO4ORORDUTHgHMQEwrnImaie5rhk2TOUBmxvLYxSXo9RXmGGZ0FV6AC6+Cy7eKI0yfD7doDZf862BxxtYLvEotVlCG9YYCKaNaySkgJtuzXPu2i0a9Sc9mICQt/WpH+QsfcTn9Zc73LyH0RYWf/Z3voeUcbMWanrj6a8VGxphsFh+g1B6+kdJdtcUaFtu2VEpSuXpYzjsHOTNBM1vy+CeAfmsV7hFjKvB/n32+HoSmjczuVo4ty/CSEpZoBVC8D6CRJGenXez8MKMyAC0LQ==
Received: from SJ0PR05CA0035.namprd05.prod.outlook.com (2603:10b6:a03:33f::10)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 20:27:55 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9a) by SJ0PR05CA0035.outlook.office365.com
 (2603:10b6:a03:33f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Wed,
 18 Mar 2026 20:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 20:27:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 13:27:32 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 18 Mar 2026 13:27:32 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 13:27:31 -0700
Date: Wed, 18 Mar 2026 13:27:30 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<bhelgaas@google.com>, <jgg@nvidia.com>, <rafael@kernel.org>,
	<lenb@kernel.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<vsethi@nvidia.com>
Subject: Re: [PATCH v2 1/7] iommu: Do not call pci_dev_reset_iommu_done()
 unless reset succeeds
Message-ID: <absKsk7qQOwzhpzv@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <21fa71d59c8ab787c0f3d8cf3e9fc725330fd0d5.1773774441.git.nicolinc@nvidia.com>
 <8c799be2-1525-4c84-b0ae-389cd0751e4a@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8c799be2-1525-4c84-b0ae-389cd0751e4a@linux.alibaba.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: a69b87cf-7b8a-466f-1df2-08de852cd5c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oIDGyXyJ1vnRM2dx6SNn062pMXqHmHX23BXrM41UADGWdbaa9InU/b3RnQC6nV8COvUZnLgccHnoHNUv4yxrQCH1olI1kMji9dXAUzkHK3233NbwtcoTaP9c1mEQBeZv+BMsqBlmEqEL6pU8X4vWni4tRspk0Wd4BFiIxXtR9/ZihLQD/aMPzHpp84uMBXxeZF+DICjYkqUGOrC3HT3WjAppqsg2kmUsFIzcM1x4y5OSWlkXd3csU8RBw7/fHHO1TSFI5Z0TxLPbFK4ezweO5LMV7Vrl1z5UQQPLHS7LABi08WtkNwp8Bd5zXx/47POCbFLu/mUz390ElFkdGdmaxaDGr2K3PAuiE9we7Fd58TroQ+IjMmdX8fxt0nB1EODT0A0Wp0xinDw2oDkqQyQkMwW2dXyBA120JNsaeGsmkbWvdG+oxXqMn0GVFoKfCXegsUgXWYuMM3O3oSb927+4TuNo+g+S4gCVblK0TjqsOSEFOTHriWVkerCGTcw9gZ27H3DGaqVz7oFQ457e20vwQntZqFf2797Zsc5vxgW+1UnH7AHSfZuXaEwV4WUqY+39jrImKyARUgDqEciVjb9s3Ilo2qO2JYjM8euL3/tVeoskVpna7lkQKrpuSHitQ8R/CSaPNSUUSt2FVP/oFemhTiYpNYdJwjC7KJ0OcHG3aCmP4scN0W54m9YmvL94UksRkLwFkoCuxQ4d5usUGVLbtG8qPHq8M84WVaKt4q6l6dTToGg1P7N3GfDgdcEMw3aFyKNOqE6R0evd/C2wjMZhtA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +/w1K2pBpulr2Ec285bHYFvzeh0AX9CKR7Lk/nvgHaptDkLOqTeeUO3KqcyWNu270uSgZ21Z9wTR3wZE6Nod4MwXj+jIsIycjF6yqvckaWmXvDhTQ4hNBlUWNZWcrLF59Gl7mZROA2MtSrkn9rnhhBId9pu/kkNesl8jRPxxcYkd/nYVmDeYT6O68DQjQJTtQEzDXyHLdiERbOzbA7zsrjfbnj/a31Rw8FQFH5FszBzTs11xfJUNSibYHMfhBQSMmINXsJfGMLN6MEdbJzo7PnyY1N3sgaWV99uKvUhx/2g16NguLW/MS+MxwWvZIJlLE7/jtznS9/lijHvLLzepwQKIFJwX34KNe7SkqnbgNjDkcVkoWBK7Ek3r3PHACGQ5KoeF0J/V0e3qiZE2I8Zbkzp6lWd0u5VBUrdNHKftuJ/69E5aICe1apFse9ZiUIMv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:27:54.3580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69b87cf-7b8a-466f-1df2-08de852cd5c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_132803_507623_8725736C 
X-CRM114-Status: GOOD (  29.83  )
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

On Wed, Mar 18, 2026 at 04:02:01PM +0800, Shuai Xue wrote:
> On 3/18/26 3:15 AM, Nicolin Chen wrote:
> > - * Caller must use pci_dev_reset_iommu_prepare() with pci_dev_reset_iommu_done()
> > - * before/after the core-level reset routine, to unset the resetting_domain.
> > + * Caller must use pci_dev_reset_iommu_done() after a successful PCI-level reset
> > + * to unset the resetting_domain. If the reset fails, caller can choose to keep
> > + * the device in the resetting_domain to protect system memory using IOMMU from
> > + * any bad ATS.
> 
> I think you mean ...to protect system memory from DMA via stale ATC entries.

"the DMA via stale ATC entries" sounds too specific to this issue.

I intended to generalize the message in the kdocs. Maybe should've
drop "from any bad ATS" as well?

> >    *
> >    * Return: 0 on success or negative error code if the preparation failed.
> >    *
> > @@ -3961,9 +3963,9 @@ int pci_dev_reset_iommu_prepare(struct pci_dev *pdev)
> >   	guard(mutex)(&group->mutex);
> > -	/* Re-entry is not allowed */
> > -	if (WARN_ON(group->resetting_domain))
> > -		return -EBUSY;
> > +	/* Already prepared */
> > +	if (group->resetting_domain)
> > +		return 0;
> 
> Could you elaborate more on why Re-entry is allowed now? For example:
> 
> /*
>  * Allow re-entry: if a previous reset failed, the device remains in
>  * resetting_domain. A subsequent reset attempt must be able to call
>  * prepare() again without failing.
>  */

Sure. I will add this.

> > @@ -977,7 +978,15 @@ int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
> >   		ret = -ENOTTY;
> >   	}
> > -	pci_dev_reset_iommu_done(dev);
> > +	/*
> > +	 * The reset might be invoked to recover a serious error. E.g. when the
> > +	 * ATC failed to invalidate its stale entries, which can result in data
> > +	 * corruption. Thus, do not unblock ATS until a successful reset.
> > +	 */
> > +	if (!ret || !pci_ats_supported(dev))
> > +		pci_dev_reset_iommu_done(dev);
> 
> pci_dev_reset_iommu_prepare() already does an early return for non-ATS
> devices, and pci_dev_reset_iommu_done() also early-returns
> when !pci_ats_supported(). So for non-ATS devices, done()
> is always a no-op regardless of whether it's called or not.
> 
> Do we really need check pci_ats_supported(dev) here?

You are right. It was for a precaution as pci_dev_reset_iommu_done()
isn't maintained in the pci.c file.

Kevin suggested to move this part into pci_dev_reset_iommu_done() so
these conditions can be merged. And pci callers will be simply:
	pci_dev_reset_iommu_done(dev, !ret);

> > @@ -4978,7 +5010,15 @@ static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
> >   		pci_write_config_word(bridge, dvsec + PCI_DVSEC_CXL_PORT_CTL,
> >   				      reg);
> > -	pci_dev_reset_iommu_done(dev);
> > +	/*
> > +	 * The reset might be invoked to recover a serious error. E.g. when the
> > +	 * ATC failed to invalidate its stale entries, which can result in data
> > +	 * corruption. Thus, do not unblock ATS until a successful reset.
> > +	 */
> > +	if (!rc || !pci_ats_supported(dev))
> > +		pci_dev_reset_iommu_done(dev);
> > +	else
> > +		pci_warn(dev, "Reset failed. Blocking ATS to protect memory\n");
> >   	return rc;
> >   }
> 
> cxl_reset_bus_function() calls pci_reset_bus_function() which already
> contains the conditional pci_dev_reset_iommu_done() logic. Then the
> outer function calls done() again. The second call is a no-op because
> resetting_domain has already been cleared, but this is confusing.
> 
> Additionally, cxl_reset_bus_function() does its own
> pci_dev_reset_iommu_prepare(), while pci_reset_bus_function() also
> calls prepare() internally. With the re-entry change in this patch,
> the nested prepare() silently succeeds.
> 
> Is it a expected behavior?

No.. This is a bug prior to this patch. The nested prepare/done()
is wrong. I will submit a patch fixing this.

Thanks!
Nicolin

