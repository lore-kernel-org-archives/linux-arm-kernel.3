Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E93CF6ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEmcuElp0UQkGJCO6KQWjXnV/POLT0WxyNyLSZSnVYI=; b=kqLT0Sg5+iaTMIbpWlslB1gW4x
	tL5aYVNB9qTmhw8r+C9DrUS5LXToURyGKnOc1C0cIuvNGIcKTxSoUxOXRCnD9JpracTj9XBGEGPCN
	q5AElEYuJT6+X8wdGgB0WoBJIM0c8B6j0l4zLPITva3+mrFM4KI38f+GgyKLd967hZbQzaH2n7PEb
	rnhqvgT9JPqDAm5W1JGS3utHFb4jOilwvgg8Apj4bP8iZLSCCGQzuC0KeEJMYuuSzNig+R7rt/Pz7
	fY5GHihr+ZGpSxHPtciRUtJfsMDklYa5mmc+E9EVAZ95MUcrsu8V/iA11stTSzDquoPusYBIOlnfB
	A9bVuOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnEK-0000000Gcc7-375D;
	Thu, 08 Jan 2026 10:27:00 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnEH-0000000Gcb1-43ez
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 10:26:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DEmcuElp0UQkGJCO6KQWjXnV/POLT0WxyNyLSZSnVYI=;
	b=flRF/P2IsumUov+UukeIGuQd42cQFPlHBQi38PU20DD9lRCVhiwqBWcxv0uiHC3db8wha37C9
	cct0QUglVjOSoLZyJsDkJAHuqKT5j090f5kxfJaDnojlqlW7H71yFtEwtb3fIY/xtIjoahVt7jm
	Q3BsJYXwDEr9qooEl2u/itw=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dn1HG440CzN1Jm;
	Thu,  8 Jan 2026 18:24:42 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dn1KZ0TMyzHnGjN;
	Thu,  8 Jan 2026 18:26:42 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 026654056A;
	Thu,  8 Jan 2026 18:26:50 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 8 Jan
 2026 10:26:49 +0000
Date: Thu, 8 Jan 2026 10:26:47 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, Timothy Hayes <Timothy.Hayes@arm.com>, "Suzuki
 Poulose" <Suzuki.Poulose@arm.com>, nd <nd@arm.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, "maz@kernel.org"
	<maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>
Subject: Re: [PATCH v2 08/36] KVM: arm64: Introduce kvm_call_hyp_nvhe_res()
Message-ID: <20260108102647.00004a2d@huawei.com>
In-Reply-To: <5ef0d810c4619b941d5c74e79401ce584193604d.camel@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-9-sascha.bischoff@arm.com>
	<20260107103044.00000df0@huawei.com>
	<5ef0d810c4619b941d5c74e79401ce584193604d.camel@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_022658_413063_9C7345AE 
X-CRM114-Status: GOOD (  25.98  )
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

On Thu, 8 Jan 2026 09:48:39 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> On Wed, 2026-01-07 at 10:30 +0000, Jonathan Cameron wrote:
> > On Fri, 19 Dec 2025 15:52:38 +0000
> > Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
> >  =20
> > > There are times when it is desirable to have more than one return
> > > value for a hyp call. Split out kvm_call_hyp_nvhe_res from
> > > kvm_call_hyp_nvhe such that it is possible to directly provide
> > > struct
> > > arm_smccc_res from the calling code. Thereby, additional return
> > > values
> > > can be stored in res.a2, etc.
> > >=20
> > > Suggested-by: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com> =20
> > One question inline, mostly because I'm curious rather than a
> > suggestion
> > to change anything
> >=20
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> >  =20
> > > ---
> > > =A0arch/arm64/include/asm/kvm_host.h | 15 ++++++++++-----
> > > =A01 file changed, 10 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/include/asm/kvm_host.h
> > > b/arch/arm64/include/asm/kvm_host.h
> > > index b552a1e03848c..971b153b0a3fa 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -1208,14 +1208,19 @@ void kvm_arm_resume_guest(struct kvm *kvm);
> > > =A0#define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
> > > =A0
> > > =A0#ifndef __KVM_NVHE_HYPERVISOR__
> > > -#define kvm_call_hyp_nvhe(f,
> > > ...)						\
> > > +#define kvm_call_hyp_nvhe_res(res, f,
> > > ...)				\
> > > =A0	({						=09
> > > 	\
> > > -		struct arm_smccc_res
> > > res;				\
> > > -
> > > 									\
> > > +		struct arm_smccc_res *__res =3D
> > > res;			\ =20
> >=20
> > What's the purpose of the local variable? Type sanity check?
> > Feels like typecheck() would make the intent clearer.
> > Meh. Not used anywhere in arch/arm64 so maybe not. =20
>=20
> Far less exciting, I'm afraid.
>=20
> It is because of the text substitution that happens. The res here is
> replaced with &res from kvm_call_hyp_nvhe() and we end up with &res-
> >a0. Given that -> binds more tightly than &, we end up with the wrong =20
> thing, and the compiler barfs.
>=20
> An alternative would be to do:
>=20
> 	WARN_ON((res)->a0 !=3D SMCCC_RET_SUCCESS);
>=20
> This removes the need for the local variable. I've got no preference
> for which version we go with.

Ah fair enough.  Just leave it as it is.

Jonathan

>=20
> Sascha
>=20
> >=20
> >=20
> >  =20
> > > =A0		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),=09
> > > 	\
> > > -				=A0 ##__VA_ARGS__,
> > > &res);			\
> > > -		WARN_ON(res.a0 !=3D
> > > SMCCC_RET_SUCCESS);			\
> > > +				=A0 ##__VA_ARGS__,
> > > __res);		\
> > > +		WARN_ON(__res->a0 !=3D
> > > SMCCC_RET_SUCCESS);		\
> > > +	})
> > > +
> > > +#define kvm_call_hyp_nvhe(f,
> > > ...)					\
> > > +	({						=09
> > > 	\
> > > +		struct arm_smccc_res
> > > res;				\
> > > =A0							=09
> > > 	\
> > > +		kvm_call_hyp_nvhe_res(&res, f,
> > > ##__VA_ARGS__);		\
> > > =A0		res.a1;				=09
> > > 		\
> > > =A0	})
> > > =A0 =20
> >  =20
>=20


