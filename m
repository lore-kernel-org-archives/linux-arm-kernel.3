Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B44D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPXnTZbBCXvkSz7ju6WnHSJrko67/77sDE7sbkgVbew=; b=uU0UNcBaJKfpW6QJV2MraoIkqI
	CReui0rO9qh4uqSdQo/Wtl8cgunnLWPDfNRDUaGBa6EZb2g3CidH/V+27JD5QozF7ZkTQd+XZriya
	7MxfQmLlqQecm6RSBXcg4336clYoCrZThNPwn1G5zACD9QJ2AULnqqvQtyFhzMMBdWU8M3+Zch2D8
	C5wjBtqcdnVovEaefX4mPTu7/uMoTQJ9z+9fXgGBnS+QI/oiv8ugba5ni+jCx0w7T6iXftL/n3ns6
	C/HsPMx73exqCMkpCucwQ2pNGPV5gPJMYoxpoPNaHT44/xdk4FM8JqAqBKgLRI57DnGeApyitnPei
	B1ojBerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN8x-0000000COI2-40C3;
	Thu, 15 Jan 2026 13:12:07 +0000
Received: from mail-westusazon11012031.outbound.protection.outlook.com ([52.101.43.31] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN8v-0000000COHi-1lvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGcMcrHvKhQ0zcZLaPWtUJq4q3VTPuagLJ42m4xaDSSrj7TzarwUrEgmwVXCUV1GLJ9b80GQTL5CgJW70DfV/LyNhSqVAfChm+/kmR0ELT0YeqfmURuEfq0ocszIHbDLYaXqHpJ4GZLpuvWbu7S5fPw4utfCN4TNDieOkqQ2Yf8yFIgtOQqUGi7mP0BCvRQ2dUKnnGEfjQAWR5zxOH0XVNthxiigPX8hNYBPpnrmoOJoamOIw0L5+01Qr7TrJZQ2rjByrwdx5DGpxWWz2q82RxtOar5D6M6wi+wMPp52x8mAjQLskvBzTR5cn4HNS/uYelLby+RYITigkPCHdvCGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPXnTZbBCXvkSz7ju6WnHSJrko67/77sDE7sbkgVbew=;
 b=tI4CUU6m/aC9mqpRarMZZSVBQsMWwUzO1wtRFC8L9/+dIHbg7ZsdVr8AwUftIS209/MXI4jC36J8HSct2hI3IqIMjT12sqRh3db799xdy94VkYb1biZftYiZffynCCngvybiNFLIbdJSNXicybvEurj/PKyJ9WppnPRO/W2jhV3BIXN8vPhXqdHIKlQJILs0wyBpX1sgf0KzDmAjTo31JxCxoMnyv4w0tV0lVN2QDF7hYtDrlfFzP6CgIyaeIaTAu2dtUZNLI/awh7tzor1zXt2/opfjtop2Gc27QNz/sVrEdlwesYacgccbkdFehudX7pyq4DZsuV5Hgk/RMXDr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPXnTZbBCXvkSz7ju6WnHSJrko67/77sDE7sbkgVbew=;
 b=q3LWKB5ES2MTjmdixQpOLjG2VsNcRCP2piPDKeA4ffbNH7GHIOtyoaNX6FSOGBvRjRmv65iRgyytxjguWsDCvQy5XHBjqKrq0qjLM8dQHXcb/3jYZkvG/BET7Wom/n+PHRSu4jJCVBu94FE1OwtAG7YwyhNR13Un1l5c/Pxyh9ogH8bDojRIh1n1XSiupGcPZg8EAeC4fieR/2ZFHF19LIlEgpsXZcluSQtvlLNl+VQsG/pyLll0NJFbtrHN6TQDrZ88tUR4A6TrrT/UzSZ10U+kPr43VGEcGvVWFeYOkpv7KIClatfQew6rliFUzlVKaL+kqVOTj5/J64KHI16xRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY1PR12MB9601.namprd12.prod.outlook.com (2603:10b6:930:107::16)
 by IA0PR12MB8714.namprd12.prod.outlook.com (2603:10b6:208:488::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 13:11:53 +0000
Received: from CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3]) by CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3%6]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 13:11:53 +0000
Date: Thu, 15 Jan 2026 09:11:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <20260115131151.GA1081267@nvidia.com>
References: <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
 <aV7OBrH-TDiGRblt@willie-the-truck>
 <20260108003646.GA537728@nvidia.com>
 <aWUY-f3kvM94z4qh@willie-the-truck>
 <20260112161010.GC812923@nvidia.com>
 <aWVETpwlx9Rhs8Kw@Asurada-Nvidia>
 <aWZfUNXEka3GBf9s@willie-the-truck>
 <20260113161253.GG812923@nvidia.com>
 <aWarF90zBqxD0Gef@Asurada-Nvidia>
 <20260113205112.GJ812923@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113205112.GJ812923@nvidia.com>
