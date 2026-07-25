Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5790EC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmfA0+GpWd7rWihBx7NsJY/C0PcgSTsD1nNyDBXtTdQ=; b=scERnisPjUI4TfBJvIBRXixkXc
	vxCPmbPwwPJ/Ux4fbhmMh9K6kFblPUF1HVdOsaRl64BdpTt+rGXJbqEtMxtZxDd4iL5KdF266cEsV
	LDGMQGUcmLF/gsnFfBQ9TCqDkp02EFGwYEkP4MvNqabEN36lBKoNda6vmnmBYIEYHRMJtxJK5qpf4
	6W59C+FlE1MaH2F5oYWKpRTa0UQ6zuCbhj2D2xSlqL99kpsh5KEu2D2AzFklcM23SrtbGnbRf9IGP
	yu7OYLYlYSuWzeT0B/ooGpW/YuR1aQfiiyyJ/MWhgk9KbdRnWC0rh1oJCz1Tm+eqICRGqSLZXvMlw
	oYbsBCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYze-00000000E4X-3tSY;
	Sat, 25 Jul 2026 09:48:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYzd-00000000E4O-0vGu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 09:48:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94870600AD
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DF61F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972908;
	bh=bmfA0+GpWd7rWihBx7NsJY/C0PcgSTsD1nNyDBXtTdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UKez7odSKAU1O/di1oZTiOnaucUfN+Xd30VpxPzaNdHmAW+iPRvZSiJmz4XM8kGX+
	 UjpMT7WSettPVqLlW3JRLHiMEqsp9fdaSy5VRBWvDFssiPx8W3hBpjDgXmwN/E/g6m
	 fwOQ90lLZ/9qaQZtdtj8txfrrQ7oG3EXzq/7U/fS0v7ybCq/S3izQW6xIBWU4UigRC
	 Lr80i1JnMQ76QOra7ImfvVMuzdcGlnqsyIkWEIHVSXJ7u0LjBJ8uLBcvCM4UwiZ+D7
	 qYJfsBbpafVbadq1wpA+ZM1qJqr0JgnhHUJTo5Sr0e+YDYNkr5aiD+9KfdV5dtRJ/Q
	 RwhylBwrYnzuw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so1141913e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 02:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJC5mjA23TMWlHvuHICaSlv19B4zaGJsDusG9+ku8WxG6whydfOgKsYmxlqR6ArD6MVvM1RTUH+FR/RR0faVBB@lists.infradead.org
X-Gm-Message-State: AOJu0YysyJFeMCuXDWC1pEkyOLnxLzYi7WYdmrlMqkC/YG8sLvbsA/e7
	/B3+TpFryyOcYTxXuBBiAukGDt9Yy9tblqQCtNM+beiVnFeXq+wzuIHkMtbjbPszwNRUJIlJg1Z
	rmpLtTjRH4UjzoLCfCkNyGLrAAYwz0Mc=
X-Received: by 2002:a05:6512:3195:b0:5b1:1b50:7201 with SMTP id
 2adb3069b0e04-5b2c1b2ef9emr300160e87.36.1784972906980; Sat, 25 Jul 2026
 02:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260722213314.155310-1-julianbraha@gmail.com>
In-Reply-To: <20260722213314.155310-1-julianbraha@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:48:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=xTS8uvqMeb-fi6z1-94nZJC3cWvCKV0facdxGvp1wVw@mail.gmail.com>
X-Gm-Features: AUfX_mxOggyFq5f07H2jGjvpwJ0GrPvq6ulspmciTxcqJLpv9tzd1X_xmuZaOd4
Message-ID: <CAD++jL=xTS8uvqMeb-fi6z1-94nZJC3cWvCKV0facdxGvp1wVw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
To: Julian Braha <julianbraha@gmail.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, Frank.Li@nxp.com, 
	ping.bai@nxp.com, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, kernel@pengutronix.de, 
	bartosz.golaszewski@oss.qualcomm.com, andrei.stefanescu@oss.nxp.com, 
	khristineandreea.barbulescu@oss.nxp.com, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 22, 2026 at 11:33=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:

> Currently, PINCTRL_S32G2 selects PINCTRL_S32CC which needs GPIOLIB, witho=
ut
> selecting or depending on GPIOLIB.
>
> However, other similar options in this subsystem actually select GPIOLIB
> instead of depending, so I think we can do the same here.
>
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.
>
> Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Patch applied!

Yours,
Linus Walleij

