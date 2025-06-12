Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB8AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anKlnwbFl0i8atiPf5c4Ks2L7I/qYyoFEOqCpl8Xjz4=; b=tf9RCz40N4y/PTUWakw64Xgo53
	9hiU9iGqJkgJ1US147bUAD/lD8mI6DiEnvrIheMn66pPalFnj3nb0EetMyRaaG5YoETIB4oWzdw5f
	HD4gUpZwHQItx5ZdGOILxKxi70fnpZwn+S69jbxECKSqi5saAWLjUDwUpnvMFbLsYwBR6t+ouKqw/
	aEanqheDodhJ2VvWVDvg9VycmVIwsNcnKjfd6uFmd42kJ9rGsS0P0r5tkVFe/TIPVFJ7bhd9DvFbD
	QuEOpQ7NaBo8u4oBse+a8Csub9VtHI6OqmkE/L4yAUnlH6uIyFEZG1KjqZVKBqfGXhTCv2M2hvhil
	Gf6B7q1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhr1-0000000DP8f-39m8;
	Thu, 12 Jun 2025 13:20:27 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgnC-0000000DDTe-0yjC;
	Thu, 12 Jun 2025 12:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749730279; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gLVUSH8whkjznJ84HhEKxxnjU2XuDwX04WtVl7Ke0k/VtxuyHepvYyZFEsDsuRxdsOR+mZGQaf6prN0Jl3RFazK5tsm20vUPJNrfC7uMH7EkaAb8x+J6/uAl/jUVupirBlfKqcEg9lOnbR3b7+HuupT2MjpmNEg4RkgTVsrnDEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749730279; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=anKlnwbFl0i8atiPf5c4Ks2L7I/qYyoFEOqCpl8Xjz4=; 
	b=NnYk+ho5QsNnUw/GyWrBWAlNSFdprVwt/SMpMEjygvo543BdEKRBHtfoDB0IlobqSRFj3aQKnfuW61HRwi3mlbyo7MjKlqvXIxcbmt1jg1nM3R/1ZxeziAGckm4SGc4esonsJ/LIuXqmUTX6AGNZ7pwSisvbKzWfbHfGMTWV5H8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749730279;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=anKlnwbFl0i8atiPf5c4Ks2L7I/qYyoFEOqCpl8Xjz4=;
	b=SK7OXUzcTO6J2OvgkAoNUrfYDQNfzeYE74UjS+nOX7vgUkpRNbgyTF8jQkg2hh0D
	dUAV/oN8qsLxpnK+Y+fEssRjHR7B+gVr7b2h2PGccmdr2X9JotCuSJJ08Fv1WSCt0fN
	YQykWtOBwsZmWFYSR+CE0ujPPquYI14ZwNERJFwc=
Received: by mx.zohomail.com with SMTPS id 1749730276781981.6042234328434;
	Thu, 12 Jun 2025 05:11:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: David Lechner <dlechner@baylibre.com>, linux-rockchip@lists.infradead.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?B?Sm/Do28gUGF1bG8gR29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>,
 Leonard =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>,
 Roan van Dijk <roan@protonic.nl>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 =?UTF-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 Andreas Klinger <ak@it-klinger.de>,
 Petre Rodan <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Date: Thu, 12 Jun 2025 14:11:08 +0200
Message-ID: <2243943.irdbgypaU6@workhorse>
In-Reply-To: <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_051226_351738_F0C4E621 
X-CRM114-Status: GOOD (  25.02  )
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

Hello,

I thought I'd chime in as someone uninvolved because this seemed
interesting.

On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Machek wrote:
> Hi!
> 
> > Jonathan mentioned recently that he would like to get away from using
> > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > have it on good authority that initializing a struct or array with = { }
> > is the preferred way to do this in the kernel [1]. So here is a series
> > to take care of that.
> 
> 1) Is it worth the churn?
> 
> 2) Will this fail to initialize padding with some obscure compiler?

as of right now, the only two C compilers that are supported are
GCC >= 8.1, and Clang >= 13.0.1. If anyone even manages to get the kernel
to finish a build with something else, I think the compiler not
implementing the C standard correctly is the least of their worries.

My bigger worry is that = { } is only guaranteed to be as correct as
memset on C23, and the kernel's standard right now is C11. For that
reason alone, I don't think memset should be moved away from for now,
unless someone can verify that every GCC release >= 8.1 and every
Clang release >= 13.0.1 does the right thing here regardless.

> 
> 3) Why do you believe that {} is the preffered way? All we have is
> Kees' email that explains that = {} maybe works in configs he tested.

= { } is guaranteed to work in C23, as per the standard, but again we're
not on C23.

