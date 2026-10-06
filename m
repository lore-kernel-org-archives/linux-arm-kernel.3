Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBA9CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 01:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbmYD6AEzHl6UKm4PAxVqxoifbq6y4Fx2sPcU3YCLCg=; b=ziHGmqJFRcYe450PXIZB/rSBGG
	1IS0aEqLAYpUKTVqBQ18L3YQQ2tW2glXL0Jft5bARQzErpiBJes3Qhq6tCqMi9C47HGcHHt4RtplL
	C4JkFxhsCNwxTBZKWlnxxPDrhk1TKDloTFC0uqWLnIyM9qce6WakE2TLKY6tv+0wtvLIwV1kCy6DM
	JzMez6cNE5QDlZoMohFENNCa0K/LSLUuqNJd4v6yNrdWTHZRjyfA2esSPq/XJjWpy3QunO1tlm+m4
	BSGJ91yyU3bhYEe9bnkv/Dsbn6xUk5dE4ilja186KsmlXTajMrLjNSP/iwQFvqC8J/3mv1bAjeNyw
	HNLWA7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDttu-0000000HSHH-3qZ9;
	Tue, 06 Oct 2026 01:23:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDttt-0000000HSH7-3zb7;
	Tue, 06 Oct 2026 01:23:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A9D460008;
	Tue,  6 Oct 2026 01:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550CC1F000FF;
	Tue,  6 Oct 2026 01:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791249803;
	bh=XbmYD6AEzHl6UKm4PAxVqxoifbq6y4Fx2sPcU3YCLCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=k7cQN5XaFdejoQjuj15puthbzoZGOTJS3PJ7tVC89282CVn+JSiGc/q41UbEmmbsD
	 hMXH2n8kx19CehVYfzGH05TORcjuhTtVDPZHsPyf4Gty/HSiJ5CJTQO7FNA4i9Hlhi
	 4FZ+CUjr0AqzHEeoNq2P8FzqaPc7tn0CnFwhi0AfoY8j9+T847zQJjqtQZcKZq33km
	 n791SFCuyY0PHwMj1fL2J4bQnZI68iUAX7W6MQ6IAz0/0sRT/OW2q0py1kzWdS8Agu
	 OUsJiRO+ajO8xzcepLYQBhlw0qTX6ybNz+TjqqSWU5IeUEvvCCB2Ljwbqqy6RvHQij
	 tbJNhsh5eq0KQ==
Date: Mon, 5 Oct 2026 18:23:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system
 time programming errors
Message-ID: <20261005182322.2bc023e8@kernel.org>
In-Reply-To: <asQcQIh56MV1OJur@lore-desk>
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
	<dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
	<asQcQIh56MV1OJur@lore-desk>
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

On Mon, 5 Oct 2026 23:53:04 +0200 Lorenzo Bianconi wrote:
> based on the reported error, stmmac_init_tstamp_counter() fails with
> -ETIMEDOUT. In particular this can occurs if:
> 
> stmmac_init_tstamp_counter()
>  -> stmmac_update_subsecond_increment() -> stmmac_config_addend() -> -ETIMEDOUT
>  -> stmmac_init_systime() -> -ETIMEDOUT  
> 
> I guess we should understand which one is failing and why it is failing.

I'm going to revert, this shouldn't have been applied to net in 
the first place. Let's continue the investigation but v4 should
be tagged with net-next.

