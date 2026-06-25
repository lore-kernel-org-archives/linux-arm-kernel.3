Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514DCDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 01:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSyb2XtjEX1eDUWv4A7qcjknp0JqfZehvr6jo6mvFpQ=; b=uSziN4zTU4Ema7fE5Yn2X6NeK1
	Ezghi+UFzuC7IgcaCCoqRDXhZuqnoYpOTYYmC/0aS9Uw9fPASuwvqHxRv6WkvU3Vq/kuSAkkfiTcg
	LyQxUSYZnR6V3mW89riqS0YK4OjUfn0vVJx4K+HytSkMNnsr2sANy8GwHCbaSYW1ysixEyU0WIa6p
	lWzjhNYOQ9FJ4oWrelSLG0VeiIkzF607IFIDsk5KUC0BO5E9wruILJ6m+uCmHO3sjsV6oy9nJUji8
	aWRMU6j8qth6gnMJ41VI+IWu0p/qi068vxbLMpBauMpZO1NA5C6Nikg/LxmUWII4QTjfI246/rtzw
	BvgWVKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYal-00000008VD6-0n87;
	Thu, 25 Jun 2026 01:09:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYah-00000008VBb-2DHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 01:09:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FE3D600FC;
	Thu, 25 Jun 2026 01:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554D11F00A3F;
	Thu, 25 Jun 2026 01:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782349754;
	bh=KSyb2XtjEX1eDUWv4A7qcjknp0JqfZehvr6jo6mvFpQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PbZ/x6AxRAkXBIuusdBvANE1T1Xci4UQYkbzLietEy3tEwW8JIIbSUFemeol83U9u
	 L+ZRikNvzDk75UOKiPuVc897sCx2Xudm7R+Luq9amk8LAO6dxPMYRgKGaTwUkgIlCC
	 CXCpie0saI26iqyK03XESK5xvdSjmxi/5eG0OYlgWp6Plrc6xzpiqlcTCuQSQIIa7T
	 Jp/HYmsAetYV67GMmVNIXq1EqBSwTMK0FKOZ2OoECsr4BtavZnq7YHZD0wnfg++RfU
	 ruonreID+5nIc0PfzQ4HWC+DsmFGME3wBGKnsuZnNi5AcLrDFU3OK1l3/XKKrvO9nV
	 UXvqLrD8RFTbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CD93AAA0F5;
	Thu, 25 Jun 2026 01:09:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ixp4xx_hss: fix duplicate HDLC netdev allocation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178234974236.3045401.8869362652520123568.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 01:09:02 +0000
References: <20260622043015.643637-1-haoxiang_li2024@163.com>
In-Reply-To: <20260622043015.643637-1-haoxiang_li2024@163.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: linusw@kernel.org, kaloz@openwrt.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 huangguangbin2@huawei.com, lipeng321@huawei.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 22 Jun 2026 12:30:15 +0800 you wrote:
> ixp4xx_hss_probe() allocates two HDLC netdevs. The first one is stored
> in ndev, initialized, and registered with register_hdlc_device(). The
> second one is stored in port->netdev and later used by the remove path
> for unregister_hdlc_device() and free_netdev().
> 
> This means that the registered netdev is not the same object that is
> unregistered and freed on remove. It also leaks the first allocation if
> the second alloc_hdlcdev() call fails, and the first allocation is not
> checked before ndev is used.
> 
> [...]

Here is the summary with links:
  - net: ixp4xx_hss: fix duplicate HDLC netdev allocation
    https://git.kernel.org/netdev/net/c/db818b0e8af7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



