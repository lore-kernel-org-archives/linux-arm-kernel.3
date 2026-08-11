Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1CFC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHv35RE6bkUtOImGbmK9Yom6+E0SECjA/P0mDcNGrZY=; b=qDbH6Q2lEyrleskZK7lxCkfG7d
	G40oYiRnh3tAcxU8wG1M0tffLEZEaVqxanj6M5E0vqdH/0C9tu7e4/e0+h+Awuy3Hvx/wuwf1nUMT
	tw3C/ERgp0cyWgTkEgVn3VK/sp4AZbU+nzv1aDvkTY3bwdyjg7cLsnI6D0C13zjjs647i8b0DxIm2
	fFB4ZAeyqec7++oa6ZudWKu1k/K/pcdbEgopxDNAfIOr6sMmRZFXoRveKXqMdE+hHP9Mu5OzqOnG3
	a27U1S9FcG83t2/i/P7NHI509ZFuWaRNiD12CoBDzuuywfWyNa3828d3g+pwn6wwcvH/EiEaE3vhl
	37JS51dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnWv-0000000EDzV-1qFh;
	Tue, 11 Aug 2026 14:32:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnWr-0000000EDyP-3S1a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:32:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b966dd74so20241635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786458751; x=1787063551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHv35RE6bkUtOImGbmK9Yom6+E0SECjA/P0mDcNGrZY=;
        b=JdBMibZY/rrnp6+LCZeX9QlXHw5BTQWaDRcP1nauUi/0DapcWvAbFQz0y//mZj63DU
         QZGRkaMrYAb+yb1f8wgQQ9fc5jcW+T1ZFwNrq28I+k5njpakaMvOdFnvYkpRv1KGS60s
         l+2wuoQnXXHxM5Xw8y+8lc7rMnuAXn01Lux+ALO+PSexG66NYVs1W9AjqGvBpZJ8hREv
         wGYTcL+AG1FaWVCe9ZkJrxlvcJ6lLjaIhqsiXG0AOD+ff2fmCWt3W8jEp/yz/DSofYvW
         W9s7vew1G2Uo5i5GlM9mMxO0YaYUmFZc+gO/FAYjEVhBbrExqchAzLOEpDZkfw+b8Ze6
         7Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458751; x=1787063551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHv35RE6bkUtOImGbmK9Yom6+E0SECjA/P0mDcNGrZY=;
        b=Hd0PREb/y1pqA8Jzmh3CncUCYtvsX/Ls7wULc+NrJOJm8ViWzKeRihe669nPIXIl7x
         KpKRBz1ayO1q1aSu0HU5/9NKfou9JlMd4wwx9rVilIPVBJVdR4Vr8ewX29pP7IYP5unR
         WuAiE7nElSGbXLx1JFIMp8XrSWjpuyw1frk8NyAEL7kl0AiVym+LeMmM6GiJKUvWKGWK
         HqFGDOQAp3TXOn15oJcy1yjoBmoD8ceTicboFPEyoUFX0iumAvHlaC18x6hiAmwr+u0Z
         tAf3Gy2qR7QgYy0Xe2ZfYDxh6reb6NwOTuzqDbtG4UjjnNHInzkhDrxNO/u8LL3cidYm
         mbAg==
X-Forwarded-Encrypted: i=1; AHgh+RrefsOXUNj1ccTYNSqGPYh0IAwDW+QMZ1kLmc92LWEJehwNX0AwB+TQSt0RAv0RcObep+cdJXQYWQ/BlbFj3gGw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/rDz89BOZKoNUP5ioNNR2b1aXUhQjYlEi3jwcQ5AwotACmXI7
	44tDV6eXVbbwOPg0kKre1HwWTX/XQ/J3lR05Ok21cAht9aOnc+0a+jtmOfGeq9TPodY=
