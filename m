Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEE2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPAYDZWhZdvT52ze2ZOmieMRhyI6YJK1D7vMTJGJV3Q=; b=VNMjPre/9qjj63OqGaucgH96Nh
	KsoOSIFeq6uLyGNWF+sYVAf7q66RLrw6pAw+veBmvzhGAA6mMdKStaE5n0wUVo9yIu8Ekbdirr12W
	GPJ69ALHUBsVt+xlVZYmxzLxr4su8IP0HoLGwihZ61jIIqLQw0yFRiSVif8yL0gkxEvH0k8Edej9I
	6iVQX2Q7VgYC+9gLeuL3Q3A2aiyhGWmzRM8DnqZ7aKPvO3BgLGmglpUpXv2Hqot3WbPs1Da5eijF+
	r7AGoU2bug9Wrtpem4/ipi/Zr63HaqxGg1E1U04QWB2C58HU/yozRRrP8IYSMyxvP3gSi0HhhRIa8
	mAMj+Bkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezgG-0000000G3PZ-2yc8;
	Mon, 03 Feb 2025 16:52:16 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezcC-0000000G2s0-1YfB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:48:05 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so8007356a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 08:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738601283; x=1739206083; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPAYDZWhZdvT52ze2ZOmieMRhyI6YJK1D7vMTJGJV3Q=;
        b=h6NLeuQg6c+loDq4RpE4wg4h5erqbR0Ym/qdL/+rFJawbztwSp9cU+ggoUTTpOpWk7
         8vk7iUYI5dVb/BVUDCmGEaazgvhs1qG8yxpcukONvsXBNGIup8WQDAMBlHBcvgTp7Z3O
         yh7UZvDrmsyt5iODfY8fvvK5JtZNzNJ3vIDtLcJQRzQ6DXjRL9ZCURBBfNrvx6NVgsMA
         CvAM7I26eiFgt294orssz3yWfiBEyOvvxQJcLFCo6WI7EKAIQk2Z+Ubxg4/aYrvoRYwX
         1XjM/GDeMeTmKeqVGmQj58fMxHv8oeHC9rc+bvCQVffCD9fe2LY5RWfA0UQfA3OPhK4a
         79pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601283; x=1739206083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPAYDZWhZdvT52ze2ZOmieMRhyI6YJK1D7vMTJGJV3Q=;
        b=E2uHqloJJPaqQraytu2L3QQ/qY3+2v4OHR4KYCqSYGlQ9TkXqjHREtrFZz063nAsqt
         /Za5LZFjBi8rlJDoEweBs/UgdGsbB9xWJzwyGIA8Pyx6ZCmlxYf8mIa55OE9xKAcnqGc
         E10Ayilg67nKL3pQj8Gl7OXsPrUkqcekGzbapZmYdujrSm6wEkWkX4pqEHRmQ/5Rbiep
         TxinfQW0Ie+ISlDwq8oSaedn5N/z8A/5fhtpgJudFwRcuWjicSheBtbimc8b/oF/IrNW
         LsqMDc5+Ku5qiRvw3N81x44DLRz4hQI3bbYlAOlK8boCGUVPVo6etV4R5uJM0IyyxSQl
         hNUg==
X-Forwarded-Encrypted: i=1; AJvYcCVZu4EYW8BJ1b3L+kuXJOJ9++keZQlKS2TQJYEkmkTe98Ack1qGKB21E4TZgahQ2OPzpSKG/I5TZcPHX4bYYQA9@lists.infradead.org
X-Gm-Message-State: AOJu0YwhLOZb/4EmBGYn3xWdRESplV+8AZzQ6I6LgdSrCjnsjQEolyl+
	07KcKXltIscqE6Ci7RZM9je5ON8ZrZCKPKqdaYsmmmAYCo/9bbj/
X-Gm-Gg: ASbGncvxhAIF0DLSka4Em/52mAJtpJyP2TJRq/8yzA7j8zvSECIjoVgg+xwp181lQB2
	3C7DcDwQXTK+S8ObhGg1fCOAGoe+KjBE2Cx+qA57vChdMZ/+xyhHVZii00V5lJ4tXlqLfmBRH1n
	JbR+uZpJ85lxPaosFHmUC7KCjEUTv2j0FxWpXWLyr8jfH+Q3mqV7+T+Ee3vtmy/zUlCWqzAnR+1
	3Prb9d2i9BtT8lvxSWjThV91XmX3Tqx+vGNTR8MJnivQfl0g960jeOnRbhtC7nsCwDH+Jte055l
	Mb+RIt38oMsXosm9OjuHI8q7O4lqcw46vYm9VW0=
