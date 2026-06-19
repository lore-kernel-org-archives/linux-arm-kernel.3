Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9523CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XofZBRO2g4jbv/LmzqRbA6Qcj0U1+cU7wRC11RI4KvQ=; b=pOO5JUL4HuvMVyxHD9VPR2Z5Vl
	Z33LwqHpZoafYNjInNDs9/d08x6f/lmV2JkEcbTqF50uHlYpqkj40pJgvzTLQcqoOR1aRkM6JpSR+
	0jvp6aLT81CU3jOiMjK6tcMvW1DabSmKi71tHLwFZiCnazPGI6WwaQEr9brHWhAda+8vnDvpJ/ilK
	jqCW/usrxcBxXmKNWJ2cjFBH3HHWurI1moBeW05MM2020GQy94n5mcCYI/PlLkSJDlhyMaO1F+41W
	PtIjg91dJ+Dsw5kxEOZ6f4EatnolKC57xt9n4DT9BF1LkyWQWIf3DPpfmGURRxscEhsCffVd/ffse
	SM7vqW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTjI-0000000270A-2Qpj;
	Fri, 19 Jun 2026 07:33:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTjH-00000002704-1Zb2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:33:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A8C6C601E1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF591F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781854409;
	bh=XofZBRO2g4jbv/LmzqRbA6Qcj0U1+cU7wRC11RI4KvQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SptuV/1BaVGh8H1ggiyAcaDGieNH9lMFYi9lCBxR66r+EYbFgfwcdL9XKfGW1tlKc
	 uAXGY5FpbAbI52t7h1YlHQoXvs+Cif0X+qGlNKmgslNunH4uVIRrOvOgnYl3V9VYMY
	 Du/j0NrZp2WDagDs89lZyE5H+ZPFPYCSRD2SMrLI5zVe46rep9cwR9MVDJ5wf0z6Eu
	 4GydvSSRTPGy86twauVNx1zCkGRvGdG8NEMd6yO+A5h7J+hRhajU9og3XKDWh5+K5N
	 5OMcGlheyF0WreNqMVIA3VjdIK4TbT9852i/5mx0KrKWYf3sgI6JhSyiQaIUYf9llK
	 44h1LOcz2x39Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3965adfd75fso18628141fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:33:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8T8081sKoZEwpU4/PXmPvRQ0A3EG1JIhl8EDPX0S6vVEc2YXqUktyRKJBP7Z/8CfZGYG0wUhMwb0ZwSxlzZVUU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk4SPDtBy1dTG1SeDQ0RawS68HqCsqdBK80TpLQl6uGwtz2b4E
	tfQurZF0mtU2jjvBVIZrSeF1vL+VIvps6jnohcts3xYC4Sl1g4bFopJiMwE4Pa2kBIqdv+KlXPc
	pMno2+UytwR541DD7wOTovF8utkTxmhz1F/+ZdkebAg==
X-Received: by 2002:ac2:568a:0:b0:5a2:b43d:ac47 with SMTP id
 2adb3069b0e04-5ad576da270mr715841e87.5.1781854408062; Fri, 19 Jun 2026
 00:33:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 02:33:26 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 02:33:26 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260618133429.3214475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
References: <20260618133429.3214475-1-andriy.shevchenko@linux.intel.com>
Date: Fri, 19 Jun 2026 02:33:26 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfBnNu=-8mKHd8iKaNZLwQc6AdtWOL2-HQGj-M4B2ZYXA@mail.gmail.com>
X-Gm-Features: AVVi8CfdqQjSmbAIMicu3OVmdSBzQBf6rAXZIdVBoir9zi2zoP5Df-vwZZAL8Yg
Message-ID: <CAMRc=MfBnNu=-8mKHd8iKaNZLwQc6AdtWOL2-HQGj-M4B2ZYXA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: davinci: Use generic definitions for bus frequencies
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 18 Jun 2026 15:34:29 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> Since we have generic definitions for bus frequencies, let's use them.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index 66c23535656b..67ce39cb000d 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -117,8 +117,6 @@
>  /* timeout for pm runtime autosuspend */
>  #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
>
> -#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
> -
>  struct davinci_i2c_dev {
>  	struct device           *dev;
>  	void __iomem		*base;
> @@ -760,7 +758,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>
>  	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
>  	if (r)
> -		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
> +		prop = I2C_MAX_STANDARD_MODE_FREQ;
>
>  	dev->bus_freq = prop / 1000;
>
> --
> 2.50.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

