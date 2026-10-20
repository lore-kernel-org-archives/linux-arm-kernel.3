Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33EC606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hIevQDD7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSo3U/Dg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Etd6ucBFRv+2kOi2yYshLpQy3u0L6/x6e/cAweVbOSw=; b=hIevQDD72LDFmnwmbqNAkJXmQ6
	5wyHQes1zONr/3JHc1LGzqGZbLmLnacWXEo0nZTrRRhlIAYH/sW1VLBklFAUY1FBOQQ8Bib7OSfMZ
	zaZeVR7NgboAWc1+LTtDUmQ3q15TZ6sldg82Y+QW4DLFc+Wel7XGqOHfVml8KWM1xbQi/UkNN3lhe
	hbPPVdr2qb53wCJW/zdyIvc8dyIvlfnssSPcdacGOcLS9q2bdwJXvIrLegvWBMmwNjVGurCsyNuLY
	yY+GLlovZ2tO6I6hGpY2eOqO9TNIxWX4ajcqjDX2LaBMDD8dEq3OecHvA7qMnP3cgGqJsQX0LnuB4
	L2qYH9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9iC-00000009lV5-1iDU;
	Tue, 20 Oct 2026 13:17:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9i6-00000009lSr-2hjP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:16:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F73E4054F;
	Tue, 20 Oct 2026 13:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3471F000C9;
	Tue, 20 Oct 2026 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502218;
	bh=Etd6ucBFRv+2kOi2yYshLpQy3u0L6/x6e/cAweVbOSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lSo3U/DgvqTSwlraWwSAgPECmRJEUs5KxGqJeCP0RLzL0OcBhj+6q3yvZlAwTeGN9
	 yvt5l0NY62BVsjT7s9GPrNquu4sIswA3VglkICr9Q8tqs0aljuKTEXLj5Z2yK+cBZ/
	 AB9jJv/nmcYJRcAf6fJqDvfozzWW9RGYPfrulUpiTfl8dsaDukSSgDh74pfswNUq6G
	 //4tVbfNHuwgiDlB/JjqZ1oFsZd5mpISMAxB+rOW+mp71Yt+JpxoSappWPjbnm07Jf
	 Xj67C29HMVAuW36W7S1PkCJyU+PECJO5Jpw8OR9idY9MnGNKDFOGpDqRrqCz2L89/R
	 /AQUqDDP550Lg==
Date: Tue, 20 Oct 2026 14:16:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 02/15] KVM: arm64: Refuse to start a guest with S1PIE
 or S1POE but not TCR2
Message-ID: <atdebC62zPS1sQeR@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-2-3556644cd927@kernel.org>
 <86fqyn2che.wl-maz@kernel.org>
 <as-f1JfUy38Xt9QA@gremlin>
 <ae24e80c-1b34-4827-9c93-e80b987e9cd7@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae24e80c-1b34-4827-9c93-e80b987e9cd7@sirena.org.uk>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 06:48:37PM +0100, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 04:47:22PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Sat, Oct 03, 2026 at 01:30:05PM +0100, Marc Zyngier wrote:
>
> > > This *absolutely* needs to be data driven, and we're not going back to
> > > over two years ago. We already have most of what is needed in
> > > config.c, and it is only a matter of making sure that S1PxE is only
> > > enabled for the guest if TCR2 and ATS1A are also present. If that
> > > means additional sanitisation of the idregs when finalised, so be it.
>
> I do agree that's what we should have, I started down that route but as
> I noted in the commit log it felt like I was pulling in disproportionate
> refactoring given the existing gap.
>
> > > If userspace decides to expose crap in the ID registers, that's its
> > > own problem, and we're not in the business of enforcing idiotic
> > > configurations. The only thing that matters is that the state that KVM
> > > deals with is consistent.
>
> > As I understand it: don't return an error for a configuration that doesn't
> > make sense, enforce RES0 instead.
>
> I went with erroring out there to make sure that we didn't make any
> mistakes with the ordering of our checks - I didn't want to accidentally
> end up with a situation where we look at the dependencies for feature A,
> decide that it's OK, then later check feature B which it depends on and
> turn it off due to it missing it's own prerequisite.
>
> We can resolve that like you've done here by having the full dependency
> stack in every check but I worried that this would be error prone due to
> all the duplication, however looking at your code I think we can resolve
> that anyway, see blow.
>
> Userspace really shouldn't be setting up guests where we need to make
> adjustments in the first place, and setting up guests isn't that hot a
> path so like Marc says so long as KVM protects itself we're fine.
>
> >  #define kvm_has_s1pie(k)				\
> > -	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
> > +	(kvm_has_tcr2(k) &&				\
> > +	 kvm_has_feat((k), ID_AA64ISAR2_EL1, ATS1A, IMP) &&	\
> > +	 kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
>
> This will mean that every time we check for an individual feature
> throughout KVM we check for all the dependencies as well.  A lot of the
> time that's not really going to matter but we have these checks in hot
> paths like context switches.
>
> > +static bool feat_s1pie(struct kvm *kvm)
> > +{
> > +	return kvm_has_s1pie(kvm);
> > +}
>
> We should put the dependencies in here where they're only checked during
> initialisation instead, that way the hot paths only need to look at the
> leaf features.  We could also deal with the duplication concern by
> having the functions call each other rather than duplicating their
> contents:
>
> 	static bool feat_gcs(struct kvm *kvm)
> 	{
> 		if (!feat_s1pie(kvm))
> 			return false;
>
> 		return kvm_has_gcs(kvm);
> 	}
>
> (or whatever stylistic variation of that.)
>
> This approach also needs the code for updating the ID registers since
> config.c doesn't do that at the moment.  Some of the existing visibility
> limiting stuff (like for 32 bit ID registers without AArch32 or
> ID_AA64ZFR0_EL1 without SVE) could be moved over too.

Hopefully Fuad + Marc's efforts [0] make all of this fairly easy :) as we
now have a specific dependency mechanism, and with GCS added on respin
should enforce all this correctly.

>
> TBH when I said in the commit log I was thinking of something more data
> driven I was thinking more of having the dependencies expressed as pure
> data, more like the way the test in set_id_regs is written.  This also
> seems fine to me, the checks are similar.  It's just much more invasive.

Indeed. Perhaps the config.c approach will make it easier to convert JSON
-> code also?

--
Cheers, Lorenzo

[0]:https://lore.kernel.org/r/20261020064306.1542865-1-fuad.tabba@linux.dev

