Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F61C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kv09oRrqhZ0MmSeeXoULdUWJObG2LqKXWdMAsWFhR0w=; b=gvRnZwwTgZ2I0WEFzUMAZJuxNL
	EuhNqToy9wRGooxCLyzWXrFeDtMlDOPv1KnhAj+0MpqydQB9q0VSVXATvz2dZ5cT1WP/CdFxt0os5
	fH4FJkbN2un8mNgaOx9Or89Wkzg3ZHikyNTqySUf0Uy+wFADjqvlXcDoyogdBDr2qrIzSByJ+LGvn
	F45u/Cg9Isb3fUvNutvqcL3cpmcrACIL14KaHCjS16SFl4KrUwjut3dP9WBWFrthbuFmrJVC95GIn
	ot1th5KZSAPy8NhIITEbSWoqvkio3tVGi4ZzO9tnNqYDsTBO8AM1vUVqf+YnbEmV5c2hcpjfoq1wM
	dylxOJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLAW-0000000Af2x-0Jqn;
	Wed, 22 Jul 2026 00:50:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLAU-0000000Af2Q-2bkK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 00:50:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F273601EC;
	Wed, 22 Jul 2026 00:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FDA1F000E9;
	Wed, 22 Jul 2026 00:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784681436;
	bh=Kv09oRrqhZ0MmSeeXoULdUWJObG2LqKXWdMAsWFhR0w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Fdnew6MUGvAyJWBerEFF63RLuKQDQHw4Qk1G6XanTR6Na4f5TxRedLJXXfbQQCaTm
	 MFuF+xdBFizzES+3+l+pxCbQZfgLCnmiuceoNbXS14kHIM8QoxRtnYrIa/a28167gA
	 nljkIONU4rCOqxvMRFVlL5C/D9WfwKPV3U432mO+vn6fkqiOqGvTI6KBJa0kPByChU
	 R6e9z6089NcqOUvTBP2qtQ1XWpRgw4Ivjh29qmj0uUWBf61uSLuug+xeAXSe1rD+JP
	 lDYTOxnVZrcslNk4o7DV9DfPpn+dCGdvfCEWo8n1QtFFXIcrPjq15WOod8dL5PuKBF
	 pJ6VAuxBMPQag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A40380820D;
	Wed, 22 Jul 2026 00:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: intel: skip SerDes reconfig when rate
 is
 unchanged
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178468140590.1181429.17240708889792397256.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jul 2026 00:50:05 +0000
References: <20260713171619.192452-1-bre@breiti.cc>
In-Reply-To: <20260713171619.192452-1-bre@breiti.cc>
To: Markus Breitenberger <bre@breiti.cc>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, bre@keba.com
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

On Mon, 13 Jul 2026 19:16:19 +0200 you wrote:
> From: Markus Breitenberger <bre@keba.com>
> 
> intel_mac_finish() is registered as the phylink mac_finish()
> callback for the Elkhart Lake SGMII ports. phylink calls it at
> the end of every major link reconfiguration, including the
> initial one during probe.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: intel: skip SerDes reconfig when rate is unchanged
    https://git.kernel.org/netdev/net/c/0ab78ead2481

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



