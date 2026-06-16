Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE16FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLvKk2FbHilbXz+59NcczQoJf/+CVQLwv5fauieOTGQ=; b=gOlUnheAou0tY3X9ladfMUP4aT
	cjjPRMPd1WE5ZwBFONcYzQEvnKHyEEjVKGr9m1WXOflTtwTcSnTJPo1uSvCTkISIqr1waZbyzHuwD
	4y2eM3JordxWhjMQzHQcRZP5f3TzpNbJN9A0aCpSbsh56ZcyY55gjrz9mFk9lp8/P4Vn7xAHjJ9Ng
	lkvem5K0bUh20dtfxG+E/jRhAixUYuBm6yjdva42NnzcSid04q4ewl0wGc7i3BnBKFQSAFA++vQUg
	6ixHIMQTaxoHQzy7gehQjmmwlXnOvBtgN4TgB6voByiw+jyOO6x4sYqERFHmWboAYJsaOU4PoPWyz
	UcNiKwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWin-0000000G6LT-3d2s;
	Tue, 16 Jun 2026 16:33:06 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWil-0000000G6Kt-2IAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 16:33:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRb0AhfQNOYJA+5wLbm2XYNOGfBL6e6eAMpy3VtNUld/0mEJ+VDY1Ga+Sub/Ig2wF2JnEXGL+HBaX7Ty87ojTaZeTLMjA3AfNCtPEh93zdkHWMadWLY0HI//CLvWd5Kqp5VGr1zxhK7gFLwRD1ZHvCGSwhVkFquJPOQd4jqn+O3Hfo/NN8mWNp84FjefZSmcxj8abL1o1bBUfLIIMnZRHxYLFK5vFwuYUDY9HCYZXCOYfyydCwT2kE60Yb0WUSLv5kNEjt+v4enSrsjQtawLjLp6/yoIy+wqR68TSNZWYw8R+wv2MYxR1beJyB21Y+Kcqn9ZF4xIT9qr3jJhqix4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLvKk2FbHilbXz+59NcczQoJf/+CVQLwv5fauieOTGQ=;
 b=vfCigUEc5eNVHphgvw0oY56edPI7zu11nNyq7ONLb2J7f4otX/mZ/rWtiN7B1LQoldc9vK9v/fhUvFGYuQXvPTmC5Miebl5be5dhSGxhoadU8NSTtQlgVUM6peRog7biGGKzaWXb+h3ArEivhhd5qlKIvlKnRljogqhATO7gwqvnQseZc1lTYRY2YQVTt++hgaEo43uLwrsRbp5bCRAwpqwPtGaAw3pTrrFdmwQMTGwtFB1LK+DeaB/O+0XnWNa7R+KBrhasMb21H6jkyEwj5+PQlANwuGYAxounPxPBInzw/p8XvX8mFc4uNMtzqNTwgFz5uPYKMCXpT1makzXIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLvKk2FbHilbXz+59NcczQoJf/+CVQLwv5fauieOTGQ=;
 b=NAN1CwL6gW0t+hhiFyZ4X7OgmeDOvV1SpQHfmhXVuPDNJC+5DAUbSlxnoLPXPd1Di0y/4mS0zTjPWRGizTsTuexw7sWQBCPGhKgXfmT/yhGsVvEGs1lyeJasJSLEW+Os/jU32H4iLSfCtNf8p2lfqAX5zq/qFmVscC5DxaEJdPIm2ldsROqoL5oP4UD86iFkQIv1/Bq2+Eau2MHZWUrjDflqw7xLTO+CaxKvh9b9hLaOdgMx/YzZYnL7AyJ4Yyo3nsjGsv256s1op9e7sxZvKB+LrhloiU4EAJonnwO8rs09x6oYDjqR4L8vsLpT4MvOXq3UOaIDbkkLAHDol5LOhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6781.eurprd04.prod.outlook.com (2603:10a6:803:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 16:32:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:32:58 +0000
Date: Tue, 16 Jun 2026 11:32:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 1/5] arm64: Rename page table BSS section to
 .bss..pgtbl
Message-ID: <ajF6sOFoWtI3N7ir@SMW015318>
References: <20260604151151.150377-7-ardb+git@google.com>
 <20260604151151.150377-8-ardb+git@google.com>
 <ajBcE3qfT7ldBNKG@lizhi-Precision-Tower-5810>
 <fe467789-ae72-4a74-a9c0-6062b522fbd2@app.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe467789-ae72-4a74-a9c0-6062b522fbd2@app.fastmail.com>
