Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79562CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=; b=tDpk55QN/8U/Vq7aF6J5XsF0Sy
	GCx+LbKEYZrl81dKoYHVaiSLzeXh3Ddb6QyDojLP7kvxVUoSxmYS0X8aoFhtZA5HkyvTI/Vd7Ffh0
	zvfXEQcPJjpXPwZujFRHkhzSXwDqit4Xnrjg+dHC4+R4tsMp8RkmZYxP6jp9VBy6PAJE8OrtW80W+
	DvsHgE22a095rV1WmD4ymJJcvM1wb3fkGM9GKLH9UpoLZvyOz9s9VT5GMslPo59MPtBySztyxqpre
	gFDdl7BMyD3yHnPHfq9jikaB7v7uttKaD/clp4/6f3XxsgPlC5vBf+ixywtuGypHAMPYrlR7OgUI8
	cB8BxENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ4b-000000032oW-1PFs;
	Wed, 22 Oct 2025 13:40:17 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ4Y-000000032mp-27Gf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:40:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-592f3630b69so210913e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140412; x=1761745212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=2CokhrBpLcnRBcKdVH9XTfneuC7UiGqv9nzrdiLiEysuhrRy2+rR8BBPHxAZAz4voS
         Pzd1xszbZcKNKdQx3XRnQxZLmbBYFqMEH7vhltKN2WYr6SAXgk+GZoUVxKJWFRUTNGmf
         gshJkJ8dBPpCKHD70OmGHi9glJAbcP8kHrL1L4PXOTqjFvMpu0IWOODESHi5+4Hh7mCh
         zxYqCo96NJFUQDSjL1UWlMUc5tueM+68EkhS/gJS4GSHF3k6bXfka0AY+U7tWAC4K8Wz
         eltuSpEolJMfKAP9q7BIk0RYOfOlipMKUfPTZNUVSTsoDhg9h/z8DOkFa7tavjE11yFy
         KA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140412; x=1761745212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=hwadxJR0atnZPJ61Vx3IXtyST+FxRJrALd+WivZUbXflpJLmneeKTxQafwh1NQuNyc
         JOqgsWB80N0OWGOaXOzVoVLQ+3al/+sYFKDOSaKIc5EiWEA3Q3IBgBdu+vvsr18YhBjI
         +x4l3czMsT9xVicKa2NAHghoJBPI7bsj8WOaekWS0fpNWz10903xkTdEM2gE7yMF5c5J
         6JbDEv+j6WWzVOdJAY8yLlaP/cn+sjBHpy9v61B9DSsFU0+how3Xh1ptI4uFhRf7U3l1
         ZVjiFfqtAjZ1a7YFls7h2wT4lmeZNUF4qSTh6CLnEqFqeQQOpSTHV0wWnej0tl6kUAMe
         YIZw==
X-Forwarded-Encrypted: i=1; AJvYcCVAjGEgbymvU7RiTv16MIBMJCHG3KHI8bCOC9LtC8fW9URbmtRz166KYRuQRFfd9YPXsuaLKgGRU8DZyLaVUOal@lists.infradead.org
X-Gm-Message-State: AOJu0YxIynAngpMJByMDDXB6IvclWkOxDQZnNp2SwxL7XjiT9uDP2nFm
	34s41hv474pQJVNCRivhNkifWuQdc9wuYeP7NVxUjW+/2v+ZSoxIbGpWRchEsjUniKoZ90xuyPA
	PYWRYZoC97Ga5HTjEZHgboHTzBu8Ri5x3G6I2J3kz+Q==
X-Gm-Gg: ASbGncvn2bY4Gr3DNfDzYlcp+y7Lv9gYR37qVQn+LLshajTvkipFg0OlmDT/3ns9r9e
	VbwTa+mdXqMy7H6+Jeo3Xk3Q1tU802snPBvngG4GTNVelzghpMm6yfSXIaDudwpr0kv4HGKnzCD
	0W9cdUvvVUOXQqJ9bNyBt8SWyLl42O5qwB1r2ZHTVbZQpJxvffCSMkpYSq1jnaTnTvrHDZA1r5a
	PHw0T47liAzTYLc47CJm4WReIa2LZKpHZ0KTm8fK0VmGY2gnio7THqsuJ7kcouHfs7yvq6VKSIr
	KKhcr+qK/MnYRj+omd0UMJoDbuU=
X-Google-Smtp-Source: AGHT+IEKqm8lYyfETbDHoX6GlVAlvBKAEAKibR9/ZUGF9ZkgmvVU7aDY+sPQ7pncE4VQkSkH1+uh5CHDb76NK4aZXko=
X-Received: by 2002:a05:6512:694:b0:57a:1846:df77 with SMTP id
 2adb3069b0e04-591d8550fa0mr6598936e87.40.1761140412394; Wed, 22 Oct 2025
 06:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
In-Reply-To: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:40:00 +0200
X-Gm-Features: AS18NWC2AFr1HYLKJbD6SJ_gfPPZz3lolA3TRfFJfK8fopnOG8MhqaQPJHZTguM
Message-ID: <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251022_064014_561386_43547337 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const=
 char *prefix)
> >         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +bool strends(const char *str, const char *suffix);
>
> Why not static inline as strstarts()?
>

Because it's not a oneliner.

Bartosz

