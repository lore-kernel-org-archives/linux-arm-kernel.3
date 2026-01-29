Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E38D358E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWSiH0vErBGaTqnZZjDiFHXh+s+0x/2ewRQpe7UFdYM=; b=1wk3U9fWioPjpDySkK+qOumJAo
	PA8OyrbxmJglcSmFu0PnEmyFvFAkhfF4pvC8o+20xCMrMZGcCmc0saQkUf0Jzg3p4MDRYnd8fhCbj
	qLt7vr7vTYbobHrtkIW5TIUNA/Su0lUWkqBkHFIFIyZrRnWyHfbz8XWdasBpejh5hEKhsq7+Imd7Z
	fWqpEJbIhoRhvFWitlqaG3xGz8H7ivrWGRaMWhLGnd3jXWwhyP+ppEsG41bKM17FTDprtJDJRu9Qm
	O2IqYdvsnrq7L95NEE1qXm5KFXspcIpFz+fmmQKEC3UT/jaMnrsBPrIwcJHS3pYP83jeEvvrwwIBo
	1684uFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNSP-0000000HSbS-0CkI;
	Thu, 29 Jan 2026 08:32:53 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNSL-0000000HSaW-2LrL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 08:32:51 +0000
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5f524301a76so1149373137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 00:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675568; x=1770280368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iWSiH0vErBGaTqnZZjDiFHXh+s+0x/2ewRQpe7UFdYM=;
        b=rxAT2zDVcdrJqxouAAkS9s/ArROeKboq2S7X6JxUuTonfUQqV/uXdC7akgNH2mPQRw
         LSuwzLZb1n1DW5DIc0KkZUCejnQ1oJEt4Z++WTwzCChPr4289pBnnqlg3FU7qfPxvqo4
         Wb5VG/IqbRuXTd0gWmNkG9zzFPwIxGO1XMNsN377so34mDa5q1XGZ4wHUvWjTjiILDkT
         Oc2UjZQNoPrgHiTQoEWlVTMpNNWodA6kAzTtzEwV5K6dUxqLTR0dv2UoB/srldVvQQay
         J/bJoA3BYXhtnCIynWWDRYTjkZ74wZCwyCx6U/ILUz2ApNmvBbUTnLb5fmV95iyGqZX8
         80jg==
X-Forwarded-Encrypted: i=1; AJvYcCWSCnWTCcSTqU+lGwG7TxtOpvhbbSoJcWKVuJUNSGzBF0xKsyDkLj4C3Oii1gCq6ARsMjj9yd9mQlSboDPz92QP@lists.infradead.org
X-Gm-Message-State: AOJu0YyEENacNM9BfIOSQ3mUi+WQ/Yl+tpnfWosQol4tvHbsr+aD1sX4
	0oqVCVFGjitpnOWzAZv4HkGvlV+jg66GghvsPEIYUWjFCR+Z0XHfQFihSD2ejLUA
X-Gm-Gg: AZuq6aILNuBT4IDRVvTDX6kaEQmcbk9k5RGmqTm5k7Oe7UmeyiFdQt/htcgipBAArVD
	YnOEC2MOzA52ut3Nn2pKZyilH0PnOBY9/VstXxXVZsPAEXYpSjdxN+wpt6TxhmEYxvuXl6L9Te7
	RQaCWrHZqUCPSyvsVIhebGQmTkbwJfRae9shHMOsRCjlvlKDMPQ1YDtUZY1hhTtwuySmomiLIGK
	ITu1g4cgiWXqLzokmDhz8A6sQaF20EA21YsQUEFLoCLpG0iDFwdA0azhjtnIaoQj01oCosFCS0Z
	14g5IFE6tQ5gHSa5O3tR9ZwA9GwQ9Vm0DYuK7PT4sEqmPqh3e2qskXq8LFq5zaQzr4GUj0gRHKx
	zlKeDz4SYlHag2hYRsTmck7qpe/dwiWM7i6pl6UOF0fj5dOnsKU1XlXInS2ngbQ5GbDYZauOiHb
	we/8OMyePHOUFVQxtxrcsN8ta2DM0XxkgxTdd7UETBjtY0Ilhp
X-Received: by 2002:a05:6102:4193:b0:5db:3c3b:7767 with SMTP id ada2fe7eead31-5f8cdb99a0amr743203137.16.1769675567877;
        Thu, 29 Jan 2026 00:32:47 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f734f22c2fsm1008697137.14.2026.01.29.00.32.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:32:47 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5f524301a76so1149366137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 00:32:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdT9/7knDLOfU+UmWg2lL15pZy4d2KETfZfOleFhOCJxwX+mk4qPirsYasnhhac/4feJRolfJ5tDuG37pz0/lS@lists.infradead.org
X-Received: by 2002:a05:6102:358a:b0:5f1:b59d:a824 with SMTP id
 ada2fe7eead31-5f8cdbcdd58mr660134137.10.1769675567174; Thu, 29 Jan 2026
 00:32:47 -0800 (PST)
MIME-Version: 1.0
References: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
 <e955868c06547ac62d34d594d45dd07aa19e361b.camel@linaro.org>
In-Reply-To: <e955868c06547ac62d34d594d45dd07aa19e361b.camel@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jan 2026 09:32:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWgrA9Z3d8pzRpuWJ=_P+JtQyUvOoT0eVpOp7Cikzj0A@mail.gmail.com>
X-Gm-Features: AZwV_QhDAZHfDa69lcwIjPEMriVTWX2j2mEpl3sREl4ukbpmMZGKeuh-Z80oSWU
Message-ID: <CAMuHMdUWgrA9Z3d8pzRpuWJ=_P+JtQyUvOoT0eVpOp7Cikzj0A@mail.gmail.com>
Subject: Re: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Naveen Kumar <mnkumar@google.com>, 
	Roy Luo <royluo@google.com>, Joy Chakraborty <joychakr@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_003249_633021_FE7EB7C3 
X-CRM114-Status: GOOD (  26.42  )
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

Hi Andr=C3=A9,

On Wed, 28 Jan 2026 at 21:03, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
> On Tue, 2026-01-27 at 20:12 +0100, Geert Uytterhoeven wrote:
> > The Google Tensor SoC USB PHY is only present on Google Tensor G5
> > (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent askin=
g
> > the user about this driver when configuring a kernel without Google
> > Tensor SoC support.
> >
> > Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > ARCH_GOOGLE is not yet upstream, but that doesn't hurt.
>
> I can see your point, and have no objection, but for context, Greg
> had asked to not add dependencies on a config option that might or
> might not get added in the future - ARCH_GOOGLE:

The exact name may indeed still be under discussion.  But we all know
there _will_ be a config option (unless the platform is abandoned before
upstreaming, and this driver will be removed again anyway ;-).

> Maybe an alternative would be to make it default=3Dn, and change that
> default once ARCH_GOOGLE gets added?

It already defaults to disabled, as "default=3Dn" is the default.

> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> >
> >  config PHY_GOOGLE_USB
> >       tristate "Google Tensor SoC USB PHY driver"
> > +     depends on ARCH_GOOGLE || COMPILE_TEST
> >       select GENERIC_PHY
> >       help
> >         Enable support for the USB PHY on Google Tensor SoCs, starting =
with

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

