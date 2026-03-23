Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A204EFC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 23:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9Da5k6WP+86JacWrLFEK3tG8Zzl+JGl1sXrsfbnrzI=; b=ByQA4xDu2l8h9x3FqpDVgFn9GH
	oIa1Sx1x8zolaFUbnZmuHt9fU/SIpBvWhYqVmMk5gyRwDdHG9FsquFZdUhUkHXPRC9PU3N8TGKXcL
	bvarQtiR8fK6+trK8R2uhqlrVzv4u7v6UFQjmH1v2/Cqj0i/4g2aPkxYmeatfTAEt7Jw0cFXczVmf
	+ZKWhfDh2RWXY5UyMqoKK/gxDp7xDqVMycBwsnLHa62m9K7/D7TbadxE9uf/HgaH7irEUgwV7Xy7X
	Xo9OphW1eJjTwn7rjshE8nQc5YaJWh452+wGwhQQqdjfXMJ0A22A4JBGKMcUVSoU0SwkPhI37pSch
	a1SPuCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p3I-00000000AlF-2mMg;
	Mon, 23 Mar 2026 23:51:20 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p3G-00000000AkX-1Fex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 23:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEVZYlKXUvZtJra2VPKC9nPliZtnqw8Dw1LyI2q7QmMnuF+M10iHo8jL2zCbGriWZWOX0tRgcDhAUEp8EntIYcS746hRZMA+NY1RW7Ll+qnOxTb7EHW6cr8CqPjietN0xaIRUTsqZm1+kLdya5WuNAd9oVZA5uoZqV3aEbOV1OVTpYWV8og7E4e61dWXRc6AcP0o3qP92HN2hTXb0dhjDoJyebwZdyeb3YTYSOpq5oN2vX8rVgVr5e0u9SNTOjEDIktg2vAYBS3Up83PQCifhzw1QDB0q+bMkGAJXM32rzrnXreysk/0A+E5lgEniPmpc7FqQUI7DyRWv4kyHU26BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9Da5k6WP+86JacWrLFEK3tG8Zzl+JGl1sXrsfbnrzI=;
 b=q/D8DB+1+Kv8OSdc7c03a1KLT7SJ6YKKfjOpbUAWFD8zLKSM8XpxP+R6MXYyGYY8lCuMUtOwItWG6zjCDVHw0t6mIO9cfxC0Mz4cLFAl+n4dWs7WkQLtoHj7bDYbVDnhYqIHizyBTnSTDwL2LD2DbkM6fdC5PpOPqcNrOjS9bl5IJzpgKJ/s7jvTBhaUV5waIDvdp+PcdogD2/U9DU1Sjjmv816Fr22fbOOq47PwP02+Kd8yFjz2MR2yrU3CIVtJO6gWpOLCb2hPmA52U5VQCdOmCvDyZd6dGt6M9MNTu2ZOZja93dz0WDHUaK5ciLme/QOguVFn6BP4VlHGX25jyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9Da5k6WP+86JacWrLFEK3tG8Zzl+JGl1sXrsfbnrzI=;
 b=ps/VWFgIn8e5chzoUrG42nTE7wdCLG3ZA5d3XdFyFyOMbWBh2kAAiF8hnfZdQxgRW6k1tboVVZSZdvD/yjTB7mA7YkzgGeCRvgvmjJc0vOyh/zgiJeprFBwLRrz/fnpPbzjQ783jhB2jjLXlEdT4veDQKiLf7cm1Vt/dguhg4YWLrQPdliwBPJ3A8P9i2q5LcdUpmsrDtr5Hy9fa2494gSrkqpZLzu/b0ORE9VKJc8fEOfpk2DRkO4xGcuUNosRM2iONsqXXVXgTDTVsqjeaHrQznWJb7IPhXyo+EWDAWeW+uFZqlnatDhiogqLQzXa/YMeL267UcNM471ADGVVVwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 23:51:12 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 23:51:06 +0000
Date: Mon, 23 Mar 2026 20:51:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v2 4/7] iommu/arm-smmu-v3: Mark ATC invalidate timeouts
 via lockless bitmap
Message-ID: <20260323235105.GV7340@nvidia.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB52763AB181F5213FAAB4F4F08C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <abr8aS/MDU9aeKu9@Asurada-Nvidia>
 <absaKimeI_TXXxuu@google.com>
 <BN9PR11MB5276467C1933E19E98277D378C4FA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <abtphBuLiXxSxmAy@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abtphBuLiXxSxmAy@Asurada-Nvidia>
