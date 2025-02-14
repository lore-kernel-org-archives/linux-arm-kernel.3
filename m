Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082AAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI8KVq1D2a2mMAsVtcWo7XlUKAeczvE5EfV30VmWJCY=; b=LNVo3DdDoq74+l4V1TaqR7Y2/6
	9RBAovG7VQ+v/8+NwWSwfE5V18VFK7hfc6TskHDKqITwnCUhKrAWB5RpbazDGfxoqWJajFQ3zf1jN
	/jc+h4z9iFpLH5SoC/h6WxKTucJM7IhZ8leOq0O7uNFchRUO/Q1XY/reRuC1sj59H/iLQWAPDU0e8
	KLUcdvITwAAwAfYOKZ8qW7OqJeRjmQw55O4wboIBn7gBqE3JxUhWca89A3F4bf34456pA++6SxmQK
	Q6gXUeUVdIWpfGK+EXC4CNWHHvg7MZv3ffQCKc2AxU7ClTOFjh+Hwaz3nWl+QUZzgim/L+8Lo9jsS
	ilFDocmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tix0W-0000000FDHS-2E6u;
	Fri, 14 Feb 2025 14:49:32 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwr4-0000000FBaA-1HUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:39:47 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6efe4e3d698so19167807b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543985; x=1740148785; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BI8KVq1D2a2mMAsVtcWo7XlUKAeczvE5EfV30VmWJCY=;
        b=nQt0snN7PYKPjbM7cZjway8RSm8bfxOOPLBxNzeMLBMz+9Y5oF4PPUrbBhAWqygHAB
         lBvsSCH6kZOdiS0Ds7PhYGq2FVcwWRC584d2O2LQ+AmgSC7Tc5aGtU/CT/6b2Hg0CBGJ
         SVuhY+UuGxTS3Qy770dLuBGF7ZYG+rIbUs1ZdZ1UeBOyJzulS0Sry5jlWeB4qLE78eZ/
         KuiHSL8kIg8rhhShFkxTFiqd7eVRNcD3xYV3rYIZuiTTOWoguLeD0TgeLfn9ME7VCs7P
         pUpZbAhxT+OWUcFN7WS+m1wZPAT6fDXc1qX8rh6azEFjff/IbaOJfsXPpMhmqne9BHuW
         YCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543985; x=1740148785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI8KVq1D2a2mMAsVtcWo7XlUKAeczvE5EfV30VmWJCY=;
        b=YKZ/t2s7dZGdWRcG7dblWRrRW+Gu0rvu3XkEhHGoLnYFz/WY4s5BEYXslEszwbDvjK
         g0qOh8NaLZQkSNrllCw5zaL65VCmd0XhovK/l/AoTe2e5wi9DVhWayip+1p3ZbUUeoby
         nJCN3qfHPNktT2Jn4Hh0/7fLPuaF3b+Vv27Yeymmdy895W4eHtNsnbUcNUnk9F90Olz9
         cgzflWq+aEYlesMH3xcpQDliZJya3Q1jdm2IiIDH2Cbth2wUSGWlS180u7tAfhcp1UDe
         fPMxOEUvSSkAXOhm3maUEgw9MFULCa3yLjLpoftKNA0JOLlMNCrDrO7H6VXjgp0klz9b
         EmOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOhdj/Ojno5BGe26GNfAhORICzNflQaUoiWKWDRA7xYoqu0MCcY9onJYwdGRgR7d1cfxZyRVIHblhqpHw92Qah@lists.infradead.org
X-Gm-Message-State: AOJu0YxCkdFrK51h26lD/0F/qiWvKg+3WEuh9V49UIv9Ez3skigSiIfv
	QCqmqescXxm9JflwezXCY3IPSm/XxApZ5YSqA90egocy9KnGba6F
X-Gm-Gg: ASbGnct9ZugGA/Nt9BOiVXlCQgMPDkRcS4n0VisbTHkExIh7TR1AaVkHn/FoqKCdBp4
	DeANvnDvdUYuxjp3I9JVI4MLqCtIhw29x6c9Wy9QZDsbxwMnsV20/jILntHtYe+3VxN4VDOvF82
	+RQmgUHByjQm4EAm5IHVRoYOuAuINQSANFZ4tUioXeG+ROrPelsRw2FvdHABc3UdOXIsh+WzAh+
	EBzHzgLq27Sz3MF+8uXwlTilxWszoF/AqGkOhb+sZgLJirRi17O8CststsR5zFaW+DyA0HjIVgW
	gFJGfw6Hkd5gmrYOFIA6lQjGz929gH+0uN9nJaGhzf1M/9rK8p4=
