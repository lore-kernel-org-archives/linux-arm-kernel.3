Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BCBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypF4ATmrVxGI+bbDERiXi6y89kUoL7bAQITiPKwExvI=; b=c4AfvjsS3/J6F70Q5mNJI46SNl
	q4AF6xPOjBQeD23sazNDMLNpuyu9o3kyY1Zt+2saUvQP1R4Owsm1eFmJh0iw7afrqWYzJvxuCGK1Q
	QlTYU/88wUiAuNzGQJDezFRqwhSJADZBfzKiw6X9QNNuTzUr687m6K7021FJxWd2W3NnrpPsMsOyg
	CY3T0tx2XjEH/nK77N3/nJRRe8S6Q0cVFL8UcZZHlRAU41yw8IeCMT43zEeT+5kP9HH1KktuTdGtm
	JnH7lmz2f7RuKbqsH9Y8cxeCr6oO0CCs77WXnO45tuZ9FtVRM3GCpPm5CTQ8yc95vlfVfHXw21q+c
	67WMWS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXS9-00000004nH0-09wG;
	Wed, 23 Jul 2025 11:16:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXPc-00000004mxo-1F4I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FD65A52807;
	Wed, 23 Jul 2025 11:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D80DC4CEE7;
	Wed, 23 Jul 2025 11:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753269207;
	bh=QS54HACGbgdMRs0EaSON+Zv0IttzLgk3Dxvba53hmEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VveC0p42ztQD01MnFfZlI0VMLsO/8qZp7VAoH72GvyCT1o3tfOA0XyRIjPFW5lYAi
	 k/cIVCxaOvcMxuF8JK4oly+Gb+x9y18pTR8ZJEjd8EVkpIBuCRWDBWQUpbwfP4Q2eq
	 +lPnxlk9lnVBTy4tpisJi/Tfy/ztJCXogsJqF913H6al3HBi7BHxRzVLX1pvKOUDSD
	 u4nKNy3+XCK+OZZ12lH1OFoU2zW/+/VApEeCOQFhw2tJeQc8mtur2z1ClR3ALgloY8
	 Ux9hfdhPXUvJYr0p5pe8eLDh/7We5RJ84askLuSNAHurpDXmcxDapbMFTnS9hOs+mi
	 r4bOPw4jHoiAw==
Date: Wed, 23 Jul 2025 12:13:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org,
	oleg@redhat.com, peterz@infradead.org, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/8] arm64: probes: Add GCS support to bl/blr/ret
Message-ID: <75faf0ec-79ee-4631-91d0-535c81c1bc85@sirena.org.uk>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-6-jeremy.linton@arm.com>
 <aICywZ55EKfSYSIY@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LlK8+g0AOOO1HzK1"
Content-Disposition: inline
In-Reply-To: <aICywZ55EKfSYSIY@arm.com>
X-Cookie: List was current at time of printing.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_041328_418052_0B52376C 
X-CRM114-Status: GOOD (  17.61  )
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


--LlK8+g0AOOO1HzK1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 11:00:33AM +0100, Catalin Marinas wrote:
> On Fri, Jul 18, 2025 at 11:37:37PM -0500, Jeremy Linton wrote:

> > @@ -133,17 +147,26 @@ simulate_br_blr(u32 opcode, long addr, struct pt_=
regs *regs)
> >  	/* update pc first in case we're doing a "blr lr" */
> >  	instruction_pointer_set(regs, get_x_reg(regs, xn));
> > =20
> > -	/* Link register is x30 */
> >  	if (((opcode >> 21) & 0x3) =3D=3D 1)
> > -		set_x_reg(regs, 30, addr + 4);
> > +		update_lr(regs, addr);
> >  }

> I can see why this function was originally updating PC (in case of a blr
> lr) but updating the LR was not supposed to fail. With GCS, I think we
> should follow similar logic to simulate_b_bl() and skip updating PC/LR
> if the write to the GCS failed (assuming that's what the hardware does,
> I haven't checked the spec).

Yes, the pseudocode does the GCS validation before it starts updating
BTYPE or any of the registers.

--LlK8+g0AOOO1HzK1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiAw88ACgkQJNaLcl1U
h9DmBQf+NT0Xig5/CJmpAvlNNkwAL72NZQH1v7bPz2tbKiHVjN1NwtBf/kvxhpEJ
RMMUpmeXdnzJLb5ivMwiO+8bgLYvs+ac79pa1VQYELxVclezQ/cjk4wH0S4PH+gN
neW8Elmceqi2i9Qdf5Bsk1bBwytFluoTnYxoivJsYUCkOR+Fd4ERBYdixoqjJ0iK
+aORZ60biBcK47nd+hg41RbXRPovvPqiaSlwQFZaG+xaujmlKiFVA9raaxu6s/J8
4etrlu666ZIaJpv0Dt559+M04Qi3MOld4/oJZcDMPUWyTxCpHV8Di6eEOAKTnRSn
W8tJ7fswvUHErMIkOyCePEMdE1dAHw==
=mw2L
-----END PGP SIGNATURE-----

--LlK8+g0AOOO1HzK1--

