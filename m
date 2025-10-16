Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC833CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3GThzLUFjGbl3VuQITKYi7/BLSw+ups+ZHEY60Y/84=; b=cxHmtVeGOrD2j9fNMdW5HGtdXC
	2qibM/VsQPwifzru0xq2YqZSMm4BY6VNC05HArHwcttetrsPiSdQfKRKGS1jiTTn5/08oxNkTTkP1
	7QJD1wrcG8DFDuHxnaOJyRdyXi9wX6Sas61S92N0YLRGxVPqqdfcrTr1HCa0s8fjVDlFDArklKivY
	QCa/ZK5Npv2+MFsO5B4Rt2qveJArdzal7w5rhZ/PWHdksr7uim6dRyTtJTDgalSZ+2RyPzb6nJqG/
	Xi1xOSVwhytbnWxfIYu2ZYDCHaJtDKxGP7aGOlftF9UzXk92Ig6dtE2TncVrhSv0ocrCnBKya6ePY
	4yb/c+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mpp-00000004hlw-3Mrb;
	Thu, 16 Oct 2025 12:11:57 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mpn-00000004hj5-46vG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:11:57 +0000
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-87808473c3bso140493385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760616714; x=1761221514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3GThzLUFjGbl3VuQITKYi7/BLSw+ups+ZHEY60Y/84=;
        b=dCYORgJbjKNrL4iXBLvzyI66KYdvrzGYSQKaH2Oqtq5HNa9ecB6vA3AKFfaSjb+yE+
         W0xfbBez7A9pZBW349vmsH3UaYhXlM0jYXOFtoba4HN0CgNPZZuQSElga56TFYYO+t/c
         /wDiHOot6NF0pbSvnuEoLmXte47/RPYcGtWQPgjqI8+QMu1v96ATtkimrcyvvpsI3Sv6
         kOyo6igYz4mohbAF69EMaJSTNn5tHppacQq4BFZjBdoTJkP0KZ+Ys/eUo4d40yLDhDwx
         F1qttcfF5+zW6Loh6DVg8yx8CCvW4Hs099Lcp9b/bLQBhHL7vqDeJYxwQ1yMdpHipSBS
         J8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUub3h9RrCTi2ZYNBEEQzkgJu2klRe3UjQS7MB1GOc3hZfyEBGy2gDXeKYX+0RArqDjmNxSJrUQ8cleij5p4UiT@lists.infradead.org
X-Gm-Message-State: AOJu0YzqjI6cnt4aR7coRj2XGnnOYvSjx45KGbr9beYnYyAKXzMX2wTJ
	LNPvqwpB5m/bFUKR1sA2vZOvrIdc/nsJY74y7yz9AFEklx+ZJb+2EJq7ri6bjS54
X-Gm-Gg: ASbGncuWc2sJwIw8pfmhiO3gG+TYjPAwzI7rIY4s8eKIhhuGwVeZ5xqxcAvGIWOdRpL
	3eZmrBV1LXm5D3gL7tCjNMbubENJrtrSSIkKvtz5jK8oG5boRq7eUJtc86N7GB+pynzofILXPS9
	botN5zxUuTzrqH7rav78Svlo0pESeYJXrhqGSuwnDa2dCiHF+2ht1VcNXh/5uzmJAcBOnL/s4LL
	/o5odalONekkwBHXBguPlPaYQ14hwQwOKYZVqDznx8iOcSDJRhCUuEZnAZ9PzpyxWZKJWV8nqgF
	6288NQ94EeRfT9no9Uzo1yoc50c3MDqd6QgD/caedHKKUS+Ls+nqhD4xjYHSDq00TjeMQ7VOekh
	LHfv4fJQxozF986ocanykkwy+FsmvW/s5etwn6/rR6Z4zwlsOh1nc0TwM5h1TfqCKznRXXQelY2
	ScmW/xnkcInDAAmzELojpmfXyK8HOG/i91v2Th8D1R+g==
X-Google-Smtp-Source: AGHT+IFNUZt1JhrkCHtYlSos1d+ZdkwHOhbCMNW+4YJ0BdgotS/ldBK7rDyM7BhulAvwy2D7FrkvOw==
X-Received: by 2002:a05:622a:20f:b0:4e8:8ed6:9be3 with SMTP id d75a77b69052e-4e88ed69fdamr59040051cf.52.1760616714147;
        Thu, 16 Oct 2025 05:11:54 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128d879sm38318326d6.35.2025.10.16.05.11.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:11:53 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-88e68c0a7bfso136143985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:11:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgjvkuNbfNGtF16C6ZkP5wmvkxtxXSFSqF8XyGtjVmkMaOBFNhdfWaA48O05l83Eay8Wa8i97oVkAtKZtR4oBm@lists.infradead.org
X-Received: by 2002:a05:6102:6c2:b0:4fb:ebe1:7db1 with SMTP id
 ada2fe7eead31-5d5e220448dmr12281536137.12.1760616407229; Thu, 16 Oct 2025
 05:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org> <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
 <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 14:06:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
X-Gm-Features: AS18NWBH0cbPp0cJrT4sY267e4E8JBEuMEr4tkAtjK9DVXEqfelKr3ZBbd1AYGI
Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: Rob Herring <robh@kernel.org>
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
X-CRM114-CacheID: sfid-20251016_051156_053342_3B6B8983 
X-CRM114-Status: GOOD (  26.38  )
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

Hi Rob,

On Thu, 16 Oct 2025 at 13:46, Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 16, 2025 at 2:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote=
:
> > > yamllint has gained a new check which checks for inconsistent quoting
> > > (mixed " and ' quotes within a file). Fix all the cases yamllint foun=
d
> > > so we can enable the check (once the check is in a release). Use
> > > whichever quoting is dominate in the file.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > Since you are mentioning mixed quotes, is one or the other preferred?
>
> I have a slight preference for single quotes.

OK, so outside human-readable descriptions, there should only be double
quotes in property values, i.e. on lines ending with a comma or a
semicolon.  Sounds like that can be scripted, or validated by scripting.

> > Shouldn't we try to be consistent across all files?
>
> I don't particularly care to change 915 files. And if the tools don't
> enforce it, I'm not going to do so in reviews.

Fair enough.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

