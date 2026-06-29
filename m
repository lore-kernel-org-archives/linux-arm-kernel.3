Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F39FC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OefiiQrvn89AQEAbF+kGS4kS8/GJWqFI5ZJnOSdsCfo=; b=Y8tVztyzOoAc1RYBJlxjGcwO4J
	d4JINRbssE27i9p+ldrQI3pDufzhw1SJtHlh5rIQJ8blsEvMAZoQlDbp1ON6lFzyAuRtX2fbXMPga
	kfCCgE7Y75ZmMTSdSYAmHjtSDZIUx0uUy8wcHGIDobn77vFpjQW7WTTltSNcc1zKsNv6R4OGamufJ
	ipWNEL4GG0DHHWACZs5QuqqQPvwQ3HfbfzMm9XJHeY3WxS9ykXNiACfdhr3/quJntMnivqwsShQYW
	s3sDF0hhWBt660wfjldKHGItf5aL0sMpaAHXbtJh5F6e8KE95fYCMbRz5vRVtWC3QU8ccMRGHK4Ka
	fCkz1c7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weKiQ-0000000FYaX-2FdR;
	Mon, 29 Jun 2026 22:44:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weKiO-0000000FYaR-2Zta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 22:44:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C98B943BF7;
	Mon, 29 Jun 2026 22:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BE11F000E9;
	Mon, 29 Jun 2026 22:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782773070;
	bh=OefiiQrvn89AQEAbF+kGS4kS8/GJWqFI5ZJnOSdsCfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cbYC2Vnnv7l9+B93g8prUprSTItivhvehfcNo7h4yJojxc8YAGLbFVEfMv+867yA2
	 lFoRW8k6l7C0I2B2JWDecjIf5XFf1qf20eXIgZDp251xA+jMWYTdnhqRQLvovs2Slm
	 FntTrmYH7+zCd6HNiWFdhcC1sdMzrXXoN1fuj3WmTbsxR3D8wwcYsJjtRl/WYRxJvg
	 W1nPaYY831mp4nzjO36nYMJYDW3Kd6B92L9msYtOiM9mFUNPwRGiJqr4PJByi7FIUB
	 BINLFLwGUdyTd6cKhxDNTgkftEvyMsG2SbruT95sU2yhmgakK1f7QNnuKxeEko8C/v
	 shx3XoJe6paXQ==
Date: Mon, 29 Jun 2026 15:44:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: fix missed le32_to_cpu()
Message-ID: <20260629154429.11fb5a49@kernel.org>
In-Reply-To: <74e05f3d-39a6-4a4c-8bc3-d4f23a54ef69@codethink.co.uk>
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
	<b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
	<20260624192205.4485cd61@kernel.org>
	<2a92fd9d-42b3-4564-b784-ec504d4d82b8@bootlin.com>
	<74e05f3d-39a6-4a4c-8bc3-d4f23a54ef69@codethink.co.uk>
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

On Mon, 29 Jun 2026 12:11:08 +0100 Ben Dooks wrote:
> On 25/06/2026 08:07, Maxime Chevallier wrote:
> > Ben, what's this "prototype" sparse ? a custom tool of yours that
> > you used to find that ?  
> 
> I have an RFC to add variadic and thus also printf/scanf formatting
> to sparse. This is waiting on review after the original got re-worked
> to add scanf and a few other bug-fixed and shuffles.
> 
> Ref: https://marc.info/?l=linux-sparse&m=178185274600679&w=2

Ah, makes sense. This most definitely need to be part of the commit
message.

