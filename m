Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C302D339A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYnSQdtPdDfVwFCXve8vaIKPlwLosI4ZjHZ+JrhZfP8=; b=QHaRqzGDCmNgQqArKA3aN2FuDr
	sjhitJNji2JCT1BWyuBelAvFvCih5FHuBopbpG0KFoj3FXIXVXQ21yRftmlmUpPNLSVydvcgij7yT
	tdwHmlMu4bkyjeVmMyivtsTzrctZk6Kr+iI4xFi7ZiJoyiFlFwgrhMh2Y2U5ydCKNghvnMBTc6DnG
	jC6Mcmm6retmR9CFGjL9x9mkqBQtjchPE94NBb0RWGpghHHNgMN6QW9XgczQPl7RRoRnQMxMkbUiA
	noR9ZJKJdNdVYcNwR2Rot+/bs5ZOa1CHrtverpjPaxeywX8n6Jz/FXNhOmW8V+mMhvl0MUIUP9MZb
	uEPJIRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tan-0000000Bf25-19Cq;
	Mon, 28 Oct 2024 17:31:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TYS-0000000BenA-1Zeq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:29:26 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XcgMQ0QfCz6K9Zr;
	Tue, 29 Oct 2024 01:28:02 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 10925140B30;
	Tue, 29 Oct 2024 01:29:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 18:29:14 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 28 Oct 2024 18:29:14 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Oliver Upton <oliver.upton@linux.dev>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "maz@kernel.org"
	<maz@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, yuzenghui
	<yuzenghui@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
	<jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	Anthony Jebson <anthony.jebson@huawei.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [RFC PATCH v2 3/3] KVM: arm64: Enable errata based on migration
 target CPUs
Thread-Topic: [RFC PATCH v2 3/3] KVM: arm64: Enable errata based on migration
 target CPUs
Thread-Index: AQHbJfomCZMu0lx0Uky3XpJwm4Q1tLKWjy0AgAXbpRA=
Date: Mon, 28 Oct 2024 17:29:14 +0000
Message-ID: <0a23971725644a9bbfe7ec60b5e05033@huawei.com>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
 <20241024094012.29452-4-shameerali.kolothum.thodi@huawei.com>
 <Zxr2JMNzOWT3zPWH@linux.dev>
In-Reply-To: <Zxr2JMNzOWT3zPWH@linux.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.153.28]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_102924_722244_94072BB2 
X-CRM114-Status: GOOD (  19.70  )
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
> From: Oliver Upton <oliver.upton@linux.dev>
> Sent: Friday, October 25, 2024 2:37 AM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: kvmarm@lists.linux.dev; maz@kernel.org; catalin.marinas@arm.com;
> will@kernel.org; mark.rutland@arm.com; cohuck@redhat.com;
> eric.auger@redhat.com; yuzenghui <yuzenghui@huawei.com>; Wangzhou
> (B) <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [RFC PATCH v2 3/3] KVM: arm64: Enable errata based on
> migration target CPUs
>=20
> nitpick: shortlog shouldn't use a KVM prefix if the patch isn't touching
> KVM.
>=20
> On Thu, Oct 24, 2024 at 10:40:12AM +0100, Shameer Kolothum wrote:
> > If the Guest has migration target CPUs set, enable all errata
> > that are based on target MIDR/REVIDR.
> >
> > Also make sure we call the paravirt helper to retrieve migration
> > targets if any.
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
>=20
> I don't know if you saw my suggestion on v1 [*], but it'd be great if we
> can hide the array of implementations from users of is_midr_in_range()
> and friends.

I did see your suggestion but my bad,  misunderstood it and thought that yo=
u are
referring to _midr_range() functions in cpu_errata.c only.
=20
> There's other junk keyed off MIDR (e.g. Spectre) that also needs to be
> aware of all the implementations where the VM might run. The easiest way
> to do that is to stop using a caller-provided MIDR and have
> is_midr_in_range() either walk the array of implementations or read
> MIDR_EL1.

So the suggestion is to use something like this?

bool is_midr_in_range(struct midr_range const *range)
{
        int i;

        for (i =3D 0; i < errata_migrn_target_num; i++) {
                if (midr_is_cpu_model_range(errata_migrn_target_cpus[i].mid=
r,
                                            range->model,
                                            range->rv_min, range->rv_max))
                        return true;
        }

        return midr_is_cpu_model_range(read_cpuid_id(), range->model,
                                       range->rv_min, range->rv_max);
}

Or do we need some kind of hint to these functions to specify which=20
MIDR to use? I think there are at least couple of places where it looks lik=
e
it make sense to do the checking against MIDR_EL1 only.
(eg: has_neoverse_n1_erratum_1542419().

Thanks,
Shameer

