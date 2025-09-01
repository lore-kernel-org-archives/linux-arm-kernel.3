Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48C5CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucQlHv/mXWXUQR94z0huHpLkFzXJxyJn2PT3FHlelh0=; b=y0+MRX3qNTnkv2sk4HMrG5hUJB
	T1fIkw7AjLbiAlUrbYM6ASs+XXiAPfjPxg8dpcVGiAXilnFM1EvwqRtqmShPfj1ikffgm136hJgiX
	Pm3w7qDi68qz8I0iL1YYkP2/VtBGmMG+mbhf30t7Vfl1QjagHXy3sQddf+1frwY+NUMzr2OPBO6aH
	3FWBB8TqiALLQh4Bfb+LE3zDAv9TfApNv1l99ZUlIzt6nmSwLicQ8Zssvay+ozXUwwQkKysI69mVS
	sAxLF97N6uaTRk/CVYL8gYhdmDh3gVm5WACpP3+LrT6GewL86Jnd+rNKXG3je+b6MEmfVg0quPFY/
	aCgn+esA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oq-0000000Ct9t-3hVT;
	Mon, 01 Sep 2025 14:47:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3bK-0000000CPdS-018d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:25:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2131887e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729532; x=1757334332; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucQlHv/mXWXUQR94z0huHpLkFzXJxyJn2PT3FHlelh0=;
        b=ucF5d5Ef2TM/EXa1BUKc3RHD9s7ZptSPiryPyCiGKnr1gV0jmnap8oTwYBPelY90ww
         LeHD0uKtmvaSKi8wj0e7PVddIrTyHm+Em9wI28ucP2ReAdWpcpRTPJYDxM3432150ess
         8Ke3q4BuhvqMYaaK962xofJMXKhmpW5oVFw+8y/atywQheRB5ia4HChWm+EdvjqSAmIc
         YEd+eGpNR3MjTySVXvZSrc4PzUl06K2DZQTlamA9IL6J7ingCQSroh0bIDSey1U6/oXl
         Ne891M+XixpOIoe9a6nnTqYbHl4ejgzJ+QW3G8s6UT3SwOmhb5/wQEQ3KAPT9dZQKONM
         gmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729532; x=1757334332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucQlHv/mXWXUQR94z0huHpLkFzXJxyJn2PT3FHlelh0=;
        b=wqgmXpxc5wbVV7wwC9a1ukX+FqBB7/xCUVOP7+K0FzqcenGwZKm+zky2XE/LlCEqMj
         gcSNVj8wujl8FGt/+pj4fjoXwUVhxe6aDvljdAlmT/1XD/1kzJRAd9idvutl0Xs8BBee
         HlEMAdw8fNsgy3qB4HVSH2eOrl5NgHIojn52N5jcMEtXxXOCkQW6SgkmqAlMDZ1/9IVq
         EGVWFJDcNjkdloSDqhrbvd540n/oBtVOis3ieR3h2huBq2zRe6f9UxJ5k52NDKQWHtXY
         OydYAM7NtJkVu0LakFgi2Kj3BfQc3Pt84jqxOcfjMI9PDzR6m6kbO/UGEBtxCAQVFjXg
         y18w==
X-Forwarded-Encrypted: i=1; AJvYcCUr6DzrFJyKlAJ3aR0LEAKeSsF3Pa8dgG6ZgOnM/EL4FJPo/ltD+HrJ6P6Pgpw0NCS1Ncb/MeOMBMwxgpewWzQm@lists.infradead.org
X-Gm-Message-State: AOJu0YyvD+9n4Py8B07gGHhFPdA5fDYLdlih4+5OKGXrwodrwapa3Wla
	NzHt3g/YO2cEuoXr5+Wqxq3OjSEfUFc4oPbW4BNMqpAfZ+Rz9tDHm17W64erFBDR7LWNQ1CO8M6
	X0Yb8bZSCNTn/tSFKP10W9BZna51/R9PkZdtKfxvNyA==
X-Gm-Gg: ASbGncsKfYHLYJcH4+FN9+DC65U34c17aQO1EwqElTv04A29U/CyKHwuGVUeHK+lB4d
	ia89TrPVPXACB9UIC0nOdsPLB0H59uEY4grTP0P6MRYLXmyGs+L2Fl34lPyO11JPFii01PgRjYP
	Avoq5JwYat/CfsBlHd+A9ceLfdkIv4NQ0wFMBqYr8T5NozfUT2hm+xXzWYTDS085YOii4HWctYG
	ZBXfotyWc040qa4PQ==
X-Google-Smtp-Source: AGHT+IFh849P9Mw3V1twXyau1E0d8+tMpeq/kD/1dtYcV8RQnEr8UjIQMobQi9sqOIke7vnU9ah+2huaprvtZVk3XKo=
X-Received: by 2002:a05:6512:eaa:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-55f708bafb8mr1947722e87.22.1756729532129; Mon, 01 Sep 2025
 05:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
 <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
 <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
 <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com> <CAMRc=MeAHn+r0YHq5KgT2xVUuT1uOodcTLhfF6fc668tgs1saQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeAHn+r0YHq5KgT2xVUuT1uOodcTLhfF6fc668tgs1saQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 14:25:19 +0200
X-Gm-Features: Ac12FXxZChHxriu2Zd-C_Ts1xmuNQ7MlL_uPIJIHm3MOdmn11xm4R3hRlEbi1Ww
Message-ID: <CACRpkdYf1pi6Rf1r0dEkgFuR7unUKd0MYkGphVNNAqW_P1P20A@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052534_045373_AB2335E6 
X-CRM114-Status: GOOD (  22.10  )
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

On Mon, Sep 1, 2025 at 10:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Mon, 1 Sep 2025 10:44:04 +0200, Linus Walleij
> <linus.walleij@linaro.org> said:
> > On Mon, Sep 1, 2025 at 10:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >> On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> >> >
> >> > On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
> >> > <andy.shevchenko@gmail.com> wrote:
> >> >
> >> > > Note mainly for Linus and Bart:
> >> > > I agree with the patches 1..11, but starting from 12 needs more
> >> > > discussion. That said, I hope Linus can apply the first 11 ones to
> >> > > make it easier to continue with the rest.
> >> >
> >> > I applied patches 1 thru 11 so we get some traction.
> >> >
> >>
> >> Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
> >> 100% sure the fix in this iteration actually works.
> >
> > OK I backed it out for now, let's give it a week.
> >
> > I'm just a bit jumpy... I really want this to get some cooking
> > in Linux-next by now.
>
> I mean: pushing something into linux-next and seeing if anyone yells, is =
a
> viable strategy too. :)

Yeah it's what I do when I lose patience, however experience shows
I need more patience ;)

Yours,
Linus Walleij

