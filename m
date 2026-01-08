Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB6BD185E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKhQxCFHkdA8BR99yu5stDp/hJJ+zPyOm29qK2M3Cp8=; b=BMpDPEjcwjTEYkP9vX58tIHo/0
	79QY6GEeUOEMOak2IYu5tAh5mGS5d0byasHftWzJqAe2qYna/qq+kW7TPvtZdHUZTXh+u/0sVW1Ll
	vg0yPy9NLZ2vNlAhdKXw7JID6KV5iMQ+GwCe3HFqAfe1yLIlmIQXAUCm05dGLbFOohz4FI8K9OFVj
	qzCcEOSG9zo+X2mvvhbHz6DrfO0oUdOomcIGT2sZbA1+N2eOHgsK8GheGIm3VmNZyaF5RaIe2o1+Z
	8wT7k9pF52/ZosX29VNb3gOMainyksgInjVSZ+XQUbUDAxOxYxcHy/H7rwHgcix2FqKtJYtnTAmb5
	oLTwr1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdobG-0000000GuSY-1fcz;
	Thu, 08 Jan 2026 11:54:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdobD-0000000GuRR-3Zfm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 941FA43E2D;
	Thu,  8 Jan 2026 11:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EECC116C6;
	Thu,  8 Jan 2026 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767873282;
	bh=2QEBB0tMTbcvjFiR3Bb1wbKlZRI1fz02/DZZV9eNhGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gztWuRWWWZMayVuI+eb83hb3O95TWjuvXHPnEaq9PU++6FKFEs9agoO8gkYWsLZoQ
	 AUiOfOAzMknl1KMV1WWRlutba9l6uoUNrHhvu0FBq2uFDn5jpUBzNuZfUQG+FaWQiy
	 TQrhqyCltaiDZV7MUi4zRKt5lBONbDFu79sjvv63PnDEqWgZx4+WeSFhIbcWa3ZLyd
	 ccZlJiz329makknk+Pp+h3XLmy4RCnWlzOneHdEprUjri/PYwlvjwZMRdmhPX44NwX
	 UD4KU7TcamImNx7mzmBzSxb5xMoKo//IO2Ns/eUIaBFOYPgElqwojBE81i/eviy23g
	 LZPpq0A0TAzqw==
Date: Thu, 8 Jan 2026 11:54:31 +0000
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
Message-ID: <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org>
 <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sEpEXEQvmS/iAzMe"
Content-Disposition: inline
In-Reply-To: <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
X-Cookie: If you suspect a man, don't employ him.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_035443_962454_0E203AAC 
X-CRM114-Status: GOOD (  17.78  )
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


--sEpEXEQvmS/iAzMe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 07, 2026 at 07:25:04PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:

> > +#define sme_cond_update_smcr(vl, fa64, zt0, reg)               \
> > +       do {                                                    \
> > +               u64 __old = read_sysreg_s((reg));               \
> > +               u64 __new = vl;                                 \
> > +               if (fa64)                       \
> > +                       __new |= SMCR_ELx_FA64;                 \
> > +               if (zt0)                                        \
> > +                       __new |= SMCR_ELx_EZT0;                 \
> > +               if (__old != __new)                             \
> > +                       write_sysreg_s(__new, (reg));           \
> > +       } while (0)
> > +

> Should we cap the VL based on SMCR_ELx_LEN_MASK (as we do in
> sve_cond_update_zcr_vq())?

Yes, although I fear if we've got to the point where we've ever got a
bigger value going in we're going to have bigger problems.

> Should we also preserve the remaining old bits from SMCR_EL1, i.e.,
> copy over the bits that aren't
> SMCR_ELx_LEN_MASK|SMCR_ELx_FA64|SMCR_ELx_EZT0? For now they are RES0,
> but that could change.

My thinking here is that any new bits are almost certainly going to need
explicit support (like with the addition of ZT0) and that copying them
forward without understanding is more likely to lead to a bug like
exposing state we didn't mean to than clearing them will.

--sEpEXEQvmS/iAzMe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlfmvYACgkQJNaLcl1U
h9C5wgf9G+XKmo011/eubfLKJPyBw+Fnrf+TV1a7La9Ua9nDLvYoLuH2+ogXAq0J
Y2jWf3r7uTwF23+nOLzN6uyqWmqu0RHeW9LSOk4wDgqJDNNnA4UwpNauRFdfFQgd
5ANBOv6nviVTd0TpmjfCD2OoFKvbx+VHFXoonEsPFCSneA9IHd/8N21I/0q6sSr4
+5BKfPAr6d0Gk9NS3w1CRfB3XkOcG4Jf/vbJ1fjszfznHkWG1xV0R081qLd+GcDE
fXUJjF6YAttCNEd57BrKpHNENZnNcNYwW5OvWhsUMG7N754fVb5utrd6b6Rd4xGf
XcUYMxOkTJpeO7vgmY5AHpVUzXiVfA==
=JsxG
-----END PGP SIGNATURE-----

--sEpEXEQvmS/iAzMe--

