Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C61AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bu/o5ZKE+DmrVvfqpvDfKwO+d8/POCqsIdA64ajmPWE=; b=NmN9HT6Vw4J67WW0LhG7ULb6ga
	3CG/EfuB+TbumXijH3Azrt5oBzHOvL1+qkpIXz//HnKIYjtOsUFGCCpl7t0zCVhXfXGfnngxyZtqk
	hEjD9SHDsnBpuMARq3BgcDsaBJYJyrbEq7iTdH3flKDGN5iwFj9vg2On3unHmeax7qWY5WIC0uivo
	hGwE8lef5NrpK9wVMDdBTCacM/eHUKfX4z9TuCGgvCPWKKNx7c1y/CquI5uEVfD5bCpwPllwAkhdm
	P9O83zWbDWejaufRJ/SpRSPUv3TKP0wJllpHbWOZAvZvrQNggC9vT3NNFPPUxw8hgUBKtKDRE9d0X
	8nz22VHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teeBi-0000000E0wR-3dxP;
	Sun, 02 Feb 2025 17:55:18 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teeAP-0000000E0ot-14J6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 17:53:58 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6f0054cb797so19134277b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 09:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738518835; x=1739123635; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bu/o5ZKE+DmrVvfqpvDfKwO+d8/POCqsIdA64ajmPWE=;
        b=LejU1h4C7S0XtOT9WGdbZF8rjRjGc1QPmC3GgHDxBButHYagQwvUN9ky2fEMrpWyam
         tq9sUZkAxT/wJpbI5nKdJg7ryfBkeYIRytd4I8xflfKKX0fkbCr/cLUh1FYvc96ysFAx
         VB2XZ8so6q+gnhzRmQX0jmGEXBS8hER2FS0MaG1v8/W27X6vR0WdeSNurb6SstDyvktX
         fp5NYu3vBq0YEqyjS/zsViwRKUzXt/u2erACziIJxoeZq0jgSWfdCcR/O44YiDmmzVAl
         Xr9QmmqWyjmBI1WjBf7wxhhsdF5XMNLnXL/rADQ2N7dYE/QV+Bprx3ulz9F91ErEdgyJ
         5egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738518835; x=1739123635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu/o5ZKE+DmrVvfqpvDfKwO+d8/POCqsIdA64ajmPWE=;
        b=u778AYg+LdrCHaDTVgGzZOZyexO3fXKgjeAjOPSBMaV+1RceJUgQIeMB4+rKHJnAqS
         GpU2Mns52blXFjNrnR4Q0qKXmGr7QrOwF9A2UHZX30s1cP1Lb1cKQqZjZAuzw98GXlvD
         ELR86rLIZDCcw0nzSuzvtoIh4VAJCYRBLxta6C4WXSY8v0n9jGSktzannt5DRPzGE1BJ
         PCuPLYhgQobcxa3PG6XfGYtrRPHoBZ38/svQB1Zp4mGeW1lufRUXmCLomQOMEmpfM419
         7UMkRSQT0XvP7VX+uUUwMRqpFPl8Pl+7UiA2VVlXI33kfzrz1qadekObPUZ0Gt4QuGPX
         2onw==
X-Forwarded-Encrypted: i=1; AJvYcCUK5VYgDELwSF3/AIj5U4U8oY5vXBF+VQQ+4a9HrvslusvUtijAg3adFPfRNT1/IUCGzaWoos2F6bdva98qeJhb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9mkSv3lQFTzHyc+mRo0ztIS+6Q2yCUu9XlwYQsDVVJ6EP1mOH
	F3C52NC/c/V48lgZGMuT0NHChG3jAA5MHVkyU1htGCOnoyAauY0r
X-Gm-Gg: ASbGnctY6xTTRTPi459VSX3EM56wr5g8brrsknDhWdYkgyCxa7ddzbWXq8svOjWpNvB
	qPv/6VX0yYOYIlNrrSLsaPJJQm4+wfkHoCuK+1pht7LumAyPRspcbOc+Q45Fo1DB1cGt8BQPSga
	9N4JMGUgRvLD1s3z2hGoc8/mbYBLU8H0MZzTQh4hj2Pn5YI2zPZDvqTySvxgfDIwaLU9HFKX9gz
	MyP7k9rgbc/sLrmEGMh4RWdRiTSvIW+V2CKosWhANiq9TJLQLfCuMUiqP9YjHMiQjeGWtbmgYAw
	70thy8VoAwSH5zGMdDVYR1T1DXWqEXyNWNxJie1ksCVpX8/amsc=
X-Google-Smtp-Source: AGHT+IHHQI3478HvRiKWIVLIdATv32EFyyXdDb7s9xEv/S/0xqBbGzFcSVKK2nIkOtoAuYeOo+6nPg==
X-Received: by 2002:a05:690c:6e09:b0:6f5:4304:fdc with SMTP id 00721157ae682-6f7a832a301mr158970467b3.6.1738518835574;
        Sun, 02 Feb 2025 09:53:55 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f8c465b884sm17908247b3.59.2025.02.02.09.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 09:53:55 -0800 (PST)
Date: Sun, 2 Feb 2025 12:53:53 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <Z5-xMUqrDuaE8Eo_@thinkpad>
References: <cover.1738329458.git.geert+renesas@glider.be>
 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_095357_296119_EBEDA438 
X-CRM114-Status: GOOD (  22.06  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Feb 02, 2025 at 05:26:04PM +0900, Vincent Mailhol wrote:
> On 31/01/2025 at 22:46, Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> 
> Why is it that the existing FIELD_{GET,PREP}() macros must be limited to
> compile time constants?

I guess, for historical reasons?

> Instead of creating another variant for
> non-constant bitfields, wouldn't it be better to make the existing macro
> accept both?

Yes, it would definitely be better IMO.

> As far as I can see, only __BUILD_BUG_ON_NOT_POWER_OF_2()  and
> __BF_FIELD_CHECK() need to be adjusted. I am thinking of this:
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..c6bedab862d1 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -8,6 +8,7 @@
>  #define _LINUX_BITFIELD_H
> 
>  #include <linux/build_bug.h>
> +#include <linux/compiler.h>
>  #include <asm/byteorder.h>
> 
>  /*
> @@ -62,15 +63,13 @@
> 
>  #define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)                      \
>         ({                                                              \
> -               BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
> -                                _pfx "mask is not constant");          \
> -               BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
> -               BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
> -                                ~((_mask) >> __bf_shf(_mask)) &        \
> -                                       (0 + (_val)) : 0,               \
> +               BUILD_BUG_ON_MSG(statically_true((_mask) == 0),         \
> +                                _pfx "mask is zero");                  \
> +               BUILD_BUG_ON_MSG(statically_true(~((_mask) >>

This should be a const_true(), because statically_true() may be OK
with something like:
        ((runtime_var << 1) & 1 == 0)

I think it's your own patch that adds const_true(): 4f3d1be4c2f8a :)

Thanks,
Yury

