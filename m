Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7D6C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 01:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ta93+O3VNCeHUmtBSm8wfFh7jKjOCUWjMFjZKVmwyuY=; b=C9sqn8lnPbrwHhM3CObzVSWGhg
	2/NgNCWr7EQ6klsxux9UWuh960otM6K2+VRKPtGcmpNJRYFXk0Oh+rKjRYDkIs4RTkTF7quEHdp2R
	YQ2gE7U5Kp9eiXkN3utLvZCm2yAwfA1TLka661V3MU+OHvlWmcs7nxeH4A4mDh+JcF+Z98/4EYiHf
	GPRDiSe3WolEKJ1uzVXE71y6rqFjkdpU1toZ7ELC2ywsEHfzM3rvaEYwDtM8RtM6HEJ9fyJwDm66p
	IJKMVL/e+4W9IwdPMXAsGUr276uCR2ex9vBi0iPiXQJ6/G2y6cjykuo+wvCoRzyYbzfTocLsKWFYe
	T9iSEI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSjd-0000000E6gB-1Tbp;
	Wed, 06 Aug 2025 01:14:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSfA-0000000E6LB-3cj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 01:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB071A55AFD;
	Wed,  6 Aug 2025 01:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DB8C4CEF0;
	Wed,  6 Aug 2025 01:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754442591;
	bh=3tS+wAYkpgkrdZK8wc8gi2qjSh3qJT1gxLr9GvDEwzk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dDrN3ZD1bGqoaFM+Gf+3bitCrKEpCCziRcLWeryBJwSEb3gBFROAzfP7KEw6BUv9N
	 ZaofsK6a6POIWdPqaNSQbNOWElYwXhspku7WSGmpqHAD0jeXSHA7Te4XwjwoqCJwol
	 cJiQhZuqvglmb1YjOOmWzXjm6MTKYbY4EgRl8xQbnp+AM4zDkJzdcseRSdrRNmkt3X
	 vB4YwtVq8mkzBTGdo/isbMLj4QFZ93x6m1ew8GsjOFsRz0nXaHU4vhRJ37imxv0g49
	 754KDDnuqM0cR4RX6pZOSdezTj9+W6lNsBgpgRuyPSZdNMfdZfATdAG2Y7J39r7Wvn
	 5wvltn+iaZYHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB1383BF63;
	Wed,  6 Aug 2025 01:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix skb handling for
 XDP_PASS
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175444260551.2227515.8563697587474144829.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 01:10:05 +0000
References: <20250803180216.3569139-1-m-malladi@ti.com>
In-Reply-To: <20250803180216.3569139-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: namcao@linutronix.de, r-gunasekaran@ti.com, jacob.e.keller@intel.com,
 sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
 daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_180952_965834_BDF8C1D6 
X-CRM114-Status: UNSURE (   9.62  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 3 Aug 2025 23:32:16 +0530 you wrote:
> emac_rx_packet() is a common function for handling traffic
> for both xdp and non-xdp use cases. Use common logic for
> handling skb with or without xdp to prevent any incorrect
> packet processing. This patch fixes ping working with
> XDP_PASS for icssg driver.
> 
> Fixes: 62aa3246f4623 ("net: ti: icssg-prueth: Add XDP support")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ti: icssg-prueth: Fix skb handling for XDP_PASS
    https://git.kernel.org/netdev/net/c/d942fe13f72b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



