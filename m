Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82285C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e3vrd26snuR7BBCNgEi1ltS7NqcxsA/B6t8vBEFYDs=; b=pH2hr+FcUsEzna8F2ZD7oWm+pg
	NA5z5LiYIOIq/t5seSRYRW22UpvzTZ9IHoI16Vp5rLnYjl8RjaTHLAE+IjBNL3oLzeVbF458erVwe
	umefhL1uFFfVfK+Mi8lv2DfgJaxzT0MwW2+p9Sy8fy/jNFlaqdA9zuJeM1Nx8kMqbt7woFS/AKcli
	c0DLqyVKfL6B7vCfFCIuWkWLjcW3c9Y4HVIty4sDRn3WThkHu95MOnE8WQ1cV/SniHab94Ba5YDM1
	8EzsvFz0+XWlAFsRAyJYkoctwXpaUaSygvhd3g+sXcYGBXmENfge6qwEdsmi5wO7JPjZYm7t9S8zx
	hlkbkVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tex0q-0000000Fb6l-2rHk;
	Mon, 03 Feb 2025 14:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewzX-0000000Fau1-0Frj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 13:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2e3vrd26snuR7BBCNgEi1ltS7NqcxsA/B6t8vBEFYDs=; b=P+JfbxUcyLgPiP9a87iLVbKXG1
	ydqfN/XAOcoV9gXDpL5KZe6dfyWfuLfaNffg7mF9attmXxuB2vjbO5wkQc37g0BEaKfvByx0EUqrX
	zCezG3gNTDeavYuo+sZGUwV+j0q051jmw6kHf5AekN4eFJVTDsIXGyFtZOrvE6rPf2BLsuTMfzb+V
	4PFW81oYl/vG/4wb50NEWPHJSSVjQsDtZcuK/RJG/e/YScL8qaXJ0TkD4PBsSU7G8xCArvHRwwLc/
	LgMnPJ5SeoeczNvMWDyyQdw2k7AxfBIkRMYtSBqwvp/GUx18YsBnVxtVdh0fs3vUNiolWUj8kyyvx
	ZhqQCbEQ==;
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewzT-0000000G5zh-1doL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:59:57 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdd15db60so1158282137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 05:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591190; x=1739195990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e3vrd26snuR7BBCNgEi1ltS7NqcxsA/B6t8vBEFYDs=;
        b=QG4pfrkq8eZAwL307iqqCnHD+x3c/z35HZVL/L1ojJ7d1YYhqpBmRTKewXF7gPR/pd
         xcX1VudO/QFVyPT3ryXO88/hc1A7ELzGTXB++aUTkMnw3SqXP9vp0xGtBbPg8kHsR7Q9
         lVUQ9gLKZz8t1LKG4iapTAwsemkXTwt7AUx/qZTRLdb5najTgymqeBydxRh6Y5b6SNm3
         AJM+PkUGxs7iuYDzmK208TABK6logsqzKLutUcqyqp0lvJoWx9tOuxXNoJhLKfDX6vLl
         ZE+SJsI1D+gyehouZSZkqyu0HfZcrpty3fhWuczmtL/4wyzHQvMpUoJe6kAN91NSixNM
         aAHA==
X-Forwarded-Encrypted: i=1; AJvYcCUHvqw0JH7hbeIlo+pLQG/P71Cdtq4V77d0vwMlB16Gy5xR3HianTYHQfX2UMDP8HlRi53L5ImtJjjtD/GTBJom@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6VCK8AyrvXgyNzItaWrxIcCuwqQ6nFCVwPxan37Fm5P3SolmQ
	4WFzC7w8ATelSCO8DeYMYheQX5H4f1q/DsIt+GU5MokboeGSz5vBOP+2VNwQ
