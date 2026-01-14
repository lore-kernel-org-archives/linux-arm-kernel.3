Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FDD38FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRZjQ1dMGsBxeFPWfiu+bZPHAYMAVWmC/3j5u54zOEY=; b=XSCEJHf8zBQcN6z2IfqqmG740l
	aSTxl2q3okaCw29cRpEBo1YOeId/PZofXlW5Dkexkw0q94zD4OX0kJa3FPAkYrEPKn4VqG2PtF5wt
	cRhl631yyYYVy1zS8reKobPVABnWwhXZNxmxYCyrwzkvsYdia2cnbDHa3STJ9SZDMX65JRcCZ0TMF
	924L6bT3g3LxUfnfb2U0QY0K7ViQUDn9A8ITt1erUh8eaqjDp7RXkACMlQbpBw69ij4GQ+0t4jSLw
	LfdvgzWdleb/LiFlEQNo+w/Fclv9uCPEgUAVRCSmMTHu7g6ZL+YsFkYr/gwne6F8oAqPhoQovs/SF
	zB5dSgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4f3-0000000A8L2-245M;
	Wed, 14 Jan 2026 17:28:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4f2-0000000A8Ko-3EBu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D95B16001A;
	Wed, 14 Jan 2026 17:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D171AC4CEF7;
	Wed, 14 Jan 2026 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768411679;
	bh=MKErPubq+4dytiNTQQKxbBYuZq0PRZbULHtHlGPOA9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPNzAUNVJjw7ci4jNIO2uMrDaRZ+xEVkHOjM5IQaB+UAc/c442sRxq+JFqShLlNHu
	 XfqXYF3w43bN21mG+uwwl5Iy8UmeqdAF6OK+8BA3dJRHuc3qxpeZ7sISIDpad07B+b
	 jv0O9lGX3cAw6lWQMYieUSLvbvMcZ62jwgH84qc3c3mRz2fGAgBep8rPfPeqZAy0jo
	 2dfXmVozyUzfknjXc8Ivt7BoXalm2KIXNSEnqIHuiqB0zUpwqgkgpaDN17ovsedGUq
	 yYEBZ8Lc+y9wmjLpRmdkKVnH4HYJqOsm4rroiYmT2UWZVGLhiIVe2pKwFyE4zUS7iv
	 BdEdk1L1lKyHw==
Date: Wed, 14 Jan 2026 17:27:53 +0000
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
Subject: Re: [PATCH v9 23/30] KVM: arm64: Context switch SME state for guests
Message-ID: <5a053bb6-5052-4664-b0cb-f05d56d4679d@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-23-8be3867cb883@kernel.org>
 <CA+EHjTyYcrWwBR0AwwdWFfOSwbmTMOhSee7y_-vrMfOxphrvqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5VzuVXkE42Zf47rW"
Content-Disposition: inline
In-Reply-To: <CA+EHjTyYcrWwBR0AwwdWFfOSwbmTMOhSee7y_-vrMfOxphrvqw@mail.gmail.com>
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


--5VzuVXkE42Zf47rW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 02:24:56PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:

> > +#define sme_cond_update_smcr_vq(val, reg)                      \
> > +       do {                                                    \
> > +               u64 __smcr = read_sysreg_s((reg));              \
> > +               u64 __new = __smcr & ~SMCR_ELx_LEN_MASK;        \
> > +               __new |= (val) & SMCR_ELx_LEN_MASK;             \

> Similar to what I pointed out in patch 15 [1], I think you need to
> preserve the other bits, since SMCR isn't just about the length.

This does preserve the existing bits?  It reads SMCR, masks out and then
replaces the length.

--5VzuVXkE42Zf47rW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmln0hgACgkQJNaLcl1U
h9BMEAf/RF9rOJl8ekbOzDRQR11JDX39xOnp1XjKNL/LwADVFknoshEFGbwNHbg7
57daW1rnmcC+bbYUI884dlgzpo1QO8eu4Ln3iZDbBO3RiskXsxPq0/Aw9YPMpukh
389uJu/fYy9Ag03Cgwp1Gcp7bMqs3eDrjnW6q4Rdaqc6tzECGGKLYT25uZjD9qdu
n5jJy4QwQfmTpm1eH93FgHCkiW5PHP8wUv+dYDQ02i/Bg1ZOuiOeiof+YcAfZoxn
okZ9Seieeb/x/OD9CYTtepifFAelR40y3pF8VLhESbkMzGiy7v6SmiCWhPvFhNkF
uyOxnmGui2Xy46sOprB2XcG91p5l5g==
=e2HB
-----END PGP SIGNATURE-----

--5VzuVXkE42Zf47rW--

