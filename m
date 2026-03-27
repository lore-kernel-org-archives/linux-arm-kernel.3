Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D423910ED660
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 12:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIgwpJFwy7qqUJ6XMzR2zm5g03HGn+0FXZ4dTb5Q8i4=; b=dvNKLlplflgNFZ12+1y8ubMtDx
	jHX3Lm2xR35OLEShvJtuSkCmOQu6OzxW1sbvaE9cpWLS2KBAnAH2V0MOdh03weV8cU1ksrlNrHSvx
	U9F5MTtFBTkDuyx5JK0R9xfwckospvK703mKQQ4YF0XG0LUKzp5KkKdlxYMi5TNS6T7YqJHEFDWiH
	3JtQVS9F9RiObI11Ie6S5jqr/D2CcBCg0oiOwwvMcORMQ60rAluk9KONMAEr4wEij2MyXRk20A5tx
	5QYtUkvkK/25uswTsWM6q0eD1+qg5gEEgmayhUfjRWT+XJnS8gcGmwHzOFp638hcOBJak0CeRTgjy
	bxIcYkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w661D-00000007KUA-022X;
	Fri, 27 Mar 2026 12:10:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w661B-00000007KU1-22iF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 12:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CA066132F;
	Fri, 27 Mar 2026 12:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC96C19423;
	Fri, 27 Mar 2026 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774613424;
	bh=YnNZ1nfvdPpDm7clKBQ0VkcKsSG9pKcCGTcXk1OjXFY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mtW51gp8+tPSXAIDnSw1shdBoMpVcrpsY6o9QSWrCAiF57VK3cs7x8/bwE15ImmF8
	 a+2Glfv3gaaZ53W3Ht2Rw3rFJ1hWCdBcjKKjCuj0kbNZI1qqCydf1ZOHI+DFv0viAU
	 ZgHVfcdYv5AxxVVlPFM5Ju4l54v7mLDt0H2WMLqXxA1GOKF+4n7Zyt6hKnoy/GSayt
	 8YEV/0QILPCUXOYWImJWTL9k93xNc6d77roPKs9LxMFRFkY/EtoNEverPX7Q3s1bs6
	 RIaFWP+ah3z1s4+saWcWveCT6PFGVIHHrBQpYFZ1KQdYhhXzDBIppkxrNM1jdo2Luv
	 4ZgU6SKsinnWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDA9393022E;
	Fri, 27 Mar 2026 12:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ti: icssg-prueth: fix missing data copy and wrong
 recycle in ZC RX dispatch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177461341029.3453543.11116884861266878572.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 12:10:10 +0000
References: <20260325125131.53399-1-devnexen@gmail.com>
In-Reply-To: <20260325125131.53399-1-devnexen@gmail.com>
To: David CARLIER <devnexen@gmail.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 m-malladi@ti.com, jacob.e.keller@intel.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
by David S. Miller <davem@davemloft.net>:

On Wed, 25 Mar 2026 12:51:30 +0000 you wrote:
> emac_dispatch_skb_zc() allocates a new skb via napi_alloc_skb() but
> never copies the packet data from the XDP buffer into it. The skb is
> passed up the stack containing uninitialized heap memory instead of
> the actual received packet, leaking kernel heap contents to userspace.
> 
> Copy the received packet data from the XDP buffer into the skb using
> skb_copy_to_linear_data().
> 
> [...]

Here is the summary with links:
  - net: ti: icssg-prueth: fix missing data copy and wrong recycle in ZC RX dispatch
    https://git.kernel.org/netdev/net/c/5597dd284ff8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



