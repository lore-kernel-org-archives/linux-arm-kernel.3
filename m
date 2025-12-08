Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98546CEBF88
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 04:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrmqll69GaPbWYkgjpEI8TbChltS4C6kWB4bJRvQkVs=; b=hLHSnybuIY/3yUGXPPuHbechzN
	Y4oAgqvOq2+TgXUuUp98kL41YVnAnrvRLue0K6orhDC+EC9CFh05kuzgNSgXKoli1eZXoJI/aCaaL
	AdwsYToApwaBuFCMUC6Yf0YmvC86AArtmCkpAdEXtZV+zWI9lY3AEwTMM/lB0DDoTo/0N9oSd5zca
	1+7VY35X2r+Rq6qf5bGB+THrlPJzHINFXjAHJdFV5OexIG81WCHQRJmmvJNs1Z45KP4aPbEVi0ecz
	IJXEpTX/e++SIPY/FDZ41o99wB8fRWeXQEn3ctXbrmLxOLOL9HB/29+wzLfhFqqb21YkpfvRfe1Mg
	8wCuh32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTAn-0000000CaOS-06cm;
	Mon, 08 Dec 2025 04:48:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTAl-0000000CaOH-4469
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 04:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2A3F60147
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Dec 2025 04:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843DDC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Dec 2025 04:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765169310;
	bh=U06QhChZKx2bmiQF6RRhzFFQ87RA67jPMdsGmcOeeHk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Z/3KtXR8Jn/g0jn4+4yj5OZn0qxEU5Q9+QJR98nWmt/9sliuC9kiqjQuaj/Qwnd/a
	 0+4Zy1EJjfCYU9tjO2t3gJ39sJnGfJZeyjszwqW3DJPQcdaqX1lPT0YVxUx4zMr746
	 bKJwBbYhulfByjqc+2MVtIj9Nkz+Rg6HVH7AEdR/6I2HXznNv+e6uv5XWCcCPF61pi
	 35tZmHZvEjjpVHP60nCejMxkkMkVYfMxC+4dlgmha+i0Fje/ipy/9bJOrw5egqFFKP
	 AckrqJ/irnBQgM+HF8hnz8pidiweKGclusDvMS4iei1AHLU4utXaL9YyHT6YdiUEmr
	 TUz/WKcq29EJw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959da48139so4144350e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 20:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1dkIlc4NmO2+lyRqbR3foTIHKtXlt1qQ6ODFCIvW3PF9DijGt+YxW3yEHx2paXZ7Um0YmZq4UojuVrUPAGssQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBE1E7S7mfDJltBtv0bkIocLN1dg9Fzwme874BkvU9HySQ4qVg
	jsPVCHgnTKeyUymU17WWz7umKAPba4M62iXhZRzfpG5+y23yE6Qq0gQxVBd8SlvdZmqCOrzGpG4
	TmOEgfMER6RatgEW+ZCTqkX0Km8p6IbDPbDok7eKErA==
X-Google-Smtp-Source: AGHT+IEglGMTw/0NIB7BymKkmsEWMWY4xqrTd3qO2i8xPTS8cVfEcd3bVjNGV/6cnaEWU/XMsQTyEXZXDOOqglr6C0s=
X-Received: by 2002:a05:6512:10c3:b0:594:51ac:13e with SMTP id
 2adb3069b0e04-5987e8be763mr1426456e87.17.1765169309059; Sun, 07 Dec 2025
 20:48:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 7 Dec 2025 20:48:27 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 7 Dec 2025 20:48:27 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org> <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
Date: Sun, 7 Dec 2025 20:48:27 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
X-Gm-Features: AQt7F2oGzDmTWNj9eMqY6ksExRm8PgQHZKXZzR2EdaLKtTkgpmQR6QdZ6gL8zes
Message-ID: <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
Subject: Re: [PATCH 05/12] gpio: it87: use new line value setter callbacks
To: Daniel Gibson <daniel@gibson.sh>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Dec 2025 05:55:15 +0100, Daniel Gibson <daniel@gibson.sh> said:
> Hi,
> I got one nitpick/question about this, see below
>
> On 4/23/25 09:15, Bartosz Golaszewski wrote:
>> @@ -249,7 +250,9 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
>>  	/* set the output enable bit */
>>  	superio_set_mask(mask, group + it87_gpio->output_base);
>>
>> -	it87_gpio_set(chip, gpio_num, val);
>> +	rc = it87_gpio_set(chip, gpio_num, val);
>> +	if (rc)
>> +		goto exit;
>>  >  	superio_exit();
>
> Are you sure that superio_exit() should be skipped (with goto exit) in
> case it87_gpio_set() fails?
> After all, superio_enter() above (not visible here) succeeded,
> only the it87_gpio_set() call failed.
>
> Of course this is kinda academic because currently it87_gpio_set()
> always returns 0, but if it ever doesn't, this might become a bug?
>

Thanks for bringing it to my attention, you're probably right and thats's
just an unintentional omission on my part. Do you want to send a patch that
will fix it or do you prefer me to do it?

Bart

