Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A0AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tvd6TSuj3m9+/PzcFi1boACqwFKFHlS3tCGI//TvbNs=; b=fvKRM9LL/QVXmYy9blxqU8DRY8
	tepkK4rBPQmmzy4VVguKceRedG/VTtLwOe34B9Z9yhi1WBySNl2rTHTA38hyYZw8FbmWQE4etGgH5
	uXUrPSjbhewRNv0w5S0e1L94e90n9Ttdei8AbceDBH47p7bcjdxp75nmF4ms4ZtcBXu2Kmc9KTxN/
	j/JLixXqQrmUAVL0t+MF1zsbQL8vJFjx7LjVLEbc+rrgFpkNkBzkNjjav+7S36T2JcbO5VXIZcN7N
	m90FqDjsnZHTnzC6LjmhgtZJiw1noaY1wVql4dd7lrz1Ix9Bkd3gErU/Awv9rR58TJweQE9khQSxS
	Fhf75RyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHUU-00000003y4s-0uXy;
	Mon, 17 Mar 2025 20:55:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHPW-00000003xE0-1Jtg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D19FC5C5718;
	Mon, 17 Mar 2025 20:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3F0C4CEED;
	Mon, 17 Mar 2025 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742244609;
	bh=g5BnAzf+nzvDJc0dMya1wqEXNwCWDunoySbSq2E3yaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=evwhXm+W6f8RC1uQr9NEiKqGsGMx5X/WEWoBAPLZwpPx1BjaZs9g7JwLomPn/9Ffp
	 39eZ/Sqc7c9Nz7a8wCFxSCVHFtfGBAmsIW8SzP0yqg/Kb+2rqX+6QmNwdhDlSLm5TE
	 hClVXZghMRvZdV8j8pc58EBueIBHGJKwgvQ8Vu5dQGcTY/NIMi9VkaIHClCJ+BmKWb
	 mWnwx/KhADiyejjosvuL/kcRbvRddDNlhKlqu7VMNz4A7b4t06BLffTPfKAWLrIctc
	 POhOdIyWtcffhv6m0cyeGnEw1PYFeTRAqPCdN9AZ67z5tPFHDNcLta8gLUL8Of9u1R
	 AJo3ImIFrgT3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEDF380DBE5;
	Mon, 17 Mar 2025 20:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: remove redundant racy tear-down in
 stmmac_dvr_remove()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174224464449.3909531.16032949444811656672.git-patchwork-notify@kernel.org>
Date: Mon, 17 Mar 2025 20:50:44 +0000
References: <E1tt9Ml-006xIA-EF@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tt9Ml-006xIA-EF@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_135010_407975_EBB25E77 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 14 Mar 2025 18:02:39 +0000 you wrote:
> While the network device is registered, it is published to userspace,
> and thus userspace can change its state. This means calling
> functions such as stmmac_stop_all_dma() and stmmac_mac_set() are
> racy.
> 
> Moreover, unregister_netdev() will unpublish the network device, and
> then if appropriate call the .ndo_stop() method, which is
> stmmac_release(). This will first call phylink_stop() which will
> synchronously take the link down, resulting in stmmac_mac_link_down()
> and stmmac_mac_set(, false) being called.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove redundant racy tear-down in stmmac_dvr_remove()
    https://git.kernel.org/netdev/net-next/c/180fa8d0a2cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



