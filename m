Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BF9FB5EA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zRzj/QcUseOk7c9y2UnjYbfkCnCc/J7Yfwo/cB5030=; b=Z+lQ2legbqwOFWLRUguKmyC49a
	gMKTDFeX7Hx/FXoODYdLeiRkA920DuEk2hVk1t7QcxEY+uIKMQD7DabWk5EwdNjXSSJt3EAA0iT7G
	J6Nigvt0Z09CqPpMUR0sT65UL1T+MMp1Xg/kDsSkUzVjuuoPbRTUW7o5WHx23fW22Q3WIn3/2SEa+
	dPbHJZiSHmn3ommqDwIFIpxQ45sPJLy5z11yir4IkP5CNlbqEuyVSu8ug7WicVgIlDp3HLd+EMh9p
	F5RGxlgilnn5ZF9D5vPKJZ8fa9yxnfj0SIp2cwGebxjApSPiPHXODR7aB+tpL+iKRx8lH9JVkXc0l
	DmDLqFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kyu-00000005ILK-3GjS;
	Tue, 17 Mar 2026 03:20:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kyn-00000005IJR-0iDj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC0D143A94;
	Tue, 17 Mar 2026 03:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB65C19421;
	Tue, 17 Mar 2026 03:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773717624;
	bh=HGiLTD0IeBPs0tWAtHglH17Tdic1dLc2oqzeom/AURQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SuZv209ZVlDuxDPx7JRpTJQ9Z+mn4yLC6g+8JBLV97Qx0eubrM0mAMdg1/kVlBs0D
	 dHikerAzRJ+wjcb4ySwWqT0clD5M4QDzTr5oHZDe6hnpQFrCgElNVdR7o5QWmdtzlv
	 t4sCkCzyooP5z7dwaZhfuGv9NEil1uUAYtUR8SCBo9SW+e2Z/l2+LoQofgpLc7hqk+
	 Db8KoJG9Lr9ZJBEhHlPiXD8JbtUQGmGUF+DZu0On5gT8QKdMkpZuIaZVIxd3PDi3F2
	 Fk5MTTwp9KkjOekSekBom03/xjb9idNP2JSIWrFrYZFblLAAOQL+2APUHRAAQ1pAWG
	 /bGWCbr1oXl+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD7E3808200;
	Tue, 17 Mar 2026 03:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: move MSI data out of struct
 stmmac_priv
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177371761729.3410412.18078716874517842825.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 03:20:17 +0000
References: <E1w113e-0000000DDwc-2oRv@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1w113e-0000000DDwc-2oRv@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202025_225091_7693CF61 
X-CRM114-Status: UNSURE (   9.00  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Mar 2026 11:51:58 +0000 you wrote:
> Only three platforms supprt MSIs, which means having all the strings
> and interrupt arrays always allocated wastes space. None of this data
> is performance critical - this data is only used when requesting and
> releasing the MSI interrupts.
> 
> Move the MSI data out of struct stmmac_priv into its own separately
> allocated structure, and move its initialisation to a separate
> function.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: move MSI data out of struct stmmac_priv
    https://git.kernel.org/netdev/net-next/c/dab177cbea34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



