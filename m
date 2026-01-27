Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE26BD2FEC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfGOU02wIPz8bM8GuTWAh9Y3ULDbfTA7d9GCia3RBjE=; b=zJ1HAVxexvifnH20FGrjwLkomt
	hdixO4dqSMnZQX71qu5C1QQM/1ZAbfHnPHh2KWSetq+vMEydcXhRWuwcoHC0HOEDZeVo59vMoAtUN
	8HP3ow1LXeTakuiwVWhkvcUeVTs7RkVNqpiqLQ2vJLndVBOce94tBaVoaJvyvTUd6vyQnIt+Y/Ifw
	jjzRVNGs+HDOUMVz+u+13gDodOngV5H3HlH4IeeylmEF1YBpA22p1KAeyLUkY7ttpw6W4+AlZoxb1
	eeNXMAF2LPFGmSh21SFwsjiK2fFT7bB95UpfZt7CRWhKLlXdWE0y0q2i42pghAYobq5EeeZVTq2G3
	rxzy1S6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknLz-0000000Elbk-3gGN;
	Tue, 27 Jan 2026 17:59:51 +0000
Received: from mail-northcentralusazon11010053.outbound.protection.outlook.com ([52.101.193.53] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknLw-0000000ElaK-0T41
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 17:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0RIBBWzTGU1eynpG2EMEr1S5MEVGRv29J0eMmQWqcFU3jXpW1W+mTswXzlYrhYzdPhD2uaXduXI8sqy1h27fexbm+kp6Lw0cMS5iOn0PDGCPi0WbYRur+NOxp8AIATpm3yMyn/nAL7WmTRE69qN2lR4CxKlYYxdofzA01SBtZC0fn/oYHU0LSYAae3JNu4i43EMOnDp0yoMP8LWQWPZiZGW7BeLCankewV7SEAyh+cL6DtvMzzmlCynNjhCtkgCH+m65XDgXfa3YObXNzWCqq4J4Gh7fl/mOpHKIbzBx3ovVz7FFcfBlOrko71WZGXWP7m0IMSLF2YZq5iRjEZfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfGOU02wIPz8bM8GuTWAh9Y3ULDbfTA7d9GCia3RBjE=;
 b=pW9TUVyuKwlDvHaIIqlctp0mjJ+XNwXs/WHbSPnp1BS+ss42hq3QRMC2LnXIWZdvC8CTNX0j95usVtYFVghv+/kCUKiIO8F0rGEfyflJslXgY/2m1nG7qD42/k9Ev5GtSjLT0yJjsxOEy4yx68CnBoPPHUDom1gI95x9hcL9VJnHjCpaK3QTdQkNcZHzVGsJESijnVtd772JNyKKIZEepEFQJAUBsxor5Ky1pxWHt4kZiXwEckrqrvyRetqYPogI8DesdQMLCwLRpn7d72mqCwX6mz8/N3aHliVYsEhWXGxLXXYStIhGvZNdPhoSxddTQu29EQixK42YqszLn62bKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfGOU02wIPz8bM8GuTWAh9Y3ULDbfTA7d9GCia3RBjE=;
 b=G0c4b4sKGwCMFaoJ6qeNP4Jn3wHSGp0qQ4MBB4h9xY2BPL95x05g74EV4bClBAGjghT0rxOsVAzrMFbkbLZlBgzT9JMm0YZFEC2lek0f7BqsW+/B+KSUcjHax1LBktzYfr9ktaamQ+Zr4OPlnY/MIOqm9tYmvy4YnFDCnbv27+YN6yqQqBIJqglWVtg4MOB1mZixVNbz/2LDiSLNtEk0DaHXpSq2lGJ9UhPeClt9Tgbp56rLaisCcBMOndkMDBuWBQsea9vHCOwBeKd0dloBSU4v5er0P47DJlFL07DSOey5d5WWxqBZkv/RGGxMf9BweGaSiSklsUjAakQ+6DIyWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH0PR12MB8578.namprd12.prod.outlook.com (2603:10b6:610:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 17:59:38 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 17:59:37 +0000
Date: Tue, 27 Jan 2026 13:59:36 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	praan@google.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2 10/10] iommu/arm-smmu-v3: Allow sharing domain across
 SMMUs
Message-ID: <20260127175936.GO1134360@nvidia.com>
References: <cover.1769044718.git.nicolinc@nvidia.com>
 <2882c7b6dcec7cf8bdc08bd4fd9f4c4373db5469.1769044718.git.nicolinc@nvidia.com>
 <20260127154111.GK1134360@nvidia.com>
 <aXj6/yhMoveAHv2w@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXj6/yhMoveAHv2w@Asurada-Nvidia>
X-ClientProxiedBy: BLAPR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:208:32e::26) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH0PR12MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d89584-4974-4194-f2be-08de5dcdd639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UA7/dOqm9tau/42YZ3hP4GzGJh3GEzvLEWByWE95T3VNiLdGX8iN4CNObk9C?=
 =?us-ascii?Q?upafmmzt51kNHmKX8cmG85siDXOnM3NQy3lZB+0Ns+koCrCy7p/whCH8elXc?=
 =?us-ascii?Q?X+rVXdfljxFgiG20JrTluxAO4iAoH1tmshlA7eVnZYii0MZ4szZ2Gs42SC7O?=
 =?us-ascii?Q?Bh1ZLRUSbBTVyLXR0YSK2SxBparG8BJRH7BcrYGBnal1+hjmwaD7lxg6/fnt?=
 =?us-ascii?Q?pyI/n7fuLSLNB+siPZd+fF6hwwsmwWT+0lnUzPqvZifaY2cNPsKkEFTQRY8J?=
 =?us-ascii?Q?wGEtlrgGX+lKF0fOyTMDHRALIYtn/U/UJ3SNIXpPnBQeOsK9fIs7JAf8x8xg?=
 =?us-ascii?Q?zREPb7QVWQ5FsFBlVVzkWg3b2mI3FGW+CF8hNJtS2uUyeXjXg3YJ3fdFoKdr?=
 =?us-ascii?Q?z04syOU8/fZp1ZaZB31gAEzfIe1z80CRCJ7T/AGNUl+BCdQ+L+LD+yV8qJEQ?=
 =?us-ascii?Q?l+qZd2rFBi6YUGv/aJDJiZXHi9oakYlvt/0xt7IAPXjnfhfpCV9Qtm4gyz7q?=
 =?us-ascii?Q?uEPXZj+/EaW2yHN+ubA9pusJSHI1O1SoZy5jNJzzutAY8GbC/Gwonz9c3v/Y?=
 =?us-ascii?Q?iCtg1NUElirJlzD+2XJFecg7Sm2uM0iytmm+tZLDDIJBUZJTOPGGoUQvBti2?=
 =?us-ascii?Q?5oBS5jnbSrf0AGPmA2nDwHCCyi5C0y7Ac+s8HxZ7SdqaY02yVbD3lfHtS4LW?=
 =?us-ascii?Q?5E7+npUroDdSoGvPP5yhWI91x6h0NB5wXt805wJXqMnD+ekNPtXuQyo1+DiY?=
 =?us-ascii?Q?7pOiw1TaTh3XurJI0c/+/yjz8saz0e16chiXvebAnn45aflnnxB5MEmjnYfp?=
 =?us-ascii?Q?C/wVnj454HB0YdpmoAwZ937CKQEPiA5TWjIL4TJqcz0WD/rYsnMQNx6pXVZJ?=
 =?us-ascii?Q?/q72thwNrWhPgX66dbODSPMK49gD1T55dBOW+mYcnOL/0kh4Vyx4wXJyvw18?=
 =?us-ascii?Q?WrLKUWVyybKfT8qjMpN4YtF+x2YinhV5dgN1CIeIL2KcaOcN283L6R6s9Oqb?=
 =?us-ascii?Q?xDzKilxkOYRAz0RzOvrQEuj4AtP7Y/ql2Gt/X8RhvNKYU1VcLoFKzissR3by?=
 =?us-ascii?Q?l9J6NVBR9ZO0C6rDzN8y1GotNbA2tuQW12ddphlLBx9EZM3SOn+06j7SyVV2?=
 =?us-ascii?Q?x903JovxqyPRzdw5asd1TgDb/YnoZ41hPrwSyG+e7hHnX4cuxZMDkyGLXoIF?=
 =?us-ascii?Q?iIL8SlVOJ+3783SYo42b5hOBMx+/aDWjhWB2ChTzH781qGctcHZmYiIQrqkr?=
 =?us-ascii?Q?NPABGh4RA7vimr/Ur+unr2nw/53T+pH/sYrsLIhebw6+3DfA1iIc3PNuHWUw?=
 =?us-ascii?Q?fcj5DnQodWfbzaBXOv5X9YLnRKehOm1d2MSZBbHIkJ82NCl2LeocNURWPXWH?=
 =?us-ascii?Q?pbOePYSdRvEQc2OKmZ50XvZmIv4KB8Fg7gm0JewtvPsUvjCKU+EeBunDosJb?=
 =?us-ascii?Q?aBppy4NW/k5ybH2rJWI7ILwz8+Jtqs9i1WbI6DiUMqExcQPnX9w6aOoDKpop?=
 =?us-ascii?Q?siHtl7lx/ppnY7eTuUF9fnzvc11UwAtKgGhi2l+Fk+S6vPz7eukY6BKL5fhf?=
 =?us-ascii?Q?OCkDz2ktn0lgx4aujoA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8VPRcfr2o4Jtu4vhvlm5ErmEceG69XFYM9HKXESvp39euYTufE7TM5iPmLyn?=
 =?us-ascii?Q?uSCLvQeHsY/DaqBPXS+LY895RvswGknQWtadzqcGOO7jLvLyrD/z/mC1UwKf?=
 =?us-ascii?Q?Ws7gKsVKyGklTQ1ZOMPz5VwoP+GjFxMl2Sf1istyRwoHt9h8vmRwWSqlS51O?=
 =?us-ascii?Q?FG6idT/w8+gCnuEge8jYdYo0sY6aSZhpgHArZ4W2ujxZn2FNk3tga3R/ZVIZ?=
 =?us-ascii?Q?l12syKueMEZg5i1nUmLLPGEsRcztFXfSdl31eTxnwqAN6MAg5ODkSvvuYoVq?=
 =?us-ascii?Q?PwfIZTNwz77ABWKKxECD0RqvZstesOjof6SuPwd9lHNyZUFwNQ7c/Vd6sWe7?=
 =?us-ascii?Q?LgP4cPpC8kpWot/4fAb9zaN6Bjz2ykpsPd50okzh7rDfq/0xGCQSgHGCI3zy?=
 =?us-ascii?Q?TQGKrnYc4O7ahg3e4OB248APHmLy9u6BWtNNXoPCfSY9Q9yh9UwrycFG4Jl1?=
 =?us-ascii?Q?ZjsGJ5O/mn86145at/FQak+Yuw72Q5GlriDU27+B5kMg7ktKf/WogLqeIPhk?=
 =?us-ascii?Q?iPbz8Wz/52zjyRSvu3OBYCimyjulcj0ePbXANWQbXONUrBC+icA1BUppsUDb?=
 =?us-ascii?Q?/21S6v+h3fW0uDITlJCcO8JM5udfF1ZHohi4Vo4Nwv9Izqcu2W2mjvcxUyhs?=
 =?us-ascii?Q?cwfjaCCZThbMnHjaF/WcxxRkSM9w338PHn0/Fs5EhBPGOYf9Sp8UsS+wj9wl?=
 =?us-ascii?Q?/53pI/Ku+kMriwaeYwigYI83s8trbre3Ek5bY8M6KEIMWx/Apl7ass3diOwZ?=
 =?us-ascii?Q?lbr/LWZYqR3M/EKxg58kbkZhwMV5XfZiRxxMbBfFyFRP3IpjjPvtqte+elfs?=
 =?us-ascii?Q?wuZ3q4ptfH9+Af1UVv69AuHGKZwKQiya+c0r36VHIzZ/h3Yj5YU8Olv2BApj?=
 =?us-ascii?Q?i1dzTDoTwvU9giy2se/7qEwoxchVs7IfoNFaDqyysxSGVAZ8YAlMBGDG9fNm?=
 =?us-ascii?Q?DWxWKlGc3gnpHv1pJg7BNVmyXyODMyCwsm0/8TdYCSoFV4NdGU4MWFoC3Ycq?=
 =?us-ascii?Q?rh5TJFG2gEDUx85JINyX/oH+ch6pGT1lPO/d13DYfnA3co3qvdaiLd8d5O4B?=
 =?us-ascii?Q?H/hMfMIufnODbqSDXMRMT7LQMpn+US5infKrs/Y0Yh7fxE6tEIneNlsNp/J1?=
 =?us-ascii?Q?r76L5BEuq1aZwulu6cdUEPuX10BK6b/Y2wbriYcqjNVPl36hfuBer1H3UTfm?=
 =?us-ascii?Q?K0ER9ELml+z+yLnGdgTby2ZcelSQNx6/5U54W1poBrM6UfN+2xMc087FKYl8?=
 =?us-ascii?Q?hWrvaHBOZIyvb3LQdooWRO6VvytnM5tEfFMnF+uEut20isuBIid2UVUZWCsZ?=
 =?us-ascii?Q?V9qR49HW/F0VzOtHmQV+LBvQBea94mTeMRprSXLmoxosAmrVRXZKzD0i9tXx?=
 =?us-ascii?Q?TC6FdKyw4U91KX4Ws5vUnRLfkevBggWg9Ubulp3ye4Gjo/HVuiX/nBxpBzgX?=
 =?us-ascii?Q?om5kXFhy3HblM4nVHs4cnd1qESYmcOHc4KcJOOkvl4bGCf7V3YePSwiCOqkm?=
 =?us-ascii?Q?paJBFeHtxxHauSomNf6MOzAnmwm/wwXBr7DksVY8YOQVX5ipK/XgXvu1H0zQ?=
 =?us-ascii?Q?K8OSsLIQ+p1BuQ61bBszHHpBwXS6r0nOZns4FRVHwFEC9+2fv9r346PwN3mr?=
 =?us-ascii?Q?2VGNQy976XtwWkr0O7G7ew41UqFAmN29RyLZfltlt+eRPTS++Cf+bVcexFlq?=
 =?us-ascii?Q?tHfG71JVOaXGyuoBUoNkNuDL5DH/x8fI6Xo29PORnmUxCNuB6MKwa3xJTC+Z?=
 =?us-ascii?Q?ScRodff8vA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d89584-4974-4194-f2be-08de5dcdd639
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:59:37.8165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxpghKIm0Ts1imYDUdVeBx39zIMW2/uHGj8hRN1eZZZI5nEREeoBM/RYFp4dOzWi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8578
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_095949_453690_AC3B718A 
X-CRM114-Status: GOOD (  27.41  )
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

