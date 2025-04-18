Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEABC369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 02:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFHtaJodxwz1mx8bk60hMvbTvv3gKZ5tkOidz2SelHE=; b=BtlOuXNCBeeUE/zzg4LgcgQ682
	FIrWtlOTdeDvBCE+DJHQo1kJGIf86WlCWmKCSMvPacN5vVUvGG7xeLp46LZ5c/YtMHcm86tr4gRkD
	nCT/UQhrLK3f/sdIgefGkTOwn1wgfxMoFzipXgjbVBjCX9kLuVxZZ8rUPzX1tMJtc7MrLELl2ZbYz
	d51Hz4yDrV57mOYjjjfwpYfKiUwZcNC21rUMNhmtQe2GrkwypMvyxm0rqVdny1Jqc0wvLFisOemw/
	xvHSRynOdckXjGc5wOJLvdkwYDf+lmaxX7KB3WELnKK7/LhMEwo4EciqA9SifDK0yPdJKlMNshEwf
	OtN/zDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bEk-0000000EqaN-0Ufv;
	Fri, 18 Apr 2025 02:13:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bB4-0000000EqCc-33uD;
	Fri, 18 Apr 2025 02:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25FE65C5876;
	Fri, 18 Apr 2025 02:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48ABC4CEEA;
	Fri, 18 Apr 2025 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744942201;
	bh=GrNXNsg8thhryFhRIZCHfkYBELHVyUHwQRQ/n00IPGk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rDLXCb100h//SVUpdcl4UQ585zMo4am7V5N+BpZ74niCtsqXgpOIRdxVwKJ6I7vq0
	 ID1qTakmi412HtyqO4khIdD2v+RDbYJd1HHLHNM4e2P8eTrpyQxtjRmmFQobgclXua
	 Vd3xzZGOURAN2wwZ74EfPc1YfDvROY1EG+VehMMrH/vgKBI0bQnbYVOAbcwujaUn5x
	 XMFw0JNwHZojNHzr1sBN8FGQgnvhH3+mX7GkM1cKUBSEVNAPxqSrcs1KvoZ8gX8qEW
	 pU2WLW0d3ZDSLWX2XPhQkerStPNLe27skPsbEjFzuCwa3KI931dhX3ykfcqsWbhTlz
	 Oc4vnJcWlKMJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3483A380AAEB;
	Fri, 18 Apr 2025 02:10:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: mediatek: stop initialising
 plat->mac_interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494223974.79616.7693576407987445072.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 02:10:39 +0000
References: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_191002_807988_518F1EF8 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, 16 Apr 2025 11:26:47 +0100 you wrote:
> Mediatek doesn't make use of mac_interface, and none of the in-tree
> DT files use the mac-mode property. Therefore, mac_interface already
> follows phy_interface. Remove this unnecessary assignment.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [net-next] net: stmmac: mediatek: stop initialising plat->mac_interface
    https://git.kernel.org/netdev/net-next/c/01be295b485a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



