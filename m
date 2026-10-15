Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF04CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 23:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqgjptSJYB8M8KjBGqcIQm/2GAUwPEW5qf/45/mQNPs=; b=wMuD/WmgY87XzuB3oKF9WXqRAb
	YwsYD4ZP2Y26lfd/u+6rrOGFpkGZNWqNvcFdD0qESFlri5s15orggJxeB8k+IvrUcb3LAg3kCp+VZ
	qLWHKWol0NUJc3GXy9rl3o41SEZGd2jQPYnCSE2QJCJHT4/61uJpXEHJ9rdFmVOjOEBwuK+Rhgge8
	0qOJ4HEEdiecVHbLzt8L4UWRFF2TAtqgFB2cFQbywAlseSTw4aCcD18M8rOL66VgcHQ4ApRPEw6Yy
	M5URxvsshw+y8vcvPhnvbhW2bPTvJQx0r/BaCjcu5npJI7Sf9lSE1gZVLLrwY3OhH3I4BQYiV8byi
	rmUzQVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHV1s-00000001ZEK-2wcD;
	Thu, 15 Oct 2026 23:38:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHV1r-00000001ZEA-0Mbs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 23:38:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FAD960A86;
	Thu, 15 Oct 2026 23:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1D71F000C4;
	Thu, 15 Oct 2026 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792107509;
	bh=hqgjptSJYB8M8KjBGqcIQm/2GAUwPEW5qf/45/mQNPs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DvE5N87dZCKhi52NantoYMA7HPg28vsI0ttvJm4dMmjRv6uK4w1WYew2Fd+vYWlgR
	 UHvUgqnW3hfZv0kevvWqeTdV9E00AwU5R3ebP/lqM3v32WqP9qJ3rhMkPFP4xjy4zI
	 p8IvO9yvenBmrVX41PI926WooF5jUhCDVPgoWq8zhsMMRC5ymBGIz0iIlxhSKwG3ew
	 rpp7KOvAZjhUeC49x55xHT7ugflZLWnTr4f9fzStZVD2eKj4bcRhVey7/mrHsyodA6
	 4Ux/NYvy01RZQm0SqU8WFpZBRbswhBakszQW1/YEE4rSolsp/LQVzDQ2Qo6MXJ7sj/
	 nqJ7pAzcGPtwQ==
Date: Thu, 15 Oct 2026 16:38:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Russell King
 <linux@armlinux.org.uk>, Lorenzo Bianconi
 <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 thomas.petazzoni@bootlin.com, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Peter Robinson
 <pbrobinson@gmail.com>, Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 1/3] net: rss: Require indir table size or
 hash key size to support RSS
Message-ID: <20261015163828.619c7a09@kernel.org>
In-Reply-To: <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
References: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
	<20261002142806.1299041-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  2 Oct 2026 16:28:01 +0200 Maxime Chevallier wrote:
> @@ -457,7 +460,7 @@ rss_dump_one_dev(struct sk_buff *skb, struct netlink_callback *cb,
>  	for (; xa_find(&dev->ethtool->rss_ctx, &ctx->ctx_idx,
>  		       ULONG_MAX, XA_PRESENT); ctx->ctx_idx++) {
>  		ret = rss_dump_one_ctx(skb, cb, dev, ctx->ctx_idx);
> -		if (ret)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;

nit/btw this change is not needed. The context dumping is entirely
handled in the core, if device let us create one there mustn't be
a EOPNOTSUPP here.

