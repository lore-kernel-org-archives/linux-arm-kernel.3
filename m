Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909FEC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdRpwrOaaRjrnQHkn8gCCooh0xVjwEaGW5EGRqe/Jv8=; b=nVZuQIlbFtOkaF55FU63oKNZgK
	4nyC3s28btquwdlwWg3wXtIh7iqvQpYAL/59LfYMcO7Zy7pk6JOsFWT22GvRCG51ZJabW7fnMR5qf
	1gcO1qrri2738ZTc8RP1rUy/k2WcMD97YYkzLGJ8GTGe1FF51VTijaneE+Dtz8d/fdqXNEnrH4ilJ
	yY+JjjkASiQWvRFrjprQK9Izc0fprOwyieXoDj2bgfjsHeB8ix0NN2DFDJKFaGRAfgE4rh9aui54f
	UuDkmJnYyTLcse44y6J84LdJXKFYHsD22wBLI/qrST0ONAyCsrxRQ5V9xO+D+VDEj8engg9ONsATb
	7BR1DSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7qh-0000000BUd0-0qss;
	Fri, 26 Jun 2026 14:48:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7qg-0000000BUcU-06S5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:48:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9154542002
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753651F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782485285;
	bh=UdRpwrOaaRjrnQHkn8gCCooh0xVjwEaGW5EGRqe/Jv8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PsD6lXOXa07iSRlcfwt8MDmhOsq1zZs4pkUUikDl28aq06rppi4t88izrAU10T4lC
	 KVXuLEMmxxEjupNQ5Ibpsyb0SxpNJmIKXaafPjPnLLccPYmreRD73K2tBlpoG7j5sd
	 RDoiyKfJ/OxDgmgFPVtOgPTKiiMaWeNLAMyNPCUEsj9zRx5o0QxyiIe+Ko0axh8iOk
	 6BefI4hV4M89G54NmQyl/RtSNe9BOT9tfxxtzWRmgANAewbcN71SYxepB9m8tepwhw
	 lVZkraEX7O+9TvVVdYyAP5nrvqj2qqY8M6XGohNaq+YMHGnIiJtVI8icyJdJToiyTE
	 b8FJICHsaKuAQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39ad1d25561so6202231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 07:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorhuZnisVjxZs4t0lktEQXT/FuAksP57ERR6TVk65AosuJHExd3GNqmb4CW5Eorc13Y7vD34sJSTegkMPfbUsQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlGdW7RwQfmFVxBa3eYyWaEsOOHTmxuAdNblyn5VKW6ba7Mp1I
	EJb0HJJVuwmF1jPgdcoBM2arcToB3dpc2U5vJJWzi7oLa4smt+4WNwoA4bhFSs1BzX6y6r+hPMI
	uzSo3CBVn+I3GbSd//M/yWAKeP2MJVJAe2fTzy92fQg==
X-Received: by 2002:a2e:bd03:0:b0:39a:e1c5:6f38 with SMTP id
 38308e7fff4ca-39ae1c570d3mr2163391fa.24.1782485284112; Fri, 26 Jun 2026
 07:48:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 10:48:02 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 10:48:02 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260625115718.1678991-1-v@baodeep.com>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com>
Date: Fri, 26 Jun 2026 10:48:02 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mcz=GPrjnvQ0Q6VxfqHDO0W3yq7FpRb=bPi-Jxu-GFuqA@mail.gmail.com>
X-Gm-Features: AVVi8Ccrn34D3j7CJ9eL5y0B-K12ypG8-rk1rDfezPbvQfjSrS7D45oeqSJjK0Q
Message-ID: <CAMRc=Mcz=GPrjnvQ0Q6VxfqHDO0W3yq7FpRb=bPi-Jxu-GFuqA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: fix sleeping-in-atomic in shared-proxy;
 restore meson non-sleeping
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 25 Jun 2026 13:57:16 +0200, Viacheslav Bocharov <v@baodeep.com> said:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
>
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
>
> This was reported on Khadas VIM3 and worked around for Amlogic by
> commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
> sleeping"), which marked the whole meson controller sleeping. That
> workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
> no longer detects devices, because its IRQ-disabled read slot calls the
> non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.
>
> Patch 1 fixes the proxy locking generically (always a sleeping mutex).
> Patch 2 then restores meson can_sleep=false, fixing 1-Wire.
>
> Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
> gating on gpiod_cansleep() change behaviour. No current device needs
> atomic (non-cansleep) value access on a shared GPIO -- every report
> (Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
> (eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
> which is what the proxy exists to vote on; bit-banging that needs atomic
> access cannot work through voting anyway. An alternative that keeps
> atomic value access (split locking) is possible but adds a second lock
> and new race windows, so this series takes the simpler mutex-only
> approach.
>
> The two are a unit: patch 2 must not be applied without patch 1,
> otherwise the original VIM3 splat returns on boards that share a meson
> GPIO -- please keep the order. I have not Cc'd stable; I will request
> stable backports separately once both patches have landed.
>
> Changes since v1:
> - gpio: shared-proxy: open-code the descriptor mutex; drop the
>   gpio_shared_desc_lock guard and the gpio_shared_lockdep_assert()
>   helper, move the mutex rationale to the can_sleep assignment. No
>   functional change.
>
> v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-1-v@baodeep.com/
>
> Viacheslav Bocharov (2):
>   gpio: shared-proxy: always serialize with a sleeping mutex
>   pinctrl: meson: restore non-sleeping GPIO access
>
>  drivers/gpio/gpio-shared-proxy.c      | 66 +++++++++++----------------
>  drivers/gpio/gpiolib-shared.c         |  9 +---
>  drivers/gpio/gpiolib-shared.h         | 28 +-----------
>  drivers/pinctrl/meson/pinctrl-meson.c |  2 +-
>  4 files changed, 30 insertions(+), 75 deletions(-)
>
>
> base-commit: 840ef6c78e6a2f694b578ecb9063241c992aaa9e
> --
> 2.54.0
>
>

I have no idea what's wrong but I'm still getting two copies of each email
as separate messages to my inbox. I'm not seeing it with anyone else. I think
there's some issue with your setup.

Bart

