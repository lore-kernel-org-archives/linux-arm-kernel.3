Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D720CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztWJU2EjfoLTEJPuQ+2lII5i140c6mxubxZEL3aTvdI=; b=CoU7/dfW2+yGMUueH6yh8jqQaZ
	6GJRfpr6U5vhRbl179MXmqdDARKJ3Te8qwcnX+ZsaSmYVoaiMkPllPusCBd9KmRyNxYBEbn2TV3z3
	MadGg1I6vghW9i8oAuiiww/J/WuIDxoVLU0gs1CY4Thp63S8KM0TgCdgVZ+oUGYU6c3uAX5Qw/sw3
	N94c+dgR3OYAJ+n3HG1vbnaBBhP62RR70U6BfQXLT1+6SIgHOGyxM8shQmOq4F7ZrmZqd1uGSBNSf
	UuJIoWiTvavV2Fke3Aec/aI985mGiUjSlAY/csI2cqG8uqXFTMuv8V47NXLwC8LpY1BG1y7mDZTLc
	+nRYEo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH35p-0000000G6OO-3bMz;
	Wed, 14 Oct 2026 17:48:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH35o-0000000G6OG-1UyA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:48:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC37E43CF9;
	Wed, 14 Oct 2026 17:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D221F000C4;
	Wed, 14 Oct 2026 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792000123;
	bh=ztWJU2EjfoLTEJPuQ+2lII5i140c6mxubxZEL3aTvdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f/feUoZ9pYIyFM/8FFZmrN+WLzqLFlPKmlCZq5JI/mWB99rlDr7gLp5u57SkWD5Tf
	 xhuAeuHnSy+e/2o9NRja9m64WfLg0oywRgfF0h+vXEyilYMpt13sWKOF3rawAS/30t
	 uKvpuaWGoSHOuiWxr9X7mUEXphHsY8P+uG+3FXAGPDME28HXs+Ldh2jF/r3peGCgUP
	 K/Hw4GWmjliah8rPLLjGSSV5EkmwhlPVVSX3k4p1gCQSnNItMSv3ZCcc66OXq+n2aB
	 nWKF56v5iQkT5jqXRoONduYqkAJZInCgvBCFe2qudpnKLm7J5IuWIScrhaWYMttitc
	 gIspDF4iL+i/Q==
Date: Wed, 14 Oct 2026 18:48:37 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 02/15] KVM: arm64: Refuse to start a guest with S1PIE
 or S1POE but not TCR2
Message-ID: <ae24e80c-1b34-4827-9c93-e80b987e9cd7@sirena.org.uk>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-2-3556644cd927@kernel.org>
 <86fqyn2che.wl-maz@kernel.org>
 <as-f1JfUy38Xt9QA@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBzASHaWQ8wEZzsB"
Content-Disposition: inline
In-Reply-To: <as-f1JfUy38Xt9QA@gremlin>
X-Cookie: Live free or die.
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


--gBzASHaWQ8wEZzsB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 04:47:22PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Sat, Oct 03, 2026 at 01:30:05PM +0100, Marc Zyngier wrote:

> > This *absolutely* needs to be data driven, and we're not going back to
> > over two years ago. We already have most of what is needed in
> > config.c, and it is only a matter of making sure that S1PxE is only
> > enabled for the guest if TCR2 and ATS1A are also present. If that
> > means additional sanitisation of the idregs when finalised, so be it.

I do agree that's what we should have, I started down that route but as
I noted in the commit log it felt like I was pulling in disproportionate=20
refactoring given the existing gap.

> > If userspace decides to expose crap in the ID registers, that's its
> > own problem, and we're not in the business of enforcing idiotic
> > configurations. The only thing that matters is that the state that KVM
> > deals with is consistent.

> As I understand it: don't return an error for a configuration that doesn't
> make sense, enforce RES0 instead.

I went with erroring out there to make sure that we didn't make any
mistakes with the ordering of our checks - I didn't want to accidentally
end up with a situation where we look at the dependencies for feature A,
decide that it's OK, then later check feature B which it depends on and
turn it off due to it missing it's own prerequisite.

We can resolve that like you've done here by having the full dependency
stack in every check but I worried that this would be error prone due to
all the duplication, however looking at your code I think we can resolve
that anyway, see blow.

Userspace really shouldn't be setting up guests where we need to make
adjustments in the first place, and setting up guests isn't that hot a
path so like Marc says so long as KVM protects itself we're fine.

>  #define kvm_has_s1pie(k)				\
> -	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
> +	(kvm_has_tcr2(k) &&				\
> +	 kvm_has_feat((k), ID_AA64ISAR2_EL1, ATS1A, IMP) &&	\
> +	 kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))

This will mean that every time we check for an individual feature
throughout KVM we check for all the dependencies as well.  A lot of the
time that's not really going to matter but we have these checks in hot
paths like context switches.

> +static bool feat_s1pie(struct kvm *kvm)
> +{
> +	return kvm_has_s1pie(kvm);
> +}

We should put the dependencies in here where they're only checked during
initialisation instead, that way the hot paths only need to look at the
leaf features.  We could also deal with the duplication concern by
having the functions call each other rather than duplicating their
contents:

	static bool feat_gcs(struct kvm *kvm)
	{
		if (!feat_s1pie(kvm))
			return false;

		return kvm_has_gcs(kvm);
	}

(or whatever stylistic variation of that.) =20

This approach also needs the code for updating the ID registers since
config.c doesn't do that at the moment.  Some of the existing visibility
limiting stuff (like for 32 bit ID registers without AArch32 or
ID_AA64ZFR0_EL1 without SVE) could be moved over too.

TBH when I said in the commit log I was thinking of something more data
driven I was thinking more of having the dependencies expressed as pure
data, more like the way the test in set_id_regs is written.  This also
seems fine to me, the checks are similar.  It's just much more invasive.

--gBzASHaWQ8wEZzsB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPwHQACgkQJNaLcl1U
h9CR5wf/Wuk4OnY8jsShSYGyT/jXaUVL1JmMxLFVq7VJR3Q9U18Q7X7aNQxEBmTB
MblTigPUrxmBmSJnBZO19fUPGo/8rz2WOg6vruuGvjhlPlIy8DtfK5zMFE6wj2LK
tRckwodxThZkNIMri/YbJmkkmJoth7PeE8/uvsWOrfuHqRyyeTgEoeCfAyeBR2HZ
8M43Q/l6H+UUimfx0mmFoN8Ts0jzAQXQy5zlaypa+riXdDQCWJ2/T2DNlqLyIIHS
waGqLdgDNILbAaTUastiy4kw3QT5D/YnZ2iT4CsJP9nfXW9O9GGlVqS8IgXfkMrq
JF/M0vzZDnAfQL9LwvrjqiLcDIK2aA==
=ae8X
-----END PGP SIGNATURE-----

--gBzASHaWQ8wEZzsB--