X-Google-Smtp-Source: AGHT+IFSk6lpEhh1WcbK3saqrHokhIjyrUSazUu/lghjS/PE2nJjXAP82B0Z/67hwQGCLhksXNnAww==
X-Received: by 2002:a05:690c:6206:b0:6ef:6fef:4cb6 with SMTP id 00721157ae682-6fb1edcc561mr119515777b3.0.1739543985181;
        Fri, 14 Feb 2025 06:39:45 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fb3609589asm7800987b3.56.2025.02.14.06.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:39:44 -0800 (PST)
Date: Fri, 14 Feb 2025 09:39:43 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <Z69Vr4ZGlrq7HxmT@thinkpad>
References: <cover.1738329458.git.geert+renesas@glider.be>
 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
 <Z5-xMUqrDuaE8Eo_@thinkpad>
 <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
 <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
 <CAMuHMdXZKNtAmiMP8uuSngZMsDLGcYwrLS0xNWzN4UfLaccdyA@mail.gmail.com>
 <16e1568d-8747-41e0-91b9-ce23c5592799@wanadoo.fr>
 <Z6DzQHebEKBb12Wo@thinkpad>
 <CAMuHMdVFG57rUVC-XXk6bsZupVTeV0YAcue=zKWGnm4owjDiEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVFG57rUVC-XXk6bsZupVTeV0YAcue=zKWGnm4owjDiEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063946_345130_DF9CCCE1 
X-CRM114-Status: GOOD (  35.40  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Jacky Huang <ychuang3@nuvoton.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2025 at 12:03:16PM +0100, Geert Uytterhoeven wrote:
> Hu Yury,
> 
> On Mon, 3 Feb 2025 at 17:48, Yury Norov <yury.norov@gmail.com> wrote:
> > On Tue, Feb 04, 2025 at 12:41:55AM +0900, Vincent Mailhol wrote:
> > > On 03/02/2025 at 22:59, Geert Uytterhoeven wrote:
> > > > On Mon, 3 Feb 2025 at 14:37, Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
> > > >> On 03/02/2025 at 16:44, Johannes Berg wrote:
> > > >>> On Sun, 2025-02-02 at 12:53 -0500, Yury Norov wrote:
> > > >>>>> Instead of creating another variant for
> > > >>>>> non-constant bitfields, wouldn't it be better to make the existing macro
> > > >>>>> accept both?
> > > >>>>
> > > >>>> Yes, it would definitely be better IMO.
> > > >>>
> > > >>> On the flip side, there have been discussions in the past (though I
> > > >>> think not all, if any, on the list(s)) about the argument order. Since
> > > >>> the value is typically not a constant, requiring the mask to be a
> > > >>> constant has ensured that the argument order isn't as easily mixed up as
> > > >>> otherwise.
> > > >>
> > > >> If this is a concern, then it can be checked with:
> > > >>
> > > >>   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask) &&
> > > >>                    __builtin_constant_p(_val),
> > > >>                    _pfx "mask is not constant");
> > > >>
> > > >> It means that we forbid FIELD_PREP(non_const_mask, const_val) but allow
> > > >> any other combination.
> > > >
> > > > Even that case looks valid to me. Actually there is already such a user
> > > > in drivers/iio/temperature/mlx90614.c:
> > > >
> > > >     ret |= field_prep(chip_info->fir_config_mask, MLX90614_CONST_FIR);
> > > >
> > > > So if you want enhanced safety, having both the safer/const upper-case
> > > > variants and the less-safe/non-const lower-case variants makes sense.
> >
> > I agree with that. I just don't want the same shift-and operation to be
> > opencoded again and again.
> >
> > What I actually meant is that I'm OK with whatever number of field_prep()
> > macro flavors, if we make sure that they don't duplicate each other. So
> > for me, something like this would be the best solution:
> >
> >  #define field_prep(mask, val) \
> >        (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))
> >
> >  #define FIELD_PREP(mask, val)                                         \
> >          (                                                             \
> >                  FIELD_PREP_INPUT_CHECK(_mask, _val,);                 \
> >                  field_prep(mask, val);                                \
> >          )
> >
> > #define FIELD_PREP_CONST(_mask, _val)                                  \
> >         (                                                              \
> >                 FIELD_PREP_CONST_INPUT_CHECK(mask, val);
> >                 FIELD_PREP(mask, val); // or field_prep()
> >         )
> >
> > We have a similar macro GENMASK() in linux/bits.h. It is implemented
> > like this:
> >
> >  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> >  #define GENMASK(h, l) \
> >          (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> >
> > And it works just well. Can we end up with a similar approach here?
> 
> Note that there already exists a FIELD_PREP_CONST() macro, which is
> intended for struct member initialization.

Hi Geert,

That was my suggestion. Now that we're going to have many flavors
of the same macro, can we subordinate them to each other? 

