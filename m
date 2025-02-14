Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F72C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEUK7M60lRQardXDr3rcqI3xJ8vpCF/l2APWaA9DFUQ=; b=T3ilR31HhtUNm6
	J8e4O4fYgeIbpg1sp6pu5yN3uHZPvLBVlJnfa3YGf2AnxxCoT5zEocD1lP2DH0MAxkUklW/YLrK/O
	ptWYLMs1GJq9iTAabMAYAjq+Q2lQ4BGAKdxE8gMiFpCOD/cGkX3Y4PM9itCJMBtD7zZcK4i+l5005
	8eMf1SeiAzh5+C6sEQMrAGiME3fKpVPqlPmDXcVWkmVfAaerM+Opib0lng9YU4MPg1o7nFOrBGvrr
	JijnobBhAS5jUfYmB+HMK3o+rX1uwdkHMOXx8r/NxiwP+nr1U/1KXg5DapeOyKlsLefjjDuyDB/3w
	EMASyqq692sgS2X+MWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiysP-0000000FZfE-1uYs;
	Fri, 14 Feb 2025 16:49:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiypX-0000000FYwg-3jf3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:46:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f2cb1ba55so773552f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 08:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739551578; x=1740156378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEUK7M60lRQardXDr3rcqI3xJ8vpCF/l2APWaA9DFUQ=;
        b=AlEsQ8Q/mnbPG67MTa+cTHuuOhmUe7EJDiEY81E7pWcWdM3iWenrMe/ayAcsyvQiqE
         cMBf1OCJ1hD7zHNnEuBDHLNidGCeSVGxOvjLc29UgrLtvUFdbhQyDBxrbnXb4PZ3sJRQ
         Q+EVneOrvI0vmkiTwyl/jjqyQbCJ7uB+CR5VSBmiOiiMc2+E6CpdaUqplswNtDCy7Vbc
         14dKN6dTwm9LE67PIMFud3ZVmpJ2eacXRw4G4syiJP3SGc8WgfDql/TY1g3CSbtGXbwX
         6GqkIcoVPfairJrqZv83vrypx3PbcrnM1vUdnMU+/3254OoWKUwIhyQSPai5ud3/ZwII
         BzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739551578; x=1740156378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEUK7M60lRQardXDr3rcqI3xJ8vpCF/l2APWaA9DFUQ=;
        b=fCAJYqFUK34wxYb9NvremiY8dTiN9fFrFCf+w52PhQhX5mgNhFDPO5uM/5OAhenSMo
         Nsbb2ptC+Thq8rlw+nfXrinIDut0/klUP3tcc+a8RZ9dmy7lNKCBMXWc5N9hDXnxXD4/
         001FNkEwHXW2OsZgvsi1u2WaGgQk5B2Zpx9hMHraLMt4m6V4bFnkqAQlonLxhqu+MeWM
         +2HkxNkiC6qpTOiPHkVA24TuJwk4SzcCAzwb8ngRcruzUjowZXyeRxS6hXWgTijZBWNW
         2ELrsFHt/888gc04aD/CJjsyteey7/a5FXfQpk0jSPRqaayfUv4oXNiYCBwAiH+gDE13
         9CMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY2UB3dIa1zPI25nE0JZFHvn5tIDQhLZze0pyi4iHIvIieDeA3Kp1dc3N/D+T//fBGoJQcy+XNU39JwiUiVABW@lists.infradead.org
X-Gm-Message-State: AOJu0YwEJ0HaDIVJmkp4+4JTUU3nc4XjGvk/X5kbmiuZ3903Qfcp7zOd
	0Tj45r+hrs+zA4ELG0+ibq5/HC0gRk6PLsGtmV5duTDQHtxfCItF
X-Gm-Gg: ASbGncus1WCT+L2vJVDd+K/F2HGbzEIZwnLFDoiifvxtct/yib1dROk2GOUzjOjZ1Lu
	TWVAawQlHZSmVeLav6Cpx8iu0suZHSW3Ayfls3TeLfp6VM5sGP8yfty1KI7WvwAe/iwYAhPzyaI
	soYD45AV9uXtnu0/a+OrpBmnpX+64GnA9nn5eOJvpbfr7hKFSeznDXBW8aZ3G4Av3sqgW8qTeUB
	++rZlhKhGiah/JdLL6Q+bvrqxxzNdIncccRJ0XqPYDCa2nN8Lze8kBKHKNzmR64kVJS2WxJifx8
	wg/r3fPLe/dAO9nyzqZYeHiz1Uv8L2z6GKORLFzMfUr2H7JTb0IAuQ==
X-Google-Smtp-Source: AGHT+IG9iRvkwD2Pnjr513qQIYSAcwjpWUdTSopHyr3FX8/GpCTlATk6Kd4aSQlT7eXs7Bpa1c1skw==
X-Received: by 2002:a05:6000:1f81:b0:38f:2173:b7b7 with SMTP id ffacd0b85a97d-38f2173b9aemr11306900f8f.18.1739551577421;
        Fri, 14 Feb 2025 08:46:17 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8217sm5125878f8f.90.2025.02.14.08.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:46:17 -0800 (PST)
Date: Fri, 14 Feb 2025 16:46:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <20250214164614.29bbc620@pumpkin>
In-Reply-To: <20250214073402.0129e259@kernel.org>
References: <cover.1739540679.git.geert+renesas@glider.be>
	<2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
	<20250214073402.0129e259@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_084619_932746_C341F498 
X-CRM114-Status: GOOD (  19.78  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Alex Elder <elder@ieee.org>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, David Miller <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 14 Feb 2025 07:34:02 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> > 
> > To avoid this limitation, the AT91 clock driver and several other
> > drivers already have their own non-const field_{prep,get}() macros.
> > Make them available for general use by consolidating them in
> > <linux/bitfield.h>, and improve them slightly:
> >   1. Avoid evaluating macro parameters more than once,
> >   2. Replace "ffs() - 1" by "__ffs()",
> >   3. Support 64-bit use on 32-bit architectures.
> > 
> > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > macros, as people expressed the desire to keep stricter variants for
> > increased safety, or for performance critical paths.  
> 
> I really really think that people should just use the static inline
> helpers if the field is not constant. And we should do something like
> below so that people can actually find them.

Especially since you really don't want to be calling ffs() on variables.

Much better to have saved the low bit and field width/mask.

	David

