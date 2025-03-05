Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADD7C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 02:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Surm9+hcGmk30FB05ScvfdAHGiGmD3ZD/Vyjzc7rm0E=; b=MOdDz6TcRwBNli71hac5gpD4sQ
	/VoHLw1eLAf4hOhBxYp+JOV/FC6VgduzQx0s6px8pvd8tliXbRClgFkevFgzYCyeCwi4jPG1HtB7J
	fUMkvJU5KdjARj7V6B5fC6RmS3hSEktTCNLo6McypA1B2ZoNO6IkhUtbUioDlLIWE+0tM1UVS86GU
	T4hIQ7cL9bSnRcjZNPLLgjpIUT8f49hITL90uEpWNUT70RBH3BiNRWQVgkld6LWNHDix36KqccwFa
	k/cACg5CtGq9x2FZOaiHo2pwNOUQ3ZBi0qkBQZYHPXfvhmGYGcd4t/F6SVqp/ldbFs9R7uPvjcHD3
	e6+b4+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpeW6-00000006nsJ-0Llq;
	Wed, 05 Mar 2025 02:29:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdQi-00000006hu2-43Cg;
	Wed, 05 Mar 2025 01:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Surm9+hcGmk30FB05ScvfdAHGiGmD3ZD/Vyjzc7rm0E=; b=GuFPckQFgai4eWXlSSBrTsGy/7
	umCbO0pj27zpXM4YVqIKuVcjoKQoh1Jiq0PLqCNBqMn8zAm9QwHO1uRk4jp42HMS6BQEZa48Ki9Qg
	U03aZ0GlVs2K+2pTCCQtOjDfdEEASkGfb6ITZww0HFS3UTcVXDu1v68g64xpgOabHgbKYQ+2AcV7q
	0FQUbona7EiJhP3UBRJF8VzAoq5wRnXABvTTnkCJH9TGmv27jQqyzPWPpt4ez0hcsie6Lu1B3OH94
	xm1Cjh9JU3O/Lz1k2S5K7kMR7dDBQq2L4lCvYHHlt7h9o1FXD6YLtsjFgI/YkVTjsR9FgDF5+4oB3
	5F1rTBOw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdQe-00000000IYy-34Vk;
	Wed, 05 Mar 2025 01:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6DF8A4626E;
	Wed,  5 Mar 2025 01:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0E0C4CEE5;
	Wed,  5 Mar 2025 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741137606;
	bh=2bT41wOgGM0dQY3OubedrgWzZBbizLWRIDcVaoWa1lg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NHZXLhlqV2FZ8NrAdRgjM82HkvqKolZa4JFy4QB5PSzzs5aaJpQiecoOSgRwGW38q
	 B4bu4yvythoB7gTM4YprLOs4mIgjzfbTnLTc1ALqHZGzoGghS+6DcYA/C4rISH5MjJ
	 bNU//xfJQncvlpMtFpWU5GnUMv6sjxd5Muc9e35OWoAwkbC03B2Bfg+GjaiUdtA9nV
	 mq2EjCDwX15NnBjUwzAZwvrPvolyY9Jv20pX7PgVWJn7w5bGzTYkTfrGe7UjqbNyrk
	 2ye1i7rQ2tlXV+zRsCw6uwqdyyKkldyeBDJ5niswKYSz/N2Hrgn3UK7dTPFrWPZ4l8
	 mtCN7dQ5GhG5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F26380CFEB;
	Wed,  5 Mar 2025 01:20:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] dsa: mt7530: Utilize REGMAP_IRQ for interrupt
 handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174113763901.356990.6788752081470910551.git-patchwork-notify@kernel.org>
Date: Wed, 05 Mar 2025 01:20:39 +0000
References: <221013c3530b61504599e285c341a993f6188f00.1740792674.git.daniel@makrotopia.org>
In-Reply-To: <221013c3530b61504599e285c341a993f6188f00.1740792674.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 chester.a.unal@arinc9.com, dqfext@gmail.com, sean.wang@mediatek.com,
 SkyLake.Huang@mediatek.com, ansuelsmth@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, frank-w@public-files.de,
 john@phrozen.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_012009_492079_7E41D2F1 
X-CRM114-Status: UNSURE (   9.79  )
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

On Sat, 1 Mar 2025 01:41:18 +0000 you wrote:
> Replace the custom IRQ chip handler and mask/unmask functions with
> REGMAP_IRQ. This significantly simplifies the code and allows for the
> removal of almost all interrupt-related functions from mt7530.c.
> 
> Tested on MT7988A built-in switch (MMIO) as well as MT7531AE IC (MDIO).
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] dsa: mt7530: Utilize REGMAP_IRQ for interrupt handling
    https://git.kernel.org/netdev/net-next/c/254f6b272e3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



