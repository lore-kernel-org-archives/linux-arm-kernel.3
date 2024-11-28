Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517C3D6910A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmgFSpEV/joPPiUmtOBENMot4M1WgXF/FvOd2XyYmN4=; b=n95/KC+lUb5YqiasSvLraEJGo+
	O2WUo/mogLnp6WzSFZiQelPta9h7l5nF7nOaaZ0/1d2Uts8B19yqhbAdDSxJ2nDyYPuSpsdqgO8rv
	N4A6nh6LqtNH32QLZxCVI/HF/1fEeCMntiPciVo1e9Y4KhSleX/f4gGX5KGQ6+c8CV5+Q8vXbC8nh
	mzZWwgydxUqemmZp5/D5RgWXmpxFCXEctHwvy19sVx5c6waxPV3LLpgoduu8qLKpclI43lbCQxzZh
	VzDY9fNYXZZatNhfc0r1czn8B0M/q1SY7uD6aWXV7RYyp9+mXjoPsJzaUD//0oD/S+107AGgnXmoG
	g0TbKt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGef0-0000000Fdf4-38lp;
	Thu, 28 Nov 2024 13:34:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGee1-0000000FdZq-31sX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 13:33:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so7575005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 05:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732800800; x=1733405600; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmgFSpEV/joPPiUmtOBENMot4M1WgXF/FvOd2XyYmN4=;
        b=Hxd9jDpGtCj0arg1WXziIGZqsoyLzhUC9lTaH1C4yYRnA+8SW8vaIL2U0DPWT0NS+4
         rhMXf20gWTWVsXRA91hZfnFJTS4Hvcz+Zrsk7bWPsWgPIvZeHVvYQKolhpoL3NXzZask
         Mo3hxV3hpjB6aDHllSPEX+bC+24i7ieL7fB1ylkH00lVaIl1cdGPv6J6n0nn6aPAoVMU
         8s3zfaKhkJdOEZnntqDtC16/0KkA1prILDZDgwVkB0XJYa1wnoyEmQ+wyibjFxx3BrCN
         lpNE7HryY2URuxmTqYwYWi++eJGgFsbg0WImZUcSw9j4Tj1Zb21rt+DZgCxCGOiRp7pc
         HV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800800; x=1733405600;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmgFSpEV/joPPiUmtOBENMot4M1WgXF/FvOd2XyYmN4=;
        b=VnSkflJE5cyugWBby3vis442X4JvvWbQQ/h6D6+5mwCs82uPxRzqRXQTPbGC2Kdh0N
         /MtjeYcmIs6hvUjUM/9tFqR7EJOVdHBiiVJLNyoBgWUapzgUlikilVa0g8F1VmA6JjKA
         I02nCocjxxigJMLIOcNWtFZGT09kcJhiEpqqPy/E5E1Z2W4Dyw/TIyjgDpkzb+fBxuE/
         QyvmKNVgQc3A1rSp3usWorg0BInCP6ykWns9Xe8wjib9SjPPL6BbXIfZ11+3XO2gHdNA
         Vu3m6k2J2f0hejpwoEPCxaxwuXf0htCnO0s2QMn6Fw13CDEcDhRJQgyR7NUyueLac7SQ
         eSEA==
X-Forwarded-Encrypted: i=1; AJvYcCVgZvDrSOkFjN6r2zZRy9XVRh1o1GIW4BDMZtQbJ2w63dXJyxvd1YZFcLjnOvkR2kepwAaNGvDBa6SpJzeScwJV@lists.infradead.org
X-Gm-Message-State: AOJu0YznYCSZ02bcymkL3c0/R6OCH6wAkcXSddDnzZXAgHxdvAXG/kGh
	jQ+JF+PA+/9K26IsHFmHnyXMWTBFS6jnmOPuQxAH9bLQ/UFSBu1YmBYfIasZ140=
