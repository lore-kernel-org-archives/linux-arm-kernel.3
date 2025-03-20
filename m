Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96209C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O12nadUsyPqdQjwO9PDc6yNGkFbb7eWIfLGfjGH84dE=; b=LQk7jutJq1NOmMrhIwZcoVmBNq
	pftXW+zWibNGoD5DoOjWxDGn2z5aBSkWa8U90AuHFqGVtojgTd/iJ1mrVnTO5o1LMiLdOXl+qXW+4
	LpkCUGO6mP0ynLUuLP5PGQFGRpPDU4CbXzOI9lMmOUlgqlLdy/mg2Y55ijhqJ5qTe7ZCZKwMAwVlu
	ZIHkmNsk8USlkDGtLE91VALjhKGSopYDQ96Wbx4m9tTxoHBrMVfnYf8czgQFY9WWx/bi9mBNYDVt0
	DkWHWDy+gpuVwEVHRWXvvqup89zc3PlRwbl6BgaLnTcbRctzbVZbkj8hXUKMZ5DarOFo87JOZ7OwV
	RRsRd2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFw8-0000000CEQu-10mO;
	Thu, 20 Mar 2025 13:27:52 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFmf-0000000CCu0-0xL5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 13:18:06 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5fe86c16f5dso339265eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742476684; x=1743081484; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O12nadUsyPqdQjwO9PDc6yNGkFbb7eWIfLGfjGH84dE=;
        b=ou2G4RXEl+9qZ46XzeEG1x/MdlWSJyFKqi300NzC7UlZb3rnMvC0YJbpjVp+nEPpJH
         d+Pntjv6qOPdizwk+/+uin4Ov5lDzdpyIEiylgKYVxUGGvemguJufFMiCOiz1m4zgrZ7
         tlxUzSHy9Yy7ysA9fXDCUecR8PNsimRmGTnyWyr7XE5gbTUCgz+9xoHUJV8cYoxAzPAq
         icjSARhZJ7eB+C3IWFhYq4WrPco9CgIHloXrGTbbq92V83G3VCC0/MepS4wQQPzRaQBd
         0YWgx6iegaQVv4MavNL2rTMVXpFM20H1ipn8sjRFXAmu2eaorvmsHeaZuZvMdEvQ7Tje
         aNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742476684; x=1743081484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O12nadUsyPqdQjwO9PDc6yNGkFbb7eWIfLGfjGH84dE=;
        b=JJruyDV+qOnhHHRzd5UEKqkeMtNE3vpabTiRtC+l2oxyV7WLlODmgam5Eb6iyXPdCZ
         7+Qc0TeEWCNzwet+iU1izBpSFHgeatffYeLfPO6/5v4FM02s1pbQXtbM72/iQEQ1Qe5X
         QRuhUANbLB7Av2OZy5HbW9uCrz4ZwM1BUEZXYwyZsJe/6v4XcPg1jF2H24dnf07QxyJl
         7iYJFLCqgBYnlxhWFv/27DogxcVpbgc8De1DehPSqb4w6zQK0zP/SxbuYjGv1Q5EfdfN
         mweFZ3qU63ax48Z8CQv17MV0xv8GnBC2V02sLzxfU8LUJv5sCqNsaGtprRajr0Tel16q
         XjHA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ43g3faAX95zd+G6WCoDeSpDHpeaXxJrH9uU5mJ+dvb7B1wIQoKqyNL8ArDW+VC/6DWr4Jo0vQjw955uB7yti@lists.infradead.org
X-Gm-Message-State: AOJu0YySjwIWX2mupbq1bE6mL/JYc+fJC5ogkiiOGeKSoraWHbeKETth
	BHDLPlkvGY5N7O2pLMHoK5gq1WLjF2eXTFq/jL64B9KCliTveWuPkEJFss8YsdbV+WvsYwSksQU
	ShRjUxbq3TBZmqOvyBdzdGvc32qHkqHpvm7aEpw==
X-Gm-Gg: ASbGncu+DqArRgUV8bhmm4HQUxaGxwjsTPW89ABfY8UOEys7cw6cdRjyZn4huJILZgS
	DYEU91SrHBL8qEuxXyPwQsHsdztUXWvIPHgGfajvp07190yUY8L1DF+SlNDHEI0fOrU7zFlFbu2
	kIRzzRsExfSiwGHBAyfnGn6b1eKkv+u9w+FlvgfKM=
