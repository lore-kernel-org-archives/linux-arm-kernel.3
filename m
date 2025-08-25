Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E0ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnMFRUI7OrpeFHOHQnTbYDUskSBfz/K49TJPo7jgp3o=; b=guzkP6PWV4cuOA07q/k/xhYhV3
	KFe0mu1kiB2w8BzWYQSZxjOnBaSiUoomE0qdcFpgzx0bwbHu+s9GIEwORSQIbxO8Da1yldS+cR8re
	Y9v7jD6US/mMLZuKF4x3aQSVKWnm2IXb8wMf2YjviFdwld7USQfrSV97F6b3Pv0zqqX1L6CTIjuA4
	VauOELDSqKU1XmSt+f27si7y9PIO6h/uI9x+wcYiCF5pEoStnz1KvAsCjTQ6Ango1HrvZiAJhgFLA
	dfwxwqs/1kawWN5q6YahEA2INnW+4q2asbV2itJDEdXqwkDIt37u98Oc/akGsREYuRDQo7q5vv/hd
	KZAKAP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfO-00000008LsH-1Mpr;
	Mon, 25 Aug 2025 14:59:26 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWkm-000000080yv-1oOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:56:54 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3367e0f9c1cso3402531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126610; x=1756731410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnMFRUI7OrpeFHOHQnTbYDUskSBfz/K49TJPo7jgp3o=;
        b=YH/Rr/XaqlrEZwvxJH66zRFup1N5B04dfeW92kqI/R8LAbyatnq1x3aACI4C+FNbOp
         j2wpVgNCzIPNLXePRr62Lq+oRh185m8149vBuaiLJ9SKEXqr6Qenw6rl4LTvikpkAMbE
         O4G2gY8qxs1mcR1i32N0aEdFzU4NKtuABkfR9oPFuJowvb+3hjtuBjH/n1e7SAKUazVt
         gqdItK6z9OxZR54Z1aD8MxdBbuyrEpWZfGeMD3OuMZpqbJYT+BXn4qlM2Ih8t4GaJfwh
         q0XQgtV3bsl8/Psyi9Noz5mpy0YL56SLxcJUtt6599AunYwtBKjjnSjsSeUxEt49s6/V
         1ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126610; x=1756731410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnMFRUI7OrpeFHOHQnTbYDUskSBfz/K49TJPo7jgp3o=;
        b=YWJsQJPNhGO0HCctwGDGV6JKGP42zey+10YrLh6ivxGFXrO0+BESEJd1TRf0HUQNiy
         3fPR3xgeetr21FScSu6W1ZwkWD4UUhgiC04sNmtb0uK4eWbmZ3d/BQwqZVMY7hZXreES
         Ts9o4Ed4ZKq9QYpL26VBb/IUNj1ul+V/ObNp49MFvt3D/IxtBGrPVhgThDGeYMeL1lHG
         /xOUuoJJztWlJSamqr1kAaIMAh/bZWBx9o2RA/q5nfXz5I8AyShMvSRs6cxwvW5W+56w
         N4pBh4g8AHygpjSxamlN8ZGzNHvCZK58urFalw3HQhKauncLK32nEHF/hFdvMHBjnirn
         bYuw==
X-Forwarded-Encrypted: i=1; AJvYcCVViXN6JePnzOEr25ragTXQ91gzC6dneDllJUHS4YPuPYAAap37RbDs8OsnyLnTY25XeCcQe3GAak5Flxty4HFh@lists.infradead.org
X-Gm-Message-State: AOJu0YxFe28DeGUBoS6JFoUBAJJ3CkbqVK57GfbY3o8RHf9+fWSvQHzC
	ofN+izHl3Snsnz7/juuj0SVrizIMks7n8D5IHS1n3/t8P9xAFk/MLQlfXa3RemZ3CJwcE71cfV5
	gvY3sGid/qI+lpbEl8kJRnsMD2UIqlz4MVoMCXtDo6A==
X-Gm-Gg: ASbGncsbCiVpXZb5Pt4SyvKywvoQ8TShMYUyDs/PQLGMgfs+kQ4dbCV7a602kttMj+Q
	r5NgOI6bhQkQImse+/+3AIX+3d52UN9WjKWG2faklESZk+9W33zZJgLuBfEdcPwDMAMc4WEc6Nn
	XW32/0V1tWap4u3dVNxaKInqTPIJc+F+3XOkO/lN8iwOqZMdfcVtHGF5V0R3Gh9W74AW7F7jwnJ
	KT4a4E6jf7z9IHq30Elr8PhOVNte7vuKTvo3Zg=
X-Google-Smtp-Source: AGHT+IEKuRSYDRBEFcUoSaQJpuUMdlcesI/FHii7hOjk4oxM01a0EqmTFPiCYNu0z4GmlScnxLvw71vWU7C0gmCrYWM=
X-Received: by 2002:a05:651c:e0a:b0:333:faea:760e with SMTP id
 38308e7fff4ca-33650e28035mr29572141fa.4.1756126610386; Mon, 25 Aug 2025
 05:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 14:56:39 +0200
X-Gm-Features: Ac12FXyribtDrV6nGrkt8B-SxFaigB01Pq-K7rMjlp_S8j2j5Cn5-EuT5Gchlm4
Message-ID: <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] soc: fsl: qe: Change GPIO driver to a proper
 platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_055652_471736_8FBEE025 
X-CRM114-Status: GOOD (  18.57  )
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

On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In order to be able to add interrupts to the GPIOs, first change the
> QE GPIO driver to the proper platform driver in order to allow
> initialisation to be done in the right order, otherwise the GPIOs
> get added before the interrupts are registered.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi! I retracted my review tag under v1 because...

[snip]

> -       return 0;
> +       qe_gc =3D devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
> +       if (!qe_gc)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&qe_gc->lock);
> +
> +       mm_gc =3D &qe_gc->mm_gc;
> +       gc =3D &mm_gc->gc;
> +
> +       mm_gc->save_regs =3D qe_gpio_save_regs;
> +       gc->ngpio =3D QE_PIO_PINS;
> +       gc->direction_input =3D qe_gpio_dir_in;
> +       gc->direction_output =3D qe_gpio_dir_out;
> +       gc->get =3D qe_gpio_get;
> +       gc->set =3D qe_gpio_set;
> +       gc->set_multiple =3D qe_gpio_set_multiple;
> +
> +       return of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

... I believe this can be dropped now and replaced with
devm_gpiochip_add_data().

Bart

> +}
> +
> +static const struct of_device_id qe_gpio_match[] =3D {
> +       {
> +               .compatible =3D "fsl,mpc8323-qe-pario-bank",
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, qe_gpio_match);
> +
> +static struct platform_driver qe_gpio_driver =3D {
> +       .probe          =3D qe_gpio_probe,
> +       .driver         =3D {
> +               .name   =3D "qe-gpio",
> +               .of_match_table =3D qe_gpio_match,
> +       },
> +};
> +
> +static int __init qe_gpio_init(void)
> +{
> +       return platform_driver_register(&qe_gpio_driver);
>  }
> -arch_initcall(qe_add_gpiochips);
> +arch_initcall(qe_gpio_init);
> --
> 2.49.0
>

