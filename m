Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6C3EA852F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDFstEs1KY1Fpz/YDHLmkAVGM47ZjRStu++37xClpw4=; b=bXVnT0Wm/Z0OvmHQ7uN3olyYZh
	DeZwmcdZQDI9AW6VbB+ByUJJz/wANuund89Gnl9wJ4hznkR0TvEvQS4Plp5Qs72MYBFBUL3NO6CsT
	/LjbOVhKbYBTKJTODzU1QpTITJS4ZKPEkm13RENWO6INGD3Meqo24tMJtNoFHYZA2y2X/GVTn9OkG
	/LM0lv63NRx4XA2c0nHkMxWywoEgedjTj8O1G5tz8Op5GPVnNCk/Its4AIgeR31V21GFww0d54ZHA
	e3QTSVnLjRhD/coczP0aAahK4AiDjDPD3STOQGkbPwGGAtMrX0XG22LbZOTkB2PAO6Xw37EXX0SPg
	sUpJtULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzO8Z-00000006SjI-3Tpx;
	Mon, 09 Mar 2026 00:06:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzO8X-00000006SjA-46hR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 00:06:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDF8E60121
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 00:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63811C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773014776;
	bh=7VfkDWCT25IPiML+OuV1VYi27QKD7JmygfyqI7YGyJI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FJblPt5jpv/3qqX8qI8PbjgpkMG9LbfWYZPE3/oM05ArvhT3IO8unTa7K3/ZPwKJa
	 JUDVkyySyf9/39minIvepp61mc7TV4xkWXevvEITxaNv1WrrfqT9A0dwcqnuSCVFEx
	 AV3TPM/dO2SJyE0bGIp9BgtY8CTQeUfVKlIUf8Iy0TqLh1faCzoS0utycxfVwOGo8m
	 IPx56nFuVFlSCDpfaylVo2A+9YJzLJ+KgYJyF4D2AnDFarZvnmUINb2dAKk90nTnPh
	 aw7gusA6NIpzj01Y2EvGGd8ltrt1eguA2IzlP4VNwlgdbm8T7MlryKT7A9wYsWuNdP
	 68B9ZD/TtIYzg==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7987531082aso106551497b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 17:06:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZOYlzn4kOc5zQmQhxV3AYh3tg9Os3hetqRuYe4AP06qEeod8mdRuUrd5mmL8OhBVLrJUqvPmyyB6BlrC5AXho@lists.infradead.org
X-Gm-Message-State: AOJu0YzcJ529BAHSPQWAVSP/xioOqf6NQDu/kuYzpiQYDdQ/pU3SRvnF
	VyotUU10WvB0hbCKzFglT5BwzEtYrVIyIJUMrHnGAp3n79VnIFBAfLDJuD7oasTGpbL8VYbWhHK
	Me3/e/UONvKkbD+2gdpZBYhluHxSPgM8=
X-Received: by 2002:a05:690c:4d86:b0:796:3c99:1833 with SMTP id
 00721157ae682-798dd7aa7ccmr92587587b3.60.1773014775703; Sun, 08 Mar 2026
 17:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com>
In-Reply-To: <20260308021535.48098-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 01:06:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
X-Gm-Features: AaiRm50BkNsacwf3vNv8Po8_uyxzkaR51BCh7HDgMk0GF4BnX_1Cwh-_3Tsm4-Y
Message-ID: <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:

> Use a flexible array member to combine kzalloc and kcalloc.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
(...)
>  struct msc313_gpio {
>         void __iomem *base;
>         const struct msc313_gpio_data *gpio_data;

Do you wanna add:

const unsigned int saved_size;

> -       u8 *saved;
> +       u8 saved[];

u8 saved[] __counted_by(saved_size);

>  static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, =
int value)
> @@ -631,16 +631,12 @@ static int msc313_gpio_probe(struct platform_device=
 *pdev)
>         if (!parent_domain)
>                 return -ENODEV;
>
> -       gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +       gpio =3D devm_kzalloc(dev, struct_size(gpio, saved, match_data->n=
um), GFP_KERNEL);
>         if (!gpio)
>                 return -ENOMEM;

gpio->saved_size =3D match_data->num;

I know it takes some bytes more but it feels way safer.

Yours,
Linus Walleij

