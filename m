Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909B2EA7197
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 20:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YslpqwAUlqk2IVojGwVrggbXsHD7anRXPzWPJnX3NKw=; b=RYxGhxs746gjX0sMm71Ox+0M38
	0wlcFnNyO/Vk4P8SBW8Vq8kSEU41Wf1PySnkeENQTAE6VZnYhSS9UCTmo5k/vurkFKHDqfU2kp9g1
	6wMoCoUEdtgxDYXzjWYoaGegc6HtPzLD7PlHP559VxtJksY8sAS6bxe9uPDzW6xsKDf9RF2gx7FRD
	gs11viUjotiYOXAsuH3wRnmI61ga8PdfgFUYvYj7TZVki0n4k14/g8YattngkXnmN1TdqacYLf0ZE
	qRBumS5N6e3QUbGssM8BzZ8WXz/7hWQPhMqPGfe1Aw0jpn/vW7nkChP3VXU4Jxkav6/RxRsi6L46Y
	3SYRU6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEYfM-000000064B8-32hD;
	Sun, 19 Apr 2026 20:22:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEYfK-000000064Ax-33ta
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 20:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94D3860133
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 20:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D011C2BCC4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776630169;
	bh=9DkN4UJECtm0IFZQ7IDjwr8Jt5qlKg5Pn6HXQqREXsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vK7UZk2UyG2Jz0oLDq53e2PvG0I4WWUNVC6bjR2qL6aL7weGb9athuVfk8h6iuWuN
	 PlfKOmWibQC9V0CsrCZHZV4WG+ad0M7QNhe2LUmWpyQ29P6r+ZA0vilEMoVS+jWJKa
	 CRnQ71mwtMsj2NrqktCsYrJvLAlNWN07BUPBz9N2weCwd+OQOfy37E5x10MK/e8wvj
	 lM/4i+hPZGvMkUlcxJS+qbNmE1N2IMcv4WAc1/kSQGpg1XGB2bjdqbEZMD7zQUxd7W
	 qtk8MDSjqlz4Fu8TsgS7f/LGRILXDfFJGspor3W8Gik8mqLmjaYOd5ELljP98bfLnp
	 za95zo8EfUtiQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a283c44478so4016296e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 13:22:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/TQ/BPd4lWmJBwt/tDn8KbbP/YXjOUGI6tK94EQRjx34t1noCqZ8Ju0S7nYynioAs80oM/tUp4kDx7DD0bU+Dm@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+rVO+AarJ2KXNmhnNFPOKb5DyPzxyDLltBwRidMpp4PsV/6C
	khuO3ppOv3xe2Lo0cognCax5RRtTsVus1GNj71/aoGhvuqbLVHPP+qJhaRVHOsr4wZ5Y2wtMQON
	4hcnFC238E+SMTypQ1UnNkDY0HiZEy+Q=
X-Received: by 2002:a05:6512:3e05:b0:5a3:fcb2:c6aa with SMTP id
 2adb3069b0e04-5a4172bfee7mr3442408e87.13.1776630167775; Sun, 19 Apr 2026
 13:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260413154727.3051321-1-lgs201920130244@gmail.com>
In-Reply-To: <20260413154727.3051321-1-lgs201920130244@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:22:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnC5MGg1e_Suv6BD_=XKbsn1aLxHxRfCdD3Nos+2XRzfw@mail.gmail.com>
X-Gm-Features: AQROBzCDUCdqQVnjQAyYtn99zG1zFrnsiXSLX3a_nvy_WJ_NdEcr9JskY4IufVw
Message-ID: <CAD++jLnC5MGg1e_Suv6BD_=XKbsn1aLxHxRfCdD3Nos+2XRzfw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: ixp4xx: fix reference leak on
 platform_device_register() failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Imre Kaloz <kaloz@openwrt.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
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

Hi Guangshuo,

thanks for your patch!

On Mon, Apr 13, 2026 at 5:47=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:

> ixp4xx_timer_probe() directly returns the result of
> platform_device_register(&ixp4xx_watchdog_device). When registration
> fails, the embedded struct device in ixp4xx_watchdog_device has already
> been initialized by device_initialize(), but the failure path does not
> drop the device reference, leading to a reference leak.
(...)

> -       return platform_device_register(&ixp4xx_watchdog_device);
> +       ret =3D platform_device_register(&ixp4xx_watchdog_device);
> +       if (ret)
> +               platform_device_put(&ixp4xx_watchdog_device);

If the problem in the description is indeed there, it seems the bug
is inside platform_device_register(), surely a function returning an
error code is supposed to clean up any resources it takes before
returning an error. It seems wrong to try to fix this in all the
consumers.

Yours,
Linus Walleij