X-Gm-Gg: ASbGncuSh/cYpzzqnodgiZj6xKPm0a6pjwh2xX9ki4GFEt5H9CVGxddOP+oWWtcEz7E
	EmK0Pjt2jDni81EDrU/Ca+2KEzaEEnciScJ0MW9/D5dYorT/YLoqRRkrqQIWXuPKExsz7fqz5pZ
	5bbCdFJh2kASzlc6Ki0zGRNuOU0MT1QrNuXB7lsDeIzKlW7g9YK9LB2n2ljVTqFSH+7NcHQ73nz
	gY2RNQhFHOK27yXpDncgHT8PiCIP5Sg/G5mXfLVKNou+YyMQYRMCNyVIQWIIB3ZxDN00wcMHark
	eXGb03l20Ayu/xZ3mFhHbyByHwQeXz1xgbTSmGzIKPOZ1VX/6knQEON2lA==
X-Google-Smtp-Source: AGHT+IG2KpC2Unn1YvGYY/j9UxD9DBneGnFXO9nKBqXk4MqoniX03Cn1FA0d/ZM7sYhtT+UTIMDHdw==
X-Received: by 2002:a05:6102:3e0c:b0:4b1:8b53:2987 with SMTP id ada2fe7eead31-4b9a4eb44b9mr16237810137.1.1738591190159;
        Mon, 03 Feb 2025 05:59:50 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa18a9bsm1635429137.4.2025.02.03.05.59.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:59:49 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5187cd9b8e5so1399181e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 05:59:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVV24lW8aGV1WYNjQ00muVN/6ft9yjmqWEnJpFtUm9uzqJIVZBC0G5jRICYOW4gy6iit6zGKsQTVhNMQT1DSg3n@lists.infradead.org
X-Received: by 2002:a05:6122:1990:b0:51c:aa1a:2b5b with SMTP id
 71dfb90a1353d-51e9e3fdc44mr15881808e0c.4.1738591188554; Mon, 03 Feb 2025
 05:59:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738329458.git.geert+renesas@glider.be> <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr> <Z5-xMUqrDuaE8Eo_@thinkpad>
 <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net> <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
In-Reply-To: <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Feb 2025 14:59:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZKNtAmiMP8uuSngZMsDLGcYwrLS0xNWzN4UfLaccdyA@mail.gmail.com>
X-Gm-Features: AWEUYZkxzrXQCnvoDXR55r9qIi7LTjZDYDZYK_OEJibEwCDu5alOHeJTYjGkvIg
Message-ID: <CAMuHMdXZKNtAmiMP8uuSngZMsDLGcYwrLS0xNWzN4UfLaccdyA@mail.gmail.com>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_135956_038245_C19A9B69 
X-CRM114-Status: GOOD (  28.77  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Vincent,

On Mon, 3 Feb 2025 at 14:37, Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
> On 03/02/2025 at 16:44, Johannes Berg wrote:
> > On Sun, 2025-02-02 at 12:53 -0500, Yury Norov wrote:
> >>> Instead of creating another variant for
> >>> non-constant bitfields, wouldn't it be better to make the existing macro
> >>> accept both?
> >>
> >> Yes, it would definitely be better IMO.
> >
> > On the flip side, there have been discussions in the past (though I
> > think not all, if any, on the list(s)) about the argument order. Since
> > the value is typically not a constant, requiring the mask to be a
> > constant has ensured that the argument order isn't as easily mixed up as
> > otherwise.
>
> If this is a concern, then it can be checked with:
>
>   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask) &&
>                    __builtin_constant_p(_val),
>                    _pfx "mask is not constant");
>
> It means that we forbid FIELD_PREP(non_const_mask, const_val) but allow
> any other combination.

Even that case looks valid to me. Actually there is already such a user
in drivers/iio/temperature/mlx90614.c:

    ret |= field_prep(chip_info->fir_config_mask, MLX90614_CONST_FIR);

So if you want enhanced safety, having both the safer/const upper-case
variants and the less-safe/non-const lower-case variants makes sense.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