X-ClientProxiedBy: PH8PR21CA0022.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a34f52-6945-4cea-4d17-08decbc4ecbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006|4143699003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: A0q5eAo+1XCkpBaDpIxcXisip3TTTleJkFLz4mK/Mh5SbRHbiYWqTH/iDVUUTRMaXrcUQQfe9K26mkbuuz9r84yoYU9xyeJCIZho4ReA6CRgNPpx1jEAGK9MODMmV/a9Y4act4hFrlGJeUEuf5PsHC6pAenSd/u8mOv/Z5NdIQJROvBNfFJCn6MdOTxFB3oTIEFVkUcM6Dlaz/rG03pJ+MkWMrKmQluYjuwYHTuawnEdwObj8JSLjZPQBgQhUyC4nH8V3crLjSWtRqt8xvPLH9ECGBO1W/OiNxa8ynuK0nFeVSzFeWrHn47knSTovv2ocwa7rqLTAtYoAU6TiOBVMGZajNZakIp6u4N/8ch2SVe8PsMoQeQWHQ5sao3ZMAU6ciCZfxp9P4MlJ3m94Q2W8IVA07e5mVaP0IndE6lxefiJ2+01eoJqoCorlm1mNi5Jqph7OR5ufdqTUi+XiaAU3FIXmBkzP/TqTg53EIVeG/xiL0rrJHVADCHLQHH0TQAfqTZG34zyfUTfETpsbvd8R+CnvdwdkFvw4KRat6u4LEt1Z9nmu377f80LYEjPxHDIMV/F1XC3UpM5bBatnR1yFRVrLM63Kots8Yy2EF6e4A5IY/LayX0Ww0RT4qImQabmRoRlet5ZRKk0BsPfBZWAkpaDOiu/WY/XCAwy/vHTmXdVrIPBdhJMkF/x4t2QTL6K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLVv4EUkR3UQLKxGZSCMlQtcbA2yCsG1lvKBB+19N1QYxDTdOZg6fX3lGBbV?=
 =?us-ascii?Q?b18Ft2S0HbqGUYsbhJWrnhjRlKhq6KfL1W47EtYIYuOQsOTMMhPmYIGnvCPe?=
 =?us-ascii?Q?r8qjWcRcwQMuNeBgQIuigx6NXqWGVZpwnE/Y/wJPyENh/mt7QV9f82mvkYoi?=
 =?us-ascii?Q?pWU7BUI0YJssTvuMeemDyOzZ0LQeBWjbq1kfXBBBVHXBu2HCzEPzcMPsIF/R?=
 =?us-ascii?Q?EHCrpX868xxkMDRYXvyikpMJVdydd0BWox3MT1Bb3nMfG35peLEV3/MoHpaF?=
 =?us-ascii?Q?Xa0BgrPZyoaf9wyD8BElpWCPxw+DkVPm0qFnoOQjGAfUePrkCDiLohPAPFLv?=
 =?us-ascii?Q?MhDOLQxmjlz+oipUCMA99Hv3XZpFizNwV6h70k37mugf491ZJ/e54+eX/wn4?=
 =?us-ascii?Q?NIv15lXtzjUJx+3BtXcd478idgVzoiA/FnvZs233m8IZRuH84kga9dCVisxG?=
 =?us-ascii?Q?lqaa0bvgVkcg7svIeKB8p1Lf3JyH8Nj5nu0arS4n1yqRAhE+oP96dEuWppyt?=
 =?us-ascii?Q?q1lnMM0Xu9xHVsxAuQ1YiaLdDR2a5pGBynwuuT/cjTNIMykH2plFlRLamL+d?=
 =?us-ascii?Q?zdthrpxv1dN52vtOtR8FA0W0XfcP4Zq+s5PqxLneFvQtG9iqSPNCasiR9D4c?=
 =?us-ascii?Q?gwAu8lZCN9yf5oS95rix38eu/1QpCMA5nEHTNOHspV8V9Rouk5U5TLQi20Kq?=
 =?us-ascii?Q?MZ1i+IyJR05qyiynXgrKno4unbCc3NxKnY3eGM99U+PZ1763KGiP37UhpvKR?=
 =?us-ascii?Q?ZHfAmQiN/hDNE4GXdYpPJJuA3zhicsTDPEldMaVE4U7Jq933KcbF+ytJpYiR?=
 =?us-ascii?Q?9bVbqEkBDyx2e9JSYH4UdFge3vLnDsrcnsB/O6G40JDPZRbYzl0wN+kdUBos?=
 =?us-ascii?Q?LBXgMeDAjTv5CH0HsDDbNY6kk7aFrZ1gGiR2VVhsDuOTwO3hZ5/fueaagoWo?=
 =?us-ascii?Q?S0kWeYZyVhbzAq6QV/ZqIUdOgqGp7l4J1aeVNMAfaIqJ8W3L76zFWb4Ytbdl?=
 =?us-ascii?Q?D7d6ZHSTO0i0DDHH5O7B7j1OOsNq7NVLL5kp5gbwAl0TsnmIJrEkZvXWpk1R?=
 =?us-ascii?Q?LF0N3LMOZC/MXV//ARAK1u9NyQbwnKGDGwKFxxbrVmIRu+Wqx3sRyMSh+tQr?=
 =?us-ascii?Q?dIOPAje3eJ/LGBX6hPOuATG5ibWHGrok5rSSqG1uI3HWdMMYMzwcJ3gcyW+j?=
 =?us-ascii?Q?mkR9a9EkkrwF7BIdE515nQnOXzs91otp9VqinbQl6dOEEpE/+gIE+wFWRkfv?=
 =?us-ascii?Q?AOp7bJ3TCVr1jzqDvmMpdwwhSd1BLOzKqLd+CrnhS1tTMO1BXKmpA2NNjohw?=
 =?us-ascii?Q?YkFIKQRA4v5EojCNBIOuBHTo7HdWkUNitbvkTpWws+WuACmrA9J8ejT5gEy2?=
 =?us-ascii?Q?vcLF3lVx00KbUb2zwVUqj2pBCI35asUV5ME6VniXS/nlCjeE3UybUmQUYd3K?=
 =?us-ascii?Q?jpAloCNCFlNhdpJxgFHnaeV7L4+el0sasBKl9HU4Tom+y/KajiA5upLir0jA?=
 =?us-ascii?Q?ZZOIRJGYE0Gp1yAO8y60MTv4aOkyF83K6Jkelr1PHZ4uH/+lL0mpqDqDPV1n?=
 =?us-ascii?Q?qsmMXxERYdFfpDsdLLY/9UKw9P6kGRUqBjyKQwOGlM8LgXYMW7oY51/rrd3c?=
 =?us-ascii?Q?AeaXGj/v0ZnW9SuE3bphE6DVF6+pfI3dc+OT2FjT2LBkpUX/Y5nD7DbwzqwV?=
 =?us-ascii?Q?YQhBJ8RZUhbxTywc2Hmsn2dfN/za5PaG7mY8P/HnkulaSPFnX1W6jLe6/yQ/?=
 =?us-ascii?Q?OW9gzPQtfo3n3HJfu/Scg6N08xFTuZcHNevUe7mVhmx1LMmxzldB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a34f52-6945-4cea-4d17-08decbc4ecbc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:32:58.1741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Er6sVMlJJ8+ohJ0bKDt6bARJxnThsPDgMnWCibk2fLTAcqXPGp1jR6ZwoEYPF+GlYjVH36r9Fl1K6WFP0Mpb8LYl+sJ4oQ3/drB1FElKvr6+49sH/EPu5gskfZh3Y10
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_093303_593041_EA196387 
X-CRM114-Status: GOOD (  20.36  )
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

