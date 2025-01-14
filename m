Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C8AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwP1tti+yLWvcbErin2Brt+AMboascV0NwMOTqURVnc=; b=GFzJnjirfXGAjtvM2xNweICJEV
	dUEycmUDwhG82feN4ZzoLnHsX5INkX+V0V+HQ6Y8K1b/SDIkcE82S0/cPxOcd+vsAfJy3gH5esK/F
	5bfO9jjyyvpLL6SRUSkYaz3rmgv7Tt4eoW7w+eYGgeGjljFlYQnBChwVA2ImT9M+9JFFjT5Zr8MbZ
	mgE9ejS8QHh9JwIwe4ZFjaSbwPgtonhZkcQyxp0/6Ivfy/toS/Pg3E5yp4+fma07FMwdAVisZnx4E
	JqWSywXr/Nr8Ry084UJNP06TMyfDuG3MnGgbeR5I5/ogyr8U+YzadAOJ56l0FarbsbZeRktAehnOY
	SgfwKW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdZj-00000007zY3-3s9t;
	Tue, 14 Jan 2025 09:51:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdYU-00000007zJS-2K2S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:49:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9e44654ae3so847843866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848189; x=1737452989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwP1tti+yLWvcbErin2Brt+AMboascV0NwMOTqURVnc=;
        b=Ct4p8cb+bBjPPu7NmMFnicDWwpYrttMxKYuaPcZn8s3ogpMlYDxZUGvhDcc84rj8lb
         Ol2J9y+SpmtpsNt+CBetTF/p9KMaYlLR8Tfx/g23VNVCYh7DTznWR85eldedifLKia8Q
         KyRcf1jHKgfocUS4+ozhqwB50SlNPWevz2neOsZtf48NkuYXp4GRmwefu4PnTW/sHKqT
         51dl3in5nLHXqwTl+2rjP9scQekv0TMcIWHGmLdW6y9BVDE8mlOORzUx3M/kwbXUCzFx
         q6TrG7y2GUmuiVIRtRP/EeTzej6akpzA+nGdqMNNloh9dIRPnLiwlhDEzioXBRUuvnOD
         0OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848189; x=1737452989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwP1tti+yLWvcbErin2Brt+AMboascV0NwMOTqURVnc=;
        b=DCw0CcK+AleKk8Kvlr5GLul8tur9Ftnbp64I69LCxJtk3PZcE3BuCbm02rnN/9t0Pz
         vyvWULb46Pi9OkLX5qS2BzBR03GTi2WRAPVQef/ZWyaMyHqGlPdRDYV8i1iu+iJW/VJu
         C3drEu1QE1+UHpzAKPD02urAPZxOPF1jmwPBmpPD1Dqztr3/cQo9TQMq4kCC8ICKmKJY
         AoVJtxtCSK+17AzSYVXNEtH8gvF3fqMEoAhpalwdniDtM/pxVWpjiIEH45RXhPBdXS45
         kXPGSjX4z1FwCV4pup7qh2cL3muStLklxR31WdypLKHsgQhiSDULSTY8UshjtzIRNJ1n
         kdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC8iUC/llU4n/sqoIkNAaJgYvvOeKXxC9fAKeU65uKxUMuUn0HnxCTdT4KOWwLAS5cboHsB5jZFAprsNgUlteu@lists.infradead.org
X-Gm-Message-State: AOJu0YzpOtJtmqz8vjZJ07+sZjCeeDbkeqZCah2pHoYF5wE7NcQx8xQ8
	LLVG1AGikT5trK/Nha1YNKSpzqhe2Squm8it4lyNNQSp4dC+QvlntIzdxoa6yuRIwMqXUMqLgzk
	fWO4TOCLf3aLR73zgLnr25ttcWws=
X-Gm-Gg: ASbGnctkKjfYOgyb5SI5j86DBI779G6dmMlhVJBu+TgUUD6t6nZCHk60qqcwKonwEQm
	TQ+Q6GdjMCrzoopDJlrGGCN4hCSoVyIssNJOO+g==
X-Google-Smtp-Source: AGHT+IHSE0X0c/RAV6RHPYce2+Lu6HtvF4f8pJXDO50RUlRMfR3JVOivMCp53pLKP3YuDBdiRYv5612VS1G8WhdmTEU=
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id
 a640c23a62f3a-ab2ab70aeccmr2153858366b.19.1736848188749; Tue, 14 Jan 2025
 01:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:49:12 +0200
X-Gm-Features: AbW1kvaXInedzCQDKle5HtOug-2PYAvJssuAdg06rMQek_Ee7DEA41pCoh3PZGI
Message-ID: <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_014950_593082_6B9A8216 
X-CRM114-Status: GOOD (  13.60  )
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

On Tue, Jan 14, 2025 at 12:20=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Some drivers have had deterministic GPIO numbering for most of
> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), more than
> 12 years ago.
>
> Reverting this to dynamically numbered will break existing setups in
> the worst manner possible: The build will succeed, the kernel will not
> print warnings, but users will find their devices essentially toggling
> GPIOs at random with the potential of permanent damage.
>
> As these concerns won't go away until the sysfs interface is removed,
> let's add a new struct gpio_chip::legacy_static_base member that can be
> used by existing drivers that have been grandfathered in to suppress
> the warning currently being printed:
>
>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>   use dynamic allocation.

Warning is harmless and still a good reminder for the stuff that needs
more love.
NAK.

--=20
With Best Regards,
Andy Shevchenko

