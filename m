Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF52C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 00:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83/QFKPUAecuur3XiUDSCrCipZXjd2KIGyHaxlFSSCE=; b=2MspP8bE8tczAnLTZZtuhoRr/+
	b/bZtco+nno4lOpC1zyYRkaHIvmKiYaMFEXnQopeIrNqDawwM58j5VwUX6nRPOV4+MysINVGdrGDc
	QQ08oF0H94vKSXOqkJ0/dWK8luU2tJDXYkrjqbwsXDjs1KiIAqLJhhY4U+tBp30H2q6DzE1qy3xzF
	AW915ACEaOi3G+Uot0dKfqa1PFOgMD+QBztB1qLMNw2wjSVYcGODc5IxvXrVBP4mULN4xpX4B3bg9
	qX5hy03VMoN6WqqJQhC9kxcq9CipeXI5pKB1YVy4t/dUY9QYGVqAV8SvkEjr0Yh8OCER2Dt6CLBQL
	QQfdXhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkt1d-00000003SQc-2Bxa;
	Sat, 18 Jul 2026 00:35:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkt1c-00000003SQV-2yfd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 00:35:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0494943599;
	Sat, 18 Jul 2026 00:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4571F000E9;
	Sat, 18 Jul 2026 00:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334927;
	bh=83/QFKPUAecuur3XiUDSCrCipZXjd2KIGyHaxlFSSCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UZMqhG7jOCM0NcG8H7yxHekee//rMmL/U7Ry2BrLImm6unJIexmYIklkgmaYx2kJc
	 w0QAzde1FMPP7tZgjagzsxmyGTzvWe+VetYaC6HyrUjg4v+PbZo1VN7Q8KWkcEo19T
	 3EX+dn0yks9KVfhECXAzeEyN/luAsqwLZ2nH/c1kLeZxzu2Q27VxKzyUlYgTME67FT
	 eIIkaE72/6x6u+8QvFPawI8tcNgDH3IBoD5VJYpu4gG8qoCTUHjV7m/6qrkXWvRkea
	 vjYcsAWsbreVTHJrKt36aQ67Ts+zrieyLSdwkax7w8Vcuwbb7uH6ZPG5/tRr5i6KHP
	 YHwLOVzyyTdgg==
Date: Sat, 18 Jul 2026 01:35:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 02/29] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <3c76650f-ddda-47ae-a676-86016d8e39a6@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org>
 <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
 <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B1L8qt03Fu74vlzF"
Content-Disposition: inline
In-Reply-To: <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk>
X-Cookie: Thufir's a Harkonnen now.
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


--B1L8qt03Fu74vlzF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 04:28:02PM +0100, Mark Brown wrote:
> On Thu, Jul 16, 2026 at 11:52:36AM +0100, Mark Rutland wrote:

> > >  		if (test_thread_flag(TIF_SME)) {
> > > -			unsigned long vq = sve_vq_from_vl(sme_vl);
> > > -			sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
> > > +			sysreg_cond_update_s(SYS_SMCR_EL1, task_smcr(current));
> > > +			isb();
> > >  		}

> > What's the ISB for? That mysteriously appeared in v11 without
> > explanation. It wasn't in the original code, prior versions of the
> > series, or my suggested rework with the task_smcr() helper.

> > I don't believe it's necessary to add an ISB here.

> I can't remember or figure it out, I'll delete.

Actually I remembered: while SCMR_EL1.LEN is self synchronising the
"without the need for explict synchronization" wording is not present
for SMCR_EL1.{FA64,EZT0} and this is no longer explicitly just an update
of LEN.  It's possible I'm being overly paranoid here, I'll leave the
isb() and add a comment for the next version.

--B1L8qt03Fu74vlzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaykgACgkQJNaLcl1U
h9DjvAf+Mo2V+vK8ka9ifnzNbT6e4l1B8v1nwzBzZqNOsHRBkYVA+3HzxPfa42iQ
wBsUd5GDNYhvYnfigzrrCBiqP6iEXL2auvhxC05ZD/FMYpMpjg6l8a5YbyFZrCaI
VCnHsZDwaYx0qDsmnOUgwi/AvliSoRdtky5XTuT5aJLAPePiiXhE3f3ltNCQqynG
VzaW9xKH0Tng2mJ8kiajrNPlzKMChuJdcebmYosYMMiYFLiHjnE2FDyBqAf7A0It
jjU1d99NHubQeKLYc+3Io4KDKVRAafjVK2BfVWpOhGPufaC/a+HxGr2ZkU250Q1q
8YjIq/ZvP2kx3EodKw5prhfkTiaubw==
=Oojd
-----END PGP SIGNATURE-----

--B1L8qt03Fu74vlzF--

