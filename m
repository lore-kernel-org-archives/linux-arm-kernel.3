Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6929CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+eT56sr4N/sv6bQK5WCfgylHHqHSL7IFsi0qBO1SJg=; b=SjF7XIQ3hQXOCHOfLbCDuLKutg
	IyabtVilqpNx1jnin8UeAzihkbd7Ge5t13CSEuU/wTPZ/IMfozkExvc2nCWC0z6HxbzPkj9fzan3m
	c+JbklvESr7oKL5Fh1xp63MpvvP+TgOAZ5I8OwIGohZ6WXWnCp+4EhOCUWbOJLzCTHABsncGyokSs
	UoHwjhEcUhlToFP+o1AfZ/DiqKf/Q7si9m0q1bwyDJYLswC8vGfJZc5SGa1P3svioiFDhYzCJY3VC
	802H1N2EC1TqZnlEUpk49mI3DW6c9o0h6t6Obhsbu33flHdBbj+GbAsDWPOz19A1EhwsoLktWW9Wy
	akCz9Cqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MR2-00000004cm8-3gEP;
	Thu, 16 Oct 2025 11:46:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MQz-00000004ckY-0qoH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 11:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D007B4A8AD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 11:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6AAC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760615176;
	bh=PZizulifq2HVUabPYk3xuoVBwllBTb+3Td/PKhrD1JE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eVASFOd8Ywqe6KQNNwIc5W99wHDhxMRKImkDDotqZhGfqTqo7WZv7EpFgufnGXg98
	 JH71O97kUeMbKxS8dK8TarWgbulGDPG/N2osi7PB/ojtJuHmlrHJipQhJK1fGQIqx8
	 op6BUxlQydtozthCzk1GkU+Z3xEyU2pJ07NmKzV3wJgQe358X8/mJd5VrRKTvZKzl+
	 +9FQpN9xIDocbbmTswT52JCnNKVhQThGt3s6bdIntcRH2MwGnePaTwIuWYel9QlktR
	 HIEBISbSt0jVuOZKcib3uQCDBxbXZ82Ji+VD8qp8E1NGjRdxSMw+Et1p/mpAswLeL7
	 3l+fyNXce0nKg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so116883266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 04:46:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXazOVdhbslLx7Hej6ZVKKC00w59V/8qgauTj+gZy0RMDDHhZxkkBkBMmbTxMtMD5Fh+btEsADBca8ZiuHh53ic@lists.infradead.org
X-Gm-Message-State: AOJu0YxZBtmAGNtvJcUz3pB13LUjkNUpjRERd2vYn+AGPceBZkzXQAIB
	czv9ct/59uNtbXHeDx8tg/Do19wiilnCPmNQAUUOUPQ+qQ7nrnTbLtsq95SEHt/RC/ilwuMpymc
	6slgEKUo/9OqxV9IP27GyQHnSu+73Ag==
X-Google-Smtp-Source: AGHT+IG/cukXQVGNzPUMXsg5+RoCAkU44f3RdQmcvQZOd/ZrFBQ7UEz32fqOhzDQMAOYnE1PB3ZCi0DPIcgQtV+P3zk=
X-Received: by 2002:a17:907:7e96:b0:b3d:d6be:4cbe with SMTP id
 a640c23a62f3a-b50aa8a9063mr3962097166b.18.1760615174961; Thu, 16 Oct 2025
 04:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org> <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
In-Reply-To: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Oct 2025 06:46:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
X-Gm-Features: AS18NWBW0tx10CGZVgmCxHc_hmn_UbUIH_yG162ZfRbVO05hKCLDAYOsOpbWm_A
Message-ID: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_044617_293848_1236E84C 
X-CRM114-Status: GOOD (  20.06  )
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

On Thu, Oct 16, 2025 at 2:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote:
> > yamllint has gained a new check which checks for inconsistent quoting
> > (mixed " and ' quotes within a file). Fix all the cases yamllint found
> > so we can enable the check (once the check is in a release). Use
> > whichever quoting is dominate in the file.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Thanks for your patch!
>
> Since you are mentioning mixed quotes, is one or the other preferred?

I have a slight preference for single quotes.

> Shouldn't we try to be consistent across all files?

I don't particularly care to change 915 files. And if the tools don't
enforce it, I'm not going to do so in reviews.

> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > @@ -129,7 +129,7 @@ additionalProperties:
> >
> >      - type: object
> >        additionalProperties:
> > -        $ref: "#/additionalProperties/anyOf/0"
> > +        $ref: '#/additionalProperties/anyOf/0'
> >
> >  examples:
> >    - |
> > @@ -190,7 +190,7 @@ examples:
> >
> >              sdhi0_pins: sd0 {
> >                      groups =3D "sdhi0_data4", "sdhi0_ctrl";
> > -                    function =3D "sdhi0";
> > +                    function =3D "sdhi0';
>
> Huh?

One too many search and replace. Fixed.

Rob