X-ClientProxiedBy: BLAPR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:208:32f::28) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e49b6fd-1530-4970-9fab-08de89370cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HLHKOQhSLHj6zwyOO+6/0WtmbNuHSljMC4NRQ40DqVj4I2VK0m9SHDUKIxnywG6bEqUC40zWwDFqIsGtGa/dxcGSmNquJd3/1xEVh/nbCR014WSPwodiaQKVTpKuXVHntvxPli5ICzOE255Njsh0MC03uJIlxGpbCPmXeKqm2cLpjt0sSY2mtsfmCWa2hvUSb4VzmNZh+lKjFrEekcPzr6CvYcCzWJTPvcPS/GB7Sp5C+SDKi/FrOlzpnw7t9jYSolts/ouoRiSpNOeC8w+PkzJgRVtoxotkq/zmlsiyE5tZuBEWCuxtLcK0pZ3QYv/yqTnQ/jzPo9tJAlFs1fMFOS2hyO8LJXZuJcD2MUYZFvJwG9atFYiJMUT5Yex3Jqapg7AijQzERF6FhAW76eV28joJTRUqa/Uk8gRNuf+MPeSYsZtM8+31/EtRSy+7z9/3ogPPRg91pjmXBcB+l4+GmjiBgnPkRuh4j/fb9vnnPg/uNeXAEqw0RFvWVeSMgaVcAL2yhLED3QpAsi8tNBpQ1zu/JOY22N8OPMPcOGG2xHX0dEUzhDqATKfmNx7UV510A+XgcW9bRKKIRrhyzDwNROyzK1/G+SzbV25ToNTFS5Y2lHoEbkzgT8AMctR+UdDuvP5VKI3JoO4p//fMAL9d3gvdmPpynRBOEreB9Q8G5bdYgQVFnHdZKef/T6teITojAtLqia+D+S/yjc8ZCj1EyusNkLJuHrc7l/M7mB5SG3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RlmDNlTw+Xa8PNt0KYnrpjD6gZsvtPWTsZP7rrO0TqUUGojaw/fkP5cT2ADA?=
 =?us-ascii?Q?0x+2FzpzZkXF+WzXVlby8E66fABd5DKbL1DWVA4oAHedHNwfjIVIvfT+vPfP?=
 =?us-ascii?Q?h5zqWfE0wQioDt7pBGWky226CUKEx5anJ6ws+MWquK3p8gxod6TD3wNQssiz?=
 =?us-ascii?Q?UPPDIb0dD/hI9riRn5gsLqnPPC+29Ej8RDny5yUfH6bD4ou1waF3fQL8RACP?=
 =?us-ascii?Q?Tamz8Hr+UkC7e4rD39yALk3HEwPYF8NpjE8bLnM24IQyt6nARvyENelafi/o?=
 =?us-ascii?Q?o2QP/sbax0dzMlbfTZndw5eeO5tJVArAwNXL4NSEeF2emI50wMGs8qNPIqTd?=
 =?us-ascii?Q?OIFNyuDG1Ebj7UK8RRX+BvhHmjgneYab3hPYrrwhIqzsKXndj41YcCzZ8ysZ?=
 =?us-ascii?Q?wQK+H8KfcmthlD6/wukMMwLO9bat+233Nlni4m7fSUR8kLxdJu/3iesurTu3?=
 =?us-ascii?Q?gFrRRIaOhuHX3+e+N1V/P3NQgC5gqXr4tZrPt+jjv4YHVy7hE+l24EM+ucm9?=
 =?us-ascii?Q?8jgRizNgjuivtrfLS4lqNAUIvbjzzUJ++zzhj6tYACvu+TR4h+ZyeAH/9k6I?=
 =?us-ascii?Q?auNa9bNgoZa7t2Xi5Ia6DYCgzcIjL6Of7wt9O0Q9C2ErBZJPKOOjOm3FjLEM?=
 =?us-ascii?Q?035x+FGUKJU8h27iyk3P4mQ6LGI6HzsCBEOvbtAV2FgRjCju/CQ2TAnQecX4?=
 =?us-ascii?Q?rdSllFLtTfPKtdeDIej6078MZ86RIpJnJ3oca1FwAlBg92/n+Zav0pSENK/z?=
 =?us-ascii?Q?5wmMZOjri0vOpbS6QANGdsGkofeKTjtJkoRACEWRzi3v7gAYtwNJgUfTtDDI?=
 =?us-ascii?Q?Ql9cVbP9tLFOm+h8yTdVcjXWw9hTzfQzMQ7Dqnu20rI20XJvvLx8peH72FZd?=
 =?us-ascii?Q?OgO+AW3kYDtAwR1fOGomCF3sxHSMTPSJqjzZ9hi/q0skP5nkMHFwHSNs8NJk?=
 =?us-ascii?Q?N58zwvXBLr4mhZnkn07mFts4NBYcTcS5up9FZfyBsmFp0GBaqBCdUR5PpxkP?=
 =?us-ascii?Q?dPniIhFSVjLmM112CJwjCkk4DCN5dBSxfe57a699WoTHhwqbFI10bMSCymaO?=
 =?us-ascii?Q?i64xVRmfNnKKoMT2K/bi0OcN35ZI3ZYHcHDil5ZI0KTF5SBZknVs4KppxRfM?=
 =?us-ascii?Q?YrE7W7ei0rs0hnHwADN766/3eFZV2E/SumXn834MWQcmlC/RKHf/JRHCaIGC?=
 =?us-ascii?Q?RAUWQQQd1Mh/7MpmuKKjNiq/KptwVzVBdxmNfJWDFVRM5GqStLpxR7PFXEn2?=
 =?us-ascii?Q?LHI8OyFx0Ejr4zLMjH/qPy/1q+1u02Bb+xP8dtDyUnhqb3/7oH90J5SOTtKI?=
 =?us-ascii?Q?V5CFffYFJzoo9CCrDN4yc6ZsOWEHuYUOnuCIaDu+Ov0LRmqYYVAr1gTHEP6Z?=
 =?us-ascii?Q?/HmCZnoSEe4tBlWB1fXD1AKOVW9TSYnYOlFF9gXghvmt3BHfZrSPMD4I0zQn?=
 =?us-ascii?Q?XjKwJavL1XN81OSOeUbSXeWt65W1uS1Hx6HvGgPyYj2lplLG6eQguQkfFPOt?=
 =?us-ascii?Q?F5ezObige9qr2wRM2UYHLkZAJcrSo4Zt/QI8s+L30N2hkCaSxkb9vaez9L0s?=
 =?us-ascii?Q?oMZ/rsLlS9UdaSYAxGJEju1dkP/bH/QQIQ1WjSohyekdjcx0KXffVW3naTm3?=
 =?us-ascii?Q?ug2LxseAxN314uI9vRfDTPXMc0Y6kBA0Ny1FKEmu6gvHY/GdJ0gCASM4P1UM?=
 =?us-ascii?Q?aNuZbBkpa2NFMkL62hRpNjhRMvRhboV5kGMvsHvmuHGh525G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e49b6fd-1530-4970-9fab-08de89370cb9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 23:51:06.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agLvMHNcC2jBXFgxka8e1P3JTkQpLcNbZkfUfZGhKXmpTsFIq2Q2WZ/1bmsJg89c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_165118_336440_E5C95744 
X-CRM114-Status: GOOD (  13.15  )
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

On Wed, Mar 18, 2026 at 08:12:04PM -0700, Nicolin Chen wrote:
> > > VT-d is able to find out the SID of the device for which the device TLB
> > > invalidation timed-out occured by using the SID reported in the
> > > "Invalidation Queue Error Record Register" (VT-d Specs 11.4.9.9).
> > 
> > yes. but when there are multiple submissions (each with a wait descriptor)
> > fetched/handled by the hw and then an invalidation timeout comes, all
> > pending wait descriptors will be aborted (not just the one corresponding
> > to the timeout). In this case all affected submitters need to re-try.
> 
> This sounds similar to SMMU then.

Not entirely.. smmu HW stops processing at a SYNC and waits for
everything pending to complete, then goes on forward. If there is a HW
reported ATC timeout then it is contained to the SYNC that followed
the ATC invalidation. The errored sync is skipped and whatever follows
continues forward, so it doesn't contaminate future work.

VT-d's wait descriptor with fence FN=1 sounds identical???

I guess if FN=0 then things start to become indeterminate what the
wait actually waits for..

Jason

