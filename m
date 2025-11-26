Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7004D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=; b=Xmm1oF3bbxB4m8thDO2LF2FeeH
	jy3ASEHoMmNL4Qt+tL+71PBU/eKyoAYiWLcxQ2n8x/q7zUJq7MjD4DDqxucUZqciQepFXalzCH6vb
	flxvBgzM02okYHKIhTHJKQNjGhE6i32BojVFP4qGPavhA47mXD5y0SFt8CU6NuMhiNYRcJM3Z6eV8
	8vgNM7QlyBfEiyFijTmGjTtEILxo6tjZwzV1Y7lYdz6fHIZ1LZxXlNTibjONQuuhfiaT9UbMJ0qGE
	UxvCaJwiixO8IB5ysMZ2KL4tZVArQ9/h/M9XiWl6MQMUpYowoowiNtJ6GCDmTU2dpuHmgXGfZU+AZ
	2qwkXJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGVR-0000000F6z4-2oII;
	Wed, 26 Nov 2025 14:28:29 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGVP-0000000F6yh-0cPJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:28:28 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59581e32163so8036533e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 06:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764167304; x=1764772104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=IseTI/+1FI5Bx/aZS9HDVCAoPHV4p4EblsF3fMMYn4nslVSuXUUQGktgxfX+WseRpd
         XjkGAZZK45ZtoemdEq4J7KAmFO7IS8VOAYRPQfbEo7sQ/vssRTlHqy31alCHk0ScOiHs
         xa4ywhtlBxCdpnz0/QGde5NpUc1pATOtC1i839FdR9bAPUvOqMbpIhFZmK5HVRvZ6wfb
         OwCOK0vGo5m4GcEAr1C7gtv9YTMAaYQJ89NNP0EJgjs3mdc2792JKaG2rxzN5a9M98BJ
         FuN9XsYrbP8Gj2B9ZT/HCPagjOYiYn2tmlTWo7t/pZBh3nUVG9hwqSWJ6lqCxSBhU6bU
         BUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167304; x=1764772104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=jujtNyzlhyLTnvU0UStTDLC3F+wsbXbhMF7DQv8tBIaRfj3vsTsCORTsJ+sWlpbR5J
         QpNFUwxCM/xqhHlSV47pHcFHykVyIkMNwpNuCUvrP0OKhnv4pPzf9j6WV4jazERuvMFk
         1hucJK6naIoMvWDT7Rx1rETCQAmBEINOt7y3kTZc9HHXdYqALxoUAt5zTjrSLI615EkG
         wqFRjVj8C/uN5gBRbMSF9QNsnufVNdPPt1bMwDvoDqRihM7AbpcP474NzP69a5sEfM7q
         Aa3fl3sxictdS+8BUnPS71j+tF65MyddT+ty7KCEVWXr1WqiV3ckM92cSbTgk5+pp7d8
         uEMA==
X-Forwarded-Encrypted: i=1; AJvYcCWfkJUdOE989EdZnWEsQAbMGOoRvPeRkoNINWQ+YivKFBoBFmTKPss921JqAOFG/eA2rbu6CfI6RoNFLN3aSI43@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt6uK32WuqRKLCeehW5HexE5Mem+NvE+QYt3b9XfjGEmAYpT8D
	yKYh3euS16fv1wE7Gwng+xKZSDjAzEq/INVTWOjRDQPBQ4QWvosypcEW9J42ZZR4OrXIUpxVtO1
	VZ5aLYxeMaNKe20hWpq/QdWss+trHedVCsVy2ZNB63w==
X-Gm-Gg: ASbGncvfu87X084ZiQqhlJCYJevPvDrT9PF1UD1kTX8M8LYxMiLjrDSqNDiDlMvM5jQ
	KVaTQwDsA3Lfnw9S1AJou7gnBKSujuXaffUxu5H7ObdDDlBZYHJvYr38qijHpTucNyPdv6N7B8E
	XMH+2X+OhVE0n4wHGE2A4cxpqqn8yMS8kYAOZCWzgxz+zakCc83/+4vkH19buhmbR09qjhxbREZ
	9lOso3hTBFnL/Y60xw1tpuaSdB1RiJK9VETobzRA43WECcdNEauLObBuGpjT9UJOMhdPoFz+qyx
	N6LIwo+MbDqNMWvcLWHhiU47kRU=
X-Google-Smtp-Source: AGHT+IHk3ZX4aUUBolMwiCMXAcXiwyT2Dyate9UnnaEtVgZgfmV77bNvl6bV8cACmOgABB87QFqEt5N/Ut+6mcoRVj0=
X-Received: by 2002:a05:6512:12c4:b0:595:7d95:eacd with SMTP id
 2adb3069b0e04-596b4e4b76dmr2588737e87.8.1764167304291; Wed, 26 Nov 2025
 06:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
In-Reply-To: <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:28:12 +0100
X-Gm-Features: AWmQ_bk2gQa2v3AxwtOwsX10QuQjgn1DPsSzq3G8PlY09kgQ-V2J9JlUGzmza-k
Message-ID: <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_062827_360530_73AFB446 
X-CRM114-Status: GOOD (  22.25  )
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

On Wed, Nov 26, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Bartosz,
>
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   arch/arm64/Kconfig.platforms | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -316,6 +316,7 @@ config ARCH_QCOM
> >       select GPIOLIB
> >       select PINCTRL
> >       select HAVE_PWRCTRL if PCI
> > +     select HAVE_SHARED_GPIOS
> >       help
> >         This enables support for the ARMv8 based Qualcomm chipsets.
> >
>
> I have noticed the following kernel warning on our Tegra platforms ...
>
>   ERR KERN OF: /__symbols__: could not find phandle 794981747
>
> Bisect is pointing to this commit and reverting this does prevent it. I
> am not sure if anyone else has seen this?
>

I assume it comes from drivers/of/base.c:1295 - could you please post
a stack trace of how you're getting there?

Bart

