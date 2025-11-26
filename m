Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1BCD11192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VPWyCxBzO0chJShDOsFADsryyV48wGAcYEMq+n5kGA=; b=aem/6yNNdJzhTA0OOFZ4PD9oW7
	nItug1pM88ClHNLveXfcsxSYDUtHGT5hp8IBtxvru3gNekuOGbgNiS1aQrwkjqFwGdPSe92YsS0+F
	/qq084EW5Akezo0XAifV6tN14n8TVjMuEHdlRuNqBRlxGJSYvru81RkuJ7MMoRcTcu8gHNumRxEb0
	zl/h4UKpaxa1oO7Tbq9/c/I31O7qjvB93HcfhOwgz2mscl0HeQNxoYengECKwsMFujGRJ2lhRM3WK
	xMuD5RkOuzA2+/0FfoLQz32VdzgDjbcgIaa9/5LIzn17oYgZ3uxEtlShUURPf5WuhluoyBhHXRKRZ
	A9vX91+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKSb-0000000FVcZ-2vU4;
	Wed, 26 Nov 2025 18:41:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKSZ-0000000FVcD-2GNR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08CA040746;
	Wed, 26 Nov 2025 18:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C166C4CEF8;
	Wed, 26 Nov 2025 18:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764182505;
	bh=OrhxCJrCTAVZNlhdhhsJnvnRtmy8sEmyPzUtcg6Xrw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1zPS+LKUaXXpTefzHkDWvnRO47r2FZ8n+VfyP6uAEXavpdrJ98W4D0ey5rqVQL2b
	 2kszPt8wjH6Ol4z2gl2D2DiQqTajn79gCa1MzviSWJxj5+/jQSZ60fxptQztxSz4ET
	 0HLdIhBY0PA+USuTNyivVs32an/VfAP7QFm7y7VP8+dChFC+NeQeoG1P85OAM5DzTj
	 In1e6YUqNJMlhUEt7m8V9Eoju6QjA8OsR/ejIs9jV/Ln7jBXGWFasGxxH3EO0NwkTG
	 0ApqTvKMaPdShngMRvVSRoUfN7cZ1eJ/DaeAITctDy82/41WBm3INKD5BK9nHKMHjg
	 PUS+LdeMvdfuQ==
Date: Wed, 26 Nov 2025 18:41:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v8 11/29] KVM: arm64: Document the KVM ABI for SME
Message-ID: <8d27e309-15d7-47de-b51a-9f0e0bfa4766@sirena.org.uk>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
 <20250902-kvm-arm64-sme-v8-11-2cb2199c656c@kernel.org>
 <CAFEAcA_GJ7gzn7aMCZYxHnJWvx4tHSHBKsOxtQ7NTb4gPjkMJQ@mail.gmail.com>
 <df712591-397e-422b-b9c9-fbf080cad9aa@sirena.org.uk>
 <aScfSMZEKCeUq7Zn@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qeptf6kasDv7BEH7"
Content-Disposition: inline
In-Reply-To: <aScfSMZEKCeUq7Zn@e133380.arm.com>
X-Cookie: Murphy was an optimist.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_104147_628382_3169B8A1 
X-CRM114-Status: GOOD (  48.11  )
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


--qeptf6kasDv7BEH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 05:23:47PM +0000, Dave Martin wrote:
> On Mon, Nov 24, 2025 at 08:12:56PM +0000, Mark Brown wrote:
> > On Mon, Nov 24, 2025 at 03:48:06PM +0000, Peter Maydell wrote:

> > > >  .. [1] These encodings are not accepted for SVE-enabled vcpus.  See
> > > > -       :ref:`KVM_ARM_VCPU_INIT`.
> > > > +       :ref:`KVM_ARM_VCPU_INIT`.  They are also not accepted when =
SME is
> > > > +       enabled without SVE and the vcpu is in streaming mode.

> > > Does this mean that on an SME-no-SVE VM the VMM needs to know
> > > if the vcpu is currently in streaming mode or not to determine
> > > whether to read the FP registers as fp_regs or sve regs? That
> > > seems unpleasant -- I was expecting this to be strictly a
> > > matter of how the VM was configured (as it is with SVE).

> > Yes, it does.

> Is the above condition right re streaming mode?  The original reason
> for this restriction was that the SVE Z-regs and FPSIMD V-regs are
> aliases when SVE is present.  To avoid having to worry about how to
> order register accesses and/or paste parts of them together, we went
> down the road of banishing encodings that alias a subset of the
> register state accessed by some other encoding.

