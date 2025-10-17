Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055E3CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZqTIsgME323ZkO31yyQWUQxJPAMGciP0ot1SYinmXM=; b=D2uQQLeaFQpKpfd0aT/y8HPWOY
	J7/yn7Ee4gtQhrSxE8r4nNzn9kRPi5b5/T6XbErq7x1truy1yf9wSqNdh1h7JoVQgXxvILhWZAWoZ
	SQf++uvwV4XaEPse1E/S6596Q73i3bnioAfS4HNWwvny8dDf+xCh6KFdwdQrsSo41H4Xbm8iE/KBh
	a5DR5D36uTHXLharoNYjDfp+XgK1Mb/2PPURWIKe2WfDl6cjy7G/04OTIIOTztFttpllGuePB6tzP
	FHxDbPbpvUqFPp42sIjm6kjS2vwzebXSS/Ng75HT5hDDMENnvbG5SRWploFSolRVSA6TCMUC4eHM/
	4V5f1ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nS9-00000008T6N-0gr1;
	Fri, 17 Oct 2025 16:37:17 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nS6-00000008T5V-0ZIa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:37:15 +0000
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-78e4056623fso27552546d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760719032; x=1761323832; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZqTIsgME323ZkO31yyQWUQxJPAMGciP0ot1SYinmXM=;
        b=f8juoPG1RnDCyWfrViveXrTmQ6lKtAnpYXHBvAo9jXR1p7Ep39Ariwb44ResgJ8Qz1
         Ndbg/fUiTjmoD5Gg4fKhEO846GumFhjQsY4TIE5/5ckDTExjlk3uMQBpV+n0hF/foE+c
         /Q/t1ug8kXwO5dkFeF/HcXuplQJNpSNFKI+Zz0AMBQq6cpBSHKygTR4nuCL+hd9eF8Wl
         Zv13YSq+6RgQ6xepxmzFwjEp9+y9EOsK8S7U8lFtQF0iKmYn3MpqquVtnmaiyyhcdS7h
         B84Yi5/5irZLUzrF0Za5dqhKcgqrjBcjhQ1XApSfJC9sZq1iRG2fQru+1WwgRE4qlnex
         oyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760719032; x=1761323832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZqTIsgME323ZkO31yyQWUQxJPAMGciP0ot1SYinmXM=;
        b=BDbYOBzbVDfUJx7FDEVhiRZokDhOxYIZ0jyGZjhwdceHdbowjEM1dp5t2/CUh+J08Y
         3VQJIG9ynIvaLIdWyMY+6QnDic4qJxz7kCtg8g1DpxW3wpbHoicO9o07s38vLU6b/kX9
         RYALVEw4VhRF/fCFv+e8IRHresnBny+dCwJXsQH9kwS99cznj8b/FQTkQINUOzKB9AYk
         sKs2/XNU422/s/uPEuR317t2tWbT00s+DT+hio5WlhMnk2DEkjiSOkoIawMo2WW4nXoD
         D2cAH7Rh7chueUyD5XN8ihxY7bVyICAlrUbBcE1V5WgVEXLJdr5vCC99T+53QG+6VrUU
         cVqg==
X-Forwarded-Encrypted: i=1; AJvYcCUzeqlLc9kZJFBRyboE2OICUyCOw1wgS6Ld075vmhZwXxzFii9x5KkicNOExdgoIWHzZ4CxwQ2PCI6nujORxHMo@lists.infradead.org
X-Gm-Message-State: AOJu0YzkKrn65jxPJnuvuyZR9O9E0rCj1xWOiwfrS1hq46oexm5X4ya0
	WUGRvsF7z2ODaGfuXdSX674NFVlsMOXd3syujONh8R5HHyGP+VtQkh4w
