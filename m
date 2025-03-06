Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3726C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwjEcLax1sJEeFzLew1pM4WjXCAQEzkBGz2ViepOdcM=; b=HLAvzfronJOoQkAk+6JDVM6kXr
	ZUw3pV0akVmdKmIKpd3qdfa52vxV6YBvBQJ47HQ0KqKAzp2AUXDNxsPwn6KaCBb7jw24KBgKXI3vH
	on/L//Rlyn8b8hdOxdqMXJboWHJK/9Kc2kFkz1fk3fTidRFkf+Al6JXvfpcU7u9vNQ5a2Luydxg8M
	yAfYXsw7qkaoVLn4meYwL++fWjS0PbIeY+EMi9j7gJw2z4zrdgE2uPChzSqu632pSGnkxb0LorLik
	I5GKjyp1/m0gJmPVqPoV0pdD3mQEoXEMhJyfpuWcyYM39+IJFbzVV9d7a7LL93bTiCP6pBX7LIoEr
	vHFdQ2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKqT-0000000CW4Q-0iPP;
	Thu, 06 Mar 2025 23:41:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKor-0000000CVi7-02OU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62C8F5C5AE8;
	Thu,  6 Mar 2025 23:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EC1C4CEE0;
	Thu,  6 Mar 2025 23:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741304399;
	bh=emxzmeQoV90jOMUN+sghwG9Iapc81kvHylrex2K2SQg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qzmu15qpNBeUNAGOvVtYjyrFW8GD+KK8PPOdD/YPth7RhmDqWWjFz71/4pwTiF7CW
	 vP1eo8OF1neqxogtQF2mMDvF23SS9hS4ow1IdTbX67aRvc1fIBryQ+nzLwdYIQUeNf
	 ro7T3y/Z7kqCMxr3jl4sj78QeZAlj2gHe8wMUQ4mTqiXBXtDc+b5gDRAq4Ofw4yFlW
	 Ko03dZIq5GDKmi3wE8rZCkuTB0P7PdPOtf2RVgT3cT7wzBGs4vfSWQaTY0IoczF79I
	 1pr9d/UjqUOb7hd8kTIrM5eK0XJn2Cai8Ubs3y0iFq7nL3z3DqN/xE+wWzmlRwZwlo
	 a34JEZiCwtVcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712C2380CFF6;
	Thu,  6 Mar 2025 23:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: mostly remove "buf_sz"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130443328.1819102.15961350109548099161.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 23:40:33 +0000
References: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_154001_104454_E9302A50 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, 05 Mar 2025 17:54:21 +0000 you wrote:
> The "buf_sz" parameter is not used in the stmmac driver - there is one
> place where the value of buf_sz is validated, and two places where it
> is written. It is otherwise unused.
> 
> Remove these accesses. However, leave the module parameter in place as
> removing it could cause module load to fail, breaking user setups.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mostly remove "buf_sz"
    https://git.kernel.org/netdev/net-next/c/072dd84b4c5a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



