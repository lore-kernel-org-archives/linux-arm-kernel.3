Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C67C02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZsvS79FyvH7npVg4P4SWlQ3ou2VaFduLz7By9FNQMM=; b=1qU090A2Wr+dqn
	KhSiIjiEul0XUNBlNzFvOwaJeHtyohNe2ZXOy/j+KVHoSPBKIX84uuxTtwhA4zTVyPPGCjta95cpy
	WU+/7aXdoFxkd5VBt2lwSCVWWrjZ6YMZdBPJinwQwgYbzffmM7gF01FOFa9ERESk8/tH9SuIIRadM
	7YY47rzkcHyCgQJtT4+4D/Jn8PZf3GwwEwcz4HGwP06JOcApjqmuoIkf8K+E7c9ICGKkYS3l0N57a
	0Bh1LAzUALflmbeAcOX7+Ej0G8LuZzx6qkUE2+MVK+mwnugawQxeFBVRp42lvOCr7GYryMNgItQym
	1+6qUPXFvNPFi6/y8XMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teydN-0000000FuZA-1vZ7;
	Mon, 03 Feb 2025 15:45:13 +0000
Received: from out-72.smtpout.orange.fr ([193.252.22.72] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyad-0000000Fu9z-03wh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:42:25 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id eyaCtfZi6inFieyaHt4JBP; Mon, 03 Feb 2025 16:42:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738597339;
	bh=RZsvS79FyvH7npVg4P4SWlQ3ou2VaFduLz7By9FNQMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=E6vkO1BKyl9ZpZ/TIQbXnlfLL271wV2srdURu+fgQIsPEjIDixSMulc1y5cgOUdvQ
	 iU0xocdrubJQbaGqdM4S1eETa1X3VnmbyIlCpIe+a4qtacRIMNgrbIBohfYQ/Cbs11
	 4XcRUGo4AdWzSsrodY9VqO3xRb+ccURkqfTphOk6wf42jjzptRkf6Ew7LUPb8/7xmB
	 4nxFwkSmDXyg1SOWrja+h9uckxzLz1buRrs02RmLyeg90pT9qhR9xDfFtDYVrbgxVL
	 8i8tQrSryz9UIKkC0YPWmVq5f1paxeJQ4qhOnmIpEQ2eQwpF8/yY2k5burgk4+LioO
	 cQ9XcwAjHlJHA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 03 Feb 2025 16:42:19 +0100
X-ME-IP: 124.33.176.97
Message-ID: <16e1568d-8747-41e0-91b9-ce23c5592799@wanadoo.fr>
Date: Tue, 4 Feb 2025 00:41:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1738329458.git.geert+renesas@glider.be>
 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr> <Z5-xMUqrDuaE8Eo_@thinkpad>
 <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
 <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
 <CAMuHMdXZKNtAmiMP8uuSngZMsDLGcYwrLS0xNWzN4UfLaccdyA@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <CAMuHMdXZKNtAmiMP8uuSngZMsDLGcYwrLS0xNWzN4UfLaccdyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_074223_464404_1DAFC293 
X-CRM114-Status: GOOD (  18.66  )
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

On 03/02/2025 at 22:59, Geert Uytterhoeven wrote:
> Hi Vincent,
> 
> On Mon, 3 Feb 2025 at 14:37, Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
>> On 03/02/2025 at 16:44, Johannes Berg wrote:
>>> On Sun, 2025-02-02 at 12:53 -0500, Yury Norov wrote:
>>>>> Instead of creating another variant for
>>>>> non-constant bitfields, wouldn't it be better to make the existing macro
>>>>> accept both?
>>>>
>>>> Yes, it would definitely be better IMO.
>>>
>>> On the flip side, there have been discussions in the past (though I
>>> think not all, if any, on the list(s)) about the argument order. Since
>>> the value is typically not a constant, requiring the mask to be a
>>> constant has ensured that the argument order isn't as easily mixed up as
>>> otherwise.
>>
>> If this is a concern, then it can be checked with:
>>
>>   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask) &&
>>                    __builtin_constant_p(_val),
>>                    _pfx "mask is not constant");
>>
>> It means that we forbid FIELD_PREP(non_const_mask, const_val) but allow
>> any other combination.
> 
> Even that case looks valid to me. Actually there is already such a user
> in drivers/iio/temperature/mlx90614.c:
> 
>     ret |= field_prep(chip_info->fir_config_mask, MLX90614_CONST_FIR);
> 
> So if you want enhanced safety, having both the safer/const upper-case
> variants and the less-safe/non-const lower-case variants makes sense.

So, we are scared of people calling FIELD_PREP() with the arguments in
the wrong order:

  FIELD_PREP(val, mask)

thus adding the check that mask must be a compile time constant.

But if we introduce a second function, don't we introduce the risk of
having people use the lower case variant instead of the upper case variant?

  field_prep(incorrect_const_mask, val)

I am not sure to follow the logic of why having two functions is the
safer choice. Whatever the solution you propose, there will be a way to
misuse it. Let me ask, what is the most likely to happen:

  1. wrong parameter order
  2. wrong function name

?

If you have the conviction that people more often do mistake 1. then I
am fine with your solution. Otherwise, if 1. and 2. have an equally
likelihood, then I would argue to go with the simplicity of the single
function.


Yours sincerely,
Vincent Mailhol


