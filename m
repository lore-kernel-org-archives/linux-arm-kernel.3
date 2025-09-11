Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B592CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=; b=VxtF+E0QbcfeCRhwDxjpwfMDPB
	4yxgqS5ZmcLlYmXcOkaP2KNt5LGb8hp+vOijyNIBVIxAN+ovSk+zApAYiVFF5MyiPkhIZSuAi5FIr
	bk50L0sMm5ScdkjS0xxczidZtmhJA0SGAd4eKm4o0kiL0zFGnXOD/lLtoU+KL3EVqh0QjFt3HvzaZ
	QR/+XL7/3omBtC63VW7upSdCEuVPmq0W2B9IyAA0ysV1DA87SL3c0sW9MQywHN5uPefwpdCKHe/on
	5j6X/4yMvwI0Lfd7mAe2z3RsDX25QznTUaGYTKxXT+hNgkQ8TDibLf5cVhDXTTtgXhef9aOfneo0x
	Yf9zedRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAg-00000001e0L-0R54;
	Thu, 11 Sep 2025 07:56:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAc-00000001dvo-2m5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:56:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5608b619cd8so456966e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577401; x=1758182201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=qBq8T5GDwgLhlPcZ1nVKXFo+M7OlVFB7rb27r2PqfKo8zNhne7sPA4CcrOb2l1uN9C
         UpekQBze864DJWQ6TXPJTMzzueNQrxTjDeX7uaPdqFgZpVa52kLlu+F4VSsPeDZ89Hgj
         tECMwaF7Kz3ZeutpKaOFk6fNYi/eAoJPvbcU15vVSs3dcZjGmSCbdO0IyOLgAjCbPtJi
         8LyBL0DwT4p/0/X6rzo07bqKQHJEH/LjuRiEeA4lVLfZY4C1uWK9tKgBeVczroh1fTmv
         DZO9gOGaK9EUDXQfW1nbwOtM2T3lnTZq/83vUf4rhC641C6AfmS9cTaodL9aszqnl9lw
         lOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577401; x=1758182201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=Q6/Eloqs/HMIHx8sVawEmXANK3AqhdAOIWJS7TLsNJB3hXj3eTsS+ivclGaLztaXmx
         OmKk/yD7FLGnPaJPOxDnU2E48sMzcnphrioc55D5mdXkbxLwWBCbueAgJKJfSsE5eb9q
         8sAj+OxK+RJJonjcPBtRxZ4j0n7LgyfMPYKQLR4CpCYcRXuQibe1JhTW7LTTj1Q2MnYA
         jgyl2eRuRQewB0aQeYlwMo4qr6OPrS10LHiUegCQ3IVP+YKEvQWAhFVNd8K5UZlQPTVn
         mtSmH0ZQbBu/l5bgAWskZHqT4yS0YL17BTjPBANrQ1Cb/2pKTSxOOycQlDpfzGnKfOu3
         6vng==
X-Forwarded-Encrypted: i=1; AJvYcCVMgXUEyWCe25eiQvVYBsK+EHAVpkEfPgwcaRbpJAhp2WHncLWCQ4XxV+eH6tSqROle0VzEWLtoWotjVaiGHGCk@lists.infradead.org
X-Gm-Message-State: AOJu0YyDzR45uY09AzDmahDTEWQyvAAg5MBaXGE7wp5ROFh5dG/An6ai
	WKRgW4p2s3r3Tqlr08L2LD7iQ7QDuX5ZSmy7y0UIPOGtjoVwZ/N3jZQQnsGn+HZUFDJANo3xGzk
	H64PdSZaz1H22370Tkodkn4TqAkR537qAqx8Xyi2Xaw==
X-Gm-Gg: ASbGncvisvjdn7z3jcX2sbI6dPMUXthlon9W7MJsmlDATsFenktnRXfXpXyTo8we6+X
	FfToPEENWuyi9Ej5lVEFAK+gXclMh2CTy2yRqlUtwzyQH37ZKgCNFrVCgKiYWFjkup7tqLIhYoL
	JtpNOvvtC29FzOjHO3/+meXZy81aZJO0gKQ0ILJwLr/WmuA49T/CLAG1E24XUbjf7p71N/syZ3F
	hoeYjfbdEE6XyqHQb9ccQ7N4Ryje6ZZ4m+kQPE=
X-Google-Smtp-Source: AGHT+IFSDgCLPJndg4TOxS4/+K2sQKL3XaKKbJwpYxrHeNncRVK3PIq5fLt3S1TrCjsBx8V+oC1pdTue83tyCk/M6OM=
X-Received: by 2002:a05:6512:3e23:b0:568:25d0:f843 with SMTP id
 2adb3069b0e04-56825d1df24mr3328322e87.4.1757577400507; Thu, 11 Sep 2025
 00:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org> <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
In-Reply-To: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:56:28 +0200
X-Gm-Features: Ac12FXzR1a5xkbJIh_yEzUr3Ha0h6_elTIUATVbDxWcMjvS8AEDuwvbJ1IToPQE
Message-ID: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005642_716961_93B4CBAE 
X-CRM114-Status: GOOD (  14.15  )
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

On Thu, Sep 11, 2025 at 2:11=E2=80=AFAM Doug Berger <opendmb@gmail.com> wro=
te:
>
> >
> > @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_devic=
e *pdev)
> >                * be retained from S5 cold boot
> >                */
> >               need_wakeup_event |=3D !!__brcmstb_gpio_get_active_irqs(b=
ank);
> > -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
> > +             gpio_generic_write_reg(&bank->chip,
> > +                                    reg_base + GIO_MASK(bank->id), 0);
> >
> >               err =3D gpiochip_add_data(gc, bank);
> >               if (err) {
> >
> I suppose I'm OK with all of this, but I'm just curious about the longer
> term plans for the member accesses. Is there an intent to have helpers
> for things like?:
> chip.gc.offset
> chip.gc.ngpio

I don't think so. It would require an enormous effort and these fields
in struct gpio_chip are pretty stable so there's no real reason for
it.

Bart

