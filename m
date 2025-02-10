Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C7BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6W2GiRK+d+2rjg3HyC5SofuVJ0Xx0sn4kJ9Z1nVs2E=; b=nphtogrZ/hTtSGTDclXSBRJWyQ
	+ksgf9+uWGoagD8OmceYQ/UgwYeViAPlDSjxM3ackjXXdMxRXAXBH+l1gV5ANelS1U4tYpHKylHs5
	Ah1C3Qu18TRaolL2InVGafUz1G2qhX5LgwuqP+f5Dh2VrGucNILmQ1NI1ITPnDZbwbYbvnF9SOhNe
	KFx6Shi8DYcLLnJMeTUA7QJXgmFMxOjLqvos7DcDQNFQH15CJlTmNVwDL0Hvbgi1UJFRL6Rzx2SlR
	RxnKsI96KleJ9vJYM8L1+XfiqEutR9+TFUj7pV6V2CSAB03EKXBLbjE9tco///OK5HizKlNs1KBYy
	kjZbbzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRGL-0000000H45l-1Cit;
	Mon, 10 Feb 2025 10:43:37 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thR9J-0000000H2Pq-0rax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:36:23 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ys1Bz6p1cz6M4fX;
	Mon, 10 Feb 2025 18:33:47 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
	by mail.maildlp.com (Postfix) with ESMTPS id 1FD0E140B33;
	Mon, 10 Feb 2025 18:36:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Feb 2025 11:36:09 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 10 Feb 2025 11:36:09 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Oliver Upton <oliver.upton@linux.dev>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "maz@kernel.org"
	<maz@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "sebott@redhat.com"
	<sebott@redhat.com>, yuzenghui <yuzenghui@huawei.com>, "Wangzhou (B)"
	<wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, Anthony Jebson
	<anthony.jebson@huawei.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH v6 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Thread-Topic: [PATCH v6 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Thread-Index: AQHbd9qkSPWoOMhcC0iA+ywSQ0mcwrM8GZ0AgAAA3QCABEAz0A==
Date: Mon, 10 Feb 2025 10:36:09 +0000
Message-ID: <a9a696009f8e47e0bac9e2d9289ebb0d@huawei.com>
References: <20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com>
 <20250205132222.55816-4-shameerali.kolothum.thodi@huawei.com>
 <Z6ZPDml0JKuSjLIO@linux.dev> <Z6ZPyKK7HLHTtxYu@linux.dev>
In-Reply-To: <Z6ZPyKK7HLHTtxYu@linux.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023621_565044_894E479B 
X-CRM114-Status: GOOD (  28.18  )
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
> Sent: Friday, February 7, 2025 6:24 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: kvmarm@lists.linux.dev; maz@kernel.org; catalin.marinas@arm.com;
> will@kernel.org; mark.rutland@arm.com; cohuck@redhat.com;
> eric.auger@redhat.com; sebott@redhat.com; yuzenghui
> <yuzenghui@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [PATCH v6 3/4] KVM: arm64: Report all the KVM/arm64-specific
> hypercalls
>=20
> On Fri, Feb 07, 2025 at 10:21:13AM -0800, Oliver Upton wrote:
> > On Wed, Feb 05, 2025 at 01:22:21PM +0000, Shameer Kolothum wrote:
> > > Currently ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID returns
> the
> > > bitmap corresponding to KVM_REG_ARM_VENDOR_HYP_BMAP and it
> only
> > > returns _KVM_FEATURES_FUNC_ID and _KVM_PTP_FUNC_ID. Change
> that
> > > to return all the KVM/arm64-specific hypercalls exposed by
> > > KVM/arm64 to guest operating systems.
> > >
> > > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  arch/arm64/kvm/hypercalls.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.=
c
> > > index 27ce4cb44904..5cef2590ffdf 100644
> > > --- a/arch/arm64/kvm/hypercalls.c
> > > +++ b/arch/arm64/kvm/hypercalls.c
> > > @@ -359,7 +359,11 @@ int kvm_smccc_call_handler(struct kvm_vcpu
> *vcpu)
> > >  		val[3] =3D ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
> > >  		break;
> > >  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
> > > -		val[0] =3D smccc_feat->vendor_hyp_bmap;
> > > +		val[0] =3D GENMASK(ARM_SMCCC_KVM_FUNC_PTP,
> > > +				 ARM_SMCCC_KVM_FUNC_FEATURES);
> > > +		/* Function numbers 2-63 are reserved for pKVM for now */
> > > +		val[2] =3D
> GENMASK((ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS - 64),
> > > +
> (ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER - 64));
> > >  		break;
> >
> > This isn't right, vendor_hyp_bmap is very much load bearing. We have a
> > documented UAPI that allows userspace to control the hypercalls exposed
> > to the guest.
> >
> > The idea being a user wants kernel rollback safety and doesn't expose
> > hypercalls that could potentially be revoked.
> >
> > https://docs.kernel.org/virt/kvm/arm/fw-pseudo-registers.html#bitmap-
> feature-firmware-registers
>=20
> To add:
>=20
> KVM cannot advertise the DISCOVER_IMPL* stuff unconditionally, since the
> expectation is that userspace implements these hypercalls. These bits
> may need to be writable from userspace but have a reset value of 0.
>=20

Ok. So IIUC, vendor_hyp_bmap actually holds the information which Vendor Hy=
p
services  are available to the user space and can be get/set using GET/SET =
_ONE_REG
interfaces.

Currently this bitmap is a 64 bit one and if we have to have a one to one m=
apping
between these bitmap and the hypercall function numbers, then that requires
some changes.

Because function numbers 2-63 are now reserved for pKVM and the new ones
introduced in this series take 64 & 65.

May be we can have KVM_REG_ARM_VENDOR_HYP_BMAP_2  which represents
64-127?

Or can we take the next available bits(2 & 3) for KVM_REG_ARM_VENDOR_HYP_BM=
AP
and then map it to the function number appropriately (64 & 65) when
ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID is handled?

Thoughts?

Thanks,
Shameer




