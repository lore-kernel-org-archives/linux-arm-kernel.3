Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAF4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVMJ0XfN9QvODwePy74mrcG1WyO6ynuUF5BlFrOKL7Q=; b=hS4GxTOi6q15oIVx2vCpQ0Yjgg
	uWJ5cbDebocorGIpF6XV30E9sO9vMcnOiLz810VNLFYJ3PEbGUhDtZ2nQdRzOMnU2N3JKe/Fsgn5J
	m2uFGVaYargnOJ7MTV+s4gmAP+PN9bJqbdQdgay6D2nJhr0XDYJftIa159J1fidj2OayQUf9WhClE
	3XRbZmD6MtAdR/SVZiCi0Y6uT4RDAyrBkKNyiN0gN414Xnct73Qj6CGHNBpdqhv8K7lIFJIuul6TQ
	X8qufLI8f2xU3awicmbuz2iCbCBUO1wcuWuHbaxMzm74/zfzPymu3AsSzVd48TAYL/x5Ihx3b5uRv
	I6aWbqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1q6-0000000Dkt7-1NUV;
	Fri, 14 Mar 2025 10:00:26 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1oQ-0000000Dkel-49NU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:58:44 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2291114e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741946321; x=1742551121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVMJ0XfN9QvODwePy74mrcG1WyO6ynuUF5BlFrOKL7Q=;
        b=qJbkdBwl6QX9WUtF6aAmcEfjXC7o2eWS9nDkxR1vQBN4sLae6j2Xfs+OQ8DJ8J7d4t
         P4dine+tyBQ51nNKtLZx6cwE9COsH+WYPSzqDwNOLVHnpubw9k11vG9y+K4BAwZsmvc1
         vqHRqLTOuxbHxL9gCIcdOpAQHDjZuyWX1vO/m5CuFMZiCB9UtczPQLkpHXmzEYtqBtJE
         WAC3mDb1Ozyj2ObaRgjoDO+spSTiay1FTh7UZvMDD2b73YZ3SV5Ov6GYEtUol8sgIqWQ
         747EoIi3PXOjd3hwxCtUl0l8CI2sSzREjFOphp7pTosEiMsxUk0OQUxWv1Ha82cI7E9t
         QK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946321; x=1742551121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVMJ0XfN9QvODwePy74mrcG1WyO6ynuUF5BlFrOKL7Q=;
        b=uSnexWcVIEDn3/1MmUAZTj83yC0H/AYBaeKA2vjRTFewG9/oK/dds9ewpjDawZPRJg
         1GAabMI+EgXLvlgLoiXHQLT/aJ0O6CM20vVAWfZyumI4VcwzXrJ3v3PiDGq6PFeK24ul
         B5meH1Zzo22HaEdvtlNSXpN3rOm0ru/afHbwBH/nsOh4Lcgz3S0yA7oHm42fzO+cXieN
         tDhoJi8YLK/lE/0P/EvKFibWrN40wtVZWPF/Y9MC6OtZAdHKKqpirPqnP02Skc/5VuUi
         aQeMX0rNok/zQLua7aYnspXK/WjjaT9sCbVRAveFnKk6WLdlZu2K51PVKugMDDbv5bDO
         Z+mA==
X-Forwarded-Encrypted: i=1; AJvYcCVjwIvy5yGTQB+QR5yiXXE5R/UJBdxMqhIp5ausW7rCP6WFJnRzNbJvFSck0unSTwjq9RJxtcgUk7fq9gu32X4J@lists.infradead.org
X-Gm-Message-State: AOJu0YyoHVr7Tew8k+WMr4+YAkYJkLFr5BRk7ajWZnn7078t0kiwq7s5
	xU0YSd+nZujPj1ZJUSyZB4qEUAWVQqiltUqy3UiXvB45A0yqdHDZ7zVYE7zpn3zoR12u2V+l9vx
	evk8L5sMLtYE89dzk2Eo2jY51C/f/TvV5xh7RfQ==
