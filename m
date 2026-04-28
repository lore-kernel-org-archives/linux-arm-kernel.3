Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D68FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHhfWXmBi9f2pbmB6rekkaOm/gySHmHH52D/IQ4QzJk=; b=38vnhvpGkEbxtF1fvDQWPwr1sn
	AJWLRdtT3aNQ/FPPe4N3BKUguGKo0ykfBaRgNS7YbUNweSbODAJA23EfzBMZP9lecjKlU2IidcwfF
	xq+Z3Lz3HgpwvVP9RmRSV5oY/FqbtCWXyGC10P+3HsvH27oZza8KlzmnavhZ0M2JwWvOEKAo5GnX/
	l/y21tvLudTjfvIrGj6S+BiBwaH4UnYZNW4Xro1LlOrfdgKGwFIIMhUjtGipQ8s2165FTq9NjRBKO
	9S/qjjcdMgfd4i6LexjNR4CWT3bqSN9X8NiCG3xrwWfYlWfPNUqPU5iE3NDpviNg/tUMqGfE5SzWP
	CCQEKg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfzw-00000001DG2-2DCC;
	Tue, 28 Apr 2026 10:49:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfzu-00000001DFU-3aBA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E9AD60141
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031BFC2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373338;
	bh=zRRLxCTMFdXGHczu7lhZcXF7CCENkqKUh9uDDOxrXZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JtnZOetvlFS6qtORFdprF1g2YD3cl16GGsklOWk9R6hwUoiF4mPOfGg8SjchUjDUY
	 YE8tNvHSZSd61CPZDl9HODthjK8WGDX2463+x4w00sG//19j2ZWGaG+o8tP7rUOhUh
	 wfSy6wJmlC4y21kO3gzQroPIrHw/Vc8Vue3wlDK6z9WQbOBDfeU4hru7Nli1C3dK1N
	 7BHwzRSOfNwu/QOUUX6Sz9Fy9cLbVS6QjE67dV+H8LAJcVuZs0hwgMroMaXY46eNw8
	 GKuGREU9gjvzr9TgZC3iXJsJTHauOnYPSsOQ4XoxPNP+oeCu9JiNSPw6C40/KU1SX1
	 37IyBs2Ciie3w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e9653b580so125091111fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9KiG/CODQiAwrJLheJmot79qfVMh/bM0e37u/QvhoN94CArOiN3j6Vpi0guOr4nyYQcYmNO2Rey1/gq2w/5cBo@lists.infradead.org
X-Gm-Message-State: AOJu0YyCBUhFrH102yt/KypULOtGE81iVWehvH85MK80+9P/0aPdt+uD
	KmXxQzdbLhxdFtnEKhFNZx84vzxaJ+HvsieREJqoyD2FgBv0pYu6a1vRn5nVVYNPFP59nQwWo+9
	nxTgJ+Iyw9e1uQ3yUmktfh5Lt3Rb+8Sw=
X-Received: by 2002:a2e:a994:0:b0:38e:9277:6990 with SMTP id
 38308e7fff4ca-39241005c6dmr8960211fa.30.1777373336622; Tue, 28 Apr 2026
 03:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260427061720.2393355-1-wenst@chromium.org>
In-Reply-To: <20260427061720.2393355-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:48:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjDozkjL-136ut4OsX5PoCe4aKrfXVyq0jtEOc4LX1dw@mail.gmail.com>
X-Gm-Features: AVHnY4IQ9pWQR3XwMVHEmg2y70n-2Cqf_AoJsV8Bvhx3LjreKPa329xly69LAug
Message-ID: <CAD++jLkjDozkjL-136ut4OsX5PoCe4aKrfXVyq0jtEOc4LX1dw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Directly modify registers
 to set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 27, 2026 at 8:17=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> Since the Mediatek hardware has separate clear/set registers, there is
> no risk of clobbering other bits like with a read-modify-write pattern.
> Switch to directly setting the GPIO direction register bits to avoid
> the mutex.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Here you need to at least delete the assignment of mtk_pmx_gpio_set_directi=
on()
from:

static const struct pinmux_ops mtk_pmx_ops =3D {
        .get_functions_count    =3D mtk_pmx_get_funcs_cnt,
        .get_function_name      =3D mtk_pmx_get_func_name,
        .get_function_groups    =3D mtk_pmx_get_func_groups,
        .set_mux                =3D mtk_pmx_set_mux,
        .gpio_set_direction     =3D mtk_pmx_gpio_set_direction,

^ Here, it should no longer be used, right?

Yours,
Linus Walleij

