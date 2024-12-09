Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B291E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+6+5wzjht7MEyuKs3blMvsTkiBX/dVrG7TWjhgmkeU=; b=2iKQwwjt5iUB3TuuC5c+sNk5ag
	QH0HBAjqAMGPnYQXqu1thPADKt7xUba0SnXThEJV29QroajOdcMcBL6c3ALWXdyP9F99N/zCJrhO6
	XhVFmepCajm1+SMYvfd5rQ08ZR7ZJKSRS+a6xjWL9PX/50cYUKxL4TeAh+FdhgI2YgZftkZLsdBDq
	R33m+GUThCmIJkA3QNvj9VcyaegMLtd7ZnkpDgbn56dXAYf8Kai+vCCvuqCek+oun7A9U+UcnBEwl
	k0X0SJMCdbL9qp5EUx2scj4pWOdKjqwMpVM0cLXip2E9ApV1PXi0BIZPCMrEveQh+HptDTfkE6x7R
	mxGD6nIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeGD-000000086vE-24RX;
	Mon, 09 Dec 2024 13:57:17 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe8T-000000084Wo-1IXe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:49:19 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y6NQF30gvz6GCF3;
	Mon,  9 Dec 2024 21:44:37 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C0A41408F9;
	Mon,  9 Dec 2024 21:49:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 14:49:08 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 9 Dec 2024 14:49:08 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Cornelia Huck <cohuck@redhat.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, yuzenghui
	<yuzenghui@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
	<jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	Anthony Jebson <anthony.jebson@huawei.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH v3 3/3] arm64: paravirt: Enable errata based on
 implementation CPUs
Thread-Topic: [PATCH v3 3/3] arm64: paravirt: Enable errata based on
 implementation CPUs
Thread-Index: AQHbSjI8+ZGtwNDcik6x/q40bpGhkrLdzFoAgAAfO7A=
Date: Mon, 9 Dec 2024 13:49:07 +0000
Message-ID: <d92ea2dcc3b04ebb8bc5ba71bff448bc@huawei.com>
References: <20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com>
 <20241209115311.40496-4-shameerali.kolothum.thodi@huawei.com>
 <875xnt10oj.fsf@redhat.com>
In-Reply-To: <875xnt10oj.fsf@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054917_640466_C2B0F242 
X-CRM114-Status: GOOD (  19.32  )
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



> -----Original Message-----
> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, December 9, 2024 12:49 PM
> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; kvmarm@lists.linux.dev;
> maz@kernel.org; oliver.upton@linux.dev
> Cc: catalin.marinas@arm.com; will@kernel.org; mark.rutland@arm.com;
> eric.auger@redhat.com; yuzenghui <yuzenghui@huawei.com>; Wangzhou
> (B) <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [PATCH v3 3/3] arm64: paravirt: Enable errata based on
> implementation CPUs
>=20
> On Mon, Dec 09 2024, Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Retrieve any migration target implementation CPUs using the hypercall
> > and enable associated errata.
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> > Note:
> >
> > One thing I am not sure here is how to handle the hypercall error.
> > Do we need to fail the Guest boot or just carry on without any
> > target implementation CPU support? At the moment it just carries on.
> >
> > Thanks,
> > Shameer
> > ---
> >  arch/arm64/include/asm/cputype.h  | 25 +++++++++++++++++++++++--
> >  arch/arm64/include/asm/paravirt.h |  3 +++
> >  arch/arm64/kernel/cpu_errata.c    | 20 +++++++++++++++++---
> >  arch/arm64/kernel/cpufeature.c    |  2 ++
> >  arch/arm64/kernel/image-vars.h    |  2 ++
> >  arch/arm64/kernel/paravirt.c      | 31
> +++++++++++++++++++++++++++++++
> >  6 files changed, 78 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/cputype.h
> b/arch/arm64/include/asm/cputype.h
> > index dcf0e1ce892d..9e466f3ae9c6 100644
> > --- a/arch/arm64/include/asm/cputype.h
> > +++ b/arch/arm64/include/asm/cputype.h
> > @@ -265,6 +265,16 @@ struct midr_range {
> >  #define MIDR_REV(m, v, r) MIDR_RANGE(m, v, r, v, r)
> >  #define MIDR_ALL_VERSIONS(m) MIDR_RANGE(m, 0, 0, 0xf, 0xf)
> >
> > +#define MAX_TARGET_IMPL_CPUS 64
> > +
> > +struct target_impl_cpu {
> > +	u32 midr;
> > +	u32 revidr;
> > +};
>=20
> Doesn't this need to be u64 for both (even if the upper bits for
> MIDR_EL1 are reserved?)

Yes, both are u64 as per specification with upper bits reserved. And the=20
external hypercall interface has uint64.

But in kernel, AFAICS, at present all the _midr_range_() functions expect u=
32.
So not sure we gain much now by changing to u64.

Thanks,
Shameer
=20


