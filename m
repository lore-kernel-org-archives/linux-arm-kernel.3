Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAA41061B2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 00:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJhkM9E7bMvE2qlGlJj44+HpNdV/sBsBPEXMzpkOMkY=; b=fuLIx5T337ouh0cyRaQ//+3ow3
	MWFGXpKcxXA/sBeOmNkTAjmuKJrCfBZJ7YcSm/HAeWc1DQUKAVfv1R/pnNcyyv52mWNHkOLA73Gve
	QdR69tgdvWUjqh7r/VQW9I8GujQB4cBSy+YoNoELZ5rvbyRr8zglRcK0jBnotfu/pKGeA/2StJT0l
	7BCHjSojH2IqfVWoHGUIH0EmnB4M91ElEw8palMPJgjlJNt5u84ncOAYdZWcgq5KZmMjrrKuZuEW9
	6vcF86qzfIerzGQX24hsE8hlgNuEsF2YsRZFgd2mTXM8kyFSgb1yuzu6Hj/q01l3AFTjJdtr2NE4i
	0K5PI0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7N9e-0000000C5ac-0gXB;
	Tue, 31 Mar 2026 00:40:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7N9b-0000000C5a5-3CSG;
	Tue, 31 Mar 2026 00:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93AB641971;
	Tue, 31 Mar 2026 00:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701DDC4CEF7;
	Tue, 31 Mar 2026 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774917622;
	bh=SnqxddBoXoBmehVOiUBc8GVDbNOokz/IBaub1S9sjsU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nhhIe0w26OgsypzfTdlJhEilu4hpMx0S0nXbBfRLf2LmfwzkRH0+yQAcAtRzaYzZz
	 SIwaO8FghCVnLLpInORMwC/5vhKjhO4FpqCfH3nZLXI59hR4RqRM5KtXdsKJVLUuAb
	 P4VPg7MDlJNsh6jUPCwDt9sRt70V2zngYFMHIDqRrCwM/C+j0xf8VYNiB84pV48ZSU
	 CELINMw+jkmVhpwV5C6SYZnLgEkZY6XX71QTTkdpm8Vzm3u+al285rrfl08zF/2A2c
	 9xb0/XdQ6XK8UIYQ00rBBjEoRvw1e1g/2TZVbYCgM85pbXUkKdH9G2D9rydfgZqfTa
	 RHLJ4c0bvjuew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDAA392FF85;
	Tue, 31 Mar 2026 00:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Add missing cleanup bits in
 airoha_qdma_cleanup_rx_queue()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177491760629.2032642.16020894977460400063.git-patchwork-notify@kernel.org>
Date: Tue, 31 Mar 2026 00:40:06 +0000
References: <20260327-airoha_qdma_cleanup_rx_queue-fix-v1-1-369d6ab1511a@kernel.org>
In-Reply-To: <20260327-airoha_qdma_cleanup_rx_queue-fix-v1-1-369d6ab1511a@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Madhur.Agrawal@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_174023_822445_141718B9 
X-CRM114-Status: UNSURE (   8.08  )
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

On Fri, 27 Mar 2026 10:48:21 +0100 you wrote:
> In order to properly cleanup hw rx QDMA queues and bring the device to
> the initial state, reset rx DMA queue head/tail index. Moreover, reset
> queued DMA descriptor fields.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Tested-by: Madhur Agrawal <Madhur.Agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Add missing cleanup bits in airoha_qdma_cleanup_rx_queue()
    https://git.kernel.org/netdev/net/c/514aac359987

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