The reason to prefer this is likely that it's easier for static analysis
to see the struct as initialised, but that's me making assumptions here.

A more human-centric argument is that once we're on a C standards version
where = { } is guaranteed to be correct, then = { } is much more obviously
correct to a reader than a memset with a value and a size somewhere later
in the code. This argument is evident from the number of patches in this
series where the memset and the declaration are not in the same hunk.
That's the kind of stuff that keeps me awake at night, sweating profusely.

Kind regards,
Nicolas Frattaroli

> 
> BR,
> 								Pavel
> 
> > [1]:
> > https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
> 
> 
> 
> > ---
> > David Lechner (28):
> >       iio: accel: adxl372: use = { } instead of memset()
> >       iio: accel: msa311: use = { } instead of memset()
> >       iio: adc: dln2-adc: use = { } instead of memset()
> >       iio: adc: mt6360-adc: use = { } instead of memset()
> >       iio: adc: rockchip_saradc: use = { } instead of memset()
> >       iio: adc: rtq6056: use = { } instead of memset()
> >       iio: adc: stm32-adc: use = { } instead of memset()
> >       iio: adc: ti-ads1015: use = { } instead of memset()
> >       iio: adc: ti-ads1119: use = { } instead of memset()
> >       iio: adc: ti-lmp92064: use = { } instead of memset()
> >       iio: adc: ti-tsc2046: use = { } instead of memset()
> >       iio: chemical: scd4x: use = { } instead of memset()
> >       iio: chemical: scd30: use = { } instead of memset()
> >       iio: chemical: sunrise_co2: use = { } instead of memset()
> >       iio: dac: ad3552r: use = { } instead of memset()
> >       iio: imu: inv_icm42600: use = { } instead of memset()
> >       iio: imu: inv_mpu6050: use = { } instead of memset()
> >       iio: light: bh1745: use = { } instead of memset()
> >       iio: light: ltr501: use = { } instead of memset()
> >       iio: light: opt4060: use = { } instead of memset()
> >       iio: light: veml6030: use = { } instead of memset()
> >       iio: magnetometer: af8133j: use = { } instead of memset()
> >       iio: pressure: bmp280: use = { } instead of memset()
> >       iio: pressure: mpl3115: use = { } instead of memset()
> >       iio: pressure: mprls0025pa: use = { } instead of memset()
> >       iio: pressure: zpa2326: use = { } instead of memset()
> >       iio: proximity: irsd200: use = { } instead of memset()
> >       iio: temperature: tmp006: use = { } instead of memset()
> > 
> >  drivers/iio/accel/adxl372.c                       | 3 +--
> >  drivers/iio/accel/msa311.c                        | 4 +---
> >  drivers/iio/adc/dln2-adc.c                        | 4 +---
> >  drivers/iio/adc/mt6360-adc.c                      | 3 +--
> >  drivers/iio/adc/rockchip_saradc.c                 | 4 +---
> >  drivers/iio/adc/rtq6056.c                         | 4 +---
> >  drivers/iio/adc/stm32-adc.c                       | 3 +--
> >  drivers/iio/adc/ti-ads1015.c                      | 4 +---
> >  drivers/iio/adc/ti-ads1119.c                      | 4 +---
> >  drivers/iio/adc/ti-lmp92064.c                     | 4 +---
> >  drivers/iio/adc/ti-tsc2046.c                      | 3 +--
> >  drivers/iio/chemical/scd30_core.c                 | 3 +--
> >  drivers/iio/chemical/scd4x.c                      | 3 +--
> >  drivers/iio/chemical/sunrise_co2.c                | 6 ++----
> >  drivers/iio/dac/ad3552r.c                         | 3 +--
> >  drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
> >  drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
> >  drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c        | 4 +---
> >  drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c        | 6 ++----
> >  drivers/iio/light/bh1745.c                        | 4 +---
> >  drivers/iio/light/ltr501.c                        | 4 +---
> >  drivers/iio/light/opt4060.c                       | 4 +---
> >  drivers/iio/light/veml6030.c                      | 4 +---
> >  drivers/iio/magnetometer/af8133j.c                | 4 +---
> >  drivers/iio/pressure/bmp280-core.c                | 5 +----
> >  drivers/iio/pressure/mpl3115.c                    | 3 +--
> >  drivers/iio/pressure/mprls0025pa_i2c.c            | 5 +----
> >  drivers/iio/pressure/zpa2326.c                    | 4 +---
> >  drivers/iio/proximity/irsd200.c                   | 3 +--
> >  drivers/iio/temperature/tmp006.c                  | 4 +---
> >  30 files changed, 34 insertions(+), 85 deletions(-)
> > ---
> > base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
> > change-id: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb
> > 
> > Best regards,
> 
> 





