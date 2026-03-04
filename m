Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E88DEF8FE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9bn0G0BpHgJ2dsfxLIhslyVs7HFs3h12V45Adash94=; b=ISGnBgH1OA53yIWjTbEQ2xMDKi
	ADCV/SjTFjaBCnl9EjTsoMcMg37TD7rqMTUu5QmiJSkjF8zmk7Kyx+NXHhNBkaW/gwcMnF9Bw+qfN
	snoa9RHj3KmFFCWVqN0NkzXCTFzL3Z57tOUeAnhcZ/fu58cuSkUX/lpbfKvr6EnCl3TSY/pEHOkXJ
	Cevy/m+y6aQQoy3SubdPu1FvXuLYlvY0vuw/6kwZ+JbhGTYyjO7SnU/wLRJScR1PjX40M3bbD1Lok
	W1vf+67CuMCqFu/3XvI231CdS3ntGnHw5CTenuKU3CUccpFb82xGClcv8QKJQYrwpvI/sfQMqnqG0
	GlWQeruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmX2-0000000HGv6-3NHp;
	Wed, 04 Mar 2026 13:44:56 +0000
Received: from mail-westcentralusazon11013033.outbound.protection.outlook.com ([40.93.201.33] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmX0-0000000HGuk-0Jk1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 13:44:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dpf2kiVLfbu6/Hx0aNdgmUZ11v03QSIEp1ys6R9rbxIG6JdH5w6o+kYgycakIKkOiuBoVcIqD1Y5Y8XLtQ7qjDtVWR/wvnf2Jh3422gwIt+PNKHheY83Er8bG5nwWDSI1JXZMZ4IIPaDAe72sXY5sDZvXqr20dsqF5ZbciQco76gOpiGcXgutHxJvtt5td0EQovaoUENN3BhgV4C9cBbPuvOaJoZ9cBZZ4/a9QqIISg5ZFBJfInYdLmTuj6JHYfF5GZ0GAPVaiB0rvG6YftGZf8dTd7rjHPen5IPEf4r/huJRbEIxuS5e0i61tJpV532kyXVNvLHpOcyMxNM295hEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9bn0G0BpHgJ2dsfxLIhslyVs7HFs3h12V45Adash94=;
 b=bI6b7tTMYAzZkPsAbDvrOSjIRl2FKcIORdCyoqOZCg5QjVUoWxCLQEaxL/KbPmZHDDHph2mQ6LCwyF0LZdEfaTeD20+9mLBzBRASMpSb35fOUjCZI1UfnGHtYxN6lARaKU8GTjXzJYvWerVidsKonlYiF6qjFKgVeDTQvVxVIuamoMr9r8z06389gBg0OrtiHR5olpfocSWs+VG9a/z5q0H5J/Nh9IGsP74VIrfLmfin6OY7UqEdOVhgtyvvktwlpx6GLmpJhLRgoq+/PPBikcZaW5WKQM6PzxDJxvGJeiJbIwERGySeXk8X0rfPt2J+c23m2+tjsNhFk9EMwW7Z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9bn0G0BpHgJ2dsfxLIhslyVs7HFs3h12V45Adash94=;
 b=R7nRy7id9kwRX6eaA8UpO2RF19qPof9RDjpRGy0sxh02vegBqX4dLHDyH092Pr1ip+H3+is0PvRT4KnjRoo8judMo8r/3JQGGvFF6WIIWnM2vNxTvxPt5dkACr0ODXteTkdb23lru0WC17AvikadXNqFZc6sfu7Uk/57hDRTwDCKpxpmxe/doQh42f7IUbftperC9CdfJbo1Oi7hy9QMbqOWtfvxwauJlVovfkxoTwJRbuc8lJIpKazlu3IlNvPW+L319IC+zI/Dsd0XlK/D9ezce6Ekr8wdbudKYy5RY3n6nnjU3aWDPkyc+fFkOytTHIbbXh/ZY5qXlsDEaTU8YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7422.namprd12.prod.outlook.com (2603:10b6:510:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 13:44:47 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:44:47 +0000
Date: Wed, 4 Mar 2026 09:44:45 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Piotr Jaroszynski <pjaroszynski@nvidia.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Breno Leitao <leitao@debian.org>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
Message-ID: <20260304134445.GN972761@nvidia.com>
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
 <0a10ea33-937a-4294-b9a1-9323c706434d@arm.com>
 <aacohVRfAK46lOjo@box>
 <20260303191217.GD972761@nvidia.com>
 <1080db49-2f83-4fec-ba73-94c6b3a8f7fa@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1080db49-2f83-4fec-ba73-94c6b3a8f7fa@arm.com>
X-ClientProxiedBy: MN0P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::32) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: a214ca69-7392-42d3-628c-08de79f432f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: TyCjhN+021woCMUt/c/jkIYbKo2BrGV9rRKgRQd4DDvD6iGKOMvFhfjapjmCdA4Wtxqqducl3IxPKwZ33h97BrUIEIygI4qfeP66JSaWBFJ+rR3HT/0LEL1GFMV+yuVMZn5Aj5/3JOXdhVrV/BMM6Mf9HeJsS7DpuN+PLVgabm1zwUfsgJkoynfM2BSQGoiCcN5cLG7lxr9+X/+G/PDUGnE0m07UH6ilmIL6eNRlOlyvunhnQMEXmVGBzPkoLyqX3SmSGDkzxKMuzEZMZUu4ei62LV7+GGPsfUXPAUhESYfiQs2AuM2nuocAko5sSYE9HaLeS3Ddqa+T+n65CLNhSlW0CL1aBk7ZIuWJ9cBnP9Lxwhf+UfyH6Bd3BGu5v7jLGhEo9ZfVSnBDjTrhwb388myiSInfuR2Vw3xgt0BjEh6bgOV+tu59OHH3ntz3q1L1NrfgMY4TfW/nIYYCxnmJu+9mNq3Km2+GIbuqnGPLWkoCCRaJN4BYyduaGS1ZOoFP3SOb2vsaUNr+GFU0AmtpXs30g8PnIhrKFG6B6qZDkJiq/E1F8zUFevkY7VXePLyF3h+fYHAhXPrkuVSrOBjj5H0v6hpv84G8ZI62mLrjYb8MTCBaHUpN8MYODoh0hkGwqCXe2oWegCBwDyDvXJPge7H+WxmjqTmVvBUgollXAzEDtnPbxKktr9rzBTdoBQtEQhHWlNUfpEGaDadxzQ6UwMBdLB/Y97TDQvawp5Bbzj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PHCtCp94ofkZUXd3gl/bv3Eb69WGkiB+SUqlKWgcmALf7NhVcL8tqtSousr6?=
 =?us-ascii?Q?1kxlgnCYANR74JhELcSNlri+4g5KHY0B8L+Us2iT2lanRF+23EiJ1paTcFfL?=
 =?us-ascii?Q?K6QkJ7keW4/lCoAdXkqcczp2pXqNVcKvPhJrGDMngMoomtUlA2udzbbSdfpX?=
 =?us-ascii?Q?PholbQpgCoc+uCjEC9KUMnUadKk5NN9fqihlQ590FAiTJYQgpAilyCJqNqZK?=
 =?us-ascii?Q?swBDg3Iza/nU3pZ3NmvVj5WXh3bU0IoZRaOyTgw5dWtVp1DeBJqfCbcJUW61?=
 =?us-ascii?Q?qiSXc2R9FJub2zhr49X3hrSc/d7RkYpHd8nluONNpMbwDEGTIIgrOBshlHnR?=
 =?us-ascii?Q?5dtRZ/WOktISs3NSKzt5nr704++PvVlQ5XrIfieTSWBFAvpTnbod5NTu9cEv?=
 =?us-ascii?Q?uY8cg/sK7Lx46XWECw7V+swmquUj9nRdYJkmKwhmimCtGfDIkafAOFRqiH9Z?=
 =?us-ascii?Q?8q3wTNtUr4JLv3nqvUwrYXHkK4wVXfs6MXjkGOitvTng7ovwua13eCnWSTcD?=
 =?us-ascii?Q?Rc6aahuQIxEAcFst0uMgMGMxWJjCeqn4iAwWEeh/iQZoEhLLresT5LKaazVZ?=
 =?us-ascii?Q?DtM2hI90uUWnI7QQPF1C4I+CENbfTOihOHW3njxz6gFVsBl+Kz5miVDknJII?=
 =?us-ascii?Q?eTCraHMC2ROV7sn8SRLyn8vAthdRfHjXs1mlELR0Yiyuvpc1ohAdKAc24WvO?=
 =?us-ascii?Q?ijd7zHDZE60gbFQhB4/N21sguP1nBO07szVnXrbunFJpgPDsWriCqgzieEcP?=
 =?us-ascii?Q?QJju7h0vkAYpJdoAEobnHcl8TQ4/kf9gWcddzXkGzwHINQfQBV4e5xZsU4jJ?=
 =?us-ascii?Q?G+nomHoHeDWk12dXH5fwWrFoXLqqBPn9KpqVtWTBraKE363aucNvSXk2XZU/?=
 =?us-ascii?Q?0crsYfBnZbSyTy9MjQO3k7ahqEk1e2mNnFis57t89DJO7zx0mG6RxublLVEm?=
 =?us-ascii?Q?tLo0E+WrwqkWEWYoPkQsZsSbqhqCpHAQCBPdF45mm23lS/u8bJv7BLZO1hWl?=
 =?us-ascii?Q?Wvvtr4MrkykANx3oQYJaVptJV+k3bhppSXZNbDeKt1JVGeqNkD75ttVcjRKi?=
 =?us-ascii?Q?E87Jr24YQA8BU9XxHxqJ9WKRAdYuSpgSZ/kSDI7A5pPfGj0WuCs8mbj1MkDu?=
 =?us-ascii?Q?8Obnku+AnMN9OR+/oHuqbM0i/LCB0HjqpKjaMlzcjFYwCGhM8W1JbSXqux66?=
 =?us-ascii?Q?G859OgsvG2mAHroNkYfdbFznxE25DuYQ5P1XescJokSUdH6buTo69KJf7I9z?=
 =?us-ascii?Q?X82I6N0yppVa/X1ioz0ZuHcD8oUhOmeGM35kbnQVr7fI6TzPE0ZR0J8fQbjM?=
 =?us-ascii?Q?ccMXmXKimydJOvDZfqMIPGS1KLxis6C9lk3c6kQDF8BXOAeGUdzFy0QU8SNr?=
 =?us-ascii?Q?MRQiLrrbQQljTXEmWZZ8wYNhrTvdSorjGpm4rkedo2+V8JtijXHPooV5fmQc?=
 =?us-ascii?Q?alh65ZJ6w/3qqlUkPED3EYhF4O6w6B3wQHu1wzdkFy9f7wkhg4T4rUe6A9c+?=
 =?us-ascii?Q?2yzDHTvtSZALtt5ORZV8JUbYkKUfuQ4v8Q3t7RRLI/lofThvFWVKYuwlHkt0?=
 =?us-ascii?Q?eZFBaC/ceX0c6m5FtTwYD2y/rp09TiGqOnNJvEBjOnSoDFhFEn90xy9i8Nq8?=
 =?us-ascii?Q?Lz8ezf8meEUXrgBV6qAw9M9XJkm8lBkTnPtN0qaSTo7XiRrCKg4Orf9fXw0D?=
 =?us-ascii?Q?FBYTi8otC5f1wIxTo/5LB0ZYhS/DTWZl6kuBkWG7QXsD0RZPCxKK/jbkzFm5?=
 =?us-ascii?Q?fvv0G05Tqw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a214ca69-7392-42d3-628c-08de79f432f7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:44:47.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2YObPPYNACpZ309HAzo+gmSjqojqSTqYye39klcov3nOFqhgsW+oMM97tmaCtL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_054454_116876_30AA1C95 
X-CRM114-Status: GOOD (  13.04  )
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

On Wed, Mar 04, 2026 at 12:20:31PM +0000, Ryan Roberts wrote:
> >  static int __cont_access_flags_changed(pte_t *ptep, pte_t pte, int ncontig)
> >  {
> > +	const pteval_t access_mask = PTE_RDONLY | PTE_AF | PTE_WRITE | PTE_DIRTY;
> > +	pteval_t pte_access = pte_val(pte) & access_mask;
> >  	int i;
> >  
> > -	if (pte_write(pte) != pte_write(__ptep_get(ptep)))
> > -		return 1;
> > -
> >  	for (i = 0; i < ncontig; i++) {
> > -		pte_t orig_pte = __ptep_get(ptep + i);
> > -
> > -		if (pte_dirty(pte) != pte_dirty(orig_pte))
> > -			return 1;
> > -
> > -		if (pte_young(pte) != pte_young(orig_pte))
> > +		if ((pte_val(__ptep_get(ptep + i)) & access_mask) != pte_access)
> >  			return 1;
> >  	}
> 
> I think, based on all the above, the current version is actually not buggy. But
> I'm only willing to go to 95% confidence :)

If I understand it right James already found and fixed a case that
violated the invariant right? Maybe it is wise to be robust since
things lock up if it goes wrong.

Jason

