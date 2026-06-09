Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619D2CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh7+JytDuZuJDCznDx0VCj5EAQToBkmQNWkGO0U5JvI=; b=Qz/NWeg2VcnwNGpIJo07Wj/RMB
	BNpIMIEW1Z1Xx028W3GzBooRPxn7MVnWxArGtWH3bETjKcj/TUq2HJjiu3Vpc8UGakvdgRl/kh0xe
	W+cyJkRKbGSWXJ+Rl402kSvgdIaSKEePXhoRVVls+dlj4yD+xmfhBOfbiaWbAUX6ju4lonj+DtaNS
	N1TFw9DlJ9TTDmEeD2qOw4GtrMF1GFmhCjxtTyIBIvj/hRO+uoZ+Vj/PzMozqAXLHzWbykmLh0/GG
	WVGGqaEeOl5i1KYj/VzOS+EdywgafTl+huwGirUicfnigBMfpwF4Z6qvWqgACNY+sPIpCk8bZnAQp
	vshv34pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWmF5-00000004d7H-3SnV;
	Tue, 09 Jun 2026 02:31:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWmF4-00000004d79-2KqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 02:31:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AA72601E6;
	Tue,  9 Jun 2026 02:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF2D1F00893;
	Tue,  9 Jun 2026 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780972261;
	bh=rh7+JytDuZuJDCznDx0VCj5EAQToBkmQNWkGO0U5JvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=N010GNAqn865krLcj1+QjF6lVLaybog1vWywyrSP38qdeA8j7WHMoLIpIOtlEdagc
	 6MoCXwA9+/L8BICWTkA++plpfOmaOqYBSagWvM1W1uPU6C8M4OsUhhgRybotcLOK4u
	 yPvB/VUbi23tpa5LTmCGUZ3NCtF7HaqP6tPUlfYNmm6m+Na1F3ptB3oAKP/f5KBa4s
	 CNWd06BpSXlLxzWWVtjsT0AzkrSh1zE7VWa5sfAM37smT3w+E2LjgpUwijrNJRPL/3
	 n0auAu1H9YMjHnTRlbpfDsBdBGPrDP8jy2PSE4KPw00hAgaMqewliZCm5EMcipNlq+
	 XHp7oVjFBTrgA==
Date: Mon, 8 Jun 2026 19:30:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ding Hui <dinghui1111@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ding Hui <dinghui@lixiang.com>,
 netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/STM32 ARCHITECTURE), linux-kernel@vger.kernel.org (open list),
 j.raczynski@samsung.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
Subject: Re: [PATCH v3] net: stmmac: fix fatal bus error on resume by
 reinitializing RX buffers
Message-ID: <20260608193059.78e05dce@kernel.org>
In-Reply-To: <20260604144557.3175399-1-dinghui1111@163.com>
References: <20260604144557.3175399-1-dinghui1111@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu,  4 Jun 2026 22:45:54 +0800 Ding Hui wrote:
> +/**
> + * stmmac_reinit_rx_descriptors - re-program RX descriptor buffer addresses
> + *				   after stmmac_clear_descriptors()
> + * @priv: driver private structure
> + * @dma_conf: structure holding the dma data
> + * @queue: RX queue index

nit:

kernel-doc script says:

Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1733 No description found for return value of 'stmmac_reinit_rx_descriptors'

You need a Returns: statement in this kdoc
-- 
pw-bot: cr

