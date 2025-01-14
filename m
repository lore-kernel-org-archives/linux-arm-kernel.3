Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5260C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=; b=ke/zGf3vkHHttriTM2xf23tMqd
	iRtj/rQQE/vtq3cId9RNfTK/alPMnHjHMIplY4X3HJ6eKoq32+RItZOu6WVHATO9H2sGwoj1BVIXC
	n1fwN8D6Mm42xfI5zgUDT56BkM77x2Z1rVUnf8xQjtWw5QNitecWzEJheCrERrfi0cYkUjdNyKLYW
	okZuDmmOJryBxXYs+zwkkwZ8xngi8HzeNV4B4wbyuat9DirrBRv4oVxwliCULj14aomK2G7W1Rrai
	K9fvnIlE8kJvEc+EaxmeTItBEj+h0344e0+zTLIczVK+wyimvzuME95HsFc47lxNraZdlYjjvQdkI
	VGHXGfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXi3x-00000008iKQ-0rqz;
	Tue, 14 Jan 2025 14:38:37 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXi2i-00000008i9p-01ol
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:37:21 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3003c82c95cso40840501fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736865438; x=1737470238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
        b=kzEnt67y8Pi8o9SK1PgFrrNZk4/W5uv3VoHzn24foP/NyjCl3qcg6nZaQP5Xss5w/Q
         wKvSXWAnjOlwR07ZCagmvHYOLUB21XBPgwtXJBKjdi9MRDIWFZgNqUjUmjoiVfEeDLaJ
         HjjFHEZChM275YqAft3AC/a86C/nAnz7OXraFq22zD/fTspI0Naa48PPUUKiZztsxhuk
         SAy/MA02Blu8duDaXaq+BdjIdMq2IlyMtRTj0NTFE1fwCNrGG7wPzXAa6mkJLG8r1Bqd
         1t3ysbVkGIUJhz/L+6GvIo1FuzE/ktMvCZFJ8CKR7vXKi6CkeVuFFo4tvZoGX9+1kjEK
         izww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736865438; x=1737470238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
        b=lOzHyvGENsQpI+vCMGVQoyFvvD5IOvRatxsvQataua4TJ6VV/dGvXBM30f5RUEwNj2
         eSNUEr9eZuHaUMCU4k+jRa9D9FO+6VNAuNnViEXFBWyGrSTFdT/MKm6m0fMVM45KR0Zc
         bPWC7y5K/xOaGyr+9Ao0DLCAdN4YfimWzsTfpjsKe2xZMHm1Y72cVvbJldl+md91x+WC
         70PYh35qDfs68Wp4nGZA3yhC0GTF8WQ4RHTFK+rFIUir3Skj65PbwjoYTnV9jWBW3jwk
         4wPhhBOpXglnaX/ii7/M08G838Yvt+1JN9SQPbjJx+ar+LuQTx+3UCY8hxGmSur8vJ5i
         7ZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw/u3m0PYA6Cqt6EmkOUaDemEtGUPsz5lYUIc6kIRLyg+afz/7YtU3UgTXw77MVUHbWI42yEv+aM+mlq2KUZF3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8GJV/6TIhtSNQhAv9icEvrBI3bjxP3n7yjoQUGDrqwm+JifjP
	phwcswwLWpgUc6wbAH/THq7G2f093miTL8cZ4GaIaq6Ve6dBRo/owF5n8dWgHBOh7tu6EIkU8oU
	6wqsDJ4unWQNFqE1zG8jgun46CItLOBAEaMeZHHUpCs5m/Q2I
X-Gm-Gg: ASbGnctwyeDrvMlJfmxcRFNUBSYc0LyW2cQsPncHfohEe3FAVEfz1fX8d3t7JBs6HXP
	IbPvbFaXFjv/dIjZR7+XlgqDnAySjErbRfFwS
X-Google-Smtp-Source: AGHT+IHXHhRBxekKjdM3gRgsDo8MxfQbmM2TrKqIHQrqSEmhLq5g1p0hvMa4d+Gj1XQaBUyrDoQ+cJNCESr9wOng/Qk=
X-Received: by 2002:a05:651c:544:b0:302:1d24:8d95 with SMTP id
 38308e7fff4ca-305f45f6484mr75556711fa.29.1736865438026; Tue, 14 Jan 2025
 06:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-2-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-2-0a28731a5cf6@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 15:37:07 +0100
X-Gm-Features: AbW1kvbhH5ngJuoPoguwTmNwlT9OfxN6ZoGKMuwu-HJLXJn6jxhr1EDmY9GG7Us
Message-ID: <CACRpkdZtxVSn9D-ro9mjYU=yv0FjE=BO=vPmObT=8=x9coCy5A@mail.gmail.com>
Subject: Re: [PATCH 2/4] checkpatch: warn about use of legacy_static_base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_063720_056434_85F7F741 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:

> gpio_chip::legacy_state_base was recently added as opt-out for
> existing drivers and shouldn't be used for new drivers. It's thus
> sensible to add a deprecation warning whenever it's used.
>
> This doesn't fit with the existing deprecated API check, because it
> requires a `(' to follow the symbol name, so a new member specific
> pattern is introduced instead.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks Ahmad, much appreciated!!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

