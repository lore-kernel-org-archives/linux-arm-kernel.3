Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3562C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 22:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAhg42zbZVkJtQtgddKyKUFnQ4SQq78q1KcNtCZ3r9M=; b=lC3JP2XxHjFk5w9dhLZwlGo3UY
	7Pz33bK5s41ZmpcjdFzxWD0geQokjeCOLxOdogAXr57lFpfGuN97G8v80F3WSSMGU3Ez7nZB+vQ1P
	eDCXyL4YDjyrDnSbE1Lixy9V4ORRJsXNg7G1FUCSFZJYvA7gQ8NkYU11cbSdm10DrosFUHE9cKuc0
	LrDWiHUhgoOXlUj/7/c1QApBnCpWKAO07ZH5oVJBsXYqJ/3bQljVmYjB34SCfW4E2QFQ2gbkLn371
	zJKc0Z/GUM0dtjLDANEerJxZQZzcuuEEP8qw3wneyNQChA+IESBKKvK3p+AELNQyXUFvZI3eJapnQ
	4j7gfjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSNpp-0000000ENRx-36Eq;
	Thu, 19 Jun 2025 22:34:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSNlR-0000000ENFr-2Sqd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 22:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8AF18A52A96;
	Thu, 19 Jun 2025 22:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BADC4CEEA;
	Thu, 19 Jun 2025 22:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750372184;
	bh=uE1h3VBCq9FkWTRsFDM4zWbkP/DJUBaz2aRme8X4Zcg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qpoing9+7HNARwvNmhkAEPndGAgl3F0B9yk/yLR2qdZvw7rhrSoc5ImniCmLgKv0Z
	 014KsUD2lTwV0cmovedpd1DOQ1UM+dZHvqB2zpWnAv+RCvnmzs8kbUsDvdLTdw/u7I
	 IS5mfpRuU+ZlmkpXWvl1HHY4FlPGgVruoPPhB/cJNrQW86Afynf1dBpWysqil5f9di
	 X/ddP6M33PcmWVQHf+unpRQxhfSLI6xBDyc9pxng58P4empGzMaDqsvFVFx5vJ8skm
	 +3KhEml66/T+/+TvGzFRpuUg05d3TTbaRYknFLxmV4b1Dl74IJKDLQ2Wiv8lGSj/3k
	 FesZDO0UOzs6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F8D38111DD;
	Thu, 19 Jun 2025 22:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: replace ioaddr with stmmac_priv for
 pcs_set_ane() method
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175037221224.1006270.683992000903480141.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 22:30:12 +0000
References: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_152945_694392_4B601F91 
X-CRM114-Status: GOOD (  10.00  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Jun 2025 12:05:12 +0100 you wrote:
> Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
> than having callers dereferencing this structure for the IO address.
> 
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c    | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c       | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.h              | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c    | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: replace ioaddr with stmmac_priv for pcs_set_ane() method
    https://git.kernel.org/netdev/net-next/c/c8e32755ba2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



