Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D7FD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6FXAJgkkzG4zg/OhYkDtMBzoiFKim//OBB3h/UAam8=; b=C/j5ihQSo7IjlZfK3OD6k33MRs
	/ZdRalkucnkUdH2hBSD6ivLCWTox/GNaoT7hHmD8iT0bCWfEBZe5slYVrhRW12nzK4XGz4tU80XEr
	yXW3l8GajmDM/YAmZxxfO+K5PjRo5hQnKgof4PEeq7Pvf7vHL2mTSQwBHtae/GwVzGmAmMumkZ3vS
	EitadwtqMzZ42tmHiCNWmIhF6FBCkwxRxt9YyjCACcbDZx6WiMcJdWNXkmyHUvH0ySggy0qQA3l2i
	ruxNGwfx6yUJAIshgbYdxYN23acu1Gc2a+xlKrsbnPh0RsmeUN26IKq4/W4TOPPcmiRCYrBLJRHle
	B/rtd5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObxV-0000000Gf6O-1p3K;
	Thu, 27 Nov 2025 13:22:53 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObxS-0000000Gf5v-3wsP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:22:52 +0000
Received: from martin by akranes.kaiser.cx with local (Exim 4.96)
	(envelope-from <martin@akranes.kaiser.cx>)
	id 1vObxC-0007Pt-0N;
	Thu, 27 Nov 2025 14:22:34 +0100
Date: Thu, 27 Nov 2025 14:22:34 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
Message-ID: <aShQmqUfT5OQFf0N@akranes.kaiser.cx>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
 <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
 <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_052251_009720_489D44FB 
X-CRM114-Status: GOOD (  23.05  )
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

Hi Geert,

Thus wrote Geert Uytterhoeven (geert@linux-m68k.org):

> Hi Martin,

> On Wed, 26 Nov 2025 at 21:30, Martin Kaiser <martin@kaiser.cx> wrote:
> > Thus wrote Jean-Michel Hautbois via B4 Relay (devnull+jeanmichel.hautbois.yoseli.org@kernel.org):

> > > From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

> > > Change devm_clk_get() to devm_clk_get_optional() to support platforms
> > > where the RNG clock is always enabled and not exposed via the clock
> > > framework (such as ColdFire MCF54418).

> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > > ---
> > >  drivers/char/hw_random/imx-rngc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)

> > > diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> > > index 241664a9b5d9..d6a847e48339 100644
> > > --- a/drivers/char/hw_random/imx-rngc.c
> > > +++ b/drivers/char/hw_random/imx-rngc.c
> > > @@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
> > >       if (IS_ERR(rngc->base))
> > >               return PTR_ERR(rngc->base);

> > > -     rngc->clk = devm_clk_get(&pdev->dev, NULL);
> > > +     rngc->clk = devm_clk_get_optional(&pdev->dev, NULL);
> > >       if (IS_ERR(rngc->clk))
> > >               return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");

> > The clock is not optional on a standard imx25 system. If it's missing in the
> > device tree, the rngb will not work and we should not load the driver.

> As the clocks property is marked required in
> Documentation/devicetree/bindings/rng/imx-rng.yaml, "make dtbs_check"
> should flag a missing clock.

> > Should we call devm_clk_get or devm_clk_get_optional, depending on the
> > detected device?

> That can quickly lead to complex code.  Nowadays it is fine to rely on
> "make dtbs_check" for some part of the validation.

ok, understood. With this clarification, I'm happy with the patch.

Reviewed-by: Martin Kaiser <martin@kaiser.cx>

Thanks,
Martin

