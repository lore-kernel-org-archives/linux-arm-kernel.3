Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AF3C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=; b=HHqgS79kA8AWMf6awywxZxPizj
	BMLAVbe7sNfOq8XtFD3/NhHEZNclspA3qcn2TIv/u8mVwyAWCkCYtsQpKaoEFwp2MkG1fRlxxOaDL
	Dt/NE8fVGDbf6P8oxZytAlEPG7DHCtVMS0kqBt1DYj1aBC7J5WTSBWE4kVoLkD+MKGc3D3mGWCoqU
	1bKGlFToGL8U35mvpToRE1b3il+LUEXgWGO/tjRek6bo92C8vP/q3Tp4T6IC8m7oMyybNWrNv3Y7L
	BhWwEeLhkDgjEVfh/y7zbqaFaRDMH0j2MB0ZVD+3ZPbNXK4m94tsp0TVRspkuBGyU7NvjuUffmAoE
	DlhTt/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6OA-00000001XIS-0NFr;
	Wed, 30 Jul 2025 12:58:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6Ja-00000001Wlb-3OhI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 12:53:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55516abe02cso1082453e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753880029; x=1754484829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=v8nQtQlzefbBEjxykBNH+ceb5NjRqLy4qUaWXMHb0Zhcm2zVqrYyACWokZFD92CHdF
         jgdRbvho8sLKmVc9AiaDe3K+avGc5PoKLEIEMmmFQhwgGk+bcvTzQQBydSAUYK2OF7VC
         GCgism9E0kv86zu8O2ADWISdfKzxSCVY4zIbVKoQGpvtPLcvP14D9JPnK2v1DpyV2m+l
         vUeRN4A/E9ZZQkfHf5ijWOwV0TrlIfCS7YQdAZXgTDDUahfAiYIB8LIwR3ZEuA50vwII
         r9lp1ZT6YG7356HNvMzeEGjQQ5rB58A227Vm2c3BwMdTcQhYIJdCEB5G4QfIUxCjVut/
         YhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880029; x=1754484829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=ghPiKQmFIauXq5DsbgcVnZRwIyL2gTe5o1acI9HzG20UMZc+kMRMtHBTf7qFeQDVQ2
         UEumKtWc8OHeyRBXDbeRqctI1LVLgTE2ZW7i23GcA/aIrmVFvCF6OUwv05RwFpOE+LrY
         e8fqJmhgA3R+WcFxlIteKanaSsWPkr37G+d/k/RUxRKpcot9I0Ojmh0S1+9kijN7Yb/R
         3sZn0hXiXVJqmVfkzTJxOmhrJitLxVxkUNQJYigx+kAHLJy8xJw9HSZw5ijMB9DVUO3q
         gXSHkLdabo0vGojQrX/GEd52A2zznJzMIeOfrELONmjeSqZJ8XgYXD5wyDpdl6zEY2JL
         ykxA==
X-Forwarded-Encrypted: i=1; AJvYcCVvluLYA55aLjdS9okD5dfbsDnJr7Nf4gwF+2s4+HtU9LCS2qPjyX+esUATm+lxKntyMYzS2WSqtOhaOkqMHLhX@lists.infradead.org
X-Gm-Message-State: AOJu0Yymd0LOrdw6KwgxnksXDHx+EszpaZvYQiEOiYcOXEAZpqw/SAQc
	deJXuAq6VS2gzHPnlMCaKqdxG1cHHymrQnEVopPgjYS+5NwGW7AWnExHSxjOntuxZPBLnRkErYF
	rYcFCkKIXcfsJ9XhusIIX0ynYZ7PXoPaaluvF+qM8dQ==
X-Gm-Gg: ASbGncv6Ozs6RXcdxz5HsTYnrHEvxh4HVChw/SRzI3k9tDRudztYEBmvt1gOBhgLmh9
	4cghysaLRdIykMw5++9tlLbbo2LWAmbLrML51StwbsL1mgCoNsEBUWyHTx/Hy3ZUMoDvlwU6avD
	t/1GBq3vQ5NZV/ZouuIBqD8scs58R8kIUT5HHsOukr0Lt6QUnWuWRxmNnl7f3biGMPS9lMbRHMc
	90Udgy5Iwx/JngblzsN1Zcv2bwPprKfPAa/n00=
X-Google-Smtp-Source: AGHT+IGSuyPnAInz8gQT37fKK4pgrT4+RIAYI9IrKjK2MWPd45oP6K0zUhD/GSonCiRI3dzBbJ8n7cWJZ+qNt54xgoU=
X-Received: by 2002:a05:6512:ba1:b0:55b:83cf:b260 with SMTP id
 2adb3069b0e04-55b83cfb693mr305928e87.11.1753880028944; Wed, 30 Jul 2025
 05:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com> <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
In-Reply-To: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 14:53:37 +0200
X-Gm-Features: Ac12FXya2mYA_HSI46S7KktzTvTwdWuT-o4vBrrr3z0vtr46fp0gRnU_ZqynDBk
Message-ID: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_055351_085919_D18648EE 
X-CRM114-Status: GOOD (  18.77  )
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

On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > >  struct pinfunction {
> > > >         const char *name;
> > > >         const char * const *groups;
> > > >         size_t ngroups;
> > > > +       unsigned long flags;
> > >
> > > Not sure we need this. If the function is GPIO, pin control already
> > > knows about this. The pin muxing has gpio request / release callbacks
> > > that change the state. Why do we need an additional flag(s)?
> > >
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.
>

No, that's not at all what this series does... gpio_owner is the
consumer label of a pin used by the GPIOLIB framework. The flag I'm
introducing it telling the pinctrl core - before GPIOLIB is ever
involved - that *this pin can be requested as a GPIO by GPIOLIB*. It's
the other way around - without knowing this, for strict pinmuxers,
GPIOLIB would never be able to request this pin if it was muxed to a
function (even if the function is called "GPIO").

Bart

