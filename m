Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEBECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 23:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQfkFNQtW0voCafP3rIsWGDAT75gymOTMruIJ8hCZ0A=; b=nGDVu4q65HJUjrchpaqgrLfNjC
	S1V6t9WgZWMWhZkfQPFnC7EjXa9jDFkt40I8yEvIvhBfI3M5uLpE2Qhtc1iCnus770vbloerNfQQs
	2qfXB+wo3G6Rh4pTQNECmZYR0kLTL/f4jckhx8aILFwjshTBAKIA6E/4fOesdPJPyWO1ajrwQ5flL
	p/rO+Wi+anTjP/Q/zRK7fGzNyXDthKC0T5+1NdEOyNxZIz4CkOEqBW0lRQwyAMFZhfFKPVe7F8gzv
	YJPAWZLoZhoKMR802qik6oQ2010g6WHLx9H1tCkn9f0ehnuQkS6zEDxbQMxnl6jcrUJ25/cN3oaL4
	QduDl7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPTS3-000000031ZE-2rNL;
	Tue, 19 May 2026 23:02:15 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPTS1-000000031Yf-2fsf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 23:02:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9i0xMaA+qopraGWrSFPWmuz16dlEOrTvBXcDrUl3eIkuuN6P9XaJWM/cz4OTxGo9uwhokZw+aNlSLbxUMmoIJc0L1Ddjr7823yvNJCKUI1dsw1IHtEk+u6Hr0uweUDnZuL1TkuQBRKmstX/hwD0kXIgxTsKneOyt6IHlowAp3rWcMTO+w7ZAP8IhWB6HgyXkVQG4Z9hRerFEs2GfWkVVwLu3mA2Sk8MOX3BO9jxI/PT4lhuBUd6obAR7Bow0C8hVJ2m8K4C1gwxm9RhvcZnjQZLxnR6aiEs4uGtS2YGsuk7abQ0HvIsuxY0g0yQq/0Upf0WRlR6v5ImBbgyakZgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQfkFNQtW0voCafP3rIsWGDAT75gymOTMruIJ8hCZ0A=;
 b=SEb/Cvimx8EDkZ4GsQBeLUrf7qBnvJ0ES31ktqDEkGjEya7tgTEqV1/Jf8eBaHBN/TUvYXP9QUBHj2gQrvVW5ZONrhQVg/8VAcrFFcRMPsGiIo3DVpAAnZuVj4rI1pgw5kQKrtnYIlGq9ON7E/0HxMe6E/p7TI1EJ+58FbI2Vl8wGttVPrnSY93zBBYdTJj81vY8nXEQi/ceI0/oZujB7xq7N3GBGofJ8d/OiklduXitjYZpOKUg6y9IjK4wNJgRMepHSy2U8/svuSNFYMJv25pjq9van54A+Bve6lETA2wwbFfEIoWU4Nyab51M287dDbkIrNR/0d4OVmVXGls8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQfkFNQtW0voCafP3rIsWGDAT75gymOTMruIJ8hCZ0A=;
 b=TcHOSRpZb4mDLZfvenss7CG51d6Spw7bC+RK79TfKu812amBOblTKvpRkN1ScsKla+tBqgByw6d5G3rx+C03GUEFGB7BvUiBgblP3flOEs9/028Obi/758O28KT7hlmO8qGqsuhqWHf4HC1lzM7DXQvJ9NEMEd0EHxmW1glFcpZ43Vwt++w+cTRz4Hl29N9JprpZLtdzuV2Oc/pf6qiLSFq9EG0u/aT7DgoI22EKTASbwKOJrdSZqyYW4ZK7XLsfHVgwv9A4POlpwsGADfUSfshNKkgj8HE+rLfMu98rvJ375H/+wiKuziothKi6Zjd9Z9UW88iefhfVBB+KP6FgwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 23:02:05 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 23:02:05 +0000
Date: Tue, 19 May 2026 20:02:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com,
	Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v4 11/24] iommu: Add iommu_report_device_broken() to
 quarantine a broken device
Message-ID: <20260519230204.GM3602937@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
 <745da1a819eb943f2519e660c8bcfde715885c6c.1779161849.git.nicolinc@nvidia.com>
 <20260519120737.GQ787748@nvidia.com>
 <agysAyreCY4huf0I@Asurada-Nvidia>
 <20260519191626.GJ3602937@nvidia.com>
 <agzkldmlG1cuDkj4@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agzkldmlG1cuDkj4@Asurada-Nvidia>
