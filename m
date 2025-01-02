Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC78DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXTAfC+Euk2ZqORptfnn4DhQu7bG9q9vO1UaX0EloG4=; b=DsZ5K44uyAdqTmhuRrsFLtI/RK
	XEuM2Ag5AuUrnBgy2w+a9vNP4yyCvWCVcQt7wawEfuk2I/vNlTSB3qR7yotRSNN5Gn/0cSvSvnnio
	3DmDdyRRWbeybQ583UFb9oSHoWRycuvhBAsNZsHzNSab8kYP5vZAgosEO9CzR6xQw6FwSnQQtaTFO
	1F3aVzNgx9gE2Tr5ox+weUNI5dSQ8Yd+jY6BJjAbHiIizwxGj8cty1wyKKL1LUIe/i81gfcMOl4yk
	1NXO3bW9J/4AbCO8SWwxey1y1iMXc8I10H/vQrEM+F1jFAuGsQeAZtp2AlcmjZ9On6e3yROFe2S4y
	Dq/KSsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKa0-0000000ANTs-125i;
	Thu, 02 Jan 2025 12:45:36 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKYq-0000000ANJp-1zIr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 12:44:25 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30037784fceso122829551fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 04:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735821862; x=1736426662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXTAfC+Euk2ZqORptfnn4DhQu7bG9q9vO1UaX0EloG4=;
        b=os9xrMP4ApjeNhac0t70f4pcH6Yy2Rfs4VU+otgWZzWIss6I3G6hX4EutlawAoHVeu
         IB71684Z9X4NAPXgvlzSWcStSn7T1hS0hQayTK9sE4O/rgWNXuFiV4vFrenrTgKLJkZx
         o2WbnE/iyWkpbeaTl656KRhxscsDeHjot5E3p8GGSZ+NdkHxUI/XNZY4ZZYU0INPvX9z
         1+/gsRjQ4qI4SSBvd2UJExYEbBffozIBrBKr/1n2rAeYPy9qVUuf2MDm/07Yp2zdSMmU
         9JdAm2DLGNCkwzZVNpouwH4Z5XUcZ5V0CMlvqkkwpC+5l9LnvO8c4Gu0L1W4INk5GMcQ
         8gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735821862; x=1736426662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXTAfC+Euk2ZqORptfnn4DhQu7bG9q9vO1UaX0EloG4=;
        b=CAo7tIhNMl6WCfL6TLoYEsr91NH8YUOhMNEMlcfBl2DYv0U/bqUN+1d5KV5aV6k6no
         E6P6QZxt+nQX8pnZo/KhMPti3AlJgh9CAxvj260j0ZrcWMMh6GQhbPxxT258ykaJvyFR
         kteh0/tLp7UOKvKc17Cw/JUHSGHuvscuRK27/C4iGXlgadf9By687XepFxaPMOvgcVrt
         p17MMlA4Hm7RlnXX3Itoc/pU3iC6rFtNuAZMLK/TGT/9rNtIb3kzRa3a8n8vh9L/MrYo
         NWzfoIhmxXrq8Bo6iiSWmV6Ud/xnHk547xYLn7L4X1ff60iaLM9YveJhhH/DAo1i51A8
         WCUw==
X-Forwarded-Encrypted: i=1; AJvYcCXQFfRsDD5WlRBVkl2NYxNkNB7RPzGbiqlv5eBP4x7yXPy4hcTkFsla4XlazXf9TMpI8TiQJ0fpSIzGImmRCr06@lists.infradead.org
X-Gm-Message-State: AOJu0YyaSVIaTw7lDsEOm4u1A56aVh1z3z/KgWKQwxdjtknxi586pgee
	9Btn9xDyTtTnKqYG9k0+tgZuCZV1d39+ZuFGEx2u5Z+mlEdV5Wi/kPO8xDyY8PwpPyNdT+vwqzd
	atIKYFbsCVJ1/UoKP4xyWbtaRIRB8EU4JmoUfKQ==
X-Gm-Gg: ASbGnctnGCzzvIGy4HqHy1Ru/RjYltAhwGxkxgwYvlXxOtz/cGR76LYRhH7ieic9EOl
	SBbNj3e8JW2zsP0VbZ5MaIhZvSKQQjtaBupoDVSlsoEFLY4JzAWVQsTvh/osfY1R3PyBZng==
X-Google-Smtp-Source: AGHT+IFN+1+CuipJvqCLG4Vw4U/YbFqzg/NPb7q0hphJvRrX/+TBcZVtRLbOtGXDIiwzUKteo04vTtva7evlHbUMD1E=
X-Received: by 2002:a05:6512:15a2:b0:542:2929:63ea with SMTP id
 2adb3069b0e04-5422953998dmr15195603e87.24.1735821861896; Thu, 02 Jan 2025
 04:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20241211102337.37956-1-brgl@bgdev.pl> <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
In-Reply-To: <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jan 2025 13:44:10 +0100
Message-ID: <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_044424_539432_7A6FF8F3 
X-CRM114-Status: GOOD (  15.66  )
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

On Fri, Dec 27, 2024 at 12:41=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Bartosz,
>
> ...
>
> >  struct davinci_i2c_dev {
> >       struct device           *dev;
> >       void __iomem            *base;
> > @@ -132,13 +133,10 @@ struct davinci_i2c_dev {
> >  #ifdef CONFIG_CPU_FREQ
> >       struct notifier_block   freq_transition;
> >  #endif
> > -     struct davinci_i2c_platform_data *pdata;
> > -};
> > -
> > -/* default platform data to use if not supplied in the platform_device=
 */
> > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_defa=
ult =3D {
> > -     .bus_freq       =3D 100,
> > -     .bus_delay      =3D 0,
>
> what happened to bus_delay?
>

bus_delay is not set by means other than platform data and it defaults
to 0 so it's safe to just remove it.

> ...
>
> > +     /* standard bus frequency (kHz) */
> > +     unsigned int            bus_freq;
> > +     /* Chip has a ICPFUNC register */
> > +     bool                    has_pfunc;
> >  };
>
> > -static struct i2c_bus_recovery_info davinci_i2c_gpio_recovery_info =3D=
 {
> > -     .recover_bus =3D i2c_generic_scl_recovery,
> > -     .prepare_recovery =3D davinci_i2c_prepare_recovery,
> > -     .unprepare_recovery =3D davinci_i2c_unprepare_recovery,
> > -};
> > -
>
> what happened to the gpio_recovery_info?
>

Similar story: it's only ever used if there's a pdata-provided
recovery GPIO line set but nobody does it anymore.

Bartosz

