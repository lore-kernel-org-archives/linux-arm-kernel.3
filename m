Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DFBC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AKdoyoCSvRsoZGSSFw8MoqljRP5EvFB4ozAvbpb1Ao=; b=yvqpn4jgIG7wnStTjZNLlKyuhC
	fBelS/+1rnXamffNJ4NBF3N/npinglCqVayK4vtWpH93UBNjvmRvE7vnGqKxDYoe7f5SWuoX5y+8d
	gcPaV5/ZuVO+xXRyG4bquFU9+gAuJ85FHpUzeuvUf+VYPyKqaeEMtkPIdRB+s8UXuLvuRcMIfGGLl
	SUbHIr+SSaJXUEfGbVzq/LGqrE5usL6BGL965f0RzpimE8QQ8thTsWenIHWDpFrbOQnS6GQjrGI6B
	WUHGcCUYiCwGQcVMQEDiOAaxXp+is4SnJjf080oGEIrMKb2uoSYGmo9DP2zwy1nl34qgco2R0uzu6
	QZ3pyt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwYD-00000005xcr-1ZqK;
	Wed, 02 Apr 2025 11:46:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwOf-00000005vLK-0cnW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:36:42 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54963160818so7301129e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743593799; x=1744198599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AKdoyoCSvRsoZGSSFw8MoqljRP5EvFB4ozAvbpb1Ao=;
        b=K4ZGFiJwo1kle/7JmL+gyZVc/CKXZK3kUTrFci3gZnAiEA8boLy4Jb30AJeCKpfrBU
         RT9ccNBJ/IrobhEqz3DrlWeJuiTwkico9bxqLQjhItD1FM5rlvbTVffjfzPNb6opbEVq
         Ed+RPGZrAkg+vHjU0/QYNE0kGFbKKeqSuDpojfzETuuHNy0AhnWXK7tWcHwoYe2qRngm
         vVRNJNGkXr/iJ8jTa287L8Wp7d0P8thba6Du/LH5ifoCzwUrDR9L65Ufzt8qStyIU2+a
         BvJmAjTO69+aNMFK0XO1rw6TImuQQ6IXL92j+lzFGVhNrL/rI5/tMPlpLfpDjiG+XoTC
         UVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593799; x=1744198599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AKdoyoCSvRsoZGSSFw8MoqljRP5EvFB4ozAvbpb1Ao=;
        b=Vy5OAm6UjddIUpQFXExFRRuqoTYXOEbIjNx96d8dduuqP9pLPAFbODtQR22D45bI4E
         TCSK+gUZWwrDA2FFpPedVKkdTpxXIJUqVn7zpyYZdfQohuTw/sdU+31B+afiarJ10xjA
         9h/0HPcV4g8nWSgzt5/Yh7DUrQhGcF4hHoZWFe9w2qxkX3KSm8Kr53edWZF7+Lku6CqI
         sgiZ3OPIV98eQ/wh1gApEqxPk7qxGwWZdNRqfQPw8okho+TCKdQHVRLoCl7jiBsXTDau
         9V1R1IZkgJUshgTl24mWOKWc3RaihHs0IYsQT8FmzO+QxyDvaDKO3bVT5TmmMbw4G+Mw
         iehw==
X-Forwarded-Encrypted: i=1; AJvYcCUsR3hhjInRws1TqVOEFiUyNudSeF5IxWNjXuo33dHQTfO/QYHWuy0CnS3eQsaMUvJkkr9zJtxhaeY5BbP6OiHn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlgrma20z63ujTIb1Yegpb/jMybxbSckWFbaaT6v66Mp/JkIgH
	gAl9gJXCmOtVeA9JvwZNi9u44FOkbMal/Jp3EaG3ijZY+Tv8KBB8dKeZUcImfVacbAeZZVpwD/Q
	7vjCwpvq/ZO3tTMyTc4LapjtBY+ZvOy8eCGKN/A==
X-Gm-Gg: ASbGncvVShlUtyuPcOTJLJ0PIG6Ljhw8lUtGbmIp32JJC8Kyp7ks6JjfagyCTqGUwZm
	Tmsig030ZRze3AiPLKn/qZ7Kv/RWtugURnDl6FHiPZ4gVBDhbZEedp/I+P8dZ6+rQEb6D1MBZkO
	QCATBuj2JOtBb+GyLVKPUrKUJe0vuTq4HGLVF8fiHJeGOTdYh49eaY5aUvBA==
X-Google-Smtp-Source: AGHT+IGsnbfXwvFZVuoC9UDDv3Npd3hZvi9h1Pp8wvqwNQjg5U9HC70EwnrQvmAWsGN56Cs2yZSGmu1+vFuYnT3C5tg=
X-Received: by 2002:a05:6512:334f:b0:54b:117c:118a with SMTP id
 2adb3069b0e04-54b117c1200mr3694523e87.55.1743593799153; Wed, 02 Apr 2025
 04:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250401224238.2854256-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250401224238.2854256-1-florian.fainelli@broadcom.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 13:36:28 +0200
X-Gm-Features: AQ5f1JrJhtH8_ur3V9au8mD0Q0X31nTvcx7xt8ybgxveuCtP18Bl-AMF_VqywNs
Message-ID: <CAMRc=Mefks5RMDkO-w-WT1279rKKyz8Up9UbuNdcF+WpsOxioA@mail.gmail.com>
Subject: Re: [PATCH] spi: bcm2835: Do not call gpiod_put() on invalid descriptor
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043641_315967_511BEB43 
X-CRM114-Status: GOOD (  19.94  )
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

On Wed, Apr 2, 2025 at 12:43=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> If we are unable to lookup the chip-select GPIO, the error path will
> call bcm2835_spi_cleanup() which unconditionally calls gpiod_put() on
> the cs->gpio variable which we just determined was invalid.
>
> Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/spi/spi-bcm2835.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index e1b9b1235787..a5d621b94d5e 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
> @@ -1162,7 +1162,8 @@ static void bcm2835_spi_cleanup(struct spi_device *=
spi)
>                                  sizeof(u32),
>                                  DMA_TO_DEVICE);
>
> -       gpiod_put(bs->cs_gpio);
> +       if (!IS_ERR(bs->cs_gpio))
> +               gpiod_put(bs->cs_gpio);
>         spi_set_csgpiod(spi, 0, NULL);
>
>         kfree(target);
> --
> 2.34.1
>
>

We could also just set it to NULL on error in bcm2835_spi_setup() but
I'm fine either way.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

