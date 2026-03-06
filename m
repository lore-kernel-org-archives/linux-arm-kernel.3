Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABBEFC9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=; b=hA3/FiugpGRNCqBc4xelvGtRBo
	YpYlJLZKglcMYClWo7b1BYHBpddiNTbjs9mFltKOPY0dEMO9qvHqAfHB1iLRJM7fqHdO0Ienv21J7
	8MKA5Iadpm/P/nI8KGb06EIiUfitsAUXodJ8iipYlPsb/qCn7trVlWA/3ppHmaYNQESOHJW4y1vuM
	YN9uVUnfV95nKILPlxPGwQyWE4XmB03Ei78Ni7lK3u1LdfxhENo7IdzqSxw3O48D98VgHHNki7aI8
	0F1ChzLdGGyLCE0ZBwfd4/ird2BD6Qe6REUx/izwi3toV7mvPNVoWHZr9myRKje3OHtrB+ii3Zl1w
	SSTlWtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeft-00000004eKQ-3R12;
	Fri, 06 Mar 2026 23:33:41 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyefq-00000004eJ3-3CLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:33:40 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3597df496f6so3989436a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772840018; x=1773444818; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=nXUq0Cfavs74wj2uvslg5l971BVwk6u/JROHsQnoAqPvT+/IlBiPxFTYaiyx0jM1Hy
         GBQR0FzdVSyUGeCw7T9PZr+cm+BJsg0SqDY2rZ70fauFemT3pnFdwn3UO78ZtA7idkVv
         FpCqr4swG4hmhEWRxQLp6j5VZroQQOzYg9Anci1FRwLaIUEkn4y/AVb0XRiIBPxKHUGh
         TBByC+cD5kgn2MiAkpxwqEDmTmcyVFz1sUsNszToKtT0pwhITP4ZVobd0MMWcXbZL40q
         kjrvakj6E8KbWTKtEGKLe+MsWs0vCW5vojJpvx1dGBvYXHSWqxkuPjAaYo+sb27Hv70t
         OPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840018; x=1773444818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=jX7Eo50I7L3ojqAysEjYR4WA+RzRtwuWLdl+IFEDXN8bqj7BivnAAgR3YxEYgCTg9S
         U6lHiI4f1N0Yr/tRPOeHJeXvV6PvC4ePc6tj3EKW1yxK3UCiRIsqekM1MVTF4c6wtU7H
         MC0kFYTO7+MbrvDqUACPb9OQAm/VrQJ+wdgpWYeyRebZcwBxXaA5q+z3wL589A4sjkBw
         DJEXMzYTan1Re6A1yWM4g1pRLWCwalgznS1tFp8qT+gAf4hdQCK4qVLFPahgGF4m6HLX
         2V3STllYrC6aD8VJL8vwrn+5wKywuXFaOKog/vzIlUuqfDEudt5fDxsFmXaoc9k2i0qu
         GMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVssqgcgTn/xa+J1meZ7qJRSU2hqH/sjscgcwMJ6cZwbUEPWificlbM/QomcMOGgFtQEdCqYadhwvgg1YXz2Af2@lists.infradead.org
X-Gm-Message-State: AOJu0YwNishsEkKLasgryU0sjLq1rcbNflHFx+ajXJQkVpgo7LeFYhce
	355+wWMlfh9+nM6z9x/SaWChgdywqkGnKsvP9/V6hShwAtU4yjHgVmaN
X-Gm-Gg: ATEYQzxTYz34D27ylyoyWTbjronnR0my1xzic/riLV9nKRSQ55lK1DRMbVGpFxltEXS
	auiufrvmc7vC0W+XcSdII722HCs4P5HCed+kHBYMxUCDIlqX3MLbPF7C/7bMojPtJ4Gkyv6NnKv
	n0+xZi9dGPY7RBT5DIZdxPEKc92o+ga7LzbTbtYQpZ+YCqER0mCkhFu1xvOPRFmoakbqMlNkaVB
	E0n+bR9NBtdnk+Dk0bJKGxGVKt6v0XDZHMfFP2At0EbIYYfRUaV+I6Grtq24+slHvbLHv3+orEl
	ahaMgq4//EKwN3p5DdA3WN+ffg3DRzK+GmZ+lbh2SbsjpGNhCMt7GVdxUTvlHemm/3I23Qy7bDh
	OevuYSn0dZq4LWcZM/8/bndc+4modH8EEORH2nY2H0o6MxSkuuqhYTRB9/K86HmTeWGRnqgfjP7
	tMq6M65G2rizoCXz5YHtQH6Ha849/q9+cMLwCG
X-Received: by 2002:a17:90b:38c4:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-359be31746amr3476775a91.24.1772840017833;
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2de79f6sm6579296a91.9.2026.03.06.15.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Date: Fri, 6 Mar 2026 15:33:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 10/14] watchdog: convert the Kconfig dependency on
 OF_GPIO to OF
Message-ID: <07aa5d40-96b6-41a1-b8ce-22f2c2c94aed@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_153338_797326_4F6A1A11 
X-CRM114-Status: GOOD (  20.13  )
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

On Wed, Mar 04, 2026 at 10:02:31AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it

Actually, that isn't really true.

if GPIOLIB
...
config OF_GPIO
        def_bool y
        depends on OF
        depends on HAS_IOMEM

OF_GPIO also depends on GPIOLIB and HAS_IOMEM. I don't know why it needs
to depend on HAS_IOMEM, but the GPIOLIB dependency is real.

Guenter

> controls also provide stubs so there's really no reason to select it
> explicitly. We could simply remove the dependency but in order to avoid
> a new symbol popping up for everyone in make config - just convert it to
> requiring CONFIG_OF.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -250,7 +250,7 @@ config DA9062_WATCHDOG
>  
>  config GPIO_WATCHDOG
>  	tristate "Watchdog device controlled through GPIO-line"
> -	depends on OF_GPIO
> +	depends on OF
>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device

