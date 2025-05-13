Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4818C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbTjqzLb/usw4AglVSkWVEb3Jvk5PTZ2BLQp+GyDc9o=; b=Yd1aNcheIp4g8BfAdH/ZZCoEFl
	m5fgLRd9UC5AlbHPwhcZEqDnBkQ+I9g2jzPNVOrLWr/ZFAZ2rh7jjS6Ul5v/6QO0ObYx++UxXAsmF
	9AGZrs4eFdgdxmHX+4fTY0msWvGZrrasAjH8+TraNHLVTADcCwL+eE0i2vroM3d6L1/vIXQBNYH52
	Z3TlwKm/9wpUhWgTttWGKLyB+FL2X5toE8ZmXRlB6YtfE/fbqKeJZoBTomCnFxyWLhRJyLrScvBS+
	JWRRqTozNxv8bjbhvzErMJsYarxtyuT6Gxdb5f9bLdFWP1y88GURSqQbj7ypnFeBb7msih05xpBmg
	YH0zBpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXY-0000000CvpP-36oe;
	Tue, 13 May 2025 16:31:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsSb-0000000CvIm-1L4m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0CDF7A4DA2C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 16:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADA2C4CEED
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 16:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153587;
	bh=ga3zCv76QkUCBLxG+3obr75Z66d/dc+j2DqdsPQXh0c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ghnA84IHlg7O22yhptVGd5Vo4K2suyTcvlb+dB5s7Xg4X6SCKx0ZtMdwAnmiIGhrH
	 M868zaiZXQjfGDXf9pX+lD9EQ9T5uT9qwj6inycMkJOrwftBuYfzqwRkK1PToW2PZs
	 RYNCKFYf3234mnyWthq+oKNmQQvb8i58T5ANMMw1R8pSUmTgMPX1KuXrfKOLRSumu4
	 Y/Lg0OuxA6RGFWAgVYErB6RT1wwV+AFVxlYEKgJ6/v10H8Ksf7D8azLajSyucjEEwe
	 mWxhdjJIYEZ+LQTq5P2LTa366AGYaAE9nvfu0kzlc/FZxK0WpLPebLv/Wk5X+aA5O9
	 LGfIdhM7MlxpQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac34257295dso979210966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVz5462LveX4NkU8J6A3w3EIJ7ZrdSkoTQBIWnv/HDPgJ2bru/GbfAr1hZyM2JXoXiwAkEhqOoGcoSsY8q9T7j6@lists.infradead.org
X-Gm-Message-State: AOJu0YyvokEmd9dHcG0Syk1CvhuNudy/TNoithSZbcasxfGMqt2vOzIG
	+7FfP21nTl54KZkpo6dTyLpGCSKB66kfIqlquqZOh66Ic+Z3mMk428ypNELtlzaohv7pGnk8fZA
	7iWN01HyvVVB2z5fOAtIPzfFk3WQ=
X-Google-Smtp-Source: AGHT+IGLphKmJHdSpxiAM6EZINozmZaCBpRvN/kTcv+//ma0V7JmmF8efQr+QHrkewteuL8JarBqgc1UuBNDbXrxzSs=
X-Received: by 2002:a17:907:d17:b0:ad4:f6d3:a188 with SMTP id
 a640c23a62f3a-ad4f755173bmr20068366b.46.1747153586566; Tue, 13 May 2025
 09:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250512082938.97110-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20250512082938.97110-2-u.kleine-koenig@baylibre.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Wed, 14 May 2025 01:25:51 +0900
X-Gmail-Original-Message-ID: <CAGTfZH2uk-6-R5QNZwsssQ1UtnqexKeo=e=SsXB26NMwqf8c9g@mail.gmail.com>
X-Gm-Features: AX0GCFv7rFmK8zZwyel010vviBuZuUDkrqDnxqcGo43EqBsoQ0TBQM5VkdZiclQ
Message-ID: <CAGTfZH2uk-6-R5QNZwsssQ1UtnqexKeo=e=SsXB26NMwqf8c9g@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Fix misconversion to devm_clk_rate_exclusive_get()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_092629_507302_993F64FF 
X-CRM114-Status: GOOD (  20.80  )
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

Hi,

Instead of fix-up patch, I'd like you to send the v2 of patch[1].
[1] https://patchwork.kernel.org/project/linux-pm/patch/20241111112237.3363=
10-2-u.kleine-koenig@baylibre.com/



On Mon, May 12, 2025 at 5:29=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> The patch converting the driver to make more use of devm functions got
> one conversion wrong making the driver not compilable any more. I have
> no excuse, mea culpa!
>
> Fix this by adding the needed device parameter.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202412070231.MzXdNrLv-lkp@intel.com
> Fixes: bc253b28a365 ("PM / devfreq: sun8i-a33-mbus: Simplify by using mor=
e devm functions")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/devfreq/sun8i-a33-mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33=
-mbus.c
> index f99af530211d..4bd5657558d6 100644
> --- a/drivers/devfreq/sun8i-a33-mbus.c
> +++ b/drivers/devfreq/sun8i-a33-mbus.c
> @@ -381,7 +381,7 @@ static int sun8i_a33_mbus_probe(struct platform_devic=
e *pdev)
>                 return dev_err_probe(dev, ret, "failed to lock dram clock=
 rate\n");
>
>         /* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
> -       ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
> +       ret =3D devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to lock mbus clock=
 rate\n");
>
> --
> 2.47.2
>



--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

