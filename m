Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDECDC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBpyFZ1CZQePd+pfRsZccI2jC1/RRRZX9WNFjxxNtPA=; b=uMMZA0BUyLa5YV
	nzTn59vjYkqv5x2B7JlVPMlrnZTrzFFOdhBElb2BFrLkPrNhzaY9L7Z3JGHhZIX711tBbUbV/pEcx
	SxxHRSQ+wQFSC7XlvumCpSGyfzM9aTOP5kqTwAT05+2aN7RLnGAikcOQjgy78S7Iq5f8fovRFGHBP
	LoiZ4rXqapIlYMbcqWCkTE5+aYHk0Dqfd9MM6G+L1kRXUens05VWFppXIdAkZjHMC9F4f/6E2+YKc
	7Ky2Z+at9p7qW4ZhQKL5DezqBOpVZkblKXh5D8uyyuICtvU2i/a9J1cmn6PuvNVp2vEJ6tydgKCJ5
	m+Y7JeX0F/DhuwCDkYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKz2-00000000qJW-0IA1;
	Tue, 04 Feb 2025 15:37:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKsX-00000000ovi-2qPK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 15:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hBpyFZ1CZQePd+pfRsZccI2jC1/RRRZX9WNFjxxNtPA=; b=gCmIllAak7qPze6ch0aeYJzX9E
	/uR9qTvNetjS7bgh/XQoW6mUf52fUm7QZapN1fNIPCsSakMJpd9plKSiTTTQ1gFdpUKAmZ1QMohug
	8n1yrM2ifAQD3rN6WV3Q1/C6Ptv+WMKcXxZ3yC4VsNy4lvzRUNgvopj1tJXWDlMowyVeII4ZUFJJv
	SJ/b4jWwPNk79Tzh10GbiihBsLMqPaERR5q38m4kTA2EFG3zj6qTqieff3/HTvuIYw8p+k9hPfOmL
	PgnHwW8RCS/h8nS/1etrp5a6huGNsuC+BXsjg73BXra5gxahCHI6HNimz7cE3od0g9L8WjHHZp2QY
	oyNCsBDw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKsU-0000000GLDI-2PMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E8B5A428E6;
	Tue,  4 Feb 2025 15:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F517C4CEE2;
	Tue,  4 Feb 2025 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738683014;
	bh=w12EPpGUmvzDudWzppT/O+ACvWWy08Cbo3XC+tGv3iY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rxFt1+76LToM21A8s0ynlnAIwt78hr6Di4Rj31ycjaxNsQldtEz4HGEKhDCpZBIoU
	 Xq7Uyz1X4dOfpnShEge2okV+AlHBJXtcWuP46mvOedK7nxngJBLhC9mfqClLlHO4AK
	 m+iBiNjJZnet6vZuKO6jTDzRyc/CYRlBuu40fbiQTidRQ+FjMq4imH0KziZHiC07Vs
	 yHXFoZLweaKE9xL0bnUKC6Uai0BGtZPAOhRb+gLgYbIyPKjDVAV9MTomKE5Jk+0r3r
	 Z1Ki34lpSJDD3f7NpPDeqiev2aYna2qG+7mqi/vzbvodKXpJ1+Z96jQ2BaoarLuvEX
	 +0olbUxhCUEmw==
Date: Tue, 4 Feb 2025 07:30:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <20250204073011.5f6ca125@kernel.org>
In-Reply-To: <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
References: <cover.1738329458.git.geert+renesas@glider.be>
	<1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
	<e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_153019_005197_1E70DD36 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, 2 Feb 2025 17:26:04 +0900 Vincent Mailhol wrote:
> On 31/01/2025 at 22:46, Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.  
> 
> Why is it that the existing FIELD_{GET,PREP}() macros must be limited to
> compile time constants?

Hard no, some high performance networking drivers use this on 
the fastpath. We want to make sure that the compiler doesn't
do anything stupid, and decomposes the masks at build time.

The macros work just fine for a *lot* of code:

$ git grep -E 'FIELD_(PREP|GET)\(' | wc -l
22407

BTW aren't u32_get_bits(), u32_replace_bits() etc. not what 
you need in the first place? I think people don't know about
those, with all due respect the way they are coded up looks 
like an IOCCC submission..

