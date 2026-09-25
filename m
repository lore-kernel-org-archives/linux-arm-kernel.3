Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D47C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbnszAl0K2VzxzoSrqdeRmwXSjuXaYSQ8xFcW+B2Iio=; b=ZVquWUUn2b9cv3VAP2KMgoqNYW
	xoX0lDODM4JmluSzKQtncxNhlOzGns1wbx0oJ6MsFJ2c428xAejWFOJX9SpcBwF2rCKM7BS/Kwr7e
	yI4m3rK1RAOw4NOMw1W2BcbItw5k//JrAkmBlKI/t/iSGyWTXiwXpO0aTykaHf6PcpfTBS/WF2lW5
	zupK+WGdAD/r+fzENEv4SG3on3Ork0HwtydKFji/LiRXBbF/jgGtuHKaiii30B6Cp+UNcJYGIuN0g
	wq7gzh9kIz2NN4ekY5AdXMEiaV6V6GS1aIhZTbjEqwOMcK7jZb37/RS8Rz/FTyUlWsrNBxRkF+oQW
	8aVokhgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5VK-0000000DNh8-3wwR;
	Fri, 25 Sep 2026 12:58:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5VI-0000000DNgl-3B4r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:58:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EFD1260136;
	Fri, 25 Sep 2026 12:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A961A1F000FF;
	Fri, 25 Sep 2026 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341095;
	bh=jbnszAl0K2VzxzoSrqdeRmwXSjuXaYSQ8xFcW+B2Iio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UbmABMCD3NJD18sg93yx8jrXsuUaIDW5mnrEVLTg6fzvCRXCnallCKU/aHKc5Ujl1
	 I0vVx09yYduB7rxp1XMEkWSATP3Hr91gCvaUbQVzA6YRrqzVzcpW/2mZeZdO/NaN61
	 /Ans4jXN/JZUSgJU9zX/4auRYKLjRb9rkc+U7MUBZD+JSbsP16pCy9+MI19foMDerf
	 RI9aFat4ufgdX2dLBvZpCR85hUow+beiMf3AWGSmKCslac+6pkbCfRJF4A7L+KvrmQ
	 VOI/0qY2BpPUJVRWTbO4abBg81p80fQDim3OHWxCLzlGQgcyg2WZ0wFZ74pqkLq6nA
	 YBVlqyXBNL4vA==
Date: Fri, 25 Sep 2026 14:58:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin <STLin2@winbond.com>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Jacky Huang <ychuang570808@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: nuvoton: ma35d1: Add missing WDT/WWDT parent
 clocks
Message-ID: <20260925-skinny-husky-of-cookies-4aaddb@quoll>
References: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
 <20260921-perso-ma35d1-upstream-clk-v2-1-209fd32a8b00@bootlin.com>
 <20260924-bald-awesome-griffin-7d1d5b@quoll>
 <87jyo9ljlo.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87jyo9ljlo.fsf@bootlin.com>
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

On Fri, Sep 25, 2026 at 12:18:43PM +0200, Miquel Raynal wrote:
> Hello Krzysztof,
> 
> >> Reported-by: Jacky Huang <ychuang570808@gmail.com>
> >> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
> >> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
> >> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >> ---
> >>  drivers/clk/nuvoton/clk-ma35d1.c               | 2 ++
> >>  include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 4 +++-
> >
> > Please do not combine patches.
> 
> I thought splitting these changes would not make sense in this (= a fix)
> case, but fine.
> 
> [...]
> 
> >> @@ -248,6 +248,8 @@
> >>  #define ADC_GATE	233
> >>  #define EADC_DIV	234
> >>  #define EADC_GATE	235
> >> -#define	CLK_MAX_IDX	236
> >> +#define PCLK3_DIV4096	236
> >> +#define PCLK4_DIV4096	237
> >> +#define	CLK_MAX_IDX	238
> >
> > This cannot be updated. If it has to, then not a binding and should be
> > first dropped from the bindings like we did for most of the platforms
> > having similar issue.
> 
> When you say "This cannot be updated", do we agree that you mean
> "CLK_MAX_IDX cannot be updated"?

Yes, the MAX ID.

> 
> I'm not sure I fully understand the reasoning behind, because the whole
> point of defining this CLK_MAX_IDX value is to let drivers know the
> number of clocks, so it must obviously follow the updates in this
> file. I cannot just drop it, the driver does not work without it. If we

It's not a binding if it has to change, because bindings should not
change - otherwise they break its users, because  since it is ABI there
is an outside user expecting EXACTLY this number of clocks and it cannot
grow. Obviously, this is not a binding just like FOR EVERY other case so
can be safely dropped.

> enlarge that number, what is the problem as long as we keep the other
> numbers identical?
> 
> Maybe one way to fix that mess is to:
> 1- Add the 2 new values (238 and 239) + a new define:
>    NUVOTON_MA35D1_MAX_IDX 240
>    238 would then have two definitions for a short period of time.
> 2- Replace CLK_MAX_IDX by NUVOTON_MA35D1_MAX_IDX in the driver
> 3- Drop CLK_MAX_IDX in the bindings.

Why we can't fix it like we did everywhere else?
git lg -- include/dt-bindings/clock/
and search for "number" which leads to recent commits like
d10f26a7abbd3dd5d59bac1acdca117385b54ea9
but there was same work for Samsung and many others (Renesas, maybe
NXP?). You add define to the driver, then drop it from the binding. Can
be a few commits like we did for many cases, but recent change from
Linus I think went acked while combined binding and driver.

Best regards,
Krzysztof


