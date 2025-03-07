Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EDAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjHo8fcPPCrrtDe1nECb+tNg1WrKKUX2Ah5OZjT93K8=; b=Qv4ggiZZ5fttwuj/kQe09Q4xzR
	XtXzrH/gAiw6wi3HnpNdV44v3oPBWGKjJL9uoHq3oulKjzU0Q2yNHPKZ7ZOUsIoSkNJ1rBceEkGAg
	vhMgBanXfE5KsEJz7uYOj2vBy0g+/TJo4Z91n3mRywF/hDep1WnNzGnqZD4zF817jOw+Iea8rDKqi
	30MFtOGZ9VMCbHWRRzbuoXT9R9TdfGT4Xrg7CJtjKvkPoc8tgMButtWIpm6XnkWgCYOETqHx8Ydy6
	qjh71RpaNUQrv8BO/+P2nV6ugdhDbCeBcv/RFGl87218n2dEBkWcYhzvZmOxwvirlFXDSlxAUQKn5
	14gRyX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdwu-0000000FREb-0Vps;
	Fri, 07 Mar 2025 20:05:36 +0000
Received: from mail-dm6nam04on2061a.outbound.protection.outlook.com ([2a01:111:f403:2409::61a] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdvH-0000000FR6F-0D8a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:03:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLeAfdpfFlei9+oe9lCo+TvQq8Hr9Gy6C5EYpo2hnS7g4Vfql9DaQ+CgezTdvdW8DjEMN4gk23K/VcOJp9RDHzwY2XgEyqzJDK5woqfez4OJwiV3sKxtcqNFXkZYGePgQJcEK3nipQ18lxpnuMHzfkr9E9fzUe5ol8nWNaKnZ+78ZAP7abXVhPaCjlFKaB9AF6LqVOWW2GCKTdmtmAirRE8txMVPIQxq5av8IpEFoVCgGZLgnmAFK5kLNHNcnLUBFkPgtEY9O1yWjTDP/Lnrzxyl/VS2D6u6S/UhS2ODM7f5XkxvvBfvm8P/b7c9MfEQGlNN6kdt7FQ+0gCjZ4jXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjHo8fcPPCrrtDe1nECb+tNg1WrKKUX2Ah5OZjT93K8=;
 b=ngQcDXvOKg0vzlaqSd7sbVRGo0+W0PhxKvJ8/9vC4LwarH+e+z1rBcVyLmnGTfWn6OL4gNsgHUMnPiA4onc/6gS1ED7a77A04eelMpJJHPGKPp+OOsgUMCGUNXDsWHFZQD0j6iWh71QtLjl4TG6ZbEdf02kKwGwliKhHY9zeuyenSoFsGEn28rLeyRy9cRIU40KmdBL9Mzb1Ay8Ovsb16FQZJi0B7bQtbb5aPIYvkG3wtfGd4DEZj0xQcO10ZHoOo+FyS2MyqAWB62WihtK+88PDhb0tmuPUNN4nuAkLcn6T8LClw/BXZ1wxBxQxd8PUy/6erec5tQVYm4Gqur6fTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjHo8fcPPCrrtDe1nECb+tNg1WrKKUX2Ah5OZjT93K8=;
 b=N3zqEuzhSYWp7fB3bqNbw9E7Srb7yzR1Ys6MkhFhPDmYh9aDjjnC/y+reyhvQPi+hfwmBep3PTqEBtlW9HYKRcoB3IlIqYBD6fyKns+acRvcvAHOq6BSqX79IEd22fdSeVgxzImtVfGBp5Fe9txPsje5loN+8PUjBiOo3OlTx+CqiEnEh+KLESCRJLRGEnRZM/wpvYIJWPnGXZUYVm3HZp4FkmJMy++SY57KAtev+Rt7xqfhfV++55AO32hpeApqvPk0NgbJ48/0pa8NdVA3eUqKdfTPUmRUvRlJN6WducFswFBZBBjRw75P2XTzdbasuCRd0X1UmyWhp1gsa9Nzkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Fri, 7 Mar 2025 20:03:50 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 20:03:50 +0000
Date: Fri, 7 Mar 2025 16:03:48 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	ankita@nvidia.com
Subject: Re: [PATCH] iommufd: Set domain->iommufd_hwpt in all hwpt->domain
 allocators
Message-ID: <20250307200348.GV354511@nvidia.com>
References: <20250305211800.229465-1-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305211800.229465-1-nicolinc@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:208:2be::34) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c06a13-5988-44eb-3ab4-08dd5db32d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KEUxdzANT7goPL1y20UqNTh1GCNekGLLo2JqVDp6iNUWSERBRAeAODghojHA?=
 =?us-ascii?Q?oJTvTlcHmQR/rloApcg/0FToTI+FrDaO3xmkFRYaXi4VgMdf4cAFGPJqXvYx?=
 =?us-ascii?Q?/QmpQKaKEcKsMe+xhYJ5ofHw/v3CUg9fqU7IiUWZ4f04bQ+TX3fJkL96Yqvv?=
 =?us-ascii?Q?gIx1hRZ4xLTltzloVSZU8NjdCn+SKVkGxa3Zp/QbhBnKEm9FNJLgnWX4oeRa?=
 =?us-ascii?Q?5+T+3jDmbot0FoQkPT7sVOH1hNBgd6mxlNxYanbuov38LI/mc9ERPtWm7Bwe?=
 =?us-ascii?Q?FseSwOYXnF7zV4oqIDq7oLdFomT+vH2FU8LJJLMU9YkvWQT0mNM+hL0rGb1u?=
 =?us-ascii?Q?9N3/FcFVOneWqlQAKdfaZWQU0qMkD8wNnwOZ3TpvUAB0eRBHWAY2XoL+sbdu?=
 =?us-ascii?Q?nzz1VV6VGfhlfwIkNaMOdhZrJ0OXmJJbdAqvAlF4lyd23i5qtWYw31edVZas?=
 =?us-ascii?Q?XhDXHmPxFT8naMZZJzmXZaiNLV3Fl0RGlRtCV3vIloy63jy2p8ItmJNuwFC6?=
 =?us-ascii?Q?w/HXIZiYp2dwo9rou0t9gsUHZihI68l/N0F6sJo/TYLlPwGT6AR4V9t+lgAq?=
 =?us-ascii?Q?mKxBaYR4uskqt6e0XxM8ydkvoHI9HWgQGs8vLO0jL9LMpCX7W3rV5wU099A6?=
 =?us-ascii?Q?sCxgqTWfpqn63nTtmQlZJw4eDyFKTT0/ysu8F19xYzeMWfEu0NrFTb9AliZd?=
 =?us-ascii?Q?jBnkyVwFymqvXft6/HxXTTYLTJ/H9jc4wafY/p3yeewbb05zjntHPDhzCAv8?=
 =?us-ascii?Q?LBCKvoNrtsSjsNSdFNlrB6Elrvu8nS6J+pahWdYO5vo4ymJiNH4OHyMR31sm?=
 =?us-ascii?Q?7IffDOzUI9I6Qyhun5RuksR1rMl1jhWFTfmvrUBwj2sdVOPxXIDChoG2l+sJ?=
 =?us-ascii?Q?QkUIOsy7mZ/oVexor/6gOaVI+7iOtW0RuI/X66sGEjPJoL8ASSmKxBvuL6Zo?=
 =?us-ascii?Q?1KcqUnX33SpeFDPo6WwHTjUbyctgtlQmY5PjToh0Rpi/IIUffZ+lYNlgIaiR?=
 =?us-ascii?Q?BZJyGdS7lOkMgDMMXW1DmJogBQA5T7IktMtFipznPTnpbIr1C96HJt9gKoKa?=
 =?us-ascii?Q?YWpFKqa/cfogqKQUJ474qIodbzO0fFoXhJT8mSfZzJOggFBA7pgmq65hQsOE?=
 =?us-ascii?Q?p4nKRhauj8QA6rg182mwyD/CY0rQQtRHa79U+eqGflrjj0h45PaNIjLS10xK?=
 =?us-ascii?Q?j24KTKsBjNaAVzVr0bVZI2Z1smYu6CxQfXGOVaZ/mvH23JEcw1ukQhA7iimS?=
 =?us-ascii?Q?n3EJo5+fPbKCfepDF8ppnTgElqKrDCR2h7bbgN0f93kCq/efpbyzQ1qNhD5d?=
 =?us-ascii?Q?pg9lGKN1PAZ2bKsgfrcVXTjLJ1nvvJkuYPN2ZwQ9OXxTE90rr69KJOl/jU02?=
 =?us-ascii?Q?3hmGiXq6Qf4yYEFSh0Pe9rkJP5ah?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8663.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQOwLpmy7L801mlHZISALIWGhcVmm0/Xsn/ZfnZnq9lRvvsygB9VG/6B/9OO?=
 =?us-ascii?Q?hfHym9KsPesal5du187b2jHKU/l6OAEkHccMomMPeOLgo+Q0rXDLG+oXi4DA?=
 =?us-ascii?Q?Ejcyq8viwkJ2ci9k5n41SyCsCta7bVBTj36i4xlHl2d+SN+jOwZJv/M4EFHN?=
 =?us-ascii?Q?K77cFWyaMhbrBdHTuclGxFu4/GXc6rtO7eq2i9FYEg1y8V+pZwlgpwE37OIS?=
 =?us-ascii?Q?M1VQbIenlPNUIq+mIwc7GeYFqT/1BWOduFIABgR0+NXFMSRZBEKJYWJ3Pjyj?=
 =?us-ascii?Q?VNAxfWyF4DuvgfJfskHXc5h5EFCCZ6LEMZ355291OfP3V+pXlhcZ3J7joImZ?=
 =?us-ascii?Q?Smqz3qpnsQSPdFt8NwlqzAIu6Cn6SQc0wuPiiq+zgixkBnbLL0s9b5IrIdt/?=
 =?us-ascii?Q?9hsOyn+HeKokBlJHnlsbdQ7LLqQdnAd+4k3i4lsqihEjSLxpyzJHPA4lUhxN?=
 =?us-ascii?Q?mZiPxZ3dCV5rkNeLCg965/Bp4qDkP1J4TS4DMlA27TIfF6Db11fdIrE0njej?=
 =?us-ascii?Q?mfuuhCU5o0lYdHDM7ej2g/yZvO20YjLExL56Y/lMhX+bHw09doF+pamcv8fc?=
 =?us-ascii?Q?UgwGr8UfGqO2cZPNJoyVmp2vBEQRgxDbICy2kPlwIOkgIGGOVrU8++T+iV/E?=
 =?us-ascii?Q?IJXyBw36Z9onOUHwyztRc/A/L7IHkXgm01HTuTbqYSt8hsoqWelPgkMBMEpz?=
 =?us-ascii?Q?NYsKysiqs48LuVP7FY+MOgn965GbUMScWrwgN7KjjGFL5aoODuQAnTv7WPN1?=
 =?us-ascii?Q?dpEhFoRSqk7n6x5YmI2XZxyTASGlzl922ciRurZ2BxcWpJA1O/9ctwRxFN/B?=
 =?us-ascii?Q?BxNNA7oqfEBxmG/2+SZ5tdKt7PW7E3ZJyfdc2/rw64+/NUYDe/QQBbHxtW6B?=
 =?us-ascii?Q?Ehz97TlOJpPrAtD4tMgTjmplnNx5aogkTVr5RMtn19gXiMnIpCM+6naNuX9Y?=
 =?us-ascii?Q?jpQfgBAHtu/bOiNmKOLlISOzHxbaG5um5vpKV/UVlITJeN8MELqiqdpi8ecV?=
 =?us-ascii?Q?3z932tyR7XVeR+24TPGb6xIKdJHJYIgH6UhGVbJus0dppBIHMNN9C3TX0QXY?=
 =?us-ascii?Q?8xM9c21xnTeIJVjfLKg0cglPEhPtPNb4TKHQUQ97mIZ0QOw7InNlLlc0pyPK?=
 =?us-ascii?Q?33UG7poyqv8x9nNBWGMEvjsEcsNUZAxXZSJXXpa/zGgtQDoyiYcIxcMDhqQ+?=
 =?us-ascii?Q?kXdg8wyvqld5RlFNpMRCdnsBww9f1ZdMUt/ChVwcqElh2HdgKr9xGNBa933T?=
 =?us-ascii?Q?VMvHqfJH2CtCxtYTmC8HBp4ZgUmUK8+/6gqMw/kNTUosdPF54iXOYLTpqkIN?=
 =?us-ascii?Q?wwz6rhRwR37EmeQadYz20P0wV1FwXK55ZDuFWN5RuubXHMxqQ0xJTQlwrI75?=
 =?us-ascii?Q?qAlZ8ctmIwh4CiIFeERAjMQsp1q98fZWI0owU4eWe1lcrS8d180ZHRkmL3Vj?=
 =?us-ascii?Q?e0iAMmFmxsbNb6Q5JBmsVPISBoU8fkeoz6gM1tK/rrb4DTXhSXJNJjfTHT0m?=
 =?us-ascii?Q?Y95HuD3Z/VzoqdT2Q+7y1r/JP6/5/Cp2vkBp9A7wga9MZ3PfKhg/idjk0Zw1?=
 =?us-ascii?Q?FKNxKijFuC6PUVG1VCU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c06a13-5988-44eb-3ab4-08dd5db32d74
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 20:03:50.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9IPToAJOGh5Zyss/jO1sdg7u8iWScVT7YjpIQ1HBRfHWzdcQaAP9gSiqewkXJKT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_120355_101170_875A48C1 
X-CRM114-Status: GOOD (  11.61  )
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

On Wed, Mar 05, 2025 at 01:18:00PM -0800, Nicolin Chen wrote:
> Setting domain->iommufd_hwpt in iommufd_hwpt_alloc() only covers the HWPT
> allocations from user space, but not for an auto domain. This resulted in
> a NULL pointer access in the auto domain pathway:
>  Unable to handle kernel NULL pointer dereference at
>  	virtual address 0000000000000008
>  pc : iommufd_sw_msi+0x54/0x2b0
>  lr : iommufd_sw_msi+0x40/0x2b0
>  Call trace:
>   iommufd_sw_msi+0x54/0x2b0 (P)
>   iommu_dma_prepare_msi+0x64/0xa8
>   its_irq_domain_alloc+0xf0/0x2c0
>   irq_domain_alloc_irqs_parent+0x2c/0xa8
>   msi_domain_alloc+0xa0/0x1a8
> 
> Since iommufd_sw_msi() requires to access the domain->iommufd_hwpt, it is
> better to set that explicitly prior to calling iommu_domain_set_sw_msi().
> 
> Fixes: 748706d7ca06 ("iommu: Turn fault_data to iommufd private pointer")
> Reported-by: Ankit Agrawal <ankita@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/hw_pagetable.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied thanks

Jason

