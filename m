Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC0DCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jA5tE5GObY9th2yxnDSqEtZEeO14+brrdEJoDq+kTs=; b=rO8gSeJXj1XcS7H1PAoySwWSo8
	nQ3UCnEZ6ODdBCvRv8vSZGMqajUj5Y8hEDI12c+LolB7Wp7sLKKhKS+JTzjXhjRZK4K5U/6SQ88Hm
	ba+VPc37YqQ0FstKBuJgqFCMkym3y2C6wc5dWaLbG6f0IzabWAtb70OnUpNcMBsFw70HMPWvoBO/u
	Nb7qR9YpqzU9qGDlIxwV/xP7yVKDwSvlxMae7Wu7x8lcDyt/TGKCXQSKmrfvQyph7PetEpOpWB5sd
	Nk5GTymoV9kj4u6gRcCmkD/cWoJbzhuYHZQjW/208k3xi2JMMW/zumNRxi6nYyDPHYODSSs40+jeU
	EdsMwshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXedp-00000009Pjn-0MeG;
	Thu, 11 Jun 2026 12:36:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXedn-00000009Pjg-36gQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 12:36:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6692F40A9E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9941F00899
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181371;
	bh=8jA5tE5GObY9th2yxnDSqEtZEeO14+brrdEJoDq+kTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BtQuyL/T+DgmSxbopOE1ikbM/wWGHnZD+RDeV5bsdR3MXTqTfRQ4Ghe8e7zUAu/Gu
	 skvRvRH/GMy90YnlJSvVwuSLQa6wYFQC36urbXjNenZFlf/mRsMgEQtTvgbVfeJeOH
	 uQuxWKlij4pmjbFjAI/hrbrJyehgB2EuyOtD2c/k5pLFzd1Bt6wxY/yQOzxLvHNXIy
	 SbE34r8iYtOu2rNpK6lwUcbPDS5qLu0jTqF7eRj5eQhBUsi/36tpNRd7q5vTWiIYWK
	 Matp0OUTjw3jCdv9+LK3OoGccq9od4P2FxegSm7VSVSqMjONOYOPoeIEEYESEiNAjZ
	 3/RK+EaYTEKKw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so8991624e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 05:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9PJZfP3sFoylJOEAR9zisrxt+ukK+Rq5uULZZjrcjM1Rze5R2tYgV+nmPCtwAvkswdVP2BmuzsMpB2HhNonCOp@lists.infradead.org
X-Gm-Message-State: AOJu0YxZmZHNNMEo015tuQsMFmZtlNE3K/vo/8OpzNYf/YAEJU7mlTwo
	KJNiZE11PFvYTRKjM2J+6Y/7wGL7Ia3MaJBdA3hcMrT3V4ae2jWoaBBDItCSA+fh9I/1TPa6jkC
	q/McLxugWUuBbim7vFafXzJ9EAN8Ftzc=
X-Received: by 2002:a05:6512:1282:b0:5ad:abf:1d36 with SMTP id
 2adb3069b0e04-5ad27fb6be6mr805889e87.27.1781181369702; Thu, 11 Jun 2026
 05:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:35:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmHEsAQhz0_A4mHPme7sMRjcoXqvRhGUHo6zCF53mWDQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfk5zjtlQGfzXSRHsrRy2dcg85kGX6xo32PNPp4FsSewMqe7c0byeEdCG0
Message-ID: <CAD++jLnmHEsAQhz0_A4mHPme7sMRjcoXqvRhGUHo6zCF53mWDQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
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

On Wed, Jun 10, 2026 at 3:21=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> This patch series adds support for basic GPIO
> operations using gpio-regmap.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

This is definitely merge material, I would disregard Sashiko nitpicking at =
this
point and just merge it. Any additional fixes can be handled in-tree.

Yours,
Linus Walleij

