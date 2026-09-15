Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38AEC88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=; b=Y/GqGk6FzrG6dyarybk8yeitgw
	N6NgjJ17oZJMnpyEiF/5qAfwCA/HF3zHaKYZxB4w7Km7cCGw26UlwIhjBJZW9bjWOOSZzYNMAsKPb
	jtQAAaEebguArCgB624QFnh54yQkvRuz1i7ot9uraDPyGmuUQBmrqMzG9w4hyIntD0dUth4snsjiy
	O0F3KQA9qzztSSMzG7q66vs518wLNNvsYz0DXo8hyaKUDA5AdvSp6bs3GCqrN5A9QntUgI+pXKqow
	e8b7BqsM8Gbkb8uvuOhG+5IHXduBI3VDcR8vC6U8GDD3tmWUomZPObqnp9JwhSY9dfLRgWRIPZaZG
	hYANF01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T92-00000006ilx-2XjR;
	Tue, 15 Sep 2026 13:24:20 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T8z-00000006ilB-1OXU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:24:19 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so15412035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789478655; x=1790083455; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
        b=QgXWGxHGYO9tBse0R1egqnUpo04EVtJd/tD9MFEyCvAfjtbWfYvWklATEbxUNdymAD
         F4uj9FlANVwxMsmktryqtUSUQ4AM00bQSu385DUuB9SwMfrw88gTRUSbbuahrMK8jom1
         6HtnKc57xYvZNcXB3XQou1zqlTnUNd7qZFa/IshAN/rbieJZX+niWKQsvr0N2aZOKrSR
         Oikah3Q3SUPwSsBD3+8COLnTY7XMcL743IrbfOqQOaXxDddXgvg3in1Tw0C4nTrWIiCX
         WaRhXLaG5qF66xzgtH0hxBmSJxPOKeogwAFQicfsfw/mYAkKQtTaLLhW8w8FJGHNxGnA
         guIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478655; x=1790083455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
        b=13RX62EzlwVgWnXRbqmP1XM5IFYjPTBP8atUlqvclUJAZQWld6GVBsiErKY5/FdvHP
         Oho/LxEPG3/x8Eod7i5mhmJQPtApeHFsY2CQ1jZt7hxVIEC497DRA/Uj8W8Kiv0bYktS
         JchW1q8eHBg/lNF/kiaRIknifNuqHLTlpVEj+pg/SWvwWPMqMJkSYurRofYbiCOpRMJI
         SjQUFTAJrE8AEdMLAaI6NB0LfZBzoMrmXvzFCKcUCIUYOECZrUU2hq+qj3WIOwnaDGl+
         ntEFc4W0vNR8i0Qb5n/t2Iyc7TjHlaqhvOQ13N9LNPb5n5XY7n9TN7BsViXSqukIcG22
         C1EA==
X-Forwarded-Encrypted: i=1; AKwUvBwi0bsv+fguHAHfSj6ST7Kw3sPU10HLLouT9MS8KyUuuKeQ+Noz8dXGMsf4p4t2nHyRdAvijYygGGXSEoEFUbm4@lists.infradead.org
X-Gm-Message-State: AFuF++muY68wFaoXkD+TtuDA09gFk9x+ilObfXXEmkV7sGdE+ruFZ0Ys
	1phNyc+dZZ5lZhvKO+3Ws6n+Y08/+PHiyT5z6IiGInna5QZCbOaybvt17s4y6S9bA/Q=
X-Gm-Gg: AYBFou2J4EdHfHWyNoRFhVK+DMrOE6a/Si0s7UP0bu/JQulzBFpRhInMrMa+GeHwNdy
	jR2V3gkPTM3Ty0pHJp7R0fHNocT3MrKLh5CtsFeH7st8Kadgnpru4OY5w7ihW2uQFPInQcbFbE8
	+5KzX+5KP2eFUEKkdLkhhGF6zN0wbfYn7/LdECZV0WRCLFZ8m2Fzhqtn+2UBQxu4O4qB4aW7FlJ
	uHbxmR+Ho7WEi4Sfp2gJVyESP43jlwAKI6/UEadRajd5X6lyBx0yp3qRs3qybDYf2Z9qzPD1h8p
	4s9nzAqGxY+Dw3aHuOpYsmQ/YxqDcBS+H9Vgn9ks25KhlNHtXfjhrnPfatwy4orVZ5QPAtM9+1L
	qfbCPi364tRtKLDW/J9tOhGvuZC0ZGVmoABz/7alGGB0Uu7ewFt9XW6rwrOi8asw1fJRz2s8Gfa
	UrZBKHhdUaVKen6qBtKxqQpZkNlnqAxhWfD6n+JYYeoid+3cVw5fjCtQDyMYYeAAw63okDs0dvV
	Cqb8OC8GlqeePK9l1GIHc8jLBoPJRP+ilI9x16Gtt/N7R0jFnWFmHJF1fV0P+Z7RCZ66RH0
X-Received: by 2002:a05:600c:c059:20b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49e817a0dccmr16959515e9.8.1789478655048;
        Tue, 15 Sep 2026 06:24:15 -0700 (PDT)
Received: from localhost (p200300f65f19a904c2a77868dcbef2f0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c2a7:7868:dcbe:f2f0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e7ef8b519sm59911725e9.14.2026.09.15.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:24:13 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:24:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/15] clk: ambarella: add CV75 RCT clock controller
Message-ID: <aqlGg09RrztSwoOz@monoceros>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnlmyx6x4vbf5kjt"
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_062417_391664_91CD8659 
X-CRM114-Status: GOOD (  14.08  )
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


--xnlmyx6x4vbf5kjt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/15] clk: ambarella: add CV75 RCT clock controller
MIME-Version: 1.0

On Tue, Sep 15, 2026 at 07:15:37PM +0800, Long Zhao wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. That's a hog for
unneeded dependencies and I'm working on getting rid of it.

> [...]
> +#include <linux/platform_device.h>

You can rely on <linux/platform_device.h> to pull in the definition of
of_device_id. (If you want to go full iwyu, include
<linux/device-id/of.h> instead.)

Best regards
Uwe

--xnlmyx6x4vbf5kjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqpRvkACgkQj4D7WH0S
/k5CVAgAlhnKI89Q33xfBbRky4EOs4jdP9vW1frAnR1bLzOUf6Brat/wp0lHDYiH
dfHIXOR7HFn85CjFb+Nt4HZmCZvg9IWa3FZUojS/qPfNofim2sdbViVVUyrwBouC
RlC5OARb4l9uiJrgaJO2AMv7yNoI78GUthqDgXrDRgQoxTQgWISpDddD1O6XPI7J
ZTQ08V7I4M3DOPziACXuOd0xr5qUrLO/25fcNlQA8pjPzY4u2tAGBeF9yDFtfQT5
U1/YP9Y7TjOF/IfD3GOzrFJ0uAE6tHNXV7Xvi8Qz3CJXQkiW6noaXsS77gf9XaiE
ZaeuPEwNDSCEJvnkBG9Em1YObYs18w==
=V85c
-----END PGP SIGNATURE-----

--xnlmyx6x4vbf5kjt--

