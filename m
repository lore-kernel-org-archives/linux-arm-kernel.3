Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D5EF8FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBhLNfjeQcpvDCOYwwQVAxVWViVjgZOuLS76JnZmy7o=; b=lq9cAGN+7r6DmQc5hAnBo0KaLY
	zyAGRav1BTZcYcTPZ6IZEc3Kt2Zit+GzsIL3WBCI51FGu8VwFM+hXeGWrgkGkH/GTxfdn6KA9lYMu
	Ep+G6RwkjAEvEh3QQISnNUJ6lzzmiqtXqXi4YgKA803zUgQmv1QBBh2C08BoCk8MIr3VvXBp2FljE
	cDXVVX1ilfXPUTBDqClfHrnK6ZT/4EO/4PZsyoirLBWjl+dL/tvOWvLA/PIaYXpvVafZ+M9eC+T5N
	8t+loB5Kztut24gwfMm5bynyZqV+CCgX5Y7p1Poye1PLqOcOysDvaPLxeTSGRGFhUWvk6kvYrkJ03
	Uo5bKfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoKN-0000000Haip-2x4p;
	Wed, 04 Mar 2026 15:39:59 +0000
Received: from mail-westcentralusazon11010065.outbound.protection.outlook.com ([40.93.198.65] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoKK-0000000HaiP-26fk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:39:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL0YZrvHcQAK4KpWdxvxHTXHdnXJ4lyVLafotAmqs7bTEylaY6mphWZnyPNQml1fHLxE54bcGgFkSGb9Yx9HbzxoOpeOJNU2zbKjBj8/WdVVx1Ekw5yEQpMGAA0ENhSq7e4d6CVcsKVLw+Lhjn7G46pxuJV1GyfUwX0/3yZi1lYdbxFdxdU0I3zPUYhXfSug1jRXYsEqgOVJ8Chl54N/7zOhbQvEWXLBDPRuypguoBtD9rJf5VTg2GgN/j1GQYV+xhaJ/0B34plC8thb/pB684w0oh8bhSod8LXjG50hRY91vxfGXCooOcgg3DYFb+RaqWMw+uPmY/gH9Ci5E6akew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBhLNfjeQcpvDCOYwwQVAxVWViVjgZOuLS76JnZmy7o=;
 b=XXvGGDaRhqgePe/b4zDaghfUgJpBu1tq1HM1KbRUHFjtzFmen76+k+WjsJadS5BEbJ3HmXHxowsUO+9Lo7Y0L6j9ypUrY9+N5FoXM6HJmYQtnP7b4kLhBwDkbEyJnK+YPpQ2tnyNtyadtCquff2hq2ll4pIs1hD1HWn73s01EzNIFUOJsen93XNU7+JY/7Ma5FkaMbwa8INw8q+liCUhUcnzmyG2BREVBGAvfCxehLkTcpUgjHI1wbE81skgPQNm+a/dQpxnxAhJq22tGMu9IG3iLq1Jety4+I7bJdWNDeKZU7/yg524FGkoTn3OIQwL7w1CK00lV+wSZGnjrTUrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBhLNfjeQcpvDCOYwwQVAxVWViVjgZOuLS76JnZmy7o=;
 b=DSxcRgi/ZZzXwTdYYPn/6tW/vOpzQjXPaDZglkBioPDeycOJLkOV/MHSrNSTGiiVx1gyKbOse+xL+nuLPR5DXxTsZXF5am7GOUk06YPFy4rPclV1jwEYVPe71uB3ShTaEFvkAjUNu02ak+Vv8J/GETBexhiZ0JiVG4cNGCcV85wacoCjHP9rW98dB4orqIK2lnnTWuqASj3vX/s7n4hPMBDlrutGSI/1M4H4bK1/iS/K9ww40ooaErrqIWFucvLhvAPWBDBqrTc6tN3bfPngLYrT5MQZi51bA25If6cfer9ic9qR/u3lWzgpw07CmrVAwlshOyIy9RmHpMj0kI6HEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:39:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 15:39:50 +0000
Date: Wed, 4 Mar 2026 11:39:49 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Piotr Jaroszynski <pjaroszynski@nvidia.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Breno Leitao <leitao@debian.org>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
Message-ID: <20260304153949.GP972761@nvidia.com>
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
 <aagUtDTca5d0le2Y@arm.com>
 <20260304134313.GM972761@nvidia.com>
 <aahJX0NwtYHy1ILe@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aahJX0NwtYHy1ILe@arm.com>
X-ClientProxiedBy: BL1PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ea628a-a0b7-41b7-08a6-08de7a0445ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 6AcMF+UVVdT9JH5mu1xZWCbVgNPwlAzTrI3+r/BL7Of6PXGcxeZxIJM4YLtAXJVewhQmzLV55sMoJAm/Q8SYEkuDCqS4C+c7zprMyhkrHrGCgiv2K0x074F0eH47B94reLDc0L0w2CNnLPvyHMl6wpRAGBtbKlJoF4ibBAsSeGRyqwOkBYp2puZQ4rnwisAS8M144SZNMyYzBztxEdlj/QjBNT+7Woo3G+OREJtHX3EMgtUrSwYfToe6Pb9tair+WI1pTRlugTawXNJFSbCJ1QyepXt9xqp29G7V64TPaJxx3/vX1ShqDOcEPZYI64Bn7yBQGGo4icYZZoXBlRMnDBkm/+ioWZScOmrfqaJ/jPfsp9WVRwLI4xFHwRYr2nSFt+a7602uOQZq9BqiNxJVsjYye2htIIHbZmb+4Z3HVDWO2b8F6u27e8HZ3KYyEDAqE3CRlspWRUnr0eCMo7v6rjU1yHuCPWeML481rEFtk8Zvjqr33SybEcHWlQb2d7C9UjfDnq8EJgWXT5WsoNoz2MUMaquHbiWobIYC+2Z4FTteDrQqKtnOGKTWe8gYgJf+YrVhFD4vJiZJFPNc4sSWE0fM8i3p6YuPh9sfHsqIDDoIqVM+cgZNqlJRRzQBJgXuFmfdqYqF2K6U/nnoBEdX1U+5+721fgBgK+5Y6yupXwpd4WJbw7JCORx1MH7OxYfwa2MntAEOKjyjH2jZCMbrQKZnIoae1r9Xn1GOF9y3PTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BEPD6asbSJFNf3TajnjC50CD+Q1h1UqkotvMuomoXenhOS3ZGeorALfz8Mnw?=
 =?us-ascii?Q?qfhmpw9NvmnS5cq0RmJ5v2AToV5XkcK6oyraUtU5f8O9oq7g1sfGEmzc6Djv?=
 =?us-ascii?Q?a7p+A7kRwhyPnhOemO6mES0GGrECRJrCJRH99mda3zjBnWVx8xj8hwVbHYbN?=
 =?us-ascii?Q?G+sAenZ3P3ONBGyVTvn6EMn1IiiucLG1+5pWiMKgkjO6jmiBURVTJy7U0+lu?=
 =?us-ascii?Q?0t8fGctbYsGXoSHqWPxiuWuERcSZTaNLFuibzEoSwL9TSFGOzk84jmOF+d15?=
 =?us-ascii?Q?LFj/qw2suELJIpcD3aPgil2MOe1un5TbPCibxOILIWzZEORT+dE3ykOjndb3?=
 =?us-ascii?Q?23ZrnEF/Hi5nib3A+sombSzJ0HhFTlbXcMepw36PIDzaPeZwZUleQFnuijVq?=
 =?us-ascii?Q?uaTitqB2Q4IfXRJkVHctWhFLfF0Wqgrf5BuZotbS6YOcIuSYP5kqlw1IjoBC?=
 =?us-ascii?Q?l0onkzNdr5f3o6hjspzJFqMY2OZU+Sd5D68qL5LOuOpFCLboN7+ZUbnXFxX9?=
 =?us-ascii?Q?oj0yv4JGnOWpuGhVfkYyv1L/ToomfLGP1v72UFLjceuFrpNOIDzP4L9Nm2Ae?=
 =?us-ascii?Q?WsTQW/WefY8Ugg0WHeq2PVbbaAe2eYbQ4mVEN0M69r3kac8pWSRK5ND5JSU6?=
 =?us-ascii?Q?7acNFjVd0Xajty/STM3uMlzYUAqygFUFzsnrQqsWldK+lWSCSzbFCXM/IhWP?=
 =?us-ascii?Q?z5esZrAVh/Ys1W2Py+npc8N74v+kFjnv2sqMGvX6lQfdqDzXLBDPon3ylHXa?=
 =?us-ascii?Q?iRpwdj31IinZTl9loweSpXcoQyiKmpm4TiKnU9mbTyex/QQGMySGg/zlXKai?=
 =?us-ascii?Q?Xpw+XnTUZ0cK4bjJuSFvR8MxOoEPhrh2CnI0pcU2e2q2JSoaFOZnoLUurz7w?=
 =?us-ascii?Q?GgZz6fVUcCATit2GEGHxd2PKD4/Y+0J/wWaSi4Ezx6jeYuyd9WojeM+pls3h?=
 =?us-ascii?Q?wSMWsGvmtjgo/lSTAVBXAmwIK8iFmzcQOhSPg5TU7V3EOpGIE43kc9DMA6gn?=
 =?us-ascii?Q?XfoxeEzikAVNoyS/B3RUOqHWTJ7imJw3iJaIDpCwx/VlMML9QaWne3LNaMtt?=
 =?us-ascii?Q?jooBdM37454/+1qOVcZn0TxOZq9YUT7R/ojEBDdK/At5j2tJmBEhTjlgu6z6?=
 =?us-ascii?Q?I+ctkU2+TJc6VdQbkMin11hbC4wCBNemj5lZgoHiIpk71Rhj0cNw+ukne+OC?=
 =?us-ascii?Q?ukZRg3Acy5yagprGHCZeUID4OZA6izcixG692uIf2xz+uniNdxhHhTOSWLE2?=
 =?us-ascii?Q?iBtUbRrRFfhNkJw5/UQ8OmFPTwf35J4S5o9sgC3nzffg3kOGosFwBiAeV3Fd?=
 =?us-ascii?Q?4hnErwZ5uezf6cn5+0ViCSGtW9m1vLjeueLnR5ZjyxEMfc6gRX411qIw0SlL?=
 =?us-ascii?Q?3FL6fm58hJan8PLCicQ63RvoQ+UP2cbm/iOawRmqTGnmx+lzUQfxUkbOjnqj?=
 =?us-ascii?Q?y8IRWiXy2xiec2LGFBXL7b8Z/xX+rBZR8jfCcGB+0iZ9EE9mbMF6bxY6DRSO?=
 =?us-ascii?Q?TpdqPQAzDAxh3qhwI1ofBBzKqLrxgNslaKxWtYVDrUzwXZGTy4c3i6AuYHRp?=
 =?us-ascii?Q?EUHDEjAlPHkpG48of2Cnw1pZinD0vlY66vz5e1LBfT7FkZcJb4/YJTRgFzi3?=
 =?us-ascii?Q?nfJsRWi9wKTwf1lIJk0VeJMbNlEvsUAg84ejlgFxbQyZRRKKbBFOMLjAFh0F?=
 =?us-ascii?Q?AfCQhW70fIYRqqMDiCWyrCkWFTGNW5AYBlOI5sMRVZVz3konv1U4RyFk6mu9?=
 =?us-ascii?Q?g6IMTv2jEQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ea628a-a0b7-41b7-08a6-08de7a0445ad
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:39:50.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XtOZ2GTdLE4x7pGLZVBciviUecr3r8zx94k0oIw6HlhMJoriElq4/RNhI7HDEqq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_073956_562714_7BD50BD5 
X-CRM114-Status: GOOD (  14.00  )
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

On Wed, Mar 04, 2026 at 03:01:51PM +0000, Catalin Marinas wrote:
> Good point. For the AF bit, the hardware is not allowed to cache it in
> the TLB, so we can't get an AF fault for an unrelated VA nearby.

The way we have read the spec is there is no restriction on what PTE
the HW accesses when it encounters a CONT group.

To be concrete, the spec seems to say it is legal to make HW that
fetches the PTE at the VA, sees the CONT bit, and then always fetches
the 0th PTE from the group and only uses that for permission checks.

Therefore SW should never assume that HW will read any particular
sub-PTE under any scenario.

It seems current cores don't do this, and it is a bit silly to do, but
I can imagine an optimizion where the core does a cache line fetch to
read the PTE so it can freely snap to the PTE at the start of the
cache line for permission checks. Consolidating permission storage to
fewer PTEs would reduce atomic memory traffic if the TLB is thrashing.

Jason

