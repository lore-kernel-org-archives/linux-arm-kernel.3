Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3652FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjr9YRqSTqtgmJiKQ524agy+ATb2FxOdcZqgwssjAqI=; b=r/jZulU417yXBJIpxHIjCKXaqK
	PWJ7wwMTFoDceg8bZl3csmU+FssJH9t3v0Xp1VUd04wQO6Aic/X4IeX2w1oUzij1K4cib8APAsl7R
	/zBZaNQFO/u/A7OdNcq+mhG9iq4egbbNsViJTqLwjpZLlGqI9YWMja+P+fK0ej5SBY6akqNd4cSck
	TPtw+XC7CS0er4qivc+XTq5no4++pMsQTnBHfACniTPGdNr2jKMrq5BvvRUuEZX9l9I8eTlC8lfdX
	0esbwU/MiodeXwLB0sij8qIdHwTcdDOipGE3Ns4IhEYApFABkC196AhAHvq/Cu3/AfC1YJULNgAj2
	Ckb08/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QVX-00000005MNm-1YRb;
	Thu, 16 Oct 2025 16:07:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QVU-00000005MMK-2Bhf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ABF94A8CB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 16:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C65AC116B1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630832;
	bh=Vjr9YRqSTqtgmJiKQ524agy+ATb2FxOdcZqgwssjAqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gjyQeO98N1+v0/URF99aBx/z8ZAnq3UKJU6NpkHELvJ36uYHKt4lmPSs2QAE7FwK+
	 sewCJPl1cr7l5be78bRAxqri000zxK/EScX2JQ4xjThRc2kWtT0iBOS8j7tNAtA1b4
	 AWxXUOSPYz+mlUwXNsp+ICUAZ0QVoFFE+0Gc8jKJViSdnewsKNdgQrc+FUoI8KRhh1
	 sZEMf3sD4TloKq3mUdm/gFjbgzvkP0kNKv+5VnwJF9aValAdVhO3KchYbLuFfnnZ/+
	 4K1T+NoBtsRDAT4pT6/Y6moRm2OCwGopIWsb8cSXjpwfjEFu1CAoJX2UfvPbIkz69R
	 nrLQqyrkx090g==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso162975466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 09:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeNck0Q/EbuxSc0MFORpPWpGppexTGRqY4YVW5782R/JsZ72+hnq9xnck1CcGgnBAX2x8uBYFHmC8gRTmuXnEi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb2lU0wnX06iCYQyMauF71aobH83dyA7gR157FxY3DieDg7flp
	pl2DdDE8CadyMXhZ7jGoEJjU2lGE23kpbeTKpNnI0qevf46bNnb2+bGYS1MoABd9lW8ATz3WVhU
	STyL6Fmvpaa9OIXply6oEXywTILJdiA==
X-Google-Smtp-Source: AGHT+IEwUNFtjfemC+H8YbxetDx+/1UO/8iQ2gyCTnZPC0wHrc6i2JvE1D+ajYJoJm5ZfKz4z3qtGvXJ7TTBCQJq2aU=
X-Received: by 2002:a17:907:1c85:b0:b3e:5f20:888d with SMTP id
 a640c23a62f3a-b647304516amr61378866b.27.1760630830062; Thu, 16 Oct 2025
 09:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org> <aPERZ/IpjAhD2sen@lizhi-Precision-Tower-5810>
In-Reply-To: <aPERZ/IpjAhD2sen@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Oct 2025 11:06:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCCBHp6vMvXdh39hpdiMg-3Kr3uB7KMFauCfYM7rYSWQ@mail.gmail.com>
X-Gm-Features: AS18NWCmaqStDDMgrLFaOkte03G1gDmgUst_qjRWdTXsAn_QVmilmfjOPWrs-c4
Message-ID: <CAL_JsqJCCBHp6vMvXdh39hpdiMg-3Kr3uB7KMFauCfYM7rYSWQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: Frank Li <Frank.li@nxp.com>
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
X-CRM114-CacheID: sfid-20251016_090712_589169_AFD4460B 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, Oct 16, 2025 at 10:38=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Oct 15, 2025 at 06:16:24PM -0500, Rob Herring (Arm) wrote:
> > yamllint has gained a new check which checks for inconsistent quoting
> > (mixed " and ' quotes within a file). Fix all the cases yamllint found
> > so we can enable the check (once the check is in a release). Use
> > whichever quoting is dominate in the file.
>
> Can we simple require only use one of " or ' to let everyone follow easil=
y?
> support both " or ' is unneccessary options.

I don't really care to fix 915 files. And don't send 100s of patches
for me to review either. Given we've got 5200 total, it's a good
chance folks will copy the preferred style.

Rob

