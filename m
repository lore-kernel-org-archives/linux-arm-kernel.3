Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF1AC02181
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 00:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJxSdF+ippwIC6XI/C+Xi0d6LwEaPE0DjeKquATVttA=; b=X8e9IzKIUtXZrbz7nY5kOFsplW
	m1rkBynIEyYOElxQMjk4hXD+0NqTTMmFXFHRtYsNwGWrZi32UQNRmUuepntuDMEr5Y547m2t8R1So
	Ho9TOLtN1KVqqyg6/11lrAozc0az3LwQ7MYU13HOzULvrwHWhn+WdKKtWsLllbYRyg5GVbhEuPBIR
	bKXmXFpPwJmMtA0AQIj65fuae5q8bc+k2sdd9ibnb7Eo1ecY0ozgzC78aOzNE8JzeFePxB/KpZaqH
	O4FuyVbn7G0Gt3aCxHco+4IL7mBKys+mMmEdGTUKTcIcVzGWZNNL6Oy1rYUsyRp2YAef/ikpwLEBR
	8Wc4bA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1talYf-0000000BU3H-0RP3;
	Thu, 23 Jan 2025 00:58:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1talXJ-0000000BTs4-3uJL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 00:57:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 496C01007;
	Wed, 22 Jan 2025 16:57:56 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D12C03F66E;
	Wed, 22 Jan 2025 16:57:25 -0800 (PST)
Date: Thu, 23 Jan 2025 00:55:56 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Anastasia Belova <abelova@astralinux.ru>, Emilio =?UTF-8?B?TMOzcGV6?=
 <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Message-ID: <20250123005556.57b2331d@minigeek.lan>
In-Reply-To: <20250122225805.2ba6a062@pumpkin>
References: <20250120084719.63116-1-abelova@astralinux.ru>
	<20250122225805.2ba6a062@pumpkin>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_165734_067517_9E849D26 
X-CRM114-Status: GOOD (  29.08  )
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

On Wed, 22 Jan 2025 22:58:05 +0000
David Laight <david.laight.linux@gmail.com> wrote:

Hi,

please note that this is all practically irrelevant:
- PLL4 is PLL_PERIPH0, which is meant to be fixed to 960MHz. Linux
  would not change this frequency.
- the Allwinner A80 is both old and quite rare/obscure: the most
  prominent board (Cubieboard4) was broken for a while and nobody
  noticed
- this "allwinner,sun9i-a80-pll4-clk" clock is not used by any DT
  in the kernel, so it's effectively dead code

But just for sports:

> On Mon, 20 Jan 2025 11:47:16 +0300
> Anastasia Belova <abelova@astralinux.ru> wrote:
> 
> > If n = 255, the result of multiplication of n and 24000000
> > may not fit int type. Add explicit casting to prevent overflow.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.  
> 
> You need to read and understand the code before writing any patches.
> The '>> p' and '/ (m + 1)' are both just conditional 'divide by 2'.
> So can be done before the multiply.

Well, normally you would try to multiply first, then divide, to avoid
losing precision. In this case it's fine, since it's just dividing by 2
or 4, and 24E6 is dividable by both, so no loss. But the formula in the
data sheet is written as "24MHz*N/(Input_div+1)/(Output_div+1)", which
matches the code (somewhat).
So I think it's indeed better to divide first here, to avoid using
heavy library based 64-bit mul/div algorithms, just for this one corner
case, but it would need a comment, to point to the problem and avoid
people "fixing it back".

> Since req->rate is 'signed long' and the value is a frequency it is

struct factors_request.rate is "unsigned long"

> only just possible that it exceeds 31 bits (and will be wrong on 32bit
> builds - but sun-9 might be 64bit only?)

The A80 has Cortex-A7 cores, so it's 32-bit only. The SoC can address
more than 4GB, but that's not relevant here.
 
> In any case it would be sensible to force an unsigned divide.
> So perhaps:
> 	unsigned int n = DIV_ROUND_UP(req->rate, 6000000ul);
> 	...
> 	req->rate = ((24000000ul >> p) / (m + 1)) * n;

Yeah, I don't think we need the "long" qualifier, but this looks like
indeed the best solution, just with an added comment. And we probably
want to change the type of "p" and "m" to u8 on the way, to match the
struct and make them unsigned as well.

Cheers,
Andre
 

> 
> David
> 
> > 
> > Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> > Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> > ---
> >  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> > index d93c7a53c6c0..70fbd7390d96 100644
> > --- a/drivers/clk/sunxi/clk-sun9i-core.c
> > +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> > @@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
> >  	else if (n < 12)
> >  		n = 12;
> >  
> > -	req->rate = ((24000000 * n) >> p) / (m + 1);
> > +	req->rate = ((24000000ULL * n) >> p) / (m + 1);
> >  	req->n = n;
> >  	req->m = m;
> >  	req->p = p;  
> 
> 


