Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9D2CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 21:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTIfa56JwSsNTBVIbymmQSEjsR106p+YKsLezXG9tC4=; b=3v92f8xFKuTIPDM4DX6NHB6bil
	4drNCVy9FUNPucXUmtIPRkF/A+gDWChTUJtzd+IInORDvVJQzThb7joiMuMOnblNUc0WSj86I5pk/
	keT9KDnEHLqNm31Kv2cONyyPV5V+6e255OFWEBceFHjkSvWwgVGhtme3PNlJUDXUG4VXXJ6LYXaTQ
	XM1MguO8233Lp1NI1zmq4R+uRO+jnC8mUc/KKi7/5kDFUzT5EdNayiuE1flId2ZjPdTO0Knh2lCaN
	awEjiMB4u8gAjO3Au2xjd+nW3ViG3rZfDaxskgVcDIa7sLkdLQ1uvmucP/eo+cKmyHVnIpo5C0NOf
	aorCzvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsT5-0000000DJ3b-20M5;
	Sun, 14 Jun 2026 21:34:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsT4-0000000DJ3I-30iG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 21:34:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD0E160132;
	Sun, 14 Jun 2026 21:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDFD1F000E9;
	Sun, 14 Jun 2026 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781472849;
	bh=oTIfa56JwSsNTBVIbymmQSEjsR106p+YKsLezXG9tC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nqo82Z5JkWSQ7WUOkIIz1dQyqFiGpYf9EZzbmruEuxCSzI/VJ+lMRpy7+OoM7iVfD
	 1+xn2/HL6kJ5JTZXBVg5os2UFQaTCXidQk5ZRl1zWdLY9T9rhD6J9rAWiMJyf9vdRH
	 l6KRoi+n4RCMG0XJIBiAXc8kvthybe1p7TubbayIt5H0+VNRYw1XKCWwgFoL8oVsKw
	 zbNGUCjprsRcMC/nuGZXR5eQu5aHohTWbUsXdt9gDmYm/UyyTUIkIVHGwY3q3Pm1TH
	 hTMMT20V+L9rCdsJ/ZYPG5TZP1LnWKNlU2upyXWk1ERpkNzsLDinSmDr9+zEwcb9oo
	 9ObEW4F6FMs6Q==
Date: Sun, 14 Jun 2026 23:34:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Guillermo =?utf-8?Q?Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stm32f7: truncate clock period instead of rounding
 it
Message-ID: <ai8eGsfJN_IgJd2-@zenone.zhora.eu>
References: <20260611104857.242153-1-guille.rodriguez@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611104857.242153-1-guille.rodriguez@gmail.com>
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

Pierre-Yves,

any thought on this?

Andi

On Thu, Jun 11, 2026 at 12:48:56PM +0200, Guillermo Rodríguez wrote:
> stm32f7_i2c_compute_timing() derives the I2C clock source period
> (i2cclk) with DIV_ROUND_CLOSEST, which may round it up. When the
> period is overestimated, all timings computed from it (SCLDEL,
> SDADEL, SCLL, SCLH) come out shorter on the wire than calculated,
> and the resulting bus rate can exceed the requested speed, violating
> the I2C specification minimums for tLOW and tHIGH.
> 
> For example, with a 104.45 MHz clock source (e.g. PCLK1, the
> reset-default I2C clock source on STM32MP1), i2cclk is rounded from
> 9.574 ns up to 10 ns. Requesting a 400 kHz fast mode bus with
> 72/27 ns rise/fall times and no analog/digital filters then produces
> an actual bus rate of 415.6 kHz with tLOW = 1254 ns, violating both
> the 400 kHz maximum rate and the 1300 ns tLOW minimum of the
> specification.
> 
> Truncate the period instead, so that it can only be underestimated.
> The error then falls on the safe side: the programmed timings come
> out slightly longer than computed and the bus runs marginally below
> the target rate (375.3 kHz in the example above) while meeting the
> specification.
> 
> i2cbus is left rounded-to-closest: it is only used as the target of
> the clk_error comparison and is never multiplied into the programmed
> timings, so nearest rounding remains accurate there.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 53d9df70ebe4..6439620d6bed 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -464,8 +464,13 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  {
>  	struct stm32f7_i2c_spec *specs;
>  	u32 p_prev = STM32F7_PRESC_MAX;
> -	u32 i2cclk = DIV_ROUND_CLOSEST(NSEC_PER_SEC,
> -				       setup->clock_src);
> +	/*
> +	 * Truncate instead of rounding to closest: if the clock period is
> +	 * overestimated, the computed SCL timings will come out shorter on
> +	 * the wire, which can push the bus above the target rate and below
> +	 * the spec's tLOW/tHIGH minimums.
> +	 */
> +	u32 i2cclk = NSEC_PER_SEC / setup->clock_src;
>  	u32 i2cbus = DIV_ROUND_CLOSEST(NSEC_PER_SEC,
>  				       setup->speed_freq);
>  	u32 clk_error_prev = i2cbus;
> -- 
> 2.25.1
> 

