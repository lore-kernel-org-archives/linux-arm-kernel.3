Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624A2F36B97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6jD9r9ntRBHwVxAW2SmiYXgi6f6CNVRrTKaf/ESCnU=; b=cLeNrVfdep2aYjC0sFR1Z4aAlD
	fBvR1FS10xKIt/CYc0h+YMaBajHmii4PgMbmerYNYV8YgUJSWDUIZpLKlcaW46fAwIGx7y+Plgbpa
	dNB50FiOxE5yoNEiHSA30jDdRH9GGn5+p5xQp/DJHz7pR5S2HSq7duoRqrMEotq2cKchq22Qd/fBg
	tKoldsIRX7HANaLPcJmSXRNHL+1KJB0KzIkFtJwQ5HQDXJDcSNcglLK66+xtZv4Ki9vlkl4OY6S2/
	CgFvywcWK+a5LPJaX9rNXyI3dAmWJSxTW++knr+1y+pDne4/FLzYQkI6DH82BlsrMUHBYuiTKcaim
	ZARLPOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAznX-0000000BN5u-1aiv;
	Fri, 10 Apr 2026 00:32:35 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAznU-0000000BN5Y-1XSb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 00:32:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSx2dLvFl90OmgS5HDBhXSQNtu+djjBhY/VpCMeqyVaONyHZEnvW4uC2lYzhWv17h0OfzVSJp3anz3rJpoIZGgtVt9Mf44AJGXcy/m94+9tB1QopYMAXUMMFo0taj2joptOhtEGOPV49sXr8sQnWfhjWVGpQ1yuUBefbHjvOArUzYQ7J26F6jtmGBvYuNhUEg1Crw0qpszpup79M23RfHwbo1v4MkAda5AUh0NfAIdUjgwwNIBn4wwHKeDsJGHMtj+N6tI5HxdtVZoIVT/DTfMAODR90LSTaACKSEN60/3vRAH1+jdvehqeBbHtNNBRdmJ7zYY5SN7XaTjBA2Z+Ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6jD9r9ntRBHwVxAW2SmiYXgi6f6CNVRrTKaf/ESCnU=;
 b=JfhIeeI4iYQkSwSAclfOMuxVGqc1QZ4pu8nN9pif9UK3KU1msK9eTGlxbVusMRHziQVwNsKxEXqT2G87cl8jg+Mi+EpGVp1DXkg7i3s9HGad1O4XhwtRVQkpE49QqNUNP4ZaHsL3XSHv7FXQ0fOiLuwZ+1uTmEBV+0b6QjZZcLJhGd2DCzm7lUA712jviwLOnLeLOapf3AsS4SPzJsR8C2PMAlI1TPGHxfW9G7KrtNDODpmDVEQuNeV9Y4waUrraJtjQDo3O8oWuO2WUdsZkJ4vu2iRKHnKOketBlBxJtHomkQRM2f3PX4OseQtMnbuAqZJrzT0ZnjvqYanuysszyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6jD9r9ntRBHwVxAW2SmiYXgi6f6CNVRrTKaf/ESCnU=;
 b=BamIfwOdyPZb1epHL4aTNcfB1BEv8iTT0alCFiOEcYLLzTyHnlBKzDSkbRBJrNKLPuu5ebeezyXXmXcNhqNNDv/3+VJZ8H2ggR0YDLdiJgdg6RMyz/8OlLIeH4kHzc27krs2h3nckVwIVvC4uYeYLPP/0/iSaTrZttlhmNgQosTSYhCh05ZtZ9JlibRIDP72aVXtQFFkA0g/mkqG3audTu7/1wpLAJX4zCO8wjpHMgj+nvgUVenKQmukS8oSmF+nwUkOU5DGx6jImPHZaYrq6M+KbZJZzroV4WmWi2clwYsTCR6lnDFrmbi3iaF1KNf/KkOUGWmfs5Gd4Hl+qPKkww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Fri, 10 Apr
 2026 00:32:25 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 00:32:25 +0000
Date: Thu, 9 Apr 2026 21:32:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	praan@google.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v4 10/10] iommu/arm-smmu-v3: Allow sharing domain across
 SMMUs
Message-ID: <20260410003223.GD3357077@nvidia.com>
References: <cover.1773949042.git.nicolinc@nvidia.com>
 <5293b61417f96dd58f25fe797e7d0c20dbe30da8.1773949042.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5293b61417f96dd58f25fe797e7d0c20dbe30da8.1773949042.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH2PR12MB4136:EE_
