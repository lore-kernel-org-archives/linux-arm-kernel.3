Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC841061B37
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTJn2aN1lfxGzfT5OItvN7XJkE6c9bHLPDeAOYgW1Kk=; b=K6n/am9dG77txWFZwpN1pnZy+m
	NopS7OPMMEaPyZ1giTqTV7PeHGcVxEKzZEEa2rkfysEg5uBIkYXtqlOJY3J6A3AdvmZeHsvQFUfgv
	Bo/FgHwt8jYTXeBZevqoLeDj9t7dnZxgi6HjFL53qNMGvUWpo5zjB/oKi20gmsJBRQwDYyvnicl/b
	6SqQ0jd3F6LEHzup5uFGvWiIzCCp0M9qXQUigtHL0dyDcAN1epaUj1z71+XhkT5PEcvmS94IcttuL
	F41ahaSfd12Ku34hEdi1l27RUpFxwXVErTjQeOY9d+AwZ/Ol7vAzeBhSqPeqaQ3Q26PpFCMpzDvV+
	J21pN5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Y0j-0000000CvF0-0L5z;
	Tue, 31 Mar 2026 12:15:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Y0g-0000000CvEj-2Ot2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 12:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D32660133
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 12:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40582C19423
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774959353;
	bh=tLzrIdEn1WyEQ7rUAuC/WY8xiLZVLXce48Kb4NPr1qs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jKAuikN6bnLdn5uO4u3Zt8okYO8bMuz5ocsORfId0v8QBcvPj8tyRILrxvE3LAQ7B
	 qyC1nz39sHIK4ix3XLPA8NNUnV3eeOnQhwYyA5YTIkRhVwJmloSwFHyc3V8lbg832+
	 VKwN5R6W1XLhaDEGe+Vz4VzHkWwcZy4uOcKncyCmh/p5dB1KtvmPSOBU5bu4TCS2tJ
	 FvfBAutEOFAT0e8SV3Fi2h09KhiNeRDujwgliGJ1ReX5IXqMUBwuDdDaingS55gCt1
	 bmJCt68i0k6yhkXY5tAyfekk/kbXdvod25bxRETTE5Zm/C2H3yE5X1svYJwCPkkHu4
	 +n3ylqFLmDlWw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38c26612508so45872541fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 05:15:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTNWs1YUM52OT3rdHuiWpiOXtWe7ImbSB4F2MQeuxoJ7Krsufc/oOhGGMIPDxflmcFrkpZf06CxVQNwfEM/K5M@lists.infradead.org
X-Gm-Message-State: AOJu0YwsedQo028S0yucm/JLxRBDzlORk7Cn/Zy5+cppZr0T/zuW5nwN
	CAXduDbBmr/gVC/rmGcmX/t9PkXr9tfyR+jlm9UXJlu61EiLVT1oMpdyfesooIvArmQBM2Y+EHh
	Ya4RC69gkXo3MUxX4Bmh2oFHZH//79QE0hA3Tj1wV8A==
X-Received: by 2002:a05:6512:3405:b0:5a1:3d07:a057 with SMTP id
 2adb3069b0e04-5a2ab7fce47mr5800690e87.19.1774959351946; Tue, 31 Mar 2026
 05:15:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Mar 2026 05:15:49 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Mar 2026 05:15:49 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260331113835.3510341-4-eleanor.lin@realtek.com>
MIME-Version: 1.0
References: <20260331113835.3510341-1-eleanor.lin@realtek.com> <20260331113835.3510341-4-eleanor.lin@realtek.com>
Date: Tue, 31 Mar 2026 05:15:49 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mey9D9b7bHgp5nd_v-xi=YBorOZUWfMu1o4gOmzo1vsig@mail.gmail.com>
X-Gm-Features: AQROBzDFmrCNatrpQCVy37JWlWLpWeGhKF0UAUsoGgs4zB4bmR0GLXOUue6p2R0
Message-ID: <CAMRc=Mey9D9b7bHgp5nd_v-xi=YBorOZUWfMu1o4gOmzo1vsig@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, linusw@kernel.org, 
	brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com
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

On Tue, 31 Mar 2026 13:38:35 +0200, Yu-Chun Lin <eleanor.lin@realtek.com> said:
> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
>
> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  drivers/gpio/Kconfig        |  12 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-rtd1625.c | 581 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 594 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rtd1625.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b45fb799e36c..6ffc95e02cb9 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -639,6 +639,18 @@ config GPIO_RTD
>  	  Say yes here to support GPIO functionality and GPIO interrupt on
>  	  Realtek DHC SoCs.
>
> +config GPIO_RTD1625
> +	tristate "Realtek DHC RTD1625 GPIO support"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default y

Don't default to y for COMPILE_TEST. If you need this for ARCH_REALTEK then
limit it to it. Though seeing as it's a module_initcall() anyway, maybe you
don't need it at all?

> +	select GPIOLIB_IRQCHIP
> +	help
> +	  This option enables support for the GPIO controller on Realtek
> +	  DHC (Digital Home Center) RTD1625 SoC.
> +
> +	  Say yes here to support both basic GPIO line functionality
> +	  and GPIO interrupt handling capabilities for this platform.
> +

Other than that looks really nice!

Bart

