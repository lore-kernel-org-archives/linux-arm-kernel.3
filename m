Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D3BC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 04:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+et2JbQsekjoDqNx2V23zrGG58Up1Zz2cWU2HWIxxkw=; b=uATdu+3PKQrOLT
	OlCb03K5a0w0vg0PywAEBFvBnp2c4GnJq51AcR6yb3D5gz0RdJF9PPr1usIN2C+91fY2Rm2hYe2zY
	IdAGLF3eXAYCHMggsoMgnX1DtwWFG7Wjw0mzRNALt8HadByGOHIzx/tpf+HeSkrjOUE9EtZ3fzofs
	zmi4z5/xpx09SGs6ORAOyuTcp7olssseD8LGgdGwdAde/dJJZMqwd4ir/1CFXi+s936LFL+ESqh21
	wguPrLhO+M/JulwBOxpVL52d1KylENIwAJfB9nHHTF9+GVbLQttVyUxzhjhwcuAqsOQPdrg9gro7x
	E0JtDXWpsYjfPHQGrfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6ZB-00000001EYF-3FsZ;
	Mon, 30 Jun 2025 04:56:29 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6Ws-00000001ER8-3oYi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 04:54:07 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-555163cd09aso1160432e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 21:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751259244; x=1751864044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+et2JbQsekjoDqNx2V23zrGG58Up1Zz2cWU2HWIxxkw=;
        b=MIeqUvScPK6QQxHq/xmD5UzMIKCz4VfARAdcMHwI/Z6ocdag1V/jjfx4KMMgV8vnck
         kIDT64c8EhlR1idXZFCn+hL1uEP6a2LnaXJ2qC1XPreXDPZd/5E80duv7jW/qzLFkWHE
         Dl3Spi8Ga8NHIDX6fRhb2OTe+vOzXWlgg7act+0UJSpYU3uxq5qoWSxAI3Ye943F+1vO
         4z/tnvJIqU/cF9zorIblpG3k7hyAzFNqh/9FS0nMj3NIS/h7ltxpezTMcMnL26CGTcwz
         Yd5OXf2G8CQ9acWnCq7xDVl2YnJVdaVOxBT3cPiht/JXhyt+xjW1tCZRNoqMbrLnCyUN
         u/jw==
X-Forwarded-Encrypted: i=1; AJvYcCXSik7bRC0y2uhqX70d0VxkbmtakqqnV0FbBQqIHliWbGKP14ks5O0kkAdTxL3eY+MaYo4y9x+067XJjmgTmn0M@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6CnIwQOUtyBjLstx5mKokUT5mcJa3gMNIHEUW7MBBf3Th/sVY
	3764IUDHPYKvoqdXIoDyxoY0lKmRjAaw83bu+/6sRBrONh3tQmQ/heApIWueseeN
X-Gm-Gg: ASbGncsdCC+F+S5fr76+48QFeqls6GZdWKMjhf42o9lsvTOmvSaPZ+SANx5yJVfoMVx
	m+kT+j8WZ7jBQzvunKHF8KugC2GUqo27gA0aelES6o6aw4Y6IXSvNlHTql3f8waz07++iyUIsgG
	/iakpeHOOeMcw9z8FrrO48lHS5Fa/9haOVJ0tJ6OKqfb9D5JvfzP1bJ+sOaAUkiWyx9cBhVC3e/
	KT+1Pq8yT7yiOOmP8UTQbqS6S0zLJNaMKXQrxxby5Tbvm9ZBkCw4zRt9BgPLpG3KlI2deQHouRh
	Tw8IbX3rawXDzZkrLTBrlJJZBAgyv+j0frgoatye+NEHFL6wn0YS37Jftdz/i6dMO7XxbVQyFwS
	HjFuyC7gyIU/vWgsKgLU=
X-Google-Smtp-Source: AGHT+IHXUZ6uHxqnUeJcM2Dp24jJXyg6sFEZeuzx0LXr/169KrbSlCWdh0Shqo0OY3aiYiqepGhJVg==
X-Received: by 2002:a05:6512:a90:b0:553:ac4e:c41 with SMTP id 2adb3069b0e04-5550b8870f2mr3245385e87.28.1751259243692;
        Sun, 29 Jun 2025 21:54:03 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f2ef4sm1273259e87.254.2025.06.29.21.54.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 21:54:03 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b910593edso33078951fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 21:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLTrfncvASeh3wEhMSEjXj9rph25SxTNVlz8GrmyLfvLMaKFwqQxsfJbwmIL1G4IaqJMUClwPiI+o7CNe+rOTy@lists.infradead.org
X-Received: by 2002:a05:651c:31ca:10b0:32c:a851:e4e with SMTP id
 38308e7fff4ca-32cdc575ebcmr24256581fa.40.1751259243150; Sun, 29 Jun 2025
 21:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250411003827.782544-1-iuncuim@gmail.com> <20250411003827.782544-3-iuncuim@gmail.com>
In-Reply-To: <20250411003827.782544-3-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 30 Jun 2025 12:53:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v670s_r4NG8hWHQ_exc6TM5JnvAEYw-vp5ndMn39X-B4Yw@mail.gmail.com>
X-Gm-Features: Ac12FXylrAnNPmh-5tW8elyoVrQtjqLfo-AL1Tmi56dNnknRJjo1EfbWOyGYXgQ
Message-ID: <CAGb2v670s_r4NG8hWHQ_exc6TM5JnvAEYw-vp5ndMn39X-B4Yw@mail.gmail.com>
Subject: Re: [PATCH 2/6] thermal/drivers/sun8i: replace devm_reset_control_get
 to shared
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_215406_951108_33277904 
X-CRM114-Status: GOOD (  17.17  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 11, 2025 at 8:39=E2=80=AFAM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has two temperature controllers, but they share a comm=
on
> reset line. We need to use devm_reset_control_get_shared() instead of
> devm_reset_control_get()
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 1f3908a60..dc4055c9c 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -391,7 +391,7 @@ static int sun8i_ths_resource_init(struct ths_device =
*tmdev)
>                 return PTR_ERR(tmdev->regmap);
>
>         if (tmdev->chip->has_bus_clk_reset) {
> -               tmdev->reset =3D devm_reset_control_get(dev, NULL);
> +               tmdev->reset =3D devm_reset_control_get_shared(dev, NULL)=
;

You could just use devm_reset_control_get_shared_deasserted() and then
drop the reset_control_deassert() and devm_add_action_or_reset() stuff belo=
w
this hunk. This simplifies the driver a bit.

>                 if (IS_ERR(tmdev->reset))
>                         return PTR_ERR(tmdev->reset);
>
> --
> 2.49.0
>

