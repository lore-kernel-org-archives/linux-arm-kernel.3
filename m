Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB301CED260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ffo7JbxhQEHJ9WS+JJKRo+AxWK+uLfBKp0Z/1LMwOs=; b=BdtFGrlmRAHOlfM6kgvkRUTFgK
	cb9pNB5qPhKzkaksI6q1JMOtNTyOGXyzlHlNCxIqkRjVd5gYVKaMix6eKWuRwJk8twqcz/bedNoo3
	nqZmHky4Ymq8QMnbo7LdcMTOZ+N1sA+qss2JPdjlLRz1hpLRzeK/w7hyl9bNSny4jhBExLngOs5Pk
	HXlDDW0IY3dG1aZ1ITeUGk/CXv53IUFZGZ9fkmuKw1a/Q6Vee+IComXgkNXHuONu/k7QsYLEpPwsI
	SJlvxm70hotg4f+qDLiWcJ/Z3IfLO3syEyXrJWU+gXwXFiVSrMTyFed5VQbvvOgvtUE8vsA86r6MW
	mFTpnfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIff-00000000DYp-0BUd;
	Tue, 18 Nov 2025 10:10:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIfd-00000000DYL-1iQD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7424660192;
	Tue, 18 Nov 2025 10:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7580C4CEF5;
	Tue, 18 Nov 2025 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763460644;
	bh=b+pZBV7epkHUl8mBX3MIDt42yUoTMnfx2I5N3DhgATE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rtIjXzbzgyy8I3kPhTEMa3ltWVLtGSjFxyDOdqFwsQQrUXnGe1n7a4Bmo8rxpvlqA
	 17K2RUJjR5aGxuErQmPscJepT4oLRKvoeY68gBNSpCAl+Znhkw/Y/61HZXI61M6ALo
	 koh07cOdrHj09YrbgmZbJFnboR6sa3i1RfHpNwjX5I5YE3525bIaXvgPCpcc7nIJ+7
	 v9Jpr/9WHlTZqiKVNHm4NeqWnPiIyJlSdrkSbD3Pz4APWktX7u4wOPrBsRrKJTg6pa
	 TLW4Be90dLSe59Tre+1vaAzc0RYyqWsxbYsal32hGI6mWxRWJjq5ApSS5RJoWvnnjI
	 9/WjtsxaFVcHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE4A3809A83;
	Tue, 18 Nov 2025 10:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: Disable EEE RX clock stop
 when
 VLAN is enabled
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176346060951.4077292.1388526029829048727.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 10:10:09 +0000
References: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, boon.khai.ng@altera.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 13 Nov 2025 11:27:19 +0000 you wrote:
> Hi,
> 
> This series fixes a couple of VLAN issues observed on the Renesas RZ/V2H
> EVK platform (stmmac + Microchip KSZ9131RNXI PHY):
> 
> - The first patch fixes a bug where VLAN ID 0 would not be properly removed
> due to how vlan_del_hw_rx_fltr() matched entries in the VLAN filter table.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: Fix VLAN 0 deletion in vlan_del_hw_rx_fltr()
    https://git.kernel.org/netdev/net-next/c/d9db25723677
  - [net-next,v2,2/2] net: stmmac: Disable EEE RX clock stop when VLAN is enabled
    https://git.kernel.org/netdev/net-next/c/c171e679ee66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