X-Gm-Gg: AR+sD126yiNj0x7gdVyrLpE8VLMo8lQCbYJ6JzL215nfTqTkgRDIlvXzsbmtUSCSCqy
	ptyJU9W6P5SzJSiKCTuddAjjPovH+1WaTEGQtZ1mwe1I02YzRkJla7rEnQCA2vo9VwkAPu2hMe3
	6T+B4GXOV8GYceG4rGlP+7MwAL67DDqTgGtAEZZ/rvPKK5RtU/Rk8LlH9QROYVbQR+Q91eBkw7l
	WgLoOWAPS0KWlr5/qbAlarJiBj8Unb4FAXapdLftfZgzh6/dJfUrqJIUE/soqyY/Pn1F/Eu53Dq
	JpjN8TdckSjbf9g20SNOyI3BYjWKiFGWCeyNU9Mh5FeN2CnlWDG6XltTA+BVdTTn8BPhioto45H
	4poPfoH9jUYa7ps0P0bbC/Wa/Y2T+PsRARZZ0h5yes+ln/h8cmHsqk4evbY9zZpmLgIxUtxB/n9
	wYNhb5lABL6LvqrXqGCB0EpBogYmBjzj7xDCdQwRUy62iS/uy7ujDO6Xwiisp9DNtqc9L4vXnkY
	MVN1xTC9yF/UvaQK6yJxYIOacY8KfgvPXcbS5a2Ye/rLUINxpNb
X-Received: by 2002:a05:600c:45d5:b0:499:740c:3428 with SMTP id 5b1f17b1804b1-49978446b35mr52841945e9.8.1786458751348;
        Tue, 11 Aug 2026 07:32:31 -0700 (PDT)
Received: from localhost (p200300f65f017104853c3975fdcddd6f.dip0.t-ipconnect.de. [2003:f6:5f01:7104:853c:3975:fdcd:dd6f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499788f13cbsm60543725e9.9.2026.08.11.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:32:30 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:32:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/2] perf: Add Raspberry Pi BCM2835 AXI PMU driver
Message-ID: <ansxmIcZnC9G6QN8@monoceros>
References: <20260811083828.2057695-1-irogers@google.com>
 <20260811083828.2057695-2-irogers@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6zicwwmtxhswzvi"
Content-Disposition: inline
In-Reply-To: <20260811083828.2057695-2-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_073233_869867_DAABA8C9 
X-CRM114-Status: GOOD (  15.17  )
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


--v6zicwwmtxhswzvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 1/2] perf: Add Raspberry Pi BCM2835 AXI PMU driver
MIME-Version: 1.0

Hello,

On Tue, Aug 11, 2026 at 01:38:26AM -0700, Ian Rogers wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide the definition of
of_device_id and drop <linux/mod_devicetable.h>. The latter will go away
soon.

> +/* Devices matching this driver in Device Tree */
> +static const struct of_device_id rpi_axi_pmu_match[] = {
> +	{
> +		.compatible = "brcm,bcm2835-axiperf",
> +		.data = (void *)CHIP_BCM2835,
> +	},
> +	{
> +		.compatible = "brcm,bcm2711-axiperf",
> +		.data = (void *)CHIP_BCM2835,
> +	},
> +	{},

Please use

	{ }

as list terminator (that is, add a space and drop the comma).

Also if the data is the same for all variants, maybe better drop the
assigment to .data and hardcode the value accordingly.

> +};
> +
> +MODULE_DEVICE_TABLE(of, rpi_axi_pmu_match);

Usually there is no empty line between the device_id struct and the
MODULE_DEVICE_TABLE macro.


--v6zicwwmtxhswzvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp7MnoACgkQj4D7WH0S
/k7XeggAsjqD6ZSGHh7fLT4aPVs7BB3P+0clSg1PcXCLwXSRHnoaYx6bqyH/8Qt0
7ijosmeazKiJosSTI0Y2Fcv9Q+Jh8Ea23UKmlrbEq7IQlFB6o48YchhKSW0vl/KQ
fHoXhe8mwuQyey/HX9NkiN0jysztfEaSW/w3XQYJ/68rZZbKqidb2LFM1CB4ZXkO
K0zPSSZztOuQnwef12ELvWi5J9pgBaeSuu/P5V8XSwLXLP2iYOU3kgyM6iHWKrQ7
5C4K9hBWBuX72UCoZQ6NlLPRVNpmRyC3Uf2YHFlqSwFgz+3p/cgGfAYkB6RsQ542
HJCKnzijvQbI1BVGQWwauSIZrUyLTw==
=6EO1
-----END PGP SIGNATURE-----

--v6zicwwmtxhswzvi--

