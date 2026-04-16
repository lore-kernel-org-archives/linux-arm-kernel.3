Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA7F8D761
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhaAGwvGQWthx9wZASRy4dtMcD9mT3ic/Pb7kfooeNk=; b=F4V8VTqDwUZnY/rrETMtMECFwm
	3Yz1wUEV8FS09VNMSFvMNf0y6EUs13ft3YvpZwWtMutv7ZwH97vE4spMFFDivqMEPou/lChFh0u4p
	Ginq5+kTaaimyrPs67eI6UfGi47CiCpINDJ3CaceBIFtGnbhj0YpmwdIuZTdj94skWM9orVAzWb/w
	15HTOSqva5j7dx8uT825tDc8hj0P1IN/0mPGef7/t5IfiHQB+SxUfowk20yIlCZQeeB0Rr6Zg4SCu
	134M33hnlypnXp+VvdjboxAmetbAu4+2LPoHeeSWADNnUIyK4PK5308DSbngJZcjkD5wjc/gA+lgn
	Ozp5ZmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPsl-00000002gCf-3JqR;
	Thu, 16 Apr 2026 16:47:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPsh-00000002gCI-3YfC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 16:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38B89405CD;
	Thu, 16 Apr 2026 16:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B35C2BCAF;
	Thu, 16 Apr 2026 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776358075;
	bh=azLf1jjvVZCDjMDcCYo2UoiktVd0HigQaP/VVbjL8aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0k0dF+7MRawEKljfyRvFly0XbnirNtW/luj4NP3M1ywvzu+avuee09+Z1hQ1ZSZH
	 Igx6vj8foYSmKJ2lqvdZfLfnW9yoyPzhYVIL/cjCmSpEABc0+oAurUskM+UVLHg2Z3
	 4QN02EGV5X7bdBZ8tON1rA4ghZILI5nLKqpK99IxKzaD0Y5Ws/JRSwO34WwnL080hr
	 o33byAF4WQEbQGQVJJ36VJ/2feUrw/XjdjA7CyWdW/jBVpBJ2SjdlLkZO+Q1MmddQM
	 B+dtofo4A9Hg6EMESLlWHeWuqiZlJjwTRdZrGYDmTiz8i0SEvDZ5ip/1tRuU+fUEmm
	 cv1zrbEvdHQWg==
Date: Thu, 16 Apr 2026 17:47:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Demian Shulhan <demyansh@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Mark Rutland <mark.rutland@arm.com>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Li Nan <linan122@huawei.com>,
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
Message-ID: <acc15515-4c43-402c-9800-c9b5e3da9891@sirena.org.uk>
References: <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com>
 <acJhCCPfVxjFUZ5R@J2N7QTR9R3>
 <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com>
 <20260331063659.GA2061@lst.de>
 <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
 <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com>
 <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com>
 <CAOLeWCtf2rZyPeJH-LuZ2A+c7mC9M2r-Ya0VjyOJFpun3TFMnw@mail.gmail.com>
 <8db4defe-8b5e-4cc3-880b-72d46510b034@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JOYyU/fvxy0ErnXa"
Content-Disposition: inline
In-Reply-To: <8db4defe-8b5e-4cc3-880b-72d46510b034@arm.com>
X-Cookie: Process promptly.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_094755_918035_FEC2592D 
X-CRM114-Status: GOOD (  13.19  )
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


--JOYyU/fvxy0ErnXa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 05:26:08PM +0100, Robin Murphy wrote:

> Unless you've got a CPU with truly big wide vector units that _can't_ be
> fully utilised by ASMID ops, then SVE is only really offering whatever
> incidental benefits fall out of smaller code size. However, if you do have
> those wider vectors, then the cost of correctly saving/restoring the SVE
> state - of which a userspace benchmark isn't likely to be very
> representative - is also going to scale up significantly.

The other case will be when there's some SVE only extension that
accelerates something that's relevant for the algorithm.  That's not
really a thing at present but I imagine that we'll run into that at some
point.

--JOYyU/fvxy0ErnXa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnhErQACgkQJNaLcl1U
h9BKKgf/eJp0wWu49gmu4M9de/lTRZUet1gGlzyUoJAzvATBfXECQC0f1VLvsw98
13g+QN+RZj9mnDqVXn0p/00v9HlZIAnBv3ZNJRc1kTPe6Vt5FfKmkSgRO6FJFq00
fnYyh3V52OvDzIBakSYa6e6OOkLstfLotmjS3uxaxbcKNu40DE/jHLSbfXtp+G4a
RyJUtwSNu6+CGwVXZF4wbtxuUzNZGl92amfglEYxaAr2ACx/2OaX4eN93HELX1Ng
xZpkvLpXmw3xfm7V1tFEiMfUBukTzZrd4u0hunBKiTmnfbSEJV9AES/qVMdky8sS
JiqPGtz55Nh0Qvlx5X7hWk7hFD8Vcw==
=XqGr
-----END PGP SIGNATURE-----

--JOYyU/fvxy0ErnXa--

