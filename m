Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1C6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH/RNGwsGxAQ5onQ4CWDXuDU973vpIbBVYO78gN0lAk=; b=JhKjVndGd+b6f8UL1OC2HcTr+Y
	PddBBlofAu3tuqt5O6GbXDZqdIhOzkSYyMLnZLtCGYnOnhSyL/UR0s/S7ET4Y20xHvT6Dd+gVBbtO
	lDw+5lSGXwPHdXR4AGLW17XDULCT4hL5ZFRNOUDdBW9rBc33ta4FeWSucWGWLPJR7VgGHpD4BV85z
	a7eZ/0aj5Gj8gFw3X5xlhlvLPIGu63p54X1tBuSxFvwmLUlNpxgLv1mBrQXeJAOzu6uX7tKe1cGPN
	nxFPsBqG8r7QksrErO9R80nlZkl4VnXQ1klaw/ADUYBQ9xio7banlFj61ZiI8fer6zhg+LWSDkqG1
	O/WX6aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfTe-0000000FUGQ-3j6T;
	Wed, 06 Aug 2025 14:50:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfMo-0000000FTNg-1FWM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:43:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso541229f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754491424; x=1755096224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VH/RNGwsGxAQ5onQ4CWDXuDU973vpIbBVYO78gN0lAk=;
        b=KGVAYpPKwSlK0bqKOzi2wa8GNgU/oAbIdL72l+3nMWXWDhBh4bZc+dKreZSx69/vLS
         q6jO1dJSKlnfX+RtQ07lw/TXjYIeXf4Y750h2AHb9QwLMu/2VyzX3N+7u2JseoEIkP3l
         wo1wXQlBQ8AN5HqgX0nvRzpoDKqlZKIKgLW6iaxFBf6iRZuOSSosbgURsGKZWTtADNvC
         MG0UAIrwK7s1F+Kde1lLQP1AFq+wnhldq+o6nZq4jHuAkSSk1z6hWw69GjvNZOeJCmRl
         kMoJe5uMo9c+M0LuWXRQfD3ie4RncuRbWAUmDp9r08s2IgLYQWPkCqBitOhRSPF8/t8y
         27ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491424; x=1755096224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH/RNGwsGxAQ5onQ4CWDXuDU973vpIbBVYO78gN0lAk=;
        b=Pn4UwOq4nCNiDZIO6edo9Zdb6FqAH02mj8QDSqOkSVGcdqpKgY7qgLqa7tWySA4HXQ
         qpb0M2ebGtQGAel7ZhX0ZXnTqT+0+3lKWH4feE2qPuW35N+6gCPxfoX3I8IkFU3O1Wa3
         vyBVg6MoJOnof9BCSg97OfTOrZ0gdWXImVavSxlvDZELDP0ebQoTLjc7nGtiLmdq4TwL
         W9e3wii8wzbtQ3bJyblEVZZzVdAXAN29GdhjJNBeKFN3G71v1vnZ6nFkABowyuhalher
         UyKZ5RBp0zXq4EXBMzO7AwZbvjDY5eKaR6knq0XU4t6C+SSdRJhukg2FIOoBoik02TNA
         noDA==
X-Forwarded-Encrypted: i=1; AJvYcCVmC/o9E6NAr/454F9dChkW0RO1Pl81PsQcHefNnUBtynwDV1X6EKt+ZlSIZM4+cm/gltD0sVkOrQK+dir7zaJN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw34d3gwVLJ6xjXlAGmOR2UYXZJ50SSxhJQr8CoaHI/lW1ImxX
	3ZfttkYI6X2eDGxW3BnqWoTvT6bafcQmxKkuY40fBCw5nGI6mUIpWVZ6BAr+KXa7nHY=
X-Gm-Gg: ASbGnctKB1yqxMyncb9Cv6aBXMA3MY2VTWshr00CSz1yQWCtvRLhWY1T6nHfx1f+vtC
	YVWPSVajNJSDoJehsU118zt9LAzTFRATJJS1KiWZbxUG+h+PkiVWrV+gVaRY+HQ3rfuZGwfhmGJ
	ZtIHuspXtkM6do8NnGTYgsTWixWkOPoU8vTek+HXFvcUP4idlMSMFKZq/Ds8gHujHcOzgQN+xCH
	uWgQIq+QKsLmwkezOnflZZR4o0TIQFw6dxkNnN5ajsb8K9rD48KA9ShAWD6iv1GdkX1n5O08g0Y
	Z1UV9nTqdLsiV6mdDUoJutZUBwA2BQjw+D4WSiWHjrII5rT/CBOrxKSpwk0Jg396/uhhClDDiyA
	CtvZDR2e7IgLWzDwf/z5RyvCp6bwUsshjL0L6yZQD3bWwYHMIaUMwz6KZKh9cg7sA
