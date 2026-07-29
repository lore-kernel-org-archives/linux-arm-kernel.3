Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F60C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z14mhav6h5sZjYDVTsRCvZnPRsjAj47Dt0/VGLZobdg=; b=t6J5l2MRoKEOj+YGOqfRq1X10B
	3UJWyHqpvblE6q1g0B7esxjFSroTCpAGilc0W0CakyjQ5OGrCm5qj+X4CjmiLTIBGWfRyTcTYnKCt
	gQqoUY4Ze+wGGc6jKrZDAILdVoQA6iJYzMRO69sTuQJVJI7+O5EfEWKV0zipRis+LdJein2ouGR74
	roQAVjw2JyliIJBgsk0eELwMim4w8OVujASKPG3dg2yHK1MJz9cfauDBYvDqpyQtHJU3qZthzDPnu
	zdFsI54rvgx9xQ105+vLAGz7xCmDP6VUqTC6lrwnheQcG/Nxw5T4RyUoD5wUwhtpz/yglCjKL5rGF
	lAiQoRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAt9-00000008xPi-1gPa;
	Wed, 29 Jul 2026 20:28:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAt7-00000008xPS-1XM0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:28:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8A0B41852
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 20:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD541F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785356904;
	bh=Z14mhav6h5sZjYDVTsRCvZnPRsjAj47Dt0/VGLZobdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lm3MIi5UMpbk7RTT/Wl9HmHe2fecTkVve4mfHMp3WpsTHkApGc8GWk60M+Q/ty3Bn
	 MMR3whCEZgCfFLJWLpF1Mx8kfZN5V9B3GWu4UWk36ZxZBiCIrb7JpUb0c+7NkslvaV
	 LYHFWXyiKJePdX9jqcilEwtgme3TbggLngkNAE14WXCr/JFEdzdH4sSuv317haRB6T
	 Dw21FACNnd/yRsLlDa6JaK0+4R5cXiOVfG5IiBjzI3zuoQkhFLIhsnCEmHaTgEfx9N
	 tbaMpz3xrK78tgoqkeg5Ao6ilkeflP5EyRmHlTff+XbTtLTmmCrnKAErKk99wUCLXI
	 XVfLpqC3Ex6AA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b01910b499so91885e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 13:28:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpeM5uwZh/wGbp9Xbxt9rcnI4fqXr0oI25aKa5VYR8GqAwoQ0koCt3pUTnuy/MGuB8ECoUyus+U5ZXd8wfFGBpB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6+ad++FNrUQsXmN1zJFfCnwT9TmZJncDAfRA2tuuteqM3/TCc
	wsA4Gpew5CaCVNWwhwtK8G6F4FVkBJ/jb+xsBqDLawh+Jnnb/pq2v7c4qPsSwG8hN5bkDh+TQVg
	vP9EhGuqJr1Mu6l7w5p110+CBAEzK5vc=
X-Received: by 2002:a05:6512:450a:b0:5ad:5ba7:5c2d with SMTP id
 2adb3069b0e04-5b2d80e762amr854582e87.25.1785356903429; Wed, 29 Jul 2026
 13:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
 <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
In-Reply-To: <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 22:28:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnf5g-ZWKNO=zE6Pv6e=v-zTEDWWpWUq+xayjh6Vrzq7Q@mail.gmail.com>
X-Gm-Features: AUfX_mx3ldhVTk-2atv5ia0bOyA8wSlftNJ-eQ4lq0SQY3ZDNblxcWWydX15_6s
Message-ID: <CAD++jLnf5g-ZWKNO=zE6Pv6e=v-zTEDWWpWUq+xayjh6Vrzq7Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: axiado: add SGPIO controller support
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
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

Hi Petar,

thanks for your patch!

On Wed, Jul 29, 2026 at 9:02=E2=80=AFAM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> Add support for the Axiado SGPIO controller.
>
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions. The driver registers the controller as a gpio_chip,
> supports interrupts on input GPIOs, and uses regmap for register access.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
(...)

> +static int ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset,
> +                            int value)
> +static int ax3000_sgpio_get_direction(struct gpio_chip *chip,
> +                                     unsigned int offset)
> +{
> +       if (!(offset % 2))
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return GPIO_LINE_DIRECTION_OUT;
> +}

So every second GPIO is input only and every second GPIO is output
only?

How does this look *phycially* on the outside of the chip?

I'm a bit worried that the input and output would be to the same pin or
something, in which case they are the same GPIO line.

The cover letter says " Each SGPIO position provides one fixed-direction
input GPIO and one fixed-direction output GPIO." and I'm suspicious
about this.

What is an "SGPIO position"?

If a position is something like a physical line controlled by both an
input and an output driver block, it is the same GPIO line in Linux
terms, it will be used as output if a LED is connected there and
it will be used as input if a key is connected there, and we have
64 or 128 GPIOs, not 128 or 256.

> +static int ax3000_sgpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +static int ax3000_sgpio_dir_in(struct gpio_chip *chip, unsigned int offs=
et)
> +static int ax3000_sgpio_dir_out(struct gpio_chip *chip, unsigned int off=
set,

The GPIO line handling looks like:

1. some translation
2. Standard things

which is usually what we use regmap-gpio for, and we have added a few
features to it recently. Some are even in linux-next, can you check it out
and see if you could use the library?

Yours,
Linus Walleij

