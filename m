Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9305CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1SJzZViXK1pDr1MQwcNm8sCV6Q5rAI1ANY20Nq5OMg=; b=kIOkv3jzjuKP0pkmA0pVHc28O6
	JriAkCPJnsWjtyAYkkOQKhnMYTmid/bRuEGdBdMARj3rB18HSvt4M3om5A7MBRCjCoRpK5+wY5dHn
	Go4bs7R36QzFlEfKruBv3TaytuM5ls0Cw9/I9KUf41Wo0HbWiNGnEqhZbLHK5f3J6x4OnbjOcF4VS
	gMjGnQ9BU68N4Gn66CaLsheMB5WGQi0BRzBIzxNFQJorXn9ureJ2EtXCiiZpeFXib/oEjMHn3chJh
	s5UGGCTXDAcOJUuQEdIaylkZjNFJDL9SzuynwyTQillCLbS6cNPorDftM44MAbd7vIDy2/JkS2+vF
	eGf4EORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgP9-00000002UNt-3Zv4;
	Thu, 28 Aug 2025 17:27:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcrH-00000001m3b-1fFE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:40:08 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55f3533fd05so1086690e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756388406; x=1756993206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1SJzZViXK1pDr1MQwcNm8sCV6Q5rAI1ANY20Nq5OMg=;
        b=cMoK6i0UiP0PZJWff5KpSw24pfO9Q3uUV2jsnCxgm3Fx2rV6voVbn2LW1ksMBsusIi
         1oGQlL0KHYURYYjqm75OQSjjG6XEaf+clw6RSi/aypmk3pNiUEZcwSRncf4IoMrwhB+J
         momiyNxFVtq0hOrmoo+oXHQRkXDFMOKo1aKkF/5r43bkbRtuIddQHl9x0YUGGZJ/Ato2
         Q8CSSuORlFsAmgnd/BlP+QDO/nY0XQqG8Zza2q2Wr5szgCmZQ0tDDFTqrf86+2Jttl9X
         qSR6/Xu4NqQTjL4oLcMs6Jbzj4eNN1Gi4B9K+082HZmTv0CjssHvyR2+CLNwXMBYsAQG
         hbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388406; x=1756993206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1SJzZViXK1pDr1MQwcNm8sCV6Q5rAI1ANY20Nq5OMg=;
        b=BO9UTe396/XWgwRUjrPbtqXAkCqsgzj2J5OulJdwitzq6fOZFKzQVd5187wNP0fHTq
         bbRHLitXbj1Ktq+T5OuDoegOFYBxYOQguOc6sMDTyHo+od/Tydkdvhr3p6qGCWLHjgkU
         lzApnoMjnTRsMo0esVOm5Y6xX77QjzYF8IC1jjjeesP47HvhOx3zTac+ayUfn8Ri6BxP
         CNgeIuzLshqEfoKwIlyL0p44+SOvRubOWDOVC+Kgau7aRlUqSgwU3IzKL+UOw7BLmlnS
         mmENy3z5oJBupkfozbJddJilBPFJ83heBLM/UHdw/L1diJ/JmDYJb9DJy/l8uIXUspHn
         hMEg==
X-Forwarded-Encrypted: i=1; AJvYcCWgx0KWerUvW1op4mTXcgRv45x4NT5tVWGFLawX5pLpAlPe5gT1waPpmaKStHQPJr0zxkeh0mQl9YQNsdSLJpdb@lists.infradead.org
X-Gm-Message-State: AOJu0YzijLg/KdXucUpwggivulV6rYi28N7blCw/UNBSjd0sqXvYeJTp
	GMXZtrHv1V/6hS/gpZ9dORTre69K6rhSK/0bvhHDzuNyshVT4cUFNvIkBpiUl8cPkhzsZz8jDv8
	B2hluF7nVv5o7tu4Kj/3VG4UYE0jRLo0aQc1rNiVTeQ==
X-Gm-Gg: ASbGnctU/1SmYNkdqdGuoBqmIVL+R4M0bPL/Uping010qfRxDyJH/ULK1izbSiDBJMi
	KAHi/VjSWGPiYBG7J3guM4RiJDlRHJjHGjJuMpzMu6U3UjQfmPekWJsY5XLqLBn9uSCVQuNLjM1
	5KULElmJTp2xSSRMipuSXQh3q62PYRQFS0FNH2F6ZbLF9U3TdxgdTTICQBcRQ5ogh0BofYXhixh
	7BGxd6UOgvxqCef31MBjknrsZ09VXiAyEJB42CRBoaLpflAjw==
X-Google-Smtp-Source: AGHT+IGEHfgeJNFnFd0JwUZuv/xEjSmtTQV3xX9+3Fib4+CShUvUGEuUxLvZOINoJq+pi8siJ77xgUstohrji4EmgCY=
X-Received: by 2002:a05:6512:6410:b0:55c:aca3:dd31 with SMTP id
 2adb3069b0e04-55f0c6a0cb4mr6599923e87.12.1756388405786; Thu, 28 Aug 2025
 06:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 15:39:54 +0200
X-Gm-Features: Ac12FXzYXIxJ4_0Msx9nr1o6HpvE_T-GuptKwBJkpe8LH3ZfWmN-4aYU7mkYoRY
Message-ID: <CAMRc=MdBtkS-6o2wNDwwhNkJwF=FPO2BZv=Ac72v+EyL2eotkA@mail.gmail.com>
Subject: Re: [PATCH 00/16] gpio: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_064007_435624_78D722A6 
X-CRM114-Status: GOOD (  16.70  )
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

On Wed, Aug 20, 2025 at 5:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
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
>

This doesn't apply on top of my gpio/for-next branch, can you rebase
and resend please?

Bart

