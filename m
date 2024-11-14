Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F96D637DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 04:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5nQzynBRmuJvuSeQySMKMbvYSyiFpRgUkq7qTWODt0=; b=Igp4XEhs6rcXnq1FqJx/uhC21u
	HwCdE8zoGG7P1RJ/EBM5Rc1jZhA6Pk6ZRAIT3UoLFi4KYqLyxzpqPvvW1J7hDLt6yQshE8CB0F4dC
	PlnUjrMIHuxsay2g+IJARA+ldYqqH5us2MZy6h3EyW2xIduEHZwfeHd6dNGECOQeRqfpxOSCL8AR3
	wc3o049J58+RjpceR9RSJWEMfuN/sDw1FajT3M9FJIxKgiCiISDpkxgP55XRZJAfLZEbaBHJ8joV8
	sbJmpAjFL0hdfRdWczFTahwoNEKjj2MQygqVQ5Z+Nl8joXa0Ya84IPqnWvxniL6CbmoUeTo2cGzd9
	UXiOlfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBR3d-00000008iig-2CVz;
	Thu, 14 Nov 2024 04:02:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBR1m-00000008iMa-4A95;
	Thu, 14 Nov 2024 04:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 909C8A40F8E;
	Thu, 14 Nov 2024 03:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45061C4CED0;
	Thu, 14 Nov 2024 04:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731556817;
	bh=oFyEqg+Wi3bg6Jd+vWNtNIrKr6QAtBEfuLjYAZvCcL4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mzlhoKEX4I76OAJB7pvtu5Ze2fcts8G9x8h3GSAoyP+KzoIy6C5/xzXwvJ9Ep05u8
	 HGGXkG+jktDO8LFOvUNZU/ddThiPLLQDlOVwAYralL/jhT9CqiImtgl2iTHIo+V70c
	 fzxkZwtkr2kIMratdRlGfnI66ekfT7VwI7UE9vqUig6MPC0qG++QT32oISGBRJFjAd
	 pDKVCff+API3hcYNfNkJLWMGrQFtWcOYRbtB+u2toKx8cF5z1QdUFBARoLRVWMtYsH
	 6zm+HjIMidPwri3aAOWhkZSvfP98AJ3cUysWAaaKz1N5NgtQioSJ7tQs7ry+U6kp7u
	 3y6Nj1UQ1PI7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEBF3809A80;
	Thu, 14 Nov 2024 04:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix inverted logic for
 mediatek,mac-wol
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173155682775.1476954.16636894744432122406.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 04:00:27 +0000
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, bartosz.golaszewski@linaro.org,
 ahalaney@redhat.com, horms@kernel.org, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_200019_116970_73DDEAF9 
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 09 Nov 2024 10:16:31 -0500 you wrote:
> This series fixes the inverted handling of the mediatek,mac-wol DT
> property. This was done with backwards compatibility in v1, but based on
> the feedback received, all boards should be using MAC WOL, so many of
> them were incorrectly described and didn't have working WOL tested
> anyway. So for v2, the approach is simpler: just fix the driver handling
> and update the DTs to enable MAC WOL everywhere.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] net: stmmac: dwmac-mediatek: Fix inverted handling of mediatek,mac-wol
    https://git.kernel.org/netdev/net/c/a03b18a71c12
  - [v2,2/2] arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for all boards
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



