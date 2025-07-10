Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DBAC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=; b=ZvXY8nxrr42hLzki/QbtKx5yQi
	423k+AnQHKd6m3x1cXhHyQG+NgKIlG5qQFHUNk66/EOTsalgb6g1ZfsoQ+J3qXlR74X04bdMFyHIi
	v24XZWutOhgs5Wt+KFOouKXmToylWqxCk/zeP1L4jHIogPq7dQNGhJv/6xWdj2+NL4HCMDDHT8qdf
	sAnOarB77prPigmqcSlkPGu9nMmpGi9Ya/f+D4Tmx1gj/ybjewadEZcxjxbKqLUyirKgIaHPbfYWi
	RD/ejPwlaLifg0LRzBfFrJusQ4jvaj5eIVmL5eGCWIKJ1WLdxLiTIh3vbZXURZXOtxtQH8HQve7Te
	Tlc9LIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu6E-0000000COGE-1ayG;
	Thu, 10 Jul 2025 16:26:18 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrUV-0000000By73-13lw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 13:39:12 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so2407796e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752154749; x=1752759549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=P99Ai6nT0WWeGDXAqqB5oTcci3rWuAWwVoRUWc3exQ/bn8xdXpjx9iL57f473k4KTJ
         XY2z3k3VWUY7npi8aVr24vd5MhAAhkx7lhl49OKx6aE0hiDle/gFsA5fA9wHBwy7YnIo
         jBCrWE8u8pQo3qSMYz3LdVLqdgSCISBLO1nnZwhVlzheqcwpe398gB/1UPARkyTTGYJ5
         pyMd8SWqXMNJhjx2jMQcazkF4AkpZyZpTKk5zhhti8EZ1+Ooxd9fExqIaXAxpORSDHXS
         3oj+lmrtfVO4LVnFnKMuwUv8WXBIlcGx+tGeczkcDzV+LEV5Ym8wXPMsEaJWyrwcajmC
         mDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154749; x=1752759549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=Uge93Uu2wkYkqJ6IWUOk6qMGt/F9yv1+MxwErbdggn2BDyTES3AqDSqx/hysWUVSrF
         tDkFO4Sb75Sx01eK3egAF/Hj3slFxzSZty/+d/Ns/etlH/Fsa5krgA+xxqDErt5eZNyb
         tl2oJfIlU3N6qcU3W82wOB03Ha49RtcvWhua+Lh3FoYYSVd0qyid8oWHQtk9sa3fleHF
         n/0j2nyvBYq1RNeAYHm3v+ZlOzjYZGJS6qhPmbBPR2USlNGEVVau24kzkR9UD9KCtpDE
         wsvxmfJU4MlB2oLSumMJlaxD8i7jXC4B7IthSrF8jFiqQk4EguYZDA8q8JFjfmxcXYhH
         L92A==
X-Forwarded-Encrypted: i=1; AJvYcCV6IxgJLN4mohFGfgTa4Ff9OOqMDL8hJ7L6ZSa+Bg9j29fXpPYv+w3LqfLAz100Gtut9Dtg7GoG2wDD/HKfGoeG@lists.infradead.org
X-Gm-Message-State: AOJu0YyamhNY+YAIunahQ03gzQy62MP1ooeiTrtAvlUOlvU422mT3bkq
	bsL2Wtbhd5imntD9eUiutxZazmw6rXT/a1iDvIcGJUnCpIjOZINw2JanrJmft+aeNLB6To38LFL
	mhk+RJxI718EaWPUQEKoeJsFv1czlP+srPgQDrTdu9g==
X-Gm-Gg: ASbGnctVoNh9llH72nMdx69DEHrPegF6mgv8fxkkcPDde8jaTpApDO0vD+sbNWJBB0O
	7ptIweEi7nbZpFMXNQn1l808fGm47rM14jxdJ3zGSHUQ2IAAxAmwVNa2DJQVArex+QFdeyWDnzn
	4X6WHt5nzBUb2jzKV8VT06fMIYQ3GJwlmDMnMJFDOF64WC/kcXRn+fekSIzazrxwNz2ZKm2RfF/
	f0=
X-Google-Smtp-Source: AGHT+IGB6UUmFZhzqKjRvGV4lr9BeyGDE6WH9O1sGiazwi8CZoRnZBbYDI50VNLpbqgC1sRg+VYVXXWLsDZF+CuXQF4=
X-Received: by 2002:a05:6512:1587:b0:54a:c4af:15 with SMTP id
 2adb3069b0e04-5590071b7c3mr1264610e87.19.1752154748737; Thu, 10 Jul 2025
 06:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
In-Reply-To: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Jul 2025 15:38:57 +0200
X-Gm-Features: Ac12FXwUS6h2JE4LNA_vmGF3f9mhet3j6NKR8eSjHb_k-YJ2CoyhrM-67s3nQ-g
Message-ID: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_063911_372423_03C00912 
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

On Thu, Jul 10, 2025 at 2:25=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> >  int msm_pinctrl_probe(struct platform_device *pdev,
> >                     const struct msm_pinctrl_soc_data *soc_data)
> >  {
> > +     const struct pinfunction *func;
> >       struct msm_pinctrl *pctrl;
> >       struct resource *res;
> >       int ret;
> > @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pd=
ev,
> >               return PTR_ERR(pctrl->pctrl);
> >       }
> >
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
>
> It's good in principle, but we're now going to house two copies of
> the function data in memory... Can we trust __initconst nowadays?
>

Well, if I annotate the functions struct with __initconst, then it
does indeed end up in the .init.rodata section if that's your
question. Then the kernel seems to be freeing this in
./kernel/module/main.c so I sure hope we can trust it.

Do I understand correctly that you're implicitly asking to also
annotate all affected _functions structures across all tlmm drivers?

Alternatively: we can provide another interface:
pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
- would simply store addresses of existing pinfunction structures in
the underlying radix tree.

Bartosz

