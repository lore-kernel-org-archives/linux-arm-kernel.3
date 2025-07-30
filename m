Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E314C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tvvn2gu3QwfMvEps+Es99aXQTd4n5DxwynGQISYrqRE=; b=SfBAzwmkFhWau1YVmd3PWsEgj5
	MLIvPxSZTsl+DM1xhQr4dafYPNPpOAwVNGnn19z/pll2zNOrWkkMKqsJ389GJ6t0BSbZITmZSp2yL
	OPuUY3dAa9oIlmzdys+WSz5pzldO1IUgWxL//4BAA+pruaEJWg/MyjIDHIHZKz96JuW0XKuMLc905
	gEOJbh9vCSCi6dOn9FbDUGRWLE1JqeZ1I9nFY0UZiZj2g3FiLmgtE8luVBukAJn7AKsDg6DBvS8e4
	gNz9rOWCcHIzlbqiWoV8XSyLPPoePj8M0vjlpYKATW5dui28PsFm28fJLYEAAl/w0O+vCVC1mxxSH
	mi809ryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6Ir-00000001Wa4-0jdz;
	Wed, 30 Jul 2025 12:53:05 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6GM-00000001WOq-2K4C;
	Wed, 30 Jul 2025 12:50:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6f6so4108631a12.2;
        Wed, 30 Jul 2025 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753879828; x=1754484628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvvn2gu3QwfMvEps+Es99aXQTd4n5DxwynGQISYrqRE=;
        b=kEEoitMJPrBnitZirOXU+lAN5IxIdPxIZNb6Vfks9VjtNXUusdjjO6V6wdBRjqXnak
         8eW7DFiprY9o71yuHOkLmFgu4cRfXLjL0oo6cuOLPP7mgbGDL1h9W0COqPbtP81GUFrg
         vm9ZE9Z8uirOsQXZlFPh3N5ihiVn/m/PrGo7Xy1e1O6mYrCFAtp1gzX1PDIGqWZ5ww6C
         NUYpGumwNNfyJonl750UTmG/9Y+RrvlzwKXLIVnGedQkL5Lo1LAM2R5uFcWPJB0R6tCg
         ySNiqQnoiLErUio+BK8BbxTz72HBSzNgLr1XlXJbiQYeFbPe8CdXO9vL+8U/3LS+AUP5
         tMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753879828; x=1754484628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvvn2gu3QwfMvEps+Es99aXQTd4n5DxwynGQISYrqRE=;
        b=B0/NjSOd5K6/e5jKOYL56bEXyMru2kKED81n3gXfEzBZfuaiQjy9v4LXKU7Wo/Re73
         aDFUWuE+n+C/3hiWCfT1CG5PayA6KRQr0LxYqGsQqNlsM3MTONgv2dEiOT7Q0IEaJNvC
         /dE85/zBzaVzorB6i+n7gEoSoL9afXg7HyZP6moBN+SmguPLi82XLQU4sKLUNIZo0Vtt
         EMmaHN0eiyo14QljtX3frnKWrhsOTb4rbBsN71hyjZf1rMxKcTyIod6fRpp/nuSXe+Go
         bW0HacFGE9JrsFay73DePVhIs0ZfR4VFm+FHuAzeR9X/1L86gNA3MKauKL2Y/aWIE/MY
         MnfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ957SaFdyQmR5WNRC6eZLBhXgJL+Cf7+jzgmrCKXRAVTYW9OE04jYK/DMeu9WKQiydBzkFC8YmsGpPfRzh3I=@lists.infradead.org, AJvYcCUeJ+lzeN1cr0qSC4qX0NwOHD9WOOsrUWlTQcqtfkj7dlW8mCn12aonyWATy1gW6KtsPEcB49t0f5bs59LIxSJR@lists.infradead.org
X-Gm-Message-State: AOJu0YyFQvB7RSgRY+OGuNGE+Zabj2EgoCd4Ts/h7+tKfJW/b9NQFabm
	s60QDufA1Gf7YILxOOAkeclwd9h1S+YvUG4Ew/DY/vIJ7C3TzwKfk0q5/59NcVkLDgPgz1Xc7QO
	jEj7k7bS8Lae6joy7biSV0I6PBtE87bA=
X-Gm-Gg: ASbGncv7ADH4dfBrzkAlOS721A7wJziToDAP5H8qYESLrytvBXIN9Sfvg2eCwvLdpqU
	/Vbi6aPY97g2Py/5A5MJyEUBAnHnnr4fIEjCphkVh2FXDXbtNI4Kpxplhn2nmXywRYBqtB+49Sg
	HFxhSH5kdbm+/Kh3D3R1C49N3RqIsZAVYJLcwLx+4laeoadMm6UfVy6OCXpyFf8+uriWaGNFAtp
	71iAnXccA==
X-Google-Smtp-Source: AGHT+IEJQOY2N21rRHh/x9SsZgR/AC6673gfg/Aq7DulgeR+61NEupHsjseGW2o2I6RkO01k98hTvI6/W9mnPdZHDTE=
X-Received: by 2002:a17:906:6a12:b0:ae0:b33d:2a4a with SMTP id
 a640c23a62f3a-af8fd97569fmr398869466b.35.1753879828299; Wed, 30 Jul 2025
 05:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com> <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 14:49:51 +0200
X-Gm-Features: Ac12FXxgFDuQutFN_-MaFgaos1SbYd6nY92Ty-kjNsHnooD1EOK3KyGkMl4TA4s
Message-ID: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
X-CRM114-CacheID: sfid-20250730_055030_589403_41601DFE 
X-CRM114-Status: GOOD (  14.29  )
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

On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > >  struct pinfunction {
> > >         const char *name;
> > >         const char * const *groups;
> > >         size_t ngroups;
> > > +       unsigned long flags;
> >
> > Not sure we need this. If the function is GPIO, pin control already
> > knows about this. The pin muxing has gpio request / release callbacks
> > that change the state. Why do we need an additional flag(s)?
> >
>
> I'm not following, how does the pin controller know that the function
> is GPIO exactly, other than by the bit set in this field?

AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
of this information.

--=20
With Best Regards,
Andy Shevchenko

