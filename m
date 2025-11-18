Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43355CF2562
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJz8nG5sN3FDh1IyOGPvk5xFa+/J/sOHL6LWJMvknes=; b=pSI1xKnA2cDY95HH7+5ilZngYY
	6qDAZNaiiK9gYhhgP+Vq93JFaxYk4ecEnB8tFMBeC4jRXjtSOU18LWP23WgpK1co8iHVgap9xQ/d5
	8Ge1v52DoFiJsyTLASu3EdloelXLKDvIWUPSy0xvmyVQjJ2dCRop5gr2agQM+vM20qo5rHV350bAa
	WTfdTy7mazkJnixlX+0fHT7IYnrx6F9frh/hgB0iVhSbFjKGfmEwYdJrP8XpoO4ipYBI1IaDEb5O3
	VTJANgktCvhbpy9se7yxS+ht/hnQ9iXh67V640U6YpS8p9n9ExoB4iGzHzlzBZb2//AFIEUZb21xs
	ubIi3NKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUdP-00000001CnD-0bMh;
	Tue, 18 Nov 2025 22:57:15 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUdM-00000001Cmm-2vG1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:57:13 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-37a33f49018so50818361fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 14:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506630; x=1764111430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJz8nG5sN3FDh1IyOGPvk5xFa+/J/sOHL6LWJMvknes=;
        b=uuCeq8JG96Nu+egudLe3xi1BhzKbvcyDFa+uQeBxYPSPIEL8mrmVHrN68LjsO/AxXQ
         gqmHQ9w1v9iBxnU7u2Yl5VO5pEYnmlfTPBIqc2KjK9xR9NthJARzQiM8D8BniFkz5nyd
         0x1SBfncC5VOpGIm+DlzcioLDmtA1wKMnUVA/8Ntj7cWj1E+m+kNUER9kV1o2fYnnFfz
         DbIr/zV+CmNPs0G/9Mge/L3q8MeE3rVb5YIB07/yS1RetXs7JEcsG/KxdZUr2kjUHYIm
         EMmjd/bpPwpKt40rJ4JqSn3dj827tsRHZwd+7rVQCdHlIslFllmEDYDK+1M5WB8yuUk5
         0AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506630; x=1764111430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJz8nG5sN3FDh1IyOGPvk5xFa+/J/sOHL6LWJMvknes=;
        b=UDjf7le2p/j6HfqA0pM1l4SOa5l2ZzE+KX9DunA3ixWpHR4+UZTlotOc5adL17hLe2
         i8b+xLsDZRl3HWj0aTVAeAPOAZVTQdMTyE/cdCF3XtXG7aHSt0r6KdnVa4gfyKBR5KbD
         XGPwPoN/Hb6Lj4PmsDD6ONSg4x7b8TXFsoHGKbrwyw1jVNpCvp9iWH8HlpHfLA2aCJyk
         sRtXxqMOeBXddHWqjrmYRwsEJgxYG+dZyUr3F5BMTOqFR//Y9cHKS/8HMEK3ANCPDK3m
         btDa1SlWSv15MQg6bqFOoOwQR5Nmzercznx/xGHvBbJzE+UCZSQVDusloP7fgXRqL0YX
         Fqtw==
X-Forwarded-Encrypted: i=1; AJvYcCXYFHPkXDzbWO8unqazh13yvmNF+Lt49POp3uNmhACtKwQnT+nteEeMFscfkpNyTzyibYm4SVy3Szdi7EJIXvob@lists.infradead.org
X-Gm-Message-State: AOJu0YyI1xH+oG5r+8WXs/ZFdxLfaDcZZMBbKXW27tW7GVXFilTYDElj
	mlJmj6Nkk6bc4eXvyYy8RNdl+BQqtMxtja15EErDVybW2EHh7ZM4drfGpnFiwAzxeuNlW7fBOfO
	4fPxx+pwk8jxsmHEKeocOVaIZCV75DMKNAMw4ywyE2g==
X-Gm-Gg: ASbGncszdYBa7j+QS8Mdwz0xruipa/fbAssoBR+0bJ4tT2UWULZfWqxdZ8tEnm0LyhS
	J7Tss7nyaMmqZVJ1oNn4pCjMrqJ/6lKiUCei26Zn6lHkR5DdUBuJvoUlXBEYti5RfhpDBJHeS74
	YGOgtcb0tnD0IuszCx3CaLpdpqJIXJYolw2sw37vKDFhzexcK8zbnV9FPAjN7vqaUsTGqfcsWuP
	qTykuwt9ISjPqoU0/OHySgplIbnVDYNkT8AD+/8kcYbrd8PV/8xX2q+ja0JNGX7MrJBX7CzR9SM
	FNjlAw==
X-Google-Smtp-Source: AGHT+IHwZcAFMZS1bHsxU68eV9rOlrn8WFmX9PzE9NTh+PzIlvHiN2PvE8KkV7wfG/e63Wzo3GxckDVJu03pQm+3a6o=
X-Received: by 2002:a05:6512:3a86:b0:594:74f9:3b3 with SMTP id
 2adb3069b0e04-595841f97abmr5327733e87.29.1763506629914; Tue, 18 Nov 2025
 14:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
In-Reply-To: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 23:56:58 +0100
X-Gm-Features: AWmQ_bnwhWkIocYT7e_LII6hlp7UoALS4YCTtfLZFvQ5s57acnTyw4Y1jo6l42k
Message-ID: <CACRpkdYfNyAGdFpq=92UKBkScHq6U58N6XtwjJOJ3HAbBvFaNg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: s32cc: fix uninitialized memory issues
To: Jared Kangas <jkangas@redhat.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_145712_777673_00590B3C 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, Nov 11, 2025 at 10:55=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:

> This is a small series that fixes some uninitialized memory issues in
> pinctrl-s32cc. As an example of how these can affect the kernel, when
> probing i2c-imx, a memory allocation may fail because of the
> uninitialized memory giving a junk allocation size, which prevents chips
> on one of the I2C buses from being detected:
>
>         # i2cdetect -l
>         i2c-1   i2c             401ec000.i2c                            I=
2C adapter
>         i2c-2   i2c             402dc000.i2c                            I=
2C adapter
>         i2c-0   i2c             401e4000.i2c                            I=
2C adapter
>         # i2cdetect -y 0
>              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>         00:          -- -- -- -- -- -- -- -- -- -- -- -- --
>         10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         70: -- -- -- -- -- -- -- --
>
> Compared to when no failure occurs:
>
>         # i2cdetect -l
>         i2c-1   i2c             401ec000.i2c                            I=
2C adapter
>         i2c-2   i2c             402dc000.i2c                            I=
2C adapter
>         i2c-0   i2c             401e4000.i2c                            I=
2C adapter
>         # i2cdetect -y 0
>              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>         00:          -- -- -- -- -- -- -- -- -- -- -- -- --
>         10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         20: -- -- UU -- -- -- -- -- -- -- -- -- -- -- -- --
>         30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         40: -- -- -- -- -- -- -- -- 48 -- -- -- -- -- -- --
>         50: -- 51 -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         70: -- -- -- -- -- -- -- --
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---
> Jared Kangas (2):
>       pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
>       pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()

Patches applied for fixes!

Nice attention to detail here.

Yours,
Linus Walleij

