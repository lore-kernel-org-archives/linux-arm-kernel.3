Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4A1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 20:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5coYYRPMmYyk90hyfQos6Hfk3JtJvsesMjWEHhnPPg=; b=A3flb+n+k7e/e4QhuAcO4DFVol
	rxBpvMMYt/LPIEIdkSAwH/TG3kQdPteinbSJauLv9buQCusv5RMsyxwGayXdWhUHlvhdmRxJ8xeqJ
	nO2DQWJDucH6Y8QZI4EK6T1CR+51iDQb/odNFJEiGWPXoNRtlq7ak/9MfRekbFZ+4muujM52rT+9O
	qvhfrssjRwggDoxSmLUiuLfIppCHMgv+AkoLG/bk3DLONEzhfAGGoe8WdC5Okj4BO5hNbcWwlXT9x
	poTWNLxPoxUpaSKgItKeWRA53v6lK2JqUnyjILXB15I78AwmWJSS5MGp0l6Bc71jqVw67B+xvasN7
	OxtA7Biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyz8L-0000000GefB-034w;
	Sun, 30 Mar 2025 20:19:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyz6Z-0000000GeHH-2gC4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 20:18:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22423adf751so70058545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743365882; x=1743970682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d5coYYRPMmYyk90hyfQos6Hfk3JtJvsesMjWEHhnPPg=;
        b=d+BI09nMlUKCT2iMSTSQpR3Ec+SSFielFOsWwvK9Q0I0DlJeRlVxsIkJPhp8yo5gxN
         rGw4N7aK2Vet85rMhMEX9lLb2y+Vrfj5zjenQkK/4EKo90kjPMzI2XjFj3ToxcmOcaPy
         oW/e7EjMTuZqXwVz9bD6N0oJuh0MxN/90Qs2vNocXWZPS6ope3Y7DyoZAHX18WIaW3Yu
         8OI1BmEjrK32d6hWEJWeOxJZVrxyJQ8msFs5W0Z9Ce1wa5fBpDOQ8U0m9PKUPsxI6XEm
         qnVt7WQOTijqJW0gyYyFpmil587F8Z6MngsqymdXbJW7DykT4M49YY6FUSOpcDGLh3+y
         0pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743365882; x=1743970682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5coYYRPMmYyk90hyfQos6Hfk3JtJvsesMjWEHhnPPg=;
        b=t8yaQuHrkqLSuB6FvFdtbcGCHFVv10e79xXe+EUSVwhoDz73f7aA5BbDpgRb21rV4n
         0Xrbv5X9R9wYtOMicobYkM1nN8hIFCvFudoUgjnambxEbOEejTL0FMZe9gIeRHqmXRsg
         t0spkS5/27FZcinW815B2YRoiizwu9ngRh8yWknClrVltsOcUyzabmONWgos6NClozI7
         lGE/pVky4geHmTbCEfol+lmRkOIq4CY0bBBwmxoXumfQQYeNJucNsVLRXwOfnTJGyTm1
         PuK+RxbkwmcryiNwMTK0dCHXhwMu6mNpIKHvi9nnPn8xqH9Yz8JWQZ5TzJYmOEnHBbuH
         TgMA==
X-Forwarded-Encrypted: i=1; AJvYcCXs+BEsAWXIBjGXALqGhpdz2okdaMSfpDXZNuFQIsXz9OXfh6bwIo1njyxVUtf44bBXWua/yS4lMk1neU65yqyA@lists.infradead.org
X-Gm-Message-State: AOJu0YyW88dwpBvbSMcbsSQ7rIWSm17nD1GXVGARe8vdJ2KEHvfjosec
	LGex+8jiuQZ9MO1SV+k1YJH6k1HY+Vbny2oe9uNWe3APLO5nkQ8x
X-Gm-Gg: ASbGncv9outcjnzyZlbSt4N5niGDL3giBaNA0SIkEhDoKcXlNGF6lQDuad3lGjPx6wj
	ts/f1IwqPsflW4AndII0wAYHKFOgeqXjpR4UZAPl9aJVh6gGfSMDRHTSgjXcrMlScN+pRgaXLC4
	MNcYslr6nKcHgPbigTs4NbnZcGBD26moJjoI1B/7Oy3ZDVplAyf8GO9NhVGhfCigo4zPRDT/s0T
	TNoZgEaIeVBjTSIJoI7dLqKYHroJsqRL7x5MRWYxTm48pV7I2lH8jq841k8/VuN5JtITGxxQZvx
	xFjwwoND2tDsQES1N6YGubS/ERY472Cn4SAOQUyUlfrfEU9rEQx7Ug==
X-Google-Smtp-Source: AGHT+IGdRb8RSEY/uMCLsBXs2PCUKzrfAlPuylZyCRqePE4ThlWVOzd97jd96fvdyjccpN5hsZkrrA==
X-Received: by 2002:a17:902:f644:b0:224:1af1:87f4 with SMTP id d9443c01a7336-2292f974b63mr133802185ad.22.1743365882249;
        Sun, 30 Mar 2025 13:18:02 -0700 (PDT)
Received: from localhost ([2804:30c:b03:ee00:e0b8:a8b8:44aa:8d0b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3039e1139fasm9042555a91.25.2025.03.30.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 13:18:01 -0700 (PDT)
Date: Sun, 30 Mar 2025 17:19:02 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z-mnNtYLkwsTYjMh@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
 <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_131803_701642_03D965A2 
X-CRM114-Status: GOOD (  20.36  )
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

Hi Matti,

The new helpers for ADC drivers look good to me.
I am now very late to complain about anything but am leaving some minor comments
below that can be completely ignored.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Thanks,
Marcelo

On 03/24, Matti Vaittinen wrote:
> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.
Not sure it's preferred to have ADC channels always declared in dt. That
question was somewhat also raised during ADC doc review [1]. In short, ADC
channel may and may not be declared under ADC dt node. ADC bindings often don't
enforce channels to be declared. On IIO side of things, many ADC drivers just
populate channels even if they are not declared in dt.
The ADCs you are supporting in the other patches of this series seem to require 
dt declared channels though.

[1]: https://lore.kernel.org/linux-iio/20250118155153.2574dbe5@jic23-huawei/

Would something like

A common way of marking pins that can be used as ADC inputs is to add
corresponding channel@N nodes in the device tree as described in the ADC
binding yaml.

be a good rephrasing of the above paragraph?

> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
...
> +static inline int iio_adc_device_num_channels(struct device *dev)
> +{
> +	return device_get_named_child_node_count(dev, "channel");
> +}
I wonder if this function name can eventually become misleading.

In Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml we have
temperature sensor with channel nodes named after external hardware connected to
the sensor, leading to channels having different node names. Can anything like
that ever be accepted for ADC bindings?

