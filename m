Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC986C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVJSFhPr+MWcVdsQvQ4e5j7EsE3f4zAOy5yVDG+t3BI=; b=Md4gXZxIpNQDc4+GfCTvDGPJBJ
	0BXsZC2sKsocfMEG8zRelNYFVT5trnBHCI0phEjIpaQe8Tkim7VjJzISUOkYnVZsLxJl3ymx2+q5K
	Wg6symbDycxXWAHStv68Hrn++YAJgsLt2draW5Xtusmaz8fA5/cMjeclkTJmrft4dNMh7sC3xRGZz
	1TdLf2AdCjhZvsx71U49C4x7DYGmM6lmCZ54cNNSfzFeVpVRvPNiR8DgsrekGobrHLTG17KDNCu60
	zwesDfB6faAxJAEEAhL6uTPV7p7CLWP0TahLzzA64b17DhjbEXaZVEzdSqkCSn8n9sJ9GSgw0/9Bb
	YdsPsodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNLn-00000003ZjQ-3uOh;
	Tue, 04 Mar 2025 08:10:03 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpN5Y-00000003WiS-2mW2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:53:17 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5497590ffbbso755691e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 23:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074795; x=1741679595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVJSFhPr+MWcVdsQvQ4e5j7EsE3f4zAOy5yVDG+t3BI=;
        b=d1NeUBVQ9+Kikx2OLCpALnYiJFYbmweYwp9+0x/en/+7RURlG+LRww9Ie59SRdleIG
         Hgqst1AaNHFjLiL88/sLoFOYf8HvoQpXrHRa0+eNkg1ix7+NIilPA47lo8I9Qsms2aJL
         45GOONH/xpezuy2qf57e9IrRjqmAS+3Bb7E3MmGiSp8lERD2jtMhAwoiLfEn666hpkE4
         7tcGbYTbfAAF1b1gqXebMPfvY3T2ADKU8WPOTpoQ3E3kv+T/ZYJ2FELR5TIi8mmP91bP
         c7soEtlsjXIFszjvT6MRE7rTqHxBoBaCrH4zpw8yVOV8r/8TCOeYNrX+VX1069DMdUo1
         CsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074795; x=1741679595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVJSFhPr+MWcVdsQvQ4e5j7EsE3f4zAOy5yVDG+t3BI=;
        b=r/LqTmMbcWK1n3wspAYsScuELh7rayKzk+PFrY8WAZhMFClVC6Khm5PoHfwky1biSG
         IKaW9yB8Adw0Z+92FmnZnr7eyqhGfOwg91uenUzvqSrLZFCYVV3sKGADl//lgp2yg7R7
         CVvLV8VQTtq8413v+laQwP5aCRibhykQhicRioy0sd5S5CIxzBYR3I4x59+oFYhSAiL+
         AUKhDbz3PGicGoTNxiWCSoh/UCkochGeBRNlZjmp4Lwxl4zOCtD2DC+DmrcN+w488c7k
         Wy3qdo3pv3ckhLQJ52EPZ0euuqoZPwwgd+EYjLrX10V3V69lHipqcKQzJ0GXtBPLv/vV
         Ustg==
X-Forwarded-Encrypted: i=1; AJvYcCWDSR7RSctr1xf2VZg2QyzL4T80Cz1thU6muJ1QWmLPaIbhjUc0lh4Q9t3mL5nXTwlacnBzZBdMH+Lm2jHuzIEH@lists.infradead.org
X-Gm-Message-State: AOJu0YwiBZJ5qt+Ym6gdWW+N+Z7ClnM/DDzbox8Okwwj9HChPzuQ9Sbo
	P8F4Pw5mM4UCdvZKMPEaL1n9ronX57RmG55UNtPnuvMNyL7KXZ/3DofH2o8ZYWXCCXdBriQK/aF
	eNRQgnPCjXituC0395zr2jiLIhTmaj8dtLTjr8g==
X-Gm-Gg: ASbGnctRE0v0h5pQHC8OmESj9M9g6sIitvK2BXvHqHf6PTwXh69zzuwqQK8VEZdO9bc
	aYjKWL+E3YnUISmdzOwLFl+MfXtcxVXMwWk+izLzjD5NSu7y25ZaOGBC2nGyqDcajEVFfktXon9
	I9SGeLpmGq0QQYaev6EMhzdrt1UQ==
X-Google-Smtp-Source: AGHT+IGo7kPW6t6mFBR3/sTMivZuqhRH0SeEyZ9ok1vnRKx+3P9ggktEPjyopRkd13VsV+wua67se3lgNpjzpez8VHk=
X-Received: by 2002:a05:6512:1044:b0:545:2efc:745d with SMTP id
 2adb3069b0e04-5494c3546d1mr5523229e87.46.1741074794798; Mon, 03 Mar 2025
 23:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20250219102750.38519-1-brgl@bgdev.pl>
In-Reply-To: <20250219102750.38519-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:53:03 +0100
X-Gm-Features: AQ5f1JoUOBReXAYnYf9thqIoVITthD3dUEJajNI_puN1-yLNkKw6af5pX77JOew
Message-ID: <CACRpkdYeBM6V+61-cbX1g_wLAVHvQQrtPb=5qjTdUw--+J+E4g@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_235316_715775_313C07A6 
X-CRM114-Status: GOOD (  14.04  )
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

On Wed, Feb 19, 2025 at 11:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. This driver returns
> -EINVAL if the pin in question is set to one of the alternative
> (non-GPIO) functions. This isn't really an error that should be
> communicated to GPIOLIB so default to returning the "safe" value of
> INPUT in this case. The GPIO subsystem does not have the notion of
> "unknown" direction.
>
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_d=
irection()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.or=
g.uk/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij

