Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0192CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnuUgpoxqT/R2cHiZvXGYBC70wBbE5DG9KP+Z3Sy5do=; b=OVQaTyhS/RC/FB6HWgpi7eTFb7
	puXCVMJfuVIiQie9MvA+h9pptCjPjFZkputQfPcYQYwZL4+OV5ioAR53U8s3O8K4vj/8pDE+XiZFl
	F/xjVmGDSKwdTrUA0WkWzpzYvg5nIhdJaVUOdJ5bdybLPPoQdevSove7GIdIfXVRdP7Hstl77wlLT
	cb/FjKLHq8KQBYd1QfshlP3tXasl7dr2LmKYgsKiQAh0j6YVeVetDal31aKeeT+B02BNl3ikb1NwP
	7QPeKNcVT0aPL/bq8OHpTsHzLQoXLo4H7LIrPe0BpZtZ3m6Cz6bXJnWDJm5ZFrkGPZ7fhTk6yJIjV
	sdigRnyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturj-00000007dRe-0HpM;
	Wed, 03 Sep 2025 21:18:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utq9p-000000071i5-3aec
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:16:27 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso3845084e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756916184; x=1757520984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnuUgpoxqT/R2cHiZvXGYBC70wBbE5DG9KP+Z3Sy5do=;
        b=qvEQ52VJAC/1q40CQBY4VZj2FWU9SuV/G581hin6+ijWgrOcpe59r8e07WeB8zeel8
         7jUzUNw5Jlw+obdj3NP28iwKErlnxK31tUciYCfWO6UT8WReKLuxuB2wM77hjBxbtayg
         DZVFV+sDJi94/UWX6pE39rpm7dvOeYKtYu600x/sbu6gyprz6zROB37DwOQnrTswzo34
         HkV7+JChEp/SU+3Frla44OCGv93A8lSUn3KoQFeET0NOgkR+l7BAoSeXED1l49nx4YsA
         L0LmKT1GEP6WosEjp0X8GN3k6cRxynjHbPetHIApBPayg1ziphKdwCbdKnMNdWKZJLtL
         Mgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916184; x=1757520984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnuUgpoxqT/R2cHiZvXGYBC70wBbE5DG9KP+Z3Sy5do=;
        b=ETqsItl/Bo8fb0bhz0djBxOTeJKiopHR2Uu8TxiUMyw96fDmwcFQi0Y0Zniw8YaKdz
         JIljg2yPVM/dW6Ivp2sQOI0QXcecSa3EdfHpJ+Jn7i0j8k6cSkpHBQUQuGce6cNuNukF
         XsAGUEG9z6oYBjjMycv4XT1wSat2OdeYq2uTjxTFk6PnhqnBgmbd7L7JGZ7TXreXu5kT
         WT09BGNcdCtbWUIIsCQ+oO2GrJ24ivs4w3pNDhSQ8sSZiSQhJMzA74w+MXHjDVLRd5L4
         +zrLj9wdon79+9qXTELvq3k1aGxzqZvM/GeMIQjIJ28STScSle2PWO15hRh5mTp/kThx
         fd4g==
X-Forwarded-Encrypted: i=1; AJvYcCXDCj/Y3m5uTdm+w+B6WOGd3eg07wIubKomgrgeSTOe2+zt8LayzlB82OWVatBKVEhE7KcnXuhNxvhLBiMrcrS9@lists.infradead.org
X-Gm-Message-State: AOJu0YzuMqbzdq/k6Ufgkru+JF9CkbHR/n8oxicpK0aLMrjA/wtzy0M2
	KSuK91IdlgpQXB//BpzhrkmzDVNI4nUaDKLwYmrUvmwYj7sONHzM4b3eD/ZEmUPxheSDZK50BWL
	8EWsFsBa8VNOnENK2/ao5MBYAZ7rMikERGp47+cMZcw==
X-Gm-Gg: ASbGncsCjC/3SkkkLsL+G4GcoE1Zn+hZikKN9X61uWhSMIDA3afUxlqECRnsudAIghT
	l8Rz5ZXC6VCckA55N/gRKkzEAXsNTpWa7C9H1wP178dbWlrzOtRefQskxGejEaQgANKZfW6SMqZ
	IDLG9FgfHVj3W2A+6Bb4u0/e+8oI4N7cDeYaIpwo4t6qzuXhB8vLZ9lF543/Vvi2V/NI5p/wK6s
	L8BBT6esCzKLx7UhyF0Nb6DVozvP7b4QDngfgM3Jr7pqKnHrA==
X-Google-Smtp-Source: AGHT+IETvnuci7NX/iSfBNiVm70fb0ED1MLT3AMRYWYzaOQPVbLN1BKnBTrWBjGhb7WJoLmVGbMIstEEvAOjYxu1SWQ=
X-Received: by 2002:a05:6512:4608:b0:55f:639b:8057 with SMTP id
 2adb3069b0e04-55f708b33b2mr4219335e87.4.1756916183991; Wed, 03 Sep 2025
 09:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-9-356b4b1d5110@linaro.org> <aLhj6xsR-NepfRx0@black.igk.intel.com>
In-Reply-To: <aLhj6xsR-NepfRx0@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 18:16:12 +0200
X-Gm-Features: Ac12FXy4hHxwtV529JMcJlTzXuQUmxOxLYAQnOsq8scl9FcZoY_Q3ary9lE1izM
Message-ID: <CAMRc=MdDmPumdsrJ0ELPSgRB9UBzW8LcGBRSt5N71eZy21oDAA@mail.gmail.com>
Subject: Re: [PATCH RESEND 09/14] gpio: dwapb: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_091625_917034_113103E7 
X-CRM114-Status: GOOD (  17.22  )
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

On Wed, Sep 3, 2025 at 5:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 11:48:50AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> ...
>
> > +static inline struct dwapb_gpio *to_dwapb_gpio(struct gpio_chip *gc)
> > +{
> > +     return container_of(to_gpio_generic_chip(gc),
> > +                         struct dwapb_gpio_port, chip)->gpio;
> > +}
>
> Since it's not a macro anymore it can be done better:
>
>         struct dwapb_gpio_port *port;
>
>         port =3D container_of(to_gpio_generic_chip(gc), struct dwapb_gpio=
_port, chip);
>         return port->gpio;
>

Sure. I already applied it so can you send a follow-up?

> Also, have you checked the bloat-o-meter before and after, wondering if w=
e gain
> something with this.
>

Not yet we don't but we will move the gpio-mmio-specific fields out of
struct gpio_chip so we'll gain several fields worth of memory per
non-generic chip system-wide.

Bart

