Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0016DC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pglTObOFT5rBCszltvVnpJmzw8D/oeXug/disPOkEu0=; b=ia0hUHfAOuTfew
	dHoFXDxa20jVhndcXGCCdmvwbTzHHUaZCnA0RaFz743kRicPmavw3MZWLTFBPt8rlNRkVrtIO9Tra
	ss0twMKeQ5J8DOXcIiCYpckf52JEsMS1jAiLLuT3POHOoYa75LIkyEZk/DChRxYBAUAb4jlVLHz/d
	4apAF129ZW3m0OPnlWzE/5PXXTumsmYVsYw2cbT3123GuDlHOlz6nHCEmnJWJmD+MBwdqydb1VczQ
	8CB/wXJkNFsOy8Fxs8sTcALS4c46yBg27YqolNnUvt8D8qZR0u5oEbQSVNlaeD4yvaxSI/mLLpK17
	m3+iRjMuWUcHWqaihLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwK5-0000000BGau-00ue;
	Fri, 31 Jan 2025 19:05:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwIl-0000000BGUo-2D8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 19:03:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38a8b35e168so1481731f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 11:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738350217; x=1738955017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pglTObOFT5rBCszltvVnpJmzw8D/oeXug/disPOkEu0=;
        b=Rt36gvMegwCcJk4ZtIeCJ6iY2e0f2JUJRIo8oX7t2xoFXW7f2hk4W9VmECxbyCZQrA
         KyemNtxIZ26x60i5WHyPWZyka3OX5+DHyLmpt64KjQUk+hwpkZT3fg5s8NPDgt0qfr9j
         TRFh5v2mibdtSn6KEh5e6d/YE4g64djNKmJd3PjWkwOrW+LtAk8Mpv/tAXqzEaMB+oaU
         HV4JQzTyyflyaoENZ6TuSIA4pBRbpWxNrxG1leJ30P3DWqeF4aXOZQPiSDdGMMumU9l/
         R9W/vlJh4jbGJRpX4IMwVwG52K5+7gP0ckPYIsVPJrmMUDvkgOQIf4adnyKY5M7Bm8gT
         XTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738350217; x=1738955017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pglTObOFT5rBCszltvVnpJmzw8D/oeXug/disPOkEu0=;
        b=hT1/MP+tZE7NmHxubNStfpcCyRaLYWG0rD1q7iOO21N77V2CPgK3sxJVTJL5cHk4H0
         54UmkPyX83IjjhwgsGcPxvOCAGl0S6aJGxIrfmiYPiTfVMf/kzyu1nORQB1JVAbbRWHR
         y+fNjjbj8HKfHP2crV0NzoGS/IqkwGOGFf+BLGEtKbcGjWNq3YLgvUEA1cE4ktTZ0vpL
         rpIC4VLHGM7HNe/gtQAPZ9/PuoFc6IW7kmUWInkF7cnwDDV9GU+chmmpAvJat2U5d9Of
         /FRR/ICbdAlHxKxakVC4lHOI2TKLsQb7TFH+mzfZr+e+ya68gIyirl0iLj4LKag/jtsA
         N2cA==
X-Forwarded-Encrypted: i=1; AJvYcCXllo3n5J5xa0amMxtnLGUnvCSukDuFsZkWix9JZ4RrQrR2l90YhwY4GYJpeRRRS4qCMLecSOhncjavqtC5tg05@lists.infradead.org
X-Gm-Message-State: AOJu0YyZxAz91A4W3UTGzsFm94QTqETgiVFRwhaMWpkYuQKS8pZQAfEF
	ps08k00BP6hlADwLWje5hVn2YlyAwuozVmt7WpT8897NKr8BB1Hh
X-Gm-Gg: ASbGncvSiuxFiM2C7Dj8FK/4ppbprnl52nthXFTc7VQkjsRMRpWDtgo7Vh7HwTrD7Vi
	W1HMoAENtcl/l11V2xdbPOMHXfY96dXex7Ln88w4DB5gYw3dbmnNJLtRwR6Ha7hjqSQGnxK6Uij
	EkY5EMCMbB7Sz6XcsXMLRReIJLNB/1IsbpbgnZDeHKi1j3B7yY3DGVxS1JKUWYRBvnHLR2CnCbp
	YF7ByDiWPrEmh7ujqKviE0fmqwJjLwv7hWvt+AQ5vr8TedIL3q3dZJF7gxNRHzr5fV8Q28uagb2
	nLK6wTmPC/w+om58FHRetiH/lwNkkNgmtsmOBhhvhaSkJt0plqa7VQ==
X-Google-Smtp-Source: AGHT+IGOWalHkw0VQDuZrFgGWdO/5t7oYMe9eAr7RV/AmNQsKEb7LjEGNkj8XpJngRC9CG3jrtAtQg==
X-Received: by 2002:a5d:5f56:0:b0:386:3d27:b4f0 with SMTP id ffacd0b85a97d-38c60f26459mr3846706f8f.14.1738350217335;
        Fri, 31 Jan 2025 11:03:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d444bsm64691365e9.8.2025.01.31.11.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:03:36 -0800 (PST)
Date: Fri, 31 Jan 2025 19:03:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <20250131190335.4c18fb3c@pumpkin>
In-Reply-To: <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
References: <cover.1738329458.git.geert+renesas@glider.be>
	<1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_110339_572521_9CDE7212 
X-CRM114-Status: GOOD (  18.77  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 31 Jan 2025 14:46:51 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> 
> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by consolidating them in
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures.
...
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f1732230700..c62324a9fcc81241 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -203,4 +203,38 @@ __MAKE_OP(64)
>  #undef __MAKE_OP
>  #undef ____MAKE_OP
>  
> +/**
> + * field_prep() - prepare a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * field_prep() masks and shifts up the value.  The result should be
> + * combined with other fields of the bitfield using logical OR.
> + * Unlike FIELD_PREP(), @_mask is not limited to a compile-time constant.
> + */
> +#define field_prep(_mask, _val)						\

You don't need an _ prefix on the 'parameters' - it doesn't gain anything.

> +	({								\
> +		typeof(_mask) __mask = (_mask);				\

Use: __auto_type __mask = (_mask);

> +		unsigned int __shift = sizeof(_mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(((typeof(_mask))(_val) << __shift) & (__mask));	\

There are a lot of () in that line, perhaps:

		__auto_type(__mask) = (_mask);
		typeof (__mask) __val = (_val);
		unsigned int __shift = ...;

		(__val << __shift) & __mask;

Note the typeof (__mask) - avoids line-length 'bloat' when the arguments are non-trivial.

	David

