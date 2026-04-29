Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D302FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJIE9Uq1CygM84NK+Wmigl8ezWThRB0f0nuBAJurmIg=; b=Q3oVY+VMmBlBEmB6Z9bZRaT4W7
	EtyXGkNO3AyDEkrMFb7ZzzPtf9bv6ioDLMbT5LQekFrFeFH17RsetkOIgv3urgGp9shlXwD2xPdSS
	rNOTdIBKQOo7tdpTr6kfGhDviAUQc6dJ/gV0hl9m/edX7ABW875mpNsJVidD5AU1BtH0mW8NngWoz
	LPvuvYMaGLF5hwSZu21Ao5kQ8U8mXmzj/FX/41FTWGpnvIHH4efjtg8LWzSbi9bC6l8O5uLIIIm3d
	mCzk/r2A0BQ/pJImEymjgA/hzVMDPkRw2b2coq4QxgFaL9vYSUJYOzjF6tWbFQLISfiwYuvqjuJsF
	sZOcMoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0nb-00000003HGA-2rXA;
	Wed, 29 Apr 2026 09:01:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0nU-00000003HEu-0q9r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:01:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 780E343F66;
	Wed, 29 Apr 2026 09:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326CAC19425;
	Wed, 29 Apr 2026 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777453291;
	bh=yPvnutkaqdUvY5Sa11PPA09D33u8fKpbeuUykRqteQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P08g+7LgE8rugnyDZKpkIBlwTI6XcLs70Wxotcz3NigGJt5sPdulOVqFP+WMCbnbJ
	 V8MF2QHpGAqT1JRlB8HvnNDasvvZwWcvTFwGP1is0PW6GpmJVYCz72+rBrNkV28L6k
	 xw9B+JMlKHJpQdHKmjErSfSYRmJz6VR9DrsaITjblPGVB55S9nwIXl3jEyf4+J++Hv
	 R11pnNU7XoiNOQn9xj0n2/p6HKQMuTvtFqqcLt+89lLdk4oKU0AAl87HcrWJq9ZmJd
	 Hveo0rTPUa2lF2GyTEbzuvm0oaXcu+KG1/QtSx4fnHBxxipeUGycoL8j0UMZV06Iyy
	 6T3QFtVamvK7w==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 3/3] coco: guest: arm64: Query host IPA-change
 alignment via RHI
In-Reply-To: <86tssvyz2v.wl-maz@kernel.org>
References: <20260427063108.909019-1-aneesh.kumar@kernel.org>
 <20260427063108.909019-4-aneesh.kumar@kernel.org>
 <86y0i8zo9f.wl-maz@kernel.org> <yq5a4ikv1c7p.fsf@kernel.org>
 <86tssvyz2v.wl-maz@kernel.org>
