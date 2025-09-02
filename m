Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9847ECA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=; b=EhSYe3NF8vrUROSZ8spBLoOLlt
	kjqOKoASaJVphjWyyKxky+8BMIn/RhjxQKcJMCiXYGrBNdQw6SZ9L6rNnUb7kJ9xeHPT4TWFHXFpP
	8UwwJO7MTPy8iuL0paARsNZmAKH2WowcMShFRFa963j3nPmnwezFMDd8eZ1MPJpc1vNdVuGwEVk5A
	dDGk1E5P3fGDgRpNSqBDBUKs5KU+vl4vTIQhVFJPeBsT58qNcE7p5rg4WWCHoZCEz15ifjwZ2FpOr
	3GadgN+kBYFFVquI7lcM3+xe+aXTka7ZnJQdKn23EDUZm4Ba+0WH4WE+/Xmwwg03Tn16MRTEJTIrv
	2WkiMy7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPZ-00000001cED-1CVS;
	Tue, 02 Sep 2025 19:11:21 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR64-000000003qK-2O7M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:30:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6507bd53so5138246e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819851; x=1757424651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=txt1l88zEr2AENXs4se+L1eu4YaZcjoHw/BuBf0wp129yTi2LN3JlfifRvix/siTMQ
         0lyxIi3l0U02QHyY1gfj5t3O+cHMNsWoK3uVIalIUDNBdyb6LIUKvuQJ4ZtwlVgkabVI
         UG5FaPN8C3kbIQxs8U/gIX9qu3VqPX3F3t8eUK7dCrShOZH/JMi8GYMD9n0IedMqmU0s
         2EesGKkwHpEysQQOjvlUtBuLo0q2U2RIsBmmOMyrdNl0RLNzumY+g75N5864aUU9mWUf
         fx8iqK1QvaWOEPuYba1ehrxR1TSDl3mgcTu9cEWq9IpT32SSzIa6Rrb6WyqfqYThvyT/
         EFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819851; x=1757424651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=eToMy2dUaS5t06gcAPQBPNBoh190hu6wDV/LEcSbuE57lipvr6DXsRGCveBAx2Wvuf
         A/V2sEubYHdPDZ4V2gMTk7dyb6FSth1R/W9Ch+G4034oPyfBhdF3H/4QNjPHZI2DN+TI
         IrJeu8JAkSvRm8yXu9Jtfjv8k6WPaiWnm/bM0yxhDdPfZrKyhwCnxEEoN6/9smCTZ6Ol
         YfC+eeA/hQII4+klsmlgmk2luxDAPcLtKHj35Ffb3VUNur4WfuyG1ov6JskrrkToWmwV
         e8edRNIq6hDJqxcdEA0kI98+I8wnCPZO5kmyGJ4wjszl/0Acw3gTosyYRfbKOAbkD1zR
         bKqg==
X-Forwarded-Encrypted: i=1; AJvYcCWwbMPJZLgikH0SPUOUFtx68bufFuylT0w26u8p7bu6ThhqMFwRPekO0QI/Z89paIKNm3l8OzCSljnJvDRf7wDg@lists.infradead.org
X-Gm-Message-State: AOJu0YxFd/D6jfG91w1qRoWIZXA+QAnhDq4tPuW6eKhFRE1P1GL1w5kA
	GpWnf4l7bA4Sj9NzIbV3hV8RYArfX4plFsmEEvdeVLqpvtNv5zK0DnOZiEIsLOTNWpj8NR1u33Y
	UMmBTi1yAiHDxfnNc8TP1CkzB2qpSK+xsvJJHsMBkVw==
X-Gm-Gg: ASbGncuko/lJsmoiJw6f6Lj7XPrfuYaJjDsETUEZZjmulG2PgyFhnxDXq2+NKfkhaxz
	Z8Fw02ZCUJF0KmLVrk45JP3Ut+yXFn6W4uz75UDL8Y8Azrz7OeLErIt1WsbeESVjHVcbuVK2Rli
	ZR9hM+RfoXcQKdJk3Vyeom67wtKIZY8YgyvbceaAsasOdO0MADZDJozwbUzr0FFo3GqjFYn8mjK
	eq4EplPH+S9yyypuaIssmu/rRzfAV6jqdCATcc=
X-Google-Smtp-Source: AGHT+IETXrXrPtCI9kHaUsOk3PiYBtzLQDyO5BpniBUPpd4tNEA5zWWpm33Zl8pshGOfywjYNp9sGHw+kB/41Th8Wwg=
X-Received: by 2002:a05:6512:2522:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-55f70967db8mr4302395e87.48.1756819849325; Tue, 02 Sep 2025
 06:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org> <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
In-Reply-To: <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:30:38 +0200
X-Gm-Features: Ac12FXwa7a499RP9JirYFVy7SbY2WfOVu2ugSGxCUkawbutvsj6hahPNBLiFvFg
Message-ID: <CAMRc=MfgXac4kRgeiw+SkNUZS_ThoX5qcXeRX5bPWm-t3JQ9Xg@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_063052_614236_CFD745EB 
X-CRM114-Status: GOOD (  23.79  )
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

On Tue, Sep 2, 2025 at 3:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:17PM +0200, Bartosz Golaszewski wrote:
> >
> > Unlike all the other allocations in this driver, the memory for storing
> > the pin function descriptions allocated with kcalloc() and later resize=
d
> > with krealloc() is never freed. Use devres like elsewhere to handle
> > that. While at it - replace krealloc() with more suitable
> > devm_krealloc_array().
>
> With that in mind...
>
> > Note: the logic in this module is pretty convoluted and could probably
> > use some revisiting, we should probably be able to calculate the exact
> > amount of memory needed in advance or even skip the allocation
> > altogether and just add each function to the radix tree separately.
>
> ...
>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>

Ah, I just ran b4 trailers -u and didn't check the result. :(

> This tag is not applicable to all patches, I do not believe this has been
> tested.
>
> ...
>
> > -     keembay_funcs =3D kcalloc(kpc->npins * 8, sizeof(*keembay_funcs),=
 GFP_KERNEL);
> > +     keembay_funcs =3D devm_kcalloc(kpc->dev, kpc->npins * 8,
>
> ...switching to size_mul() also adds more robustness against too big npin=
s
> values.
>

Eh... ok, if there'll be a v8.

Bart

> > +                                  sizeof(*keembay_funcs), GFP_KERNEL);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

