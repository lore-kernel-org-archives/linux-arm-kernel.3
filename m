Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499AEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 18:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCgdcSeb2p7m6QoTt2KsM+G0ruaN/dJ0MDMZ46nZyAI=; b=G/Nc1HgmRuODvoejt3rQ0+uMdN
	7TuEIeEHxnfTNAlgj81MX1zCgqVBv1IqXOMQ+2p2PyOFIS8xwE7W2fiAeIG8/lMYENzBExkv8om1a
	GvDpR0ISrJSaGmDxefTLf8K33SdXYawxFc9hBdBNASJ/n9FJ8QW1tFLiDV9DLsLCQaYx194whgwvE
	hz/dN/R46rQYF1pYEmyicD8aKy/6xg2Sw7p/RhT9SNfpoDzGUBwCHuAo4cPhy+vbcpPFzgH2eeMIH
	e1xTPtTfmucmy6+cc9XmU2Pm+ftpqSbBkkXPVpCLj/tVqL7GxEDCPvIIAha44mqDPwSfzpfBDd7Dt
	08+OcUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twmtk-00000003yye-1Z8d;
	Mon, 24 Mar 2025 18:51:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twms0-00000003yrK-3nWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 18:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A412E4381A;
	Mon, 24 Mar 2025 18:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A05C4CEDD;
	Mon, 24 Mar 2025 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742842195;
	bh=5mJQMRQsVibHd/5bNNk88AKE105YGw+TZJNqXyev8w8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tibyIlAmKi10TBcgbcIfgj80LnAb4flQKSfrvR1TlD9mnGZeWL4PZYsgPbx2KnR0O
	 6zd8HM5WMjab+2rO9OChcJ9P41fkPpUxwkFRTwHsECxFZGLv22XJdmJThYzAg55vPK
	 eM3zjMsh8hJ0L3rdO1jnvr0rUdjBW3w7ECFYPsRHsT4zoVRHXatIMzYGYh95WptVre
	 1oy2h/Hz518+fR09MfIC3YiKDY/uWhLnsW02dhOoWL+oY3smD1Dy9MX448t7Z7GEsf
	 gY6IzC2OFGUIyJE4ytBCzBax8rybCKIUVaT0O5k/ugiPlaqWMFyibgvrbLEnX1oEAy
	 oVeTsCjDPeszw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34660380664D;
	Mon, 24 Mar 2025 18:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: Fix accessing freed irq affinity_hint
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174284223202.4131627.8031895461636997073.git-patchwork-notify@kernel.org>
Date: Mon, 24 Mar 2025 18:50:32 +0000
References: <20250318032424.112067-1-dqfext@gmail.com>
In-Reply-To: <20250318032424.112067-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_114956_965173_DDD0A818 
X-CRM114-Status: UNSURE (   9.95  )
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

On Tue, 18 Mar 2025 11:24:23 +0800 you wrote:
> The cpumask should not be a local variable, since its pointer is saved
> to irq_desc and may be accessed from procfs.
> To fix it, use the persistent mask cpumask_of(cpu#).
> 
> Cc: stable@vger.kernel.org
> Fixes: 8deec94c6040 ("net: stmmac: set IRQ affinity hint for multi MSI vectors")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: Fix accessing freed irq affinity_hint
    https://git.kernel.org/netdev/net/c/c60d101a226f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