X-Gm-Gg: ASbGncs+jxnGePbkBrsTZren4nXv5cbJAv1n/VT6Hu6IXkY9C6HLGsJ79YlOw+vmp8m
	9SA+MAQtr4HIxjEmp9DSiWdyWng2IM06VuZoc3t0R8k/nd3zfwQteSJ3/WMVsZ7tcKEB+N8syqF
	a514O85LkHaXLgYmwugm9PFwq14eh4oSkbdIs3J/h59PgFG8RZ6jwxPOWWXHjWkvZZiw9U
X-Google-Smtp-Source: AGHT+IH9j3IpXeGPyRXEy97HD90nMbYlV7KsDn8yxwE7zodQopDU2nIKQMb3fZvnWWerH5fkqmb9lqn3N0aqV3VOL1s=
X-Received: by 2002:a05:6512:3c8a:b0:545:5d:a5ea with SMTP id
 2adb3069b0e04-549c38eaca6mr633793e87.3.1741946320671; Fri, 14 Mar 2025
 02:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240401-da850-fix-select-da8xx-v1-1-a348ab91448f@baylibre.com>
 <CAMRc=Mc7Xa58J55_kenkr2OA=ho6YH_gENOFEvAiA+q+p54dDQ@mail.gmail.com> <4866908a-2e93-4d19-aef3-5203e002a8cf@baylibre.com>
In-Reply-To: <4866908a-2e93-4d19-aef3-5203e002a8cf@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Mar 2025 10:58:29 +0100
X-Gm-Features: AQ5f1JpPB3PpPt-JuLNaawcumS6S_tcIHXPiru5slPy000cZaWv72avVODqoiVs
Message-ID: <CAMRc=Md=Qz1AEToj4ebg-0HTDgKm=pfDhvmJs7Hngt2x_CpWSA@mail.gmail.com>
Subject: Re: [PATCH] ARM: davinci: da850: fix selecting ARCH_DAVINCI_DA8XX
To: David Lechner <dlechner@baylibre.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_025843_026618_909EC358 
X-CRM114-Status: GOOD (  18.53  )
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

On Thu, Mar 13, 2025 at 10:17=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 4/2/24 3:47 AM, Bartosz Golaszewski wrote:
> > On Mon, Apr 1, 2024 at 5:10=E2=80=AFPM David Lechner <dlechner@baylibre=
.com> wrote:
> >>
> >> Chips in the DA850 family need to have ARCH_DAVINCI_DA8XX to be select=
ed
> >> in order to enable some peripheral drivers.
> >>
> >> This was accidentally removed in a previous commit.
> >>
> >> Fixes: dec85a95167a ("ARM: davinci: clean up platform support")
> >> Signed-off-by: David Lechner <dlechner@baylibre.com>
> >> ---
> >>  arch/arm/mach-davinci/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kco=
nfig
> >> index 2a8a9fe46586..3fa15f342240 100644
> >> --- a/arch/arm/mach-davinci/Kconfig
> >> +++ b/arch/arm/mach-davinci/Kconfig
> >> @@ -27,6 +27,7 @@ config ARCH_DAVINCI_DA830
> >>
> >>  config ARCH_DAVINCI_DA850
> >>         bool "DA850/OMAP-L138/AM18x based system"
> >> +       select ARCH_DAVINCI_DA8XX
> >>         select DAVINCI_CP_INTC
> >>
> >>  config ARCH_DAVINCI_DA8XX
> >>
> >> ---
> >> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
> >> change-id: 20240401-da850-fix-select-da8xx-989725eec11f
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hi Bartosz, here's an old one that never got picked up and I never got ar=
ound
> to resending. Can you pick it up along with the other davinci stuff you a=
re
> doing this cycle?

I already sent out my PR for this cycle. Maybe Arnd can pick it up
directly? Otherwise, remind me after the merge window.

Bartosz