X-Google-Smtp-Source: AGHT+IG6aW5Q3y/RnifIpaEjK5ULxNior0oiMNhU0YpdBqJfjRMwWIEcYmRkJPDhVpVmvt+kqwBSuw6+FqH3T0ivSDo=
X-Received: by 2002:a05:6820:610b:b0:602:2bd5:121c with SMTP id
 006d021491bc7-6022bd5268bmr902498eaf.3.1742476684008; Thu, 20 Mar 2025
 06:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
 <20250312-pinctrl-fltcon-suspend-v5-2-d98d5b271242@linaro.org> <5ff8d26d-65bd-4b99-90b1-ae01f0ee9eb7@kernel.org>
In-Reply-To: <5ff8d26d-65bd-4b99-90b1-ae01f0ee9eb7@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Mar 2025 13:17:53 +0000
X-Gm-Features: AQ5f1JrZuFp1AMZqE3M2XuIbs3bdr_wxjPoi_Wqa3MiIrQKNXKZzHtSEuRK2C30
Message-ID: <CADrjBPqPRR+yH=B_pSFNMTqqvQaHZPckw=OaeGZa34icb0WbFw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] pinctrl: samsung: refactor drvdata suspend &
 resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_061805_273523_EC25F9A5 
X-CRM114-Status: GOOD (  31.67  )
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

Hi Krzysztof,

Thanks for the review feedback.

On Tue, 18 Mar 2025 at 19:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/03/2025 22:58, Peter Griffin wrote:
> > Move the call of drvdata->suspend()/resume into the loop which is
> > iterating drvdata for each bank.
>
>
> Side effect is that now each drvdata->suspend will be called before
> saving registers. Please mention it here and this lead me to one more
> comment.

Yes drvdata->suspend() gets called slightly earlier after this patch.
I can mention that in the commit message

>
> > This allows the clk_enable() and clk_disable() logic to be removed
>
>
> For suspend path - yes. For resume path - nothing changed, because
> drvdata->resume(drvdata) was called with clock enabled.

The clk_enable() / clk_disable() has been removed from both the
drvdata->suspend() and drvdata->resume() callbacks

>
> > from each callback, and also avoids iterating the same loop again
> > in the next function.
>
> ...
>
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index 963060920301ec90affb2ee6d758d3d602ffb4a9..375634d8cc79d6533603e3eed562452181e2ee25 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1349,6 +1349,9 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
> >               const u8 *widths = bank->type->fld_width;
> >               enum pincfg_type type;
> >
> > +             if (drvdata->suspend)
> > +                     drvdata->suspend(bank);
>
> Here suspend() is called before saving common register state (was
> *after*)...
>
> > +
> >               /* Registers without a powerdown config aren't lost */
> >               if (!widths[PINCFG_TYPE_CON_PDN])
> >                       continue;
> > @@ -1373,8 +1376,6 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
> >
> >       clk_disable(drvdata->pclk);
> >
> > -     if (drvdata->suspend)
> > -             drvdata->suspend(drvdata);
> >       if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
> >               drvdata->retention_ctrl->enable(drvdata);
> >
> > @@ -1406,9 +1407,6 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
> >               return ret;
> >       }
> >
> > -     if (drvdata->resume)
> > -             drvdata->resume(drvdata);
> > -
> >       for (i = 0; i < drvdata->nr_banks; i++) {
> >               struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
> >               void __iomem *reg = bank->pctl_base + bank->pctl_offset;
> > @@ -1416,6 +1414,9 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
> >               const u8 *widths = bank->type->fld_width;
> >               enum pincfg_type type;
> >
> > +             if (drvdata->resume)
> > +                     drvdata->resume(bank);
>
> But this is not symmetrically reversed now - resume() is before
> restoring from saved state.
>
> Maybe this change is intentional, but then it should be expressed in
> commit msg and in commit why this was chosen.
>
> I guess you decided to do that way only because of code:
>         if (!widths[PINCFG_TYPE_CON_PDN])

Yes exactly it was the above line, and trying to avoid iterating the
loop a second time.

> This code should be symmetrically reversed, otherwise it just raises
> questions. For saving register state, it does not really matter, but in
> general if we assume driver-specific suspend callback is run the last,
> then driver-specific resume callback should be first, no?

As you say it's just saving/restoring some registers so I don't
believe the ordering matters. But if you would like it to be kept
symmetrically reversed I could switch back to calling it in almost the
same place as before this patch (just moving it a couple lines up
before the clk_disable() and iterate the loop again.

for (i = 0; i < drvdata->nr_banks; i++)
    drvdata->suspend(bank);

and similar for drvdata->resume(). Then the ordering should be exactly
the same as prior to this patch.

Thanks,

Peter