X-Gm-Gg: ASbGncvTL6UM1lQFNO07xDevgP9zT1Nk3xFVCEJ3Ow7VC/Wm4acKwwDnrdQFtDfOfCD
	NxbeMZC6nVhJLkQi63k6/Jp8elojPWJ1r0xo9AnFrmim727NwHR+9WzsQ5HyOZ+Idum8gfczCp+
	OJ2avCHjSuWXmcvZsF1D2PbmUYFFizmX/l0RxzXJCEb+O7giCXe/nX+1uNJvSiTelK0JCZRYDFK
	GsXRDmp/Us+Q3bcJno2W58uc2BzYOlDVfrer/73reAgHvNGsg==
X-Google-Smtp-Source: AGHT+IGrMdn+38U9uolOFNk+mS2Fm4W0jJARLcSQoHOhr2LuU6616dbNhFwztnrfvkaZnx6NZ9uZrw==
X-Received: by 2002:a05:600c:1d8d:b0:434:a902:4168 with SMTP id 5b1f17b1804b1-434a9dd00d3mr68710925e9.18.1732800799856;
        Thu, 28 Nov 2024 05:33:19 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bee2sm22577455e9.1.2024.11.28.05.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:33:19 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 27 Nov 2024 22:23:52 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 14:33:18 +0100
Message-ID: <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_053322_023922_1878341C 
X-CRM114-Status: GOOD (  31.98  )
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

On Wed 27 Nov 2024 at 22:23, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, Nov 27, 2024, at 21:56, Jerome Brunet wrote:
>> On Wed 27 Nov 2024 at 20:30, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>>
>>> It looks like RESET_MESON_AUX is a user-visible symbol,
>>> so you can simply ask users to turn it on, and add it to
>>> the defconfig.
>>
>> That would work yes but It's really something a user should not be
>> concerned with. I can follow-up with another change to remove the user
>> visibilty of RESET_MESON_AUX. It is always going to be something
>> requested by another driver.
>
> But that's true for all reset drivers, each one of them is
> only useful because it's going to be used by another driver,
> same for clk, pinctrl, regulator, ...
>

All clk, pinctrl or regulator are used by other driver yes, this one as
well, sure.

What special about this on is that it is an auxiliary bus driver.
It is directly instantiated by another driver. That's where
it differs. The axg-audio clock driver instantiate the auxiliary reset,
it does not use it, which is why it makes sense for it to select the
driver.

I agree that in such case I should not have added prompt for that
symbol. I'd be happy to fix that mistake in the coming cycle.

> All other reset drivers are user-visible, with 'default, so for
> consistency I think it's best to keep it that way, and
> just add a 'default ARCH_MESON' the same way we have for many
> other reset drivers:

Same consistency remark applies to the clock Kconfig patched here, which
select the drivers they directly need and I'd like to keep consistency
here too.

Also 'default ARCH_MESON' does not accurately reflect when the driver is
needed, it will turn on the driver in configuration where it is not
necessarily needed, making it more difficult to trim the configuration
down without intimate knowledge of the problem.

ATM, RESET_MESON_AUX is only needed if COMMON_CLK_AXG_AUDIO is enabled.
Isn't it what select is all about ?

>
> diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
> index 3bee9fd60269..c02edc1b51aa 100644
> --- a/drivers/reset/amlogic/Kconfig
> +++ b/drivers/reset/amlogic/Kconfig
> @@ -14,6 +14,7 @@ config RESET_MESON
>  config RESET_MESON_AUX
>         tristate "Meson Reset Auxiliary Driver"
>         depends on ARCH_MESON || COMPILE_TEST
> +       default ARCH_MESON
>         select AUXILIARY_BUS
>         select RESET_MESON_COMMON
>         help
>
> The only bit that's special here is the exported symbol,
> but that is handled by the dependency.
>
>>> I also see some silliness going on in the
>>> include/soc/amlogic/reset-meson-aux.h, which has a
>>> non-working 'static inline' definition of the exported
>>> function. Before my fix, that would have caused the
>>> problem auf a non-working audio driver.
>>
>> If by 'silliness' you mean there is symbol definition for when
>> RESET_MESON_AUX is disabled, indeed I guess that could go away.
>
> Yes, that's what I meant.
>
>       Arnd

-- 
Jerome

