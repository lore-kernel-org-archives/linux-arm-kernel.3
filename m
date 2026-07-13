Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD238C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67vC3E8mCRha9hYVm2Kif9yJocvFNOZSlF8fz0bW2T0=; b=MuAR5V8MEr8QsKI2XlUc0pKpod
	eO6mwSMoomnnoEf5CqPuWg5pPBXX7QfRfR5hubsn+pQkAMo8PYLQuVy0XDExiaMq8YFMZda64xwtR
	PaOxX9jIUsnEYiNctq2uEVGvbBc+TI/JW2mJePQHKjJN2Fn7EEBVL8gA2jOF9MkxNJWgPmkI49ngH
	AT53hLZ4Wmwa87OLA84wIGwOosrbFEGMNTmQTZIB+WdLQjN3Uy+gfaF9JvBCpsxcuQ0fworPeHQom
	+gsSjf2wEmDat6DGFaM6wdexjJAeS7IiT4r0wec4qnHfDlo2N75uba9xBXNEHdOCvdUORlKIk9NmP
	2c2aINjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGAL-00000009Fgn-2FS8;
	Mon, 13 Jul 2026 12:53:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGAK-00000009Fgc-1JNt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4E8240B87;
	Mon, 13 Jul 2026 12:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949301F000E9;
	Mon, 13 Jul 2026 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783947223;
	bh=67vC3E8mCRha9hYVm2Kif9yJocvFNOZSlF8fz0bW2T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RQH+fvdUuTn7iqWED4cXgkbpL5b565ibEf3+ckEuPZWQBL/DEvzxtTBPyheXNrD4d
	 AZwGO2Knfc9zJNOzMTQgrrYRaLAN494GiWJ/SPMoTyGZ9Tg8iQjT6y9Hkn5C9TkJsm
	 T84nVgN6fr1H4NqdnrSjhYak/IQwENtNL7uN1RzQ1hjjRhXU40owmbwRCc1T0BjMkQ
	 ydN7KVbJeeuJ+eolkwL4kS5PnId4sOXDLLjC/5M22skK0JUWp4DOTMnI1PPOD1+EjG
	 5ioQsFsS++SqPpCXVk+cD7wghqLhJ2psbuWd5GZfyL2U13Mq4oemSUbU4I9oDyn+0k
	 SiXEplyovH7Ig==
Date: Mon, 13 Jul 2026 13:53:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
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
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 04/29] arm64/sve: Factor virtualizable VL discovery
 out of SVE specific code
Message-ID: <a6275b3d-d32a-4658-ae02-6d7af347b3c7@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-4-d0301d79ef58@kernel.org>
 <CA+EHjTzVLnXu1E3guYVABoxLLE4foTM6j1fdew-phtFrBqJ2Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NySqPGRbhkwbqql5"
Content-Disposition: inline
In-Reply-To: <CA+EHjTzVLnXu1E3guYVABoxLLE4foTM6j1fdew-phtFrBqJ2Fg@mail.gmail.com>
X-Cookie: Courage is grace under pressure.
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


--NySqPGRbhkwbqql5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 12, 2026 at 03:12:31PM +0100, Fuad Tabba wrote:

> nit: this is a reimplementation rather than a straight move, the
> no-virtualisable case returns 0 (and drops the WARN_ON) where
> sve_setup() returned SVE_VQ_MIN. No change for SVE (that case isn't
> architecturally possible), and 0 is correct for the SME case this
> helper now also serves. Might be worth a word in the changelog, since
> "pull ... into a separate function" reads as pure code motion.

That's reasonable, I'll update the changelog.

--NySqPGRbhkwbqql5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU39AACgkQJNaLcl1U
h9Bv8Af/esNQJhQ1vINdTOSWx7oXRYHDQ9JpDR91x/iv9ZbQBhC+p0iJQXu+UHv1
P3S9sApgeTWxnXK3aRduh//PZzX/hVMaimqGmWv0lsaGZgRiE0YUchgqYiAnnRhU
q6xuvn5obacZHXSTTca7zfibwlFUqCPj6axMIYvIAQzWIvKNuWUdpv0JHU/x1WAq
GGKUVhJrTYpFIEYZx18nHFisaImH5GOyLTI4Eug3A3gi514G4frwvVN/1i62szTD
5N+xYmXfbNiuwfSWlKYj+wn66vI8LxZh7abrF/vQeSGEhYmmpaGxsRbqd8St65wv
Jc0e8hG53Lv9IuTXclPHyyA7Ui+agA==
=2Dqq
-----END PGP SIGNATURE-----

--NySqPGRbhkwbqql5--

