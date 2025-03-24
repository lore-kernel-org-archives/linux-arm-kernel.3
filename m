Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150EAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxNhSVN77/tNU4mpU5dmbyj063rXi/eagDqjIOci2lg=; b=vlxjRPhboq0NjFP0J/UH55eFn3
	itLu3Kue6OaqEM/R6rkBqsTo7pd2PHGXjSP9aWbrwBSBuGAkKZLn0wLbvR1ijsJqtEWgag2X8KiIU
	XeRbUsZ4je3LTJIzGdeSnXf+S2Xd2kV3jIpD+O3ynI2V2QzO3dnn018JCYPQY0y7Ecbqe8F982UPT
	AHfBOcoiitD7XSB0Jwz7jp/VOYpKm/W5G4REmwao/R0azytelFW1W+3bFRtRU/7fVKnQEueTfc9/w
	uLubboXC4Ly8MD42RAYhV3WCw1RC+WugVYgFXcctddDMCqXnM3XJ+xMUOUsVWd+wNSmncy7ummU6/
	i8BIAyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twom5-00000004Eie-1nVc;
	Mon, 24 Mar 2025 20:51:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twokK-00000004EO0-3KBG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 20:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 007CEA4A522;
	Mon, 24 Mar 2025 20:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBADEC4CEDD;
	Mon, 24 Mar 2025 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742849407;
	bh=+ou0UbncUs03M6sufG6N3xTDsMBOOlOxZOY7cw8WuOw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fCJ47wN1+6+QohEGuqVMAAGxKIxnmr77Sz6Lx5TpDQX+4kl3ZcS1W7ZYR/KIoIGWo
	 Qc8FVEBTEFp6FlYB2AD6znBsWXDAaXtUFFk5R3uR+6JkMMmX4g4i4NLr+W2gdhH0Ru
	 NEsIkcdrUlbQnoKgCWLs8vPaqCf3BsqbqniTpdR/N9eD42A+8wwOQf1fMZ7a3JoJZn
	 /s/G3/AYQEorFapa+7V9PwohFTJ7lDuuN6AME9/Pm8+9Tj8LjsK1XguSvqJ6S3cnLB
	 Eh5/USzW7nZ1GAW88iH8WPMX0ThF8XUUcodgNHmIaoOXLE/HoYgrMw1Lz6CS63qFja
	 stHr7WqJHlzLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F0E380664D;
	Mon, 24 Mar 2025 20:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: Call xpcs_config_eee_mult_fact() only
 when xpcs is present
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174284944375.4167801.10275229682419761555.git-patchwork-notify@kernel.org>
Date: Mon, 24 Mar 2025 20:50:43 +0000
References: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, andrew@lunn.ch, kuba@kernel.org, edumazet@google.com,
 pabeni@redhat.com, linux@armlinux.org.uk, hkallweit1@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, f.fainelli@gmail.com, horms@kernel.org,
 alexis.lothore@bootlin.com, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_135008_891882_A2D6554B 
X-CRM114-Status: UNSURE (   8.85  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 21 Mar 2025 11:35:01 +0100 you wrote:
> Some dwmac variants such as dwmac_socfpga don't use xpcs but lynx_pcs.
> 
> Don't call xpcs_config_eee_mult_fact() in this case, as this causes a
> crash at init :
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 00000039 when write
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Call xpcs_config_eee_mult_fact() only when xpcs is present
    https://git.kernel.org/netdev/net-next/c/53cd6820f5a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



