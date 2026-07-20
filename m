Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F75C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67UQJ7a3uyy9lIIeDBQMq6EhlXXk+6uPYM4YYIakLIE=; b=eDemWNF+fQOen14ykMmAA3YCCo
	yHC1gXadpzNCn7XiS3zQ5nTIL4A25B6Swsx/wyBzqVieMLRvYWgZIkjrseOExXTrdPz3/GiO3r17U
	oqd3ip1vIaENrRZN8T/rKB7engAFJBN9DjYyrSsPVWrxdSTvKX4qUaQkQD0bfLkXiXaQFYXaWGY8t
	iNvH5L2872HyeMN8ML3poqu60mgJIcb03hz1JGrgjsKADlaPuZ4uDh79KuOfgaLRd9NudOvO+EmXr
	+HT5PGB/nSkYqI703daVFCvJCWyg4KzwNNwTIgg1HaKMudpHzUcClOzVd6RfJrhBF35ptHDY7/6Zg
	x1n4PMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrda-00000007WSo-0WkR;
	Mon, 20 Jul 2026 17:18:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrdY-00000007WSI-0Rlj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:18:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BC6243574;
	Mon, 20 Jul 2026 17:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628E11F000E9;
	Mon, 20 Jul 2026 17:18:37 +0000 (UTC)
Date: Mon, 20 Jul 2026 18:18:34 +0100
From: Mark Brown <broonie@debian.org>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 2/7] spi: pxa2xx: introduce suspended flag for
 interrupt synchronization
Message-ID: <862b86bb-6c7d-487c-b790-fa5d5a5217b2@sirena.org.uk>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-3-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wDBoPWn34SqK+tZE"
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-3-fourdollars@debian.org>
X-Cookie: Caution: Keep out of reach of children.
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


--wDBoPWn34SqK+tZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 12:21:11AM +0800, Shih-Yuan Lee wrote:
> When a shared interrupt line is used, the interrupt handler ssp_int()
> can be triggered by other devices sharing the line. The handler must
> ensure it does not access the SSP controller registers via MMIO when
> the device is powered down or when its clock is gated; otherwise, it
> will cause PCIe Completion Timeouts and system hangs.

> Currently, ssp_int() guards MMIO access using:
>     if (pm_runtime_suspended(drv_data->ssp->dev)) return IRQ_NONE;

=2E..

> Introduce a custom 'suspended' boolean flag in struct driver_data to
> track the device's suspended state across all PM transitions. Check
> both 'drv_data->suspended' and '!drv_data->clk_enabled' in ssp_int()
> to return IRQ_NONE immediately before any MMIO access is attempted.

>  static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
>  {
>  	if (drv_data->clk_enabled) {
> -		clk_disable_unprepare(drv_data->ssp->clk);
>  		drv_data->clk_enabled =3D false;
> +		clk_disable_unprepare(drv_data->ssp->clk);
>  	}
>  }

It's probably better to avoid extra changes like this, it makes the
patch bigger and a bit harder to review.

> @@ -743,12 +743,12 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
>  	u32 status;
> =20
>  	/*
> -	 * The IRQ might be shared with other peripherals so we must first
> -	 * check that are we RPM suspended or not. If we are we assume that
> -	 * the IRQ was not for us (we shouldn't be RPM suspended when the
> -	 * interrupt is enabled).
> +	 * The IRQ might be shared with other peripherals or trigger during
> +	 * power state transitions. First check if device is suspended or if
> +	 * clock is disabled; if so, return IRQ_NONE immediately to avoid
> +	 * unclocked MMIO reads.
>  	 */
> -	if (pm_runtime_suspended(drv_data->ssp->dev))
> +	if (drv_data->suspended || !drv_data->clk_enabled)
>  		return IRQ_NONE;
> =20
>  	/*

The local flags *must* be racy - I'm not seeing any locking which
protects them, nor anything that stops something else dropping a runtime
PM reference and powering things down after we checked here.  There's a
helper in the power management code pm_runtime_get_if_active() which I
think is what you want here, it'll tell you if the device is runtime
suspended and if the device is active it'll ensure nothing else drops
the last reference while we're running.

--wDBoPWn34SqK+tZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeWGkACgkQJNaLcl1U
h9DXnQf+OfcZGh9JPbb3NhXFSyLk28Jh+30oXYLKXqLn4xgn4eVVdAujTZ8qrw8E
QjDYZ+bW6ZOSHv8mBkYuT9BFEacsoY5qTR7SzK3J9uFYXCQe2uHZ6koKlqwK03eN
mCdCsh5O3UQo8i7PZOb/xYZrFYCeadoHg0KnxWD3PwgfFmqCmZc0BMqIDje5DCPZ
swwdd6N883etfknEBvfM/YCHWqAGEzB4hyCnpZlfPeOtKFCnPjxiiEcvCuC1w/Y3
0t55IWgYL1oHk0jIig8qP6Fed8LCjD1DWzEzDZUg5LjKDiJbydbV5xmnkEZtLBYG
QIdBYcqMmjcwy6cyoNNHYBTTvMbgAA==
=KXgo
-----END PGP SIGNATURE-----

--wDBoPWn34SqK+tZE--

