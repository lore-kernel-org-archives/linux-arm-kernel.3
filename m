Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1689C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoJ836Wd7vkGzLLJk2fss49Xw64vZKkegg0JgsJL6/g=; b=YTQU6PhSwbgsBKDvQpCQGB8sm1
	Gr92kdJ1IeUb+DC+piF5A6xi1h2qytHVpBOGBcqsUtRrniqNoY+dTF+2KpbczXqKkZd4uhX20RCID
	3o0uLo1CH4ZTMvOEbhXtYTtsK6hHrYBZCCqXcVJkLQiAwHIefGqaZG7mULKcBGpg1jS4n3rWutCSf
	xVDaRJpQ6n+aNXZN0+PLqsc2IWo+RKQyrFeDCPzhXiORty0gUfDLkJJANTTdqmaUFZbq2wY6jHRCG
	O4oA4ZYiExdN+UQ7Lpaji8wATxQSwMabTjo7q3T7evXRgNGBydFSiTwYgwArKhvEsYmXj6/5eze0V
	bMssVD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twz2F-00000005839-2uZh;
	Tue, 25 Mar 2025 07:49:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twyzv-000000057pp-0L9Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 07:46:56 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30613802a04so53456261fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742888813; x=1743493613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoJ836Wd7vkGzLLJk2fss49Xw64vZKkegg0JgsJL6/g=;
        b=jztcKPYcBQBIXphfEm+09SiR/f4d0i2dsLCOYszOeONN+5hQaiQR1JkgHd2CzGpvpa
         O/o+9ok55ixCfLRQaviXKtv0Vjht4V9m3JBiCHiXC0RVEXpWW19gGZzJS9tum54OY9eO
         5cK9hQOb8RNXYKJBCHUbHFYz6HMtMX7hA4sJx4QGgy5+/o9P17fyIYvvVt4xNuxsJAsu
         395EzqvbrVmwG2tTMvTTkHgTdvjf5uwH2HmTT6E/edO31bB/LKZr3ZrT2D4B30bAs5JO
         5b6ysJcZ2hicDoz30wW1+N8ut5KvacgALn1MuUByI/+Krl15gZBbMLqE0RxGthP7ivGZ
         EoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742888813; x=1743493613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoJ836Wd7vkGzLLJk2fss49Xw64vZKkegg0JgsJL6/g=;
        b=CkEn/LGrjzMA1NaQJc9/bJ4MTtSuNqUvSCtpC2kQ4AkYmHqb4mceOr7apdMh/Uqeri
         0qASg/52y+hPjO+sEEHRWqIDw0TXrVAdRm19rkrmqlNyy0ZFFUq7ZVNbGaKJ2HTKZpc2
         DYT9mzVwH+4wGI7JaY5bFBultHspKbDt4YU7HkyE3vrJU3w2IYVjZnmzpwQ+6Dj5Yoj3
         AoIF4F92unS6Dq6PXuqp8jQDPSGRBPU5BZEmY+yjQfqP53wXMpHVkZ+R00+MC0YU6APf
         SYItQWacY+zs8dz6H+T/SW2fCHTmIA0KRzETv4AkEypcE7pBloB4diP6fvr65Oclyuyh
         DhSw==
X-Forwarded-Encrypted: i=1; AJvYcCXdjKKHBC9ewMQag4ibN8KbuNu63SFIftY1zxX7+KKwS9+weXKsF7IO8Ldq6xq9d8b5ta+MnW1Gyqim8lIDyOG0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2/VU9STOLloDdzJKAEiYfPV7KrsKeS8q0hqU4mMYSoImPZuGt
	bH0sZj1QCIq+RBIHfc9Drv5IQsqYzPGx0iGUx074CTwWtw/FBQlsokk+I70iNyUkuEErQaxJP++
	Bhvs6DCWidsQbn4whJnsW/rAbOTbakhc33OnWMErMWLxihHx+
X-Gm-Gg: ASbGncvI9kNgFFLOB+hfM1JWDl0Lt71EosMEuCw+skBEq5Mu9ncQkI3gWsi29qyxI3Q
	SHKbPVZHac8Kq9jygP7OHeefEFbtEcDv3uuBG4vKYRA+XYPRnm0SP/F5ox4ypY7XMZLCSoFxjW2
	zUYHGN72oKdqRwP2Yyy/Gs/IJr5QfyVM+r2hRnQhD7PVHBM8vAKcjW2qrxWQ==
X-Google-Smtp-Source: AGHT+IEXQevg12XN39ACCSgu7woEcRZesJCodzxnQwDV3gYwSkv1bJoPPtupvwtOAUoMN/cjKoHLWBSSAF9PWwsTMWk=
X-Received: by 2002:a05:651c:1989:b0:30c:1017:e5e2 with SMTP id
 38308e7fff4ca-30d7e2aacacmr65142341fa.26.1742888812530; Tue, 25 Mar 2025
 00:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250324213340.4129384-1-arnd@kernel.org>
In-Reply-To: <20250324213340.4129384-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Mar 2025 08:46:41 +0100
X-Gm-Features: AQ5f1JrDiS4iAiS5mzXk4C4Rng3rq7rGhoSulGPK8xWU4CpD_aXZHddsJebMFnM
Message-ID: <CAMRc=Mc1zPjuU2KAWkq7s=tizDC+EX86DPNoRjUxutL=U_pY_w@mail.gmail.com>
Subject: Re: [PATCH] ARM: davinci: always enable CONFIG_ARCH_DAVINCI_DA850
To: Arnd Bergmann <arnd@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, David Lechner <david@lechnology.com>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	David Lechner <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_004655_388948_85FECD9F 
X-CRM114-Status: GOOD (  19.00  )
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

On Mon, Mar 24, 2025 at 10:33=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A change to the clk driver broke configurations that enable DA830
> but not DA850:
>
> arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o: in function `__da850_pll=
0_of_clk_init_declare':
> pll.c:(.init.text+0x30): undefined reference to `of_da850_pll0_init'
> arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o:(.rodata.davinci_pll_id_t=
able+0x14): undefined reference to `da850_pll0_init'
> arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o:(.rodata.davinci_pll_id_t=
able+0x2c): undefined reference to `da850_pll1_init'
> arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o:(.rodata.davinci_pll_of_m=
atch+0xc0): undefined reference to `of_da850_pll1_init'
> arm-linux-gnueabi-ld: drivers/clk/davinci/psc.o:(.rodata.davinci_psc_id_t=
able+0x14): undefined reference to `da850_psc0_init_data'
> arm-linux-gnueabi-ld: drivers/clk/davinci/psc.o:(.rodata.davinci_psc_id_t=
able+0x2c): undefined reference to `da850_psc1_init_data'
>
> Select ARCH_DAVINCI_DA850 unconditionally to ensure the driver can still
> build.
>
> Fixes: a31b4dcf188c ("clk: davinci: remove support for da830")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-davinci/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfi=
g
> index 3fa15f342240..8f66de0405d9 100644
> --- a/arch/arm/mach-davinci/Kconfig
> +++ b/arch/arm/mach-davinci/Kconfig
> @@ -4,6 +4,7 @@ menuconfig ARCH_DAVINCI
>         bool "TI DaVinci"
>         depends on ARCH_MULTI_V5
>         depends on CPU_LITTLE_ENDIAN
> +       select ARCH_DAVINCI_DA850
>         select CPU_ARM926T
>         select DAVINCI_TIMER
>         select ZONE_DMA
> --
> 2.39.5
>

Thanks and sorry for the trouble. FYI I want to remove all traces of
da830 during this cycle leaving da850 as the only platform upstream.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

