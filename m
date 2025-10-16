Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DD9CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd9DhXGFTz7VluvF3CXaOYryMfT47ujx56ubcyYXsIw=; b=MrLcdqUYRe3oCaDZeeQeWXzX7D
	V658G+QCqzWP0MsioHdNT9UapGbO8VOR+wnEAgr8Alswc8N6JGis8iOUEp/FNCnor9hpsScwcRYiu
	W756DX1z+97170l6TglL/sn4fOEBJHcVLrSvgDsEXHl4PPI2TXFPt/TIVTi9WMluVaiMhqbY/4yJG
	I5fyZpAGUDhJcHllgIMYBJLosv6Wsut6SMwdg/VBRaIpaMPvgMQnNN5nkT971soVEWXsIYiyMOoAG
	pM6m508HQxweNQKYvN46MDrNV6yOScdrqnBW5LsMw9vfYBv8jUbGkEzd3EOdroPUpXHXCkKJnQx7b
	wyxWG6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IxD-00000003qvj-3ocx;
	Thu, 16 Oct 2025 08:03:19 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IxB-00000003quL-2kQg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:03:18 +0000
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-796fe71deecso6282366d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601796; x=1761206596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd9DhXGFTz7VluvF3CXaOYryMfT47ujx56ubcyYXsIw=;
        b=F8/+vo9WUA0ODDHBjZvKTc73Vp63eOqNl8uR2uAk9fkGypt5inT4pLWE9C+pQI1kmD
         RMzFvgrK2zLoeJNV9LY1CDuApSZDRgt6d9i1z3m7gba6P0RLtgQhoMbMB6bAUWhyeFhu
         mJnVlBk/a1hW171IbMlhVTJD/8XFIKR5LAcBmHm3DBqOkxhsSv2KPELwPnYyNBzhq2GA
         Qwrkc3/D+Y4VNmwaa4Icapk6V6G4YpaUHjX0IdEm/HLWMc8m19/2PkmKRFfZEHfqdPZS
         KzMyMBtCu9zUrLQpTfySGnGqGT0+K2QyzzKVtrHCNpeHTO4XYvuYxSZ39rguxTZeDM4w
         pk2g==
X-Forwarded-Encrypted: i=1; AJvYcCV/kQ85GOmh7ouyo3bofl90d3AgDnGXI21u0wCOrBzLTurj8d6pxMWn/dV2C0M+ZyZhUuTUmkG0D0r+2nZJDMzE@lists.infradead.org
X-Gm-Message-State: AOJu0YzcSy5kflxxBSBebtyWiBbesDe9EezngjhJkuoqUVAxAHzaosuv
	1fPXdsNL7HeAmly8nhqq2psV+xcqDYfZmMoUC+xq04OIutMb1LlDfp75qm5Bbdv5
X-Gm-Gg: ASbGncsVAk6eyWqBa2It4Eoc+1rY/mRYLEMgkc0AbLwsk9cUVc9h4zqhKYpAdj9tApx
	mqdbsx9v7qCFCWhmOccba19xmGv3ffx5COO95f1NEg5rwxoPfIrCc821OfamDgRLcQDG8/ZIzOP
	m9cJ58NJ89l9LE1F61tb8cie/a3vz/ixn1+8XGDPrKCFZ2HojZMbMyF84O9lzidEcxcygs/jAPY
	0MqvJOGfqqqNZ7zKYpdwB7nIxbTtER0OyzIBJ54PSo8w6pVS8xWY/LxDRofQbp2/oX+8x7YAUCh
	T1xxeaq9pLv7jzViQ0KnVkDSQRYzSgz4awJbgnvdPaD/SW7szHmzWOJ4jL5YDZIqotBOZ/9+tiE
	0+ehI2Q3eMmlvUhZOR5BFvOT2EuT00GETX1HA2m0emix+ZEerlitggItCqnNwM9dEwhLAuEwsZv
	t6//oOvJQtDs1fM2aAR9WTgdXbnk9idvhWHXjaPg==
X-Google-Smtp-Source: AGHT+IHlpxfp7Hik/tvjZCv6AhsxEgPe/UdvpOOmadcd8FJOyAchs7j+UY9OACHp7YMChhJ0vf0yfA==
X-Received: by 2002:a05:6214:4b07:b0:87c:176d:b464 with SMTP id 6a1803df08f44-87c176db55bmr8312566d6.8.1760601795949;
        Thu, 16 Oct 2025 01:03:15 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0120ca24sm35147356d6.6.2025.10.16.01.03.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:03:15 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-796fe71deecso6282176d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:03:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBVj0IAEMyYB09xcWRf7ucSHYnALZ1t7TVwOJOC0HDIV9d1B26zkIzHMfwpAV+smKPW/2ZFSpoCgXC48T0Cw3T@lists.infradead.org
X-Received: by 2002:a05:6102:512a:b0:519:534a:6c20 with SMTP id
 ada2fe7eead31-5d5e23afcd1mr10705349137.30.1760601430958; Thu, 16 Oct 2025
 00:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 09:56:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
X-Gm-Features: AS18NWDjBoTWi0arzS-uHQaIyzTZ8PYUb4ECqZaEUF0sSO-4JEe-m7M7qjhxsvY
Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_010317_693897_B7EFD66F 
X-CRM114-Status: GOOD (  23.61  )
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

On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote:
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Since you are mentioning mixed quotes, is one or the other preferred?
Shouldn't we try to be consistent across all files?

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -129,7 +129,7 @@ additionalProperties:
>
>      - type: object
>        additionalProperties:
> -        $ref: "#/additionalProperties/anyOf/0"
> +        $ref: '#/additionalProperties/anyOf/0'
>
>  examples:
>    - |
> @@ -190,7 +190,7 @@ examples:
>
>              sdhi0_pins: sd0 {
>                      groups = "sdhi0_data4", "sdhi0_ctrl";
> -                    function = "sdhi0";
> +                    function = "sdhi0';

Huh?

>                      power-source = <3300>;
>              };
>      };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

