Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1EBC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 21:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1xQp6TnnctvVRvsmBO7lNUazoq7APGQJNQv5Cgr9VY=; b=Tv9gNkGHVrQoLFrVuw9jYaEfJN
	0G4wI7WCauX6ciqTFrqWYi4CeyJ8mjZx5SexNoE8pXOo95f2mO4xWMtkFhPCaMRicCgpP9OoaCEI/
	fbJw2QyAdpfqcktBvZeMDyX+s9+TNV2I/FYgv2EB2oAyTX+Cj8cTlh+IPpVlKzpEngcs+Zbcrnc3z
	DplvDa2Ehu4xpcUGURy+il5NgNeOfNqO2tXz2995ZLTlQRvZ+luSNf5uPpqyrj7rG93fuHvNKSdoB
	IqA+JLww2JzL6a5ruAG6wKfMowUfAKxRQiTVbF5JzKgic0qc8vQEAwrzKgtCFvWjh6w4fTESnqduj
	t+3nJdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMK5-00000004DgT-0GyE;
	Sat, 15 Aug 2026 21:53:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMK4-00000004DgN-1832
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 21:53:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 126FD60052;
	Sat, 15 Aug 2026 21:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899231F000E9;
	Sat, 15 Aug 2026 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786830826;
	bh=L1xQp6TnnctvVRvsmBO7lNUazoq7APGQJNQv5Cgr9VY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iYQysflY5z6LJOT1PECEy9L7Pyjgx1OkM93zbDsKBNftTWEYrJM1TejoFe1QcGD1j
	 vWUFEV3hP9K2B14HKBsAvHwR4JSu2Y/WoXijAtHIurutCR+a1kKKqOmPx9mfqgB943
	 UNSv9khD0ANzi2gjhOLAT/2GlKhoHuDyZbHoQKasx46rMvaHfp2dLKr+dP4vOm6tvK
	 TyjVuSfM9PkRvDs1pDyiTNi24oR7kmZsPCx4kAAxiQauaLeWIxTA64PUj+rx43NIm3
	 NzK9CfqJnDii5NhMtSwvxLywVHYJMGUDfUE5KvY+51aHKRdnk/P7cR0mZLUg86BRut
	 Mk8k4bt1Vgj5A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6EE2E1AC527F; Sat, 15 Aug 2026 22:53:43 +0100 (BST)
Date: Sat, 15 Aug 2026 22:53:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 07/12] arm64/bti: Advertise BTI in assembly objects
Message-ID: <aoDf5x4iicivXsMc@sirena.co.uk>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <5340f3df281bebc81aad3cd9a7471d95061b4b9d.1786768375.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHV2ZweC5h7oUr++"
Content-Disposition: inline
In-Reply-To: <5340f3df281bebc81aad3cd9a7471d95061b4b9d.1786768375.git.jpoimboe@kernel.org>
X-Cookie: My vaseline is RUNNING...
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


--hHV2ZweC5h7oUr++
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2026 at 09:45:24PM -0700, Josh Poimboeuf wrote:
> On a kernel whose text exceeds the +/-128MB direct branch range, the
> linker inserts veneers.  With BTI enabled, the veneers' indirect branch
> targets need a BTI landing pad, which not all functions have starting
> with Clang 21 (and for all versions of GCC).

We already have explicit note generation support in asm/assembler.h
which is used in the vDSO code, it probably makes sense to replace that
too.  I didn't check if there's potential for the two to collide with
this as is.

--hHV2ZweC5h7oUr++
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqA3+YACgkQJNaLcl1U
h9A/DQf/WTnuS2TWA3jYmXlJx0LmO3Ydemf68Q8UJia96H0cXBoAVbvlCLGelBJ+
xwrW2pLUAszFkVhshCZn9wIsBxiaJHvjNEJBiV11UN27ogqwqkF8P5omVVAoUx9n
Jd8YZb4KIDcof9ZXXeug2J5QFkXaZQ+TjCCAKunMT94QPA4Ku2PLSs41CVdm1aBB
Hda9JTCPsvER87662JHG7mICgPmUmlDQKwHpxS9V9YE+/fx+kgARnoEGc1O32DOb
JKhYD8v22nrMHu0sdcpQMwjc/6GDvB6nGzFsxtwqi9sOQ6RNDffXKaHWWnxY1+74
ZNAOYbZgbFNcnQb5BDrpiUMHGbWfjA==
=y+lK
-----END PGP SIGNATURE-----

--hHV2ZweC5h7oUr++--

