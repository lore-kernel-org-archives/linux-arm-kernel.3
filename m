Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A2FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0MU6aIf0UKaVQXy6RXiIl/s8w4p6CMU+2iv6BbdgNc=; b=MP5+9jSj/MOfHvQfJWY5Vbjioh
	wVI6xcWh9emIwGolhTX3XeQXPmdrGwTbQ3qqzvld3SQ+sCjoDxKofwGDGD0GNlUf0ViSwsU1Unx2D
	oEQOINBsMhNgy3ABU5p9xTyz/5FJjyAxPjF1vNzI6E5Rkj1BO9szg7CQtwnR7tbQ4rAMWWlavrbq1
	qsC0cViQ6/jrzHiej/9WDCCqUUm0aGyHDEzCvL+AAakgWSZfkG54yS7EF8o2QXayfI7Vss5BJvHRO
	9n4CdY3xm7ZzPMWgkolUHkzoONpaOaz3m7S0rqREePhFYr05E4FafpP+/4xvk5oJtNWqrC1XL/sHN
	IvqZQzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sWa-000000074na-30J9;
	Wed, 01 Oct 2025 08:49:24 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sWY-000000074mx-3KUd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:49:24 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso41773301fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759308561; x=1759913361; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0MU6aIf0UKaVQXy6RXiIl/s8w4p6CMU+2iv6BbdgNc=;
        b=tzSv+2YoWwvpz6Bnmy7+3lSSt4jwvGa0ks76eHAJYAYVJteCdy7KV0yWvjEHcGpvUY
         wqua3q8t2RTiaPlorupo/kzEghr8KaiK1V9DIqdhDXZHzYPvxbMD8c7ihT4Icnuu30tN
         AjZQNQtaSG9Gd9emBpb5lhDRVtp4J/Gni5Cw1tNACTgaCUQ0iVRB419SvesDUJCYzM7c
         aRsLoYP+La4dorDQH8IHheqVvMidbhrg8Ew1tozZt3QVq0hgHNy+cFMZYsb39o/OS1Ul
         NZSY7ODAR2XNAp5TF9CB/h5ihRvAgOj/q+3pPIZ4C5BlRa+pRBYh7Ku/4CQqez5479FJ
         1lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308561; x=1759913361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0MU6aIf0UKaVQXy6RXiIl/s8w4p6CMU+2iv6BbdgNc=;
        b=YwIr3C+HVuqE1hC+4NFuOgm9yrVKtKibgxzaQYwvIuq4zOFXX87MFwIGLCHiP0i4Zj
         xUCJIeCgdaamw0b3we1TTNjCuejbvrLjRQS9U+x/vbacXmhoD7FglI1oTZzGBebBLQd9
         Kcbprl6QhsePrfRJ81QKGbf8JkE5fwv1LBZjW1zplScf9rdz3Fg4T1wSxibcu4MZbdZs
         qgQy0p8kbRB+zI6gS1FRl41nDKwC6FAi3vvjPdCc53j2JweUm9kZxSOTs5k4FehL2TYR
         WXUAc4L5IwjSvakZm/828ovuWkC+ehNUv/0BG5Y47nY2bkjISa8CZFgsMsVFzS3THpLT
         TjiA==
X-Forwarded-Encrypted: i=1; AJvYcCU/MqI0DaFoLRRwN6Md14dQ2WC2r/uaZ84cqgk7UUiC3Butd4z+vtpFZHckDBg7VJvaL3DyXS2C1Eecc5fPQ4ka@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ccz6lcM0Y0Sq5A/Xn1d/eqceUzvFfAfnVcpaDaZqCcWIWCmL
	byvyP4e8mddkJjQBpJg86THYSQOrxm4JWQdPB1PxnOWvvmxASBhIxoEhiutfgjGj3AA2s4fxdG8
	6fJ622LB/ZbQpwhypEmE8Bf4Lu5BWzhPhacIdO8u9BQ==
X-Gm-Gg: ASbGncutOOUjnHvRKOPvoNvv7H56Fo3e9IlclpXiHM3fO7EnawQ288HAfBB0WED3VYx
	ciZoQggHkaEJ72hQ+pgJ//new+nccFq7PfG9fdY1HJ6cotO8uxkQefXuo2I8EkYGP0wfxTGQZFT
	IfJTTLrbdHRKArjmqWXwWgGA+HqJLxf04WQEHQP1yHNJDWWUukx6XVSaWoN8TdWkFUMObfbjxZB
	exKGSCw50aHizDYc0K8znLqJsCpt3o=
X-Google-Smtp-Source: AGHT+IE/zKf4qFF1V06mzijknnV4vH7ubPftpR9/pcWP4CKpLmmmcoKCGAvUGlvDb6zfdbCLMmIHYOCJfvmvwXDpg0U=
X-Received: by 2002:a05:651c:1592:b0:372:9468:8f99 with SMTP id
 38308e7fff4ca-373a752cee4mr8095951fa.35.1759308560647; Wed, 01 Oct 2025
 01:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:49:09 +0200
X-Gm-Features: AS18NWD8uQhySPgdZVvT54DJFS2VbD05G4rr5WTDsYs0mXBgIhMrAJorsb0mOuY
Message-ID: <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_014922_852756_1D26E3B0 
X-CRM114-Status: GOOD (  16.96  )
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

Hi Bartosz,

I see the big picture of this plan!

One quick comment:

On Wed, Sep 24, 2025 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core),

...and that is what I thought as well, so:

>       arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM

why would we be selecting this per-subarch?

What will happen is that CONFIG_REGULATOR will select
it and since everyone and their dog is using regulator, what
will happen is that every system will have this enabled,
and every GPIO access on every system will be proxied
and then this better be fast.

Two things come to mind, and I bet you have thought of
them already:

1. Footprint: all systems using regulators will now have
   to compile in all this code as well.

2. Performance, I didn't quite get it if every GPIO on the
  system will be proxied through a layer of indirection
  if you select HAVE_SHARED_GPIOS
  but that would not be good, since some users are in
  fastpath such as IRQ handlers, and the old way of
  sharing GPIOs would just affect pins that are actually
  shared.

I don't know of a good generic solution for (2) to be honest,
last resort would be something like runtime patching of
calls when a GPIO becomes shared and that is really
advanced but maybe necessary to get a performant and
generic solution.

Yours,
Linus Walleij

