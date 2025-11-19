Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10129CF395D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNTt1f8dam1gxu3Czytyfel5OqN0lg58K6Zwd4/bL9w=; b=G9pjfqBGQGtAjG+dicv66yPsyq
	ESqOLKF9M/KmXIypZonSBF7UiqvFGoTYv228VTUdVViewIIxaSQvCZ+oCEgb4hqy6uZf8+bKUPG8x
	mSZtQ7I6axypazvRoxF63nMaZuYle5Sgq+KfhHMAsnhdVW/jc9fECQ2muK0veryKdRCDikpWvO2Uq
	DdHN8FXf2Nl2/uJPWJT8I/l+HyhsDcluhpBMjBq4SvOHpPENXGuWouobaXda8EDVYdNdSNkEM1L04
	8ln7LAXrhKQSj5PsfvdyYrsO3iCf+7i7oBlmmRx4JiLh8RzjIiUPF3OnO716rRSb6KWEFKuHMcgAz
	d8xg9HfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlEe-00000003in5-3fKM;
	Wed, 19 Nov 2025 16:40:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlEc-00000003imb-36gd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91F5B44031;
	Wed, 19 Nov 2025 16:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC62C4CEF5;
	Wed, 19 Nov 2025 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763570445;
	bh=fdxXRZqA2QPN/W/iwYUC/9zToFGBrYm7yidpHfVZkhQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gKpEtYw8KOkIvyuu0VFrr8xOb4ZPSc2WhNnq1CuLIiBfYmHq5Y1gbjFZwO+5n3r3X
	 g57XiBKwLzYdNVA+U8+1eiEfnl6ETyJz/JZ6SqLIl6MvlcHWu8gBd68YEZA8FV/fiL
	 CHgDHWyB9V1NCSCee90Lxb2zXD8Ttoj21KFZRpRFhs/cB9D81nbfxw/ZTKGsUoCh3P
	 xELKAE38HteAneQhsTqaCusJomZTgYK1JyoKLMCEVg/2STnjdoHd2zaP8vIeExMr79
	 D8gvAPZNtoi+RDrghNa590rhFIF2CdVfOTyRuXCGyd3NXUupfS8cpLw2a+h3oQmRSI
	 ZHYcBt9Y0NRdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710B839D0C22;
	Wed, 19 Nov 2025 16:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: convert priv->sph* to boolean and
 rename
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176357041126.873046.11074623716236864582.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 16:40:11 +0000
References: <E1vLIDN-0000000Evur-2NLU@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLIDN-0000000Evur-2NLU@rmk-PC.armlinux.org.uk>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 ast@kernel.org, andrew+netdev@lunn.ch, bpf@vger.kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, sdf@fomichev.me
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_084046_806625_24A5FA55 
X-CRM114-Status: GOOD (  10.72  )
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

On Tue, 18 Nov 2025 09:41:33 +0000 you wrote:
> priv->sph* only have 'true' and 'false' used with them, yet they are an
> int. Change their type to a bool, and rename to make their usage more
> clear.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  4 +--
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
>  .../stmicro/stmmac/stmmac_selftests.c         |  2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  2 +-
>  4 files changed, 17 insertions(+), 17 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: convert priv->sph* to boolean and rename
    https://git.kernel.org/netdev/net-next/c/7ac60a14d3fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



