Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9197C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 02:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRMSGktzsS83tagvY4R3ikQYIosNO4FcOhHqgs++3BY=; b=T2dJhL0RR7kHxZB1tbXZSwL3eL
	GGJ/NMhlgESUqb1/ydPow4nrc7pAVt6kqr//pPmmr2E/SUalRSDql4lQ6v1fmbEu+3JLNAWXr56RH
	sPwtP/DVPWGZRTSkGQpSNiEZqZr5C0/OqwQ+AC5BvkFBGI4mMXIVKZABBevfQMiJ4z6oaxRkTYyj/
	4tTQowG2Up1Jk76fSlky612KZoUD2ZyY0vNC0YtdMlStNd+lbP8VCwpBj+NQnZ6dV7qPbMIbf/k4k
	3eijvbNde3U8TNuI7pd1VRmvcYkXhfv4KncMPKdUwL2tcKP/7KNF9GartCxY/A3s8VdpN1VbQJn94
	+RAw52vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZh59-0000000AUfv-1pXj;
	Thu, 10 Jul 2025 02:32:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZh2m-0000000AUDj-35HF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 02:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AA036116E;
	Thu, 10 Jul 2025 02:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D850C4CEEF;
	Thu, 10 Jul 2025 02:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752114591;
	bh=xXT4x4JaFjSeep/Mbd917xNGkwFl5LwRQcGW2dS7HC8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q0EXEXk/OPCEnCIfL1at2SfcbHc/XVDpGRJmLK9giQP6n+JX3ktQr8QELcBEnCGNK
	 TwN/gcI31nVAcH1HecE8626G4LBn4EoEBg0PXWzrrEnUDqsftFiLxv+eVuquveUvKp
	 VeEer/1AfJtBIjSdTuIZsic65zrcpq3jEx++h9hGNmLFjqni+6BJAoVN5ybCyw34q5
	 /LkApYW/XJKmeuGp3ZieyBs/Hk+Arp/tUReN3uCkK+67AMvZo8xDIpdf34I/klunjz
	 qHIe12ZxQ1G8eOp5AYFTCGUaSVep+QefC9X7mKmymhkXYSKnLUzMkZJNqAtbrlutKw
	 qBuzl+6yx58IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB44B383B261;
	Thu, 10 Jul 2025 02:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: thunderx: avoid direct MTU assignment after
 WRITE_ONCE()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175211461350.963219.17128181938751055078.git-patchwork-notify@kernel.org>
Date: Thu, 10 Jul 2025 02:30:13 +0000
References: <20250706194327.1369390-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250706194327.1369390-1-alok.a.tiwari@oracle.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 darren.kenny@oracle.com, linux-kernel@vger.kernel.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Sun,  6 Jul 2025 12:43:21 -0700 you wrote:
> The current logic in nicvf_change_mtu() writes the new MTU to
> netdev->mtu using WRITE_ONCE() before verifying if the hardware
> update succeeds. However on hardware update failure, it attempts
> to revert to the original MTU using a direct assignment
> (netdev->mtu = orig_mtu)
> which violates the intended of WRITE_ONCE protection introduced in
> commit 1eb2cded45b3 ("net: annotate writes on dev->mtu from
> ndo_change_mtu()")
> 
> [...]

Here is the summary with links:
  - [net,v3] net: thunderx: avoid direct MTU assignment after WRITE_ONCE()
    https://git.kernel.org/netdev/net/c/849704b8b211

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



