Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241E2D6EBF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQPy6i3/EG7SgAsDgJ7tcQgjkT4hHUsubysFlz1hhtw=; b=QPvIIFho0IWPEcBxTqXA6q34dG
	+IrNkXj+whJlIOftLzFBm/XGnMTTRvpFrhoWjC5kCBcu8r712Dyzj7yYhTw9eFjY+YXld2P0UI9eW
	7EBUihL6jDdUHpzBrWEP/o7E1ViYsAkkiE1igLfCxrLZ4z5tmo/cnV2pyroS2/w6NwrNn+MPJ32md
	8odM6xqKN46XGoXSavpjZhvsTALF+xCMd6N/yzGhqk8nd1fdWlzLg2ZdBNQzehmjiCdfdwKUqTkNb
	BXEm1p7GyJyGBJ0On8ptJbejWm9vEkJ7OBKl7m8NAFBKf6++2oUPEfnnBd3H0qEzxsJMZERwpIBCP
	TlzHCNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGy3D-0000000HPeA-3fUQ;
	Fri, 29 Nov 2024 10:16:39 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGy2E-0000000HPYX-0dBM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 10:15:40 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53df6322ea7so2974384e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 02:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732875336; x=1733480136; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQPy6i3/EG7SgAsDgJ7tcQgjkT4hHUsubysFlz1hhtw=;
        b=TeHGym2zqlbS9RyedEtoaaItHq19PRNUbhcFSE1tSp38+beFW7QsSBlJ/nC2xzBTB0
         +7ykaqnmaZTVwRv0OL9nwxC7RHj2YUq91Cr+i6cSCyXhzV8o1XFjuq6vSo9ajIZrOIL6
         Xh39dadbzFr7Q5gWGJjWGceWxAGLKB2OCRYJchwIBbleqFTxYikPhJaMxt5cf7DxRxL3
         91A5SII3Bi/xEpaKq3Z+xQEbajd/DyqgmzvSoGfFN7cVk4n0eOxNQ5WY+v8oXaRfrePg
         bJn6ru5EmJkwsxO5gkFDwLS6LW0RLpst+I4bWtAYDl8hXVT9T55Az2ux1Ix8o82hCjmj
         mBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732875336; x=1733480136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQPy6i3/EG7SgAsDgJ7tcQgjkT4hHUsubysFlz1hhtw=;
        b=vWfUYCUbQt5TyTWr67GKxGwsxlxS41akPLBHIojJWBMo4515+lz7ptX7ZHBx5tMt2q
         1EIgY7luNjjlQbdqJEwsPKSjYbQGXblpgExsA2yMhEGQ9YOvNeJR6spe4aWZRTLcfPsd
         9oXAXhZi3sIFsJyfqy6B9DYKurGJK+ZVNN1gq4mXVBh4Z43FxMPg8/EH7BQiMzTNB41a
         Iy/G27v70HQ4zH7/3dg5BduBcunEmyguioFSkApdq1f+jP8y+bjvklMsP4c4kNCEkuEX
         BzT5ZL9ALmYSBpz9smf6NT7akc4ap+N0qY9J7/w55jYb2HYf7ELcxlIKPqlLZjM55oIU
         k5iw==
X-Forwarded-Encrypted: i=1; AJvYcCWksY8xdeJFUDr5plKBH7n/5zW/5TvUoIS4+TT++jfmnqjjDyLvgNQQTPWguxGIZEp+5yE4DHeStlStCQcvkjH9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs0tWvzfrpL9ZvPnN7Yv8ON0IzOkC5PTxO0OY2+Ur49EsMBN0h
	rLHvcu4TEwLQFEe6QtahZBFhLLsP6ZZ9wq9Ur8JPddfRllb+fyNOiJmW+0CRASEYori16jTvnfV
	ftu1+0HUVFozsrmO4ZyE0MAGXFHT1PpkC6GQoBg==
X-Gm-Gg: ASbGncscsbMl8dYTM/Pd6yF4GYIG77yP6fIw9hQT9M5dq4FRmaFxhR/dDsx2Gr798kJ
	++vY4knwf3SGSchUKamuYrjpzNquF9CE=
X-Google-Smtp-Source: AGHT+IFwxzHGLoQ35MKeSNR2cgIfiurNhDiRo3KErOd32grmbH0flzyugkwmEZz4WwTuMZ23JOnl8sVitNb7SKahsFU=
X-Received: by 2002:ac2:4e08:0:b0:53d:e077:decd with SMTP id
 2adb3069b0e04-53df010b258mr9365909e87.46.1732875335602; Fri, 29 Nov 2024
 02:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Nov 2024 11:15:24 +0100
Message-ID: <CACRpkdbJgrwzh_D5=71dMPOx3jgbyUJOiP-+16JUdL79zDEbTA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, 
	esben@geanix.com, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux@roeck-us.net, arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_021539_022449_973199E1 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed, Nov 27, 2024 at 8:06=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.

Fabio are you pushing this in through the SoC tree as it's ARM-only
or am I expected to push it through pin control?

I expected SoC but asking because I don't want it to end up in limbo.

Yours,
Linus Walleij

