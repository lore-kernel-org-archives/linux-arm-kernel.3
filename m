Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7804DEB7EB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6thk8aDkO3+RFrMj6Zn7+L4aByacKorBxGcYucUwVU=; b=sFom2itU8zr+YdTOfCzdT49q+u
	wsxx0Dapq08k2adUleg37RFw9jdEJLWrIf2pkJYOYmXP0Jqk7fu1EPExAM4fpVEDS1zeFQT5aDVlD
	OkoPtlbHZto6X9czTMAeZilLNTnWbuGKLUfHOlr8Z07TKPdMho4w4TR5uSSL4WXgPfEz0ZaQ8ckJJ
	ZQNJQAJsrkso844/Lq3h+8GJ9AJMSXVmRlP4d438soU/IX184croGHi7rdM/SUAc1dnXMoNZLtVu2
	Jn90iFoQkDfR6ANo3jRkdQ3+nejayAJJnDZB/DF+0VBaIC1ceLSwob3738nnZ9iCDgzVQIoycMFr+
	ZzZoBC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkKO-0000000H5Ay-3VFM;
	Wed, 04 Mar 2026 11:23:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkKM-0000000H5A5-1CUD;
	Wed, 04 Mar 2026 11:23:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7540B4423F;
	Wed,  4 Mar 2026 11:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458E1C19423;
	Wed,  4 Mar 2026 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772623421;
	bh=h9cK7pBF4PrYZeuQA4C5C9xLaF0GsLQIP8AyKutBfBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWQyvxcVOI9I/fIn34XDL82Wiv/j9A/0CO+HIzbod1hKepstSs1YL1ATVeJEuknoO
	 G1E4RF2B/MFABg8S/0HhAy7IvbBvPtrGcibTxXxqkZQ7xBDxvBJC+yaoeOlcsC6Ee+
	 ndfD62jjuB1WSwU9SVxtgMsERFivVEvg8KyfWfUpQ6HpK0FeTcVeHuK+vhjHF+mHdR
	 7iIAPaFKpFinAHvRkXItep1op8e6chjhnFmk+4fHsAdkX3yQkRo/ZVscYgN2TuR0Cp
	 cg3k1KseLgnQfcRh46WMlVr7dOefgQP+hRWN1QSYHzDduu6zyCnUwr/opYJn6h1XZx
	 PclxjlJCDXevA==
Date: Wed, 4 Mar 2026 11:23:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 05/14] regulator: drop unneeded dependencies on OF_GPIO
Message-ID: <31c9910c-8157-40bb-9128-9db34704d637@sirena.org.uk>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-5-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zVeDWCP0gn6RDW1P"
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-5-d597916e79e7@oss.qualcomm.com>
X-Cookie: Take it easy, we're in a hurry.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_032342_361886_ED140D66 
X-CRM114-Status: GOOD (  15.08  )
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


--zVeDWCP0gn6RDW1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2026 at 10:02:26AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.

> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d10b6f9243d51574a9ac662b93d4678cd7d94a4f..10e64e3ffb1f5f60e0b62b16ab513f002a42fa1f 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1232,7 +1232,6 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on I2C
> -	depends on OF_GPIO
>  	select REGMAP_I2C
>  	help
>  	  This driver supports ATTINY regulator on the Raspberry Pi 7-inch

This is a depends rather than a select, though it's fairly redundant
with the arch:

Acked-by: Mark Brown <broonie@kernel.org>

--zVeDWCP0gn6RDW1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmoFjAACgkQJNaLcl1U
h9CHUQf+OxkRqulw7IQRBWvsy5b7fUXsBVsAfKiGM5xDUpiNuKd4S1A6tLOnAn45
3I8XeQGoX3PGjjNCIQsc3+Tsta1x1lKnTINxC1oxhPg4vuQF8O96ExfK5rw2SbNu
wIgQOz00KrJnhI/QkBNPEUhw2mWXzQuqkwd4ljTlDlUXJCwgc0bWAcR6W7LWq9bW
YeqQrGM7BM83jHyDJAFQsnVLeA6gQM+fV/LkZSTwcNYN3SMz3Csdy3wlcHOEpkbE
Tl7qsVyLstyKIr9F6wUeYRPOH2hl9/Oi9cTvCYBRu1CK/zLsDPyczcWKF0yhfMaO
Q+nIB9oU+/dYWlYxHma+RHEckx9A8A==
=6Y+O
-----END PGP SIGNATURE-----

--zVeDWCP0gn6RDW1P--

