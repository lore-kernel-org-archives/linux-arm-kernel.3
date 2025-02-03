Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC38C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/g4W8zsNjOkB4DJtFhM/WsfKs6gE5EsQ2w79HWI72oI=; b=s9HNnfAqpNPNzT
	A++SJYmAiOYhzgPGQv8GYGhR+mIyZ6ivA0EWWyJMArBynCbnAfs1yb7BjqdpNHFm4x9cNupnENnHq
	D+Q3YID2UAQto+xpTyIxGCxCK23NbKPPPwEtmyFwoNEM5L1I/6atIzZJDlacKEAuHuvS4mTK+cKBr
	N6pvSSN7qzZZapOkUY11X41Ny4z2UtHr+c4Um83qm1o534N/w3FkTuebAP5Ivj4oNS5GQ6pY54UR0
	0ekDdYKUEkPpzZMYHBNPGE1OAw9/Au34H8XxbEKC1vfSovcnRgNHf8hMzZ6VE90rHCdwJW933WZVV
	TycSlVBbBs2qJDq557wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewfm-0000000FXvs-2Xws;
	Mon, 03 Feb 2025 13:39:34 +0000
Received: from out-69.smtpout.orange.fr ([193.252.22.69] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewdl-0000000FXYM-05Nb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:37:31 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id ewd2tOy0dEoZKewdIt5Ip4; Mon, 03 Feb 2025 14:37:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738589839;
	bh=/g4W8zsNjOkB4DJtFhM/WsfKs6gE5EsQ2w79HWI72oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=XwYwJD9qo2zk974igNaK7YRqOSOeQpGfDoLCz5WdqzVZVaQCeXRz5fRwVtek4nccr
	 IIPachRHSkoVTOEAWF+Q1RzHqSOorzh7zXI195lPeh6rI9NWNNeXuWFRvNezWJTw3p
	 PujsqHiaXsnhXn4ml0tu+soSLAwHQx/2ykUaxgbrj/FrCgmqj2lH181uuMut8tBYuy
	 aja0FJrJQgnw/6NiWOYkVZxNTWgTqVbG3qy26HXJ2+cOUzaAglixyIojvdf5gfQ1kK
	 saeXLw4BQa+dsq1UxBUW8SPV6tQMuEPXP5HvV9PLKQ6hwtsv5+NhzubCQc+XQUYX3M
	 ZF/4/IEW0rvcw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 03 Feb 2025 14:37:19 +0100
X-ME-IP: 124.33.176.97
Message-ID: <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
Date: Mon, 3 Feb 2025 22:36:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Johannes Berg <johannes@sipsolutions.net>,
 Yury Norov <yury.norov@gmail.com>
References: <cover.1738329458.git.geert+renesas@glider.be>
 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr> <Z5-xMUqrDuaE8Eo_@thinkpad>
 <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
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
In-Reply-To: <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_053729_481757_7CC6C4B1 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 03/02/2025 at 16:44, Johannes Berg wrote:
> On Sun, 2025-02-02 at 12:53 -0500, Yury Norov wrote:
>>
>>> Instead of creating another variant for
>>> non-constant bitfields, wouldn't it be better to make the existing macro
>>> accept both?
>>
>> Yes, it would definitely be better IMO.
> 
> On the flip side, there have been discussions in the past (though I
> think not all, if any, on the list(s)) about the argument order. Since
> the value is typically not a constant, requiring the mask to be a
> constant has ensured that the argument order isn't as easily mixed up as
> otherwise.

If this is a concern, then it can be checked with:

  BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask) &&
                   __builtin_constant_p(_val),
                   _pfx "mask is not constant");

It means that we forbid FIELD_PREP(non_const_mask, const_val) but allow
any other combination.

> With a non-constant mask there can also be no validation that the mask
> is contiguous etc.
> 
> Now that doesn't imply a strong objection - personally I've come to
> prefer the lower-case typed versions anyway - but something to keep in
> mind when doing this.
> 
> However, the suggested change to BUILD_BUG_ON_NOT_POWER_OF_2 almost
> certainly shouldn't be done for the same reason - not compiling for non-
> constant values is [IMHO] part of the API contract for that macro. This
> can be important for the same reasons.

Your point is fair enough. But I do not see this as a killer argument.
We can instead just add below helper:

  BUILD_BUG_ON_STATICALLY_NOT_POWER_OF_2()

But, for the same reason why I would rather not have both the
FIELD_{PREP,GET}() and the field_{prep,get}(), I would also rather not
have a BUILD_BUG_ON_NOT_POWER_OF_2() and a
BUILD_BUG_ON_STATICALLY_NOT_POWER_OF_2().

If your concern is the wording of the contract, the description can just
be updated.


Yours sincerely,
Vincent Mailhol