X-Gm-Gg: ASbGncs+O78Hj2ADJLMnj1ELhCBaEmiDSa47ELtmrJHB7ENVZtJPGJbsP/shQqJe0vU
	uy8650MmTm8lvVdiPB1J5LxIHNl+npv+ePPq903fJsj0V9WrlvzlUlrCagEkHwepJM34uPBhSp9
	zWByltJ2787qlHsev0rJ2dwyM6ICm3/WLGoY8DqpIJbwy38pfXpV1L+YKhEDVp347IJCXITJAMx
	0hsS4Oa7h4XyYttySBx3ysoBYrUqRBYFAajw6S+zhKhqUOPLCvdPxFbXMBcQDhnJ3o0tlELYI8p
	7m2t4DUoTyTzj3HNtmYsA0ZcEjxdO2UERRi6A9V2C8bp9QXVxeDasiljRxPzpxp8SSp0c4db28q
	0nXE4YVcfoMJVau+8OYYqKTrTIhhlo3B45Vpq6ttuWYxFRO15k6mrXXfhct6RYO1Q0aQO9Xy7tB
	IbEyIcIxc=
X-Google-Smtp-Source: AGHT+IEBLNSjsT2f6SbTw5aTPGakjHLdlQrL5hue+DxfPG8mzc3zrpMssrggDkT+31HrLygOdkrpIg==
X-Received: by 2002:ad4:594b:0:b0:87c:2920:5730 with SMTP id 6a1803df08f44-87c29205b08mr24398926d6.40.1760719031704;
        Fri, 17 Oct 2025 09:37:11 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d02d91324sm1575686d6.65.2025.10.17.09.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:37:11 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:37:09 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
Message-ID: <aPJwtZSMgZLDzxH8@yury>
References: <cover.1760696560.git.geert+renesas@glider.be>
 <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_093714_180269_C9722680 
X-CRM114-Status: GOOD (  21.39  )
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

On Fri, Oct 17, 2025 at 12:54:09PM +0200, Geert Uytterhoeven wrote:
> There is no need to prefix macro parameters with underscores.
> Remove the underscores.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - Update recently introduced FIELD_MODIFY() macro,
> 
> v3:
>   - New.
> ---
>  include/linux/bitfield.h | 106 +++++++++++++++++++--------------------
>  1 file changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 5355f8f806a97974..7ff817bdae19b468 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -60,68 +60,68 @@
>  
>  #define __bf_cast_unsigned(type, x)	((__unsigned_scalar_typeof(type))(x))
>  
> -#define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)			\
> +#define __BF_FIELD_CHECK(mask, reg, val, pfx)				\
>  	({								\
> -		BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),		\
> -				 _pfx "mask is not constant");		\
> -		BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");	\
> -		BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
> -				 ~((_mask) >> __bf_shf(_mask)) &	\
> -					(0 + (_val)) : 0,		\
> -				 _pfx "value too large for the field"); \
> -		BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >	\
> -				 __bf_cast_unsigned(_reg, ~0ull),	\
> -				 _pfx "type of reg too small for mask"); \
> -		__BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +			\
> -					      (1ULL << __bf_shf(_mask))); \
> +		BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),		\
> +				 pfx "mask is not constant");		\
> +		BUILD_BUG_ON_MSG((mask) == 0, pfx "mask is zero");	\
> +		BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?		\
> +				 ~((mask) >> __bf_shf(mask)) &	\
> +					(0 + (val)) : 0,		\
> +				 pfx "value too large for the field"); \
> +		BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >	\
> +				 __bf_cast_unsigned(reg, ~0ull),	\
> +				 pfx "type of reg too small for mask"); \
> +		__BUILD_BUG_ON_NOT_POWER_OF_2((mask) +			\
> +					      (1ULL << __bf_shf(mask))); \
>  	})

Hi Geert,

Thanks for the series!

I agree that underscored parameters are excessive. But fixing them has
a side effect of wiping the history, which is a bad thing.

I would prefer to save a history over following a rule that seemingly
is not written down. Let's keep this untouched for now, and if there
will be a need to move the code, we can drop underscores as well.

Meanwhile you (and David) can propose a corresponding rule in
coding-style.rst and a checkpatch warning. That way we at least will
stop merging a new code of that style.

Thanks,
Yury

