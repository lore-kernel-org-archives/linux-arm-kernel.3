Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6C5C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Bx/xTMbjrEyUYAh6LMhdq8pvENrh9HgrcKOFr5b1qA=; b=z22RW9IrOQUonIDzxT4KbXtit/
	U3NO3ABGDmcsaLn8cgXyPM7M2il/QxB/hJJoVyI/46iiQ+Nvu/jJLAag0DxfPEN3+lon4SEqLfkTf
	RegvnYfFjCVhNBS7E+8q8LHMteW+ATADdmMDatwZWKyx1yQ+bN0vI5xsQE0DzVb0AWSsefegJHQjz
	mzKjxNrfd0MUf/L0MAhrJqKK/+M3ZwTo9uEXRTit9MBOKYgXp0XMVzJuP4BFUm31sK56psEkFa5bJ
	V544X1T89pcNAnzR4iLUY3PDfhT7V5QYJES/spwIlS2eIK+QSrdyzrZTAeLA3X7BHvScWu1Y1TY+C
	AkWBwiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPIz-00000002OJM-2slD;
	Mon, 27 Jan 2025 13:37:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPHd-00000002OAF-3WX1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 13:36:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YhTs96bcrz6L50S;
	Mon, 27 Jan 2025 21:33:49 +0800 (CST)
Received: from frapeml500006.china.huawei.com (unknown [7.182.85.219])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D5F91400C8;
	Mon, 27 Jan 2025 21:35:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 Jan 2025 14:35:59 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 27 Jan 2025 14:35:59 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Cornelia Huck <cohuck@redhat.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "sebott@redhat.com"
	<sebott@redhat.com>, yuzenghui <yuzenghui@huawei.com>, "Wangzhou (B)"
	<wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, Anthony Jebson
	<anthony.jebson@huawei.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Thread-Topic: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Thread-Index: AQHbbnQf1mRnk6lqN0urqeTQZlYYF7MqhYyAgAAeQ9A=
Date: Mon, 27 Jan 2025 13:35:58 +0000
Message-ID: <337c614b99cc48cbbc9168f20a7e40df@huawei.com>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
	<20250124151732.6072-4-shameerali.kolothum.thodi@huawei.com>
 <8734h48lus.fsf@redhat.com>
In-Reply-To: <8734h48lus.fsf@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_053610_166098_676C91C3 
X-CRM114-Status: GOOD (  16.51  )
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
> Sent: Monday, January 27, 2025 12:47 PM
> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; kvmarm@lists.linux.dev;
> maz@kernel.org; oliver.upton@linux.dev
> Cc: catalin.marinas@arm.com; will@kernel.org; mark.rutland@arm.com;
> eric.auger@redhat.com; sebott@redhat.com; yuzenghui
> <yuzenghui@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific
> hypercalls
>=20
> On Fri, Jan 24 2025, Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Currently ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID returns
> the
> > bitmap corresponding to KVM_REG_ARM_VENDOR_HYP_BMAP and it
> only
> > returns _KVM_FEATURES_FUNC_ID and _KVM_PTP_FUNC_ID. Change that
> > to return all the KVM/arm64-specific hypercalls exposed by
> > KVM/arm64 to guest operating systems.
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  arch/arm64/kvm/hypercalls.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> > index 27ce4cb44904..6132cb542200 100644
> > --- a/arch/arm64/kvm/hypercalls.c
> > +++ b/arch/arm64/kvm/hypercalls.c
> > @@ -359,7 +359,11 @@ int kvm_smccc_call_handler(struct kvm_vcpu
> *vcpu)
> >  		val[3] =3D ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
> >  		break;
> >  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
> > -		val[0] =3D smccc_feat->vendor_hyp_bmap;
> > +		val[0] =3D GENMASK(ARM_SMCCC_KVM_FUNC_MMIO_GUARD,
> > +				 ARM_SMCCC_KVM_FUNC_FEATURES);
>=20
> Don't you need to exclude the reserved ids 5 and 6?

Oops...I overlooked it. Will correct.

Thanks,
Shameer

