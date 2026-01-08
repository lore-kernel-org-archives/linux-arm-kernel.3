Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D11BD1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7HfWoT25ktrEPV9dgonvJMv0oaElQSdVn8MPe7Ct78=; b=lWFy4Q8dM1kui6vVpX3N+1ikrg
	ZqymCleNRpyO0mKUjeAAhgo4ErcPawatvrWYR2okz4j5BD38b9nzMHQEObCmud1fZ4ZnkJM/8ylY7
	4e/64rgsa4k9V03SbV11nhbazu77qJR2okjxStQP6lFR/BEFkHZ+tz53nfeoqPCLhcMhuT6PFL/TL
	vx2tNMv7PQqGM7eNi3Th42jh38eVfHkayMJzYmL58Pr9Tz2PLMFHAdvDyoqH38I1F3m5PCU/LFIMW
	oqd6dMfpPZWimnRYLUt3cCftmnEpzY/l69fofijSYVgmr6CrCi0IvpkfoYQvNSwxo0/QO5IIbkvm1
	4zSBrAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt5x-00000000Beq-163J;
	Thu, 08 Jan 2026 16:42:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt5t-00000000Be6-2nXz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D19154172B;
	Thu,  8 Jan 2026 16:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B89FC116C6;
	Thu,  8 Jan 2026 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767890560;
	bh=2JTt6hDJvWzDTM0dUBCnhSTPgPA0XojNDbovadYlQYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLvKHVYkzB2xrU3XqpRv+2aLl6pb+jRfwARYY9Gxguxdkn8r9y0YSpc9yAOQyawit
	 jBgZ5eOGLampXS8fNTGMK703bEQytzlTq802pMzoQzghCWEe7OXDUYVjBozH3DCnIj
	 vnxYhigbIOOxXNN+2OyB7mlFksiJ3lyfhYBbLCtW3jfHL+uBKYkAP7fVGURjrCVufF
	 Ug3dQE83ZJW7ZZEyzwCBVcURUF8xgKEjqODKKR1ibueNYt2Ydo/9eVTcWi5MVw8wiq
	 V2+DYtzMYtGiZtRJ5NLbsCmxMBVkXZ4A26Z7p9xzeU+H6hdXHZiecp/bHsFvpZElwX
	 LfyfkMgOlasPA==
Date: Thu, 8 Jan 2026 16:42:29 +0000
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
Subject: Re: [PATCH v9 02/30] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <cb6372ea-b7f7-4e87-91b5-09378f2dd526@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org>
 <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
 <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk>
 <CA+EHjTxLkLjPj=1vwDqROXOUXi2LhOQb90WP6dFaTiYG1nWovA@mail.gmail.com>
 <e50b4923-ee45-43de-9d4e-344546c635bb@sirena.org.uk>
 <CA+EHjTybF+aq2b2vhcEqi6U_sJjtt7ngzMZ9UcJ15G-Kqj=A9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IBbOtxmVdG86xy2i"
Content-Disposition: inline
In-Reply-To: <CA+EHjTybF+aq2b2vhcEqi6U_sJjtt7ngzMZ9UcJ15G-Kqj=A9A@mail.gmail.com>
X-Cookie: If you suspect a man, don't employ him.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_084241_725202_A0E39E4C 
X-CRM114-Status: GOOD (  10.21  )
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


--IBbOtxmVdG86xy2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 08, 2026 at 04:19:34PM +0000, Fuad Tabba wrote:

> Would it be worth adding a comment above the macro noting this
> difference from sve_cond_update_zcr_vq()? Something along the lines of
> 'Intentionally overwrites to ensure strict control of enable bits', to
> save future readers from getting confused...

Sure, makes sense.  Possibly also rename it, I'll have a think.

--IBbOtxmVdG86xy2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlf3nQACgkQJNaLcl1U
h9B9Tgf+IN7Byiwu2Z/BASg5BnKyxCB2XaDCnpzYIDqiBTAHcDa4uurE8parsO5u
9gSiFE/fGFAUTL0ApBcB3Q+eZ0CzXPzCri5Ao2rb19bWYj4OnhSmsrBiVvgjWc92
pyUPxBVcXfScjS/eFtDSjiBIjLWbvOjFRRSbc2W/CJzcwBH0Ch6A35vBv5plM4QJ
txTV72D3BnfnQFqt5cNi3UFVg+XpZQQ/i6+ickNqRBJKRy6Q9LKvoYegHabPvt8g
oOo8YpwCAqUYl8dAEFrHLU6t0JMmMnLMzUCBDDKcTwZbZd/zMyd9L8jGbtMMuim6
6FXHMUIcx+PFnhj4HinUO/IJYZX31A==
=FXRp
-----END PGP SIGNATURE-----

--IBbOtxmVdG86xy2i--

