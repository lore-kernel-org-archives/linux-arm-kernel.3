Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A04CFD63E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiZmICtjiihMrOUOI4r4hzESsVzAjpUbdk8bNNC/LAU=; b=XXtCTJ30fhCyMIF8R6UHthwZdJ
	WHApYsNuJ1i2S1BAPdr/JcbReNxqEQLTt1DMqQ9T1ky/gCdJlauD+tTa2piHKldZv0RAYLiOKfrW0
	WGT9s+gX54V861bWWlJ+ktiBvWfHvuV2zXPRp/jMoczQUAyz15Zen2dEmaSaqGXdMlDQuUvQF96/T
	f2bopkwbmzFZzYZkAf+ZE9P2B7ApvofWyBu7EkfsxzAam0LD9wRZQDPRQdMcf7ACwPX3uBKtCcRYB
	b6Oq6IMjlF1fF32rUbGfDnXEi1N/tR6zy5ItVmLPdleL0Z4pqv2Xjtz9I9voqCuXUZUPEtdXEuCVH
	RLzJJU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdURC-0000000F5A2-1po5;
	Wed, 07 Jan 2026 14:23:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdURA-0000000F59e-0lo1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE47D43EC8
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 14:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE20C19422
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795779;
	bh=AiZmICtjiihMrOUOI4r4hzESsVzAjpUbdk8bNNC/LAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bSN4QXhf5ZB3OgyaDaQJl4Z3yWfEIqQ+5DggOZFgBfnmQGb1TtTMDo60UfnAmioH9
	 xeCAMW6t5uRK/nAUlGO+OGYmHIOy4Cv0ZPQCI6MG0n4UprKV0nRzBGiyzoLj2dnwjt
	 OitxK8M9gSMiynP0e0iklPSnCmWEKyyiOZ91/OQSYLM9HV5GVpGuySi0kFk/eo6wht
	 YKIJs8ck2M3LRW3dzxIJ3fXqYTq0pPpPXHgjvTb6NFxio//t9O9A44pxhLpNcdsK1B
	 yRBI/irZQ4Q6LpqWTpqWzS7Sc6E2yEzB0aXVoDYD2R7LY9nzPtr9zWZLtSmgIxCF0U
	 hajKrfxR6LHgw==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fd6189c88so26624067b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:22:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIoZiVErWYghN6DfXRCigRetlMUYvrmbEjuOSORsDB0y5ycKz8JnMm0PuQN6DgwGaWlFun2t5DNI52q70LY68u@lists.infradead.org
X-Gm-Message-State: AOJu0Yx92SUl76noSNBwPBo4bAm4eECFDk/vPJd0/JgwjYKtZSTkblyp
	nFfqb2VOZjKi8D366JR5pUn9FRyTxnkX2mG3UrTuj3PB95kHbVAaSueXySa9+mIbu1565O4lY49
	dGcWxbokMgmtIy0fjjfJdQhOUf5TN068=
X-Google-Smtp-Source: AGHT+IHCipfXMssxG4xTli26hFbEQ8q7gEC83UFwO/CMNHBXDuYmrQ8xb0y7nL4VgL6p3CmeKxBpEZSZSOq0TepOOyo=
X-Received: by 2002:a05:690e:b87:b0:644:45a9:c0d0 with SMTP id
 956f58d0204a3-64716b35f17mr2044997d50.2.1767795779097; Wed, 07 Jan 2026
 06:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20260105095956.19615-1-nicolas.ferre@microchip.com>
In-Reply-To: <20260105095956.19615-1-nicolas.ferre@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:22:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLnXYh+kBumTo8pjQWQyxUs2p+9V+EYhS8X0EG8fuBbq-g@mail.gmail.com>
X-Gm-Features: AQt7F2pu33uByNbNu__Wc6oIa91TQ5TXX2lidmXsMkS5x5BSX-XEjSbTod4CtWo
Message-ID: <CAD++jLnXYh+kBumTo8pjQWQyxUs2p+9V+EYhS8X0EG8fuBbq-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91-pio4: Add sama7d65 pio4 support
To: nicolas.ferre@microchip.com
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, 
	Ryan Wanner <Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_062300_244513_9A70E112 
X-CRM114-Status: GOOD (  10.32  )
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

On Mon, Jan 5, 2026 at 11:00=E2=80=AFAM <nicolas.ferre@microchip.com> wrote=
:

> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>
> Add sama7d65 compatibility string.
>
> Sama7d65 does not have a full last bank of PIO lines similar to the
> Sama7g54 SoC. Sama7d65 only has 14 lines on the last PIO bank not the
> full 32; adjusting the SoC attributes accordingly.
>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Patch applied for Linux v7.0!

Yours,
Linus Walleij

