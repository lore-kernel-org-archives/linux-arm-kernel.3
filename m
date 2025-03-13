Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DBFC35FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/zmAAvs9NnopuZELdGFf5m30SQkrIgaibjOTSU2/4g=; b=IppVQY4sJu92c0R1krAyubbbBe
	c51lom3V19Y2y/zZ5Lzl/0Tp5S/6vHC0Bf64epDvMY+l8lhKnK5xUPuAGRTw22Fu4X0Vy88464pMW
	m/lP9Cb6WXHQAKtPE8qUyWo/UpZeIQXIyl6qz0IHreVpDdSSojpQLK18bRx/ea/4J4YvAAAJEvU3l
	9XJxAjbMILYtVIg/slKMX8FB/J9EPeyTe+cfL+9OrESqfTDQRAkzn6WPMlZ6AIIZ3pMrvMoOrWxsz
	6LnigNLk+OA13JeA8zLEqE9+4YI6fGmwQMWdtSU5pKwY2TJfznz6npZSj+HAddnTY5P4nvcQxqYdh
	U84qDnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmtz-0000000C6QZ-1hVi;
	Thu, 13 Mar 2025 18:03:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmIH-0000000C2CU-0pU2;
	Thu, 13 Mar 2025 17:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DE4FA4570D;
	Thu, 13 Mar 2025 17:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C81C4CEDD;
	Thu, 13 Mar 2025 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886668;
	bh=9/zmAAvs9NnopuZELdGFf5m30SQkrIgaibjOTSU2/4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvyGRkVE67SzBgb1QxytGP4oCaiDm1tJxrYa6S762f1uCVELy9kUizXLZYLA53dFI
	 LKB6AnaccFkz/obvqyj95f4NBc0qIbgjsCSr6injy9nOKRnZ631Nz5jY6vtJhqfK9W
	 lfOaWqXafcfENzy2fADO6wmw4xv83Pcbrnp64dabwgF4V67YDxdHN3robsRH2ge3my
	 yyXxef+KA/0d2CifdqcRiTFlknqGJdXOg+TWR6xgA6Yw9w3MkQfmaKGP78AmYUgaDq
	 AxdUBErN29IHX2+C/CRP8J164+HWq5+oXjim9xRBBRx3EWs4UmnF9OTuMnKZeD2CHi
	 43mLTvGtWzx2g==
Date: Thu, 13 Mar 2025 18:24:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Alessandro Carminati <acarmina@redhat.com>, 
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Guenter Roeck <linux@roeck-us.net>, Alessandro Carminati <alessandro.carminati@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <20250313-abiding-vivid-robin-159dfa@houat>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="te6o3coodwf7546n"
Content-Disposition: inline
In-Reply-To: <202503131016.5DCEAEC945@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_102429_360663_C2E3F587 
X-CRM114-Status: GOOD (  16.43  )
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


--te6o3coodwf7546n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
MIME-Version: 1.0

Hi,

On Thu, Mar 13, 2025 at 10:17:49AM -0700, Kees Cook wrote:
> On Thu, Mar 13, 2025 at 11:43:15AM +0000, Alessandro Carminati wrote:
> > Some unit tests intentionally trigger warning backtraces by passing bad
> > parameters to kernel API functions. Such unit tests typically check the
> > return value from such calls, not the existence of the warning backtrac=
e.
>=20
> Thanks for picking this series back up! I honestly thought this had
> already landed. :)
>=20
> > With CONFIG_KUNIT enabled, image size increase with this series applied=
 is
> > approximately 1%. The image size increase (and with it the functionality
> > introduced by this series) can be avoided by disabling
> > CONFIG_KUNIT_SUPPRESS_BACKTRACE.
>=20
> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> very noisy tests much easier to deal with.

And for the record, we're also affected by this in DRM and would very
much like to get it merged in one shape or another.

Maxime

--te6o3coodwf7546n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9MUyAAKCRDj7w1vZxhR
xdXjAQCCwQNRXUI4bvpTeTrsH0SDbsLYjlm1aQi9V/DpasrOoQD/cFET4LceVGmh
WT9gLea6FEbCN1GQ2T9KOoLGuMrzTAw=
=uGit
-----END PGP SIGNATURE-----

--te6o3coodwf7546n--

