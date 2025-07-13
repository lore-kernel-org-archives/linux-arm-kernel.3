Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 21:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwQeVLxj3XfkfWgGw3amjmtds/bFedPxXMSoyVp4I0M=; b=25d1LF93i0JWkgRw69RyO33EK6
	UU5WKpK5LpjINfylo8zDZqvLwB3S4K10qdHcYqRGN/g8hFPNSoJi+dJfSn4/q8RXKNs0OTnb5h0wU
	vELg3gPIfKSUMEa9WntUXR1srXwGUM8FsHsBjVpCRiZ6KdwfMDWTH1+xH/HtSCFykqyboAldS2Hzq
	k3u5Mipy9enTOVLnBCT/tcj3mguHpcCOZ1buzBWvyk0s6ZkLYEWnL/9S8PKU5MeScXlqxybU/0m59
	JM0f4XwImpYkYZEeOqQx23OYBZnfYNQFonVTuWfUAb3DWBvukB5E9tfcWkwYhEV2I5A7Ba31pQSyv
	WFJQM5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub4Sd-00000000fNU-40JQ;
	Sun, 13 Jul 2025 21:42:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub4QE-00000000fB0-2FvS;
	Sun, 13 Jul 2025 21:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21AAAA50AF5;
	Sun, 13 Jul 2025 21:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5E5C4CEE3;
	Sun, 13 Jul 2025 21:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752442784;
	bh=l2albCRDOERfrgRCczAdSrxmVZTv8VNwn1plCuVvM3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ShuzarwHk3Fd/ohRYVCkhatKqA4VRuupYJGUvUUsECMi/QCozlyF4PS6/WqbIOMlt
	 FfIj8NCLJii01L/GeR/B1dZqlLyJluLcXSVe7My/ZGKT25nj7uTXY/1aduEOS43K7g
	 AIwXcFjIzj7Xo3qal371jjI8rP76tzNjyMgQSj+JdpNIRKzXTWd2RCBCzch6XKW/bw
	 f5QtrdkGYCP005/ffIAkKRAdZI7xlXU6Gw4YE63+GO3pck+N0yxxZ+v6QiAUbcCmf1
	 Zgte4oZwgIwK9rDUa8oKiAzxmdLih+XWE3nzTja6iYuKNK8TB8k/mbVx7f5MngFyUw
	 PK3qOVkg09qvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ECA383B276;
	Sun, 13 Jul 2025 21:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: dsa: mt7530: Constify struct regmap_config
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175244280602.2861491.4513725766921457476.git-patchwork-notify@kernel.org>
Date: Sun, 13 Jul 2025 21:40:06 +0000
References: <1b20b2e717e9ff15aa0d1e73442dde613174cfef.1752419299.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <1b20b2e717e9ff15aa0d1e73442dde613174cfef.1752419299.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_143946_644247_2FA39488 
X-CRM114-Status: UNSURE (   9.82  )
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
by David S. Miller <davem@davemloft.net>:

On Sun, 13 Jul 2025 17:09:24 +0200 you wrote:
> 'struct regmap_config' are not modified in these drivers. They be
> statically defined instead of allocated and populated at run-time.
> 
> The main benefits are:
>   - it saves some memory at runtime
>   - the structures can be declared as 'const', which is always better for
>     structures that hold some function pointers
>   - the code is less verbose
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: mt7530: Constify struct regmap_config
    https://git.kernel.org/netdev/net-next/c/9eb73f92a0b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



