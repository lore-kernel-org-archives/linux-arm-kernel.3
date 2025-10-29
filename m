Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EB5CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=; b=TAejqaFtTp0nDZbyAJg/+LxE9C
	AJWFwhBlnc8vjqY5lv9wCepRnv0O0IoIWKyI4TZgNBIQXN4diUUBTN/VjXCa6tYWCw+R4r12srJEX
	27AgVsrL2k3MYvuS/hQTRN8Ytl20WjZPc3Qf18/TYsYCYQc+m/t7Vp/rrJwZ3GCO5HmXNHtQ24eyw
	pFnpk3TDy5F6rvMjZc1rOqZGy/2OAElQt75IglL28AM834+/9YMo9uQD+gHYptjxTaQoOSNWPy5ok
	c6B+P5hFB5hcFynBh8xEX88t5L40vtgiMfCQT47fAw0qk0Hy4UBoFpMnEUkjaOTkrC1d7ThTPBWsO
	9exaJfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5UY-00000001CPk-1L8s;
	Wed, 29 Oct 2025 12:41:30 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5UV-00000001COF-0IaY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 12:41:28 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592f29e273bso2613882e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741684; x=1762346484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
        b=ZZV6nBnLXNXR2lKcVTAM5Eu7aaMFRsV9/V1A2ZiryhOumU1ZcUlcLB++bCOBfPj4a5
         YZfg+A0NSrlHmzC1nKY5gigAQnHyWGS5s20bb1aGSorMT4YNCKa4kiViyy0ybB9n4QuU
         XChZiNdNtgKFpahJ4HXWZgzy1jC+cnEOHeDFwenC+IPOLi9DUnGSDXSFQr5bmm8sZJGv
         iPskLgtOgOq4MPUl7GG1CwmrzbReyGvo1f7KamOB5Rd9Rk4ic4rL0iHoxexSiwQUrk1e
         P3NpgBL2lELwjWk7GJfm+vAbIlklXYhYM1hyVNJqzKL7XVwiCQwaKbyNPqdf7MRhDUGG
         WfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741684; x=1762346484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
        b=S3SDoIOt/RaJvQpO6jTXK7cnD+wK+Mpaq7VXrggF71WRml9F1Y/6YfsAnnWJ+EYA8u
         lmJCu37dEBE6+ygjUt9Jh2+AZVPk0AxKWEVmp51PQZPh7SiW4b6aVxnGAAmpDzGAzCzA
         EYdEsIQ7xGkx/ZHqnV4B2jMANylKiL0TexKWOGHht85iWiropSOgsP02jDMogdCZcPK3
         r50jc15uOhtL159Mxt/RcBGtMkkkfiuz+m7eTSmbw1cDGRYIyK5iDs6AclvDFSlx/836
         rSnbHi8zAEsyxSDhOETTTKgToweRPLDigJXwM3E0zDtoj4nW2bE5SbQhN2BzJk57iqzF
         F2jg==
X-Forwarded-Encrypted: i=1; AJvYcCXP+GArXqcJJVy4wF27g5tFWBwZ/rLEC0VlOQlXjNLyFW560+aREDyFRikgGKYc9MR5gJSrVvpPqag0Xt79QTUX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj0t2YtU4IeSw4ArQaogZKN300poJTTZX0Ltv7rx6nWcbt8Z6c
	vlIcZEMCO4XrDXrVVdigng7mT0rJ2Hx6ToV9v8ZQ49cIEMepHWuQQoruAj3LOMbqpbzF4EG0Edw
	NHCU9C9ycbREnhHtztapz2Qvecid3gCZSOFvmbiZ17Q==
X-Gm-Gg: ASbGncsR7CGOTzsCbaGz3RSm9QZWZqEnQn23cNhnV3kZeYYJDqZf6+NUFslCgN97SR+
	pC0CkkQi8B9HagfY2QgmkRlPXs0+qbU/+Qqd+L3+++tJWywiMBPLWRz8wOyn9MVKn5jd/gg/65C
	rDm0zsQX9NbE21VwSvn8TeENYV+bq8lwj4H1VRD9Avww7NwJTseh+hJwfEcmHSP2viQDQUXrPq8
	Xjz+exGZdY5phhYt9G3CJbpWa31TB6AAcPAco+dNqQdlol0+D4HTMDnoqbHzPUUxWqFqRjmlKOo
	R0dnPM0gdK1/2Pba
X-Google-Smtp-Source: AGHT+IHlRZvbfo/SYNZZ4o30tnBaAGKMcvTAo3NYRcGh1EJ9OHd3AuMhXHkwK8JOue6As+3lLZ2qXnJTw5y6BaOTrIQ=
X-Received: by 2002:a05:6512:3d05:b0:580:dda2:5318 with SMTP id
 2adb3069b0e04-59412a36b93mr989969e87.8.1761741684202; Wed, 29 Oct 2025
 05:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org> <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
In-Reply-To: <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:41:10 +0100
X-Gm-Features: AWmQ_blYolUjn6HNVFswcXKBY7oowKsMMcCgguiaK5B1Up7lgJHjEAFObXA-S34
Message-ID: <CAMRc=McT+HinKvajHmBYPcQKoboapAf2E3ErJSP=2jXW9B0omA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] regulator: make the subsystem aware of shared GPIOs
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_054127_134764_3345D50A 
X-CRM114-Status: GOOD (  17.10  )
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

On Wed, Oct 29, 2025 at 12:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:46PM +0100, Bartosz Golaszewski wrote:
> >
> > GPIOLIB is now aware of shared GPIOs and - for platforms where access t=
o
> > such pins is managed internally - we don't need to keep track of the
> > enable count.
> >
> > Once all users in the kernel switch to using the new mechanism, we'll b=
e
> > able to drop the internal counting of users from the regulator code.
>
> I am wondering if you took into account the layering violation (or others
> put it as "transferring of ownership") in the regulator core for the plat=
form
> based GPIO regulators? This popped up during the discussion of
> https://lore.kernel.org/platform-driver-x86/20251024050537.92440-1-qiuwen=
bo@gnome.org/
>

I am aware of this weird ownership transfer in regulator but these
changes don't affect it. The layering is still being violated though.

This should be fixed and I've looked into it but it's not trivial so
it's another big rework for the future.

Bart

