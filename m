Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CAEC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc3/R3Euwbm7OhCzZ3fvuhaxMZqGqpKCKZRSJU3pbKw=; b=y55pTSu/Ket+t5JaA8qf9giYRV
	DqmgNhODZSZq6OSYwfkn1LU5x44lUtKdyin46n6Eh+am3XONivL3zCp+oUBBzvucqX2lIcIR5mKsl
	GN/Nq3TrJYd+lKtNgcDW+8yuyg9l0mHzuqukoA+EGYDUxdynyIbREXcJuV1oF9Tx3TO/p/RMPtYJq
	MUJvKq6+wDpK8QyBQueiHHeiiDBzKwZfuev1htEK5M8d2EBJJMUbQdUDoeiAaWLdFfBqOKwHdWywa
	yzwBxqFJTvxpRPFtWLTvZJfY2qpgwcJMz92TqMoYlg0axAd4rPaBbzh2OJr+z87htsoMbt2Y8UsnP
	I0mSj3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ssl-0000000AudZ-2c9I;
	Tue, 29 Apr 2025 21:52:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9spu-0000000AuIx-3SDe;
	Tue, 29 Apr 2025 21:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC42D68469;
	Tue, 29 Apr 2025 21:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF52C4CEEA;
	Tue, 29 Apr 2025 21:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745963393;
	bh=UjdCZlm7WDqcusIhWqtA1R5cnw9YVjL6XEiRR7s38DE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S7B2W2CxVfXVIXga/XZ/s1ih+xgEKADkxWQ/pNgSYjJasHsvyS44SQLnbh9hc+XXQ
	 sZIMGbYibbNXdJsTXvNDUpY7FcRkH3XIhL/kQ+OsoUlcGJSmDTfBAGeM4aVpXEYaws
	 hIE6GE+I340K1X20xw33PiR3bjam4jpjOvj/GFMv9R8vWQCMw0zzB+vVRxbzsri/5m
	 TynzfVg0vvL4bpwr9nRu8Ue6qaq7iNQb7Ox8ufY1bmS8Rw42y7Wt0CIMCmWdn2oYCa
	 HLwqSH36HjtLKGMMeO3qhaZE02MvyDvMmV3YDRWga7v/XL/PPTxAqQTEGu6uRJNyy3
	 o59MpG71+cyZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB01B3822D4E;
	Tue, 29 Apr 2025 21:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix SER panic with 4GB+
 RAM
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174596343260.1806681.7860771179526030169.git-patchwork-notify@kernel.org>
Date: Tue, 29 Apr 2025 21:50:32 +0000
References: <4adc2aaeb0fb1b9cdc56bf21cf8e7fa328daa345.1745715843.git.daniel@makrotopia.org>
In-Reply-To: <4adc2aaeb0fb1b9cdc56bf21cf8e7fa328daa345.1745715843.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chad@monroe.io, nbd@nbd.name, bc-bocun.chen@mediatek.com,
 sean.wang@mediatek.com, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Sun, 27 Apr 2025 02:05:44 +0100 you wrote:
> From: Chad Monroe <chad@monroe.io>
> 
> If the mtk_poll_rx() function detects the MTK_RESETTING flag, it will
> jump to release_desc and refill the high word of the SDP on the 4GB RFB.
> Subsequently, mtk_rx_clean will process an incorrect SDP, leading to a
> panic.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mtk_eth_soc: fix SER panic with 4GB+ RAM
    https://git.kernel.org/netdev/net/c/6e0490fc36cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



