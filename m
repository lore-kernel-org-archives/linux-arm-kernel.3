Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DFDCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP/FY6KH/8vHEYoomKdq34/+A+H8nhmZ7rG1Fh9qu+Y=; b=3wsUYcnYGXwswAAcB5szTZ/+SB
	ijxjik5qmIJmVpDnGiG+/pRCDPAWfr1kmdlakMuU6b+UDl5oTW30ald963iXbYT+n+EGqT826bQda
	Mn/mP1WyelV8RDDukecmu66JXOyny145hX4sPeYKf6SGG43QeiljO4P/JlmNvEgIlSvmH5OP6APTX
	tWt7Dci0x+LK5AurRyq43Y8E31R44aRrGTZE0sVgyJB65m1yVNFCQGZHWmu2HcjEsbbWFbth5bft0
	h/LiaTuNIUeeG0eN6X9mG8rwgZPUCCIxliEgOpGDBULJfzUwYMyDKmQXqTM2Htoc5FCHsy1TCWX7G
	TehCLUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWzp-0000000BmnE-3uhp;
	Mon, 24 Nov 2025 13:52:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWzm-0000000BmmM-4Axt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 13:52:48 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b72cbc24637so720982966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 05:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763992365; x=1764597165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP/FY6KH/8vHEYoomKdq34/+A+H8nhmZ7rG1Fh9qu+Y=;
        b=Ed8oIH8cuQ7S17E/RQmSpdgpV3FFkFUkBWwMSwWHO36giXtfvmJrLFgUvDYyW+/zeu
         n+/nFFrSaUpWOKzIB38CHsFX6E4xnIYRmgmmdLhAYmFvC7RCWTDmxXMCnvsUiDpInIx/
         ioYUsksrVeqoPGZKMtxXjt/jMbDB5deqej/xukzrjajin+Xxahq8EfxIeuxZLty3/Plw
         tZtaAPHIfGHELeQZGo2dBcSzk81BPjakeUtoIzwEpLXkPLcwu+TZU+qSjRAugGmbLGFJ
         YxvcAKzipFW1M9MP2wRXO3GVroI4at8RwLlVrVnRQnLatcVsTuB5FcT/xYJ4t5xTcbqA
         iZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992365; x=1764597165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JP/FY6KH/8vHEYoomKdq34/+A+H8nhmZ7rG1Fh9qu+Y=;
        b=SJUW1mn8H8VAtXP61g/JZoE3P3z1kQOBHB2dV8tvDBVPNcuj9xL4lXVRGzhYadcQDL
         UubZe9p0YVVQ6cHOHgfS/OFB516nzxTrYwaZTHTvyhV/D7JFVg4Rp22Bcvp+jE2cKo4s
         ekK3dLkecewxS6oBXn7rijJkj4eeB6szDzUCtXiaPuQkrXQbsd3A2OVQGcOgtWZdC5fL
         zv/UFU1IebBPfE9TS6KgFkpDNDrN4IeF5a5Eht4UKhs9OLKj6UYyqJ4NLQeL5/Nk1n5S
         eRvv+di8JbESu6s9+CsBbGASM8urJrZF4QxlDX2P9nSO83ReXDMAVCflQcw0mHME7/y9
         7DoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKxv2uKPTlR0aqErx4mI8fN1jcYI+H/imSZ7+dooFss+RISdl23xQDGcH1R20Q+XQP4yZwfQPpUWVEaryQdaoN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm96j7cVxLzlPvaKqe55e52y9Glao30gclBbPZCtdo3qjOplLx
	NjejZ2Gedg3cXIOk++BgYnYCpDOuk6O9HOvHe+FvAanhgSOOvQZsA8gK00wnNzmi8AEJ5ja4pzq
	PqM1uuWJmrb7YduSMCmlCHC2cnUosdoI=
X-Gm-Gg: ASbGncs73br45FI2gh1f8mQiC+RpbiQGN8umsPo/NJiZpkQopHp2zbXwJ16svbgVeno
	wX9gKnPXJc3dewFLgJKFsrIwhJS9yNHPpA/BNjLj0On1tOBgdTPs62zfpeV7Bb8wFAjtPWub3md
	0m7FymKFXcqlnDJKeqgM7q0LaPtw8+rmQc5Ta1whQo02261QpArpFrm0m/qa6xdkEhknOx/q2MR
	t//LI6NaFLji6XFLo8iIMnc+F01I1v9pPrXHliaUlrh5jovxJsVqc/DhACYZzRfo8vEFt6fnVjp
	GFZsCK+7Syvwokn0HN13ZFKcQnbjOM6NzggKEBhCika39+tG0bFYYvIFOv9m0DRKNGBq1Xc=
X-Google-Smtp-Source: AGHT+IHbYpoHWWQRtCEXegw2OC1ORK4p1rONYVKXwRB9RhnKrG4ujzsP4M5fg7GySo7VVhYPLZwcZKF+RtaqPvD4xlI=
X-Received: by 2002:a17:906:6a13:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b7671ad9240mr1140942166b.50.1763992364480; Mon, 24 Nov 2025
 05:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
In-Reply-To: <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 24 Nov 2025 15:52:08 +0200
X-Gm-Features: AWmQ_blafsIDEwQKFYXpYXLa3SZzKfbNXFzdND1Q9pD2iYZWVNrjXK4_jaogO3c
Message-ID: <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
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
X-CRM114-CacheID: sfid-20251124_055247_048143_2BFF2F46 
X-CRM114-Status: GOOD (  12.26  )
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

On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gmail.co=
m> wrote:
> On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org=
> wrote:

...

> >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > -       .resume_noirq =3D brcmstb_gpio_resume,
> > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> >  };

...

> > -               .pm =3D &brcmstb_gpio_pm_ops,
> > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
>
> won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> !CONFIG_PM_SLEEP?
>
> You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> all other *_DEV_PM_OPS() macros do).

Shouldn't it be covered by the same trick as pm_sleep_ptr() does for functi=
ons?

--=20
With Best Regards,
Andy Shevchenko

