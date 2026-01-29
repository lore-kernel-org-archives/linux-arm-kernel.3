Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F4D6B09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcYhc4E9Y5we1LZNadqpVIred1H/htdcjoFQTrA9p0s=; b=tNENvNx3g99VmeXB0j0duXLdcu
	7YHrc40w6fycJgHRgb+ePBMx2SHi4UqxWMxK3os/qsiDpvGsAaxH1EGtRSBlTdL+PM+VDQN9Uey3s
	hLhv90jzJMV1MKuNtZ5TF47T05sE54HaxFGGWfAvgoE77TV+Lm3ZNVRHrOJqBUUXwTZlz82UyGAUJ
	nFlacdXDYTraibQ9mWyRk0/sRY7rld0b4uRiHchOLjdMqLDXqMXbKUEahjUpSntZ2h5W7CqtlLHco
	O6QvrHl3yj12tVSVKFSxctBxFjAcLJMJke2CoyfLZ9lpDOig4zmxmaNG37SazpHmvXpuG1qRMCsA3
	i/ktJiKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV53-00000000MNh-0OGL;
	Thu, 29 Jan 2026 16:41:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV50-00000000MNE-2Txp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64F6F4414C;
	Thu, 29 Jan 2026 16:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA95C4CEF7;
	Thu, 29 Jan 2026 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704872;
	bh=zcYhc4E9Y5we1LZNadqpVIred1H/htdcjoFQTrA9p0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulEmku+Go6b0WZUKmO2rXfq/EdAAnWU9xDDkJwNvrBGhSH9iaUbXaaxV3lK2hTYqz
	 +F2eVVpguOE6p+qUDt0scevvaS6IL5HqC6Ig6SzquPFM3elZSCDcNiaoIayZ0dCiQN
	 pJ2GdRSuNcO1YoszZ9X8DKHDJa9hZdzZJcFyJbqogsyS3A/tnRAfyF4qh0uE4ioMFr
	 HIWj+xu4nQo3Gjzb/SeSk3Bva4DCXzVyR6yJAz07MqAzeRREZhdGwFuVKWiy6dsAkI
	 UChEsqTzfEwkzN+Yce7zftxRM+0o+pUTGJMFprU9C/c9JfG6nn0v3lUiscPqDY/Qs7
	 pn9TN0yjBkGJg==
Date: Thu, 29 Jan 2026 16:41:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
Message-ID: <76bf33a0-968d-4b99-a157-3eef076af69d@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
 <87343o8jay.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ISN2iHKE8mStxhEz"
Content-Disposition: inline
In-Reply-To: <87343o8jay.fsf@draig.linaro.org>
X-Cookie: You have taken yourself too seriously.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_084114_646716_1258A909 
X-CRM114-Status: GOOD (  12.39  )
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


--ISN2iHKE8mStxhEz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 04:39:33PM +0000, Alex Benn=E9e wrote:
> Mark Brown <broonie@kernel.org> writes:

> > Currently when deciding if we need to save FFR when in streaming mode p=
rior
> > to EFI calls we check if FA64 is supported by the system. Since KVM gue=
st
> > support will mean that FA64 might be enabled and disabled at runtime sw=
itch
> > to checking if traps for FA64 are enabled in SMCR_EL1 instead.

> This is conflicting with the now merged 63de2b3859ba1 (arm64/efi: Remove
> unneeded SVE/SME fallback preserve/store handling) so I think this patch
> can now be dropped?

Yes, this should go away in the next rebase.

--ISN2iHKE8mStxhEz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7jaAACgkQJNaLcl1U
h9DOuwgAhasPmpBc5eULaLz4BwbLAgPXJs1nnK3Uo10v0P6qi43SvtDZav5SiPTZ
ECyUrltHOpSjnbvnEn/i7lOw/lExJCneXkO58pfwuVbCLSdYXjQzCOy1Qau6b0ZA
A9eRgPI2XX+UVJ7+aqYbwrvj1hVab3W7qYM/YL8nNN91Axx1FO3ERpdX9CP/Zxiq
yCW+gCPqV1IeMCGVHV3dU8gZpFm6WXJBokYrFSuoCbKmSQujsYsJba8n1mZORZDf
Y4Af37gikWOQdw+cxZXbsfM9FD5B7OZhxmXFrKp8ZoOSFTUBdTQx1Mb9nKNpL1xE
efmMyBYUlPHYfwuWW7EQyCDOEqk2iQ==
=FKQt
-----END PGP SIGNATURE-----

--ISN2iHKE8mStxhEz--

