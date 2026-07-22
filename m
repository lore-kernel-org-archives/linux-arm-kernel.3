Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6340EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfA1OHyoNK5FzbOdJuHu4i3K9EKRHzDoufrZr64MOwA=; b=rOCkljrsdH3iOC9eBuuM6ul21V
	ew80sIhIpDNDudhGThAOLrnhvGwBnM7AJVw4HcmrZ1sZcYE4ZVzVSTAebSIDp2hTPqfpBvjMsqQnh
	lTxd9xFQHkP8GJebCF5qtgBcwN2sG4tjsiIi4WY0YfS7vikySEGR4D5e8hgrR/wye04WrEKZF1MfK
	ffgm/TArBp37BAe8ovLzHPgbeRRG1YvVyUMP0rLIEHmeGd9bEl24OGxHZOcHUKI5Dozhr6d7WFWAR
	1sQRUNY11IwOH0sGDnCW/1AT6prSgK9UtXmu+0J9IJOWVCJT1c3Fb70zcMyZzeb7GOJXsYYbU67af
	Irk6vN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmY9p-0000000C3ud-1p2p;
	Wed, 22 Jul 2026 14:42:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmY9o-0000000C3uV-0nI3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:42:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91C8A40977;
	Wed, 22 Jul 2026 14:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138511F000E9;
	Wed, 22 Jul 2026 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784731367;
	bh=HfA1OHyoNK5FzbOdJuHu4i3K9EKRHzDoufrZr64MOwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jbkBPGLaDX3JXiyqNCDIBxFixmmYl6VfPzw/C9jgOh5v8WVqY3cc7Bk3idYic5Wa4
	 v6NRkglYIjHt0eERQ+LrbHILNxnk7r1778vQLqne4u57+JzedVdTtuIBPZAzvt930I
	 /AQaK/8O2rmiWEoBN684qf9YOwt432F5DuUHpZ1R/rL61P+/nFO7Ay1XJlREEyAjtB
	 CmflNnxCqRthkHKaalM/qyKEr+wPAQGVK8hJIhHZ9gIOrhEh7kfDlKwYNOrYNJ7FDh
	 MI+TIWlXOuBcjx4Qsi4XXX1H3uyZqcR40TxGNVzNk9QHWmsWjFI/JvOIAjABnlZ32N
	 DLD3Ft16eRePA==
Date: Wed, 22 Jul 2026 07:42:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup
 when opening the interface
Message-ID: <20260722074246.689401d1@kernel.org>
In-Reply-To: <20260707195425.405989-1-stefan@agner.ch>
References: <message-id-of-your-v1-mail>
	<20260707195425.405989-1-stefan@agner.ch>
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

On Tue,  7 Jul 2026 21:54:25 +0200 Stefan Agner wrote:
> Since the referenced commit, changing the MTU on a running interface no
> longer disconnects and reconnects the PHY; __stmmac_release() merely
> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
> is not enabled. __stmmac_open() then performs the DMA software reset in
> stmmac_hw_setup() before phylink_start() resumes the PHY again.

This patch is 2 weeks old now, which is the time horizon for most 
of our systems. Please repost if it's still relevant.

