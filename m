Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A79D39007
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YqLcDUBhj5cvhZctljvRbYDU95X0fUKP2VskMmCm0Q=; b=rmNyohSreT5G/4LRO+q7kFDyH3
	nk8j/wm2qq+wSJ6Jt+J8DJG7kt92WW6UPMGPnaYNSav0IK2reygx3kSP/7j0BRWft3cxahvEiF2Ad
	CQJOU1nestBfhpPAAqYN/0ru4+wJ4nCZC5Uzqa5iIlgrmrqf4r/2rCgKXNhts2ECI1bMKlZp/A8Ou
	8whvKAGMGcWGNztoGZwk/WzLw8kJexFyCGjWRN1jFBO/H6WY+exH5zb15xZmEmZhn2f9wmLBa3ye4
	Nb3YyTNiqou5tXf0UeULSCk2Oo56ZL9ZFRAskDJre4hj57Q2TQ3qQl11YHSxXd27Szmo72Q4BDvO3
	JXT8kyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5VV-0000000AJ7Z-47Ig;
	Wed, 14 Jan 2026 18:22:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5VV-0000000AJ7I-0bjn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:22:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DFAF6001A;
	Wed, 14 Jan 2026 18:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6A5C19421;
	Wed, 14 Jan 2026 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414931;
	bh=tcknC6iemaw7J5r4is+1RFQMsTj8mbkEYsrSA6D6Saw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnv936PwAOYqla2o5RLnSGyPnWK7eepNYoigSv3xXJ9tqfUVL17uGzncwmmSr8jmA
	 fh4eTYbjwkRZaR/lWB4BeQFZeI321YENVp8PuJFL27WkKn6hGS7oxQ3cluEXsJKnUf
	 e+CWfzWOQOHbIi1FxuPUJvknfYFlCBcidWhMHmmDTsRmlcrzYEpjBMYMaEoTVksV3U
	 fApWuGawlIvleBifk6rYfDE4Q+QM7Y/6v3afg+uN1IThtpoL1Pr8o8yr+UBntNCr1j
	 6RfbmLF9dPh2zIAHhUCaPHd+V49mgU2eFN3GXxpC4hWgyf7Rz4pazXUXqAZC71JL5u
	 nbaDt7DOD7v/Q==
Date: Wed, 14 Jan 2026 18:22:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 25/30] KVM: arm64: Expose SME to nested guests
Message-ID: <2498896a-78cb-4184-82ac-6497b1e9bd03@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-25-8be3867cb883@kernel.org>
 <CA+EHjTwZCcMFT6gAM2oaQz5V_vqEBmVuggFBbABbXPvC+U919Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GsOJE4+Rwb8rI0F1"
Content-Disposition: inline
In-Reply-To: <CA+EHjTwZCcMFT6gAM2oaQz5V_vqEBmVuggFBbABbXPvC+U919Q@mail.gmail.com>
X-Cookie: Absence makes the heart grow frantic.
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


--GsOJE4+Rwb8rI0F1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 02:37:57PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:

> >         case SYS_ID_AA64PFR1_EL1:
> > -               /* Only support BTI, SSBS, CSV2_frac */
> > +               /* Only support BTI, SME, SSBS, CSV2_frac */
> >                 val &= ~(ID_AA64PFR1_EL1_PFAR           |
> >                          ID_AA64PFR1_EL1_MTEX           |
> >                          ID_AA64PFR1_EL1_THE            |
> >                          ID_AA64PFR1_EL1_GCS            |
> >                          ID_AA64PFR1_EL1_MTE_frac       |
> >                          ID_AA64PFR1_EL1_NMI            |
> > -                        ID_AA64PFR1_EL1_SME            |

> Should we also limit this to SME2, i.e.

> + val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64PFR1_EL1, SME, SME2);

> That said, we don't do anything similar to SVE, but it might also be
> worth doing that there.

This feels like a general approach issue with these registers that's out
of scope for this series, it's not just the vector extensions which
could introduce new state or anything else that requires explicit
support.  AIUI the theory here is that we bootstrap from the host's
sanitised registers so the time to add any required limits on future
values would be when enabling them for the host kernel, assuming KVM
support isn't added simultaneously.

--GsOJE4+Rwb8rI0F1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmln3swACgkQJNaLcl1U
h9D5Awf+IRsqdR9I7nYCFQPlwzCHBQBbuNnWwG5/UXXDqIc3+6wyvcIQNcpbea0/
TQLaQPJEdkXSt9dQkg0iKdV3YBSDo8IW8JMvqDcgNueXpfuJdIPFDerneL0HTO/l
/80XNxIjRpwrR71w+bFdSGWj6TpDcgtNYQj4z1wT6wRQ3VoQxnRsNiZoxObmnM8A
t1DLEPg1EigeOwvBt12Q6yOVBiAM+lAF04JU7Kq28s3Nho38aMBGrMkiz9zLY/bv
Lk+KVaDLIh5KmecygdX5rm/EEyT96tV/fj+NXrctDs2+/ktqa2JYtF2PpuQuNXZx
6dDmflaX69rqabPcKmADbMedkpxJRA==
=kw66
-----END PGP SIGNATURE-----

--GsOJE4+Rwb8rI0F1--

