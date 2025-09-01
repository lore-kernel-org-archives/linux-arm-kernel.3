Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269B1CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaiJq4hJF5lom7z5ZsALf4JWoA+Plm0B5+LT0O2PI34=; b=dz1GOCZeaNLG9AsN0CjAx2h5VJ
	2+lJBezQkfUjYoE17wJ8yF3Hi5O4dd4MgDpLVvH/MAe55BSkTJRxln2/14g3Z0JoZ3VCQfpWm3wyo
	njTaszMgO8sr+fcaMo/2SxZTAvP4HDvetjd0F23Jrj138OSRt2UNjnDbxSQ62YPV3Yi8iHeI50Spl
	xFiWH8C+vI5RMLHPGdRM0/KDA/XTzMGS/DUFFMB0XIExKkuQP16j/TroPG7ev42x42hA6juSXlN0U
	0itKd+OA0ljug54ubt1qHfIsL1JO4JshiE7IsxFXWuRs51goS5h2q+L9hAcGO0GkLOs0HgtRVKakI
	t8XQeOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Z6-0000000Bhga-1rBS;
	Mon, 01 Sep 2025 09:11:04 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut09D-0000000Bcd8-1EYy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:44:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f6017004dso3690870e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756716257; x=1757321057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaiJq4hJF5lom7z5ZsALf4JWoA+Plm0B5+LT0O2PI34=;
        b=r/wcwRDbyGkpdFEXllUgG4xuh8t06+sWwzz3AfdzB07Rf+58UPPXS/lRBxr0VkOniv
         0gnUb2PcHmo+fJYFnRxP7uXWLelalxKhYi06q5tcGhuqvHe6xdDwnPdfCFpJp7hRawQX
         kdWi3XBkj5KWeTLeGqeXahAaCYk0uptV2Tifkkn0XNMg8QrWHUhrTJDnPV9tJQCzGU31
         ma/NEAzJIelBY/1ILmeyRcCAXPJce/36CH/Ma+D4XSGrlsKxSzEoDJ9Wza9MXdidpeZa
         oHR2CDjNOuQtgPD516OVd+tGMdkdd4qrzmCQDPd2MYTzTB5UetkIRlyfo8Gfwc0UoDAR
         pUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716257; x=1757321057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaiJq4hJF5lom7z5ZsALf4JWoA+Plm0B5+LT0O2PI34=;
        b=OmHPx0X0hQ8mNoeCGEKON8Y6c8q7FnygLsz+LazKAMIh/DsRCp7Lelaya2l9/IHz7W
         MlBcdmIfu7rieyzl2PeKnEugO28cGJ/HYLchza5KE11G8qcgw/IGR1AJjmc9RDTzNzaU
         mVwpaH/0VJCqW17LGo6cdDSntD+LsE8/c2uNQdKKsDkJgU3BYoIcYrnWISUmHej4WuQL
         MflHAW4LL5YDPK5B5T6uDvYcBcp+NKWRFyBFOzTlRaT66ni8nsfYBUjaEgxjHYVukb1v
         O4jP9GrpwYcrBx45+YCZAOQooTeuF3zO8wYnK8dIEPiJ7fwyg70m82NPpUfYapT+ERsd
         +Ruw==
X-Forwarded-Encrypted: i=1; AJvYcCXpBYk9xjr/AhEYgA6YLa8CZ+EAbgGJ10KZoLcZu0dDZ5AU0f3hXviyRX0l5lNq6W4+Xn3SKkL4N46xU2IuoILs@lists.infradead.org
X-Gm-Message-State: AOJu0YwdoO4xJODYzYY7htNQ2zxaSgb1ohF8nwIqyTVumrr+za+MWeU5
	UNt+PKC/FnlaTrNDmTf5mU8GkkWZJ9PjTxjyH3Ntsu/7bkp71DPlhO41QYqJxUv7vVb4Bo/QM4M
	govnh4I7mCZE+G1+rjLelNm3ostpnoILDiIX9LZfSWZjD3/hWBPTl
X-Gm-Gg: ASbGncvqDcJZv4Urwt57eMqWKf5efwc/O3ImKadnstiC+71sRTYsv1SUChZBF0xodnY
	JsKJxwpu3v7mrDEIsqat2EGk0V+p1N1srGuJmeha+Cz8gY0XzXtQgsTCGAtyDpOtJ8+tAnqtHN+
	pnbtQpLq3Fl3oQDvIoHtIxnpZDFjCK8uwwVZmTbe6xEJQP9fbesuWFR1YU53Q/2QFHUsTkLCsJs
	BLTlpk=
X-Google-Smtp-Source: AGHT+IHYQJGcS72pgyUEaoA+hO1sKdExLWvqpK7R1Mhqds887ElGFErBA9UBYpgc8SVbOT1Ijil+SH1kwRpSDvkqpJw=
X-Received: by 2002:a05:6512:a90:b0:55f:3faa:7c02 with SMTP id
 2adb3069b0e04-55f7093eb00mr1641808e87.40.1756716257451; Mon, 01 Sep 2025
 01:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
 <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com> <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
In-Reply-To: <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 10:44:04 +0200
X-Gm-Features: Ac12FXz3KPbvuWEnpXmjpCyuSYHy_eQu2RsnQJOIHbwbqbNB252k8odhTX9e2FE
Message-ID: <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250901_014419_335989_2CF0B64F 
X-CRM114-Status: GOOD (  17.93  )
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

On Mon, Sep 1, 2025 at 10:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >
> > > Note mainly for Linus and Bart:
> > > I agree with the patches 1..11, but starting from 12 needs more
> > > discussion. That said, I hope Linus can apply the first 11 ones to
> > > make it easier to continue with the rest.
> >
> > I applied patches 1 thru 11 so we get some traction.
> >
>
> Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
> 100% sure the fix in this iteration actually works.

OK I backed it out for now, let's give it a week.

I'm just a bit jumpy... I really want this to get some cooking
in Linux-next by now.

Yours,
Linus Walleij

