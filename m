Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A0D32D9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUb3nok/AqP7r33O+yPL3KeymIM3B7Unh2DohKMeZnI=; b=QnQhqxg3gOn15cX2fhRAoCF/o6
	PfPExJT96JWCqA0UJiDKo1xkG2mLWtVzeWfBPhrfcCmwj+lXE5PKG1MrbhW5S+8KmuzePDhSg961u
	D/SgOvu1CEr/OZoKPapSRYyD0sJw40ffwt2GLcGwf8zcO3coK3pHrbTXN3FOitWvf59NYa09mmT5N
	ak+xlKUzK6CX5t0J5HkeG6UFDJ+joHlsckQFQQbGC/gFahMpXqz5ICBAigIdo7NgbYJFffQTwara1
	lJkJg1DzTH3wNnSzaUWXUZ/3bCvq8Q57TiY+OpfkTk2pAUPRVS64iWOIytEBAz4Jviq6M56DFm5wG
	NJuO3K5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAq6G-00000003POU-3RPh;
	Tue, 12 Nov 2024 12:34:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAq4S-00000003P9s-2mbm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 12:32:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9acafdb745so1104924866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731414754; x=1732019554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUb3nok/AqP7r33O+yPL3KeymIM3B7Unh2DohKMeZnI=;
        b=JguBej9j2uAiKxAAsA/chLEdufKZ7xpLCpnfRDnAJL5WLFubw2qGwg5kaNZ8r/NRlX
         UYOuDblaC8tPToT3xkOJ97LwO2GlPDAtPUEBeGPne3WNAmXL4zYsNuNwX9YU/LYOSLQR
         eKKWGG9eVj8JMSBbYslTU7cmoeoyYit85iwzJfJfMJbWIXnilP5J0cZb5sfWdDxJRmcT
         duSrl3/Psy3erenMe2nLzCatLfN+ShmroPUtQaKCWsQx6t/uBDESkM3kLT2UB/+NaDBk
         W49QGm1leMUE4RwqDEFXpDNpfTqiWhbAWTosNeuGujgvyrtuE2BahwdA1jDPmReT+PYh
         arHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731414754; x=1732019554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUb3nok/AqP7r33O+yPL3KeymIM3B7Unh2DohKMeZnI=;
        b=GPNUJj5dDRfDivcTkOzp7kV+PAFhneUqIXhWlZRCl3cfDvdJoV8JdXPCeZ7d2VT2lW
         FD5b16mqpZ0M4uw6n7QJHIyu82jwul1WAk+V4y5VpyrOl7Tn3Ifh3eHYPTksITDIyEEU
         uOLHAzPK2JXpvE0Vrx1BAwv0QzLmURSh/XoYKGXXHlsMUWrutv6aPekhGpXMuuC6+bdN
         qDssrLuDO5uAHxM/0i94kbtocu7D/97plUfF1lAwmn2eqklZNQpu+Ft1QnmJX4rkcT/Y
         UJcwO4zV8RczJWeA+mIgzKqy/SnkkgGW4sxsmyQITjDR7eSlg1ZBjOFio2ODi0mjj/of
         8OIA==
X-Forwarded-Encrypted: i=1; AJvYcCVp5L7sH52ppEZwkaoQ/t92DKWsInHunsiv4krnDnHrUShD0f7LDmU03FYICPYJ/GpsCszlOip32GpVM/S1gC91@lists.infradead.org
X-Gm-Message-State: AOJu0YzXBJdvyyLxhysx5RQISYwCt7YaT++sucSJ9RRJrxSAFi4Xg2ge
	ZStpXYeyfnPIxgcn0a67TKLoX/Kq4xQIxraf+nwAko6JMEvEGjo+qMKHVdjjq/sSAq2NiPkKZBP
	cNBnk8FD1jy3TvvE1AuxTTNUBCZ4=
X-Google-Smtp-Source: AGHT+IHsekqXC8V0d+CZha3eqodR3E96t9ckKwPOB07f+j+M/7b8jWQS1qzjFRSvfRjwlg4Rl2gJoAnqrU5IZqFd6j0=
X-Received: by 2002:a17:907:9492:b0:a9a:1575:23e3 with SMTP id
 a640c23a62f3a-a9eefeecbf6mr1635915466b.19.1731414753506; Tue, 12 Nov 2024
 04:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org> <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
 <ZzEPACoblmcQD9yu@surfacebook.localdomain> <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
 <ZzHSE9Nrf4YySJrq@smile.fi.intel.com> <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
In-Reply-To: <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Nov 2024 14:31:57 +0200
Message-ID: <CAHp75Vfm_7Gq5a-v1+=WCq2w0Am0VF+z_NPenHbuvV-Mj+MX4A@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where possible
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Aren <aren@peacevolution.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_043236_725482_94A709E2 
X-CRM114-Status: GOOD (  28.36  )
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

On Tue, Nov 12, 2024 at 12:15=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Nov 11, 2024 at 11:44:51AM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote:
> > > On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> > > > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> >
> > You can do it differently
> >
> > #define STK3310_REGFIELD(name)                                         =
               \
> > do {                                                                   =
       \
> >       data->reg_##name =3D                                             =
         \
> >               devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_##=
name); \
> >       if (IS_ERR(data->reg_##name))                                    =
       \
> >               return dev_err_probe(dev, PTR_ERR(data->reg_##name),     =
       \
> >                                    "reg field alloc failed.\n");       =
       \
> > } while (0)
> >
> > > #define STK3310_REGFIELD(name) ({                                    =
       \
> > >     data->reg_##name =3D devm_regmap_field_alloc(dev, regmap,        =
         \
> > >                                                stk3310_reg_field_##na=
me);   \
> > >     if (IS_ERR(data->reg_##name))                                    =
       \
> > >             return dev_err_probe(dev, PTR_ERR(data->reg_##name),     =
       \
> > >                                  "reg field alloc failed\n");        =
       \
> > > })
> >
> > I am against unneeded use of GNU extensions.
> >
> > > > > replacing "do { } while (0)" with "({ })" and deindenting could m=
ake
> > > > > enough room to clean this up the formatting of this macro though.
> > > >
> > > > do {} while (0) is C standard, ({}) is not.
> > >
> > > ({ }) is used throughout the kernel, and is documented as such[1]. I
> > > don't see a reason to avoid it, if it helps readability.
> >
> > I don't see how it makes things better here, and not everybody is famil=
iar with
> > the concept even if it's used in the kernel here and there. Also if a t=
ool is
> > being used in one case it doesn't mean it's suitable for another.
>
> Just to throw in my subjective view here: I don't expect anyone with
> some base level knowledge of C will have doubts about the semantics of
> ({ ... }) and compared to that I find do { ... } while (0) less optimal,
> because it's more verbose and when spotting the "do {" part, the
> semantic only gets clear when you also see the "while (0)".

Seems we have to agree on a disagreement.

> Having said
> that I also dislike the "do" starting on column 0, IMHO the RHS of the
> #define should be intended.

This argument I kinda accept.

> So if you ask me, this is not an unneeded use of an extension. The
> extension is used to improve readabilty and I blame the C standard to
> not support this syntax.

Here I agree with you.

> While I'm in critics mode: I consider hiding a return in a macro bad
> style.

So, summarizing the discussion we have a split, hence Jonathan is our
arbiter here to judge.

--=20
With Best Regards,
Andy Shevchenko

