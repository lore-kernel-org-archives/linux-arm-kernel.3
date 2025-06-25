Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19670C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 00:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaxKHsOCCkFJP1JTrhCFkECGGO9/mDrfQtblfOWj0D0=; b=ZuslB/NFGuVZY4PIQ+jRuSjuyH
	LbwbcVowrHFYDUESWIRCXBVI6P8LwA/pydfkdycx4DbONW3PlH2eD3vOfk2KkEDt1LQ89HgS0StBJ
	G2gfmvlxG1URXcasSHBugEblSEWqsZ47FoKaH4y0JuZhmQo+jxWxJzJtSiDyfyTLA12j5YH3LSxQa
	SaHqucsUPQeaczhAVNAPpNeO+CF2RmIVLaHud8ombFQVKZM3oMQjVX0l4AKIWg+hGM52cwmvq0fkL
	6mig9mDu0quWgOueTDHkY0NiBgzVieIor653Qv3Z/yYE4IHw9bixl8IM0q/Yr1cHqAPssshEeMpbt
	8EWx0P/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDzB-00000007BGi-39X5;
	Wed, 25 Jun 2025 00:27:33 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDvc-00000007B2j-1eLE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 00:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750811030;
	bh=IaxKHsOCCkFJP1JTrhCFkECGGO9/mDrfQtblfOWj0D0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=cDDz7fOFVlUU6Uk3tacvXkgeKSfxIHBnd+oWOKCdAwg8l1RoBcD1khUjz34JcRW4l
	 H8gXCTEotx2mw8LzKxJItQGwO7iZ6YkqzGmrB3lR2IkgnrsvvqOVRs+yfrPULr1pS3
	 cC++zBX92UY3hcHr41x82OAkibXwE1D/IQdQu/ymZp8EwQjreAApEYXNKIM3wlp7x6
	 NF59T3ZUE7j0HRjpLjTR6KDq+kw6dBQl5qUXHQMcQhinfMM9L/eV2dd5Law0fZ0xaW
	 K1G2h+6hrCDLjLK3X7p/CNvSnuzLai8y5jxwKPYI2jM23D9nTktayjnWpC1+PDod3/
	 xoitdOtzz6xSg==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1CD7E640A1;
	Wed, 25 Jun 2025 08:23:48 +0800 (AWST)
Message-ID: <79c9328e2b50a3054d72d06c89e63ebd3cf3b808.camel@codeconstruct.com.au>
Subject: Re: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "ulf.hansson@linaro.org"
 <ulf.hansson@linaro.org>,  "joel@jms.id.au" <joel@jms.id.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 25 Jun 2025 09:53:47 +0930
In-Reply-To: <TYSPR06MB70680E58607C02FF030168E7957BA@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-8-cool_lee@aspeedtech.com>
	 <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
	 <SEYPR06MB7072FC07B4EFC03BB25B537F957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
	 <c41c3dfc38c1adc5d544e365de355579d42f90b5.camel@codeconstruct.com.au>
	 <TYSPR06MB70680E58607C02FF030168E7957BA@TYSPR06MB7068.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_172352_623204_AB054D0B 
X-CRM114-Status: GOOD (  26.53  )
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

On Wed, 2025-06-25 at 00:22 +0000, Cool Lee wrote:
>=20
> > >=20
> > > > > The timing phase is no more needed since the auto tuning is
> > > > > applied.
> > > > >=20
> > > >=20
> > > > I feel this is unwise: we're now ignoring constraints set in
> > > > the
> > > > devicetree.
> > > > Auto-tuning is fine, but I think that should be a feature that
> > > > new
> > > > platforms can exploit by default. Older platforms that do
> > > > specify
> > > > the phase values via the devicetree can be converted at the
> > > > leisure
> > > > of their maintainers (by removing the phase properties).
> > > >=20
> > > > Support needs to remain in the driver until there are no
> > > > (aspeed-
> > > > based)
> > > > devicetrees specifying the phases.
> > > The timing phase only works on AST2600 or newer platform which
> > > has
> > > added a delay cell in the RTL.
> > > The older platform AST2500, AST2400 doesn't support the timing
> > > phase.
> > > It supposed no effect on older platform.
> > > The old manner that a static timing value customized from
> > > devicetree
> > > is inconvenient because customer needs to check waveform
> > > associated
> > > with each delay taps. Once the emmc parts changed, a fixed timing
> > > value may not work. That's why auto tune here instead of a static
> > > value.
> >=20
> > Sure, I understand that auto-tuning is more convenient, but in my
> > view, there's
> > no reason to remove support for static phase values for now. On the
> > contrary,
> > switching entirely to auto-tuning risks regressions for existing
> > platforms that
> > do specify static values.
> >=20
> > Can you please drop the patch for now? We can revisit removing
> > static value
> > support in the future.
>=20
> Ok, I got your point. I can make a new patch to keep static and
> dynamic both together. If the timing property kept then use it,
> otherwise try dynamic tuning. Is this OK?

Yep, that's what I'm after.

Thanks,

Andrew

