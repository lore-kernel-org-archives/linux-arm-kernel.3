Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13994CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 19:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npvxteVAfIEKzMeytJ2WmNF7D4AAPzWxw0qzjoJdKTI=; b=nLz3S0/9xHrwrM5XnUoHdIicCy
	neZMIJGrhDVffclJuBTXCXkNgnHIMSqqUrb10yW3VhAUpFMB5+bsZgal8EYg3msExwrRHtMoFIfrG
	yunSygs0fmSV9nFtTTUPep3PYCONwi5riNyK1OUU2w3VQtLTD5SJ8P0/58KhnOIC8NO88R9yfKGAi
	4C+L60SnsP9bXMUxPYqYt1xhfgj4sKqTVYTCGeE00TkwzsHK4/D7QhpZUA53Ah+Ihij0BZJMRA+Az
	fIlnLtDlgo17umJGM1qfK8skw6OXV+vHzGAIYXhsJrsXLuokW1fqHJs310tNjmuKdE9NYISEM1fZ+
	BbHB+vOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vACF1-0000000AKib-2bbs;
	Sat, 18 Oct 2025 19:05:23 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vACEz-0000000AKhr-259W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 19:05:22 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-65051376edbso774015eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760814320; x=1761419120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npvxteVAfIEKzMeytJ2WmNF7D4AAPzWxw0qzjoJdKTI=;
        b=bl+fca37wLdWdWoZnjoWyKNssFKTk4hd96UZaoSKOnXQMB9rb1/gcVBmhim/FIC43u
         RjEtRYT4P8UfgMBND7CHXxqy5MfBaKLhOxxBvutAtwAugtMFGkIw5jVnaoe11M2GSnr/
         lvPZfSGX+jwImugZqbQUmnKdrBIFPwoW01dP/l5eSZuSAZ17Gs8t+VRiAyS8N/mc+mZY
         maGxVd1JEZUw9lfploC8ePmWNE2yPx0unnZVW/Cbn3q1bFNiXJPqAeiOPSZLJPyDO62M
         tNuxFtrXZL5Ce3effP0uNMB8N0a6OqNYwwAUDo2J+u7v0wGA71Fys2o8z/1y2NUCGvDo
         M3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760814320; x=1761419120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npvxteVAfIEKzMeytJ2WmNF7D4AAPzWxw0qzjoJdKTI=;
        b=MRHXQH9GHcc64DTwdLiFSx81Cp1mYc4dN+rgZ+LeHdMQY8D2fyC5efUHKjD5ioOrfG
         mE4uv9Di4VQOxCTmt3zro82ywPr+UREb9HN5Mg2jgyAzkP2L4htfJj2kShcMi2p0/TcQ
         sI/6XXXhAOQv5N7TnU+YUQjbfwYDZJsoaQUPwIG2PDpElzbIPI5OSxEoKsGJ9UEuz39H
         +Ipj91/KsSvZ1sfu3pb56UGjn0kYmuVyKpOpxU+OLYRYJN18kPVQee7V2H0xYfqB+LKG
         5F32uCAsGZSDpTmDQhe43W1stuCxdkWoOsMnRIFfnmcL+m168M97qnIqy+DVixF5YJap
         /zWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd0R8FPjwQ4YtlKfnqqwvznpFiFXghQ0YkaaF2z41DlJwnxQYVhhpeHB1uNhldbJLm5DkMkDtP1bgoWMcQkKLI@lists.infradead.org
X-Gm-Message-State: AOJu0YzbWr2+GgrxrljyxoGcYtPnsUsVF/OkyjfucLTgheVaFN8Y/Zux
	xtg5nmsJOgYVG2uKN2p9B5+5KX2a4q5wdy9SptrHAYTcXA46va4479MxlYJwHkI6poihyUd2CMd
	ZVP9s6hXyXU10QMqAgONWmczNAMAWWpE=
X-Gm-Gg: ASbGncu0W7yHCHNkZn3uP+HMWspV3qshQIigwhsss1jAMEoYL6XGxTFDDFPXDHeQGeT
	xE3NH4uglGBgDy86pphIarik5ZQxhEj6usfzaTncSvjj2fTH5PophxFV0rBniFS6arq4kc+eDUv
	6U6A/GcER5+vmewtHhD9DE9l3ANeoa170qpqbUd+ZcHjmPmcE76nm8Cr/KNpfIJjiPJ1TLzDwqJ
	sXIjqGT+mcDwN5KUoQEuAFQ8vAjzYJc7rhXO/Z2b55us/ibCDis3l0V2tgnantZSAG02Yb7
X-Google-Smtp-Source: AGHT+IHn6bYHsxvnnBm5dSpuXWjNC+PBXDBTRxFzgYuC3xttEpimkJMntVWJZ0cZXwANZryVuMF0nNeTd369Q5XITzY=
X-Received: by 2002:a05:6871:6907:b0:349:de3c:bfc8 with SMTP id
 586e51a60fabf-3c98d0c7686mr2520732fac.31.1760814319754; Sat, 18 Oct 2025
 12:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Oct 2025 14:05:08 -0500
X-Gm-Features: AS18NWBGMwSlAmXgBiXSGQWXCd5xrZTGccuKfzZwiw4wGpClNDZImruw46Wm-dA
Message-ID: <CABb+yY2u=XZFdoDrjjYFhARLoaxH4uTnT=GyFmsnV_U1aWn=UQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
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
X-CRM114-CacheID: sfid-20251018_120521_545963_1D8B54CF 
X-CRM114-Status: GOOD (  14.98  )
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

On Wed, Oct 15, 2025 at 6:20=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../arm/altera/socfpga-clk-manager.yaml       |  4 ++--
>  .../bindings/clock/nvidia,tegra124-car.yaml   |  8 ++++----
>  .../bindings/clock/nvidia,tegra20-car.yaml    |  6 +++---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  9 +++++----
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       |  4 ++--
>  .../bindings/iio/temperature/adi,ltc2983.yaml | 20 +++++++++----------
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 16 +++++++--------
>  .../mailbox/xlnx,zynqmp-ipi-mailbox.yaml      |  2 +-
>  .../bindings/media/fsl,imx6q-vdoa.yaml        |  2 +-
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  4 ++--
>  .../devicetree/bindings/mfd/ti,twl.yaml       |  4 ++--
>  .../bindings/net/ethernet-switch.yaml         |  2 +-
>  .../pci/plda,xpressrich3-axi-common.yaml      |  2 +-
>  .../bindings/phy/motorola,cpcap-usb-phy.yaml  |  4 ++--
>  .../pinctrl/microchip,sparx5-sgpio.yaml       | 12 +++++------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 10 +++++-----
>  .../bindings/pinctrl/qcom,pmic-mpp.yaml       |  6 +++---
>  .../bindings/pinctrl/renesas,pfc.yaml         |  4 ++--
>  .../bindings/pinctrl/renesas,rza1-ports.yaml  |  2 +-
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-
>  .../bindings/power/renesas,sysc-rmobile.yaml  |  4 ++--
>  .../soc/microchip/atmel,at91rm9200-tcb.yaml   |  8 ++++----
>  .../soc/tegra/nvidia,tegra20-pmc.yaml         | 12 +++++------
>  24 files changed, 75 insertions(+), 74 deletions(-)
>
For the mailbox changes
  Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