X-ClientProxiedBy: MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18)
 To CY1PR12MB9601.namprd12.prod.outlook.com (2603:10b6:930:107::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9601:EE_|IA0PR12MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f761d0-4435-4c00-dd35-08de5437a663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ub1IEbHj5onCc8u7oVqr/kcofMD8wo9ZkFni+u5BprI6l0Aaw8OyFyKWTrW?=
 =?us-ascii?Q?6pt/l86ePpRYGbWWkGlcOSScz6+jJkjHe6R85yPKM+SNN052x95BAUw0DPA6?=
 =?us-ascii?Q?mIM2YZQzwN7eR7kCdyyz9/tTZK5nA3TFCmD6qI1hlxnWyl5aHZ8swn742/q3?=
 =?us-ascii?Q?F3viNJm7BTIEqeZZR+A90xVPvjKsKtUzj9ETZABIVvnBIEL5+nwGtFxxHw4C?=
 =?us-ascii?Q?qqb6R49F+JFS5t5K/alb5/bgcIsVeMTK3Pic1etBlVZ9v5bLSU7+eh1kjkbp?=
 =?us-ascii?Q?rlnOjJms0OJ4tlEUsqA08r4Y1fbBN3wo0NmU8DzHdTd9g7JsyHdtaPJSUbAH?=
 =?us-ascii?Q?s1HDEiikIfSbF4ijsMwZ+NtM4XH9BwJXH5XOL5b737DjwbnnMG9qIJtIaFiM?=
 =?us-ascii?Q?fk20cThtfv4AW8XTQbmMCzyWYR6L14o5580VWT2jpnaBbLuy5c1aB20SAzd5?=
 =?us-ascii?Q?EwVkS5fWQJNjGr6/VMsYtYCVCKHtXfCciujiA5ee2IddSjwSqGE6fgSnGEqZ?=
 =?us-ascii?Q?w9Ptre+mVZovrvxAzZDHel64B1sObjhj3iyoJ15Bipte1bTn+Z5dD8fd4nRJ?=
 =?us-ascii?Q?Ikp+aAxX5/dLCdhIDzCUmLsv07G0mfesN5XDr2+MGNEYGz7hvw88NNpZqixl?=
 =?us-ascii?Q?A5oGSDRnz/0v32eeLGOY6Dqx4yP5l53MbxJnp1bbO2s1fFVZwY598vtVK4BH?=
 =?us-ascii?Q?pjUTxvNuqKkBvC5UJjLPv2/9xuo8CnEZkTNdP0lPmKTdj7TQxRiaTsZE2Tm+?=
 =?us-ascii?Q?ANeUxlFktUrK0AepfBLEM2ROYv8a8EUyIpJc2C/U2bW5xz65c12Xl7wuwgti?=
 =?us-ascii?Q?53ECjFJVZWjtxBCTep9zI8AdHjAnE/p27+n7Trkj7lFBLcYoijnB6kSve836?=
 =?us-ascii?Q?ZnxrKYjEhGq6EoBEDzBNrod0231STZ6C0C/XfNZAE0zBJa5VO7B8c6eRpg/R?=
 =?us-ascii?Q?ATK7lRvsbwZecpjpkJeR8Q2hL/Sl8VLZkfLTKwvzQpX1kufP0smDSIff4aZ+?=
 =?us-ascii?Q?jTcKfKJCgAOLwJ+ZkvUGlJAX4tUuoThSfIRSZM8k6320+ma2HjOYoo7Eo2pU?=
 =?us-ascii?Q?fZGDunc8fiujcuorkoNeo7eHgysiLiTHvEdIKEEUo0Cg12ovJ0dKMPGXFxMt?=
 =?us-ascii?Q?iWEWXuiBcadmUIld29ETiocn1bHqza0F2bH+VPH9xGoApG1sz3gVu2FTC+kP?=
 =?us-ascii?Q?4xF1pev53uvxryW3Wsc2hjAYHVhTdW9dKTV1M/JWzTi5Yn8ortuBxNOLEjzE?=
 =?us-ascii?Q?Obhz8at59W3B6js0FVo89ESOnBHjBg/mMZ9q+jopnSDXcKAn2c1I7WFfXUq6?=
 =?us-ascii?Q?70egbW3cN3XwExXT7xXrbHGnYKjyXmbRF75ThWsowP2OWeLKfoNfRpu6ZaPW?=
 =?us-ascii?Q?kXQvLNM8ttd45XZvFF6oyDflPjGzXpmwHolUGX60YiruBY59e6TN6SMBVeao?=
 =?us-ascii?Q?aF7diliB6D4+Nw4/jHuNJ3luR73H9cIH/pVqxzMevn2l+NJGmrCIekQHqJxY?=
 =?us-ascii?Q?5X9If5/6nTG4j+n0sBpEyEfVjepjpDOlK0rVMZr5jWZcz6nt+goW3dNvIHPz?=
 =?us-ascii?Q?glvll1RS7X47chtzPR0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9601.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JpQ/J0KH5dpdTKu4xn8/yRjULfxi4bRpOvhHoLXRacsyV4zpws4pB5h7YgQ5?=
 =?us-ascii?Q?YbVBynByLhIZsjvP6GB/4Ei34g7GC44ryE2jF9G4X6Sc4cl7Sb37EeQlalwD?=
 =?us-ascii?Q?5G8wBMwutUtr6V0O1CANuVTrn775iasLgzbCScGwAlYi57aoHlIj1hj51iw2?=
 =?us-ascii?Q?vf0Q7tt0Fk9UtCrKsHuOcWliQjJTihSAMniH3I/sAEY3ZlYIB3B8t1jwcMWO?=
 =?us-ascii?Q?8BPcodM++g1a1GHZeiLHnF/YertSNzaWDd8Z1NpGm5DczwAuw1XdQfRGJPXD?=
 =?us-ascii?Q?bjq5NxIyK8AEsEaZawduPrJu4u7ZNjk5OWH9AgweogUEyOr0iwdV8F0TcQ9k?=
 =?us-ascii?Q?PATAVcQZVgciHXygZ/DG9kxhgGPCBe4xoHT4BKcvh9DyoSYDZNaS2IyyrTh5?=
 =?us-ascii?Q?NQPlUy3CFJSixhfGhRuTQjnrOP1uKVM7v/sRRpVFzGI5zqKnQoFwU6djdYB9?=
 =?us-ascii?Q?bzd7iIvb1lpfB8t6XmNAsYZKbXOUhi/yqBDcWBH2n/PDrczL6C6Dax8dmm8M?=
 =?us-ascii?Q?bmAceeF+b+9XMgyAZkOyd5EtBrYXcuGNPgEDwpkWtxchSMgamfqY06xi2BeX?=
 =?us-ascii?Q?MgSImSmSyc2URwyMyZMugONOt6zGArK06X7IapNm/WpVYGxdVJzWuCW1GVnV?=
 =?us-ascii?Q?75Biaw81QmMk/ckY7w4ocr+gH30YsEPtgRSd7ANLGmsAYuAJ6x/HTb5x5KIH?=
 =?us-ascii?Q?LTIJTkOChSp8edsTr1nEsjFW4ZNNLCMn/1/dh89ipZex+fudCOQtDf8qm9wV?=
 =?us-ascii?Q?aVuqA5DB5/wAjty95OpPGDgBCtToz50qRlWHXBEqvLneU4sAMFKewsArR9vJ?=
 =?us-ascii?Q?2wyQg7E4n82DoGjMcapfJ+P8A/KRklVyb1XO0ttcqLBqzg+nhTUMbJFid2ZT?=
 =?us-ascii?Q?MSegoCeSdJhC5sOQI1/bHr01rm1WqF/ud8RW8tRIdk12aCv9T7TLdNla/qqd?=
 =?us-ascii?Q?C0hwCctLVnLJxNjTUVDjB8BHEq3XqE4bPKpzXV9QzCqp0t32R6KWCF0M0I/a?=
 =?us-ascii?Q?GCcydCNgY58quY6QK07H8FmsKf+D59mA0+f7d34JlzMhPd0fEVef8mUh6fMb?=
 =?us-ascii?Q?Zaq2pnrCmBvqZEJag7YqgBmQuKJTNR0tqKNkFnhk7qu+mfG16HYO+ZEqWsql?=
 =?us-ascii?Q?SFsJrL68ODin7M4KHVrKQj4kR+FiI2pEY2od0yBkJ6JeDpjFFO+fgs+qeazr?=
 =?us-ascii?Q?oThA427RhVWTYSgKucQ+TQ7TymhPxCmPh5VXopdtVFM8fucLIDSf0IUYWfxl?=
 =?us-ascii?Q?vfVAQiBrn6TQXDQDvwIoMCV0OrAuKvZlEEiBV6fAnwRO+MPXw3oejL50B/T4?=
 =?us-ascii?Q?UKeRJoPsSaJl5IwZVhfkJ0UywrXQAQ1HjD/FnPWSkSF9McFMxviyiqaYbdZc?=
 =?us-ascii?Q?pzKXzbKxoeG2ESpIFGNQGJxmWJ7PmZ2g1lz2NpUQFQfFzuyIzGylF8ZJ+2f/?=
 =?us-ascii?Q?XXJpgYaCw0k32O/FXzFzX8i0qgHCu+6j5/8oj/y1z7EFkUnIFmFI81pLaKDv?=
 =?us-ascii?Q?LO+gbG2Sm8i8/ekblqOF6z6msJ5v93+XTmmLIIkqHrkPL5VSpZmxKXLUqdiI?=
 =?us-ascii?Q?PLrHUYDQ1t82nBpOmNWhZPcy32+IG5OgIUP1sWkPiuV/Q8i/IORiliZT+7R7?=
 =?us-ascii?Q?DxS3Vn0emvdNKryWf57X0i60AZEJG5WavR+SrLcnqq5LdsJm5HHETouHPfan?=
 =?us-ascii?Q?NEUHLW5cVBfUnv+VHp4ZDqjSYQMNJ3RMxG98QS9NLooaHffpi2vk6dpLhhqs?=
 =?us-ascii?Q?TDtE68eDPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f761d0-4435-4c00-dd35-08de5437a663
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:11:52.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2KSZXGjhdLpiatrtLw0pTxt47vBWOu6V7RmKFLHOewa++PtJT84NGGF4nrFG+J9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_051205_467623_A0BC798B 
X-CRM114-Status: GOOD (  11.13  )
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

On Tue, Jan 13, 2026 at 04:51:12PM -0400, Jason Gunthorpe wrote:
> > -       safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
> > +       if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
> > +               safe_bits[1] |= cpu_to_le64(
> > +                       FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS));
> > --------------------------------------------------------------------------
> > 
> > @will, does this look good to you? I can send a v7 with this.
> 
> That is an easy way to address Will's observation, makes sense to me.

Ah, but it looks like it can generate an errant view of a EATS that is
neither old or new. Ie value 3, reserved.

I think you should just check if old or new has EATS bit 1 set:

if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)) &&
    !((cur[1] | target[1]) & cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS, 2))))

Which the current driver never does..

Jason

