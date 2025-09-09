Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03442CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=; b=iwTlJ1zIBByKEBc+rbKok2oC+9
	LZjqFvY3Zb8dxe/GAJmx8sV1H3sVn2jqeK/KpIHC+zGD9LZ4iaL4qNorCMdaFcazxHRmQr56YeiHj
	OU57h2Ym6jxBAIWhxAn9ntMnfw+tSWEgot0L8bhEaYmszrtEQJm4gNMfBqEv/6r3PY6PgFpGFoBVU
	XggnwadTyNMqJicY/TjyadlWlvvGENY7CD5WjtEyxb+DTipK5fEaSOgmeUykW9RYwOI+pOpr1P+7f
	8r17k4orNVui9wWha/ePZDeacX5USCYFvAdR2k4HphI/ADh5n7sLbdf9EWMFOD3x44LuznmdGulPR
	MzHcTjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1z2-00000008skH-2BWv;
	Tue, 09 Sep 2025 17:18:20 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyKh-00000007M0Z-0T1A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:24:28 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-336bbcebca9so42030591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757424265; x=1758029065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=GQrb03GkAt4JwD5Dp7AbgHKpFXOW2pja9QCWMP6vuIrm7NWHQU8Rwpfe/F49fZ+d0b
         GjHlfoTTtbUv+5PkTkGl6M6/vskL6a0vbdQA2KYgaXphpUN669+xQ/HEXGyq366FF7h6
         9ZgxeV6/7G94pXdi+XEPC941F7XMPd1IprXz642+QIDN8XEEjdEQ0dz5StPQwBDotxuS
         MAK5g9dT+RfJckrHlUtvB+qFXHawIJ7qXSfhUe0Oxj4GrNUQTxj4W9/U9MTvN/i5Y3Cc
         F+qxJ5MyMOt3f2klrrWHXlHOIcFOYpMJXImwg4Fk9nyqtJOfnxrgtheaLCD8giC5QzZj
         ttgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424265; x=1758029065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=B2ydGNnS3sdRaljRH25F6BhFH54lJ7emqncZOQGKtfvVHBv0rnCDY/UWfXpTQSCFIa
         ArAdWc6ObRUUdABl/Y8uLlhtwhWu13A7oGQnrQgd5LcMOXeH31Z3Y9RZtPXh4y0wP9V3
         +1uZuOoyc6hzk3rqnKPFBN4eJFCpAvlRmJI1HWznTBlmBbIrdEH4OTlW08HNVwR8G4J/
         bYnzxSCE3eQ6ea12WmtqhnT0PjIcdvX+FE4PGi+C9db870BVInLAYFIcm4e8wSs+EpnB
         d2yqjyi2w1HlNdyp6neZEY1IhXMt1aZaWNnGEzHBW2wTqXScBiBbSdpeXE9XZLU4SAUq
         /WvA==
X-Forwarded-Encrypted: i=1; AJvYcCVVYtJqJ0LHL8A+m4KYSUkk7EwZhyTycjQK/5EiQAg10GtlS5e0+kp+fTXDGOi4c8SR4AViVV1o9auZ0YuPAqiI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2iAjsXyC6RuWpn7RRCnSqmcle2xhCe8GCUbT+DHjt4pi4Jhao
	2uQMnsvrxYXSsVtRVEwDR443qVFLATuEAAyURwV6OlW6vjDNBHNK6+MjYKlhQ2cce2awPKoCYZF
	DD+H/Z+F72fwR8b0HcNNJyI7YIEvkP8fRYBUVnANvvg==
X-Gm-Gg: ASbGnct+2Nwz38qWYvdh40Wh0qGwfJ/AsAKwEIcEsNTyfgmKjgH39+dN10sRlmhQhAU
	INmVnBViEOFX1SMA/nl5imBGhWlvVsNDcHyWm4qiSmLz96rHvRqg3v5lEixqRGyFhKr63OplLKV
	o5NozFFXMsGoMbh0bZ5J5z9VuRm6HZSY2wfwSUACES/rm3W/qUR7EgtYSy7AhNPBilp+iH7m5Xw
	tuTg51Z+QhIUq3WOAodPc8V8FnCANJoen2CdnA=
X-Google-Smtp-Source: AGHT+IGqxpMTWwovk8l5WQ5dYhWUYy4ZcII/K/jrdWFPYe7kT1CZQHo3Y8LCGp8PKQqEA3qrGlITiYRoPcmLayU54qE=
X-Received: by 2002:a05:651c:b12:b0:336:dd88:69e0 with SMTP id
 38308e7fff4ca-33b57c39f8cmr32465971fa.29.1757424264537; Tue, 09 Sep 2025
 06:24:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
Date: Tue, 9 Sep 2025 08:24:23 -0500
X-Gm-Features: Ac12FXwbBQSlPLH49oae8yjyXj1ugyDMbkjsHTtBWh1WBSZW49QTty0I4jg5ioo
Message-ID: <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_062427_160311_FA2B59D1 
X-CRM114-Status: GOOD (  22.98  )
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

On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
>> On Tue, Sep 9, 2025 at 1:31=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@intel.com> wrote:
>> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
>
> ...
>
>> > > +     config =3D (typeof(config)){
>> >
>> > This looks unusual. Why can't properly formed compound literal be used=
 as in
>> > many other places in the kernel?
>>
>> It is correct C
>
> If it compiles, it doesn't mean it's correct C, it might be non-standard.
> Have you checked with the standard (note, I read that part in the past,
> but I may forgot the details, so I don't know the answer to this)?
>

It's a GNU extension alright but it's supported in the kernel as it evaluat=
es
to a simple cast.

>> and checkpatch doesn't raise any warnings.
>
> checkpatch is far from being useful in the questions like this.
> It false positively complains for for_each*() macros all over
> the kernel, for example.
>
>> It's the
>> same kind of argument as between kmalloc(sizeof(struct foo)) vs
>> kmalloc(sizeof(f)).
>
> Maybe, but it introduces a new style while all other cases use the other,
> _established_ style. So we have a precedent and the form the code is writ=
ten
> in is against the de facto usage of the compound literals.
>

It may not be *very* common but it's hardly new style:

$ git grep -P "\(typeof\(.*\)\) ?\{" | wc
    108     529    7315

Bart

>> I guess it's personal taste but I like this version better.
>
> In kernel we also try to be consistent. This add inconsistency. Am I wron=
g?
>
>> > > +             .dev =3D &pdev->dev,
>> > > +             .sz =3D 4,
>> > > +             .dat =3D sd->gpio_pub_base + GPINR,
>> > > +             .set =3D sd->gpio_pub_base + GPOUTR,
>> > > +             .dirout =3D sd->gpio_pub_base + GPOER,
>> > > +     };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

