Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97970CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QspHgvhexBo/96gD+93/ZvCQ+ECziB5aSNYOJ4PzkgI=; b=2o5i8esSz1WtccudOBqej4fsGJ
	abTyn74po2c5PosOaR/YEw8zZSdbKMZskKLH5PP6cidqnjWFF6IFONq4nXDoAw1PyE8/uSd/bpneg
	SsKev4ze1h6KgDZKApwVdxw77nEXkRA+v+hz60ySXCQit0TCVWo0GtvfkUhp1p2kUvkkDqnYc8hvK
	lj44MnWz8abFNn1FB3fRnDP5Kuk7fMq4M4dL9Rmcvl79eC8va5f+21i1wWIvCPe8qdXAv0JEZOuHx
	O+o6oo58N1g20Su5/93vPz1t2+b/Oe71TWttDagNTPQpHxYiqaJnqcRZnZxt7AvDbrNH1SXCJhxef
	qFIcz3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3ox-00000005bDm-1C6M;
	Fri, 09 Oct 2026 06:11:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3ov-00000005bBt-1Do8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:11:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E70440552;
	Fri,  9 Oct 2026 06:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E211F00898;
	Fri,  9 Oct 2026 06:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526264;
	bh=QspHgvhexBo/96gD+93/ZvCQ+ECziB5aSNYOJ4PzkgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cMKBbQm5T0RW9UEpxoochiCoroChcortLtbVt6zfW/367irjuWv54gbHg4Pmla2NY
	 +ofSFj1KD636ThX1Si8snSQkKKmDQ2CnXNAyi8S+2rmZL72JBmfY+DqDYqpmEVlaQb
	 Lrl+Agw5U1PqQ7ZTzuLZVkB9WlfOB7gCRvE1dhccjC2CEJAKLXpdiR6hx4SSpZByK+
	 AZAhkRjrOZ5ieFhVWsJShx3zQaqTGFG9SDpKGLS3OuCJYtLnXezZ6lBZd6yWR0GN+x
	 dRke3sbO16lv6ycm7IVvpYqG7pEm9LqRabOqYNb8rFbwwUejoRFH8NlgcWkQhLosvl
	 ACU/yPIDMYKNw==
Date: Fri, 9 Oct 2026 08:11:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] clk: at91: fix device node reference leak in
 at91sam9x5_sckc_register()
Message-ID: <20261009-graceful-visionary-capybara-efbcc0@quoll>
References: <20261008163052.2685401-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008163052.2685401-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 00:30:52 +0800, Haotian Zhang wrote:
> at91sam9x5_sckc_register() calls of_get_compatible_child() to look up the
> "atmel,at91sam9x5-clk-slow-osc" and "atmel,at91sam9x5-clk-slow" legacy
> child nodes during DT backward compatibility handling. Both calls return a
> device node with its reference count incremented, but neither reference is
> ever dropped: the first is simply overwritten when the second lookup
> reassigns child, and the second is leaked on every return path, including
> the unregister_slow_* cleanup labels. of_clk_add_hw_provider() takes its
> own reference and does not consume the caller's.
> 
> Drop the slow-osc reference once it has been used and release the remaining
> child reference on both the success and error paths.
> 
> Fixes: 45b5ec8498ff ("clk: at91: modernize sckc binding")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/at91/sckc.c | 5 ++++-
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





