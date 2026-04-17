Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55EBF436B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbMVlQS0lRAZ/ZBrlztbGqdGMddTU1wc54B8NGqwM8I=; b=th2vwAESLyvGKHBniHv+5nQWr8
	tiaeJudU5AZgbN/h2g9i4j86Kz3/c8py1huTas7AiEk6WF0ghrLgU27lCEMHSbFAwHWUOgMhQHgXF
	Dr8QQveZL9FpdfQl5eF0buJ9c7F9eMGz53vYGI69myfoI6wpSMlVuV/0fvHcKXhpadfTxEMkcqrOg
	KmGFfS/KBoSimukU8p5d4c7VEwHdIvMDODIEEZdYedmCZ1c7U9Msw5JFJbvD6xT82NNltfV2PW+If
	cXNT7LBB4eIyI/dao+gMmEmE+93HfMCO3ZRfLvyRjhW+wETAbjB7h80KbG5/EjJMR41/TN5pM5xRH
	yBg9INVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlFU-00000004DfD-1Q6v;
	Fri, 17 Apr 2026 15:36:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlFS-00000004Df5-3tpH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 197B760138;
	Fri, 17 Apr 2026 15:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57671C19425;
	Fri, 17 Apr 2026 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776440209;
	bh=FcCWGPrk9R7P1cPiUZKS/mKU1dNaQ59sANhzcCbnuFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cl9GvVzWvXXyBspphHKbtR9Jla4/6r+9qD3boEHEa7N7GXm/jzvQmjv0+2ElM1oSf
	 7ft4o+c6anFmHwLaXK9JHIpy/gmSHbb+z3dznRq+xAuxRN7PScBO4ACYvafevJ3SIk
	 VGrF39ngUkh6sgG6wOIB/xdbgGhh5ev/NbXACAIm1m+Whw1jm9VVyfDnYl8d0j61t3
	 x9J7GSDxdn73gJjWUCahrQv+LCzB2VkPy4L8lkD0akswdkqFm9XWC/z97jIXLQOhV8
	 5rpt5afyRv5C1EmwCW+vhtP216j6AcfWHfMAQQ8Jv2x9Mfb3EJ/HoyPZS7MtSscd9x
	 28GPeqfhvnw4g==
Date: Fri, 17 Apr 2026 16:36:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Demian Shulhan <demyansh@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Li Nan <linan122@huawei.com>,
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
Message-ID: <2c2eb793-c0a4-4b65-93f1-0ece5cf820d7@sirena.org.uk>
References: <acJhCCPfVxjFUZ5R@J2N7QTR9R3>
 <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com>
 <20260331063659.GA2061@lst.de>
 <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
 <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com>
 <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com>
 <CAOLeWCtf2rZyPeJH-LuZ2A+c7mC9M2r-Ya0VjyOJFpun3TFMnw@mail.gmail.com>
 <8db4defe-8b5e-4cc3-880b-72d46510b034@arm.com>
 <c9362db6-1fef-4e70-9525-29b2936f4887@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h+PLrOwUQ0SPNQK2"
Content-Disposition: inline
In-Reply-To: <c9362db6-1fef-4e70-9525-29b2936f4887@app.fastmail.com>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!
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


--h+PLrOwUQ0SPNQK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2026 at 04:43:06PM +0200, Ard Biesheuvel wrote:

> On arm64, kernel mode NEON is mostly used to gain access to AES and SHA
> instructions, and only to a lesser degree to speed up ordinary
> arithmetic, and so XOR is somewhat of an outlier here.

> Given that Neoverse V1 apparently already carves up ordinary arithmetic
> performed on 256-bit vectors and operates on 128 bits at a time, I am
> rather skeptical that we're likely to see any SVE implementations of the
> crypto extensions soon that are meaningfully faster, given that these
> are presumably much costlier to implement in terms of gate count, and
> therefore likely to be split up even on SVE implementations that can
> perform ordinary arithmetic on 256+ bit vectors in a single cycle. Note
> that even the arm64 SIMD accelerated CRC implementations rely heavily on
> 64x64->128 polynomial multiplication.

I'd not be surprised to see something that delivers useful benefits
using SVE at some point.

> IOW, before we consider kernel mode SVE, I'd like to see some benchmarks
> for other algorithms too.

Definitely, it needs a solid win to merge anything.  I do want to get
back to the situation where we've got out of tree infrastructure patches
so that people working on algorithms have something to base their work
on (and see the overheads using SVE incurs) but unless theres's a
practical user they should stay out of tree.

--h+PLrOwUQ0SPNQK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniU4sACgkQJNaLcl1U
h9B/2Af/TY2x6C29q51viQsIQR8AqsXh0E7IX7IOqJXFpXWDc29gFjdyz/b+ScmF
hJBLBAq0+VL99Fqm2/uwLs0yvgU6xhfzSqLy7Y/eZ8BAFMthU+BAyt2FwXYcFv7b
lWjyhddMsXJG341/X4k8WsqQ6R8O89UAyZ3apu9rAPZAPXJgkFxXQmypikpEqU+M
5FIbf7mTZZicf9/uWcbK8qayKuUIc/NAtET3IZidHsLkQPalICs2Zv5ae6DWZ1dk
ELeHqZCLdrKq+KaoH4kXqomFfway1oEFOYQqHsdrcL1tHB7EvP6Y7ISsa/0LTL0q
AUuF65vn4L4sYBXPoYdpOg2asYgTvA==
=Z3VX
-----END PGP SIGNATURE-----

--h+PLrOwUQ0SPNQK2--

