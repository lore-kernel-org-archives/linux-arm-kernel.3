Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0ACCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KS3sgP/eUxT87vqgC+drQoOFDrxJo6kTsTRnflTVKSQ=; b=ZmCRUG8mOHEucvveJBPQydvUOH
	Wz+opYRSV02kt1bYMiPPZu6hzDtc9OnHu7XuyJBOGdKrB8VIlVZ7bLfiVM7NQFnItcFZvM3ebrDzE
	iUWA8Dm19K45qw/+pY+RPF/m5YaZYCNwg6E6orcTtjagKuUY7jxfq8WwWSAoW5HRoqfDQTD0r99tx
	Ah+EtSzoEXyH5dU+28gWpn4PXqhy2cQxhjeRna5B86I1+JpGDOvWJo3RpobCSrho5kBi/R8XaJi3a
	5bE7QSG8QSxKOmMlNm+xnFUGtHw2W03RHzVg1MkL/4U/2yJhxoYv4cAFcGpXa83giLNLEjcOVktrk
	T2wd842g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3oQ-00000005auJ-3orK;
	Fri, 09 Oct 2026 06:10:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3oO-00000005atA-3RkH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:10:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 455EE60DC6;
	Fri,  9 Oct 2026 06:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331381F000FF;
	Fri,  9 Oct 2026 06:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526232;
	bh=KS3sgP/eUxT87vqgC+drQoOFDrxJo6kTsTRnflTVKSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m94c6dJSC6KB2dY78IwIoo8ekBqOmd5nw+PtP+EH8lg2F8MXcrX/vt3CFVrmOjORv
	 2EZcDAFb4QoRnqGS5kx7W98EH9zEaLaPwkPI/sSf6f+cYA5X3B4MimVwk5d4etzekH
	 CJKJoXOxGGIsm6zdVospuTVNU3mm07SjCcgwNg6s2dM/85dezrqsNeydzljQ/CFw6g
	 GB200OaV+9b8p32LdR1KpQpP2jAdQESH9QrZk9J7w8bRpbqyo6FrNQG37HatBt2XSb
	 2V9ADm+ETbiwbYEFCiuS/DB95TengT1AHQbNZdwCYpxRA75JeP7K0e7JhB4w6vCjdw
	 Obi/bn1qnQ3mg==
Date: Fri, 9 Oct 2026 08:10:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: imx@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-imx-gpt: fix resource leak
 on init error paths
Message-ID: <20261009-miniature-platinum-beaver-fcf647@quoll>
References: <20261009022818.3025610-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009022818.3025610-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 10:28:18 +0800, Haotian Zhang wrote:
> mxc_timer_init_dt() maps the timer registers with of_iomap() and obtains
> the ipg and per clocks with of_clk_get_by_name(), but every error path
> jumps to err_kfree, which only frees the imx_timer structure.  The
> ioremap'd mapping, the clock references and the mapping created by
> irq_of_parse_and_map() are leaked when irq_of_parse_and_map() or
> _mxc_timer_init() fails.
> 
> Release the ioremap mapping when irq_of_parse_and_map() fails, and drop
> the clock references and the IRQ mapping when _mxc_timer_init() fails.
> 
> _mxc_timer_init() can fail after mxc_clocksource_init() has registered
> the sched_clock and the clocksource, and after mxc_clockevent_init() has
> registered the clock event device.  Those subsystems keep using
> imxtm->base and imxtm, so neither the mapping nor imxtm itself may be
> released on that path; request_irq() cannot have succeeded there, so
> disposing the IRQ mapping is safe.
> 
> Fixes: 8051a993ce22 ("clocksource/drivers/timer-imx-gpt: Fix potential memory leak")
> Assisted-by: DeepSeek-V4.1-Flash
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
>  - Dispose the IRQ mapping and drop the clock references when
>    _mxc_timer_init() fails, instead of leaking the IRQ mapping.
>  - Do not unmap imxtm->base nor free imxtm on that path: the sched_clock,
>    the clocksource and the clock event device may already have been
>    registered and keep using them.
> 
>  drivers/clocksource/timer-imx-gpt.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
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





