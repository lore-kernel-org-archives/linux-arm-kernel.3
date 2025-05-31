Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4F5C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 05:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOvYn/VsoL8U29FrrJ3UlKEKK+Yv4PltluohUqSMqA8=; b=gU+ZpyZ3nY4BYEdqSHWEe6TQcA
	zLwQgDmAvs1DCD5uqoHzys+y/GNNevneGB+btvnD1ozjz/v6tiqkUq0U/icceCZkTBZ/U6IGpaKsT
	7wAehJseCD5Q1/kXTFzqH1rgB9+UjPIAvPolj+bCOdv50KTppzHLulYwgT2sB+WsVE+ZYfHRd9E3/
	RiZjt6V7LzT6tFMCuk+f+tmOeQhNurdN8hFGvI2nAicoTr02XXhEyY8aJU1/4/4EAN3eNCFA3/Csg
	5ih2WgybM2GMReS0o43tIFTUCJXdnynYLd65/v6beuRJpv3PRoMvBmHHnydUYLsYgzzybbZj2r63p
	uIbKSo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLEWC-00000003NCH-3dWw;
	Sat, 31 May 2025 05:12:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLEU3-00000003MyD-13HI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 05:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93D884A465;
	Sat, 31 May 2025 05:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70119C4CEE3;
	Sat, 31 May 2025 05:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748668213;
	bh=uL+BKZu6kDrl8m5sy72o33sP2MBjksLZumY0/hHgMps=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ChbudPE6kmY4/3YOEolvt7DlvOHxpw6Tt6E9jnB8i0Lb7bhRG15EJiN9qjaVSskzh
	 rshvnh2rjKhodkAhJKN7McTm5buTU9yh+2JzQoP0AaNwzR+cyp4BcUF+hH9PQJC2a+
	 kO7iXg21mW+k/4NQ364m2fi+lZr9qUg9ExlnC5PeFnnlSptnqS91d8Yzs9pt/YktAG
	 zd71IWbc5keU8SImNDd0am3g4HwepyowevzjB7W05wj0b0qfvC5Wxvih8myur58VGy
	 IZWtD2ZPSg+FdSAr9RtB33SyX/KUVXXMKm4kGmjgyEvzBZ1z81ecVgK/CH/DMYqAh5
	 9ACVpTobtCgdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB09D39F1DF3;
	Sat, 31 May 2025 05:10:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] net: stmmac: prevent div by 0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174866824674.44670.9404709509125224265.git-patchwork-notify@kernel.org>
Date: Sat, 31 May 2025 05:10:46 +0000
References: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
In-Reply-To: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=3Calexis=2Elothore=40bootlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com, preid@electromag.com.au,
 thomas.petazzoni@bootlin.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jose.Abreu@synopsys.com, si.yanteng@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_221015_321152_94954ACA 
X-CRM114-Status: GOOD (  11.19  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 29 May 2025 11:07:22 +0200 you wrote:
> Hello,
> this small series aims to fix a small splat I am observing on a STM32MP157
> platform at boot (see commit 1) due to a division by 0.
> There is no functional change in this revision, this has just been
> rebased on top of net/main.
> 
> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
> 
> [...]

Here is the summary with links:
  - [v4,1/2] net: stmmac: make sure that ptp_rate is not 0 before configuring timestamping
    https://git.kernel.org/netdev/net/c/030ce919e114
  - [v4,2/2] net: stmmac: make sure that ptp_rate is not 0 before configuring EST
    https://git.kernel.org/netdev/net/c/cbefe2ffa778

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



