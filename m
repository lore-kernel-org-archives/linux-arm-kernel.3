Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F113CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5keBJkPYx5ZgoWalnHhunPGrhbaZ7oanxcpIt+4S58=; b=WQHWXv3JisZmG/6QRZK8X6Ysqu
	2LHo3NWCdqgf3+4lg9YpFLeywPzF7VGxv1V1mNOBFZDBd5uLbpfH+lJDpHHebsWWuGu0GZADjiuGe
	RVFBNpfnuZCMs24pOIBxqU9fdHFVAGkAZkWVk8WReWb+y6nEGIc3SVjgGdjqMy/J6MnMiEL3XqkWX
	OXAbmSEYCHHMBvZujrZGuocw70ONfJ+P/fuCT+eS6jG3Ui21r465P6VaHH+pLV1ni/zfPQi9wrFom
	GhRw0ycs5URrMvSpE5I22gHXU7NebW32t/+do/kwMpC03/+yWpJYchVu6+sszg5Do3gZgPysLM5fq
	GnWshAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKF8H-0000000GDMt-0geL;
	Tue, 05 May 2026 12:44:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKF8D-0000000GDLk-3m1b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94390408A4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A16C4AF14
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985048;
	bh=C5keBJkPYx5ZgoWalnHhunPGrhbaZ7oanxcpIt+4S58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n3mrubftJoorIZKutX4S1zhhjIuNHUvJlv7rUoNqJLfRGuJ+bKO8lNjMtCMFfLL3m
	 bDrJUr3ZhYnAC7yadKg6EhYl1QG/SuDDODEetH1XMNHYQo9COZaLkbHUPDFp8I2oqI
	 MoDYf1pp4imRyN6cTL6JnbT/vEoKy9wJTSoW8kyLRapxaBGok9fhfo2a2D39HmqfeF
	 T1lTBJ8QUkoAY15u83/6TDGaaSpa3zuj6Yom3Vktq3BwUh4FZimgUdef0gjTO75c73
	 NzYYRykj7q/fddMWbB0wAMh+OZhGXTUZjjxhDmKmnIF0yWtRYrqAxlqSte4PgF5yhm
	 ZZnge9oTbVNBg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7d983f79so53539991fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8JHJLHUWXXT+jXTaR0MWWl9W3pSGhQ9PHj8gvtqNu690ebJzF+CzJM88gWkEIAKlBEDvQx7fuULk4iNBMecqV8@lists.infradead.org
X-Gm-Message-State: AOJu0YxYpn8DnJLF+cs/RlATmEK0JyQVBsKOXU//sk8WEFgRE7lnYkYj
	b0nCK4HwZcXaZSclFWhhpQY6QtoFRbEFl8Ikryx/ID7x25I9zCktWG/zBNvDlTDeZ25EXtux9OL
	g8NZbBBHBohCQ1dpNydyP8VEUD2ZIaeM=
X-Received: by 2002:a05:6512:3b8e:b0:5a4:10b5:624c with SMTP id
 2adb3069b0e04-5a8631bad70mr4316816e87.23.1777985046764; Tue, 05 May 2026
 05:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com> <20260504124155.3615001-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504124155.3615001-7-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:43:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnOGUOW7e_cp+LTD-U1aAP++8bw4QNLwRPWRnne=3fnvg@mail.gmail.com>
X-Gm-Features: AVHnY4LINDdQBuzYyWghNyWztXZnz__yCp4RhcwGAtZR-JFeHZU18RDafo6lElg
Message-ID: <CAD++jLnOGUOW7e_cp+LTD-U1aAP++8bw4QNLwRPWRnne=3fnvg@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: s32cc: implement GPIO functionality
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_054409_979066_80D41A8B 
X-CRM114-Status: GOOD (  14.03  )
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

Hi Khristine,

thanks for your patch!

On Mon, May 4, 2026 at 2:42=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for
> the existing pinctrl SIUL2 driver since the hardware for
> pinctrl&GPIO is tightly coupled.
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandr=
eea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This looks good, but if you're overhauling the regmap handling,
have you taken a look at the gpio-regmap library?

select GPIO_REGMAP
#include <linux/gpio/regmap.h>
git grep gpio_regmap_config <- yields examples

Yours,
Linus Walleij

