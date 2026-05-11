Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81622CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPUCt6ICGTtK/EiSnPgIORPfz44RRnfMxcp50LmxRBM=; b=qz75vL5YS4YpQzke8NrK3HL20d
	kWyK2yOzgdcnvy9H9faeelvZiaxIO6kmoww67sCWiJCMYuENsL6aXW/c2EK9Ayf0H7rk3DXXsZrzC
	x9OhA6S6OOlEdU4wwyJ0OhA3D8bVxyfW/H4BK4jh87T/SKx9zwva4Sx/PUG2SmP3nBkBUGKP28gDs
	5jkGGsb5Ec3mDkKD8Gsx6JzZVqDyOvdc6P8RDqw+XpVKCEyPXfSzw8I+eEHuS1RqAZcyxcBI0uFAS
	4i9MllY4c+m4RYHpRwEGh93KAe84p12is1MDHO3HGa9zhWNdOSi5LM9V32+qzBF4BoRDNpTli5B4z
	ZGTLI0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMJY-0000000CnJJ-39c8;
	Mon, 11 May 2026 08:48:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMJW-0000000CnId-22qX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE3E9445A7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94439C2BCF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778489313;
	bh=FS9Vcj76U9RM5XIubOjoexo/Q66e6Qb8ezAJTR8qo6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BkFL70skeyMsxsAPovmmjWva/uA7ul3y+pIyc0IbC5Z6jp+X3h/7vsK1rfwOWZwPg
	 yyof2+cc+0ChQ2ZmGzBckVM4Lho265t0+jpyzOhL0Z85yUbVdXmfJmgY+XWgfVuLx2
	 XSMQHZ1SPx0FS7PtT6I/Kxdzu1DH/0TiUQvlV1AXSKc5p5bPkLemRqecW64jPWpgUX
	 zorFbUkVKMMpZZClvBqYJNyNSAFy401fOr/YeNklUYQUHH0RP2e73Asc+fHm7CsYUZ
	 lMVq0GCD6y86ofaHEztAM0IGwcsCFYuAtc+pTYuzFC128zk8vnCp1QfpB695rL+9Jg
	 uZ3GOxabECP7A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a525aedb24so3980614e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 01:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/nmWp/mj6PMzPb+6hAXb4k35WzCxdZq8DXw+/pAMlsLu60mQwZeNs9fud7DMwE6RvyKgWrMHGsY61Tn8qyBpqH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy/wH3+0xPHvlJeBaBSdK6eUG0BS8LotLU0ytNMEEV9KXMxjQF
	041dVMuuQsQBF0ZNmLq6acizZmftzgUGT90y2WcjK+b3qcDMkWfDviqd20x2gHAx+J3q/dcbZ8w
	5FVHmWSXpdrxupqQJSjGS39hm+D3Wlt8=
X-Received: by 2002:a05:6512:304b:b0:5a8:6e64:a932 with SMTP id
 2adb3069b0e04-5a887cea7efmr9393309e87.32.1778489312120; Mon, 11 May 2026
 01:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com> <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
In-Reply-To: <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 10:48:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jgw80MuyK4ZGcKlHCdHrHAFZ3YKz8oTwazlDM_Kdt2Svy6qUsv6clMxog
Message-ID: <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_014834_573002_9026543F 
X-CRM114-Status: GOOD (  14.69  )
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

On Fri, May 8, 2026 at 11:07=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

>I don't think the current driver is a good fit for
> a full gpio-regmap conversion. Direction and GPIO mux are
> handled through MSCR/pinctrl state (IBE/OBE/SSS), and the GPIO
> logic spans multiple register regions across two SIUL2 instances.

I don't see the problem with that?

> A conversion would require stronger separation between
> GPIO and pinctrl, leaving mux restoration entirely
> to the pinctrl subsystem.

Why is that so? Sorry I don't get the problem here.

The pinmux operations have these callbacks:

static const struct pinmux_ops s32_pmx_ops =3D {
(...)
        .gpio_request_enable =3D s32_pmx_gpio_request_enable,
        .gpio_disable_free =3D s32_pmx_gpio_disable_free,
        .gpio_set_direction =3D s32_pmx_gpio_set_direction,
};

So to me it looks like the pinctrl subsystem is *already*
handling all the muxing of GPIO lines in these
callbacks?

> Would it be reasonable to keep the current approach for now
> and revisit gpio-regmap later if needed?

I'd prefer that you look into it now while you already
have all the information at hand and fresh in your mind.

You can forward my comments to your project lead
/ JIRA instance and say it's Linus' fault you have to spend
more time on this right now.

Yours,
Linus Walleij

