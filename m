Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA606FD376C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FjuV88iRjgFVMdtMmS1Y20Wa2wwD46YoxrvPNRD4JU=; b=hp3bb6emO71Z36ZOBlTIj4+35f
	gJ8xoewgvxEXa/VACrpTahKBDdkJwWiz9Sc6vMLnqqPv4LbD+RuQ1raHz0O9ONjFEA8nc6odicPYb
	8tmEMNtmKORjRDfgqwwrkan02gM7on9Xff9sYcDsOKHYMNmB949zrVNOL5GSyMFK+dxLDyIOz/esp
	GKH8rymylTCeYP6NuwvqEE2Vi/1j8/P5KVv/ZbjtgaMNEXbIQeBnQyJ6675KdoGIPxB1qV11yLGpi
	NeW3qqDYUp9lr/bmKTHJWO0vub/FV6I4C9s4r23FfVb6J8xLuppgQGaG9+B/MUwuQno0h1S6Gr+F4
	cYcdSGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHT1-00000004SSi-0KOS;
	Wed, 25 Feb 2026 16:10:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHSz-00000004SSH-0FAo;
	Wed, 25 Feb 2026 16:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 772E4414FE;
	Wed, 25 Feb 2026 16:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98AEC116D0;
	Wed, 25 Feb 2026 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035824;
	bh=0FjuV88iRjgFVMdtMmS1Y20Wa2wwD46YoxrvPNRD4JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzYcXM9wRwlqudnoyVaHi/I55B8Xy8UCCoz6ezH1IOtdpPvMR/sQA2F7Wrw/UjTL7
	 7qLIasgQVHpUrs9qghinkXJl463QSjytZOQuzRSoKz99Wn+M4+NT9yjxjiKrh8PGyL
	 hzd9Gs77pCf9e2fpSuPXoc5s9UfPMygz2Wvnyg7aZX68rW2tJ3pokAo/eCFMyG8zgk
	 WaypuvLE8XBEE7iRt8goVbdKWheQOUt9Wj3tNNgLx5GYaaIrt5BvuoUlalFevJXpQn
	 y0D1Ecw/aTJQAe0ibzeaN7ozxgHclMwRRrA6Ts9XzeK4ni3QX0NGqYeayIkY/QOhIf
	 qGB9IFWip9LaQ==
Date: Wed, 25 Feb 2026 16:10:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/5] mm: Do not map the shadow stack as THP
Message-ID: <a44708a8-ec02-41fa-b870-a649f13072f4@sirena.org.uk>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <20260224175800.2500729-6-catalin.marinas@arm.com>
 <5570c06d-fbc1-42c9-9b27-26211e8b033c@sirena.org.uk>
 <aZ8aeHpn_KElP2jm@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JCpLj7aWj71R06c/"
Content-Disposition: inline
In-Reply-To: <aZ8aeHpn_KElP2jm@arm.com>
X-Cookie: From concentrate.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081025_118487_786469ED 
X-CRM114-Status: GOOD (  15.67  )
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


--JCpLj7aWj71R06c/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 03:51:20PM +0000, Catalin Marinas wrote:
> On Wed, Feb 25, 2026 at 01:02:36PM +0000, Mark Brown wrote:

> > The create THP and immediately splitting it pattern is very clear when
> > checking the mm behaviour on new GCSs, this should help performance.

> If the first access is a write, the kernel allocates a THP from the
> start without subsequent splitting. Also since 6.13 (commit 1ced09e0331f

Ah, it seems this has been optimised since I looked in detail - it was
something I was aware of as needing some work.

> "mm: allocate THP on hugezeropage wp-fault"), we go for another THP on
> write. It's still wasting memory and time to zero the full 2MB when
> it's highly unlikely we'd ever use that much for a shadow stack.

Yeah, for a shadow stack I'd be surprised if it wasn't cheaper to split
than do all that.

--JCpLj7aWj71R06c/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmfHukACgkQJNaLcl1U
h9BAtwf/eJiuRiBLDlc1QhGdxyYX5xad4l0NQG+kUJtFKdtf8uirsqJnCujt51Qr
oi3hYyDUFz4O/Z2t1tz7HZEzqsNg7qqSTquQry5J/pz+GNx68119fyq6YT5f17cW
KKZ6KgWRGOfLhml3l2nCxrXQRZ/tLSx1EHnN/k7n1ZufpMUFxYwRJQhY57kNKZ9y
mml970ixYEC23p4sl5MJkjWi2zFgLaBDs+aIrz/Sg+4Ge6VIh6FMFqVMuuHQJGJJ
3tfqiXcu6E2oCNv5uBt4XDKdDpxODdmi4GZfK9k6A5LdzZltcIxpv8PM+Lwc9pps
o5lAL+DVMVgg8sUCGoEI7MwS7QqF9Q==
=6VDG
-----END PGP SIGNATURE-----

--JCpLj7aWj71R06c/--

