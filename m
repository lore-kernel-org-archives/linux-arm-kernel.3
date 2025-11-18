Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20711CED265
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=; b=tVHBnKD7ralBycsjsnjczWNQnV
	w0JM4mI6VUggGcOJIdlYhaD4DV205tdrLfrDrzbbZS61OrR5PHlON8cvv1mJbV3pTYdiawORRatTq
	HhOiN3SdEDATqNjxtHMS/o6Fkc/gyxutixd2fo+ZDpJEAMGVVbYFIK0/ez7yeEqiVLB5csTDuAULa
	QM+Mcm6OzR+ixj8QBsipBa98Pibm1vhMHFYStsYWYL5ceL+RcX/efn1Qd0nS8lqUER8LyUhkfSbZG
	gc5pe3FiONnSJJ8BAU+eTPseBqAOxDT1upCUSmJKc8uBv02ddGPpGWLQd+uG6U2Mwl4SvjShIlLWh
	NakjcLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIkx-00000000E7O-2uJ3;
	Tue, 18 Nov 2025 10:16:15 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIkv-00000000E6y-1BAM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:16:14 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b725ead5800so641597866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460971; x=1764065771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
        b=LfH6bxT99DhsWRYK+D/GQXm5J/KmbppyxsSLlOuHN/UUvSh/jTVVY1kP79KCfiCT2S
         HAbsN6Eaje5ea8QFnUbZvfNPqy8w4F6D8qFb4izalI73JxZ6BMFpGTmzjnUNRBzingTT
         olj4ezWrkFN8h2SDQS/v2mlBTWkTIJsU8Ns9cxc9Fqp2+BzCdE6Tjzh5+hOK/JetDOBn
         XCngdNaTa29Ul5XAi/Hfq6r9iVvfTBJDQsL+MIoWFna5qOyRT9y403qRI4xDxuenHXgC
         HesvR/g2zm9Wu/F8lHRvcIJL8OVHV0ZzZTZKCYY0huQ32MvbzR6uoHaheuQW6QdCj8Xx
         4KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460971; x=1764065771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
        b=eHkrs29Nj8huDTDkVoayu+21fXEU8tY2/n5CZdAFEqpskjvIFrngobQJgVFePgvHrl
         RcUmqMVXHOK1od4IeZFCCjSISvd9UR7BqsBQtGdiwmsVGF+lGGfs7b5qGUOhTwE4KPpB
         qVDSKeehUwWAgNtF5eBXPxMIfePTVeaDRz2pGbQ4lorS40S1+9/7ZPBU6fbQvZAYQmkp
         iad8y79tjcHak0+G2Bt6QHTSGn1Vqnz9Jjs25mJwobjku2scqoRPxziiNIemdRe8iI8i
         8fMSuApbxlW7vxcEGdCqu4ETTczBBzEaOh4R4EaGcoT0jOd7wc1ZOiFTwTbEXYx5QuDU
         bHQg==
X-Forwarded-Encrypted: i=1; AJvYcCWaF4Kf1SBmJtsKQxBvJuhLxlM/JRcgeqlP0VkYfvcURZOhIDkrrYKEK990kuc3tCrIlpreEon3lrwiaY2s/q3N@lists.infradead.org
X-Gm-Message-State: AOJu0YzmY4A1ocdq9UXyo6g4h93oInxi+okTWVBnOZR11HyBCXvO4Ip4
	S3pyuh0JP2U3OdzsU3COn54B3Tn0eRIrzPC/ZUjRK89F7bcdSId9XaZYTxbJ9hGYf4x82ppnwBJ
	pzXOMZBkC0ZMm4d9JQENCv6N7WCl7a9I=
X-Gm-Gg: ASbGnctUP+03cmlZcEQ7a1wU6/pRSoYLz41ObArL6sbdyXIoJkVmVYPCzklLSHLrFo2
	f/czlQ3h6aR0QJdIVnFOxJ4Pzu6M6ZaX6LENSxl91XOtJdl30dCq+UX38hI5bDo7zPxSbxOFUJN
	KhS7EQBlDYAJclyv3xEt05t9sf6lLogOm8U0iRWJDdvrF81yUqpdNUfBlUapRHXLih/Xtde4+lg
	2maPy2BEYfEntR6U7pZid5pSYI9uRdaRebnOCHdwr8HtFQKf0DG9NqObKh6+LxRx8NU0Z8jJg0s
	GUe/Cd8geDLZZER6/DtOR4XBre+9uHbgt9HbvgQWH20LWR3BQsjwphqhdXB6vLBVJNkf0zg=
X-Google-Smtp-Source: AGHT+IHWVqaHds/q+LTdhqRXaLWytjahqcnDcixSB6BIfNsrZiukSD6Fp2tjp7MP7I7eFis6nLzSaJ0KogSHuqCHmsg=
X-Received: by 2002:a17:907:9622:b0:b73:7280:7821 with SMTP id
 a640c23a62f3a-b7372807e5emr1454519966b.60.1763460971389; Tue, 18 Nov 2025
 02:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-2-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-2-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 12:15:35 +0200
X-Gm-Features: AWmQ_blAt--6c37TNGtYz06A9WDhIGNjmkfqZdEk3NoJJOsCX6O0tW-2H1DDGnU
Message-ID: <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
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
X-CRM114-CacheID: sfid-20251118_021613_337910_D28AC633 
X-CRM114-Status: GOOD (  15.94  )
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

On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> The dwapb_context structure is always embedded into struct
> dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv

SLEEP
grepping

> dts dir, the max port number is 6, the berlin2q soc families, so this
> means current we have wasted 216 bytes memory which is trivial

currently

> compared to the system memory.

I still think the embedding is not related to this change and should
be justified in a separate patch. W/o that part the rest looks fine.

--=20
With Best Regards,
Andy Shevchenko

