Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1908D6AB16
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 22:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VarKxQRAOJ2T6r0hSi82fUvx4NYmx/qXeUrp4a7LC4w=; b=ByoxDUxBZMi9seNkd+/o43xz0R
	0MfkXgggFFtroz1SAT2U1EjXcM2wS0HgqWOzppuWI6eLfZiMbQfU4771y4SDUwoYNFLJ7fxrL1NRm
	804XK7G00ifJuKE32NMyCen6YjQDi/f18bIg1gUVzKoedQ6prv+FAgSMtonjBLCpiI3wGs23HZi7W
	iFDtqVj3Wf9b+VsEhp3JD1uNaBUtTk/I8Q+blzp9uGiNULN9UZeV4GdbxnFtAHgpc3fMY7pDsCnvc
	CTetb/NMR2cC0m3zqmg6Efo6UpgGgjQxi6VA+u6Ag38/iEg6I0BS+0x5rTNuWnxXzZluKnPGWra3L
	1jNmtYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Qsw-00000000u50-2lpZ;
	Thu, 02 Apr 2026 22:51:34 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Qst-00000000u4G-1GVK;
	Thu, 02 Apr 2026 22:51:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiKxVrtLMfCdDFXUZZ3DUiOdBqPp97ZTsoJxDRRiaP/faj+hnrj/+VtNhPb2hKOU3MT/h0j22s7necyZyTOSx+pO6x+0NcOk2flRhvuvx4hK7QVsyxEhivzBaGJ1Z2VSgVJURz4esK+Y6wWcJMM3hZKtE8NCvTV9pdhrwb//1zIuRVTFqoAfdQ8c7Yo2p/nRdpNrvKxQmnZU5ZxsRcWrskRQW1g+xLOgJ0BgV1ft4TJm/3EfQIiYvwLtBoo/8jdl7AI4eZJP6BxbkzzCpIN6oyX6sJP/vZFKDIHO+8mJWt2DrtH1pEx9b1CtpzARU9A+MaQmVmSv/pGICdJmbIMMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VarKxQRAOJ2T6r0hSi82fUvx4NYmx/qXeUrp4a7LC4w=;
 b=A1ppFKr4nU5Vj/qjf97iVpRm6Dq2VwJEj2MnT+pcpbjn6xm+pTiQb7PXzM4wk7ETijve/DC6HTWGNraKVphioye/qbYkeB/xj/1I+VpoTCy1CmO+vYscEK2bOD0Z4P/Op+n3i1U05diwMkKhMqpvcJMtcX7DFVmHEOeLg/qCa2touPpNwgegI8z2V0JvBTO+tWVhORYSpxh6o4CYx8+cVc3I9+U/SMTY1/vn6/dv57FHGrBVNgekm7ttTHpM7r1yTBeSkCkXCAzKy3dWFlY06cmsiiDZcj2ePcsgWOEeCMsPnJGRBDsoeEL7ihfQf13+YtO2ipSmCiD8+yTjKjsgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VarKxQRAOJ2T6r0hSi82fUvx4NYmx/qXeUrp4a7LC4w=;
 b=SHbWMUQaKQYPIBO/up9JE5PcNqlrxgKIWxxrgdYQbKya+Gh5gQwzOorak+aGltG9Cih2FKtBzDu+sNdUH/6l4Ag/FYXi1uJ10wcwnJwCBXhUpS1SRO8cXLUN3MIUdSKId880nDIcPiN2FWak2+cHJ+9MFwX69xJhMlYH33qPTAlIXi6PMyJ96B+5ed2DsiSc1nE6tW/qOVG1BYG9ll8ti4xs30NQUjqugcR7UBbSbzHlKVuHSgywxVFXQpN70KmEoTDGTnBXOydQ324SR4Rmis//lmj3DbnikcblowWFS8q/GliZ4CiR3pV2hBhC2vVq2OCqueLRrNODY6ZGbpPU1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 22:51:23 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 22:51:23 +0000
Date: Thu, 2 Apr 2026 19:51:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>,
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Jon Hunter <jonathanh@nvidia.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH] iommu: Always fill in gather when unmapping
Message-ID: <20260402225121.GI310919@nvidia.com>
References: <0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com>
 <ee2c2044-e329-4cdd-ac35-9365824d3677@arm.com>
 <20260401173650.GD310919@nvidia.com>
 <ec51ef14-e360-43a6-ae62-44a939ec8027@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec51ef14-e360-43a6-ae62-44a939ec8027@arm.com>
