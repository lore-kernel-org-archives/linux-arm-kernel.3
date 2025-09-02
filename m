Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE1CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=; b=YPnA1GQ0CG/dul01vJninx6jd1
	gbnbtQdcHpc7RBxFNIZky2aA3XrO/bAMivU2ccnQPwRD+YCWV4hxRhvSzz2fAkdnw+1CDt3/YcCYa
	6dd6lpjeZkaUUccIQNUXzhI+bfwZKbbN6jHyHHLXDn3PhTHYaRPRnwKVxqkV5PM/lDLyujhPnGfrU
	g6K4bMIuiEpSTitzmD0kNHF4OMDgShqiMYm8A43XQYz6ab4ufu84msmdmIqOhysOnHjiRMMjZwOch
	bGwNx9cj2UBfG5vRwzRkqonRf1Tynzj8lyUYZhGyvfhBpd81yL0fsWrV7fc1Ad1LAABPviz7gMBQk
	dwFv2NiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPN-00000001byf-3SxL;
	Tue, 02 Sep 2025 19:11:09 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR50-000000003MH-0Ymn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:29:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f7204b6aaso2713081e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819784; x=1757424584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=Gb7Pys0p/Nf/wKuMK50NcD8a9iKPcrI8p2CI2fgOlP5bKfRb5/RwOkGnjHxeUYJZnA
         Ugh6ttVW7zVelF5vHdn5vlbYMh+/IncCpMXyfW5C0HwmUgYFGKkYb0P2+rbn7/VZwOpy
         c5uLi/VPegt7o5GRo8iT/cXreZhKT4u7VxjK8BwEic3+PGHUyAMhL/iGV8fCkEIAhWBk
         KD4Qx5r3D4y1n/gTUxOrXtFUl05iLRzxAjczC2MB1gqbS5VdS4v7HqCwQqMCHofYMCBj
         7j168a55hhO6xGuFP29NcS8ZQ0UzpXeQYN+Lp9XTMQKHIo2Nbf/ynf/TmE2ZE7zzof33
         WSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819784; x=1757424584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=rBZ6nMF6hoi5g2H0I8O8xU2nPrCvcAKoo7E7tCz+kexL3a5UFDLTuOqpPj9RlmCB14
         qqji4y4az0qArPI6NVfxQL6Z7wO4KwTTyI0ZyzrV4XEDaX59B71Q+BeNAdAAiATAgRtp
         aEoZUhBjBgRZl5mvUiku+U7sQ1GcA3tBU22hmpah7NkFIAL1xgTR9yYa73W7b0N3RGum
         EUaASHDCk2RuXDQ4ibeY0GdPGeRMoDl561ZPI6ZVS9PkRq0ULY26ychpd9QFMX2Fesnm
         ssfWJATCFKWyYex4po3pfX3m/19/eZxsVZeqHRTvhZQQtncGPuq3X/ZjEEKT/yIXg+1q
         Awcw==
X-Forwarded-Encrypted: i=1; AJvYcCXw0gBG4gb27K4yW7IphuAtnInF/Rj3tAeAADTgKtdLUmLojAfddmngOl3krC6Zch5VJOgmV/7YedG2KNvcMmcn@lists.infradead.org
X-Gm-Message-State: AOJu0YzY5DDY0SmV+90ou21E11gRZNPVD7biexdUF/l2Ihyw+b6f6bOh
	hqTwm+8BhZ4q+v83536N6utxjDLr9+8V67RS+0gJ7qjsl38fv+nr0nwvWBoK5ODXT3uQDC9vDbt
	BjNIV8AiORrQ1XK/B+cyq7Rt4UxkFulehxBAKY0hV1w==
X-Gm-Gg: ASbGnctD06aA2FTF83jvXTuagTYSIQxSULkccvYc2ixhrCEB+iLrOrDlhnwBs8b8tG+
	4QtxZ5Pg3klEot1u9gan8wzF9Bt0bghjeoMwwPbX/wtSLLpLkH8yHRqQAxweZAZxiSolFL8YIBC
	cgBU2BYaClr7Ad64LigHbNkblI5AQO6szJDn08Pnd89CZhzWrw9vQijU054JlAMIpe/3E+h135J
	xxaJ9XOGdh9Lei6WZhK9J7noKJvGFSkEiy33ODpRejgDnlOVQ==
X-Google-Smtp-Source: AGHT+IEokI8/QdZgrQf6Khw+qmZIKYKiiUgjGe2BsWGspCY5PLtcBEV9VcspomwVXiAZN5jhrLGIGNRfYpYegqH5QMI=
X-Received: by 2002:a05:6512:6512:b0:55f:4760:ffc4 with SMTP id
 2adb3069b0e04-55f709953admr2780344e87.29.1756819782757; Tue, 02 Sep 2025
 06:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org> <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
In-Reply-To: <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:29:31 +0200
X-Gm-Features: Ac12FXxptM2x0FIw3VzAD9gZWlHPceo9WcRvgcocpGcthnkDE6yjXmv7vVmpP9U
Message-ID: <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of pinmux_ops::get_function_name()
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062946_414445_3F208BFE 
X-CRM114-Status: GOOD (  24.01  )
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

On Tue, Sep 2, 2025 at 3:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > While the API contract in docs doesn't specify it explicitly,
>
> So, why not to amend the doc at the same time?
>

Because this series is already big as is. That would be another commit
that can be separate.

> > the generic implementation of the get_function_name() callback from str=
uct
> > pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> > NULL. This is already checked in pinmux_check_ops() so add a similar
> > check in pinmux_func_name_to_selector() instead of passing the returned
> > pointer right down to strcmp() where the NULL can get dereferenced. Thi=
s
> > is normal operation when adding new pinfunctions.
>
> Fixes?

This has always been like that.

> Reported?

I mean, technically Mark Brown reported my previous patch failing but
I don't think we do this if we're still within the same series just
another iteration?

> Closes?

Ditto.

>
> ...
>
> >       while (selector < nfuncs) {
> >               const char *fname =3D ops->get_function_name(pctldev, sel=
ector);
> >
> > -             if (!strcmp(function, fname))
> > +             if (fname && !strcmp(function, fname))
> >                       return selector;
>
> I would slightly refactor this:
>
>                 const char *fname;
>
>                 fname =3D ops->get_function_name(pctldev, selector);
>                 if (fname && !strcmp(function, fname))
>                         return selector;
>
> >               selector++;
>

You can do this in a subsequent patch, I prefer a smaller diff personally.

Bartosz

