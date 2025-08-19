Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1BDCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHfs6CWft8l8HYRhgF5XvuOPGr0/NQOmm91xWyfKvgY=; b=124Xd7rodJ400uOy84nhXyrhvW
	eO4LiRDbUUip3rir7mowd75cSvPWiWMu/na9Ab/iifS3lI3EN4Fjggpyla3mxP7ACqiOI9nnUGr3j
	4qvLZaEHIMkeBN8zPnXF8ifSpi4WRjW8+UhI73TkbnHLkhXK1JvtDVYvvgoof3BgrBRCKHsp6WGCi
	asyswKuoraAK/eVtqmklWaq3o8tqzd5ZwOLz1MSkgnNXyNW0RPe7m/D1dhJmeKC2b5gCxiVmOt/n0
	yBRtFWqb+CtyiZSPuCBF0UvhRQTQ83j4T5YnwIXJsTtp4VRWAF06oMngyKj8onqh8694GGJVfLb3K
	4T3kPfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLV6-0000000ARPh-32mh;
	Tue, 19 Aug 2025 12:31:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJbJ-0000000A8FD-0vgd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23D795C5DD0;
	Tue, 19 Aug 2025 10:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF81BC4CEF1;
	Tue, 19 Aug 2025 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755599395;
	bh=chtVlqNA4W8+qeCTam+hfj759O2lJY4TyQIcnPBGzm4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ujulMw9aIo6V05WVmJvWf4Y7efZVrsOouPH9VFwvuSlPtOPNfJzDrUgyFoPCGb9Q6
	 2kdzAUiJspHn8dGtGgzMgBLaPiNLZwMR+zeKFODSKEoteuBHJVFr4ZfsWtpQR4/uFA
	 qPYlFVUkC2+QdMPCot6cmDpmPvLxwlHAkAqBpGKc6Rm96B43puFmB2SddyG9iV6PCp
	 Y37kCGXFlOEFZzOPYpqDAE5FjOtZhFG/G5Oxihz5WIXU9mJ1YnevaZBRDL7vzfzlNt
	 w393AYHzcs2mSvJcbNQjOz3l2SfA8ANnI+qPgRLMBf4jXUz4Ei+4HzWJYz+/aF1QV+
	 zUpt73nFMj7Nw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD53383BF58;
	Tue, 19 Aug 2025 10:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix HSR and switch offload
 Enablement during firwmare reload.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175559940576.3486708.2946674599045363041.git-patchwork-notify@kernel.org>
Date: Tue, 19 Aug 2025 10:30:05 +0000
References: <20250814105106.1491871-1-danishanwar@ti.com>
In-Reply-To: <20250814105106.1491871-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, vigneshr@ti.com, rogerq@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_032957_326155_D9D87A8F 
X-CRM114-Status: UNSURE (   8.88  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 14 Aug 2025 16:21:06 +0530 you wrote:
> To enable HSR / Switch offload, certain configurations are needed.
> Currently they are done inside icssg_change_mode(). This function only
> gets called if we move from one mode to another without bringing the
> links up / down.
> 
> Once in HSR / Switch mode, if we bring the links down and bring it back
> up again. The callback sequence is,
> 
> [...]

Here is the summary with links:
  - [net] net: ti: icssg-prueth: Fix HSR and switch offload Enablement during firwmare reload.
    https://git.kernel.org/netdev/net/c/01792bc3e5bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



