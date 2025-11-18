Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5A6CED617
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPUPwbDm14BN9pVkqto4Vz7utDChnT1k87mVo/hojfE=; b=Vo88368jKLKvk/S9D16wyeLaMf
	0t+UcxgCFvyqxqE0bRQC/NDk2NVMAX0gOeB3pVcpISObpIN5fHGgZMlXAAcAvo6G/WSPmh/5QHCcF
	jkdqJTtoTjF/PDWN2nZDAO8/V9upAZhgv573A/0I83sCuxPvNxi7KH3kye0QvTgpB2QqLeCxlXpOk
	YI8RTwERNh+N8OO0WAV7B8wl2S7LxjsZ7i8Jf1HQbVRlE/ovZHQtzWcU+IRCDomNKpIx2Xo9zun+t
	Lz+EkDlpWELVn9UB0xZNY08ZF2Q3CIYXlNLawl3trXGwVUJuv7RgOosI9C2qjGDrNLklVDZUam0Zi
	+cZlF4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKUN-00000000Njj-19Qq;
	Tue, 18 Nov 2025 12:07:16 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKUK-00000000Nil-2iUY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:07:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b7277324054so749740466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763467631; x=1764072431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPUPwbDm14BN9pVkqto4Vz7utDChnT1k87mVo/hojfE=;
        b=JrujEmbr1NvVMQwfiO3aCkQ/ch7WdmYCj/VIrB1F6jpDP/HeRfRtvINiutwkHI1Cxg
         yfvCDTDq8NthgBDVupHe1ah7YMjJgwZBfRLrgVx6pfSVgo//C6aee9uKsVPMPMsGyQMu
         QiaGTTYBVk6dlcmOnOVVgl6BXFIH6I2dtlq2/Up231oI2O1y504McZLiqEhQWkmSFTpf
         PvlyjvAgWKEs0zlQM2Lj26kZd9xVBW/J1K3X4nOCfKwNIvkun7+xUUp7KxjplDIRY5y7
         wniYgvYkK77k1g1g9pW591ujzhp3zLll2AsIbYV5CCFvC9XVt3mscK6WCf1kuWMn2pef
         DMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763467631; x=1764072431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPUPwbDm14BN9pVkqto4Vz7utDChnT1k87mVo/hojfE=;
        b=GIcvSD1NRvP9yL5kixg6U+cqskjaQ2vLEa1md7wnVRT+fI3/M476ZsJ584YvXOka9v
         dnim7oKanh1lPgs61+rCzbBB5FAKR+8EuuJlL2GAYB3z7pnyIMFnEsrDULxxkm5SfgOn
         3FahsR11GgTyN90wlDTl6dPKYggGPNE4Ts5017+CckebzF1e2ruxFO+G8NB/qSlpjf+C
         JEF6ZXVKT0NGwcuQKWjK7diSLZnRC82OdH5U+sqGspgDZuV4WtInWabZ54FmovNyQDZY
         Da7xE7KdueaHvn36F2YgT0EfpZgQloX0WVONYg57KhKYIDAEMLbVRI3SCOXdcJH2MEv0
         ilag==
X-Forwarded-Encrypted: i=1; AJvYcCXPsIUTxxdZnoM9532NojGyio9Av6xe5zLVoi9x7DI5kuUKQvd6YoFi2VYLXZKKnoKo5JDpnhrBI8Dj1EtG5MYW@lists.infradead.org
X-Gm-Message-State: AOJu0YyoViNjoPGLhweXhzRqP22+kDnMSa1kLVOtiRH7JkOY6w0Vjoy2
	JWBr7VDXYS2hCWIUL0vOWHb43NveyWHQV/aIW3RLDtMr1O6p5Sngb36Z0W9t0R2XpQwpflWPaTl
	V/v15XHKeTXSVDVKJcsCudsC7Zb2nZhs=
X-Gm-Gg: ASbGncuHwliIh/dx08XSHhTqxmjU6U0HtzamFiLXVXKh7K6Ga6xblyAAJlvA8yEC/EG
	ldLlsYiTZ61PqXwShd5ZCM/XIK6fN86WuFLfHofXM73nocSWBAkd/0hKHJ3liS9FbPFY24yhdjb
	OdlMnSj6+TiM/sgdU7qo2O2GD2sOah0mhA0HScdOipHysq4oW0lAn8mibFIe7FyeQvY6RJSvrg4
	kYrEBizGT2olkyahKbREM1BopwvArRYPEy5EdjVOJ2WuD8rkp7cd7Cg4PUlliXWL+CvvUtBOKzV
	BuZ44k+wjHEh+GBILFP9uyAVZTYuobAxXtOyIJ4TIcBN6RKvywtWfytBIqWtL5rOLwLzptOUdVO
	+UeRybw==
X-Google-Smtp-Source: AGHT+IFy67x9V6cH2hLqaJFod32QM89W3J9APhleRbLJkEvfU8oukE776A3bhfCtC5MGo4gC9KLgMlhG45du7MmtybA=
X-Received: by 2002:a17:907:7e8c:b0:b73:8e7d:4f87 with SMTP id
 a640c23a62f3a-b738e7d5088mr905707766b.45.1763467630576; Tue, 18 Nov 2025
 04:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-6-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 14:06:34 +0200
X-Gm-Features: AWmQ_bleoiALlFg3xQPLT0jXfJmB6ug8AfTDr-vB_7secp2PIEnh_6lO4x7Rkb8
Message-ID: <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_040712_704296_B7BDB3B0 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

>         unsigned long   irq_mask;
>         unsigned long   irq_edge_rise;
>         unsigned long   irq_edge_fall;

> -

Stray blank line removal.

> -#ifdef CONFIG_PM
>         unsigned long   saved_gplr;
>         unsigned long   saved_gpdr;
>         unsigned long   saved_grer;
>         unsigned long   saved_gfer;
> -#endif

Otherwise, LGTM.

--=20
With Best Regards,
Andy Shevchenko

