Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB0FCD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJ4dvH1AwTrkcpbGD0pqq9b3zvNc2O1tgQiFh615F/U=; b=py+5Jh/HO8KJOKSv7P1nzGabmO
	pjhCiQhtaHxT3DIGswgaeo4xXwJyW6NqLapmESq47Vr8HiO7gCxq/skcHoLsiaQx/fQ2+KTbur4Ap
	g8WvOp2EjjcW2gw9NkMgLIcH07ann95TQAr/lpK+RVHCBUED0mNjVy/Dy5XLEAdT53wE/8hYr3XcI
	Qsuuou5A8Ssut7f2fW+5h12dvi2Hdu40hU5tlq6jl47mMgw0zQigFK/LJzsEl5B3xt8tTE6OHDO/y
	MRmYzRjSUrDn9DnmDHZwoO8dF/n88QH8a4FlQ98WVhhZmULd/svf9t9GuNSldp/zPl5NMCdiz5CcJ
	3IYTk8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgUY-00000001OFO-3Xha;
	Sat, 06 Jun 2026 02:10:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgUW-00000001OE2-03Cd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 02:10:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58955442B5;
	Sat,  6 Jun 2026 02:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FCF1F00898;
	Sat,  6 Jun 2026 02:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780711827;
	bh=IJ4dvH1AwTrkcpbGD0pqq9b3zvNc2O1tgQiFh615F/U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NEZ2zJL0FHiZnWoXcoL3deD35EaC+m68Vw79F8khU5o7rtOTWMmd/UwILCHmMWOj2
	 oCblPP8M06oMtpMdE3vxLhAryFjbfUHrRChAT1coloYCjSgWBaBXuWFmZ6pIFvXrWX
	 D5RREs4qZfT0/JZu/g9enIZ/H3VtMpSQ+C97Ies3c6c58bQd8z3ExwUGSplh1PYRby
	 nDpppBF5ImVpOPSV6uBLF/b3DcJGHLnT3eO4TmJIw0wXRBlw1umveZdmWN4ZFRQNr/
	 WOEv4qIe++HFRa2JRzbRa+Gp8EEJ6zy93J5UFD4qZcxtMtR40PcDgC3QsILFCWpyYY
	 vYrPU/bXHUd+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939CB3930A9C;
	Sat,  6 Jun 2026 02:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: microchip: sparx5: clean up PSFP
 resources
 on flower setup failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178071182714.3993660.9574307915751571601.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jun 2026 02:10:27 +0000
References: <20260603061716.747282-1-lihaoxiang@isrc.iscas.ac.cn>
In-Reply-To: <20260603061716.747282-1-lihaoxiang@isrc.iscas.ac.cn>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, kees@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed,  3 Jun 2026 14:17:16 +0800 you wrote:
> sparx5_tc_flower_psfp_setup() allocates PSFP stream gate, flow meter and
> stream filter resources before adding VCAP actions. If a later step
> fails, the resources allocated earlier in the function are not unwound.
> 
> Add error paths to release the stream filter, flow meter and stream gate
> when setup fails after they have been acquired.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: microchip: sparx5: clean up PSFP resources on flower setup failure
    https://git.kernel.org/netdev/net-next/c/46e503673387

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