X-Google-Smtp-Source: AGHT+IEjopSKCdy7U8FKkZXAjb3CuQDXRTKLcweLWBxM8N+4unfyWADRxJ/f8jD1TFxZal7semg4Og==
X-Received: by 2002:a05:6000:2c11:b0:3b7:8f3b:1726 with SMTP id ffacd0b85a97d-3b8f430c2f7mr2812824f8f.7.1754491424474;
        Wed, 06 Aug 2025 07:43:44 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3ac093sm24451789f8f.9.2025.08.06.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:43:43 -0700 (PDT)
Date: Wed, 6 Aug 2025 16:43:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 0/8] pwm: mediatek: Convert to waveform API
Message-ID: <dwycjujhxtxgjyjpfsgm6xttrgcskdobtc7dw5sts2fuutcwxi@5v7ekobsjojv>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdu3m3k3aua2dak5"
Content-Disposition: inline
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_074346_581712_AE2DC9D4 
X-CRM114-Status: GOOD (  23.02  )
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


--gdu3m3k3aua2dak5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/8] pwm: mediatek: Convert to waveform API
MIME-Version: 1.0

Hello,

On Fri, Jul 25, 2025 at 05:45:04PM +0200, Uwe Kleine-K=F6nig wrote:
> here comes v2 of my effort to convert the pwm-mediatek driver to the new
> waveform API. Changes since (implicit) v1 (available at
> https://lore.kernel.org/linux-pwm/cover.1751994509.git.u.kleine-koenig@ba=
ylibre.com/):
>=20
>  - Rebase on top of the latest fix for period and duty setting
>    (https://lore.kernel.org/linux-pwm/20250724210041.2513590-2-u.kleine-k=
oenig@baylibre.com/)
>=20
>  - Don't report a disabled PWM when the PWM is disabled. Though that
>    seems counter intuitive, this is the only way to allow the consumer
>    to query the minimal period. This wasn't necessary in v1 because back
>    then the driver claimed to provide a non-disabled setting for
>    duty_cycle=3D0 .
>=20
> As before the patches in the middle don't serve a functional purpose
> because the last patch removes the changes again. Still I consider it
> useful because it reduces the last patch to what is needed in such a
> conversion.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (8):
>   pwm: mediatek: Simplify representation of channel offsets
>   pwm: mediatek: Introduce and use a few more register defines
>   pwm: mediatek: Rework parameters for clk helper function
>   pwm: mediatek: Initialize clks when the hardware is enabled at probe
>     time
>   pwm: mediatek: Implement .get_state() callback
>   pwm: mediatek: Fix various issues in the .apply() callback
>   pwm: mediatek: Lock and cache clock rate
>   pwm: mediatek: Convert to waveform API

i pushed the first 7 patches to pwm/for-nexxt now. I found a twist in
the conversion to the waveform APIs that I first want to think about a
bit more. The problem is that a setting with a small duty cycle now
reports the PWM as disabled. While this is technically correct,
this isn't helpful to let the consumer find the smallest possible
period.

Will followup when I left the current rabbit hole.

Best regards
Uwe

--gdu3m3k3aua2dak5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiTahsACgkQj4D7WH0S
/k5qWQf9GMIt2sdEo77P7lLjheoo6iqKh+5H9p8KulcNmovIksZ/n06236dor+ch
JNG9DV2LJVxV9XOTHD43lXGOS3BnovK0qAyCnF+iQgLd+6Bbx/WpQfhHn0PieqXy
5jCWDAWc8L8TALhfqb7PssQlScPdTS+PHj0lhDiAMWTuXshENDmO6kKB/dHT5aln
E/trUXgP9EScJZZWpcyYspwFSGcQqaoM5Z9h1IZZOA8J4+F/epjR7AQ9sdaCQz9a
+WJygPOPYCRydbojXrekRPA+6c3MphrSXKKR+HS8cOFbG9SlwMRc9DyXTagZ6ehR
ZkCGiMh3Gfsr5CXjFuiI/Q+lmeKvug==
=aEYh
-----END PGP SIGNATURE-----

--gdu3m3k3aua2dak5--

