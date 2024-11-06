Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7FFD44D71
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=; b=Vh4pZfij5qRzaBk3Mhr0wuwEgw
	oTEc/w12r3qzuc8q+t5fYVu5yscI/BHvyBPjs+H/jMwiaQPBANkA7NMqiFl7F3Lqgco9MzM6tB98Y
	dSS+3fJW2TDMZ64znukTnNANnGU5dmVkbCd7Nc4YU71S1Ebfdi3KDo2i44ykuAGDGEXCvzvrWVBiB
	O9hA6h7NCyjBTXp8PIlNsGa3r2yZPY+cI5uCgCK2JfJ/d3tI5gnm47JBgoudy9K7UNqffjTW5l0U8
	rIHq8fP2L28Nz5Hh77+njmKeqwqBAocDrrIb3HPKLDCL8mKvDj6sE9ZIZmqsKJlp3F5EFtN0aO+qr
	sfSwcY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gZ4-00000003WBS-0B1V;
	Wed, 06 Nov 2024 13:59:18 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gK3-00000003Ssu-0276
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:43:48 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so9055251fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900624; x=1731505424; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=b42tbmS/JJgFLd8FE5XQWb8olf/sjc89lbbfEVlXG00iBSRrZjrnnpcPWsrXBrV6Df
         khorwk+sWKEDz1itMtMDv/EMlI8I4lXuSBNRbEt0uFqyHIfPocXrux3WXqll+N0/vM28
         CXoaqKBxaaCXqj35ENOddqlaT9WY3jdZ33//w1yh52DZgM1v7CXXWWUB5+CPYwcbaNZR
         kdNTfb0oX8tiYdI7qZiYpMNaKxBeRVTZsrrCni7yir/+e11ts6NzhCRm3c5NSnS+QBMF
         Cpq+dlA8La+ZnEPx2+aPnv6HDFwLMqcUt6ZUFPg9FNk8TuKn6TAVwKvkWUtZZ3VHZA1K
         AIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900624; x=1731505424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=sHL/OJzdnro8RBuAnD4mpVb+hoLRo/JwbUKpXw26U+SgF89r2RsOgzdG4s2OiTFp+d
         6H/IJgXv4KfhtBhL3TNy979PYyo6qxnbdnU5E5i1miU2jf7d5IE8ec3clg9DcpN/6I4T
         cr1JnXMHMBk2Tf/9J1PM07AxBga+lr8/xlcwQTag0tAnqYjfe8q0jUcgsddvXkzjR6xi
         q6tmlZ/+HzjAgyWr5InP5Ped5IEDkGlMmOZt5olfOFFFBCt4s4z6vwUzN4L6FUfE8W35
         AhD7vuJM9yDTrhy7x0vfJuvEjeh2GZYjIdd+KfUrMgsRYND6bWaPHFFd9ppZcYc406Zj
         hpHA==
X-Forwarded-Encrypted: i=1; AJvYcCXRPwBHoUigt4UnG9/DIPie14EO4/8R63q/7hzh0bpZUDjqJdL2gz91axAhA92UB+8YdzaL9x59JhHJRkjGXtwo@lists.infradead.org
X-Gm-Message-State: AOJu0YyCyk7YhSO7OGacJ2FnKIsnKkKGNtxnozGO+zrLK6R8VZShOUTO
	pX9T5Zpgp2DSv/DpVox7BljWP/Ew3nfgb1yG8MWTCprnZONvUOUKazufhyToyqc5GIAUSd2MC8S
	dNC4qcFgtoL6EHdTiBpSIT4eTFWi5s9VGMYUW+w==
X-Google-Smtp-Source: AGHT+IHUtnnhEva3lCB8uWh8uIWC06tcgEpMXvu5am5NhlAEbhUxeQ79Id1SoLC6uXkPBOCC/N9jH1BHhM6ITnKzWf8=
X-Received: by 2002:a05:651c:210a:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2ff0cb2376emr8634191fa.2.1730900624427; Wed, 06 Nov 2024
 05:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <ZytP0XGgmz_R5gos@smile.fi.intel.com>
In-Reply-To: <ZytP0XGgmz_R5gos@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 Nov 2024 14:43:32 +0100
Message-ID: <CAMRc=MfQw1YmOoq-rK5Bq3uDK8cmjG_xsUgVDs28phsqkcHofA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_054347_068190_EB4B1ADA 
X-CRM114-Status: GOOD (  19.54  )
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

On Wed, Nov 6, 2024 at 12:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 04, 2024 at 11:34:18AM +0200, Andy Shevchenko wrote:
> > This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> > left. Convert those users to call modern APIs and drop this legacy piec=
e
> > from the source tree.
> >
> > The idea is to route this via GPIO tree, please Ack.
>
> Thank you for Acks, folks!
>
> Dominik, is it possible to get yours or are you inactive nowadays (I saw
> last mention of your name ca. 2023).
>
> Bart, we have all Acks except pcmcia (see also above), and the change is
> the same all over the places, do you think it's okay to apply if Dominik
> won't respond for a few days?
>

If we don't get an ack until Friday, I will take it as is.

Bart