Date: Wed, 29 Apr 2026 14:31:23 +0530
Message-ID: <yq5azf2mywbg.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020132_303962_204C4C33 
X-CRM114-Status: GOOD (  45.00  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Tue, 28 Apr 2026 13:49:46 +0100,
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
>>=20
>> Marc Zyngier <maz@kernel.org> writes:
>>=20
>> > On Mon, 27 Apr 2026 07:31:08 +0100,
>> > "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
>> >>=20
>> >> Add the Realm Host Interface support needed to query host configurati=
on
>> >> from a Realm guest. Define the RHI hostconf SMCs, add rsi_host_call()=
, and
>> >> use them during Realm initialization to retrieve the host IPA-change
>> >> alignment size.
>> >
>> > I don't understand what "IPA-change" means. What you are after is the
>> > host's sharing granule size.
>> >
>>=20
>> This is part of the RHI specification, and the call is named
>> RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT. The intent is to determine the
>> alignment requirements for changing IPA attributes (protected vs.
>> unprotected IPA
>
> This really is a terrible name. Why the 'change' part? It doesn't
> change, it is a constant.
>
> Oh well...
>
> [...]
>
>> >> +static inline unsigned long rsi_host_call(struct rsi_host_call *rhi_=
call)
>> >> +{
>> >> +	phys_addr_t addr =3D virt_to_phys(rhi_call);
>> >> +	struct arm_smccc_res res;
>> >> +
>> >> +	arm_smccc_1_1_invoke(SMC_RSI_HOST_CALL, addr, &res);
>> >
>> > Errr... What guarantees that *rhi_call is *IPA contiguous*? This is
>> > incredibly fragile. You should at the very least check that this isn't
>> > vmalloc'd.
>> >
>>=20
>>=20
>> I didn=E2=80=99t quite follow that. We have other RSI calls (even RMI ca=
lls)
>> that do similar things, and the caller understands that the address
>> should be IPA-contiguous.
>
> Does it? Where is it documented?  All you get is a pointer, so all
> bets are off.
>
>> Are you suggesting that all RSI calls should
>> add checks for this?. or are you suggesting to update the API to
>>=20
>> unsigned long rsi_host_call(unsigned long rhi_call_phys) ?
>
> I'm suggesting that this API is subtly broken because it makes random
> assumption about the physical contiguity of the VA space. It does so
> without any check, without any documentation.
>
> Simply changing the parameter to phys_addr_t could at the very least
> capture some of the requirements, but I'd like something in big bold
> letters.
>
>>
>> >> +
>> >> +	return res.a0;
>> >> +}
>> >> +
>> >>  #endif /* __ASM_RSI_CMDS_H */
>> >> diff --git a/arch/arm64/include/asm/rsi_smc.h b/arch/arm64/include/as=
m/rsi_smc.h
>> >> index e19253f96c94..9ee8b5c7612e 100644
>> >> --- a/arch/arm64/include/asm/rsi_smc.h
>> >> +++ b/arch/arm64/include/asm/rsi_smc.h
>> >> @@ -182,6 +182,13 @@ struct realm_config {
>> >>   */
>> >>  #define SMC_RSI_IPA_STATE_GET			SMC_RSI_FID(0x198)
>> >>=20=20
>> >> +struct rsi_host_call {
>> >> +	union {
>> >> +		u16 imm;
>> >> +		u64 padding0;
>> >> +	};
>> >> +	u64 gprs[31];
>> >> +} __aligned(0x100);
>> >>  /*
>> >>   * Make a Host call.
>> >>   *
>> >> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
>> >> index fe627100d199..3e72dd9584ed 100644
>> >> --- a/arch/arm64/kernel/Makefile
>> >> +++ b/arch/arm64/kernel/Makefile
>> >> @@ -34,7 +34,7 @@ obj-y			:=3D debug-monitors.o entry.o irq.o fpsimd.=
o		\
>> >>  			   cpufeature.o alternative.o cacheinfo.o		\
>> >>  			   smp.o smp_spin_table.o topology.o smccc-call.o	\
>> >>  			   syscall.o proton-pack.o idle.o patching.o pi/	\
>> >> -			   rsi.o jump_label.o
>> >> +			   rsi.o jump_label.o rhi.o
>> >>=20=20
>> >>  obj-$(CONFIG_COMPAT)			+=3D sys32.o signal32.o			\
>> >>  					   sys_compat.o
>> >> diff --git a/arch/arm64/kernel/rhi.c b/arch/arm64/kernel/rhi.c
>> >> new file mode 100644
>> >> index 000000000000..7cd6c5102464
>> >> --- /dev/null
>> >> +++ b/arch/arm64/kernel/rhi.c
>> >> @@ -0,0 +1,54 @@
>> >> +// SPDX-License-Identifier: GPL-2.0-only
>> >> +/*
>> >> + * Copyright (C) 2026 ARM Ltd.
>> >> + */
>> >> +
>> >> +#include <linux/mm.h>
>> >> +#include <asm/rsi.h>
>> >> +#include <asm/rhi.h>
>> >> +
>> >> +/* we need an aligned rhicall for rsi_host_call. slab is not yet rea=
dy */
>> >> +static struct rsi_host_call hyp_pagesize_rhicall;
>> >
>> > Why the "hyp_" prefix? This has absolutely nothing to with the
>> > hypervisor.
>> >
>>=20
>> Sure will update "hyp_" reference to host.=20
>>=20
>>=20
>> >> +unsigned long rhi_get_ipa_change_alignment(void)
>> >> +{
>> >> +	long ret;
>> >> +	unsigned long ipa_change_align;
>> >> +
>> >> +	hyp_pagesize_rhicall.imm =3D 0;
>> >> +	hyp_pagesize_rhicall.gprs[0] =3D RHI_HOSTCONF_VERSION;
>> >> +	ret =3D rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
>> >> +	if (ret !=3D RSI_SUCCESS)
>> >> +		goto err_out;
>> >> +
>> >> +	if (hyp_pagesize_rhicall.gprs[0] !=3D RHI_HOSTCONF_VER_1_0)
>> >> +		goto err_out;
>> >> +
>> >> +	hyp_pagesize_rhicall.imm =3D 0;
>> >> +	hyp_pagesize_rhicall.gprs[0] =3D RHI_HOSTCONF_FEATURES;
>> >> +	ret =3D rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
>> >> +	if (ret !=3D RSI_SUCCESS)
>> >> +		goto err_out;
>> >> +
>> >> +	if (!(hyp_pagesize_rhicall.gprs[0] & __RHI_HOSTCONF_GET_IPA_CHANGE_=
ALIGNMENT))
>> >> +		goto err_out;
>> >> +
>> >> +	hyp_pagesize_rhicall.imm =3D 0;
>> >> +	hyp_pagesize_rhicall.gprs[0] =3D RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNM=
ENT;
>> >> +	ret =3D rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
>> >> +	if (ret !=3D RSI_SUCCESS)
>> >> +		goto err_out;
>> >> +
>> >> +	ipa_change_align =3D hyp_pagesize_rhicall.gprs[0];
>> >> +	/* This error needs special handling in the caller */
>> >> +	if (ipa_change_align & (SZ_4K - 1))
>> >> +		return 0;
>> >> +
>> >> +	return ipa_change_align;
>> >> +
>> >> +err_out:
>> >> +	/*
>> >> +	 * For failure condition assume host is built with 4K page size
>> >> +	 * and hence ipa change alignment can be guest PAGE_SIZE.
>> >> +	 */
>> >> +	return PAGE_SIZE;
>> >> +}
>> >
>> > Why can't this be part of rsi.c? This is an RSI call, and it should be
>> > part of the RSI initialisation.
>> >
>>=20
>> This is an RHI call as per the specification, hence it has been added to
>> rhi.c.
>
> News flash: this is the Linux kernel, not an ARM spec. We organise
> things based on the logical use, not on the TLA associated with it.
>
> And RHI is implemented in terms of RSI. In rsi.c it goes. We don't
> need this pointless proliferation of helper files that only result in
> equally pointless global symbols.
>
>>=20
>> >> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
>> >> index 9e846ce4ef9c..ff735c04e236 100644
>> >> --- a/arch/arm64/kernel/rsi.c
>> >> +++ b/arch/arm64/kernel/rsi.c
>> >> @@ -14,8 +14,10 @@
>> >>  #include <asm/mem_encrypt.h>
>> >>  #include <asm/pgtable.h>
>> >>  #include <asm/rsi.h>
>> >> +#include <asm/rhi.h>
>> >>=20=20
>> >>  static struct realm_config config;
>> >> +static unsigned long ipa_change_alignment =3D PAGE_SIZE;
>> >>=20=20
>> >>  unsigned long prot_ns_shared;
>> >>  EXPORT_SYMBOL(prot_ns_shared);
>> >> @@ -139,6 +141,11 @@ static int realm_ioremap_hook(phys_addr_t phys, =
size_t size, pgprot_t *prot)
>> >>  	return 0;
>> >>  }
>> >>=20=20
>> >> +unsigned long realm_get_hyp_pagesize(void)
>> >> +{
>> >> +	return ipa_change_alignment;
>> >> +}
>> >
>> > Again, this has nothing to do with the hypervisor, but the host. And
>> > ipa_change_alignment is still a wording I can't wrap my small head
>> > around.
>> >
>> >> +
>> >>  void __init arm64_rsi_init(void)
>> >>  {
>> >>  	if (arm_smccc_1_1_get_conduit() !=3D SMCCC_CONDUIT_SMC)
>> >> @@ -147,6 +154,12 @@ void __init arm64_rsi_init(void)
>> >>  		return;
>> >>  	if (WARN_ON(rsi_get_realm_config(&config)))
>> >>  		return;
>> >> +
>> >> +	ipa_change_alignment =3D rhi_get_ipa_change_alignment();
>> >> +	/* If we don't get a correct alignment response, don't enable realm=
 */
>> >> +	if (!ipa_change_alignment)
>> >> +		return;
>> >
>> > But at the same time, you override a global value with an error, and
>> > then paper over it in mem_decrypt_granule_size()...
>> >
>>=20
>>=20
>> I believe I received similar feedback on my previous version as well,
>> which I didn=E2=80=99t quite follow.
>
> And you didn't think of asking? Sometimes I wonder what these patch
> reviews are for... Just to waste some more electrons, I guess :-/.
>
>>=20
>> rhi_get_ipa_change_alignment() only returns an error when the host
>> returns a size that is not 4K-aligned. Otherwise, it returns the
>> host-determined size, or defaults to guest PAGE_SIZE if the RHI call
>> itself is not supported.
>
> You encode the error as 0. You override ipa_change_alignment with 0.
>
> Then...
>
>> >> +size_t mem_decrypt_granule_size(void)
>> >> +{
>> >> +	if (is_realm_world())
>> >> +		return max(PAGE_SIZE, realm_get_hyp_pagesize());
>> >
>> > If you didn't mess with ipa_change_alignment above, you shouldn't need
>> > this max().
>> >
>>=20
>> size_t mem_decrypt_granule_size(void)
>> {
>> 	if (is_realm_world())
>> 		return max(PAGE_SIZE, realm_get_hyp_pagesize());
>> 	return PAGE_SIZE;
>> }
>>=20
>> That needs to use max(), because we should align to the guest PAGE_SIZE
>> if it is larger than the host-specified alignment value.
>
> ... you need to correct that back to PAGE_SIZE because you have stored
> something smaller than PAGE_SIZE.
>
> Isn't the problem really obvious? ipa_change_alignment can *NEVER* go
> down. It should never be allowed to reduce, because that's exactly
> the property you are trying to enforce.
>

Sure, I will update rhi_get_ipa_change_alignment() to always return the
max value.

-aneesh