I queried the issue with requiring that writes to the registers be done
in a specific order - we apparently have some other examples of this
already (I would need to go and check which specifically) so that was
seen as OK.

> In line with this principle, with SME Vn and Zn are aliases when
> *not* in streaming mode, so allowing access through the Vn view feels
> problematic too?  (And when in streaming mode, the Vn regs don't exist
> at all.)

The ABI proposed here is that the V registers will only be available
with a VM that lacks SVE, you'll never have them both simultaneously but
rather which is available at any given moment will vary on a SME without
SVE VM.  This obviously has complications, but aliasing is not one of
them.

Another option would be to represent the V registers as 128 bit Z
registers, giving you something similar to how they'd appear on a VM
with both SVE and SME for a SME only VM.

> Whether the proposed ABI is considered awkward for VMMs or not is a
> separate matter...)

Indeed.

> > > > +       max_vq.  This is the maximum vector length currently availa=
ble to
> > > > +       the guest on this vcpu, and determines which register slice=
s are
> > > > +       visible through this ioctl interface.
> >=20
> > > > +       If SME is supported then the max_vq used for the Z and P re=
gisters
> > > > +       while SVCR.SM is 1 this vector length will be the maximum S=
ME
> > > > +       vector length available for the guest, otherwise it will be=
 the
> > > > +       maximum SVE vector length available.

> The max_vq name here is not ABI; it's just linking concepts together in
> the documentation text.

> So, can we give explicitly different names to these two max_vq values?

We could call them sve_max_vq and sme_max_vq?

> Splitting the affected register descriptions into "SVCR.SM =3D=3D 0" and
> "SVCR.SM =3D=3D 1" cases also be helpful to make this special-casing clea=
r.

Possibly I'm looking at the wrong thing here but the overall text for
describing the vector registers is relatively long so I worry that it'd
be harder for readers to play spot the difference if there was
duplication.  I figured explicitly calling out the differences would be
clearer and less error prone in terms of any future updates.

> > This is attempting to say that the VL for the Z and P registers (and
> > FFR) will vary depending on if the vCPU is in streaming mode or not if
> > the maximum VL for SVE and SME differs, similarly to how the Z, P and
> > FFR registers disappear when we are not in streaming mode in a SME only
> > system.

> May flipping SVCR.SM through KVM_SET_ONE_REG have the architectural
> effect of zeroing the vector regs?  That feels like something that
> should be stated explicitly.

Yes, it should zero them - I'll find some place/way to add that.

> I'd agree that this mutating interface feels odd, and does not follow
> the original spirit of the design here.

> But the SME architecture doesn't fit well with the spirit of the
> original KVM ABI here either, so I guess there won't be a perfect
> solution.

Something's going to be awkward somewhere.

> It seems that when SME is enabled in the vCPU features and the VMM is
> planning to dump or set affected registers, there is a requirement to
> dump / set SVCR.SM first, and then go down one of two code paths.  Can
> this be called out explicitly?  This is a departure from the the
> previous interaction model, so it probably deserves its own section,
> which can then be cross-referenced from individual reg
> descriptions.

> SVCR.SM exhibits this modality w.r.t a specific set of affected
> register encodings; it would be good to have that captured clearly in
> one place.

As I said above my understanding is that this is not actually a
departure from the current stituation, this not being noticed probably
highlights why it'd be good to improve the documentation here!  I think
grouping all behaviours like this together would be good from a
usability point of view.  I don't know how much of that that fits
directly in the ABI document or in a separate "here's some gotchas" type
document, things are already getting a bit difficult to manage.
Possibly both.

--qeptf6kasDv7BEH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmknSeIACgkQJNaLcl1U
h9Docgf/cPhrqw0FDee6DcZOryTwO1VKQ+JqiWC1SI9SblwgQ/XgIeIYAQSjWrPM
0pvT2htq6pm7QwQc0l0eX4Np6yo/OSjiCrjuCkJF1QHevk3sdguC+hCjaabkfDBm
LbPLGdx3q7k6E4zza+kXg6inA0+D3T/fvLnFvvrDgnu7V3FmHlRCoIvinIpOeWZR
7qZ+rZdUBKnljxQXBbbx3NPx5//xeYHlzxXLXwJU2CzCCSOSqKGIpuM0nLVaaoZS
4sCzTBvU112uGizcjZGRruKfZ59Mp+xQKUrxnFb2HaO8udriyait0aMv7s08Xw/V
z3/GvVCRxxcUSHXSYIwmWQPJeVqv4w==
=dEOw
-----END PGP SIGNATURE-----

--qeptf6kasDv7BEH7--

