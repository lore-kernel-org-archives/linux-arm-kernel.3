Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A05DC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDYixsiftOVn0Vs6xsPNGtUQUZqF/4hWw+q3BeKHGVI=; b=mw6RQ8MCDbJubF9qKJ+wpu/Ojn
	d4QEo4DN56HWW5JehUE5D+xzQ/8lyjlbo1LTMIoRksAkWmYd31haO2a/eo9TUE1ORrNbblEmS9lGl
	OiGR4iG7fcImQRFsWBvI+TwVQPsBjb68VGUZqDvKBPt+U3xKIzCj59lWnqckfq8zwlT3UldKz2TgP
	mSY7Zxwsgzl8P9Mm7gFozzoRnJ8u85zktAK2F8icHeAuJovGsjgv/rZc5mE13oMDjH7TN0fRNeI9A
	Wu+LUzHOqB3cbmtBxUj+Li/c7DzCTTXVeLHfeHnkKJPNk8vY7ykJy9KJTSC7nW65ZhwSKPFoL2hmG
	YlCznYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSt3-00000002sWW-1ZQc;
	Mon, 27 Jan 2025 17:27:01 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSqg-00000002sMX-2GHZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 17:24:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YhZww54Htz6M4Xw;
	Tue, 28 Jan 2025 01:22:24 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 72BE6140B73;
	Tue, 28 Jan 2025 01:24:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 Jan 2025 18:24:27 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 27 Jan 2025 18:24:26 +0100
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
Subject: RE: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Thread-Topic: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Thread-Index: AQHbbnQf1mRnk6lqN0urqeTQZlYYF7Mqzb0AgAASSJA=
Date: Mon, 27 Jan 2025 17:24:26 +0000
Message-ID: <c448a912008d4c69b1e7940838fb061d@huawei.com>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
 <20250124151732.6072-4-shameerali.kolothum.thodi@huawei.com>
 <Z5e86rCgvbtK84CT@linux.dev>
In-Reply-To: <Z5e86rCgvbtK84CT@linux.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.153.225]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_092434_869369_BA7F5FAF 
X-CRM114-Status: GOOD (  23.34  )
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
> Sent: Monday, January 27, 2025 5:06 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: kvmarm@lists.linux.dev; maz@kernel.org; catalin.marinas@arm.com;
> will@kernel.org; mark.rutland@arm.com; cohuck@redhat.com;
> eric.auger@redhat.com; sebott@redhat.com; yuzenghui
> <yuzenghui@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific
> hypercalls
>=20
> Hi Shameer,
>=20
> On Fri, Jan 24, 2025 at 03:17:31PM +0000, Shameer Kolothum wrote:
> > Currently ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID returns
> the bitmap
> > corresponding to KVM_REG_ARM_VENDOR_HYP_BMAP and it only
> returns
> > _KVM_FEATURES_FUNC_ID and _KVM_PTP_FUNC_ID. Change that to
> return all
> > the KVM/arm64-specific hypercalls exposed by
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
> > +		/* Function numbers 8-63 are reserved for pKVM for now */
> > +		val[2] =3D
> GENMASK((ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS - 64),
> > +
> (ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER - 64));
> >  		break;
>=20
> This isn't right. The pKVM carveout exists for some KVM-internal
> bookkeeping to (hopefully) avoid breaking guest ABI between what's in the
> downstream android kernel and what eventually gets accepted upstream.
>=20
> The purpose of this hypercall is for the guest to discover what interface=
s are
> actually implemented by the hypervisor, and we definitely do not
> implement these upstream at the moment.

Ok. I had some confusion on pKVM ones as I could see the kvm_arm_hyp_servic=
e_available()
being called with those in arm-pkvm-guest.c. So that explains it.
.
I will remove the pKVM ones and just add support to report the ones introdu=
ced
in this series.

Thanks,
Shameer


