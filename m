Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98030C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fnjPwpP6kWSlMo7NwAEaygkBxreQSv5XarBD0mvajs=; b=zUrwrSlzbzwtkUnNQheqRrSPCo
	UjLjzJwyqoGyEEPXUXCqaUFESoxe9p/Anh4mVXbWfoXahDdOjmejRPePot0btQpAyaMvXH4UP0PcB
	w3x1eIpaYA0H05k5EUzlsCFNAcFY0BIisoJTUk7/+sIIagNHn+hX0QajTq2K3rcGsP52DN3/ucSTs
	FBOrrNEPD6A6qI1v9gm6QMfV7aS8Fm4pzyarbU3WbXfT0/F3hk6KolXRXjAU9LYG3JAtRHkVSeeKn
	M9iug0wDeCdYOGfWWCRuZq1KhKGxnikOCfKTn2YWvqgrFZ6ys2Pkx9Cj+19N/EeSv50u5VJ25uuXD
	lmQVQTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS1f-0000000F8lT-2O6B;
	Mon, 28 Jul 2025 17:52:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRGh-0000000F3n3-2MLi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5fnjPwpP6kWSlMo7NwAEaygkBxreQSv5XarBD0mvajs=; b=jm8HPHHs05soq3opiy7Na5xLSK
	URaPKGcQxhFuYCeiWUNf1AZgjvvx1dAxUP1nj4gBaefx8OigLSkaLMll6rhQ8ONS+njivvVUj6qoD
	wUTqIHXl8xF7xrzzLMtog9xsuJo3MciYC3aH7a7BrS4zWro++zZainsm5ZI7qbzF/K5I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugRGX-0037F5-Al; Mon, 28 Jul 2025 19:03:57 +0200
Date: Mon, 28 Jul 2025 19:03:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 1/7] net: stmmac: remove unnecessary checks
 in ethtool eee ops
Message-ID: <6582840d-af8f-4fdf-a866-4997f252a412@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ2e-006KCw-7V@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ugQ2e-006KCw-7V@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_100407_599893_5FFED6D1 
X-CRM114-Status: UNSURE (   8.55  )
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

On Mon, Jul 28, 2025 at 04:45:32PM +0100, Russell King (Oracle) wrote:
> Phylink will check whether the MAC supports the LPI methods in
> struct phylink_mac_ops, and return -EOPNOTSUPP if the LPI capabilities
> are not provided. stmmac doesn't provide LPI capabilities if
> priv->dma_cap.eee is not set.
> 
> Therefore, checking the state of priv->dma_cap.eee in the ethtool ops
> and returning -EOPNOTSUPP is redundant - let phylink handle this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

