Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA503CA601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpB4oW+VzOYkr7heF4ZAZX4wxYt/dyntVxClV6LD6MA=; b=pvTENE6dkxeSehO+53xN+kFPXi
	WlPFk9ImqS0rEw+W6oX8gzlaVBu7ElkTGBNDgBbtLEuwux3lNbcwlXhtfW5iyp791Gix9SdRNM9Va
	U+TnlQy+fu9NYXb1ttPThjw/c+QXo6MiE72vwANp5C3BvGXbThMbAChmdxKGpv3WX753lZOQlpz0Z
	XKCJ09XCp2SronOBQSFMLuWnD1QYQQ6tE/XNoZEBLnW+AIC+ao1tPd5eAlShaGLarhLN3ktFjlyIQ
	SVs/CQhS4pC5vC8iAETL671WKmyVVF1pEL9Bj2LoNQ0al9GAu6zfn4y3Wv/mttxhOWWmkXnLcBjMn
	A78ZGb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3o2-00000005akx-2tGk;
	Fri, 09 Oct 2026 06:10:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3o1-00000005ait-1naw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:10:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8018860DBA;
	Fri,  9 Oct 2026 06:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA501F000FF;
	Fri,  9 Oct 2026 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526208;
	bh=cpB4oW+VzOYkr7heF4ZAZX4wxYt/dyntVxClV6LD6MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D1+U/T1DTXrKOdz8Lv6py/jO8w8IHJBD8IPmHKS0E1Y8KxayrpNP93hBJoSFgfSPV
	 /hFFwtE9RsEYzqPbhs7yhLo8/6lkM9Bjp5autcvT5leBDIChFixFTFlbSGDXnWpkxx
	 /pTSOAXNetSTkdVNPSCMinflG3TKFFJelcPyPyp4Hpm+GZGBogw9k0JTSNhHdFHwQ/
	 JjQxCB0VsSVQq0J8BqxdMSsL/2LaAVfOY6POPlb+YWaldn7Cspw6fs6qIufLRsKsul
	 Y5mb/3mUFgH6wo1ZSBQ8bJAbyVTqxVDIWixETHkd6GJqsb/SBGKHlbdlkxQtRy1+h4
	 IWjOkCneuMW2g==
Date: Fri, 9 Oct 2026 08:10:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, 
	Linus Walleij <linusw@kernel.org>, openbmc@lists.ozlabs.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, 
	linux-gpio@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] pinctrl: aspeed-g5: fix device node leak on LPC
 compatible mismatch
Message-ID: <20261009-practical-malachite-scorpion-0be0c5@quoll>
References: <20261009041435.3096107-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009041435.3096107-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 12:14:35 +0800, Haotian Zhang wrote:
> aspeed_g5_acquire_regmap() takes a reference to the LPC device node with
> of_parse_phandle() and then returns -ENODEV if the node's parent is not
> compatible with "aspeed,ast2500-lpc-v2", without dropping that
> reference. The function is called for every pin configuration, so the
> leaked device_node reference accumulates on such systems.
> 
> Release the node with of_node_put() before returning from the error path.
> 
> Fixes: eaffd32bea0c ("pinctrl: aspeed-g5: Adapt to new LPC device tree layout")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof





