Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6C0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiqKtzt3jju1Vkp8pUVzlkypJlr1n3AMu1PlsccxwQo=; b=qOmW4R02+6vliXmQpObCf0o8Zc
	ihXNULE06mWC+/KbFkShmlAVQfV4HH+B634oCeWZPzYmItqVxDYvfrRMhsvBzHl66W5JJxe+QbVRt
	MNrbDd34fAUtu2jXiVAH3GJ8aG33bg3ckdxjbACXmVol1UmmtspVjHrH8mPVog6ci/cOKL/158Nfn
	bBymtul4Pi5fbCmuf8Ah/ZtUXHGTy+wabWIi/xxlpdDlce292S0VCwQS98Rrc6DhbQNoPzVubhh1I
	QNMOyX1B7gzyrJrXb33y+rvXdLny4TS7LoUi8me6fahEztP+m22UF5xHTndFhsSZgsxj3UNSnbqjD
	hKvHUwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHSp-00000003xr0-299u;
	Mon, 17 Mar 2025 20:53:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHPU-00000003xDE-3b4A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 508685C5710;
	Mon, 17 Mar 2025 20:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E60C4CEE3;
	Mon, 17 Mar 2025 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742244607;
	bh=/5nrDEx/cxOivewhUUw6g+VfdmfMMLm0B54SjYnXGHY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tw+P6AxcSpleXMDQKUvlM+oW/xniTXfOfN+tGo9xkmTnjhuFjkfLPy+KZ9PQ6lDdB
	 KrQRk0VuujcjDy3Sa4xHIalESO16NSejUGgMLB3VsFLiybaLtHCu+uEEFNIZ4+BrhS
	 JGcoaZvVkE/mtzE14P9uOS77FOu7o+PlS+yospBYP8n2O7wKFBmAC6EN95+eGLTDqH
	 aeSGm4KOzsN+jpNdclSvt9ZBktK+IP1it8qAUH1xlAdJMINA98u6eMfi0X1Aj64bF6
	 wV08NlmutHo8bGR/FMRFAFX+wgYGRVy+j86omAMUMZncEjAeNQ/ABylqbtWU2cieHj
	 Wr+5g4APFzbIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C5F380DBE5;
	Mon, 17 Mar 2025 20:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: remove unnecessary stmmac_mac_set() in
 stmmac_release()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174224464324.3909531.15170592686789310939.git-patchwork-notify@kernel.org>
Date: Mon, 17 Mar 2025 20:50:43 +0000
References: <E1tt9Mq-006xIG-IC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tt9Mq-006xIG-IC@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_135008_951408_EE26B1C2 
X-CRM114-Status: UNSURE (   7.33  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 14 Mar 2025 18:02:44 +0000 you wrote:
> stmmac_release() calls phylink_stop() and then goes on to call
> stmmac_mac_set(, false). However, phylink_stop() will call
> stmmac_mac_link_down() before returning, which will do this work.
> Remove this unnecessary call.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Furong Xu <0x1207@gmail.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove unnecessary stmmac_mac_set() in stmmac_release()
    https://git.kernel.org/netdev/net-next/c/39b0a10d80d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



