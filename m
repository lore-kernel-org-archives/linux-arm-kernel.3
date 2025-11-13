Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64133CD8C9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Qa2b3TK3RkIKS4mUznh9vokHezLzU44ffK/j0sJeK8=; b=XmylOSsFmX5Sze7f5nAMtxUPsA
	cibnm9gXqZccgdMJ5oTfH+k08oR4hb9PttDGOTIx8xSalvQzO0vOJvSLfY3t4BhaWMi7eERQvFw9g
	QShnnJmvJGMryVKW3GQ2vZnJ44zRgViGBzztwpIkM5wC44AVJCfXsNBzEWbA1sE1LtS7j2Fk/KclH
	vKWkA2AqSyAJredueohu26EbmPyoYClhtM0H7jjmbWl5WGOahEoUX7lGzif2cY24YXNelazo5RU1d
	V7McQdcu3eUwiUnkDdU9aNgN1Q/h11NH03PiqKT9InXjFZArATv1bc1LSLb0QtyYgj5tQG+qKp/qT
	7dCYygWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZuD-0000000AmEm-2L8D;
	Thu, 13 Nov 2025 16:10:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZuC-0000000AmEQ-2KPp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:10:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E102600C4;
	Thu, 13 Nov 2025 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D50DC4CEF1;
	Thu, 13 Nov 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763050239;
	bh=ar/J7la8s0fj40xp4GiCiAlJdslTGn7uYA1smJ+0H1o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n/iCAXXKC7XSO7b+UMgqZqQ2tnpepOXebi5CtmTlP+jqmaup8o9CUv2mjUFSGCso+
	 nRaA/IwsE5JfZHKODj+imNGnNtYI4lO3kfKrO8KbmtG1AS2N4LQhd2zu2Y3SuykQC+
	 VcbGhyeuk3jlas72rsmW2QCi0C/wEO87EygXOK/h4CyzbwQTr6mqwlNiRQpKafU6uK
	 fQ0sBofZBox0zMJGG6M6X1Obnb2fYeI/0Wc+xpbR09R6Eo2tomZBuXBaqkzXl6KtRU
	 uSXIfP2khZbjfJLF7LlpaTOuG1PKzbHHy35tiSm7YDOkBXfGD/xY+7AhijyRBxvMy5
	 5SkiaGAtzFWBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDD9380DBD2;
	Thu, 13 Nov 2025 16:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: clean up stmmac_reset()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176305020851.908070.9331102777618461950.git-patchwork-notify@kernel.org>
Date: Thu, 13 Nov 2025 16:10:08 +0000
References: <E1vImWF-0000000DrIr-1fmn@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vImWF-0000000DrIr-1fmn@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 11 Nov 2025 11:26:39 +0000 you wrote:
> stmmac_reset() takes the stmmac_priv and an ioaddr. It has one call
> site, which passes the priv pointer, and dereferences priv for the
> ioaddr.
> 
> stmmac_reset() then checks whether priv is NULL. If it was, the caller
> would have oopsed. Remove the checks for NULL, and move the dereference
> for ioaddr into stmmac_reset().
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: clean up stmmac_reset()
    https://git.kernel.org/netdev/net-next/c/d0af55df5a78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



