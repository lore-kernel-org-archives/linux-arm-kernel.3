Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785F9C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBCRchsp1sI03Um1rqvmQqGg1HFVn6OU3UOiqPFqQvc=; b=upsX18j8unvqCVndNEuUCl86hs
	AxP5x9//8otAX6FrdFoJNRt3Y3EJo1FwuO81LocvGC4dwLJFuzRbPM/cEJWjJmS2D559JmjmTc+q1
	lauB4+HfMcQ3c3AhFsulC65Vdea8cgAYHcWwNjyCoZx4qViCG+/G2MNr7Ymprx7HYbvLa775e20io
	SK8GZQVyx2wg3d0LA34aZhg9qhu33ojCxIqX3zvxLfZXgQfRSV30T02CzKVPRzpNFl4mAXTkyfQtA
	5pajRY4gkmdXo6xjMfgU8wfoLseOZhLfIXxBM+vTUYt8kHrgSqwcJFuQ+JbM+RyK0Upx39FDvjqun
	eRG/s6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAu4a-0000000Gj6k-3szs;
	Sun, 27 Sep 2026 18:58:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAu4Z-0000000Gj6c-120u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:58:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A08F60052;
	Sun, 27 Sep 2026 18:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117261F000FF;
	Sun, 27 Sep 2026 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790535480;
	bh=sBCRchsp1sI03Um1rqvmQqGg1HFVn6OU3UOiqPFqQvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CYSYylrnQBbvqDP1Ohbo7pOzh7ldRMiIiuzY7lH7ltD3BZBygrRIPavnJZKMWTeAp
	 HNgjmomDh54IocKkHvRtXClN/puPkQkltlkHSnWByL3IZM1HixHkA7+InOUE0mZ9AZ
	 x8UeJtGevKQbV7baTntZjfzSMqHihJ8M222HGCBjVNlFsudJOAVa+GjfozDRo0Porl
	 KAZINSynBWQa4SvgkrLun0Cg4K/vjOZjd9kHTVeCmV6qc+IMI6r5lWSdzDkYzxN9bp
	 BQH6Wtj5nM218LfyKOhMmxQ7XBiFjIulJwPh7Jr994MWfcxdjmB4C5Ydl5rxQ9fjbq
	 twlDpd+GJ1BRg==
Date: Sun, 27 Sep 2026 19:57:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/14] iio: adc: stm32-adc: core: manage clock
 prescaler diversity
Message-ID: <20260927195753.307af72f@jic23-hlaptop>
In-Reply-To: <20260923-adc-stm32mp25-v1-v2-2-46bc019537c6@foss.st.com>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
	<20260923-adc-stm32mp25-v1-v2-2-46bc019537c6@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 23 Sep 2026 17:39:05 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Make the clock prescaler selection configurable, to prepare stm32mp2
> support.
> Reuse existing stm32f4_adc_clk_sel(). Rename it so it's no longer
> specific to stm32f4. Add configuration data to handle upcoming
> differences on:
> - registers and bits
> - division ratio
> No functional change intended.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Hi Fabrice,

One small suggestion to use field_prep() rather than having
to carry the shift around.
>  
> -	priv->common.rate = rate / stm32f4_pclk_div[i];
> -	val = readl_relaxed(priv->common.base + STM32F4_ADC_CCR);
> -	val &= ~STM32F4_ADC_ADCPRE_MASK;
> -	val |= i << STM32F4_ADC_ADCPRE_SHIFT;
> -	writel_relaxed(val, priv->common.base + STM32F4_ADC_CCR);
> +	priv->common.rate = rate / priv->cfg->presc[i];
> +	val = readl_relaxed(priv->common.base + priv->cfg->regs->ccr);
> +	val &= ~priv->cfg->regs->presc_msk;
> +	val |= i << priv->cfg->regs->presc_shift;

I think this isn't a particularly hot path, so we can use
field_prep()  (the lower case one doesn't mind non const masks)

The we don't need to store the shift as well as the mask.

Maybe it is worth thinking about adding a field_modify() similar
to FIELD_MODIFY(). Perhaps that's not a thing to do in this patch set
though.

> +	writel_relaxed(val, priv->common.base + priv->cfg->regs->ccr);
>  
>  	dev_dbg(&pdev->dev, "Using analog clock source at %ld kHz\n",
>  		priv->common.rate / 1000);

> 


