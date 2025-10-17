Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA5CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mK3Fl2Pn6OcWYGOVgkej8ydEl/IKicHd6XlHsQq/EbU=; b=tt/p1hf6XJWqGmgNgCvwSYdOAT
	C9efndSNUbbMZF9tLorFEZEKanEXWccYoEgyIzBERGSabR4kjrHQTvPd1flt4lBYymqk/p91vlzVL
	XbmeNaM2SxgwXc0LSkqwajqcCiNcCbOaeXNfYPN43o++P8+xfUTQVZFjOEBdwiAvBJhP/HixzvDIb
	J/VytZmXVFoH1H4ipuTzaPVpxrMz+Z848gXmFyhyVfZUDRijp7XiSUO4caFWO5qv+ldyyeaBOtIEH
	O0z0qfdbun5NFBAWRHBi5zpdf38rOMDxTfpksDA3vcDLxuBWgh6oyOhDjjBruywLQfgDxrKvRXYJE
	+YCbMX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oJi-00000008bZf-3zFQ;
	Fri, 17 Oct 2025 17:32:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oJh-00000008bZR-3N9p
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 17:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mK3Fl2Pn6OcWYGOVgkej8ydEl/IKicHd6XlHsQq/EbU=; b=eP4b4b2ZBlnRWMkV3yubp9vDkJ
	Xhnycy4SdZRoY7kWJI99ox3UbS65xhAx5fzW6YYfiiomIAcCHqy/eBjQ+tfeM8deiPpxHtZQKcpBK
	GilIowj9Yrpnqe3lU/j3qZRoWA7QbfOewm7FV7W1QfEYCYENL+6CHup1aMpUly6SZzFOxz2h4Cwcr
	4TP+gDQRqn2W4jfL9k7mPiiIVMPlUO37wZwfL2rHWABNQSLDxEkQ7Ieyb06ui+HRDbo+tK0AtT2jA
	Mih2A3iNulSzklLVP6iYmoMTuoDbsZcZWPdYY4M/c5wLSLPIgoZXFMJdK/sxuspX1hTYIpaSksd8q
	UjO3f53g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oJY-00000007pTG-3ymF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FDA140367;
	Fri, 17 Oct 2025 17:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76ECFC4CEE7;
	Fri, 17 Oct 2025 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760722345;
	bh=mK3Fl2Pn6OcWYGOVgkej8ydEl/IKicHd6XlHsQq/EbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzLT64v5SSaSKewtscDNrZX0ED39JvTzLpjo/a779mwwFtcGjlfBn3DMgLvNFtAxZ
	 lDVbIMDtirzCw/oAHZnzeFlu9RVbJxJLhbhWN/RjVRw4huh8Gm9sKACSVA1lhTu6hO
	 7wQsD9UCXR1ATe4KJKkNG+8GWwkpLMyf6PFyP6+pohzQ4LiCP1ClR0918LJzTjXZwW
	 yeo/PG9b1GAT1n57PrHQAPuJoJwj7FBGtzdZnL9MxQef7ZoLStWWyuaPaND8hWfJVe
	 qv4LqXoWJGOXv53r4YpzmZ2rIxaVyBkFejAvaZV+dCPzLmUlfpj17UD3sm5BRzU0ab
	 gUNbSCPx+az0g==
Date: Fri, 17 Oct 2025 18:32:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KbGHBWGA+KCN6s9I"
Content-Disposition: inline
In-Reply-To: <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
X-Cookie: Androphobia:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_183230_731772_C4BD4704 
X-CRM114-Status: GOOD (  14.00  )
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


--KbGHBWGA+KCN6s9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 17, 2025 at 07:26:51PM +0200, Bartosz Golaszewski wrote:

> Upon a closer inspection it turns out that this is not the case - the
> ENABLE/DISABLE events are emitted when the *logical* regulator is
> enabled/disabled even if this does not involve a change in the state
> of the shared pin.

It really should be the actual physical state change that triggers the
event.

--KbGHBWGA+KCN6s9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjyfaEACgkQJNaLcl1U
h9BErQf/Z/sKUhSw6MAZ93yfrnBWym2QF5z8oMpsH7JQGCNPCw9xhi9ONVG3iIWO
VmtCGqQumniEy8IL0mHp6No11tieFxS7lSjEg6IoAE1eoFvyPpGMBQ8cNDnuvV5E
BYwaq8DfHvb6vzVp1eP9DJflPAX3sUePRz+Yg/mIS9yzcF/yUOzDD6JJUC6pMwfB
K4idkg8y39S6TfnUi2k2btUj1xBzuYDn4/ep/Au7y0NiBrnkliUaxUU7MfF6MfJU
6zM9mTj4Gbu4R5tb5b+6Q3CgPMMm9Kdjzi/oePlu1LQuCsctb0bBKrq5gn91h8q0
ScTJfYoYMevt5u1QE0G5oL3mQAinUQ==
=o7y1
-----END PGP SIGNATURE-----

--KbGHBWGA+KCN6s9I--

