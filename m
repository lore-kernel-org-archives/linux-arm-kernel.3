Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE84C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZY8otkMYxUzAC1QwZ9rYHNq5MXftY+mTN4XwBPSLJk=; b=KDWwLYDKhqrFx7l41MNMixPgnX
	o84/0MTfi77oC+l9N7/gWCusnkhhAaGJZwXsdo1dswmJTSz9qlrOG3fUcNnL/snneX6sp9iqCeCEN
	OxiJCyHWssA5qeIlyhmjXnsjQPu0TTsAL6s8PeOzy4f91HfvTWVkKn81DsVxBHkK4s7yUaznrmOSs
	iMhH4CVyM32Vx7lVqFWpZEhs5XthLPaURb5If1J2pVxrper12waYYjrq/gXopmO0V6U4NNYFwrWYk
	HBGYn0tbFH1DZmzls9r7R6rdxldn8R1/5vfY1fUekmqPwzOUhqnq7nYotEHSx49Sxi/JxuIx94xbV
	s+t2uvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08DO-00000007U6H-0APb;
	Thu, 03 Apr 2025 00:13:50 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07sQ-00000007RyU-24Lp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:52:11 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-549b159c84cso406745e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743637928; x=1744242728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZY8otkMYxUzAC1QwZ9rYHNq5MXftY+mTN4XwBPSLJk=;
        b=0kpE3uLjYTWz3KnZoX65fiYjOZZhLF4ki23pTGkwYo7by7VcOCgQhWIQFAv36eJcoQ
         Vfg4j+rYF2xGOIiWq0vS58e3EVhP1fiYELQ5yTySZoBejEgbiB/NCxpLt/xLNhPbPNZO
         J1dxIewfhW9jHRV/W+mwZBpK4cKcTsb28+IprQH7YJyNuEd2kwMjre+sBEyuLedsvqqA
         awFC2Lqf8eLoHinrKqIx9SP/fnc//F/OEl0dVev/Ghd/kbNSJqAcyC9ir7fbclbNfOJ9
         NZ+YO9WaIf1nEhftW5b4brdUL1Yh2ZypcChOLeJsXWxdEECaEsJdrwqyfk0j5mhsCtZM
         jHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743637928; x=1744242728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZY8otkMYxUzAC1QwZ9rYHNq5MXftY+mTN4XwBPSLJk=;
        b=aC4+NxmNeSQbK6dKZD80Ke6nVfcawHEooyYgS4wZ4v48qB9Yw8oY6o7BkhbGU72LFd
         cVNMhwba3AepX1gl5YFDY9LEDpsW7Mx7ldOcjnF5x5OtTyH+sMaauk7HQmN9jKShKBbI
         wQ7fOyIKxLKnLZaR0iOK25Wisa7/hUJNg3S5K8AnTXulmaoOXQQbmlhLhgTmqUU9oGLO
         FHORdMElkdCmh8Sx3M6YDxV5xvFBMPqwWx8e3g3jGft2JQFMMcYvzANPE+a0+6AxOj1E
         2RZ2UFCEd56r4qpys7VnrbNHaxw6cmK3OzB0LSADT2j1cXzkVoMlGoawT9mmZ+mz5esy
         kXaA==
X-Forwarded-Encrypted: i=1; AJvYcCWDOxkpeSYH8wjUGHLzAonr+SZLv9li0tkp3AGrrq2KnHvJAhCeTHh39p9SGh1nVDRT1NfkuW6lyo9dxehLWkig@lists.infradead.org
X-Gm-Message-State: AOJu0YzNK3G/mr87hX302on0HZgFpHkWNJ2hi/5CAE0fYGsQZ2HXNW18
	XHPUg3puW69jzi5XFRTTQLApJeERuimyiat64DWjyq4nZLaSlaWzpWvDCKBfwpcKP8otZ6pPk28
	17N1a4Hdx6YIkEpBq4yXUJjeD1kqmszOwFn8=
X-Gm-Gg: ASbGnct9KNe4BeWKrRDzliVl/hGuZfzuXmed8u3o0WuMiDiyDBgsk8SyTC0mwYpZdZO
	Zt2SnXDyCwPvCUCIsPK8ZiQSncSpiUahudOYstvZ609YaODBeLlBBPN5W/hhNyNnkKl7qsH7mnV
	Y2uyrNNYqpbVZISe9EnmPl77c4Z2z02kfSttBCWkR498GEZ/x6vshJurk=
X-Google-Smtp-Source: AGHT+IHlbF+Rcpq4SNzQqBS7VAxDQsrV3ZwngjWYjf5S0S28hVedbHbtxlbFZnmwmOWaFBpWoJrxhCkIAdvd/qI3WYE=
X-Received: by 2002:a2e:a817:0:b0:30d:62c1:3bdd with SMTP id
 38308e7fff4ca-30f0213b687mr1914151fa.23.1743637927467; Wed, 02 Apr 2025
 16:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-3-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-3-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 2 Apr 2025 16:51:55 -0700
X-Gm-Features: AQ5f1JpHnrRyIgSkaS_9jCoC0VsbpgZrv9QWyrsHr40oDXAIBk4dIsCvT_HYCMU
Message-ID: <CANDhNCpGxedaxjZ=6Trai3exbQGf7WRJUeTC1jqoHOhup2mNLg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_165210_535504_EFAE0DC1 
X-CRM114-Status: GOOD (  16.40  )
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

On Wed, Apr 2, 2025 at 4:34=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> To use the MCT as a sched_clock, the timer value has to be accessed vi
> an MCT register which is extremely slow. To improve performance on Arm64
> SoCs, use the Arm architected timer as the default clocksource. Note, we

Nit:  sched_clock is sort of separate from the "default clocksource",
and after this patch we still register MCT as a clocksource, so this
doesn't sound quite right.

I'd probably reword this slightly to:
"The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state.  So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1]. "

> can't completely disable the MCT on Arm64 since it needs to be used as
> the wakeup source for the arch_timer to exit the "c2" idle state.
>
> Since ARM SoCs don't have an architectured timer, the MCT will continue
> to be the default clocksource. Detailed discussion on this topic can be
> found at [1].
>
> [1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send=
-email-chirantan@chromium.org/
>
> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/630817=
f7080e92c5e0216095ff52f6eb8dd00727
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>

Otherwise, looks good.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john