X-ClientProxiedBy: YT4PR01CA0412.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN2PR12MB4341:EE_
X-MS-Office365-Filtering-Correlation-Id: f8063a5d-23df-4a4f-cd30-08de910a5cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: LQ0iqyWq+OZzBq/Kh7OYSQ/H+kNFSr9BE4y9lHAQuuNJAiE71Y492BmtVlnMhkY4BHaJKRlmDAQ5OJBg7jud7DF6TJlab10cH4bJ38A+1Uy+D/Jfac//l47eK4UFatzpd4t0SK1Mtqf/eDuiM8ZD8JHNdpMpSa5gNskwHb3zYRVYcaVEKkNdQsVKggqrJLv1sjEBOt8GrCLPKNSFTfT+zr35MZh/oDgUn9CLRAsWUnUPmNRETHxtsypspxf97r6hhTBZUxpS5OGLlvh+g051WOb0xnPAZufJaK38SILI83JAy2x6jfmdB/N8SBLT9nPr6zJSP6VGHQiZ6IXXedUDoFEiPhIlnvNgeF74UEIxLLlZ3Xa0p84w0OQ/YLtD/Nz7kdpRB0QPYN+btHrsmOHb2KB6cTF6T2UoAOKUQOA+NU+P/l1T4dpS63S/i47dnNtkDmFX2AgUgbdARfLplsWt8Zzv7jXLN4dunT7uGdvbc1+kGCNcSxadXfIzCZsMYiIDRp6Y4l8zpvGlUFwni+1fsqMxDq07tKsBSJ6TMgV/vQusnGtSdEAG8sn99pDVtLfOYAGw22FvRhdxVvuYZXlsUtMcHErtLzjgp++DS+xU7167869AHMMLMLWr3DLfxmj3hqkUPOM75bGB4D9ubTWjRAmC9joe4gG61dICvcSbv67iVUzNv5Jb/IFVq2Hla4dcfkq1bG/FPbVh8tGsLBMz+cy+GdIC7l+0/J0C0UXRCiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cobql2wOA85oOqv7eTqFUbYr2f7++offO0mBvU0c308Vol83H5HjMbtaabke?=
 =?us-ascii?Q?SYJt+lpGfURjIfRC9tHLT1QJpmKsz72VeNIHIRkIRC0kSsZ2+g5uglWoDusI?=
 =?us-ascii?Q?GtvyCPFELlAppnw0i9Me5s82iI17QGIuAw7IuacNoTFZGqxj3H0fS+KSIQk0?=
 =?us-ascii?Q?4mfqpRlVVQvt80mT74jlQRLFJXKg9iR5AszsVK9jOiybBO38CYwuDll0WDoo?=
 =?us-ascii?Q?rIxG2T5cgvm5vlihhA4CynLdF5tEVtW696o9Y/TH5+epvBVUG8i7BevGEcsK?=
 =?us-ascii?Q?LQubXWVF9j382fqsA+3RrtVYY4tkMiXGb2u8RVxMyPTYwzkwgmAtjDeFloH1?=
 =?us-ascii?Q?2+z5hiKlmhgRVW4fAPC7QSU58OQ7E1GkWy2nkUJ0pk61qMiOUFPcnnfinRGy?=
 =?us-ascii?Q?gN2lz0eV0rk6+wiCn+/Dc5gFl3SeAOUxq+nIibSQJQOQ/LxMUS4X7o0OMKap?=
 =?us-ascii?Q?FLTJS6AO8VDvIriBHa1eUqSIELpKIeSFyBGZ0cLRLopBI6liPNbhlBPo9O1D?=
 =?us-ascii?Q?e43dTh4g8zbzOys2vwIFojXkeEMfgkwULpnpTPp9SjS0yn47nmsd8WqRqFKW?=
 =?us-ascii?Q?f0pPOyo7q+NO7sr6dUfG0fEQd/4SdyXyfJuEmNYNxDyh3t4I5tW8iHL8HzKF?=
 =?us-ascii?Q?qZmgToQj6Qb2eic9vsnhaUu+BxpVWvHT0yOteZhDrfjonnC0HDXv4Xs2T0xR?=
 =?us-ascii?Q?XjP5bK6EG1jwn1JT+EOdj2WrcyKvsPJ7IiQeaPRQjChcuGb84XEgm+FZwFLf?=
 =?us-ascii?Q?7uje9+ZwyQK4WVpd0z4ewbiYL7NfVZU/MZj+hEboMvaqOtuYPrZwvP1Etnqo?=
 =?us-ascii?Q?7wOBr1vfv80Irx4TiJ0+9Y9boLd2YbLqTdYHnL3x+t+nh/wUr21BWy4q9XVt?=
 =?us-ascii?Q?vIXbmnP2Jp/T8TsdoZx53wV6KRlf8PWHkJw5s52x6PRRKnqbckoh8dieXW84?=
 =?us-ascii?Q?PcVBUB2HUyXsJXgSb9coy2E5v8DNW4OWouROcurqWaGk/N0g9ClcPkbHKHUt?=
 =?us-ascii?Q?Z1yRGnNSINy6H6G26zxB/GsD2T4AksJXUnZjbda0Di6TjTHmw7+9z3rxVU3o?=
 =?us-ascii?Q?kuRJRU1yuh+lajHWOD4H0vpxJCzLTrscqiKa2h7K/KF0QQyRtC+qdyTxQk3u?=
 =?us-ascii?Q?PyxeS7I2iY6SlGBSZAt17ueGUcRcqf1fUDWX4cFc4xet3M/JHc7ha8q6BuZf?=
 =?us-ascii?Q?f+3calHo4m+EAtTQDBFKXQZfAJ8NbzzHCfU27Wpf78T0lV8yaOVMBKFOOaHI?=
 =?us-ascii?Q?n32FfftLoz1f7+hfRXUFq2xdYloRwNAffbl0Yd9++U8yvAhabrVt8je/bamq?=
 =?us-ascii?Q?vuLO4HL8+O3/uzZJq+XHeYrRTZngHTICd0gK+R6sJtw6Oq4oJfjzgIrFvtum?=
 =?us-ascii?Q?M6gLCc/lH5qeREPO+NinMgcctDTQgP+bwdpxXLlDivE8zwtNN4nC1p9aw2Ay?=
 =?us-ascii?Q?y6ozzzD/4MW8C60i4cgj9HYTQpyUqwGQU2CYFNkYMMnxKNXhFJl33e/cka7F?=
 =?us-ascii?Q?F5Ze173NLKilJHS7eMDuSEiXt+rIMTjDDJyUhNWNx7beVa3z+jsy+H7JlSfR?=
 =?us-ascii?Q?DBvZymhSvsrXkUKOFSmvX87bJAB2dIWSGZ8BpBwNXmz1wsyoq0nZEhkDKF2I?=
 =?us-ascii?Q?0Qf02/gl+04YDMVEzHHkt+/th71KiD/jNqN8z9C4m1gJ7psL+DafK/Zijqr4?=
 =?us-ascii?Q?sUndc/whFrh+FtjHJy4X70lwt8WCBsGNYmhzX3kKi8QVtzUt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8063a5d-23df-4a4f-cd30-08de910a5cc1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 22:51:22.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bw76KTwxE4EBlcAgILyD7N4SDvV79AZ40vMl5IVNKz9LDDyFfpmJYt18Rb2F6fW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155131_351459_1711B665 
X-CRM114-Status: GOOD (  14.59  )
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

On Thu, Apr 02, 2026 at 07:11:13PM +0100, Robin Murphy wrote:
> > > @@ -2714,6 +2714,10 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
> > >   		pr_debug("unmapped: iova 0x%lx size 0x%zx\n",
> > >   			 iova, unmapped_page);
> > > +		/* If the driver itself isn't using the gather, mark it used */
> > > +		if (iotlb_gather->end <= iotlb_gather->start)
> > > +			iommu_iotlb_gather_add_range(&iotlb_gather, iova, unmapped_page);
> > 
> > The gathers can be joined across unmaps and now we are inviting subtly
> > ill-formed gathers as only the first unmap will get included.

> > We do have error cases where the gather is legitimately empty, and
> > this would squash that, it probably needs to check unmapped_page for 0
> > too, at least.
> 
> Maybe try looking at the rest of the code around these lines...

Okay, well lets do this one, do you want to send it since it is your
idea?

Jason

