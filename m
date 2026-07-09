Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8kqjUvW4uoDK1/F36IchB4nsoc7z+3Xsi7IlngIQAA=; b=kTsFdyioFOIiuAy3ReeHNxJQPT
	wSrfARByOaBEc5eFc2ntq37IO7MJqjgTwEdUAbXSe81uAQHIo6E/v7vQeZnheobmVLGbvgbrdSrdt
	NLUgKYO6qTRhKzi6gQhYscd6sJeQ9jpBzzCP+WPj9FsHLZAscY1dCEmU0ovxxqnf4ivn3Sy0eTR2w
	uUpxzoYu2amrxs0ycGQESvS9S5l06k5JwUFe5Fs46C6Ti+qs/8k0kBWiHTCLStVruKY0g7NLOBel4
	1MV2xCVq98lTL4VVdxHSieIzn+sMQH5lVM/BfgWd/7umJD2aTLqKy07LTK51ve4BYMREjc/VKTzK9
	y15dyLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn3I-00000002Ds0-35qM;
	Thu, 09 Jul 2026 11:36:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn3H-00000002Drf-1NaO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:36:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B304600C3;
	Thu,  9 Jul 2026 11:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F96B1F00A3A;
	Thu,  9 Jul 2026 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596982;
	bh=U8kqjUvW4uoDK1/F36IchB4nsoc7z+3Xsi7IlngIQAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kh7SD9AJfxKGWnaL668g2yVHds3VxPUHmbadri6DA6nvT1HEAKg3INmtGoDrS3uZG
	 0+bS2Duy3EG8Fe/hLKAWHFS1MoAOdlmEnNjjX4P267iK9gEtdZDl7jliet+1iZK4Iz
	 ntjxv4gMRv7XaiYO/4GKvZKxuCRwQOdtIKIEL5CFkkZleHj+2sTIMuA9TDtb6S1uqp
	 EJdgqX3gunp1DqYJsxbFGnwcJ+OipXK768VPDMEDE32KlhRHHJ+3nEZ9HNY7qtduK9
	 lDynLuc8QvqEssqmCIgiysqzJS+rDZ03fHa17v9A+SlPriDZ6sFXGozW1vT5ark5NL
	 5asjUeDov4ajw==
Date: Thu, 9 Jul 2026 12:36:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>,
	Roman Gushchin <roman.gushchin@linux.dev>, tools@kernel.org
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
Message-ID: <4b2fb0ef-4d3e-4a1f-8d33-177bb4af2005@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
 <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xXD2CewWwbORdhWs"
Content-Disposition: inline
In-Reply-To: <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
X-Cookie: MS-DOS must die!
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


--xXD2CewWwbORdhWs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 11:26:41AM +0100, Fuad Tabba wrote:
> > base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37

> I think this SHA is local to your tree. I can't locate it, and neither
> could Sashiko [1, 2]. For a series this big and complex, it would be
> good to get Sashiko to review it. Could you please fix that?

That is the v7.2-rc2 tag, copying in Konstantin since this probably
wants fixing in b4 and Roman for sashiko since this might bite others.
I told b4 the code was based on v7.2-rc2 (which it is) by specifiying it
as "v7.2-rc2" in --edit-deps and it's translated that into the git
object hash for the tag and dropped that in there rather than the hash
of the commit that was signed.

Probably if b4 is going to resolve deps into hashes it should make sure
to resolve them into a commit object in case users aren't pulling tags
(which I'm guessing is what's affected both Sashiko and you here).
Either that or just keep the text (which would make it more obvious
what's happened but doesn't actually fix anything if it's automation
that's impacted).

Unless someone objects I'll resend with the dependency specified as the
commit object for Sashiko's benefit :/

FWIW:

$ git show 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37=20
tag v7.2-rc2
Tagger: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jul 5 14:44:06 2026 -1000

Linux 7.2-rc2
-----BEGIN PGP SIGNATURE-----

iQFSBAABCgA8FiEEq68RxlopcLEwq+PEeb4+QwBBGIYFAmpK+lYeHHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnAAoJEHm+PkMAQRiGsv8H/Rn7Hr3Hp8t6au8B
xQueZThJWjqQ4v8pyLnXF6OomKiDR24OTXMCrFgDkcmZ7RK2ALqowI3tQVwLUTuI
yUN0qL2z2y+LyTcO0CYf3Lple8KlgLAXYMsv7pGLsOvhS7BW2jW97/bcbpUNxoHb
eghxqbIEnyRImUbbyg+nW7VVk65RKdPUNkBPXfQ2NMVwe+SDE5Rl+NXNVqDNjGad
soDTUBrD9yXkWX+4s0myleE62UzzH5nYgGPQeQgYmzWgq7LybH6WBlbQK9D7ODJR
Cw3LCq1hwZZ2w04Yx+XwMHquGJYHW8L2pj77h95uhzksz8buKnM0AGwBCTC6RMoi
AyUQvdc=3D
=3DJUWl
-----END PGP SIGNATURE-----

commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda=20
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jul 5 14:44:06 2026 -1000

    Linux 7.2-rc2

diff --git a/Makefile b/Makefile
index b9c5792c79e0..b4035d3cef26 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION =3D 7
 PATCHLEVEL =3D 2
 SUBLEVEL =3D 0
-EXTRAVERSION =3D -rc1
+EXTRAVERSION =3D -rc2
 NAME =3D Baby Opossum Posse
=20
 # *DOCUMENTATION*

--xXD2CewWwbORdhWs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPh64ACgkQJNaLcl1U
h9C1Wwf/UT/h3LJlUaPMvXwgEDzODT9p1bkNG4mvuCnR+0OqxswhBk5Izdznt3QR
/OfTcvf6+B3c3DAy1KtIPN7oyva2qvRyTL37aLRGt1jNybf4SW716qkCMTAvQGez
XrEICAKRVpw8/wj39nxPmbHwnx/OTFeGQUnakOoHiG4Ujh3Lb5cR9NXdBXxRi489
yq/wuVvxR4GnsX6fpJDIEEB109AYhiyX121wC/tlmozkjZqQOh4KJFL9WRYfjVPn
egfvJBOXvr8JRypwpdxTN7EXBDadmzEqSz5kVerbpGFDdN3Oxj7Q9HkX/ZaJqN+5
68n9512IoFxOucBJvACLfazMW2rkWw==
=EeUH
-----END PGP SIGNATURE-----

--xXD2CewWwbORdhWs--

