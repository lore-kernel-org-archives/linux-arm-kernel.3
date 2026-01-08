Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5054AD1D47D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATux80J8Ny+n16jjoym3ITCaMCjEXn3NTCg6Mdz0asY=; b=XlVGUB9ByUm0/YrEZmolJ+yr3t
	Q599hjED6urV6anNjVLMZsCvSrsvfdOgeD0B7Mwuh/xq1KCSOqh1Avk4424vbP5zjcjJer+L2eVXz
	uzUGaS1ltC4IEtGPCk+0+pwIu9wPW2spKlcl2MHi08l+5YE46T2F736nVTkc/0ZKqRz5UqhbAy+aT
	bJKigyuKZYnae69+HSa5s8xmsKkjpZ1no9pOPOXD9LkLOakDh+9c5FryZ5nVxOE+W8TGgAPmbukdy
	ZM4sM0CC1eqTf+jTzapY6X/me6/ZvAvmcgBUN/vq2ssn/0CApWGLhOzLyQjctROOhM5jWjDM1InNv
	d7SN3snA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsOH-000000000rj-1cuW;
	Thu, 08 Jan 2026 15:57:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsOG-000000000rI-3ey2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52CB060132;
	Thu,  8 Jan 2026 15:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3F9C116C6;
	Thu,  8 Jan 2026 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767887856;
	bh=iQ8rrKAjkcgXBG7XLBNg/l9mT/9ufxiMSqzt1QWzGdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVqoIYbJP02PJTKnx446NUd3M2a4Ep19Dg9tIX7oreQpKKsd0WMGyTFUJ1sDhiXWY
	 0KtS2dh6VfgyUiSD3OiTxpJZuxbKYxR/1hBRHWLrheX8ST7mB39HkyvpUsmPfrqN88
	 zi6iOhwIStpoif0an8L2fuMSf78ynLUxFwnTboH07mvxdH5xzvVP2Pa/PObcK+/jFt
	 5f0Go3ejIGh1XNrnasudUdmrt3GrXSY1SW6VzhXuIQObithqCt61PeKuSTMW7jw8O3
	 U/OdvxARLkNQXqgRv4AUcd1QcZtEXws/csV64jdEvNo1pOhtcobf51yh7jVdB467pq
	 wLj1opru/g8eg==
Date: Thu, 8 Jan 2026 15:57:24 +0000
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
Message-ID: <e50b4923-ee45-43de-9d4e-344546c635bb@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org>
 <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
 <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk>
 <CA+EHjTxLkLjPj=1vwDqROXOUXi2LhOQb90WP6dFaTiYG1nWovA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KOrZZL+m63ovft+Q"
Content-Disposition: inline
In-Reply-To: <CA+EHjTxLkLjPj=1vwDqROXOUXi2LhOQb90WP6dFaTiYG1nWovA@mail.gmail.com>
X-Cookie: If you suspect a man, don't employ him.
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


--KOrZZL+m63ovft+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 08, 2026 at 02:09:34PM +0000, Fuad Tabba wrote:
> On Thu, 8 Jan 2026 at 11:54, Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Jan 07, 2026 at 07:25:04PM +0000, Fuad Tabba wrote:
> > > On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:

> > > Should we also preserve the remaining old bits from SMCR_EL1, i.e.,
> > > copy over the bits that aren't
> > > SMCR_ELx_LEN_MASK|SMCR_ELx_FA64|SMCR_ELx_EZT0? For now they are RES0,
> > > but that could change.

> > My thinking here is that any new bits are almost certainly going to need
> > explicit support (like with the addition of ZT0) and that copying them
> > forward without understanding is more likely to lead to a bug like
> > exposing state we didn't mean to than clearing them will.

> I understand the 'secure by default' intent for enable bits, but I'm
> concerned that this implementation changes the current behavior of the
> host kernel, which isn't mentioned in the commit message. Previously,
> both the feature enablement code (cpu_enable_fa64) and the vector
> length setting code (sme_set_vq/write_vl) performed a RMW, preserving
> existing bits in SMCR_EL1. This new macro zeroes out any bits not
> explicitly tracked here.

The behaviour is unchanged since we're always choosing the same value in
the end, it's just a question of rearranging when do it which is the
explicit goal of the change.  There won't be a change in behaviour until
later on in the series when we start potentially choosing other settings
for KVM guests.

> In terms of copying them over, if they were set from the beginning,
> doesn't that mean that that explicit support was already added?

That's a bit circular, with the new interface if someone updates the
kernel to set some new bits they're going to have to update this code as
part of that.  A part of the goal here is to make it harder to make a
mistake with remembering what needs to be updatd when.

--KOrZZL+m63ovft+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlf0+QACgkQJNaLcl1U
h9DQbgf/VzVntYNXV0km5HLDgB/SG9k64BqiNt0fbx3g83qjVtQuNw5OJfx/AI40
3CRrW3Hr1lIspMdVhwa+8lv5cpSyGzWnLWbmRJBVb6v++Hsslg9O824KM1LtRJqZ
herBG1MKR8P2+yGtEt2cxbABtHH3ONEEFdEIOiGDAH7jkRY36Gfwx6QwV8/QA+Ey
81r9gsksZDexFnwMz51S8jMdplvo3wMaDOQnytnH3YzQ9vC0B3Gfre+cAjqF2b99
xN9M8G1+jCOiBeLIDPIEXCC0RPPOJb+mEpy6yUcn7l3k4AaReGbGrqBPtboVRUFT
dB+n4q24DpQwRk1kIs62RHkorXoV/A==
=Ud9D
-----END PGP SIGNATURE-----

--KOrZZL+m63ovft+Q--

