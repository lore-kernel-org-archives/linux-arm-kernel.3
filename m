Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF77D41C3F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZTPK8kpRV9B6JmSOB2cwnFvp02taL9nYz2hP8grKsY=; b=Q8IXjaBcubbk/VOL8m61q1VnlC
	vVeRH/19GVaxLEnDmmrKetPcKVjkh+lK0oRG3b9Wbu02wBaTk+kjw7Z05/fCVBhGpFZTLE+Cw1PdT
	+2+WnTb4cp/ysqECL1Vw0nClX6snemhUo2IkhmR/pj9mGhpSQscTsXsT2I3I6sukapvxPWLT7S3rB
	4CMjajiGOqz4j4s4a1ObLrQW2D2lvb9Mbrz0EEOFOHDi0FfEouJAXRhpUUXvkzMP2RGozfzmCtHKw
	0/h7cPXgZqGoLy+kzsY3maOT8ENF8MUqKr74ajo3FAW6LW5y9dxZ99JaKpqPkyAImVEwzmwjYWqEA
	t+EL/7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDAP-00000006sfV-337D;
	Wed, 13 Nov 2024 13:12:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBD8b-00000006sN6-3Oh1;
	Wed, 13 Nov 2024 13:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BD445C5838;
	Wed, 13 Nov 2024 13:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCE4C4CECD;
	Wed, 13 Nov 2024 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731503424;
	bh=9vr6tI1szK5Unm3lwJO3ytVbP8bZ0zDKkxo9WexlNH8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SMubksJfwYxg+9zGeltQjFzmBmYTJBju+k1u/Tu1qPf13N5Yp9X8Q45o2vYXcIix9
	 nn4Lm5dL/c7u1pT1zgESdBXv5ZT+IetT6RbEURWGrYN5d5J2U4zmdZFBGOzWYuymFb
	 LkwtL2/eWMr13rNoyiGDw1UuyL40R7YQs51cGOgvKBvbBBG0eu90/kGurELdWmb1Tl
	 v7EZy6m6On8KaUQM2zZ9IN/XaD/EBpBlaep89bwOQgxQNir5rF1nAxdQLBzoTTLmFG
	 hXdZ/dnMt8XHQ79pyI8c8izfjmfVJJxqpKPWVjWrUBA03fiJmDbAMO+H6ST9Nh1bL8
	 nNysmcmSDOySA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFAD3809A80;
	Wed, 13 Nov 2024 13:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/5] Re-organize MediaTek ethernet phy drivers and
 propose mtk-phy-lib
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173150343476.1214780.13147107754252375046.git-patchwork-notify@kernel.org>
Date: Wed, 13 Nov 2024 13:10:34 +0000
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
In-Reply-To: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
To: Sky Huang <skylake.huang@mediatek.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Steven.Liu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_051025_912849_C6BC31B2 
X-CRM114-Status: UNSURE (   7.62  )
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

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Sat, 9 Nov 2024 00:34:50 +0800 you wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> This patchset comes from patch 1/9, 3/9, 4/9, 5/9 and 7/9 of:
> https://lore.kernel.org/netdev/20241004102413.5838-1-SkyLake.Huang@mediatek.com/
> 
> This patchset changes MediaTek's ethernet phy's folder structure and
> integrates helper functions, including LED & token ring manipulation,
> into mtk-phy-lib.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
    https://git.kernel.org/netdev/net-next/c/4c452f7ea862
  - [net-next,v3,2/5] net: phy: mediatek: Move LED helper functions into mtk phy lib
    https://git.kernel.org/netdev/net-next/c/7f9c320c98db
  - [net-next,v3,3/5] net: phy: mediatek: Improve readability of mtk-phy-lib.c's mtk_phy_led_hw_ctrl_set()
    https://git.kernel.org/netdev/net-next/c/477c200aa7d2
  - [net-next,v3,4/5] net: phy: mediatek: Integrate read/write page helper functions
    https://git.kernel.org/netdev/net-next/c/3cb1a3c9cbaa
  - [net-next,v3,5/5] net: phy: mediatek: add MT7530 & MT7531's PHY ID macros
    https://git.kernel.org/netdev/net-next/c/219cecbb3e86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



