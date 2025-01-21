Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B2DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sniiGLBlwlwVQE72YbXn9tSIJ0uzVlORMQYMI+fWlc8=; b=DNaGWa7v0hn/Fr9ZEHjUnUefaj
	qZybfoU63/cnnz3fheT5nxBnziw5m4x+ObK7ty/mwvyedIHumjZomFOmkgbqdYPgKXGLlHHIsPZ89
	Ff8GeBXAV6QWVgpXH7jXb3fCV1Hz7xoVOt60L1ydzMaCapgCc1hLdaGtu0bjtOEKnyxJjc87nRR6I
	daS9ecdFfB5e+UBYR1fgb3EfJb/Yj3mvXzXYHXVrPQUpqrquTwqPW4VG59uROW85NPgBDGuOGQvRl
	lbbXiXBvLfY8YUxvvxq8WQAFekF0ptC5kY+64Amft9g7cDprG9m3jxJHsWEnlWuhuh/0vC2BT39H5
	OUQR8d7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFhr-0000000893Z-3XFu;
	Tue, 21 Jan 2025 14:58:19 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFc7-0000000889y-333b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:52:25 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e46c6547266so8204229276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737471143; x=1738075943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sniiGLBlwlwVQE72YbXn9tSIJ0uzVlORMQYMI+fWlc8=;
        b=kL9vEWG8NfRd3DurIl+G6R3d1v3Flumi4kzXhFzYCVB4UaKd3RGJC34j/PStR4XIPI
         sp32VyTQv1nPQbORG4do8njt4Cj8WzaHmm05Ckc/4WXOak2uQ2ICmLZysabT9/0erT1u
         2K9/g68cmOdAaC1tfxdrkgjDZGzxklxjLNEsOXlYS5sGgDyFo0yQQPRPGOF8w78NlbKN
         2kriQWOJ1LiwPc6M1qm20P73zxyF9svrDVhaWDPj77+cOEUEmuLHUnRB47iKc7peC6X0
         4SyAJJiRzdb1JRr9i/FLqJx8xRq4DT2GZH789pxxn1oz3ozVbgjD/5/hA/Wc+ADjgZBu
         0FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737471143; x=1738075943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sniiGLBlwlwVQE72YbXn9tSIJ0uzVlORMQYMI+fWlc8=;
        b=cdjE8w6/1BWDD5ZjY1NhFVR3GH/Ep7E+xKYepYjJR6bq5KLuIInxh/fx942Me07tFt
         /HICwDvRi9UYGOgfyhfIpaLwjXuYejRDHlXwqeJQNAP+43K0dggJXz7oLiC7n0iqF/jp
         xb+uBqTpIWfgP4u7IXnRm5FEmFA4t1kGfZrM7JyZJbDsOKUX8hgR89EP5YIjmLaqxQQW
         rCkQ/3LNmoCfXxq/BQiXm2JK7E7a1rPatoPz2X7OV3agzc1GJOsi4DlY2W5qTqGe/vW3
         JOfPR2W94CzET18PLGSDYD0CgPNuAnVdFWS7oz4ZpW0cds+zRJ67UiYeE+FFPcUR1W7E
         Qv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuPJJyz9zbKi1l6y/nu7GEyHURo4hquOBXeVl45m2D3DNRygbg5qPgBfm3Kz3oLBtHd/KtmuLU4znEWzp5w5zL@lists.infradead.org
X-Gm-Message-State: AOJu0YzzBNTgLChXBibrNYzs4JmUgFaRnuLVdTKVVX47OEPhK5xzrtqz
	588fZ2CqDzX4UQ7AAVe6JGhYCubdswVJsrwtP+lRN0v2zlNS8AZdYDQzLMSYJ4yIz3oqX6nI9nX
	406H5AS/6a94+yWfRSuNTcsJSG/aE4VYpOnNqwA==
X-Gm-Gg: ASbGnct6kuZKIt7UIsOpR2w5vtjM/f8awayzQbGXr9MmpoWzVuMgWFeHUIF3Q4dKNgP
	NmUqI3MHKtKT0EXdMMWfAAqK13Tu+H+nNPKZtce8MD6Y2lSk6jXGhOMIJUHYFFNrI9A==
X-Google-Smtp-Source: AGHT+IHAR8Oh5IZMK/EFhUxy82Sms5gJQlwLhipbAW1ZqvwX6pE5x6pYuPH97QTlNrx+1G0xVn/kn1tGS1MQfWri5Fo=
X-Received: by 2002:a05:690c:690d:b0:6ef:5119:6f39 with SMTP id
 00721157ae682-6f6eb90d631mr163457467b3.30.1737471142696; Tue, 21 Jan 2025
 06:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
 <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com> <Z4-s9UHBJZx9APeE@shell.armlinux.org.uk>
In-Reply-To: <Z4-s9UHBJZx9APeE@shell.armlinux.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 16:52:11 +0200
X-Gm-Features: AbW1kvYT3J50S3fCbdFz3TPsLp6pmDCYH3eh_cCAu0j-x_otJ6Yo49o0bUKeGAI
Message-ID: <CAA8EJprB9tBoqUaZKnGrJQVPpRA86ynB6k42dOCW7HG-VTfhbA@mail.gmail.com>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_065223_766353_2365780D 
X-CRM114-Status: GOOD (  22.05  )
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

On Tue, 21 Jan 2025 at 16:19, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Jan 21, 2025 at 03:12:13PM +0100, Geert Uytterhoeven wrote:
> > Hi Dmitry,
> >
> > Thanks for your patch!
> >
> > On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > Fix C&P error left unnoticed during the reviews. The FORMAT field spa=
ns
> > > over bits 29-31, not 24-27 of the CTR register.
> >
> > Please add
> >
> >     This causes a warning on e.g. Cortex-A8 and Cortex-A9:
> >
> >         WARNING: CPU: 0 PID: 0 at arch/arm/kernel/cacheinfo.c:43
> > cache_line_size+0x84/0x94
> >
> > so people find this patch when looking up the warning.
> >
> > > Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> > > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5=
-764d9ee79ed6@samsung.com/
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > This fixes the warning on Cortex-A8/A9, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Note that this changes HWalign on Cortex-A9 (various Renesas SoCs,
> > with 1, 2, or 4 CPU cores):
> >
> >     -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=
=3D1
> >     +SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=
=3D1
> >
> > On Cortex-A8 (BeagleBone Black, i.e. AM335x), it changes HWalign,
> > and causes a warning message:
> >
> >     -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=
=3D1
> >     +SLUB: HWalign=3D16, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=
=3D1
> >      ...
> >     +cacheinfo: Unable to detect cache hierarchy for CPU 0
> >
>
> Also, has this been tested on CPUs that don't implement the cache type
> register?

It returns -EOPNOTSUPP for anything <=3D v7 (or those v7-but-really-v6).
And those CPUs are required to implement the register.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--=20
With best wishes
Dmitry

