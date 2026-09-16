Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D894DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5jMq3f2Yy/ZDSkoech/7qYqbpoi0CVkKz7eZOPEjNo=; b=JZpD0Mx6zPI0gMkwxeed7RqwPr
	mlp1fNBdNkkA/eKlqW3tuAIoMi6CcawYInRN8NCEmxAQD7gdy6+L5LSdw4uoJBy0w2qIj6vI575zh
	YZXJCJ/aA9UDil85jaDGYiqj6r6m1eYWXIgKGPzYZ4cyx/07gvY0GY+tEQZZ2WXAYmEjg5eDRmlwA
	3jbfCTZXlcADc7+Ym/h38h/OITueEmA55Amu+jiyAfVZybFk6H6Wu2fT9y11BJ224vL/YYeawVBoj
	Ko0zHxAmbS2ZvRs6r/bQAgluPe2Zk7BjZ+znmia2+un8So2YkgsFHnt+dP5EiwEi/u+LQ/w16uINh
	kYgT4gnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dF5-000000085uU-2Ds4;
	Wed, 16 Sep 2026 00:11:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dF4-000000085uM-1hrO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 00:11:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF2D56022A;
	Wed, 16 Sep 2026 00:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D8A1F000FF;
	Wed, 16 Sep 2026 00:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789517473;
	bh=D5jMq3f2Yy/ZDSkoech/7qYqbpoi0CVkKz7eZOPEjNo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f1nxqZ5OJejye4FJv1CW3ZTjBy7aKDLNK7m62FZ26wGRT2h2zOdg/MvexjEfzGSfa
	 G63Va+gHCDwi/LK4EM9HFlibyfVDmp6h9yiN9fTXASRocW0hFrX8jDER9V2bARCvpq
	 OR+zqIL7e3b2mtrRQllwiEBhvPBRx68mJvZ9E3FTcBwNFY9Yilga7aNt6bJWvGlORU
	 NsQRDgAZMC6aoJqYYqzWEe/t9jQulBNf+KFT/t6wVhs509L8PLXLy6RDGx+Eou7aQV
	 l+c3WEjLVEK1ycPYZfnQsCofHzfvOLmY3vjKFGM29yo6HLjUhu0cCI3gO/jgG9Xp8p
	 Rkn00IJJW/nrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198DB392706C;
	Wed, 16 Sep 2026 00:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix TSO header length truncation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178951740763.2328807.9767514074293530178.git-patchwork-notify@kernel.org>
Date: Wed, 16 Sep 2026 00:10:07 +0000
References: <20260911-stmmac-fix-header-length-v1-1-8fc103334327@oss.qualcomm.com>
In-Reply-To: <20260911-stmmac-fix-header-length-v1-1-8fc103334327@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 niklas.cassel@axis.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 11 Sep 2026 11:20:15 +0200 you wrote:
> stmmac_tso_xmit() stores the protocol header length returned by
> stmmac_tso_header_size() in a u8. stmmac_tso_valid_packet() admits
> headers up to 1023 bytes, so a header longer than 255 bytes wraps modulo
> 256 (486 becomes 230, 256 becomes 0).
> 
> A TCP over IPv6 socket carrying a few hundred bytes of sticky
> destination/hop-by-hop options makes skb_tcp_all_headers() exceed 255
> while staying below the 1023-byte limit, so such an skb reaches
> stmmac_tso_xmit().
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix TSO header length truncation
    https://git.kernel.org/netdev/net/c/15989abd74f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



