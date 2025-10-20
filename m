Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8BACCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=; b=eKVnW+L0SZG7SyZy/hEx2jBmWi
	iJwRQbBDUkNDZ/6ONfRxN9QIYByIEFZ5UxozqaaWsVMZHGOvDKkwY4kocWWyRd/zjdYzZjZU9151I
	nner83uluPotI23RQyxl1Tso0iDQTP7/eTEZM1og/I59QRTqGzZA3p1B2k7C6Wc+Rh2eMv1JLl0Uc
	t9g1Vu9gkiiVJuPfsVUACexRXCWmVnobHsicd36U6gmt8jAOt4zbGLtlPemTz2ZvzEH6l587rWLSI
	/6dDUf/wbb1eT/RS5zCryKR535SBRvN8HsddsqbbMSnFk/x3kq6n/TS/JYNY7LTw5BdCv/1Ag/ucd
	IBdQ81og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxXK-0000000F7AV-1wqL;
	Mon, 20 Oct 2025 21:35:26 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxXI-0000000F79a-2JOv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 21:35:25 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-784966ad073so20732017b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760996123; x=1761600923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
        b=XOVvlSYsYxbULaHIMHnf1VEmM0xR2DLJXtp7kd1hSohcjprn+M0u/t3xDiDzJjzUtc
         7v9sUpXWMhzBViczyZTCwX+d9KaJuu5Dnvwn6aRYyJCGv9+bse43eWlW1sh4shhWX0bZ
         PnMHfuVZtRGBufBNk/JRwljLyR6I5rplxW5XXwZKxHGl3v5Pm/Oq5YY6r6HocCDK+uS1
         MsO4r9fkl+uraoBDTKVsnyZvIzW1akur6JLZa9Z2/YlS6XWbjVDeNQdk8EMUStDquehg
         1F/TZlgL94lYZSMeav5YmgMKcGLsKPC40N7LEOL1YWPPMSGz/iNX2l9t21jPwa/nLeik
         UtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760996123; x=1761600923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
        b=vbi1Qu6MjVlAn0OF1PckUwS+MDnP8T2pbp4OrkKQDyvIPOXxI8AIswQFbOjtABAIUJ
         Owmya3GqKXmid6kTVau4+TPA4eBp+uKZBHnYgB6ec8g48VpEGZ+3xHep/2IsMHEMyqhW
         tRvX7ZoGFCXBTaQufJpcGc2gLFHxpR1U61zdyDPUHnN8N6/MJrRc3qPnE6GHcwipOcRO
         lLjIeFU4ewNrVojuTTmonoYygSvZZEnZCdpFgvGQ38+dgTLjQtQKM9gzS0kNKX0HT6ES
         NhHc99uT0KkIrBC3mgWOt7dQZMCXkdGWRR8t3sREJvJu9Ah2iy86lJiKbRYyZ2+hfqtP
         cQHA==
X-Forwarded-Encrypted: i=1; AJvYcCWCTS3utX1JVDbsDYRu/Jyg8UzbLZ0qn0BUhvDUU4JKXrymYhO7CapnLvJPnD5E2ZbXcAvM0ezL2OOo3ClSD636@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6mQk8vdoXde3tav+9+tzmGppUbCiZnoKhRh10DMuD2ZtR8dqU
	GWI2EjF+B36RDb6LmiUfBh8yR09I4hts8j2be0bCKFWZ52L11cek27V/bWTIkft/ZyB94UZPmXl
	CoHKf9HErRC0qZJCSS5P4ZkkcPygnUv1Rl9ccRN5HLg==
X-Gm-Gg: ASbGncs0oTKAU6qKfGGIJcoo711zhL4baYLOQcwnCul1d72ZQZBrkWZ9BXNCzX5D7nC
	KqpaUJosG5+Ufx9vLkTZLPqMSaT4Tkv6vs3hPLuAB1OfMbmk07oES351kzvYQm86AOwJHE+FY/p
	++j5G+q4US52XHkZIunvOhwwK0tmDChk4j2sO09FUUMul9oBnwj1RzXoO743xP/r3QRYwyud/jC
	I/ET02N0fzVfi3+3xYr5J8yNrEOlvDLWbJ6wC0JF/j3YmPQZO8k6SlLNp0R4yOtgj/ip4M=
X-Google-Smtp-Source: AGHT+IHcbLV8sjcTUSW/kYKLFIDfgxSVgbG/hCotLfs+E1Yurw11PQwO89zUraRAtmdIvysGYrHzIqa+Gk+I+qbLfMk=
X-Received: by 2002:a05:690e:408b:b0:63e:221e:bd38 with SMTP id
 956f58d0204a3-63e221ebe30mr9755360d50.64.1760996123201; Mon, 20 Oct 2025
 14:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:35:10 +0200
X-Gm-Features: AS18NWBAzh5HU2QEiT3WGw7lWd7_MVL73oGUD23tlLIja0Rs_422Nhq3kpTmHsU
Message-ID: <CACRpkdZFXxBY2AopX2bgFGE_nhXmV3YirfRwuo4L6qWzzAC4rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
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
X-CRM114-CacheID: sfid-20251020_143524_591953_3ED2E478 
X-CRM114-Status: GOOD (  10.98  )
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

On Thu, Oct 16, 2025 at 1:20=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