X-MS-Office365-Filtering-Correlation-Id: fef5926c-8e11-459a-fb02-08de9698a2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kzJOooPpcEYbdDpAuzeaBHZNmrEfRJPneSBdkj3LejpqSy4jrF+al2AjvuiusCI3BC2lTH1eBx2LsWeX3sdkOfeNfeqMH+Hdr7RjM4DGd8qWRq79Upn2DlJ/2tZZjzMlvoqARbjLNVTyq1tLnMt/udPZBmcV4T3GqjhMnAmpxvunRqD0Cbhk6CDPwmV+SU5NomTB6YJMKGH5j3+N9Op2W9M3fDzEAlNL4OW02zsKK02NpAL6wJj6PU2XRO16xmQKNwhTeaxL8kw2840uCUTr2xZWlWXz24Qs0KqSJlC52wMAaKGIrcOtwi/MBPEbjBVIovns7TRT+CEqE7JHycWBBnqOkdIkQce8cbKwGoOxEljQHtnKtwjPQWwsMg8nh0Bmpjo1FdljrZgyFz1iipARTN6Z8njYQmyXjnOQGCi3kBGcfxCqBpNzfHpsY1zLBbqBIC+ESEyS1cSjQv2oE5zSG5ooXeIkKTN9ltezUGPE5U100D8dqcTp1RUa/STM8fN+odiRBHFfu0EJvAOL9HkbA8Xrn9IzZOdf6vzgPySXNNlwmIA0hnZpuV71btN1I9J25pFqmrtbuCxPeML1af/TZOe9G3+eVV7uICzIBM+I9p/6RJH4r0cGGYVDmAApuOzWxGhahjLfI7WbehMU7JfZ0oOpCqkoW+ac25WoWLU1n9gWO8onmhV1vXEZGBZThM2J1sxxey7s6uDDMbfbO9nLr0wS2JtZdsHYiE+HGDbYtGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f0zrUwsi6CXffqR4U7EGJpMGovNu056XmztbYpYxlV8avbzYKdvS12yezQkt?=
 =?us-ascii?Q?n8IQ7l9Nui+3W9XjLmCyzh5HHLy7kEhlZcvlAkifCBSNbmxh5sYs9F0DCng3?=
 =?us-ascii?Q?uMoRh2mXy2Sia8PEOcJP9xrt6i+v6vQES6lBtywimjMjOVrgGOOOBKnQBp8d?=
 =?us-ascii?Q?r/ehyYQbylk4H1cuaUT78dvD7snW8fYcZuozI4nYfUNVEjFl26ugDn2klyq3?=
 =?us-ascii?Q?4izXDLu+dDG9uxrTcK1fu2X6zYa5XwN5X8/7Umbn/cjfkWp/ul3oUz5MFRf2?=
 =?us-ascii?Q?L+qopAAoZIGE2iVeZSts2dF1ijko12ruQtPhcO5P86NvZrnqHKnEJawXHulD?=
 =?us-ascii?Q?10ipWETBYUrBXAcqc7zyaYrWX9lB5Df59s/Fl5uny1DonDlXIgFFxCwplMEy?=
 =?us-ascii?Q?3qbz3tM1+D7E/LZ9uUApC3Xr4eTl7LuU8fDG4IrX7IozzC2nHjnei9xuBem2?=
 =?us-ascii?Q?vGub1oylFwoK2YZuaboHHM3TNlF3ZyjmfKWkI5hlKgFUljzj7OT5DBcV8hhO?=
 =?us-ascii?Q?Zk6za4DwfMtHv1fbUeOLeGvK0lsOzZ+c82JwvDZPpEZEjLHCXYDlJytBULdv?=
 =?us-ascii?Q?Z7APscV+Vn2DZBpyU7D44820QOHXt9/J5y/1WZgU6SJ+XXxAcLsk0F8GaCbO?=
 =?us-ascii?Q?4zzJljiia89v/CQM+rGcbF4hB/TE5JRxO48b+1LIIcWmEgVx6R826Gn7ed4o?=
 =?us-ascii?Q?4Wdp0CDaTaNpdfbzYPeD64vtgQ5AePrhnI7vNMw545e6V4YtXnWSclevdXME?=
 =?us-ascii?Q?E8HXUN9EBKwsmc0HGJI7ROf2MX+NaxAwl1nNGwWmhZ/Fiiqi+43qN4gpUdLW?=
 =?us-ascii?Q?Wjh1bZimYhSKEravghabh5xfpUdsEaytfwPP9wiEzsLNUJqG7T3Pp457b58n?=
 =?us-ascii?Q?q0/zeJYyWbjry0+45qzOe6lRP6PlUy1UzRNoB+bSKwnDCxrnAZxXgSe14I1H?=
 =?us-ascii?Q?mnU0/tIrl/qIJDO81JLJAA5o6bJS1NWkRgTT7JG8zahBXeJzUPItlj3P6nHM?=
 =?us-ascii?Q?TTwRHXv3mXW7fOidcqKxVeLiyLp3BUukSmTOuzeU5Crnjw0kPEB2cq8PoEwk?=
 =?us-ascii?Q?rJsMuP2n1SFhjvRvcnbSXDUdDAt5QvRncGB23XdGWNVz2nAYywZnR7znAJDR?=
 =?us-ascii?Q?6iy9ZNcgsvRS5Ru+L1S5LIw1twlhvTH60fODIBNWf/oEyU3tVvEJ94KFzzAr?=
 =?us-ascii?Q?qrOob3akWEofhGNPx3x5cjUIc74uyZ82TmIVCY4ZFpzA7PAZiA8n+fR235Em?=
 =?us-ascii?Q?siWECpwEYLKEhnZ5Lg1uTMbSvR/aoRWNscFn9STJo9gOemM8EaFJ5/buZmYs?=
 =?us-ascii?Q?LNPcBJYfXTm4PgW8Z3g71oMd9SZ9nowKK0bAr179na6PrM0G2yeNDDnvGLuQ?=
 =?us-ascii?Q?lIwS+pDZrPtKOSTS/Ta5TVc7xEYQN6W0B1aYhBU5BQkF7AV+3ZO4IJjppS9h?=
 =?us-ascii?Q?1lmpCPXlL6XGtEfQtrsORZskH/6vi/KfYmi0xmceBteEeOBXcksWHZQb+wAp?=
 =?us-ascii?Q?0cQhdp6mbuIrjqVXypFP/dUW2L1Bz8zYP5sTQCgr37XhkLSEY0/gv3QTJPXU?=
 =?us-ascii?Q?2JHwvHwetII3y7hApi/Ry6Jix8M/b/WtRZEolIpWmnuCwQmr71i7wV6idSR2?=
 =?us-ascii?Q?afmvY6hQxLIC8LZFJXQAXwJeFc1dyqKl8X8WcaeSTT6Ej4JrwW3/dYJFkvhx?=
 =?us-ascii?Q?F/4fiO0vo1H2IBkl3HeCMHPUEX0s9eDc08wNWEI5RgtTy/3Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef5926c-8e11-459a-fb02-08de9698a2fd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 00:32:24.9480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYm7p6ENx2WD8LVoBAYip8KzSGWh6vtiRmVFEVXBYk5dh1W/mA6oTluso0Bv5ofZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_173232_415082_EF44C77F 
X-CRM114-Status: GOOD (  11.08  )
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

On Thu, Mar 19, 2026 at 12:51:56PM -0700, Nicolin Chen wrote:
> @@ -987,6 +988,32 @@ struct arm_smmu_nested_domain {
>  	__le64 ste[2];
>  };
>  
> +static inline bool
> +arm_smmu_domain_can_share(struct arm_smmu_domain *smmu_domain,
> +			  struct arm_smmu_device *new_smmu)
> +{

Probably a bit big for an inline

> +	struct io_pgtable *pgtbl =
> +		io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> +
> +	if (pgtbl->fmt == ARM_64_LPAE_S1 &&
> +	    !(new_smmu->features & ARM_SMMU_FEAT_TRANS_S1))
> +		return false;
> +	if (pgtbl->fmt == ARM_64_LPAE_S2 &&
> +	    !(new_smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> +		return false;
> +	if (pgtbl->cfg.pgsize_bitmap & ~new_smmu->pgsize_bitmap)
> +		return false;

I think this should check the lowest set bit in the
domain->pgsize_bitmap is set in new_smmu->pgsize_bitmap

ie that the selected tg is supported.

The cfg.pgsize_bitmap is something a little different IIRC

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

