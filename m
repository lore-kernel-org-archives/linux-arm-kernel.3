Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFDBD29DC7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 03:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTQ9rBgXvnLZbdYeclfLelJ6PTy/ZWKWA7gn9pJHCdk=; b=KvnRiAvInrYeCJfVLl8B9au0OQ
	5Hpo4zuWTsCTqMIYvFwYcOI9zutEVdLcrZnOIGt2fuD46UYG15aFYrf0b/5IG+F52oAdPmdWlj/Sf
	pSrk2sUTEm9m6P8Be587o0KUICEqa6mzHi4Q3HyGjDjMPMAaGNaNoYlEnX9B1QLipmJj38LWKN4Uq
	mONtVB0X8N0k6zS90MKBvkOtcAzmZep34GREWEzRvEdeC2x7ta8kkjUxS0M/Dr6qiqYi2nSxPRpf7
	JFXkPPVynRwpsu3nTHLY4BZTyttZYbveRxETzMOCJKH+x6H9Y6+i9ldA/g9bXGUKWqEzeb0AE57wH
	sctqnvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVJo-00000006V4x-3q1z;
	Tue, 13 Jan 2026 03:43:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVJn-00000006V4a-2oE5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 03:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EDBC60055;
	Tue, 13 Jan 2026 03:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D9CC16AAE;
	Tue, 13 Jan 2026 03:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768275822;
	bh=1x0HV4CNdWNSF88xgwpmrzDRD5SQUGzjfVFk6VnyTH4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oae5OM2XV2Fs0m81Zf2oWR3PoGCMRnlvt4bkQwoXeyFUrfdKKjJwhmvCU1dg3EUpf
	 /uGiWbthMfLHmkHWEEA6773EQOJG58wsrWLvmzE/dBM7wfh9UiQuVe3NjGIqzcs+Xz
	 M+ExGVgbhDhIKWag221NXTrLaKROj/J9+/qh3XRGqjgZeEiI2k7GTPGI8aBNMPV+zl
	 IUM1FI8a/k7q/VruSlUdb9cHWmLzlAU7IFg3+R5UvZtjEAQ8ElTcZvez9EVVSdI9T3
	 WPWwseXUp6Y0x+NSl0QoC0/zZbZ6kGVDr1OO29M8Dd8KF0viRRvuPKqbYF0qs9fP+U
	 KMsafm3RZOPxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2A37380CFE5;
	Tue, 13 Jan 2026 03:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] net: stmmac: pcs: clean up pcs interrupt
 handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176827561577.1661897.15750852366703896309.git-patchwork-notify@kernel.org>
Date: Tue, 13 Jan 2026 03:40:15 +0000
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 11 Jan 2026 13:14:33 +0000 you wrote:
> Hi,
> 
> Clean up the stmmac PCS interrupt handling:
> 
> - Avoid promotion to unsigned long from unsigned int by defining PCS
>   register bits/fields using u32 macros.
> - Pass struct stmmac_priv into the host_irq_status MAC core method.
> - Move the existing PCS interrupt handler (dwmac_pcs_isr) into
>   stmmac_pcs.c, change it's arguments, use dev_info() rather than
>   pr_info()
> - arrange to call phylink_pcs_change() on link state changes.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: use BIT_U32() and GENMASK_U32() for PCS registers
    https://git.kernel.org/netdev/net-next/c/a2745a99ca4e
  - [net-next,2/5] net: stmmac: move and rename dwmac_pcs_isr()
    https://git.kernel.org/netdev/net-next/c/879070eb4cf7
  - [net-next,3/5] net: stmmac: pass struct stmmac_priv to host_irq_status() method
    https://git.kernel.org/netdev/net-next/c/aa9061269215
  - [net-next,4/5] net: stmmac: change arguments to PCS handler and use dev_info()
    https://git.kernel.org/netdev/net-next/c/52f37fd9f4dc
  - [net-next,5/5] net: stmmac: report PCS link changes to phylink
    https://git.kernel.org/netdev/net-next/c/ce24299b5b77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



