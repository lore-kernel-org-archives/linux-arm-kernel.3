Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC77EDEBF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 21:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsAktVzTVMuctJJU3gst5eI4x0VEEaJ4A9luzhMHquw=; b=THbmfpwZpAGzkeUxawAqCOIhpL
	pPxK9lKFZ+MYIwJZVfEi14b1gLgud1VuwiTmCv5wjae9cBGfYCkIDab1Y3HatfENcYlLImcyXXHS7
	xHL2ba+p+VT6IOByVwITV9AjSGNSz4e3Fu2C+YyboP3M4eiG34OD14YxqEoqNZHMLK9BTWowbx3JB
	SZEeYH4qLiWk6JD+i2RW1UefKP3pHx8mUyR3aeks83nKsgJDeeqPJfpWfYKeP9qrKqEuMNrPLwTq6
	Sh1xG8e9EgUmaj/sg3oYE3Nu9iL6U4Cqow7qp//A0xYdr7oIaxFh6k+mua7kj12d30BpvsNx0NUg7
	qnmF2KNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXTx-0000000Fzso-2Thh;
	Tue, 03 Mar 2026 21:40:45 +0000
Received: from mail-eastus2azon11010006.outbound.protection.outlook.com ([52.101.56.6] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXTv-0000000FzsP-0uGN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 21:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ztv5h49WG0WgeQigd03qssuyiEh52iAKLsg7Cjvev3WRB3Mt/nvS1G6JdM4FNwYDkC6rKuScji5am/ZFviUfWR0CP1b7Gu39nd6NwVjj5p1Ro0RRphyetSKQs6ubRvalDtFr2zlTRbuVMbgJDRAWswh3gn+5wST0oTTnX+UDuNhsAb9L8TzCY9B1Py3sPhujSPwZJBLcb+3xSuF3Q3WAHEyd6lKSwNEb7gqMtPMt/q1uF15EhOV6Fu+lyF7b5hmrYHUXX8JqWBGHI3mE8MdxnbTV8ujFao797lv6pIShjB9+38E82sigo9ReCRu4mLG99wD67L2adEEK0KQOq5SDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsAktVzTVMuctJJU3gst5eI4x0VEEaJ4A9luzhMHquw=;
 b=SWxpReTAOy0P79PmbNS1objCHA61jCacnOQ6anI2tLXdYHVb8/vRZ6LhqNp3C8nniDUdsHJNFH2B04XQiM1r/xwMqigFCbZJuaUWC6HKPCUb2RWNNS8+bifZ34DXZp5QDpyQ7hULRvXV+IJwbSWgOLdMGLpquJNsY2/1of75bq0MJpOfzBv01qu/CN6Z4qzc7ry+LSVRvT35xgYfwfb3beABWXxIVw+G+TiP7RS/7Qhv+VIgmXoggjyqAti3hY4foKuLhzBzMO4XIYkcRxc0NSD/EmGfvLkTtfSbYqIu+rKpJCpeYGx/uK9nmAc40V4NA8m8IJCHWgbC6JGy4NBDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsAktVzTVMuctJJU3gst5eI4x0VEEaJ4A9luzhMHquw=;
 b=W9X0EbKwnrRcfhdl2uTXSzGesGlDx22AA+eiTcqdjFwAdeB9cdIH0rkyeWQJM4OVpk3wqRmQk7b2cO5iYx+17r2jKx7mxhMqMxb1qSSVO0WocwXxpZYX0tdkfYAT2AxIiuHT/MpuSoJ1WfLKwAVlZG6M9mOTrGxOPSjPb1WyZBvSYWOLnD9QU//LCK0Vl5797tCCzPm3UrWPxeZ05IMheRpO6sqlAbgn2+cHkgHXhwRB/ENo9+9czL4XLLlZAH6/MWp7VKRoIpCcUz0McniNhLievMO7tQi5zvTYBpb10DNyfkfLj0He2mD2/eFbAPpnQgz3aLpAN6qlrN3AYKY3dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) by
 DS2PR12MB9773.namprd12.prod.outlook.com (2603:10b6:8:2b1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 21:40:35 +0000
Received: from DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46]) by DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 21:40:35 +0000
Date: Tue, 3 Mar 2026 13:40:34 -0800
From: Piotr Jaroszynski <pjaroszynski@nvidia.com>
To: James Houghton <jthoughton@google.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>, Breno Leitao <leitao@debian.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
Message-ID: <aadTuvCBxiVimDZA@box>
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
 <CADrL8HXaTz-TS9rYiQkZ6NoRWhHm0t4Tv0t=TtDXS4purLnDJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADrL8HXaTz-TS9rYiQkZ6NoRWhHm0t4Tv0t=TtDXS4purLnDJg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To DS0PR12MB6559.namprd12.prod.outlook.com
 (2603:10b6:8:d1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6559:EE_|DS2PR12MB9773:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5462a2-75c7-4990-ef8e-08de796d80d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: AyB4HfUy2y25VWyRrtM6XSDCOTC+nmsSmhn5gZbfgKPysE4bHfV0td/S5ykEn6OaYiPNwzw9AZlZkdm6PS9ytXilOLFYriF8JTxOoT+W5WIuopFQEcpSZffpJObYAkcpDhw3x6lXTFdTQaXP3gW9Fq7ewviz2LKOTBHpxE4fDC70T0odvc7Cmge4aM1VdfbgfsqWXpsHEy8pRJ8MGp+VQaRWKuphbTXxECyBb8A+s0Li5++9Sx1p/wKhxBlYx4VKDKMdlzjLuCBOXyjeTekozqKQi4V+l8QWmxvzwyV+C2A918YNqvn+7MOLqpn/RqaGkPGB0k6vdUFvqEx/PMPIUac/8cGVg5kXRzjn8dOmvz8mwKuBFkuKbdsLh5LkI4/FbkrvTBSUOAFJGpUP/WLNYXBMdqwy+h4LXRbkWPt9FrLF0/XF6KSaIbdqtOhB8Q2ABvjtVN3oKncr/bkG9R/phSTOUHuiqrzqf7wMySkZA9l6sEjVJhH5JNIa2PMJ3xezTf/4JyaIlQRAVOAkYN5eIja7NmA67p9pWb96TQew7JDxqSTgjDuxyoEB/CeJOLJS7hVTxLFhw4sD51oRku+JO4cmS2L5z+xfBtKL0YE1inyb72EVQVCI61gUQyn9BK6Ocnlw2b2i6yUcNOmHkYi9zubOwiPs5RrlAgXJ8uyqla5qawxQgygPZSjP/VG+PBD/76wPe9Bggoy/aubTwYQtOruji6ymxIwkXBrJTa7Q9MI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6559.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0dZYmN6cXpWWFRmN25jeStIY3JYMmIyaTZpTGoyMWpwQWlQS3JYZWYzVVdU?=
 =?utf-8?B?QzFSWnpqZkZ1eW1HNklsRCtsanQxVldXdVoveWRtM013dlp6TnA1d29YNE9k?=
 =?utf-8?B?RzhaUElDam8vZUFTT2duUlBrdFQ2MllXWFpSTXdGK05wbXpWdU5jMC9oR25m?=
 =?utf-8?B?dzh5a280eHBZNU14Y3YrWStFMFM0Sk1XTUNwT0NFWS9Vc0lVeDJxUUovMzg5?=
 =?utf-8?B?dklORWlsRytqRTNuWUM0amtjVFRZM0NuSS83OUhxMGEyZlNjOEpGbFdDUFlJ?=
 =?utf-8?B?aGIwcUN4b3Zhb0xLOWxqL3lLcWtVb2lqZWpkUUhLbjIxV2tjUEFIUVoyMCtY?=
 =?utf-8?B?SmY4NzllRDFpNk0yMGI2ZDNPL1ZRRWpDdVp0Y1ZCbWZWSW5HOHdzUXZNNWlT?=
 =?utf-8?B?L3dQdHh2QXZhTExZbGZpU2h6RjJMREdDeHozMTJKMkptcTRmQjBYOWIyRTc5?=
 =?utf-8?B?VDFsU2hBK01mLzBvOEtEWDdXMkx1Vy9CNjhuS1A2K3o2dSsraXhLZzNNUUFt?=
 =?utf-8?B?RS9tUHdwMzE0cHUvNU9VUTlhS0pmbGM1VCtBbzVDOU16QWlOdGtsYmFVbVla?=
 =?utf-8?B?SGVZNHV6VDNReUt6UzQralgrNVhOY0tFTU1aNGRqNS9acnVtSjc0R295a1ZY?=
 =?utf-8?B?c0JVaGY0Sm53eGp1VlJNQytycFVhcGN4Z2NqWnlnMjBwTTVlVWEzTUVpV3VH?=
 =?utf-8?B?TkhpREV4WWRhZkRJYVJzalV1SFNzMHNuRlVYdDBMSE0xaW43a0w3TTVWelA0?=
 =?utf-8?B?RzhaWWtyL2pxeVluUXlzZXNJMW9tMG95a3RrK1NWcFNBNit2cGR3UXlCSTNH?=
 =?utf-8?B?NDh4bGtVY3V1T2haeWZCU1NFSFVLVWUzM2JOdTBLVm9pSU83SEVnamJnR2pE?=
 =?utf-8?B?SzY0YnRHWC9NUzRaeS9qRDFwZnZzcGZUWGdpczBWQUpqRTVaM3cwWnhxcnNV?=
 =?utf-8?B?a2V5eU5UOERKeEU2OUF4TUNlRzlZclcxVHZEbThSUHYvK1QzTWRIR3dYWEl2?=
 =?utf-8?B?bFlnOCtsSlhvUHpBclhYZmxaM0VLeWIyRHEyZENPOXE4OGMrRDVUeFpmNFNE?=
 =?utf-8?B?ZkVINHgzbkprMnBRbzhLa1FZdXB6bWZHM1FFRmFFNkgzb3ZVK2ErbWJTMjhX?=
 =?utf-8?B?TUc0bUJrTFphWVVSdWN3OGZHdEZkZTdCQTVmQ2FvYS9ISmh1QWNRTkdGK040?=
 =?utf-8?B?L29oSzlRNUhVVE01QmQrS0pVSUkzR1R3dXVRYTJwNGsrZEpQcG9iUlZNUEJS?=
 =?utf-8?B?dDE4dEFtNDY1MHI3UlZmR2FzR1NLZEo5UzU0cFlGaXU1WVVLWm50cGVEN0Mx?=
 =?utf-8?B?Y2VhalNFdGpVQythR21waWhtT1p2QXZ6ZFlQZ2w3d1lSUjIxTGpJeHRBTTJ1?=
 =?utf-8?B?akVxTHpVS1VOWUxWbTNCV0tNZ1hoUjZLTHI3cXNKQ1Vzb1B4REt0ai92MlRE?=
 =?utf-8?B?V2JjS0VzVjNTaGxIb1dHeHF2a1BqY1JuYkhYTzhSQWo5djRSRFFrWmp2TFpv?=
 =?utf-8?B?TE0yb0hVQi9oazdBY1VVbzJFbXM5dk0yU3JxOHJrM0F5ZUExQUlnNXU1NWVZ?=
 =?utf-8?B?NjFmV2RvWk01Z0ROZHBoaVhxNWxmbE1wczFibnZXQWxteG5CKzllVFZEUHpr?=
 =?utf-8?B?ckZrT2xnR0NPc2NDdDE5WFJONm9tbllJSXRPYThaaFhUaGQveHJMTm51ZkhC?=
 =?utf-8?B?YmNVaW1kL1R5WnRJQ09lWXBMWDFDY2ttbXYzcm1zVGFCTkhtUmIydExNMlM3?=
 =?utf-8?B?OEdXZTZESE5CVDZpY0xBZnNRUHZXQnVJcFRsUlBuMzA2NE9wbkRtUmJXYTZk?=
 =?utf-8?B?OGRSaGt6eGRxbkhMK2J3Y0F1NkdMcXg3cFZlVnpaNyttWHVEZklWNjkra1hQ?=
 =?utf-8?B?bEIxdkkwS0hreXR0bmFuQXU4M3l2U053MkcvM0RDdWRYTEQvNXVrbDNOaEtC?=
 =?utf-8?B?MGhPRWgrRUxKMFRrckozZ0J5UHhFc0tRck1FeHNCNnY3czhSQlRJRUZaZVpu?=
 =?utf-8?B?ZVpRUE5WWVkxaGZUbzNvTWpYdnkwOUxsbWtMMFpHNE1yNkVmc0svUnQzRTh1?=
 =?utf-8?B?U2x0bnJib3hRRElFcU01ZEFKcWVlVDQ0U1pQZXJLRWZBWDVrSEExNVcyMWlw?=
 =?utf-8?B?Y2tIeUJ1NTB3Ulh0ZW1leFJBVEFERHFoR0QrNGNEbFNOSk11ZUs1Qm42RkM5?=
 =?utf-8?B?Q3JUdjNoK2pPMk9UQk1KMi8yTy94NmR1NUpULzNCdHo0K0pjc3VBTDR2NUdz?=
 =?utf-8?B?MHc5WHl5eWNRb29zSEpwbXhocjIydTdXSGRzMnEzSzNqSDU3Slpxd1RuWVhV?=
 =?utf-8?B?OEhUU0NmUG0xK1ZPN1BVWDBhYTFBekdOTmorT1hsQmdIZlFzZnBkd290R2xJ?=
 =?utf-8?Q?uxNLzZXNUclfsfxU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5462a2-75c7-4990-ef8e-08de796d80d9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6559.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:40:35.4959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wlXoCOmOLNbTsVenbLq+0xCtD4oqBm7zMG+NaqsvhcuiZoVQKiXny/WW4SmtDTFloMJ/f0wX8Ewy8T+JEi+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_134043_261239_F1F316DB 
X-CRM114-Status: GOOD (  21.50  )
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

On Mon, Mar 02, 2026 at 11:19:46PM -0800, James Houghton wrote:
> On Mon, Mar 2, 2026 at 10:38 PM Piotr Jaroszynski
> <pjaroszynski@nvidia.com> wrote:
> >
> > contpte_ptep_set_access_flags() compared the gathered ptep_get() value
> > against the requested entry to detect no-ops. ptep_get() ORs AF/dirty
> > from all sub-PTEs in the CONT block, so a dirty sibling can make the
> > target appear already-dirty. When the gathered value matches entry, the
> > function returns 0 even though the target sub-PTE still has PTE_RDONLY
> > set in hardware.
> >
> > For CPU page-table walks this is benign: with FEAT_HAFDBS the hardware
> > may set AF/dirty on any sub-PTE and the CPU TLB treats the gathered
> > result as authoritative for the entire range. But an SMMU without HTTU
> > (or with HA/HD disabled in CD.TCR) evaluates each descriptor
> > individually and will keep raising F_PERMISSION on the unchanged target
> > sub-PTE, causing an infinite fault loop.
> >
> > Gathering can therefore cause false no-ops when only a sibling has been
> > updated:
> >  - write faults: target still has PTE_RDONLY (needs PTE_RDONLY cleared)
> >  - read faults:  target still lacks PTE_AF
> >
> > Fix by checking all sub-PTEs' access flags individually (not via the
> > gathered view) before returning no-op, and use the raw target PTE for
> > the write-bit unfold decision. The access-flag mask matches the one
> > used by __ptep_set_access_flags().
> >
> > Per Arm ARM (DDI 0487) D8.7.1 ("The Contiguous bit"), any sub-PTE in a CONT
> > range may become the effective cached translation and software must
> > maintain consistent attributes across the range.
> >
> > Fixes: 4602e5757bcc ("arm64/mm: wire up PTE_CONT for user mappings")
> >
> > Reviewed-by: Alistair Popple <apopple@nvidia.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Breno Leitao <leitao@debian.org>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Piotr Jaroszynski <pjaroszynski@nvidia.com>
> 
> Thanks for the fix!
> 
> This is similar (sort of) to a HugeTLB page fault loop I stumbled upon
> a while ago[1]. (I wonder if there have been more cases like this.)

I see that your commit 3c0696076aad ("arm64: mm: Always make sw-dirty
PTEs hw-dirty in pte_modify") from that discussion was picked up and
it's very relevant for the hugetlb exposure question. With your patch,
do we have a guarantee that sw-dirty implies hw-dirty in all cases? If
yes, then there should be no exposure for that path. But it still makes
sense to make it more explicit.

> 
> Feel free to add:
> 
> Reviewed-by: James Houghton <jthoughton@google.com>

Thanks!

> 
> [1] https://lore.kernel.org/all/20231204172646.2541916-1-jthoughton@google.com

