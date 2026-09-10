Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F63C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngeAR8nmnQ0Bc2ebzsIpljyhkLc6DyhYxhTSjNVk2zI=; b=OVFRP/P1i4zdWjXK2wR9taY05Q
	ZJjCJY/9HD0QPqiKscG/9sLpl7R2V7WlJ3KCidayYb18TFEL2ULLU7DSd4InS2OgzDs8hnNx3Z7jU
	2xQg4D0PDJl3hN6gQMIQMlaHw9rF8SlO/m3eY7TVDfBN4cZIlJMjFnqm6ZiQ/OwDOp1GB2BijeL8O
	KB32iiv6KmB3pfd0IuL4cQyfLogJA+8wAr9W9zz4119SddiNyudtIA07jvt+91BBYHMhGgCtsfYKC
	syzR3iPHt6j/OSZuRNwYyPpXQnNJKvWokRcC7r2sbe7eGEeI9wbyGMdcVEvH7rx7pm9qcMW4LnXb3
	PVAX1O6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c3g-0000000E4QQ-2j6y;
	Thu, 10 Sep 2026 10:31:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c3e-0000000E4PY-3pew
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:31:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5880D601F1;
	Thu, 10 Sep 2026 10:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9821F00898;
	Thu, 10 Sep 2026 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036266;
	bh=ngeAR8nmnQ0Bc2ebzsIpljyhkLc6DyhYxhTSjNVk2zI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QppWOwvT8CbJuDDL78HkWLbFoDm4TnrcU4ovfDLFqzRsY/+oO5MqRzwqyveC/e3m0
	 u3smXptaDLBM3Ar39aeqC0x62j5xNy5ifwytnRxqXIl4wlSRI4VUqtGWXiyyHrpBai
	 TNJKlDKxHHblz98tca6C/mAmZQUZdhIw8zHuSa0f8UTWV/+CSH5K+W8qmKurf2OhvF
	 y+G9K7ueua3/CVlauRugeWsULoeQW779u70qbSbbdfYip/G8zaFrOqAFO9svyggcip
	 FXuc1ybDyhSRkUGAjJQ+gK7RgKCTW3c4fLtHDM58qrDl+YwOnRrMuXB5E9uyjKuycZ
	 eu9J9+O4sXzmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C9B380CFE4;
	Thu, 10 Sep 2026 10:30:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: sun4i-emac: fix missing of_node_put() for phy_node
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178903620363.1343389.14128399627262253233.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 10:30:03 +0000
References: <20260904080758.2432748-1-dayou5941@163.com>
In-Reply-To: <20260904080758.2432748-1-dayou5941@163.com>
To: =?utf-8?b?5p2O5L2R6bi/IDxkYXlvdTU5NDFAMTYzLmNvbT4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, liyouhong@kylinos.cn
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  4 Sep 2026 16:07:58 +0800 you wrote:
> From: Li Youhong <liyouhong@kylinos.cn>
> 
> of_parse_phandle() returns a node pointer with an elevated refcount.
> Add the missing of_node_put() on the probe error path after
> register_netdev() fails and in emac_remove().
> 
> Fixes: 492205050d77 ("net: Add EMAC ethernet driver found on Allwinner A10 SoC's")
> Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
> 
> [...]

Here is the summary with links:
  - net: sun4i-emac: fix missing of_node_put() for phy_node
    https://git.kernel.org/netdev/net/c/af406abfecad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



