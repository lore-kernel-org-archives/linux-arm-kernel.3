Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C5EC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8uriDz24bpdoccH4vWMOCq6HU4t2QJ/y1gbdDpbspE=; b=yiOTCsiSzgbgEK
	bErU/Aa8R317AU7t2tIJUySg97HTSBks/7XLRyGO310vMYLczT8ge8qUlfpX8PGHZWU3TdLLK4MTy
	0og49NUtl42Xv0NyyqvR0uQqGhivfvHG8G6BLcnVn1iavrdkCiGNst91zeX+qW8O0ALuF+tLPGXSp
	nX4643P9TFmF2Rz9clpHaOQ4TJfKM2YCdxgYcjpGOf5+28tlqJ08A/Bb04LjVVjq1whbnY0X82bmV
	I0jP6xGDE5DUYrmoWpQRGkq5YrNSnXXZZwoo2GpH81EIN2i92ji92TioBY8BUqRb9gRHrtz1KRb0l
	Qb1cOxoWV06FxvCYF9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk18l-0000000FFC9-2rkH;
	Wed, 15 Jul 2026 15:03:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk18k-0000000FFC2-23gq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:03:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD16340DFE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B009C1F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127793;
	bh=s8uriDz24bpdoccH4vWMOCq6HU4t2QJ/y1gbdDpbspE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Mg8SD4XjqFxEhVvUb7Rw7m6gxyqCFykXs0hQYgBxtwU0FEDg1hLUxobvy6V29Nlq6
	 bz031aMYeEvbsRwphnMQsXDNoue1Erw2J/AM0m6tPsFEuVl4WgHM1llTKS7m8g1hno
	 swDUge/7WhaQN8ljISgS/RqJ3vMlXKtQlc/JCDMHLkL+8Xw7JoMFGPfT//si7uE2L5
	 /tlGy9TJmirzzwtkxGhbqekk9Pm9113lGpZ4Wk4Ch9OZPo3gu4kgJWzoqzn9aoyr3H
	 B5CTNcm1vat3e+p3ofvbcK+YqhDzQSjq4AMaXLeOxvabUNDl2XfDqyQsAespN/iG4X
	 649IIEfkzaT9g==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7eb3865ea6fso3686856a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:03:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqEdYCW+64re7bmbxRk5Th0ZRZy636F0nNOZSv+g8P2ihAhuTOwIL9HyKQAcKF52hfV7utpuLpvk7NqQ9DYONKu@lists.infradead.org
X-Gm-Message-State: AOJu0YyR5sjAf17aLXVFbq7UqsWqq6a6MeL+sbqUrK63BEayVfE21esf
	b20yVTfGQatiMMHGD6iwnsOYPJY/bLSI8EXjeWlcKEuZEc2KY7hHTgEK+KgW5dWPok5r5WipGQE
	zitEX8I8vN9z3aCYJMUpEZgPhGuKcECE=
X-Received: by 2002:a05:6830:290a:b0:7e9:e19f:c015 with SMTP id
 46e09a7af769-7ec423e1b9amr4763700a34.30.1784127792848; Wed, 15 Jul 2026
 08:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-3-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:02:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
X-Gm-Features: AUfX_mzAhYE5GHJMqIrUkkUhLvN9sPzUv98iZb5X0KnS9-GyHXUfIRnCGG3q2Ys
Message-ID: <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2026 at 5:56=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The called functions already log failures where appropriate. Return the
> original error directly and avoid duplicate error messages.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.=
c
> index 05308df3ae5b..71f7a1fedd88 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -2380,31 +2380,22 @@ static int sun4i_codec_probe(struct platform_devi=
ce *pdev)
>
>         ret =3D devm_snd_soc_register_component(&pdev->dev, quirks->codec=
,
>                                      &sun4i_codec_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register our codec\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         ret =3D devm_snd_soc_register_component(&pdev->dev,
>                                               &sun4i_codec_component,
>                                               &dummy_cpu_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register our DAI\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);

snd_dmaengine_pcm_register() doesn't seem to print an error when
dma_request_chan() fails.

> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register against DMAEngine=
\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         card =3D quirks->create_card(&pdev->dev);
> -       if (IS_ERR(card)) {
> -               ret =3D PTR_ERR(card);
> -               dev_err(&pdev->dev, "Failed to create our card\n");
> -               return ret;
> -       }
> +       if (IS_ERR(card))
> +               return PTR_ERR(card);
>
>         snd_soc_card_set_drvdata(card, scodec);
>
> --
> 2.43.0
>

