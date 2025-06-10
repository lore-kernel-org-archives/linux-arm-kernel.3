Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F209C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=; b=D73zQZSxLgk09JVT9KuexMLChh
	X1Owjc7J2fglnHkWrISptIA1OSWL6LSDwtjq6AxNNRSRoCx2xv5nwfZrRUG9eoGHFFBcqTFvCAWPa
	ptR6Bf3ApbBxKD1GsQAyYc+VubqEWQBrMFf2OxUk6PN600w7jFbxETgAcqy0DVw4wa1h8lgu7W8ue
	wCjn2uWYMDcUDckFmovksVMTIhap7en2n/GlsIE/uUbVyhrxHAGjxpay2IeVdD56jCBwlGV9cl+TU
	ZBC23qxrh0ZGYigsgJPT6z84qjVO55JNtr4oK4r36DM0uyF5Bwl3PaIexQ5bZt4qWPEZ0bxXq+tUr
	uf1yH3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7ni-00000008J03-0gAQ;
	Tue, 10 Jun 2025 22:50:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6Ki-000000085sZ-2uye
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 21:16:55 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32a7256ba04so26853211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590195; x=1750194995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=eTm4qJu+M8u9TpwMBjgiz0tGV2Vt2ciX9LPQJRZSCLzxvKckQBCd7IWBwHKMwGrhf5
         ajKBera2bUThTzpJh23EhH+i2cINaQEFRPWR7U1vymQXshAhN7OsDxlFekp9bw8n8LK3
         Es5fv1gMezfc+IrFNn1FVK2+vpoTX+rmXUxHn4TEr6ot1GEe/f6muKyJq8TczWcjeZ7K
         WU7qJOU72DbNJRgYGlAZXYz7bMNLoAl6fvyiIYL3H+xvNr13YZ84TLS4GqoPw2XyiWFs
         96YNYiIl3tfg9YdJw/0nC38vBr7SiZ/EZJsQpoKn4hSrsD60agveS/ULN8LQBGUFn4Fy
         ORcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590195; x=1750194995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=NG5575gw5KeShtZ7I1NOUViY+xr3Gam7HlTEMo4S9md7HgA3Q8zQUkhNrKZ6gJcmZx
         imsWyN/zsnI9GDMekrgRiaybAYEZ1rT4zR4VXUBjsJpU4+oEiTsic93GEKCTrVchypRs
         Gp7Cn7AGJBl2QKDtH4V5pJo07bbqLx2W2Xw9RDEMQcD8WFyJTdlen9pF9E5v5zTyMfRa
         Lbq2c69GEZI/uXQscach2K5rJwAcoJbVqMSx00AWFacbOWLIhnsAjkHmdyZfpnU8OCZa
         QJaYg3PhEq7zEGUE7Fd6HNeGsYvgDLxSkeP0uPDrC39p3otK2RnA50P7NrmtXgypMm59
         tLww==
X-Forwarded-Encrypted: i=1; AJvYcCVqmPxlHQ4WqXUKd1f3WoQpCbOOBUX0M+2eM/i6IyoNx6XKuqLnd6pHznYM1C4eh5nI4fTqnMQ4GkwRKvJVaoiL@lists.infradead.org
X-Gm-Message-State: AOJu0YxLIsWFeuNH5NEKpXyHjY2ndieEn+2Il5jc/nI0VrjK+oEr8/rJ
	0zCMvT5BGNenfkjnewFaH173sxNmbgfZWuRnvwggYjUgqncXtzgsUp4iUOgD7u+2I19hyv0AX5I
	HvZA9omPlYAc7OswKQrgGyN4y1phKs2nQf7cs6d+ALA==
X-Gm-Gg: ASbGncvcMWHfU7K+iwQpQGqcv2tCrzy1/CuELmoKnILs0FPFOo5IlVBhCQdSJ3Ffny4
	tNZ5TrY7pZQC5NwR2pV0V5bxoKZvh6eeGRd+M/Agz5rjowFFdUuKnpMGYYNMqj5H+EQnkvSuqVK
	c+tzEGzMnh4+dWd3iwNmV1SPEp8pyixnhrBz+n11K2TOQ=
X-Google-Smtp-Source: AGHT+IFjB38ga64es1q/x9Xln0eJ4c1gLnvGRBRN0i0PTR13a813fBLuiycDGURGtRbChXkECB+ZBVHqj34ThqQMqbk=
X-Received: by 2002:a05:651c:1a0a:b0:32a:6aa0:217c with SMTP id
 38308e7fff4ca-32b21e99d3bmr1744231fa.34.1749590194721; Tue, 10 Jun 2025
 14:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 23:16:23 +0200
X-Gm-Features: AX0GCFuXsSEbKJPPrZYl0t_vGXohg5ZS4zY2cQAKwzq1fVBy4N3FSGLwpMM1OkY
Message-ID: <CACRpkdYrnmi2a8iL0tA7zNDfhMRN3F-NEfTntxXgC54t-LZA4w@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_141636_736634_3FB17B3E 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