X-ClientProxiedBy: BL1P221CA0035.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: b2fd50c5-8e76-45d1-b256-08deb5faa56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|11063799006|4143699003|22082099003|18002099003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info: tHYugFSJkbIHwSTurZ1K4NendiHHjPVKa9eGGCxMiz5FsB8ZUvyxzP4IpMkUq/DacTBt5WaqYb9z191kaX+n/LvPqNHRACI6GOfJ9ZaQMhYk+eMoYu60Hgs6AqAmPC5KFjfhzbAHPAoLZkJrQhf4ofOZRu5lhs6ShlSmvjgCcuh1tbdOokQS2XxasMyXF0N6vyxmUbDXqPz1Es5KAiMH2NzSFB2UDrHjnhWDKRVPzd5LkIW9ZJggw+bVWdkob5aspZVjqXlEx/vWsqSll7lJtgjPIL4iozwc0FB5zSJU272scfaL3yDfC3m5Btat+uGiuASksWwhDzfZwqBmy5lWyRAR3VoR6qPdzWexUeqbHeLT5rE/Jgedc7Dqref/Z0IBCRMMkKnbyWdQyyCtrkGkaTrCUz3Sgx7BRkYx1s/ZQEyYPYucIr+OVMljoGpIJKSe7MoS2nUmM8U85canyOmlvk9HFRfrRZENrvtH4bOd0QAO6AXwg5Prg7I3fle0CpJwp+CLa2x66kP36dcO9IVh245FWulUTCjkD4HirnnZ2RHyTgdzxcWyWHCXK+8cQ+T/g1QqlGqw7khjxLZAzBNBBVpbnjaWUdUi6ARuPvO81xvPmZ8XWy2cDs0ilyscp3a8qxbMUwaXTrhFVldHWAXqwzpKTTJCLoPWop9koRt9+0c0ZLxEkfDu8g6nyng0kdel
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sPhVGxc8c3kA4eO/FNj3Lr7W+QCNzlEY1SsP69CnxhRv/i0u3i6pINjVln4i?=
 =?us-ascii?Q?T//tSbCmqTm0oPvbb1hGf5Yt2A70lPEsE/MRUHchdGJ/cOMsatyvaf/TBElT?=
 =?us-ascii?Q?hBZRE/W66FFGnvZCQj4KXB1AAXTe9p2mjsSVJ75GktnVE2ULL/B5smzC3aLx?=
 =?us-ascii?Q?DLMN9Tvu/aD0baExXkFJHSB/vU9tFMarRXpLEjst16NUFcCijniwtO1/Eukm?=
 =?us-ascii?Q?BtJSFyVu31gtPt0ULaDOeoQ4cxneUryyF+6xJPzc7dJULTllhThp1dD7ji1m?=
 =?us-ascii?Q?AnMI+cbBAjaW3t9LW9khvZg0N2gN8+b6L8/IbtWo+7ATeBl9mKcNYXHetx5H?=
 =?us-ascii?Q?phShWHKhLvr0FdrlQWdJoAJvdKFbtqzGwGTLlnJ9uyL+bk5Za32eOK7fsrzY?=
 =?us-ascii?Q?7Lx/e7qHNGGAC/izAtt18Oz6bJyD82Hg+49b02TDM/+6eGSQnUBVRo6LHH3P?=
 =?us-ascii?Q?GKtFd5D5yRFUPn88KlgBv97UzWkNQxMbyhNlotnwsAFrBiOx6ftEKmwsxFtE?=
 =?us-ascii?Q?c6vgbGrxabPcu//MiRLSJvh+BDhw5LelcVFCpl+iqabMhEQVge9+v9Y6fKRn?=
 =?us-ascii?Q?dO3cw5ma6CrBLV/Cz+qhhWmCDrFeNNUn1jqED241kZUaoavQtlVbqLmvQbMr?=
 =?us-ascii?Q?boMOCJKr6mFTRNamrS83lmQZDiD/7SZIAMfVhSKOKZDmltSlGEcUOuSu1LX9?=
 =?us-ascii?Q?RqztmLQn5KhYgyLP2JBo1ZngHEpgqrVTbbu8yWUz8EDwpEjHwuzyLBBt5SFV?=
 =?us-ascii?Q?5HVKfICiSZhe5torcXMujh2+Gr5NmEZ2D9l+GJTBwkEJZspteWqgaXMKtbg0?=
 =?us-ascii?Q?TqpniLFsKYynLXBXg5Trf02QvYtXSuL8zlT/RuXRIEBaNOzBwAHeMOJUvU/G?=
 =?us-ascii?Q?SYUWmtozHV5oxZyCxw+S8TsrKE6OrUkWrV+vfi+mcpCZtwwnaTT9/SbSb2po?=
 =?us-ascii?Q?h/M6Cibpg0hmXHIJFtlwakJJ1GLdK+45CRICNXsYEtSdaE9KyyFFowlVciDG?=
 =?us-ascii?Q?FZfpWDbeFHSB4QhCpBelbZeFQOKXKvenPY/Oabc3DUBCfhetlLhKqpenmbt4?=
 =?us-ascii?Q?XCF5iE7tktnvubARNaEs6Xge3sljso55QDw75ePHLpCO7KM3eZ5+PgAg4wHT?=
 =?us-ascii?Q?Z4LT+mGVbV3GcgzZvE3Dde+4YCutZARtLFA+B8fgPPs3voPIZj26weOVVnZN?=
 =?us-ascii?Q?nVLopJb1zL0apCAiXKqcc4sJjNAQ81evOL2ipkArX/GTrbAt7NHGf9vvFZqH?=
 =?us-ascii?Q?D6tHB63tN4hzGSFJPGBBT+bpKxSO2LI8t+D3bRG1jedPIR1Jpa+DX1WVm6M8?=
 =?us-ascii?Q?9WjgmghfayuPpw16ptNfxF5NkLyrfUa8XPOAO5yjb5GoA9Ii31C0ztfdOC5N?=
 =?us-ascii?Q?gPzyiY5t1mbWBeS5UzFrGobz1jPoahfsP2IAGIldKyEa+Hr0X7PNbly2n5JF?=
 =?us-ascii?Q?Q+Xc3vKdqpjuOwlpN+BddlNFhEOSmnz41AH1Zr+m9wJ5/5u8F2ADN3iLFJ7P?=
 =?us-ascii?Q?lwn+R5rDTOJQkOn8zP7pEj4vSJ6xpqkf9HPZPDOUVtASjlQBt+vZ3HhYnF+M?=
 =?us-ascii?Q?OGBc5mksEKMq3yp0XPW47p/yr/0QlIHNxdTuvN1nVqOGUplV94NVCGJ2v79F?=
 =?us-ascii?Q?lmSukbKwI/bl5aPyVVJs9NYyJgmyErZCdJqxOD+D4+YGRyr9ntx/PhgkOrvK?=
 =?us-ascii?Q?wFLDrrv5XkX9PMvDqfb7nXgLY+Cq/yMxwYY2/reinAsaJgM1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fd50c5-8e76-45d1-b256-08deb5faa56a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 23:02:05.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agKpmoXY2qOCTfLTPcQhTjc6NB+3Y9eoJMdUBGsSFKbncPbjhplcQCl7/J2WL8gK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_160213_681506_C2F11C78 
