Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F083010706EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AoH8p7scZskefPdSpTpd3T6tdQlotazxTP2An3TiE8=; b=u1qrqSu6YMBUPFxAWIdxRtLOqZ
	khFWww978qcTblbuuPiRZ6X5L1VzlUBUfIhtAxe+Pb5PqOpYnUDusDykToYp5uCsf6NZND/2x4qsU
	5FKyXxzos0Ro2GZ7FvwnLU23o8cBGqltWe86nqNG3M/Fl8e2f4m48ADzpTo/f7TzdHillfgg+ybUr
	tO9SiQ/Df7jfwauzGIk3z4cP1qEc7wrDyYJlfTajH3SuOY55HJFEDu0o1dVYJea5fLJk9DGwkj4oC
	0IxzhnhofIWC3b1OdCyVw662m2o65qjvcTsPgSJxVrVgrzt3R0Ag1B1neUOdznpt58EpjYAI1+zVK
	W4wCa0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1S6G-000000020Ch-3HNN;
	Sat, 14 Mar 2026 16:44:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1S6E-000000020CM-2chz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 16:44:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04F5741A7C;
	Sat, 14 Mar 2026 16:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621D1C116C6;
	Sat, 14 Mar 2026 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773506664;
	bh=1AoH8p7scZskefPdSpTpd3T6tdQlotazxTP2An3TiE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kv0lBT0nC8OWGRbH/dIwtr7ftpPdLhzdSulMbcy8vaJ9JuWNKBGhFuXwp8RSajf+/
	 v0TIz376XDEql39GPYvARZOjp6vv2RPWfy0IZ/LQ/awhKcAg/EVNfnW5ViMux/2MXh
	 meQl7oOzOZgH2Oob1yfX5qcR4QfcDHTvq7YiKLGqA1TWRuJbzcUpgKhXVmxxlEkGIo
	 5xjmCf7g7KzYm1EvR01yyTFEZKWPubEmSCODX3KS9lDAq2M5WZ+gJQvStZ8uWRF9Zn
	 E+LVaLQIpTALG6wMGQN3dJU1x5BPO7Z5ajw313TXWR09LpjJMZyxUneYkJt98fY8jV
	 GA/lxEOwk81CQ==
Date: Sat, 14 Mar 2026 09:44:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: avoid passing pci_dev
Message-ID: <20260314094423.6a908938@kernel.org>
In-Reply-To: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
References: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_094426_691855_3FA46BF7 
X-CRM114-Status: UNSURE (   7.29  )
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

On Thu, 12 Mar 2026 12:13:52 +0000 Russell King (Oracle) wrote:
> To avoid unexpectedly exposing the device name through ethtool where
> it wasn't provided before, add a flag priv->plat->provide_bus_info
> to enable this, which only dwmac-intel needs to set.

Seems fine, but maybe as a separate patch we can expose it for all
devices? Is there anything special about platform devices here?

