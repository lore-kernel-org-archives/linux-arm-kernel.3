Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB9CCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/du9wEuofXf+8NbTewi6KKBVFh5WF8XdhjIfsLZhNPY=; b=a9ZRWx9ZuFm8OLoVYB41/1spzv
	t3fBhtCFWhU21BMpsojXhMxIQWnSjZeIIObEgQRpFnC9fonx7bfZfleapFIKPct288LCZlcaxlxia
	TJx7eU5kpxH8qwXmLy4z7cRNvDvXqzAinApG+RobjWEOZCC7FepWAfS4W9MI/Q/ZMf4oLzpWV0J4/
	fpilh0WMgz9P7e3FWUE8mAc8qSxX+rlBEw68vKx8P5x/p6vtIwVXXpC23m6IGLQANQZMvGXgN005D
	yMaAmuNieolad1Pz5d926nPKo8/adXjBVriqox4U1zsFcYbHuDoIlCxi6bpzEzMOXYYR+ZMyYSU1T
	SLJfYmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3l7-00000005aMA-3Gw9;
	Fri, 09 Oct 2026 06:07:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3l6-00000005aLt-1U1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:07:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF45943EF6;
	Fri,  9 Oct 2026 06:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9951F000FF;
	Fri,  9 Oct 2026 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526027;
	bh=/du9wEuofXf+8NbTewi6KKBVFh5WF8XdhjIfsLZhNPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJn2rdhhDpXpLRyXCcGSYUFO/xWY5xiZdafVQU1xOzhsoWwUAkE7qApwY0rbkTBQo
	 7vNmfT4A8ISrIKc7VP5ODQFkITYw2+h61ovVyxopBilrL0H+rbDIvOZoD3jNjoI1t3
	 AFcNV0RCk81mpQcDL/Mex9farBXuY5MHc7tA/gOZ1v813oGm3pOSTsqduCMD25YPZj
	 2tEzVXH/3tygzuSFHZnvzo/o1s/VU/EyEKHe7lKokp9hFxK+rFam01Z3rqP6TnyLWK
	 K+bIYmQ/yyHq7F4oXZuAGpqo4oESvdE6t85AgcEYs+LtPPaQzMwjaMHnYgT5SbGmyV
	 iAUfzwcY6PAQQ==
Date: Fri, 9 Oct 2026 08:07:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Qiang Zhao <qiang.zhao@nxp.com>, Herve Codina <herve.codina@bootlin.com>, 
	linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: fix wrong clocks released on cleanup
Message-ID: <20261009-serious-jasmine-bumblebee-10ae3d@quoll>
References: <20261009053720.3146117-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009053720.3146117-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 13:37:20 +0800, Haotian Zhang wrote:
> tsa_of_parse_tdms() gets and enables tdm->l1tsync_clk and
> tdm->l1tclk_clk in addition to l1rsync_clk and l1rclk_clk, but the
> error cleanup path releases l1rsync_clk/l1rclk_clk again in the
> l1tsync_clk/l1tclk_clk branches. The tsync/tclk clocks are leaked --
> never disabled nor clk_put() -- while rsync/rclk are clk_put() twice,
> underflowing their reference counts. tsa_remove() has the same
> copy-paste bug.
> 
> Release the clock actually held in each cleanup branch.
> 
> Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/fsl/qe/tsa.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
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





