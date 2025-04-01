Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55749C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiCJ+0nvHppI8Z1iMldDvXvFUvNA7Z2vIeGOxDeUG3A=; b=NIgCqEPgh9mbRECjw/QrIkrjk+
	wXYj8g1FTsjvM1xyn6SctObWOkXxI0TCEGvOlu6HlcEa4eYGTWcc1ywmcvSy3ZnlFHkEQGMNq1Myz
	hKgJNkDo/UuslCCR5CEQl7/rHfGbpDBP1OyL69PvrLgSfwAp5lEssR6Dc+GgW07+PQ2jv212OLBrz
	zfXNqJsHs+WS45l7rACRBzYIoXdhq8GCkfqLVdEtVF7zOC+czE6mKQkJ6zncvoMDFaZ6AEHs+FE83
	Cx8IOBGF6FjH26OamZNewHgttFeZ4/NjhbU9LewgKh0xisGrYZm0264R+vmv5Gd3pXdatJvniVZ83
	9Yq4yqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeYN-00000003tPA-2gXM;
	Tue, 01 Apr 2025 16:33:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeSK-00000003sIt-0SvG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:27:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224171d6826so88344115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524834; x=1744129634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiCJ+0nvHppI8Z1iMldDvXvFUvNA7Z2vIeGOxDeUG3A=;
        b=34EgK93inDI5LRYWyoiD3rFpfJeeipifW76iGPiJc1/4+Nu8SQ/1gK2jAjYf6tIeZb
         kfKsBsPJxhZ2Sl9Nn1lFoNWOn6Pjo/bAkyFCILnQjvsiCKeUcsNqn+2jGIf70LHy9YcO
         a/E8RFka7InN6wgOVVp8rJwup5F3tE/VaI5KjvwoImhKLpR/9xpxkNp+4+aJWUYMBCVo
         +ChbkLitb4G5mHV0ElM9EefLrHWVoNmJ5zhRZUhdAfTxniRDaF1m4vJQ2IrIFXhDKnLF
         VLoVWvtcjwQ0t9TGWvE7N6bepvxuwFBhPmJ3qP7H2a7L1coNfoTzguZD5HmJTm63bzrj
         vWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524834; x=1744129634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiCJ+0nvHppI8Z1iMldDvXvFUvNA7Z2vIeGOxDeUG3A=;
        b=TPh7K8wf7fYYTRc0sEaXl/BeQMqbbrNOrdXlAkwwCrCGwKy5O1j7T3dabCkKlWXX7A
         5Ck+fJ7htSSDhFmtFWPxMnkx2iInT7K1r/Jdh0xZ0UOvG8Zh2momuB8Be1x98SGxH/BF
         cuFlOXW219+PciHI31/CeX5V5p2Z2D63yzqmVCIzvJwOXmGUbSV6uE4tqLq9eXSda4yf
         n6Wn7UcV9V1R2t+icMdayZgxKRern9uEW90VGpXAbG7ys9oytaWFYxZQbPAvqt1e49mo
         Jb+D5+1EnnOBaBI1Q5tCOp0Elb/eGqjB95L7n0xs74TucCE+IqyjsFmuV7YLC/x7j2FS
         StLw==
X-Forwarded-Encrypted: i=1; AJvYcCVxNvue5ItcS5lnPvrJyq9KS1HysG81PV6V8eEJNkOhQDoIAcFmsJTarBR7KlgcXyWL2EtWMvpJJ9tI2mwWaVv5@lists.infradead.org
X-Gm-Message-State: AOJu0YwZqfv5BI9ZyRTiV8RiKwKdB7N8CWsQE8/dlCD9FrrzTWm+Flzd
	YvOYGaKq1NtmvLNSgphXxy4pHMCX8zrd49sT/C027lf+qu+KXR2xN/iaOJc7RQ==
X-Gm-Gg: ASbGncunRsWxd6asB1eX6yhFOygTczxUWKzKGpy+WqDGK5ll1bXCvbhrBrsg4kiS1u2
	9LHvsrcFz8rwiMuE//6CwAAzH8Tye0om8tpzxyWkWh9CmlDluNRL/2RtwqpZLBrs0RvC63ufiTm
	v1DG8GQ7k37O0p+KGn1lZcm2dEo11Y98qWWIjA83OKHqJ8DkAKYO63GPo6Gfo/ROQAO+mWXdtin
	oUHy0UTgP5IRXinZwptkELKDfa8YcLPa1sI6Jupw9HIBx8+nENEI9ZylHGGbG6b/Sa9Aj9M9+Q0
	5KHNCLHw2FGYbVuHA3SE4wqtdhYEPQQsSHltX+lzgDrVQIPMpQC1lPxrPFURlk0x0HUk9i3CuNF
	Jp3lYScpFnWzApy4=
X-Google-Smtp-Source: AGHT+IFuDdi1VulATC8EaumQBhjKKw5JE43KeKuzHYuRoICEO7rhRETwg2aMwK6/jUYFXFP8w4bWLA==
X-Received: by 2002:a17:902:ea0a:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-2292f9f981amr220280025ad.46.1743524834183;
        Tue, 01 Apr 2025 09:27:14 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deed14sm9416725b3a.19.2025.04.01.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:27:13 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:27:09 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z-wT3ciq7nL5wa1X@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-6-willmcvicker@google.com>
 <9f594cf1-f1c3-45fc-8d1f-a5abe6c84699@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f594cf1-f1c3-45fc-8d1f-a5abe6c84699@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_092716_148009_8C98E0F9 
X-CRM114-Status: GOOD (  22.67  )
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

On 04/01/2025, Krzysztof Kozlowski wrote:
> On 01/04/2025 01:00, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> > 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  drivers/clocksource/Kconfig      |  3 +-
> >  drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
> >  2 files changed, 42 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c85259967..e5d9d8383607 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
> >  	  Support for Timer Counter Blocks on Atmel SoCs.
> >  
> >  config CLKSRC_EXYNOS_MCT
> > -	bool "Exynos multi core timer driver" if COMPILE_TEST
> > +	tristate "Exynos multi core timer driver"
> > +	default y if ARCH_EXYNOS
> >  	depends on ARM || ARM64
> >  	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
> I am not sure if you actually tested it as module. On arm I cannot build
> it even:
> 
> ERROR: modpost: "register_current_timer_delay"
> [drivers/clocksource/exynos_mct.ko] undefined!
> ERROR: modpost: "sched_clock_register"
> [drivers/clocksource/exynos_mct.ko] undefined!

I tested with the gs101 ARM64 configuration. You're right it won't work with
ARM32. Thanks for catching this! Since ARM32 architectures don't have the
arch_timer, I'm not sure if we can actually support Exynos MCT as a module as
you wouldn't have any available clocksource during boot. I'll update the
Kconfig for v2 to handle this and make sure it works for ARM32. I'm guessing
it'll work with something like:

config CLKSRC_EXYNOS_MCT
	tristate "Exynos multi core timer driver" if ARM64


Regards,
Will

[...]

