Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7322CCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/2p9MvtkqH9Qg/NebfkyrFfV4fKsGJ56PpnL6OBI1E=; b=X0o38WAXg9tAckhIOnvuwLxTgA
	qDW9pS+/w8ImiS3n5A+KCzGij02ngNKun3H0gZevWkkbJ6cHJDIaK/aIZ+HWkvSxshkTEdqC+NlCx
	sO7g3r5Gl4brfjyyyRsT1OlN6gIY997ipMOU78kt0rSjmd7padpAZgjYFotKcOWC64klOLl5QSnXA
	oav7/faN7wybbBr7/li0a8iB+JKS+hpRNE/tPELfSMywEjLZguQJiSJIroZYWZ8IWouhZ+nWjRQjK
	5euMNw6yrVOCE2QW6KNHlwVSXDS53l3bYgJz48iLVfZbTzl4P5G+9ACVC7BiLhvd8wED2gITrNYuz
	MZ1v7drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKAM-00000009si3-0b4o;
	Fri, 24 Oct 2025 15:57:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKAL-00000009shc-0TGu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C13B61260;
	Fri, 24 Oct 2025 15:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2070C4CEFB;
	Fri, 24 Oct 2025 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761321440;
	bh=y/2p9MvtkqH9Qg/NebfkyrFfV4fKsGJ56PpnL6OBI1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2bHIdreGnRexQUR30mWTpCu81eX85MpLWKXCpRNJA98dYcySvdndBlOFYcd9R45B
	 5uJ8t6oVTJ43DbfKwnzVYYo3XV0xRgQyZJxn5mVEGJKbC3n3BActAFsydjWB/+Flcm
	 sXkyMrwiTj7QXwm5OgjJbT1j6dr3MSScxJKGooujQwolNJHYRlEPpESlvJlke6OvC9
	 GALaeY+y32DCBsWTZKer7g3HHgHEaOQLN/0aHr5+z0rDFLj+8LKPDzx5qKhNq5qa0/
	 Kk+Nx8lBV4RKpUM4KV+2mSX8wN4uYbhCUYSzXsNI9TgaX64KCwCtvoaUkPNV2RDQSY
	 Gj7BWMdcEfraA==
Date: Fri, 24 Oct 2025 16:57:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 10/10] regulator: make the subsystem aware of shared
 GPIOs
Message-ID: <aPuh16uHcJieSaS1@finisterre.sirena.org.uk>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-10-d34aa1fbdf06@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KSzs8cR3CPCR8pfX"
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-10-d34aa1fbdf06@linaro.org>
X-Cookie: If in doubt, mumble.
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


--KSzs8cR3CPCR8pfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:10:49PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> GPIOLIB is now aware of shared GPIOs and - for platforms where access to
> such pins is managed internally - we don't need to keep track of the
> enable count.
>=20
> Once all users in the kernel switch to using the new mechanism, we'll be
> able to drop the internal counting of users from the regulator code.

Acked-by: Mark Brown <broonie@kernel.org>

--KSzs8cR3CPCR8pfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj7odYACgkQJNaLcl1U
h9Czzgf/UuNoMQPXZdBLbbDRbzUtokhQvJnF5147crhjmrifiVMNR1IjkSYrfUN0
Z6goll2IBjf8KdgoVDKTun9xYgsWOhd9hApxnL6YyNhvrcRm9YpIc2MmUOIa0Lkz
JeOQVo3S7NXfWJhdcmtGJKO/LzMPpsUlLC5r98dDBs0ij+cUr9oNje4BX3w7pJrH
PJPz9EkboVEn5Se18EiLClDP68bWgKqhLH3ZYLd9pMVR457ruZRd1JG6AmgQ/igX
A9dKEPqz8VPR+zzyw7qcyCHu3to+EOs2jz/TkWxUcDFEDsXA/Ol/igj1OhC6HFax
4quIU27MOKSF9e92h/qYwhx1JL7Uag==
=5bws
-----END PGP SIGNATURE-----

--KSzs8cR3CPCR8pfX--

