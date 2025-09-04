Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D07CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRZRjRSX2JA9lvFNL/WZkeCUWyYQfQ1+r6Jp/WjO5pw=; b=Dv/PdejMhcoC9UgyGRwYlAfmnh
	cDE2GAn0ql2ToL8L6THdun7CKK5hJ8L+p/4k5imKSY82UrHxTaU/RXC5cma8av/1BA7zgQokbEqgK
	3A1GIDzFSejUcqRg3lKlPWYOLnvBREnj1KmOG7+p+H/j96TOFYrL+5qmguVKEmLeO2z2pRfkCPA9s
	y5pZa4GOAF7fSM2zreYHJ7pxWa3O86fKX1QNukRCevjR5BZaDJDbsu0CA4kmPmv13Nk/n1aAZVf8h
	vNttSiHQXkPYo2b3WpPjWYK1sEpsclzhoj6NZ/cLWjvLNQHawps+U3FrR9SezVE+YdbqfGWZuLHa6
	9VX45N4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzSR-00000008I9U-1PWt;
	Thu, 04 Sep 2025 02:12:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyEG-000000081eK-1haq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AE776023D;
	Thu,  4 Sep 2025 00:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CDAC4CEE7;
	Thu,  4 Sep 2025 00:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756947211;
	bh=PRZRjRSX2JA9lvFNL/WZkeCUWyYQfQ1+r6Jp/WjO5pw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NgdwO+8wAFHW6LdO/eVyFoEDcchaE2YqsA5D3ztR5fafA1jCL3Sm2HpA+DttiBmGc
	 /ClJ8qp+GmwYYnTJU8T9YOjXhS90FeHJPWLUrw8FyTxBolt4XzJGSy8nL8t0W2PzgV
	 UcbGAKWYK2FD5eO7qPzQESFhUvGz/BcbTfUAHxbHjGOJZ7rhFG/TCfFiZtQemB8Qxc
	 WcZGqDmvoyw8Z0D3YBkpBRmlPmPZO4j/So44m5f9fmvANi4hxPhdvrXUGOY7PDZKlw
	 ImnIcmjuDEbWXJJgYaxxcGoPzh0qRUHNnMIRolv4044ETy6YaRJap3cAH9+do8qtX7
	 Nz0JutItWH87A==
Date: Wed, 3 Sep 2025 17:53:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/11] net: stmmac: mdio: provide address
 register formatter
Message-ID: <20250903175330.6937a8a5@kernel.org>
In-Reply-To: <E1utmli-00000001s00-49Uk@rmk-PC.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
	<E1utmli-00000001s00-49Uk@rmk-PC.armlinux.org.uk>
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

On Wed, 03 Sep 2025 13:39:18 +0100 Russell King (Oracle) wrote:
> +/**
> + * stmmac_mdio_format_addr() - format the address register
> + * @priv: struct stmmac_priv pointer
> + * @pa: 5-bit MDIO package address
> + * @gr: 5-bit MDIO register address (C22) or MDIO device address (C45)

If you're willing to oblige kdoc it wants Return: to be documented.
Similar comment on patch 9 where stmmac_clk_csr_set() gains a return
value.

