Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0031DC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvCoVMrq482sRltMKIA0wngG+Be2zNs5wkXwHMhSAUg=; b=XyfWoUTnqWQESTxXbT7zcb5A5D
	608teJojozqqf5aRaO6GR0ZWzJSafU8RLI3+mERlvVJ4RHmVcoBDDjhPPp8OYSxanNoJpAvfLYYRW
	6lrzWOAB5kEgKjYHS/pZpL1CzB1qp2hi+Wo9jID/hnnfFjbqIqGhGX8cwugtxaaYKH0MHlkPJkhaC
	rFdqLMjdBmvGB3xq81sYQeyEV9wdcRqNtqC+mqWUYPSoOOWWk1K4Ic5xsC0PTr9Q3lXGOLQWne791
	OW83/HaDWCHz6NmmPXkfT891MFevglU5PCwyBS6Z+GoQV8HwZa/p1YqqRuP6IP44Z4aQfuLRBgaW3
	LRjiObLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAGz-0000000FhFr-1vUQ;
	Fri, 24 Jul 2026 07:24:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAGz-0000000FhFQ-00zM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:24:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B114643F85
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8501E1F01558
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877883;
	bh=jvCoVMrq482sRltMKIA0wngG+Be2zNs5wkXwHMhSAUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GHNyHY4hC7tojuzaxlZtjiFy+W2Qk8/5I2WoTb6mbQZ0xAjikAArouvFN+l07ZCvO
	 brE8FuPIw0Aru8OuXBQhtcU7m0cz7TR4lmGhST2Kj/RY757fAlXkXssOyVT0Q2LZKM
	 otyrVgqN0reooRcHojkIbP07aeS4c73hdiXMqtE2vvC+aeD1cPY9iuRysB3RmDitSB
	 r7yDUqn30oQH5yrPu8nyWihTTbvAkO7GpiNVLakd7G2jxkvtwdfe60LebsJVTIhOjt
	 ngEYp6fjbVTeuXYkUN03sB4L/YPIL704ulORfYx3eJgnygH3bJEvugSb1EwI+FNGCH
	 b4mgnvHXPHTpw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b29599b81cso130997e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHyx+JDrgabe6l/8Embukr2vNEtecsLMheCM8d7K785SzEMAY0ZN+uc9MaAFatXkHjqLuAHbYbFjJ8SkPFvo8P@lists.infradead.org
X-Gm-Message-State: AOJu0YwCno6nb83B/RnxyPyEOM7g/HEbEBAR8W3y/1UQwS7TvaJ6ux7l
	J5cyP8cH6gS20xJy2Sz7QqdGv7fuljF29MraFPOfNv9ZTdk9oHf3tt6W/9zAXrR95+wo70kNLp9
	Od+WMot+9qUJ+BEg6b4SpNwxvtVkFs54=
X-Received: by 2002:a05:6512:12ca:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b2b2e4a6d1mr1388989e87.13.1784877882305; Fri, 24 Jul 2026
 00:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:24:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
X-Gm-Features: AUfX_mwgzz4U49kjYn2t0Q6F2gaYlikzFa7qviMieYEmwgYwO8V-etZipo96ywY
Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
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

On Tue, Jul 14, 2026 at 9:25=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

