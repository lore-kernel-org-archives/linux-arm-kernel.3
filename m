Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53263D41D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BS4Z+JVLC+cIyIjSTxJTy/XnT+AgYmNkxO0eQSRVvDQ=; b=cSv7ubdxC7ZlctliCXeR1zVo7l
	6gkt83vrTgWGVyP44e/P6tzVB94h1Zz3UVoLtMqQXha8hT+yIhkV9bneRONyeQOMLzXw0gb5QN9tj
	4xUFqkUyIcRZAa4VfLR6SLdgPr6mOm77UXO2f2OkpfFT272/b/tlHPeWJWpphM54Fhli8vsAjTYHU
	LQDy34dNyxTKPqVwpu50EkUOFa4+68qjkQagWu9a8xfkhpzkqsVCUwnGMf7fM7jsp91V6xDZEn9If
	Pt/fvrq5hMVOfvTFKCIWOJ6Ywcel/O7Zoc+jdZxewg7+QTiq1KHnusWNMWjhK1O1+7K5LhytSNeF4
	qnlchnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmdb-00000002iSo-3Iyr;
	Tue, 12 Nov 2024 08:52:39 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmZP-00000002hKd-3fMP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:48:21 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso44696771fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731401297; x=1732006097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS4Z+JVLC+cIyIjSTxJTy/XnT+AgYmNkxO0eQSRVvDQ=;
        b=vEt1a18PyuPDhonc/Sv6FP9Oi8/4VAi2BkpRAj3yJr3HYPGMb+qi8vSS/iFwTw8MIF
         YhBisDRiAxJXrQjpRNNodMl/ZNlIl7s8HTw5BRz5u0844jnyhqr7lrDRSyjp2RRvnTaG
         4LNcWdZVtJe3ODWf4RpSmAU2iqXED7/QWK2TemXG9EdjtCnSi55PyJLXtgo+xudd42NL
         GPI6RqR9W2rRubnqhSK4CM52VlLqA8Ovk65QS7Xoa+GKVsTi9skVTEwe8FtJNLSgASar
         iknmuQBJeFF8+atFVk81Wixe05O7XvEjOW/u7LbMV/tP5aXZvSYzGf/1MyesM8i8238T
         T/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731401297; x=1732006097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BS4Z+JVLC+cIyIjSTxJTy/XnT+AgYmNkxO0eQSRVvDQ=;
        b=poEUPZ1e0bzLjdno4cIs977EuJoUA9MfqqoNbO2rE/kpIRrpB3v3cFKz0i3FZS9LZh
         hoURD03gz7CPQFzCSPC1OV8uGI4GCoc9oQJyMAURFoVU2438cSkoGbA0Zpgz5pWHzUWS
         2FJYsB3M13t8N6w49/as+wO3rhg2kU80Qf8LRLZQSUBXP/N44AQKfG+T8WsF7jYAveib
         aZCdacXDny3G/03XMMu361qvxmoy0RigiEyVB01TBLgRI+3n6Wd0JgjsgZWwgQThvgNW
         dW1WoZ5jsK49mhfEq/VuLaxfTa1fIDYjrx53B2KvdN42ToxOpUTpmraIC3GVSlA+VS6T
         wjGg==
X-Forwarded-Encrypted: i=1; AJvYcCWqlgMHPQRjKr8laMnSleJpP7eoLgK7/2DMQdJM5+X1NiBK7HFQlSpno7jpcpg0RcmhezrBT6k6UngLni8Cd5jm@lists.infradead.org
X-Gm-Message-State: AOJu0YyNTX/sWXerjmHXawZaoO5UsR8l8HojqVxtLGJKBxRQVCMApPQ7
	wtj4/lxAZsyQEp8DYppL7wvcfJwcgNvxCrqlin66L2QcA+b6FFtr8ZpQhujisgX1ar+p8JskHJ+
	0y+17JCg0yIPTaIZaxo2JSsYOjQ5WEOOs1bROkA==
X-Google-Smtp-Source: AGHT+IFwq/t+KDsbuV2QhWwuNI5bupx1wsWOMyqz9EMw/Cb8GOHaigP3+bypOiWYwPdWO9Dvex17+Yq5iUawyDu5Osg=
X-Received: by 2002:a2e:9a0a:0:b0:2fb:3e27:cbef with SMTP id
 38308e7fff4ca-2ff201bc2c9mr64900231fa.23.1731401297361; Tue, 12 Nov 2024
 00:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com> <20241112015408.3139996-5-ye.zhang@rock-chips.com>
In-Reply-To: <20241112015408.3139996-5-ye.zhang@rock-chips.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 09:48:06 +0100
Message-ID: <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_004819_934434_78FE34DC 
X-CRM114-Status: GOOD (  17.83  )
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

On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:
>
> Since the GPIO can only generate interrupts when its direction is set to
> input, it is set to input before requesting the interrupt resources.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index c090cac694bf..cdfdd5501a1e 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -476,8 +476,11 @@ static int rockchip_irq_reqres(struct irq_data *d)
>  {
>         struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>         struct rockchip_pin_bank *bank =3D gc->private;
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
>
> -       return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
> +       rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);
> +
> +       return gpiochip_reqres_irq(&bank->gpio_chip, hwirq);
>  }
>
>  static void rockchip_irq_relres(struct irq_data *d)
> --
> 2.34.1
>

This looks like a fix to me, do you want it sent for stable? If so,
please add the Fixes tag and put it first in the series.

Bart

