Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E49F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIJ1KNMQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWbuEhCR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMGqCUBvkzKyHx9AT+4QUIhrDabLOK6bK0GYypE8T3U=; b=mIJ1KNMQU5sUWq+vdWCEwgS149
	YlCMRnv7uzcpfNBjvK/sk9GUZfDjkWfFkVIgFxhAlo7DxPkFqvla7dwDSQNxVJ/rvlwik93xAIpr4
	VdfBL7mY9QIy4VPNod35Y1PJiaL8cc+90z5u8FhPURaRJqv+6hIWGrmXEf3qmQh5OoVjhav22qUva
	mOfB0WiwdroOZlaQR4qX3OVcvf+RboQd6xRLZIEM0KSB6FYdGnB3DJ/dyhJMCvKGABkAxzmGvzytN
	fxuulkEDj+LEC+39wLlXLfCniI3NF9bqMwDmst/gL+uOZqpXQvc512bQGrHm/jv2ZC3Wa3lkGvJr5
	JRUoKQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWMv-0000000BuFD-2twB;
	Wed, 21 Oct 2026 13:28:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWMu-0000000BuF4-2RkB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:28:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B07A760052;
	Wed, 21 Oct 2026 13:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADF61F000C4;
	Wed, 21 Oct 2026 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589315;
	bh=oMGqCUBvkzKyHx9AT+4QUIhrDabLOK6bK0GYypE8T3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jWbuEhCRUfg7HSS5kAjkc0CEflHpYNfFhGnBYKQbboed1IQQferHvn1sOSJslAVBI
	 WV1ui3+W3v98X+CCX6+wMnWqabDWCrOx1BcjIyG7RAnnhjYWGO3wqO/BWGXiRPn3/G
	 GNR/2zc2tRZWZlCqNyP6C/8CnCNB+cyuhNFDQfUvSbtJkSRf4Y8HG5Wi1N0wzb8mKg
	 QKD5tjhp0cUzYqsPvhaguchFdk+M6Hq9NMV1lRsEUEd0m5KnudPqgxbbIlLXFlZ9BF
	 6PP+Woil9GKEwXKoKSzKo+juFtkhgZQdNhR0yuOCrNVUdR/ykYExRDhGffExZFhgkJ
	 S6VA+EB4G1KEg==
Date: Wed, 21 Oct 2026 14:28:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
Message-ID: <ati9chI3v4jOuAiT@gremlin>
References: <20261020064306.1542865-1-fuad.tabba@linux.dev>
 <atc2Y4gHwtGlffns@gremlin>
 <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 08:30:56PM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Tue, 20 Oct 2026 12:35:14 +0100, "Lorenzo Stoakes (ARM)"
> <ljs@kernel.org> wrote:
> [...]
> >> Fixes: 70ed7238297fb ("KVM: arm64: Sanitise ID_AA64MMFR3_EL1")
> >> Fixes: d4a89e5aee23e ("KVM: arm64: Expose S1PIE to guests")
> >
> > I guess kernels that are missing 19868b67e3e7 and 2ce80f624032 will need
> > that stuff ported too?
>
> I think 2ce80f624032 would have to go back too, since without it a VMM
> can still write the ID registers after they've been sanitised.
> 19868b67e3e7 mostly provides the call site: the version I tested on
> 7.3-rc3 called kvm_idregs_enforce_dependencies() at the top of
> kvm_finalize_sys_regs() instead. Kernels before 6.16 don't have
> config.c, so the backport there would be a different patch. I'd leave
> the stable side to Marc though.

Ack :) I guess this is mostly 'stable looks painful' :)

>
> [...]
> > static const struct reg_feat_map_desc *idreg_feat_maps[] = {
> >         &id_aa64mmfr3_el1_desc,
> > +       &id_aa64pfr1_el1_desc,
> > };
> >
> > Right?
>
> That's how I'd expect it to look. Since
> kvm_idregs_enforce_dependencies() repeats until nothing changes,
> feat_gcs() could also test FEAT_S1PIE directly: by then, S1PIE has
> been cleared if its own dependencies are missing.

Great, so that clears I think the really main outstanding question for that
series. Really nice! :)

>
> [...]
> >> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> [...]
> >> @@ -59,6 +59,7 @@ struct reg_feat_map_desc {
> >>         const struct reg_bits_to_feat_map feat_map;
> >>         const struct reg_bits_to_feat_map *bit_feat_map;
> >>         const unsigned int                bit_feat_map_sz;
> >> +       const unsigned int                idreg_idx;
> >
> > This field feels a bit hazardous - 0 is a valid index and now things that
> > don't declare it are setting a valid value.
>
> idreg_idx is only read for the descriptors in idreg_feat_maps[], which
> all come from DECLARE_IDREG_FEAT_MAP(), so the 0 in the others is
> never used. Storing the encoding would work as well, I'll leave that
> one to Marc.

Yeah not used, but you're defaulting to a valid value, so it's got real
footgun potential.

>
> [...]
> >> +static bool idreg_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
> >
> > To me this reads confusingly - idreg_apply_deps() would be clearer I think.
>
> Agreed.
>
> [...]
> >> +       for (int i = 0; i < r->bit_feat_map_sz; i++) {
> >> +               if ((r->bit_feat_map[i].flags & CALL_FUNC) &&
> >
> > What if it isn't a CALL_FUNC feature?
> >
> > Could this loop just be replaced with compute_resx_bits()?
>
> It's skipped, so a dependency written as a plain field match would be
> silently ignored. Both entries today are CALL_FUNC, but
> compute_resx_bits() handles every kind of entry and would also give
> the res1 line something to set. It'd mean moving idreg_deps() below
> it.
>
> Marc, compute_resx_bits(), the rename and the loop rework are all fine
> by me. If you agree, I can respin with them, or you can fold them in
> when applying, whichever is easier for you.
>
> Thanks,
> /fuad

Thanks! :)

--
Cheers, Lorenzo

