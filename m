Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914B8D2F32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRvqZLEMBeOwnPyxlR0inktt4MlpG/SLRw5izm0CNyo=; b=l4d+wyrsnh6V8HMP76V64cVqjS
	IK3+pMkV0xviGezizQHd+6h9Dtz0nSZT88iHTWqij0qncnF/pPt2wfzjvrMjOhAxjopbFPZPVN4Xe
	XsBCSvHliVHAQeu2KCXj6S2dozvlJQ5C/xonfqScO86cNt0Fbg4QtHtD0tt8QE0bLxJKJZcY/sDwv
	IgrmopVreoNsdlQ9nZKXBd3Cv3C/25IcoaZU9B549kZ6/htah10glTC1kS6QMtRMC7rXjC8rpm1vZ
	ER9olKMCzfl0Ea3AdpXCJDiM6gfFIglnNN8gXXDgJNavYpxOWCPLyRDJrqK58Vjm6AxJW/h0Q/05U
	iFx7zyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjwO-00000007cyp-1NSB;
	Tue, 13 Jan 2026 19:20:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjwM-00000007cyH-0877
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 19:20:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4192A441E6;
	Tue, 13 Jan 2026 19:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3C8C116C6;
	Tue, 13 Jan 2026 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768332029;
	bh=qurAIc6DbD1P3VjWT14CBlpPJbKMYx/2lRbDteQqJK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DaHa3cbXEWuHjYxQZyPsiCHXYiKK9rHndIT3XdWTaG/6sourN0aJq7yqPYNbx22xn
	 UwNvhMabpIoW8zban8RFgByaiJvtYg71554T9rpFCBpZj90wCnAPDmX+uEc4L4Eu01
	 1NZsxcAt3x1hJxYysaSl3TOVK1O41SSeBnO894H3fmSljNfa43IHXeVV6L/j6TsOMU
	 O2lbsaEatx9p3T/guWqUFxOkbMGUh7ILJqDVWD4saquvkehNCjMHpGsNK9pGI3AgKM
	 HFpPW24VJsUfgHrvDjClx28HsV9GspEm0TaaqnwZt34e0XX1/6E+aXGIkvWs1LBqae
	 EbXrFf/G9aDPQ==
Date: Tue, 13 Jan 2026 19:20:22 +0000
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
Subject: Re: [PATCH v9 19/30] KVM: arm64: Provide assembly for SME register
 access
Message-ID: <6f0e94ab-7c9c-4705-a90b-aea09ca629de@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org>
 <CA+EHjTwQ4fLBE1YXoB6M0eamSgGDW=nfLaC+-_surBfVbh3byQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lDAyLxtvXSswRf14"
Content-Disposition: inline
In-Reply-To: <CA+EHjTwQ4fLBE1YXoB6M0eamSgGDW=nfLaC+-_surBfVbh3byQ@mail.gmail.com>
X-Cookie: All models over 18 years of age.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_112030_138894_6B4F53C5 
X-CRM114-Status: GOOD (  21.14  )
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


--lDAyLxtvXSswRf14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 12, 2026 at 05:59:17PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:

> > +void __sme_save_state(void const *state, bool restore_zt);
> > +void __sme_restore_state(void const *state, bool restore_zt);

> Would it be a good idea to pass the VL to these functions. Currently,
> they assume that the hardware's current VL matches the buffer's
> intended layout. But if there is a mismatch between the guest's VL and
> the current one, this could be difficult to debug. Passing the VL and
> checking it against _sme_rdsvl would be an inexpensive way to avoid
> these.

This mirrors the way that we've handled this for the SVE and for the
host kernel.  We don't really have any good way to tell anything about
problems if things go wrong inside the hypervisor.

> > +SYM_FUNC_START(__sve_get_vl)
> > +       _sve_rdvl       0, 1
> > +       ret
> > +SYM_FUNC_END(__sve_get_vl)

> Since this is just one instruction, would it be better to implement it
> as an inline assembly in the header file rather than a full
> SYM_FUNC_START, to reduce the overhead?

Actually this isn't referenced anymore so could just be deleted.  It
mirrors what we've got in the host code, we have to hand assemble
everything because we still don't require binutils that supports SVE,
let alone SME, and that's done with macros that do argument validation
which don't play nice with C.  Even with an assembler that supports the
instruction using a SVE instruction from C code gets annoying.  It has
crossed my mind to inline but it never seemed worth the effort

> > +SYM_FUNC_START(__sme_save_state)

> I think that this needs an isb(). We need to ensure that SMCR updates
> are visible here. Looking ahead to where you introduce
> __hyp_sme_save_guest(), that doesn't have a barrier after updating
> SMCR. The alternative is to call the barrier where it's needed, but
> make sure that this is well documented.

I think we should put the barrier where the update that needs it is.

--lDAyLxtvXSswRf14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlmmvUACgkQJNaLcl1U
h9BzvQf/f/p7RflGxj3KstGrHbuuy4Zn+p2w36WodM7yaxNSGN6NOAbQBf6mbd/+
Gp4Wa+DlxmHvWufQbs4ZVzvcD6cJra7yLtKwDkrUVbwYXZiruLL8mx1TbR31PEel
YTiZq/e+84A0Iq/I1MJa3Gp6pMKR0wWROTckUgHz84pVh4RKJb8727K7223icJPp
x5bv2TbtkOOTqEz2Lkinhs/f8aFOaxG5EcibGp2MLK9F15ev8XdervooOujztXSk
DN0+jPCZgE4U1Ik3RXooRy/dNKtzlU086OecNGWrFghqupbtCFPLGLFXwbOZeFtk
kPCeRN/8k4SkdXhMDgXAvYhuOOPdQQ==
=Xzoc
-----END PGP SIGNATURE-----

--lDAyLxtvXSswRf14--

