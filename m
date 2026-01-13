Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398D7D2F33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8w2K0UsTdM8SRo8wTn6tzf393P+luV8jqbXWOBkmNw=; b=jFbdW6dEHu5tyoaWOOsos198xo
	LB/UwA4Zo1Xip6JQNWc4sCDz26G+wgj0GRSaaX/qph10l6KfYNTNt4txTt+7tu15GE0qL53Mh6mXL
	Gd6Vr3NiuMfIWQ4/tOJKOhBcGQADUvYiPPB+LqMTws3GGDHOen3fkja2d21NGQ4a5GHKzZ/Cs4qO9
	RO+M2lEUo51yoqohCyeYyd3lRtQnws2Ab8idFrkReCe67iWRwzj2AyuHNSZdR8hKXSwQfW8X74rfC
	WafT99hQsgJlLZgvT3w0pvrZHk6blkSfVR0MFGD8zlth4F/u/CxwNb4PmyWSMe3czauEOWCtcoSqp
	FjGzg/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgz0-00000007RgB-0bs7;
	Tue, 13 Jan 2026 16:11:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgyz-00000007RfY-0I7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 16:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0757260051;
	Tue, 13 Jan 2026 16:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AD7C19421;
	Tue, 13 Jan 2026 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768320659;
	bh=/dUbmRww4cHamievMVwgGH9rnRn2MYlwRxvkGfxfk3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTYaz+xnWdrALVx1BxBiXwa4OzIIiSKaxfrsMgztr6B2NHaC5uRTXhbCNgeYFt1ja
	 Y6/6pz2GQxm0hdFh+EZxaxm07rnaR7QRgTgR+sauZ7aIDQwajWWl0AHiDOnl/tA2V6
	 IXi6u4n/5DURYfljzI0irevQo1TOGgt7Xqr6tJR2VwSjFKMngL+lD5Fe3Wf5KzJian
	 PjrFomT3c4G9FvTrJWnHC/fjXTWC/fEafQ2Bo20mk0+lT5MBJR4dP0PiZd92EPFBGF
	 Nk5/XtaUrV5ZgbgHJyF06xjCQ7vVFjxwNb+khJ+nFU8OkesI61zj6SgvMdw9NuQpJB
	 oGNltgC6Vxw7g==
Date: Tue, 13 Jan 2026 16:10:53 +0000
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
Subject: Re: [PATCH v9 00/30] KVM: arm64: Implement support for SME
Message-ID: <30488f61-3233-4cf3-995d-717436de60f6@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <CA+EHjTxOKDZ+gc9Ru=HpcRb8O-AvRm9UJaWM1fZeoqSz0bLK=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbkFj6fysNdPk5Ht"
Content-Disposition: inline
In-Reply-To: <CA+EHjTxOKDZ+gc9Ru=HpcRb8O-AvRm9UJaWM1fZeoqSz0bLK=g@mail.gmail.com>
X-Cookie: All models over 18 years of age.
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


--cbkFj6fysNdPk5Ht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 02:58:37PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:

> > Changing the value of SVCR.SM will result in the contents of
> > the Z, P and FFR registers being reset to 0.  When restoring the
> > values of these registers for a VM with SME support it is
> > important that SVCR.SM be configured first.

> However, the order returned by kvm_arm_copy_reg_indices() is core,
> sve, fw, then system. So this means that the VMM will need to hardcode
> this order, rather than rely on KVM_GET_REG_LIST. It _is_ documented,
> but it is tricky and it's easy to miss.

> Looking at copy_sve_reg_indices(), there's a special case for
> KVM_REG_ARM64_SVE_VLS, which forces it to appear before the other SVE
> registers. So I wonder if we need to do something at the level of
> kvm_arm_copy_reg_indices(), or do some sort of post-processing to the
> list, to avoid this problem.

That makes sense.  The whole ordering dependency thing is obviously a
landmine so if we can do something to make it more likely that things
will go right then that seems helpful.

> >  - The userspace ABI, in particular:
> >   - The vector length used for the SVE registers, access to the SVE
> >     registers and access to ZA and (if available) ZT0 depending on
> >     the current state of PSTATE.{SM,ZA}.

> One issue I see here, from a VMM's perspective, is that the amount of
> data transferred via KVM_GET_ONE_REG/KVM_SET_ONE_REG depends on the
> guest's current architectural mode. So now the VMM needs to first
> figure out what that is, before being able to SET/GET when
> saving/restoring a VM state.

> Before this series, SVE just assumed a maximum amount of data and
> zero-pad the rest. SME state is bigger, but in practice, do we expect
> many cases where the VL sizes between modes would be drastically
> different that it would make a difference in terms of storage?

I would expect it to be very common for the forseeable future that the
SME vector length will be several times that for SVE with no overlap.

> Other than that, I think the asymmetry of VLs might be a painpoint for
> users. The problem is that there is no guarantee that the set of
> vector lengths supported for SME match or the set supported for SVE.
> But I wonder if there's something we can do to help. Maybe a discovery
> IOCTL that returns the entire matrix of supported configurations (SVE
> VLs, SME VLs, and their intersection) to simplify VMM decision-making?

I'm thinking such discovery might be better assisted with a userspace
library, as well as KVM VMMs it's also an issue for things like
debuggers and trying to design something nice that's also an ioctl()
feels a lot harder to get right.

--cbkFj6fysNdPk5Ht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlmbowACgkQJNaLcl1U
h9BXxgf/Re82kuN/C9D1N1jAvlefDx4tWyo4Yej5K2x+aab7UB8c1wIAHsQZZn+y
q7tQCcfBt9JS2ZO5KODPc42OkcUMlSGfsNCOU0nQMJiDBO2SWwNjqFwxlGObU5Al
nVBHLBX3DVeh9nZ0f5otYXTMFyXLYldhRUYCIMPGuV/B4rKCceh4VNXtV8jIzCj2
J22qiEjUCGsi90zxMYPO7ajbhtzOIWDNifx5n/Mrxk1uDROqRVSNPWW98cK/wmW2
F+bue7qvlbeI7sOmYWPqNTcu+pMKBHtKsbvQsrf9ZUCKQ10da2Z6CVk5OJbccJyG
gPk7wK+qCqB4amr6IlNKqK1tjgwriQ==
=6Ghr
-----END PGP SIGNATURE-----

--cbkFj6fysNdPk5Ht--

