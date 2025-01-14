Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605D7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=; b=I8K30NmcXV7n+96aeFZPKwhJjp
	j0ndBM00/JaKkpe8aRrUwyN951zloHXuLcEQiy6xMVab15pnFcb04au5S1Ifgax0UKyIWfGicMpfQ
	LWx2+RfVL9E6I5PfdIodyXpRdaenJiRN70eqyGNbpwa0jgF5Zyu8qaOPXuZ9Aa6vg4/+7xXkg/41w
	+RngKYnRh3fKDE8G/q5d2vlciHmsKzK/3ke2ANjxl0zF4E3P90QoaSb9gVqdfvXn0vUFKqznz1rPL
	NkIHr041CXw7J/Q5aLnhMkpFZRM5FIUEWZk6Bv/FWRW6Uz7dz9Rn3OPDToRrM1Jrd1YuM/UEpVrms
	sKUq13Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdWy-00000007zA5-2npL;
	Tue, 14 Jan 2025 09:48:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdVj-00000007yzo-1UVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:47:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaee0b309adso865420466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848017; x=1737452817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
        b=Sh3XoPSZdjaMmpG0yZ52t1Xt8OV2bQ8/Iw0+1sVIz/6yH6caAYkYyEv6jS6XAk6aIY
         o/uStwYR8jInAF2bXEqbUAHpuIujyfGH/Cmh+e5Daf3qswYEXpRn/at+xSLgu7n1qsDK
         k0JUXMfrudmONwvXvTB+u9mAS+0AOxCMsUVQMefa6dhtWiMIPwOqjaAD/t2iqAhpqMRN
         g9HNaZThfJwUTY8Z31M10se/TJ520M8xbMzIQ9RECPhIZrcjWe4UfJEkK0n15kQAZGfj
         cZJiv/03rT7fFrS6e7w4UUV/H+f/uju+PsFs2bmoh1u4P6ZWCvRN3wToYju4BFnoKLx4
         tMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848017; x=1737452817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
        b=r3WSoSIJrEttDfghGnKAwg9vPv5QOitTzJpbo/qSwcEj9t5miIht2RzuWSbqKXjKAy
         +TsN72ugqW4cO2DGH6DtDKu6kpLIs6tXy7C4owoCHxQYS+Poin8HqUcxUrspbSUcbCFL
         wgG/sxDdwgsnh9Hx9oINxNu8780xmJPYByIwuDwutKaLC6jI7NHUUzRFcCrIciqHRsFr
         KYh+u8F2icjwldJo3abZhoTnWlZIMmS90CPUwg/1iuBaN45oleegQrn7CV00efGWNVjN
         zxmjHAxK1lMkMmM3Eyd0VlEoYUsb36Afnd/XuRvRoi3ztpSMp8xC+rO2Vtgc654yWskG
         NnkA==
X-Forwarded-Encrypted: i=1; AJvYcCXM3dtaOiquowdg2h0N04TeqgyTYyGb3uw3hOyttpOv88hoGz5onYStejpDWdAHxe65ca1JTxK4Br+MoIELYv4d@lists.infradead.org
X-Gm-Message-State: AOJu0YzsqMwtJZGNlZvZovJ6pcmoIiwvUUs/t2+pXcG/EzBYMgf8ogiy
	Q7nunGLtMT9/uALDfRHGsargy+ra0s7L1zLs8P/HFADvM1Mgo9dMjMdSewxnMFt/D3ygVDNWm/4
	8L8Y26nW/sa41zn1CTX0Cu6BGlGI=
X-Gm-Gg: ASbGncvrBNpB/7HEfTwH1m1mws/UUjPOMt1zTbUSMe5hhPABb3s3OxAJ5uj2XsTjmtc
	kIJXBXymsqVYribdawmbH+B3OqoGc44rQSWho8w==
X-Google-Smtp-Source: AGHT+IFB5/NOc1qfgm0NgEd7l8XNYPb3tMAQ0jaKenktvVwfRG8D82BYAhUkdvtS+fobYNTzvwEa9ghZFQ38VtjGxFE=
X-Received: by 2002:a17:907:97d6:b0:aa6:6c6b:15fd with SMTP id
 a640c23a62f3a-ab2ab6b52b8mr2244703066b.20.1736848017120; Tue, 14 Jan 2025
 01:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:46:21 +0200
X-Gm-Features: AbW1kvYvnNBxyhX_hjX1s4aWMd-PZURmFnQFTxH_PiHAl6Q2MCYnAuJKZPMjNzw
Message-ID: <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
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
X-CRM114-CacheID: sfid-20250114_014659_397413_DB65852A 
X-CRM114-Status: GOOD (  14.01  )
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

On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> for more than 12 years.
>
> Reverting this to dynamically numbered will break existing setups in the
> worst manner possible: The build will succeed, the kernel will not print
> warnings, but users will find their devices essentially toggling GPIOs
> at random with the potential of permanent damage. We thus want to keep
> the numbering as-is until the SysFS API is removed and script fail
> instead of toggling GPIOs dependent on probe order.

While I understand the issue this tends to get never fixed until the
entire support of iMX boards will be dropped. Personally I do not like
this series at all. Rather let's try to go the hard way and understand
what's going on to fix the current issues.

--=20
With Best Regards,
Andy Shevchenko

