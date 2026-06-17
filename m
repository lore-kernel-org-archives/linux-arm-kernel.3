Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AD8CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynyGNMVkaF2YOmFkxKrH0dMGdqEXr7Zt1ipWLf8tuH8=; b=W8LWujMizSAHqZrqsgSMWzYqRg
	/Bt06lTXp5RAkRyWepO5q51WKLkov9P02y+KNCjNAwFGCeEKVzu7zFUXP1KTbHH5tM1ECNFpWG5wn
	rRPyPGDbZ8bgwPpP4HpJm4SlpIkx2RHmep2z0sXvqrWU3Ksxq6QeZ277OOZtpTJRhBPw/98cgDld9
	q14pKxaCokccrLg88pCZel60X06MJmCSIbkSrvBAm3RkdAgOYQP2aWXcHMKDTAEoD7jOo0vwze/A6
	Wpaoh5jAX0PQzebJPaAskUdXlzwU4j9vRRw2G4WQkWShuapQeCWSQitBG05/uONdj23YPq1i9L2+3
	0WWgtl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlmq-0000000GtV1-1ksy;
	Wed, 17 Jun 2026 08:38:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlmp-0000000GtUf-0Uv9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:38:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F09960120;
	Wed, 17 Jun 2026 08:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E9C1F000E9;
	Wed, 17 Jun 2026 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781685493;
	bh=ynyGNMVkaF2YOmFkxKrH0dMGdqEXr7Zt1ipWLf8tuH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eO0im/FmLLmA8xq7h67znTWf2Egfp7TA5g3tCk7tVhtkz3GB39hE/A5DiYbt5cKtr
	 Mviz3QsD/6PSuE3I7nMw6h1/Mg0Oku/c+XQxoMWV5VvZ+df7QmrYLygvWireabfKJ2
	 6P47Jcfgj7RxGFkyKQhoCkqREqb1PtoW6uYrUG1DMrl+zNba7rlRuDLOtYF6XxDhn9
	 PmOK/85jmb1C1oZV4HNvnh4FTG6zIUngXsNo7M4gzsTm1LxdBkKj8D08WXGue6IaVt
	 hW63ozzeQUZOBlvFDoG3qHCA32vzcZoWcFkm3sS0xbcwnNnVgv+1HdVyg205KsNppM
	 8KPCgaRFwqgmQ==
Date: Wed, 17 Jun 2026 10:38:08 +0200
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
Message-ID: <ajJcxgVejqzlwo9A@zenone.zhora.eu>
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

Hi Guillermo,

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

Merged to i2c/i2c-host.

Thanks to Alain and Pierre-Yves for their review!

Andi

