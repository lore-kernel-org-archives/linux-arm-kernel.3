Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C238BF30955
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fLPVF8V+Qo14CJ4xDQwdqLS8Injz5P+WDXvbO/X/0I=; b=RZvwMb10UixjKms25vlkaIgcyx
	HfidWydzfDIw2rfRF5G6+Kr1wbvtB2LE1HlogSTELP7eD55nJqtfLX9O7N6pYqYrDY6g4uyyyKMem
	lwYRwVehC02JrQpQoTKRfDYRvHby9LYSI9CA6MzROIT9Bxj/nhwBwNGQsXFFuVpElxhdGVmbmRdru
	L69vd9cITfj/Hu65cHxL7gNmEYe9MRGsZV5lapNgQo82PXV5s/cXDIiwYtYjyiE52Ipy8OsGVrHGW
	0Cc3Z5jY1rgpWi7IQf1dm2vqn55tfgZFKI26T8cAnXfzliu+AuvzU7gshYDnXS2gAz7mD8ykii2ch
	aXOaFrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Jw-00000001puJ-1UCF;
	Thu, 05 Mar 2026 13:00:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Jv-00000001pu7-0nyI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A040161340
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 13:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DF8C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715650;
	bh=2fLPVF8V+Qo14CJ4xDQwdqLS8Injz5P+WDXvbO/X/0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=twUdTs6XpsaHTqb7/+sj6nUAKJHd7mJ015J4UZirKJlRB4Mn9xHgbdf1BJbu5xM4c
	 QeSuYlsHXhCNopfoOno24MTfQaNqdGHiL41ffTSK55F7zs3oO06VT+POBJN6ZiCG+i
	 8AJ35Juqjo/ffp+aKwq8LWxpgDpvsFTCT5T8/L92KIr90JOqn5Ce2QPIhcUAudQvsW
	 ionlFFANhsQdtpQVuXoOgIWd8wsCBDNJFnLu1U4foxnA+4tBizXxJRXdidX5GM3fFO
	 rM0yV/EevQjWQmwLcME0JdH6slrFh79w+HpApj0JTbpTLOmHtJ6H+AWGa1xadyNSHD
	 X9cHt2rkn9ocg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79628fb5c05so65640507b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:00:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWW0vwpjc6Pfl/cQdesmR/Za772XuKz+acYC4ycFDrjYWDGStxMuosQk0ZgPn03KoX51AbZUzMiShgm7caUGtFQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwPYx079CTLtHLTRwbFpFupiaNeXqLCDVnAqGprzLlZqN2barnP
	CLYqDaFa1/H+kF74BsLy58xWxsMOAHj0T6roPu8FE6qHEsNoTmlchNLym4xYgSJNAcs+trpW20W
	CoQ/n8YcEL2fn1YN1NjHsgPUkJraaY7E=
X-Received: by 2002:a05:690c:385:b0:796:3c39:eb96 with SMTP id
 00721157ae682-798c6bd8c88mr47025427b3.13.1772715649725; Thu, 05 Mar 2026
 05:00:49 -0800 (PST)
MIME-Version: 1.0
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com> <20260305-gpio-hog-fwnode-v1-5-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-5-97d7df6bbd17@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 14:00:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLnuKkWh9HRBHOVtYnDuPgAU=bjm=gUZtEHEcyp-e0y3Ng@mail.gmail.com>
X-Gm-Features: AaiRm51We3q6CMYsTkjp3rhKYGVHxX_F9UZaiYdDL8ZCrn8J3C4v9v7PwSz-XUA
Message-ID: <CAD++jLnuKkWh9HRBHOVtYnDuPgAU=bjm=gUZtEHEcyp-e0y3Ng@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: remove machine hogs
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 5, 2026 at 10:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> With no more users, remove legacy machine hog API from the kernel.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sweet, less and clearer abstractions using strings instead, I like it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