X-Google-Smtp-Source: AGHT+IHh9exrF+8QB08CxBY/dutMFmF0pU/5zhM+ZnTaly80R74kffODtDWK+nW0lOwVLaaD6ED6FA==
X-Received: by 2002:a17:90b:53d0:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2f83abb8f42mr30994632a91.6.1738601283227;
        Mon, 03 Feb 2025 08:48:03 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489adf7csm9341363a91.13.2025.02.03.08.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:48:02 -0800 (PST)
Date: Mon, 3 Feb 2025 11:48:00 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <Z6DzQHebEKBb12Wo@thinkpad>
References: <cover.1738329458.git.geert+renesas@glider.be>
 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
 <Z5-xMUqrDuaE8Eo_@thinkpad>
 <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
 <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
 <CAMuHMdXZKNtAmiMP8uuSngZMsDLGcYwrLS0xNWzN4UfLaccdyA@mail.gmail.com>
 <16e1568d-8747-41e0-91b9-ce23c5592799@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e1568d-8747-41e0-91b9-ce23c5592799@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_084804_412131_BD76168E 
X-CRM114-Status: GOOD (  29.23  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 04, 2025 at 12:41:55AM +0900, Vincent Mailhol wrote:
> On 03/02/2025 at 22:59, Geert Uytterhoeven wrote:
> > Hi Vincent,
> > 
> > On Mon, 3 Feb 2025 at 14:37, Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
> >> On 03/02/2025 at 16:44, Johannes Berg wrote:
> >>> On Sun, 2025-02-02 at 12:53 -0500, Yury Norov wrote:
> >>>>> Instead of creating another variant for
> >>>>> non-constant bitfields, wouldn't it be better to make the existing macro
> >>>>> accept both?
> >>>>
> >>>> Yes, it would definitely be better IMO.
> >>>
> >>> On the flip side, there have been discussions in the past (though I
> >>> think not all, if any, on the list(s)) about the argument order. Since
> >>> the value is typically not a constant, requiring the mask to be a
> >>> constant has ensured that the argument order isn't as easily mixed up as
> >>> otherwise.
> >>
> >> If this is a concern, then it can be checked with:
> >>
> >>   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask) &&
> >>                    __builtin_constant_p(_val),
> >>                    _pfx "mask is not constant");
> >>
> >> It means that we forbid FIELD_PREP(non_const_mask, const_val) but allow
> >> any other combination.
> > 
> > Even that case looks valid to me. Actually there is already such a user
> > in drivers/iio/temperature/mlx90614.c:
> > 
> >     ret |= field_prep(chip_info->fir_config_mask, MLX90614_CONST_FIR);
> > 
> > So if you want enhanced safety, having both the safer/const upper-case
> > variants and the less-safe/non-const lower-case variants makes sense.

I agree with that. I just don't want the same shift-and operation to be
opencoded again and again.

What I actually meant is that I'm OK with whatever number of field_prep()
macro flavors, if we make sure that they don't duplicate each other. So
for me, something like this would be the best solution:

 #define field_prep(mask, val) \
       (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))

 #define FIELD_PREP(mask, val)                                         \
         (                                                             \
                 FIELD_PREP_INPUT_CHECK(_mask, _val,);                 \
                 field_prep(mask, val);                                \
         )
 
#define FIELD_PREP_CONST(_mask, _val)                                  \
        (                                                              \
                FIELD_PREP_CONST_INPUT_CHECK(mask, val);
                FIELD_PREP(mask, val); // or field_prep()
        )

We have a similar macro GENMASK() in linux/bits.h. It is implemented
like this:

 #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
 #define GENMASK(h, l) \
         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))

And it works just well. Can we end up with a similar approach here?

> So, we are scared of people calling FIELD_PREP() with the arguments in
> the wrong order:
>
>   FIELD_PREP(val, mask)
> 
> thus adding the check that mask must be a compile time constant.

Don't be scared. Kernel coding implies that people get used to read
function declarations and comments on top of them before using
something.

Thansk,
Yury

