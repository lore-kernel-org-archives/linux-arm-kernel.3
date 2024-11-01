Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B091E6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQMaWwcXNyU4RJfcUQOoa2aaHekBVubXNttPgEpUaW0=; b=TjEBTIQ+W2LX0zo0HaoE0Ck7Xg
	bT1KgeR5iPnoi9MRNpzPO75QnVuA8yFn0PKMuqbOfwf7+ea8SqrIFBpCEJifBDSwmecT5ZXlJ7ArJ
	6fHTUQ6gNbRAPxy2462rTz5U7RdkkryrXt9pu+eW3WKkdie8/qwHUI4XTy5V9M6VPZRIVpRSRVtVv
	fiwEt/jr7HGBhoIo/O+MXujEgRlYSx6YQ++UWUZiNONtm96gq7GrNgjxWz+9PGfcJtF3YDj/Zlgkt
	onpSni7bpkHdykOShLS6FLFfK0YSs/pku2knleH+YghCUtNS3DeknAtQmPqVUuN7a4VNtDDBjcQQ9
	Vba0eTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6unW-00000007jsO-3qAF;
	Fri, 01 Nov 2024 16:46:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ueD-00000007hkn-2K2b;
	Fri, 01 Nov 2024 16:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DE46A443EB;
	Fri,  1 Nov 2024 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A122C4CED1;
	Fri,  1 Nov 2024 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730479036;
	bh=9cb/qIM5GkNHvDl4cwky8lRENEhP+MSleP+ED061UOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh05FzQohbCjpLPYZYiml+DBPG180jE/ft2iaztx7zdHObx0fRlIrEPAlxioA9rcz
	 +wRvnqqNwgJRpMWjOOmxtuVVbeAR9g9B99Ox8qTevpgx21JJfi5ND/9pWsI1Hx4YbZ
	 sxEV8RuzAEdsYosylUirvfywlml0oXIHTeeNsym6IuCQkG6u+VKwfIP0ZhN/Hotfni
	 xvUDHx0/XqGHacfhf/JuOQaMcZZey97NEHMW2czpefWD6Ky/KG7q0rlhrN68zqQxr7
	 BHs8TYKpiWOzhi0byj6MM09cFWw7TBIiArMsOybXd66+nsfTVQGGQFFWa3H6C8JZNa
	 u2/RrSX9ce07g==
Date: Fri, 1 Nov 2024 16:37:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
Message-ID: <0bd90020-4175-48f9-9017-2eb6073101d0@sirena.org.uk>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
 <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev>
 <ZyT61FF0-g8gKZfc@google.com>
 <ZyT9rSnLcDWkWoL_@linux.dev>
 <ZyT-6iCNlA1VSAV3@google.com>
 <ZyUARgGV4G6DOrRL@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6kYfSRqCQpL5xm5l"
Content-Disposition: inline
In-Reply-To: <ZyUARgGV4G6DOrRL@linux.dev>
X-Cookie: We read to say that we have read.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093717_741555_5048C674 
X-CRM114-Status: GOOD (  15.13  )
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


--6kYfSRqCQpL5xm5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 09:22:30AM -0700, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 09:16:42AM -0700, Sean Christopherson wrote:

> > One thing I'll add to my workflow would be to do a local merge (and smoke test)
> > of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
> > this cycle where such a sanity check would have saved me and others a bit of pain.

> Eh, shit happens, that's what -next is for :)

> The only point I wanted to make was that it is perfectly fine by me to
> spread the workload w/ a topic branch if things blow up sometime after
> your changes show up in -next.

Yeah, the -next breakage is a bit annoying but so long as it gets fixed
promptly it's kind of what it's there for.  It's much more of an issue
when things make it into mainline, and can be very problematic if it
makes it into a tagged -rc (especially -rc1) or something.

--6kYfSRqCQpL5xm5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmclA7QACgkQJNaLcl1U
h9Diegf/bQqyrBGdbW3sZYLGgcu7GKElqVo35sLnznNUwNVBjwT3ED3phcFvs0e+
ykVAaeCQQQhw8p45KLci5zxYxGlymTW+lThmUSLbxAAiqZEOaP/nVcS+aKw+iS2a
2nVXVegHJ0RXjxyupuOHJ5fEyCjnr46tPbW4Ok3W3cGrEvAhEsFqB5K9leegPLwn
XZBPXERi3tAFS1Y57FBz9EjPLijPil2knc3/sEapi/7kjV7mZ9ahYYkscl88Fmms
8lH1QX/Im7iQ0ayGvSFRd+o6AnCeN/vI8aGInfytJwchPrlKxDKDYlOPd6uRBj86
6F4W4ExH23evr6zeMxhiNHXMyGbMqg==
=KB5M
-----END PGP SIGNATURE-----

--6kYfSRqCQpL5xm5l--

