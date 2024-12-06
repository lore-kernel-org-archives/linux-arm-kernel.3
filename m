Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B0CE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8QEXkeuiU8zLPPp1Dyduy7dC04x04mnj8qjhMDKB3M=; b=h/LWGNAfxS4p0D4G29yjI1+28K
	ng7AeBZfhwKk9kESN/gOseMi7x05Ywhr8bw5oRh4OG3k4o+n6d+YZ4Xmq9nSWqSLATtfr+C/LUerr
	5tp1JXWdn8T8ZVQiQ8DSesWSYYdqXTC3818l5wXARMaN+vw9j5cmqUrkgWvFk1gLnZgnXQG9cEkG0
	iXKu0kOn5PYiUUNi5LsHJDWN4mb6ruAeA2DyHyy+nQ3exyM3uSsj0BPpzf8r01Ne6r8ip/gsXDwKq
	p8FpNwoGJWR7+W8EuWKoDBn7UTNdBUFVM6qZB+DLdsNZcHk9bPF908ZKpDkWLkdb23hiin8rW6fjZ
	1OUmvW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY35-00000001gW5-3p0U;
	Fri, 06 Dec 2024 13:07:12 +0000
Received: from mail-westcentralusazolkn190110000.outbound.protection.outlook.com ([2a01:111:f403:d122::] helo=CY4PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY20-00000001gK3-3AXq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 13:06:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FU3Gyf9/7QAv9oKvjd0FFPz7LSw12SqFU0seiCmy4j25yGkCSCOL7BgtT5hwUukDAMc0sEUkFl3K/v+tL57+/wW0fZzMtvalNxX6YIEWy2sREEYpou+ypVtYnHvphz68/sst15j6sfAdUvOIHpiZJUSXE3tKGzEGLOVlsnox9sNIYL4idmhi0VEH4WCubLJbQrVgnEdPfFcfz9JQirJ4UhQ1jNSkV/sRnSu3W2V7hznV/hTS0nd7YynlYGtQBbLhl3al/xY8nI1M0YOO4ncWKza7Fcq2jQukmdCaRHaOc6OvQDvwU/1qXTAkFT9sn/QgG0IB+igaYys5lTQa+RzEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8QEXkeuiU8zLPPp1Dyduy7dC04x04mnj8qjhMDKB3M=;
 b=aBFO7WthM4/AltxHnjSJ0YQyFr55XEgjnlrmekan0qRK0Xy9MbzuebwZKYjlbtmGSCtcLxU97kHkqtulgqPiaepuMfPKEpljAhx8W9MaQfkGI5U5x8S2/jZdaZ6yvRhZuBtFFN0YrZDOnMOMiutxI971o7dC3AMOR41cjRAzzGXFCz7hFGxkvslyApBlP7Nt39h+pkozRYH/IIDonykxugIRBlVrcFlNoGcTRI0pGjvJkwgIUr9yzxwf+TzT0uFUml9waOt4ZLLve6EPBUsJDHVRzcNuvuzpUz0jIE01BWxRU+7I/w2+n85HEHaRgEnM+hVVzbZ/DI/4VN3dNcnWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8QEXkeuiU8zLPPp1Dyduy7dC04x04mnj8qjhMDKB3M=;
 b=eME75Dqne6Eeb6JoBzGkuUDxpBn0c6R8LuHJFmiTT0L+WqP4aG578gimOpCjc2PM8KZm3Bid19nTU7NUarIcuLRVvN2uf5WxzL7C/oO/t9FiP9m0sA9f9DXRq/R5rM4XqrBvDVDy/m/qHzr8sYCm+i0ty8zSEj6kx3DNBBZtfIzbQgCqImrJMX0bS4zW+cgw6mELL48blbn5qK3KoMzPRdbHrGcAdwdOp8f6Rk08pGj19sovT3hiP0qGX1r5GLS8vZSfYcGSsVAtp2ZP3SUoUt8dRoDEWu6hr95tipe8VD5MB6zVHA57arxp72AtkIIFOl6I1wg5yeH/AcDTVLQhLw==
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by SJ2PR02MB9883.namprd02.prod.outlook.com (2603:10b6:a03:544::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 13:05:57 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 13:05:57 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Ryan Roberts <ryan.roberts@arm.com>, Petr Tesarik <ptesarik@suse.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
	<anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Greg
 Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>, Kalesh
 Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>, Miroslav Benes
	<mbenes@suse.cz>, Will Deacon <will@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: RE: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Thread-Topic: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Thread-Index: AQHbHifr7Pi067ctQ0iGvwc5NuWBOLKK46gAgAABW4CATVKKAIAAGCZggADbAwCAACuLgIAAKo4g
Date: Fri, 6 Dec 2024 13:05:56 +0000
Message-ID: <BN7PR02MB4148CBF5299294AB8170D12ED4312@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241017142752.17f2c816@mordecai.tesarici.cz>
 <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
 <20241205182008.2b36476a@mordecai.tesarici.cz>
 <SN6PR02MB41571E0BD384C44C46127B49D4302@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20241206085026.32c89a03@mordecai.tesarici.cz>
 <bd4a30ca-6725-4c78-94ba-03581700bdcc@arm.com>
In-Reply-To: <bd4a30ca-6725-4c78-94ba-03581700bdcc@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|SJ2PR02MB9883:EE_
x-ms-office365-filtering-correlation-id: cb3c33c1-f602-41c7-c6e7-08dd15f6b93f
x-microsoft-antispam: BCL:0;ARA:14566002|19110799003|15080799006|8060799006|461199028|8062599003|102099032|1602099012|10035399004|3412199025|440099028|4302099013;
x-microsoft-antispam-message-info: =?us-ascii?Q?y0ElCBnDO1dgZyz56rwOtL1OWh/Xy8aaAzrH8k+XVX63Xe+oOwnprpGb1OWc?=
 =?us-ascii?Q?lua8Q5y92sW9TYvG9PdiS/hQRvjVfV6E+8NDe4XZqD3MYmshGlARBelg/amp?=
 =?us-ascii?Q?vSXHn5nccLXETQHgOoPqfwXKqKT2EZ3daeyzgy5xZ3l7TINXgy3o9jehAheX?=
 =?us-ascii?Q?nzODrnGD8nK+DT5RKHP4nc4MpQVdNJpAHG8UmulUnbZkx/hOu5mCqXWmZTxC?=
 =?us-ascii?Q?wI7soaWRLCPWVFZrPS/OwQzhAJQYbnLs8e0JDjCJX4pm/W0cM70ohweVwPzP?=
 =?us-ascii?Q?vdfa3uEIn7/yPsSNrLwravUvaaAYntWSV/TBxi7ico/WEbpGJ8Dpv8nOb5yh?=
 =?us-ascii?Q?l+Ce2lxxJ1uZ6URfL5jCipe4aIxcGG0NcQW4HBuGsnTQ4fjWklHW1YTX7pzP?=
 =?us-ascii?Q?auHs+o1zphvYVA6Z6K3dUZleZ8rQTaBBy8ESWDekzSXChz3JiSpJu2nqAI2t?=
 =?us-ascii?Q?S2jRqFRfIc8ZCdF8/8IGPPw6j7614eqPYy2p9hgXC4VU0u6PCjEju0Mr7s4Z?=
 =?us-ascii?Q?BN2ecW3Ulohks7Q2NcPUOvkF45jZsEcZmldIubyZCHx4tf1S4J74tvsjeWCs?=
 =?us-ascii?Q?IzvtOwBdzu4oCU/SJrIr/6Kb3sxQuApxRJn9ZyV9R9BKivgoo7/hgE+bU+8d?=
 =?us-ascii?Q?v8Gnp5uRqIfbwhXx2cUYZw4udbVct5hU737j3CyiO4be0iJ9TIWyd/sdXsvF?=
 =?us-ascii?Q?D3lqOeKu+7niF6vNM/VnT37tdmMEXXTWOt0CKFgUC1etr/3rUlu2g17SD6QU?=
 =?us-ascii?Q?5aFKrIP6+fgFNWGzZF/bBJWCfGJPfLMI3QHTXAY0sTd0ofp29mbVmwGxu8yS?=
 =?us-ascii?Q?Xg27a0L7DEb3ylqb/vC+S3Y2fUU/HpNuA98TnzTTM08PrdeT9iDmW/Xxm+ez?=
 =?us-ascii?Q?Oy7fGzQpmli/JgLctV9KTGuwufOAhEbuqG3INlWS54yxht+PxMrfklR37oXw?=
 =?us-ascii?Q?/gHypCLx3S5EcDQHJKmONZwDaQ11ZSpcwplz/hiGYcwUyO4rewVUjhVaEg5O?=
 =?us-ascii?Q?yn0i+0hxEQE1WGky2Gh3FEoI+i8v7V9gQQLiNvjZLsKRjVl6GCx8ksz5CT9X?=
 =?us-ascii?Q?LqqMi1lxMm33XL+PA+Q1z4FZEhO4ZSO0JNo0hFk3+WHYYBxuR2WihSxxjy1a?=
 =?us-ascii?Q?M51S7w4kwUJzTYiKJB3IjDEYnyIvZo4ftcvlCF5qQ0LAFXHAxqe7mAs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LOrqX2ViChFrIf76gigE1X4E0gokdC70k7O6GlJ26EfVEMXAHRGRrFM3LYDN?=
 =?us-ascii?Q?mD7aimAuyAgBHKxHf8/T3bFcPB0a+ND2J/65HUN+2B25oE1kmhhHctgM8YDc?=
 =?us-ascii?Q?VDcnIVsnnZVhtiIbcD/H6Fbi1r6Ai4ddUOX4MUNTZ0YKmjHVyJ3KT8kaO+KR?=
 =?us-ascii?Q?ZKQC0p/2hJf4keKSlawFByc1EBWqYmSaK+pA0qG7aeXtGGhqCsOrkT75O6lW?=
 =?us-ascii?Q?zPg8OSDlCF2Dmr9Rx3KGbeZdl1UE3/k8wIigXJItb7C1h5j1dSfoMuZpESEU?=
 =?us-ascii?Q?xulGlyp+YFttesLorEliTVw5tRZ4HUcolzK8tOjIyQqh+MDu8xo1/Bi6/INd?=
 =?us-ascii?Q?H1REq2mOn0W9jpM2bRfMujrvgDP+4BR4OTKNoa/lLpMwsgYD+0HMU4f3RkWf?=
 =?us-ascii?Q?2ftGHGd6zJZAE2YKtF5aSlneZTMdiDBxtcLNo9JYjP2y5XA0P6wDrpBaMbXz?=
 =?us-ascii?Q?DU9dRPJdT7HvOtuv+rmrWiqhGZ5WyxXHGCspaDkO4OHkTs+07EAHE4oOD1x+?=
 =?us-ascii?Q?04p51PD9eaGvYdUg901SFkHmH21kIH6XxlWLWbJpv0Sk+41RA8JUfdJuznH3?=
 =?us-ascii?Q?f4oxdjB/XMOd/Hso3IhAstywEU88RPZ3/SCUAOzEvTaCbZEqh3KMpVcoubLA?=
 =?us-ascii?Q?woHYn+EPXF1x9uzyHJyc4fJNJnBZ2QuQN9NEG9OtIM9KRmZ+FKSEPbGOhdVl?=
 =?us-ascii?Q?AQqFjGVOEfMhf0WWo7E0sQmVIsg4mV2m9pg4XobuSIoqnbYlek0UiuGa39Y2?=
 =?us-ascii?Q?lhCnXVUZRjcLJhs9UjhmP5CJTuTzRkwhrNC8hWs6nRHgF4YhWNET0B/P5YM4?=
 =?us-ascii?Q?gLMq4cWkmPyQNCBiuyoO4W34WmtWo+FMFy4J6iBiPmBVAAusLBGxhtZYQzRZ?=
 =?us-ascii?Q?GV2Hu1SCYD9EvUfq9QMvM+2vJPDr6kztEiBl7GtYrE0C1ru5XceentcPCkvY?=
 =?us-ascii?Q?DqXuSGJdklKHgXSR1uModCUUr593MWsAt/ePG+4Gc5PLluP/4EVcj+dhdR8C?=
 =?us-ascii?Q?g9CE0WQMOrCjPdMilFXmlVt500YCarV5F+hYW/b1dKulz6I9rnHhhE2pDBHZ?=
 =?us-ascii?Q?jqJpKi4HIG2wKgLJfrcBwLUgeAdzvxKImQgB/q3bPctxsbrWuvuOTny9Gnts?=
 =?us-ascii?Q?IiBLqdKv3Wvam+jkcyAWPi3mgGeqstk1ZJ3/SifrAXL4YocPokU8ZjixLE9V?=
 =?us-ascii?Q?5pfey+QfiE+U+9Z4LHHYm6sxxjGNh5FE5u2b8Ya37yj01t8Evqrl+WR4TiE?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3c33c1-f602-41c7-c6e7-08dd15f6b93f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 13:05:57.0098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB9883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_050604_810547_CEE28A0B 
X-CRM114-Status: GOOD (  30.48  )
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

From: Ryan Roberts <ryan.roberts@arm.com> Sent: Friday, December 6, 2024 2:=
26 AM
>=20
> On 06/12/2024 07:50, Petr Tesarik wrote:
> > On Thu, 5 Dec 2024 18:52:35 +0000
> > Michael Kelley <mhklinux@outlook.com> wrote:
> >
> >> From: Petr Tesarik <ptesarik@suse.com> Sent: Thursday, December 5, 202=
4 9:20 AM
> >>>
> >>> Hi Ryan,
> >>>
> >>> On Thu, 17 Oct 2024 13:32:43 +0100
> >>> Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>
> >>>> On 17/10/2024 13:27, Petr Tesarik wrote:
> >>>>> On Mon, 14 Oct 2024 11:55:11 +0100
> >>>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>>
> >>>>>> [...]
> >>>>>> The series is arranged as follows:
> >>>>>>
> >>>>>>   - patch 1:	   Add macros required for converting non-arch code t=
o support
> >>>>>>   		   boot-time page size selection
> >>>>>>   - patches 2-36:  Remove PAGE_SIZE compile-time constant assumpti=
on from all
> >>>>>>   		   non-arch code
> >>>>>
> >>>>> I have just tried to recompile the openSUSE kernel with these patch=
es
> >>>>> applied, and I'm running into this:
> >>>>>
> >>>>>   CC      arch/arm64/hyperv/hv_core.o
> >>>>> In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
> >>>>> ../include/linux/hyperv.h:158:5: error: variably modified 'reserved=
2' at file scope
> >>>>>   u8 reserved2[PAGE_SIZE - 68];
> >>>>>      ^~~~~~~~~
> >>>>>
> >>>>> It looks like one more place which needs a patch, right?
> >>>>
> >>>> As mentioned in the cover letter, so far I've only converted enough =
to get the
> >>>> defconfig *image* building (i.e. no modules). If you are compiling a=
 different
> >>>> config or compiling the modules for defconfig, you will likely run i=
nto these
> >>>> types of issues.
> >>>>
> >>>> That said, I do have some patches to fix Hyper-V, which Michael Kell=
ey was kind
> >>>> enough to send me.
> >>>>
> >>>> I understand that Suse might be able to help with wider performance =
testing - if
> >>>> that's the reason you are trying to compile, you could send me your =
config and
> >>>> I'll start working on fixing up other drivers?
> >>>
> >>> This project was de-prioritised for some time, but I have just return=
ed
> >>> to it, and one of our test systems uses a Mellanox 5 NIC, which did n=
ot build.
>=20
> No problem - I appreciate all the time you have spent on it so far!
>=20
> >>>
> >>> If you still have time to work on your patch series, please, can you
> >>> look into enabling MLX5_CORE_EN?
>=20
> I've also had other things that have been taking up my time. I'm planning=
 to get
> back to this series properly after Christmas and convert all the remainin=
g
> module code. I'm hoping that Michael's patch will solve your problem for =
now?
>=20
> >>>
> >>> Oh, and have you rebased the series to 6.12 yet?
>=20
> Afraid the latest I have at the moment is based on v6.12-rc3. It also inc=
ludes
> all the changes from the review feedback:
>=20
> https://gitlab.arm.com/linux-arm/linux-rr/-/tree/features/boot-time-page-=
size-v2-wip
>=20
> >>>
> >>
> >> FWIW, here's what I hacked together to compile and run the mlx5 driver=
 in
> >> a Hyper-V VM.  This was against a 6.11 kernel code base.
> >
> > Wow! Thank you, Michael. I'll give it a try.
>=20
> Yes, thanks, Michael - I'll take a look at this and integrate into my tre=
e after
> Christmas.
>=20

To be clear, you probably do *not* want to integrate my changes into your t=
ree.
They are a hack, and I'm not sure what approach the mlx driver folks will w=
ant to
take. But they made the Mellanox CX-5 NIC functional for my purposes in tes=
ting
variable page sizes.

Michael