On Tue, Jan 27, 2026 at 09:50:55AM -0800, Nicolin Chen wrote:
> On Tue, Jan 27, 2026 at 11:41:11AM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 21, 2026 at 05:24:28PM -0800, Nicolin Chen wrote:
> > > VMM needs a domain holding the mappings between gPA to hPA. It can be an S1
> > > domain or an S2 nesting parent domain, depending on whether the VM is built
> > > with a vSMMU or not.
> > > 
> > > Given that the IOAS for this gPA mapping is the same across SMMU instances,
> > > this domain can be shared across devices even if they sit behind different
> > > SMMUs, so long as the underlying page table is compatible between the SMMU
> > > instances.
> > > 
> > > There is no direct information about the page table from the master device,
> > > but a comparison can be done between the physical SMMU that the domain was
> > > allocated for and the physical SMMU that the device is behind.
> > 
> > I would very much prefer this works by inspecting the cfg from the
> > iopgtable..
> > 
> > You can get it by doing 
> > 
> > 	struct io_pgtable_cfg *pgtbl_cfg =
> > 		&io_pgtable_ops_to_pgtable(domain->pgtbl_ops)->cfg;
> 
> OK. I will make it a detailed scan
> 
> > I think it is important that the domain->smmu pointer be removed as
> > well
> 
> I will try that too.
> 
> There are smmu_domain->smmu validations in two SVA functions,
> which presumably might be replaced with this can_share() too.

Those are because we replicate the mmu notifier for every
instance. That can now be revised too, I think. Let's leave that for
another series after this and leave the smmu pointer for now, but
don't use it outside that SVA stuff.

Jason

