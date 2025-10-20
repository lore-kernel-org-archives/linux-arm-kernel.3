Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE95ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DErh0jkxEaTV4PU1gk6ECpXb4KgwIGFW/OBZ7JW1qeg=; b=Ysinoe+QH4VvHhVVRZpKUxIimT
	AhjACANFfMFXNCuGaIJYtZHz1nfx69K6HEZlsc5Upy7/TIfpz859+cQl79AZfv839yPYm3HDhwVSF
	vMDWJPn99y1KPYE/HrTMSqu/GMtD1SBCZo/srM1AOqLEr5fb0blK8Sbh6sTPx+0d08cjb/RsVL7GF
	7WWO8DrXO9DXOf59wfSyZFxtB0w1kNZgkzdSJeb9xjSAQCV5Li1Ojjkr5/b4RznP7LWy5cwwVJEyv
	cIP/u6qyOJED+/jgqVFZuGvyEQtp86zr1WVQTtf8wHXYTar1zDCHMFQ3gUN9ByYKXngxGVbN50t6L
	RGoyHXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArJM-0000000E1o5-2Hq2;
	Mon, 20 Oct 2025 14:56:36 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArJK-0000000E1nY-0WbH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:56:35 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-78356c816fdso47210487b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760972193; x=1761576993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DErh0jkxEaTV4PU1gk6ECpXb4KgwIGFW/OBZ7JW1qeg=;
        b=Za3IxOmRrijZwzYN7ZnWZoi+IszYW643fcVLxbhrPoViWRAB6wD1hbr95rTOAQbSDr
         7h8m1SFAWIsG0QdLeGVgdwwYI2sSLlMKlJGJXTz7Hb8ZvcI/SzZrDyuX2zHgnOJ2zZWN
         aSCVXUaB6aRIdV7xKYPUohOUQbDR/UrRUgL3zuqMBTWuaIqbNdhRX3a5Jz5/2U8j56Hy
         MPFJfrezItO4IQQMbbz8WBg9QQGcYPbR5WHiUpd+ad/Ak5oZ4Xz9/TiU1jn06hXx1nXc
         KiyRxqjVzGAK0Lz6v3LFQp+Jagoh8RoU0rs781/+EIhZ4suZxD3BDn7yAbS/xG6Y6uTB
         +JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972193; x=1761576993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DErh0jkxEaTV4PU1gk6ECpXb4KgwIGFW/OBZ7JW1qeg=;
        b=BQx+cj/plE7hQ6L5bYAnCujyZO1qCQPZz7nLZVE4thlc2IdUyc1PrFLwgxdo8VAy21
         2NtaLrmeES2U9B7JOtz+IW2MBNSBGOwLkuKpnx38RNrIg1xmWQKXvSlwf5mGlSdAeEIu
         JESiMzU5hAp76AqbtXy2rwUUYMtpDZqq2/Y6Z1t0jX/Ze0aeT3Lacmp7bF9hsvVQnukE
         J+zTZBg4L2NasfEgKGqwwP3e7auchBvPxcKrFzc9gJqjIP7KTjuinliGgcr9NJdMZxvv
         QI68Q16QP90OZXrvSiw7jk4VjKQOR9/tnnnSijqSZpbEA/l5VTQqIE/4iW3rhKUv+2xQ
         NQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhF82n/mvluGaadOGm6EcdyNyXH2np0HOBnhdNo8/fyDjeyHkMEx2tdmlDjzILC6axPykt3xiMrQv1JdmEXkjB@lists.infradead.org
X-Gm-Message-State: AOJu0YwzrQBlnk77oXfg8w4L6Hz3IK4YoowyvxvGPDIe50ah/WxqUS6G
	lhhFtCGIsTEB6UCjgo0Rdh1SaaO18dvnX/lLCKhuRTxX1yCI/Q8k7j2j
X-Gm-Gg: ASbGnctAi4kIJLysBT12hXHY+Pf7V0+SqQJmHiJe/JiCUoTcNjAPmUzizW+SVkuHvHO
	3iw3bBEk4SoHXoBAsI3hKddByIge4uYzcFNf/jhS/V7nv7vW61bG2310q+xvzyy38/u9FYaYCww
	WXj/g4DUgWwXABCJ4IOvDSBYtfxzlsGCDWtq9Ljq1NClBbK8Dudah0bv2H4xmY+EL++5V+fdKfj
	RB4cX3mUfUSYSo3Typ7bin9dbeXmgFZjsjQiqoyT3SHxHEHXSiacVSZRtZM0ar0k+WjH1W20yXe
	gsMg4pHO+gJSvaQhncE8lO4RGX40UEMWA+obizC1fn0YlnRWFMPqO/lIAU11OjyYpEMC6u6jiH+
	hSroVgHuYISG/9020XcA0QoqFwR0OBh/JBQWFZaWNv9lmgLNGN2hUTrT9to2LnGLo5GjVFdhcwa
	4kqRKt/c+xrotOcM2B6I30pBSSsmaPzIO4
X-Google-Smtp-Source: AGHT+IE81F/jaXbyHR42ph2vrE4i4G97ZO8UgGatFFTjrjbQ0UYwj8u7zrZ9iwbiKwTlSepO74M7sA==
X-Received: by 2002:a05:690c:951c:b0:781:1280:db43 with SMTP id 00721157ae682-7836d3bdceemr92264887b3.68.1760972192509;
        Mon, 20 Oct 2025 07:56:32 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-784674d66fesm21762357b3.41.2025.10.20.07.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:56:31 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:56:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] bitfield: Drop underscores from macro parameters
Message-ID: <aPZNnmot-Z5a2yIc@yury>
References: <cover.1760696560.git.geert+renesas@glider.be>
 <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
 <aPJwtZSMgZLDzxH8@yury>
 <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_075634_173795_06BDBA27 
X-CRM114-Status: GOOD (  13.78  )
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

> > I agree that underscored parameters are excessive. But fixing them has
> > a side effect of wiping the history, which is a bad thing.
> >
> > I would prefer to save a history over following a rule that seemingly
> > is not written down. Let's keep this untouched for now, and if there
> > will be a need to move the code, we can drop underscores as well.
> 
> Fair enough.
> So I assume you are fine with not having underscored parameters in
> new code, like in [PATCH v4 2/4]?

Yes, sure.

