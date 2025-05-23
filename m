Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C42C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPZZrsWNVmvx9DtrlumnUcfGKV91bMPbzAuj0TTPDuM=; b=ih71SvXW1FstU+glf0CR0MD3xI
	IYboamH0ZdGqhYxIe7vREsZaBE5b57s1+hdF0gfRSt0fX1LjcUX9EojvnW2KGDl0Hl0OjBre1A3+i
	PzKvnYbEV4Ejquw/1haBHX1sSzRGpaNXweCH85YbcjtY9ECy1rZ58NKLN7EEP0rpZmpGtst/rp3DR
	28HwMF1StbO8xwJRWR2pGV6+MswoMWw0/Av3ZvZNVNp4NtK4I6kWaLKk3CY7iqBBQvmWh+AqbdiG1
	87Az3wQZECIUVAzAgt70139OUF7yU3y/Tikrh1P8K05DW3/9G21aMrbFKiqTnzqGVLTZRMxKYEQUo
	rXYt6DAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUNf-00000004G91-1CjT;
	Fri, 23 May 2025 15:32:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU7I-00000004DkV-3NVy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7189743CEB;
	Fri, 23 May 2025 15:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A632BC4CEE9;
	Fri, 23 May 2025 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748013324;
	bh=8VAZ+KkDBpgajXwea43E3Jxb6kQkvjoqXTpZNv0Qq/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGQkJ1lC2/A+T2pz2yWocsEtvsiqUZZrEeNtanIv8DT3RFBAWPuP02jbRJFNFDE48
	 GPc9LopvR4eQb5iPOTsgmVrNhJK5RNWA8Z+yd3hTrF2m77McGnQ9/5QuxbMW/FxrNc
	 2ZDgRw10qC8TiiQmZtLDUdSWao72gM270Um0KAHv07hw3TbFOx+Savswqx7MRCqSDy
	 3mDPWLDYDimovIXkUlDJBztZv9zymx/F2+r48fjhnLX8OBeQYHYG7IlKluNy/IOgAJ
	 uJUPEJSPOS0ilK4HrOdJghDxRLydoNNXRPPxayHHhOTb8qNjaIDMdAAW1Es2AxqUGS
	 x37eWYDlYP0ag==
Date: Fri, 23 May 2025 16:15:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: D Scott Phillips <scott@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Rob Herring  (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <aDCRCOSB287IafJL@finisterre.sirena.org.uk>
References: <20250513184514.2678288-1-scott@os.amperecomputing.com>
 <aDCDGZ-G-nCP3hJI@finisterre.sirena.org.uk>
 <87wma7e5jd.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Yyr2O7xEu/r8n9d"
Content-Disposition: inline
In-Reply-To: <87wma7e5jd.wl-maz@kernel.org>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_081524_886116_369FBB3C 
X-CRM114-Status: GOOD (  18.98  )
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


--+Yyr2O7xEu/r8n9d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 23, 2025 at 04:00:06PM +0100, Marc Zyngier wrote:
> On Fri, 23 May 2025 15:15:53 +0100,
> Mark Brown <broonie@kernel.org> wrote:
> > On Tue, May 13, 2025 at 11:45:14AM -0700, D Scott Phillips wrote:

> > > On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> > > translations for data addresses initiated by load/store instructions.

> > This patch, which is in -next as fed55f49fad181be9dfb93c0, breaks the
> > build of at least the vDSO selftests:

> > $ make -C tools/testing/selftests ARCH=arm64 LLVM=1 TARGETS=vDSO

> >   CC       vdso_test_chacha
> > In file included from vgetrandom-chacha.S:9:
> > In file included from ./../../../../arch/arm64/kernel/vdso/vgetrandom-chacha.S:5:
> > In file included from /home/broonie/git/bisect/tools/testing/selftests/../../../arch/arm64/include/asm/assembler.h:21:
> > In file included from /home/broonie/git/bisect/tools/testing/selftests/../../../arch/arm64/include/asm/cpufeature.h:13:
> > /home/broonie/git/bisect/tools/testing/selftests/../../../arch/arm64/include/asm/sysreg.h:1097:5: error: function-like macro 'IS_ENABLED' is not defined
> >  1097 | #if IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23)
> >       |     ^
> > 1 error generated.

> This:

...

> should solve it.

Yes, that works.

Tested-by: Mark Brown <broonie@kernel.org>

> But it also outlines that the vdso is getting built using stuff that
> is not meant for userspace code.

Indeed, adding Jason for that.  It's the same for all architectures.

--+Yyr2O7xEu/r8n9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgwkQUACgkQJNaLcl1U
h9BDdAf5AeNkCRljY3IolOsbcV9AvHe7eansIWFCvJ6HxTOQqQmsS6T+op6eJZ4a
0N8yNPVxuuydStcSR1kFeoTrr1eYs6hQYMeU4oEidizB9l2d9pxxD9dpZN4eW0jf
JFwE9/4NsSn2IP1XC729xvE+FYZdkkD+u8R72XlUN1z6DNkqPv+Sm/UVgmTnpFKl
PRJ6dD0yPP0uhpa8cfWkB9lkNtwzGFnqiznOSALxyZfEymhH8v3SVu3Vi+6mXApd
V6LBBs9lr3K+V8rUmpM8KfcQj1UoQC2tMNhZq0LyHLkAJUlwkfQnU/HFaC5WJZOb
mhSFdprkC8hgYBfU0eRXxq1KmCOiVw==
=BxGU
-----END PGP SIGNATURE-----

--+Yyr2O7xEu/r8n9d--

