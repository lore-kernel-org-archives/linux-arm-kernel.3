Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A3CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcDoLuPhHtsthqN6OlSJt2B07gH5Ch6EunMouvXcfX4=; b=cKq5IVHquA15XLLH01GtsVnw0i
	O5sESd1wBxDoPO9Wbpu7S4KMzYkiv/OiRFrFxW7cf21LesqOsGdgMPMUut5utGujwLBxSxFeXRgxd
	oxfV0kOxE7IueTa2ZyY9puqBvfMcvESOviU+Lucr/jaYz0/PSfcriaJkU8Ac5xHb1cq64zVJ3xcIV
	+GDxZ8uXKp3yh0qLahvMZDJY7h7yrho1340DttNSgX5AsFWrXlMQwjVPEgEI9pmgWP5+8fltrlaJT
	UTB7j2wmcyI9ZrCsbeG3NCEpemYTqBIsf2J+vs47796mpdsZTEehBWTnXoAGgnZelcxadvL0kFhJp
	H7R7ye9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGm61-0000000EEkt-3RXP;
	Tue, 13 Oct 2026 23:39:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGm5w-0000000EEk6-26I8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 23:39:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A39E1601DB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB0B1F00899
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934783;
	bh=JcDoLuPhHtsthqN6OlSJt2B07gH5Ch6EunMouvXcfX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nX3lHDWw3cLxd4fNmUOu94gijN5EvKbh+LyuJpyNKDIEDXqLBlI9B5ihZGE7ikvn2
	 SJq6dEnWBgcK2aR/hdHWutHM5lE15OQmgoDy5LIyeCxbNSsR8JGtttz/DVRitb3Xqi
	 eWvUhhB7SInvdsGRKg8fmKdDSf0FcKpMU1jcxWzoK5qFX2M3XaZ77o8CO6jDSgiE1Q
	 w6C6PRQi7nKpM2nImjHc6OtEkOlOrUkbzbcf3TaOpwhMNmxfobJAu8AO8i/GFRXwhg
	 1nM7an1oewJQnOAHpfgvi+iZaLNU9zVlsXxY+T+MjPbRzgxIdh+iv9LThvZS5ojt4m
	 8hMnQCUwbvsgw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a1981228f8so24089611fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyyrVkjvqh7In9FysAcr8BWoe4DyeGNBhiEX52+21RnSbCXRojO9Ee75XRerobkHffhDGOcIRbmBjbgztg2ucV@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3FmVwiXh5dIeUweTdLNWHVjHsboSobnlqNgqJsIubKQxm3hFK
	Snrqh3S5Enk/z2Fo6V/bXgGgc2+eSJl1jfSShd+xz8Gt4y2EXprpUdPzoavdbDjGOwmbS0ptCpL
	Twet6hEZKuqWzgPlf9gATLHPOH6KGn1k=
X-Received: by 2002:a05:651c:510:b0:3a7:8372:61b7 with SMTP id
 38308e7fff4ca-3a9c56e47e1mr31458331fa.25.1791934782126; Tue, 13 Oct 2026
 16:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-4-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-4-c4d769587d3e@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:39:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Jz=JCzcA8Z=SZRwKkk5-mL87Z85h6s3aPgydJ+2ypeg@mail.gmail.com>
X-Gm-Features: AclHuK_hIX0DEmnlWKNMSJS0IkXsyO_5VG56dU3LHEgn8JxPCAbGDIRoOljCGmk
Message-ID: <CAD++jL=Jz=JCzcA8Z=SZRwKkk5-mL87Z85h6s3aPgydJ+2ypeg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] gpio: mxc: fix race between gpiochip registration
 and IRQ domain setup
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
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

On Tue, Oct 13, 2026 at 8:01=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> devm_gpiochip_add_data() makes the GPIO chip visible to consumers
> immediately. Since the chip sets .to_irq =3D mxc_gpio_to_irq, which calls
> irq_find_mapping(port->domain, offset), any to_irq() call between
> gpiochip registration and IRQ domain creation will operate on a NULL
> domain.
>
> Fix by moving devm_gpiochip_add_data() after the IRQ domain and generic
> irq chip are fully initialized, ensuring port->domain and the irq chip
> handlers are ready before the chip becomes visible to consumers.
>
> Fixes: d37a65bb4663 ("gpio/mxc: Move Freescale MXC gpio driver to drivers=
/gpio")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

