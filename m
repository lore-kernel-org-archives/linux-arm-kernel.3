Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15C7CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSGJ0XvVlaWK134DsZlY3yMuGiQnMb56P3+rclOYz8g=; b=QVusguzRsX9WYsUguGoVBgh25Z
	/EYlh8qIjYDBY37prjpimWcj+3YxftNSfY02GUuVyPE7x7OGyfHXZy3KxFlOOf6o+fJeUCrvoHlTH
	EfIrPDKsVSDApiImNZUIdesSXFXD49yh69M5LdRBXZijB764IAM4persAV8IA1J9jXnAKEfBpylWM
	lr3sLvxVAzoNojasBQGjaiOe2KH5Nm+rhuY1/5PS07+ajtqeZ4gSKb1DojSpyG1SrVY18WeYKWi4l
	koOYrq8rhpYKvrTt6o5lN5Q3pmQHU1rypFME9MHRurc3gr/1cGusi1k/Ko0iTqyuaUO8q4ptdNNpY
	Am0MnPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hlR-0000000Ahpy-3PJh;
	Mon, 22 Sep 2025 14:43:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hlP-0000000Ahp6-2us3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:43:36 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-36bf096b092so9151121fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758552214; x=1759157014; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wSGJ0XvVlaWK134DsZlY3yMuGiQnMb56P3+rclOYz8g=;
        b=cU7w+mwKjRQP5UsZVxBDO616AfcksNTOPemwxnCI+7TcovpABIT9zivv2jjJOqpaiG
         /XAfCBDf3KRjflBs0rVKUL/ktvX8K2Z+QTsIZ17zxoYFsmHHQJbMVvbEgbL9wkk0/D2M
         fvZ8kZzerGjY3xZOxg5259KOoIVpf92PFnI9GCuSA960paGHx1xyx0n2MHLmnb2mSyOY
         d0Cd2cwhf79J9t+8GaUPsgyCwaGkfOLq4WrnO7shbMrOnLYpo1x8XO86BdScQbg+jSiT
         6UhuJQs+q90wgt/AsDd/87zNjllSz6CjhJRaVo1PVfJ/fPfOoJMXMAvbu3UhQ8JWutKv
         IVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552214; x=1759157014;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSGJ0XvVlaWK134DsZlY3yMuGiQnMb56P3+rclOYz8g=;
        b=EAHF5ZmNYXoY5vpz9/nYNn/Bf9QfVp8HynCab3HjWhPlK1HTBneao7KEC8MyGAD7if
         b87eHTzD4T0tKlJjjt9OmDeb+NnxfyajmaPxGVRaKh0fTnkUiq9o4DwYCV0AEkYqEak0
         /au3Ob6rf6Q2qu5KUuNgBAMhNbw2iKihIk2qDzZIpqaO8ve4C0Fo2zKAkmst2c5UFEsO
         yDaSmjHit3k3ctCPhRMc3pgMZSwT/I9sXr8BHrH/ShUeJ3P/RfyphQaUFVNFXFDKbeBL
         FUV8ScNqPW8t7Rrpr99myEWKM39v5wFXXdGBD0/xt8FgJV7IUADrRttKpIbTsbYseZqn
         VhWA==
X-Forwarded-Encrypted: i=1; AJvYcCUl1LIXRzQVRlVhPOZtPrxJec5EfwKbtXkZg/X8ORirn/mKQEgKkBDG/G02OFVU5jekdo4Ma6+NAHRzHOS5nU+W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8nfNszxlEij0W6FtJ1dt+mqeM8k4dsSsXVhOhmJfjXXLIDLJ8
	fodYIqHFcvhuDsAzN8eXixNofuyAwAfLmTAeUsDiBdri4VLJIybhAOzSrcNnVW16/1UFLzS65j3
	Dwudan+9sR6UbpcvWtczV6gn+kUC5VZqCDbEzOj71wQ==
X-Gm-Gg: ASbGncvWV2g8DQTY8W6mnYTx4zOO4sjFkEXZs6Gal4nyTcEbolfFt7tdUZeZxTFn+Wy
	qq2o8l2+peZCjziVt+y9I2bz//3qXBLXiHrB26mIoXeDevrGnXR828sRir55/4S80irDDh0yiHL
	IouUua3D2aVfGxcG/iVGwA/cR291Hdgram0Uk32Q2qI68h2NPRqDvuuC/OirrDiPQhuv+7yPFjP
	UGOUeknsNfn4eYpFFI+o2L2ccNDaygzCaTSog==
X-Google-Smtp-Source: AGHT+IHBWA0aOkyyOd+R1k4/p6+BRWwsMoHsL9ctLqhXkzxhgXeHtoGxeh6xuifdB+qoyNNy9NaiBYY06/o80dRnaMo=
X-Received: by 2002:a2e:be11:0:b0:350:b715:51f1 with SMTP id
 38308e7fff4ca-3641c63392bmr41010931fa.39.1758552213655; Mon, 22 Sep 2025
 07:43:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:43:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:43:31 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922-i2c-mux-v1-6-28c94a610930@gmail.com>
MIME-Version: 1.0
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com> <20250922-i2c-mux-v1-6-28c94a610930@gmail.com>
Date: Mon, 22 Sep 2025 07:43:31 -0700
X-Gm-Features: AS18NWAukxKDxcsu63Pdrf7A6bnsBHb7UFkZ35gRQoLZiLu7TwdGXK-pBJ2BNLo
Message-ID: <CAMRc=McVePrs_+BKkpO3zf_AUcxhzp+8Cf6Tyh1A97nzkx_ZRQ@mail.gmail.com>
Subject: Re: [PATCH RFC 6/7] i2c: davinci: add support for setting bus frequency
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Michael Hennerich <michael.hennerich@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_074335_748615_889D69D9 
X-CRM114-Status: GOOD (  18.68  )
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

On Mon, 22 Sep 2025 08:21:01 +0200, Marcus Folkesson
<marcus.folkesson@gmail.com> said:
> Populate adapter with clock_hz and set_clk_freq to enable support for
> dynamic bus frequency.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index 6b18938457d0c5cabc323c364d9330c2890df107..d3e47738f8ee7e8f69fee49509dcda396c9b7fb6 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
>  	return 0;
>  }
>
> +static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
> +{
> +	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
> +
> +	if (dev->bus_freq == clock_hz)
> +		return 0;
> +
> +	dev->bus_freq = clock_hz;
> +
> +	/* put I2C into reset */
> +	davinci_i2c_reset_ctrl(dev, 0);
> +
> +	/* compute clock dividers */
> +	i2c_davinci_calc_clk_dividers(dev);
> +
> +	/* Take the I2C module out of reset: */
> +	davinci_i2c_reset_ctrl(dev, 1);
> +
> +	return 0;
> +}
> +
>  /*
>   * This routine does i2c bus recovery by using i2c_generic_scl_recovery
>   * which is provided by I2C Bus recovery infrastructure.
> @@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  	adap->dev.parent = &pdev->dev;
>  	adap->timeout = DAVINCI_I2C_TIMEOUT;
>  	adap->dev.of_node = dev_of_node(&pdev->dev);
> +	adap->clock_hz = dev->bus_freq;
> +	adap->set_clk_freq = davinci_i2c_set_clk;
>
>  	if (dev->has_pfunc)
>  		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;
>
> --
> 2.50.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

