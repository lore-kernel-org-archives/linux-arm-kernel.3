Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D87CF34A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=; b=xA8m18hgdZzg5LRbtO12YcUkFr
	5KSN/O3F6fSuapI6Z7GujqMKnjogZ+gI3TwHazCFYeewZZQj7oz1GJCeTEk1KoXyFerZVgBEqIYH9
	xVdZBpCRYg+qYX+29bgVBxjJoeevO8VPjbgfBT8NmAJMZJx1e/aLAtUm8v7p0eMhs6fKGvjvy/hEN
	80oLet4GkHHMAzYCzmKZlXJRLSFGMNMuvUnHBJQKeA3FRGkkBDPOEKaRa8mHjvgLSp4F6+S3Z/5IL
	xpLw0SUI2iZrxVLG07nLWnRix/X2bqVZSzG1Jhnax5KtJ+KVljyuwaB9u/S9ajggC6FimRJD+hkdo
	W/p0/WGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiQd-00000003J2b-2n1M;
	Wed, 19 Nov 2025 13:40:59 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiQa-00000003J1k-4Av2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:40:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5958931c9c7so5435819e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763559655; x=1764164455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
        b=Ps6EmTl66ncL1TCJrE4lcpxKhxZlSnp/e++l2MihD9G5O/2l/eCNbwYSH2R8IfwgzJ
         Goz9lIWD1MR272yuWsbfwL9vz09ZvmZFlJF1KNy2ZOVDfYDYRQtT0p6xkJNQqrj3Kc+d
         eHRoOkax519q/+kfWRUgBgcXV5u7bl59GzNK1pTP++e9ZimjZmN8C7zKSXnztViFWGIi
         VY/IwUIMlbcD6k4TO1K0ZWmEea4O2jjf/+Vq2GaMGRBJuCbY+qlABH+MMqE0hzNa/UML
         d/ZG0Trjy2Q8U6e4FrL4X3X+nEatphAMAVeVqA+21WhaqXEN+SGA4hgJASLWAvhR5aC1
         vmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559655; x=1764164455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
        b=r1ajG55iTH6z71Poo0c8qHFyPGHjgYYXgP0cY81MdmZFBLRsipBMlsIkY06sn2AfrK
         AsZ47LYeNauGrJZqScIJkjyaQ3kQQiqWRa9FCSvAifaIRYmyr6QzYv291VEBmIWm+w3m
         E9miz6nYFHvVhEj8zQ85lvMSgs7eHVT9SAQezSNLTe49/N5F8ZgxqVPcympaWA5kKuRw
         5OsvQQr/focz/qBvszDoixlm+6Xey+lOlADQ/ApuzK83wPxzlQZeyxiWBHPL28D5XeAF
         lUxj7WbJ5NmhxrD4HWz4/AZOA/n0T+sMF3rpC5uqzpUU0F91gMES8I14CR0qrjJzSz+v
         KezA==
X-Forwarded-Encrypted: i=1; AJvYcCXbbha85u/lJfQKX8tt99xLaA7NO7EA7J640jp1Kpw1SUEqC5xKQjp/uKE1rQ4IO1GHhZGnpLM1szgeuL3zXwoC@lists.infradead.org
X-Gm-Message-State: AOJu0YyJVMDuZjlYiFodtKr+X7aeNfKbHVeVX7huV+o4Afmz4qsLnoaM
	Ax8+C6SG8yAVfIbFsrTJytDo4PABNpq3JFo/wa8qyHOAK02kqPxyEpwALiKHdoyc8uzRfU2uCOq
	YTIR2dBX0VH9rF0tBsy3e1GK0t0ET0URd3NeWVjXP0A==
X-Gm-Gg: ASbGncsTHXMdYNCJ3hvkX9uQWaoXw/ebJg+x9lHf9Qmh341Wvpdjkyy6bOx640cs2jU
	glQu+wfxeKPJMu5jHLMzR11Rnawwihho5w+NO0BFNi7N1HHf9WRnAs3OIkvasnbp44PlKfrRPEG
	srlKoPJouVCJGqgqPMJ4xrUbpORpQ/mCSCeoy6JlXgx7Stf5ncxH2w6EZIBjRlOg1vKduCbXzCV
	4gYdNUeyWxrYk/g3T2aHy+LV11ogMf1emu68knwWGN0xCCjdQb/g9VxzKPDO/OTFhDtfOSdC1sW
	ODGOUw==
X-Google-Smtp-Source: AGHT+IHJqn3Q9sPhFEgzMw/vukdNcUT/GVv4BESPUPflJb4Mu3DDqG55U/y6YAHksU0FJOcXRT5fsp/raa2CukOp/os=
X-Received: by 2002:a05:6512:689:b0:594:341a:ab1e with SMTP id
 2adb3069b0e04-595841fbd7emr8740927e87.31.1763559654402; Wed, 19 Nov 2025
 05:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:40:29 +0100
X-Gm-Features: AWmQ_bme-apOhLTLN0FLgYrYqF5_wu51DsT5ZOn-gWqBj2C9VIwE3ootHtgkuJw
Message-ID: <CACRpkda8GmEbFeSmGexcs-5aaFHiUigPhQfF_ynJRN1ix2f6nA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_054057_059734_C4FF403C 
X-CRM114-Status: GOOD (  15.53  )
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

On Tue, Nov 18, 2025 at 1:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:

> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
>
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested onl=
y.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

