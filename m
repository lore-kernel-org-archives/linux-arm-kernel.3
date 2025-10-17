Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC34CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1DqJ+UvWcL6yl4Znr/vtGBkqWTaoUBpv2+WrnPtteY=; b=Q3I4hXHbitsSElbDkdmAPdLbAW
	P3g/i+TRpib4kKNI6cEbthxpwS26FdfB1EuVtaDnsZh0fKw/trmjXVxjRrFdUD0mcXHA81JM5jkvi
	RU6Xi5Kz8xlW+UhUHtzkyUyg0Xb6Og//DA6i+dsXT9qC3G6jm8D9LxqB7swKZHBZCU0T0+kOgLQGt
	qCTFr8ig8PxJ/jRfv6cZoei8PW14seVSNl0y8xIUy816cGEw61lJflreM8nMdUYkfhaN1e0mNKsBs
	iB3q7ywKxEpX+pNf8v21mAW+08k9En/BItbOuKCpUly1hKWRTja+IaKZV5iIYLcLLyjinP9y2qhYv
	gw4Cqa+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oQX-00000008cAs-2o60;
	Fri, 17 Oct 2025 17:39:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oQV-00000008cAW-277W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DD0D435DD;
	Fri, 17 Oct 2025 17:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD47C4CEE7;
	Fri, 17 Oct 2025 17:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760722779;
	bh=RLpFlKj0oX6F2FHmvB6odL7qjqFC0HmExWxoVhIdU1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NT0kk5AT8tFG1ex9SS8EUtqaH3MN+k/hRFCGSaqU55hscTm9YrecMaHll0u79zNw6
	 sIBNy7OA9YnQH8zcWJvaMly7J6UxVErlApIMtWqqtxuCay5hHv3uxPVR74IQZH7Eo7
	 POgxmUZCozpR5oUMwioI8150ALcQrPO9kadHLQDIRlSHNVEt+zPMCklNd1E0+Dvk0M
	 FLUc8epgBZ5fXzgVrxCcc2oNTqFhlAuQ56P5auW6pS+BXbjn0jHuPDkH8FdSsJSL4W
	 uFicrrFA5Ph3zrKxR/crhBXdSf97NMqd7lwWACFyVrsYLycFeAVJesTkco7Sb8QbzJ
	 h9rvU97EVVwQg==
Date: Fri, 17 Oct 2025 10:39:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller
 <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Johannes
 Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, David Laight
 <david.laight.linux@gmail.com>, Vincent Mailhol
 <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, qat-linux@intel.com,
 linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <20251017103936.49fbafdd@kernel.org>
In-Reply-To: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
References: <cover.1739540679.git.geert+renesas@glider.be>
	<2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
	<20251017081912.2ad26705@kernel.org>
	<CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_103939_590013_198F4169 
X-CRM114-Status: GOOD (  13.88  )
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

On Fri, 17 Oct 2025 18:00:41 +0200 Geert Uytterhoeven wrote:
> > +/**
> > + * u32_encode_bits() - prepare a u32 bitfield element (non-const)
> > + * @v: value to put in the field
> > + * @field: shifted mask defining the field's length and position
> > + *
> > + * Equivalent of FIELD_PREP() for u32, field does not have to be constant.
> > + *
> > + * Note that the helper is available for other field widths (generated below).
> > + */
> > +static __always_inline __u32 u32_encode_bits(u32 v, u32 field)
> > +{
> > +       if (__builtin_constant_p(v) && (v & ~field_mask(field)))
> > +               __field_overflow();
> > +       return ((v & field_mask(field)) * field_multiplier(field));  
> 
> Unfortunately gcc emits actual divisions or __*div*() calls, and
> multiplications in the non-constant case.
> 
> So I don't think this is suitable as-is.

Sorry I missed or forgot that you replied :(

The inline helpers exist already have have a lot of uses. If __ffs is
more optimal then why not make existing helpers use it as well? 
It'd be far more beneficial:

$ git grep u32_encode_bits | wc -l
391

Sorry if I'm being slow..

