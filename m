Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F750CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2LFO3Id5PU7ftFHyhtH9UbJzb29dd0urW6inqON3e4=; b=SzdVwwMCD8WG9lqN/gxgVZ8Ztc
	9DLzVhB5n4fGcA+Z4mj9JfEQ43wHIBiSWkf4/ekGzYIHxJVVXOMf4wWOn7IMUwC9oWsnSUTZM7HiX
	Cxgp+Rihs1yEe4n1Ezj5cTTnkfEws6Z9ns+AhiI2qjAHZlXvWbOZOQCF/gvah3QUz3a5uu2i2z0xV
	M2QttFm0H83hqzD4idT58zVsH/LEdLamlpPJcnw1JPIoh0barPXQJ1UOTNfVfexA2czBAnFps3u+T
	mAeqh+jBDijzTb7+DtBB9oyMh5RrfWzgG4ZThgXWzGf66P/wsaPL6Hd9TvL8X8ib3ZxbiZDs+YnhP
	V1y3qQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBB8a-0000000Gtam-3Pr8;
	Tue, 21 Oct 2025 12:06:48 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBB8Y-0000000GtZl-31qT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:06:48 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-591ec0e4b3fso559910e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761048404; x=1761653204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2LFO3Id5PU7ftFHyhtH9UbJzb29dd0urW6inqON3e4=;
        b=bMTzVEwLzv2Lfw5NnZtWG5f9BY7a+p9xQxsNvRDd5mywP+FVHJx8+PRG9J3uZbJe/K
         Jr3QM7JNz7tavsw7R3yKbm4Z8xBCNxR8xNksRkqSTbPQNX/hflDhPU1AeHg/N6WQMDTq
         utjLosJnqnSSMnaUDffpFM2KnuOe/gpZp6/eg2U7o0tcU/ajkNSFtEH7/Nuaws07le6k
         L8n272fO9quaX/h4lwj3q9Ap6MJY6WEUkK4rDTh1yyRdz2cDExPNRIlcRDQUmQRleceu
         NHvARH6GxLVLJ5jSwXddbbIFfWicSGcPT4IZT1Ps6xEcBF2EMNA02hhyiPsd/ji9lh7G
         p5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761048404; x=1761653204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2LFO3Id5PU7ftFHyhtH9UbJzb29dd0urW6inqON3e4=;
        b=GlbNlzh6pUXe3ffmy+nm409lM8qqWzOxUHEWZZyRRHsWEupmu0qrxK7u3h3YxLKPUY
         4Zayd/9BW935kpwTsMdy7IeYAqcMG9HyNEJg8Cdm6n7aoHOBFgC2THzrF2LbefaoOkK9
         HAzJK67I0Ke9XTfacS8qVHRkIrNkBcQhvvHZO1yG40CO/I3v1HYdgfzGbqwRW1XDpJil
         akHn6IL6H8l3/S7jTZtdlQIAzvrrsEfRoI9r0629sHNtMeo8O6nEgzcBml+ZdIOW6tEr
         o8slbXWwu0//+81GZzoPgZ0P3cEYfkgiPNU06F8R3EraJ7m+B19Thy+KJ098IgdwlIQ1
         +EYA==
X-Forwarded-Encrypted: i=1; AJvYcCVc6CZu4FeGCNwuhySF02nU4NUjINMqrsAc4QL0Ai6AEnFJzU9UgCMqi03thd5qEYYuibL6evP2ZiURjRSyOfRD@lists.infradead.org
X-Gm-Message-State: AOJu0YztRz9bYg7Awq0ogIUL7NPrZyYVyK82JW9SQjld/dRIRk0LaIZy
	0jT8nGV3f/pFgOj3kwfADK88YvZh2i/6lMyNnbdc9S255ou3LTbCTH1R8JZp3Mb9fI35ryAoxRV
	WNWYsPL1ktIqNfcAfaNRIga/MbTEmVYLHAROm4Vj4Lw==
X-Gm-Gg: ASbGncuHO1LWzSjcqg1E2UEXPAVBtwlKecWuApArsrklA9/IwaW8mDdPfNq2lCehLqB
	kt9CJc3a7W4B0tGp/B3dV+2eaaWheCHGnih3YUSnp5Espxkx05CfPMoAdutdynnIIpelWwT4MNn
	FUIEakbHYah4cNMxs1lBCgA/+kq3eMgPZ5CKJiCQwPnjZ9/+Gv8ZdaQ8G1D788/EAAkY+9b2wS/
	E0ksXR33W55s/yw2dKIXkVx16pzCd56Y6RiwklVs0jVqIQ6vruFcY4FjrslobMLpn8aG6SuEmWJ
	cHDYQQnQrQafyVN+
X-Google-Smtp-Source: AGHT+IEeA2p1C9mduUxezytlThTWwIAafPtXXWLk0U+AE68AlD8B/b+fLCobL77uAw7zXcaVlFRH47WXQcM6fRGa51M=
X-Received: by 2002:a05:6512:130c:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-591d85516cdmr5498056e87.43.1761048404206; Tue, 21 Oct 2025
 05:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com> <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
In-Reply-To: <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:06:30 +0200
X-Gm-Features: AS18NWCS0bDo5asDO54GB6xpnkDJCZdNkOPsf7p5f8WdpHmgmskO8LgWJsfISW8
Message-ID: <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_050647_014557_D2F3649D 
X-CRM114-Status: GOOD (  27.90  )
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

On Tue, Oct 21, 2025 at 3:53=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
> >
> > That only happens if the driver uses the reset API. If you go with the
> > GPIOLIB then none of this matters. I definitely don't want to change
> > the existing DT sources either but I want to find out if the code in
> > this series is suitable (with some modifications) for supporting the
> > PERST# line or if the logic behind it is more complex and possibly
> > requires separate, more fine-grained handling.
> >
>
> All PCI controllers relied on '{reset/perst}-gpios' property for handling=
 the
> PERST# signal. Now if we change it to a reset line, then the drivers have=
 to
> first detect it as a reset line and use the reset APIs, if not fallback t=
o gpiod
> APIs (for DT backwards compatibility), which will add unncessary churn IM=
O.
>

Ok so some platforms define perst-gpios while others use reset-gpios,
I see now. Yeah, it's better to go with explicit GPIOs then.

> But if there is no way the GPIO subsystem is going to support shared GPIO=
s, then
> we have to live with it.
>

Well, there is going to be. We already de-facto have it but it doesn't
work very well and is fragile (I'm talking about the non-exclusive
flag). I very much intend to bring this upstream.

My question wrt PCI PERST# was whether this is useful for it because
IIRC all endpoints sharing the signal will assert it (or rather their
pwrctl drivers will) and then only deassert it once all endpoints are
powered up. This would translate to the pwrctl driver doing the
following for each endpoint:

perst =3D gpiod_get(dev, "perst");
gpiod_set_value_cansleep(perst, 1);

Do the power up.

gpiod_set_value_cansleep(perst, 0);

And with the implementation this series proposes it would mean that
the perst signal will go high after the first endpoint pwrctl driver
sets it to high and only go down once the last driver sets it to low.
The only thing I'm not sure about is the synchronization between the
endpoints - how do we wait for all of them to be powered-up before
calling the last gpiod_set_value()?

Bartosz