X-CRM114-Status: GOOD (  26.99  )
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

On Tue, May 19, 2026 at 03:30:45PM -0700, Nicolin Chen wrote:
> On Tue, May 19, 2026 at 04:16:26PM -0300, Jason Gunthorpe wrote:
> > On Tue, May 19, 2026 at 11:29:23AM -0700, Nicolin Chen wrote:
> > > On Tue, May 19, 2026 at 09:07:37AM -0300, Jason Gunthorpe wrote:
> > > > On Mon, May 18, 2026 at 08:38:54PM -0700, Nicolin Chen wrote:
> > > Then, the core needs to block the device using the similar routine
> > > to the reset prepare(). And that needs to hold group->mutex, so it
> > > needs an async worker.
> > > 
> > > Do you see a much simpler way?
> > 
> > Put the work on the dev_iommu and forget about rcu.
> > 
> > But this is all probably better as some later series if at all. The
> > driver can block the ATS and the expectation is something will FLR the
> > device. The FLR will set the blocking and then restore the
> > domain. None of this async work seems functionally necessary, though
> > it would be a nice to have. Lets focus on the bare minimum here it, it
> > is already a difficult enough problem without tacking on these
> > extras..
> 
> OK. So you are suggesting a quarantine at the driver-level only:
> 
> 1. Driver detects ATC_INV timeout during an invalidation.
> 2. Driver retries the commands to identify the master.

I might argue to push even this out to a followup series given it is
complex and I suspect it becomes much simpler after the batch
removal...

> 3. Driver calls pci_disable_ats() and clears STE.EATS.
> 4. Driver marks domain->invs ATS entries as BROKEN.
>    (optional since pci_disable_ats() is done?)

We need to stop sending invs otherwise there will be trouble making
forward progress.

> 5. Driver sets master->ats_broken to fence concurrent attach:
>    arm_smmu_write_ste() and arm_smmu_ats_supported().

Not sure this is needed, if we race some attach then the attach will
re-set EATS, get another timeout and clear EATS. Doesn't seem worth
trying to optimize for.

> 6. Something external triggers an FLR (sysfs or AER).
> 7. FLR goes through pci_dev_reset_iommu_prepare()/done(). done()
>    reverts 3+4 and calls the reset_device_done callback clearing
>    master->ats_broken (5).

It should restore core/driver/hw synchronization of EATS and the
pci_enable_ats() by installing a blocking domain. Then it can go on to
re-attach a translating domain and everything is back to correct.

We do need to push a pci error event (didn't see that in this series)
so the driver can catch it and start the FLR process. I suppose that
will still need to bounce through a workqueue, and once you have that
it can also set the blocked domain prior to calling out to the driver.

Jason