On Tue, Jun 16, 2026 at 11:38:48AM +0200, Ard Biesheuvel wrote:
>
>
> On Mon, 15 Jun 2026, at 22:09, Frank Li wrote:
> > On Thu, Jun 04, 2026 at 05:11:53PM +0200, Ard Biesheuvel wrote:
> >> From: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> Rename the .pgdir.bss section to .bss..pgtbl so that the compiler will
> >> notice the leading ".bss" and mark it as NOBITS by default (rather than
> >> PROGBITS, which would take up space in Image binary, forcing all of the
> >> preceding BSS to be emitted into the image as well). This supersedes the
> >> NOLOAD linker directive, which achieves the same thing, and can be
> >> therefore be dropped.
> >>
> >> Also, rename .pgdir to .pgtbl to be more generic, as page tables of
> >> various levels will reside here.
> >>
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >> ---
> >
> > I met boot failure for i.MX8QXP by this patch
> >
> > [    0.823515] Unable to handle kernel paging request at virtual
> > address ffff00000328f000
> > [    0.831116] Mem abort info:
> > [    0.833886]   ESR = 0x0000000096000147
> > [    0.837622]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    0.842923]   SET = 0, FnV = 0
> > [    0.845961]   EA = 0, S1PTW = 0
> > [    0.849088]   FSC = 0x07: level 3 translation fault
> > [    0.853952] Data abort info:
> > [    0.856809]   ISV = 0, ISS = 0x00000147, ISS2 = 0x00000000
> > [    0.862296]   CM = 1, WnR = 1, TnD = 0, TagAccess = 0
> > [    0.867330]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [    0.872633] swapper pgtable: 4k pages, 48-bit VAs,
> > pgdp=000000008211f000
> > [    0.879321] [ffff00000328f000] pgd=0000000000000000,
> > p4d=18000008bffff403, pud=18000008bfffe403, pmd=18000008bffea403,
> > pte=00e800008328ff06
> > [    0.891834] Internal error: Oops: 0000000096000147 [#1]  SMP
> > [    0.897469] Modules linked in:
> > [    0.900514] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > 7.1.0-rc1-00016-g63e0b6a5b693 #834 PREEMPT
> > [    0.909978] Hardware name: Freescale i.MX8QXP MEK (DT)
> > [    0.915104] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS
> > BTYPE=--)
> > [    0.922053] pc : dcache_clean_inval_poc+0x24/0x48
> > [    0.926742] lr : kvm_arm_init+0xa78/0x1638
> > [    0.930828] sp : ffff80008318bd10
> > [    0.934127] x29: ffff80008318bd50 x28: 0000000000000000 x27:
> > ffff00000328f000
> > [    0.941251] x26: 0000000000002000 x25: ffff80008219e000 x24:
> > 0000000001002222
> > [    0.948374] x23: 0000000000000030 x22: ffff800081e850c0 x21:
> > ffff800082b790d0
> > [    0.955498] x20: 0000000000000004 x19: ffff8000830a0000 x18:
> > 0000000000000000
> > [    0.962622] x17: ffff800082f938b8 x16: ffff800082b8b4e0 x15:
> > ffff800082b8b4b8
> > [    0.969746] x14: ffff80008308f0a0 x13: ffff800082b8b490 x12:
> > ffff800082b8b530
> > [    0.976869] x11: ffff800082b8b508 x10: ffff80008308f140 x9 :
> > ffff80008308f118
> > [    0.983993] x8 : ffff80008308f0f0 x7 : ffff80008308f0c8 x6 :
> > ffff80008308f078
> > [    0.991117] x5 : ffff80008308f050 x4 : ffff800082b8b468 x3 :
> > 000000000000003f
> > [    0.998240] x2 : 0000000000000040 x1 : ffff000003291000 x0 :
> > ffff00000328f000
> > [    1.005367] Call trace:
> > [    1.007800]  dcache_clean_inval_poc+0x24/0x48 (P)
> > [    1.012490]  do_one_initcall+0x80/0x1c8
> > [    1.016310]  kernel_init_freeable+0x208/0x2f0
> > [    1.020654]  kernel_init+0x24/0x1e0
> > [    1.024131]  ret_from_fork+0x10/0x20
> > [    1.027700] Code: 9ac32042 d1000443 8a230000 d503201f (d50b7e20)
> > [    1.033779] ---[ end trace 0000000000000000 ]---
> > [    1.038428] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x0000000b
> > [    1.046026] SMP: stopping secondary CPUs
> > [    1.049943] Kernel Offset: disabled
> > [    1.053408] CPU features: 0x00000000,00000008,00040021,0400421b
> > [    1.059316] Memory Limit: none
> > [    1.062359] ---[ end Kernel panic - not syncing: Attempted to kill
> > init! exitcode=0x0000000b ]---
> >
> >
> > Any idea?
> >
>
> Which tree is this based on?

Sorry, after rebase to 20260615 linux-next, problem disappear. Problem
appear at next-20260608. Suppose some patch fixed this problem recently.

Frank

