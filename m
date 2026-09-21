Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9826C982F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMTxb+mrtRH4SZa45PP2QG37d3OHVFOsk6tg8TRWT1Q=; b=zRRjB24/e1seNV/PjYGZZcz9B2
	KDYYCj2RdDdv192VB+qL27Yt2Q3Tn023rx3F+FtlA7Gk5bM4nWQWzNnkfptqcC7k9PrDJcyc/881t
	53YUHkWUHvIU6rNTPqAVsPx6Egnerr6GtnPyWz986hccUB8W7ikeRyQu+rN2ieu9cymtR5ZjJmWKv
	0e/8Lj+qTxB7HxWgTaqz1fXcc1ARVX9UtpXi5I3vqmdLGfyd/hkvpmb8PBCNUYcz2bhqw8Edx/cgS
	QQOAZ6SxqWipTRug1GH0C9Mr7sQmXuiMtxD5wRvfXwQtim+PpM6P6xhE/yH68q8umiNPvkTTh2cBc
	0vJ1R8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fhf-00000002ZPq-1yq1;
	Mon, 21 Sep 2026 15:13:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fhd-00000002ZPj-3svb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:13:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F16942E2D;
	Mon, 21 Sep 2026 15:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D85E1F000FF;
	Mon, 21 Sep 2026 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003589;
	bh=QMTxb+mrtRH4SZa45PP2QG37d3OHVFOsk6tg8TRWT1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iJCEI1oOSZdZ4wOPsD7JtxZtw8COX3cI+qeiJBArITZKgCViGq0E5FOiAnLvsGBVI
	 ZSRYWgKerrALYWgng07D/4nnKr5lUd68rXvg5er+Q11vmS7L8pAmODUngLmS2oWM9o
	 ly6hbus0vnsWmeif2oKqQvbfy9lz2kuafLFK7k8lXwo+5Ff4zl3+RP8J08DP1P08lD
	 fKgI8Rw9diXgbHWfTPald21ls9kewQ07UZuG9t7slqWiTTxr8zFyJ38CcXce/vW1eK
	 xP8dDhXYRlVxh7H9tM12rBkXUk6fKTei6WT16owIuOJRgbPI7w59BBPle8YP5gwzaS
	 A38N6PnCXAsUQ==
Date: Mon, 21 Sep 2026 17:13:06 +0200
From: krzk@kernel.org
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linusw@kernel.org, stable@vger.kernel.org, sboyd@kernel.org, 
	linux-clk@vger.kernel.org, bmasney@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in
 of_syscon_icst_setup()
Message-ID: <arFJgR0SKZRd-EmK@quoll>
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915070103.1733176-1-vulab@iscas.ac.cn>
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


On Tue, 15 Sep 2026 07:01:03 +0000, Wentao Liang wrote:
> of_get_parent() takes a reference on the syscon parent node. The
> reference is intentionally kept on the success path, but the error paths
> return without dropping it, leaking the node reference. Release the
> reference before returning on the error paths.
> 
> Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/versatile/clk-icst.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 


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
subsystem, how to document usage of LLM and how what you should not
do if this was posted in a good faith.

Best regards,
Krzysztof




