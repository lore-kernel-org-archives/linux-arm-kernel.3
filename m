Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28354C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8scTYSNjvNwWNGDv8cFaYLgRcjxLemT0t7RinzRoLjg=; b=ep3RVj6/QztLuHNQPJ7tae+TjK
	BW4LQyKVkS5222mygEWwHr57gi4O/qUbjup82ODftxal/E6OqjUVYPjVvWdy0qJMxaaBpZEVSZDPe
	yDxIXGwYamemEdCJFESFByfsmUe2UFUdx6cc+StMvk77L4o0Z7AwR3FiZazHL6DIbarPWy9Ef1nQY
	Cl5lihOqtxsYmufZrtky17bdmRRfgOatlsqvWLgIDv1OOVi6oaC14xAF7MEasGrpdDvCyAUxh7D8w
	1cmax9dSJQNksA7fBJuev8FUVFQnnCNhJ0NtUS9n4ZnL4D8pjs0pAP+2yb79fdfpLs5pAF5UgHP4s
	IbEUiWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjW-00000008YMs-0R80;
	Thu, 27 Feb 2025 19:39:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnh1n-000000087Lp-028Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8scTYSNjvNwWNGDv8cFaYLgRcjxLemT0t7RinzRoLjg=; b=Hlh6+D5qwKdQFbqPkctTmcIoKK
	9J7/3/cYULfpfk2xhqpaPfIv+JwBmEJvrx4HfZBLwcKxPsSFxiYK2t/cb+Uc0CWHBdeE94qVCG0Aj
	op2r5bn9/engzVOhCUovdOgS0kAdC4Y78NeAOioRdGjbv3gCaCrKb2XA59ymUXlnmSD8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnh1i-000enI-BX; Thu, 27 Feb 2025 17:46:22 +0100
Date: Thu, 27 Feb 2025 17:46:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 4/5] net: stmmac: move phylink_resume()
 after resume setup is complete
Message-ID: <cd931fc7-07ee-4687-948a-173d0aedf15e@lunn.ch>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1X-0056LI-9i@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tnf1X-0056LI-9i@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_084627_042746_39906083 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Feb 27, 2025 at 02:38:03PM +0000, Russell King (Oracle) wrote:
> Move phylink_resume() to be after the setup in stmmac_resume() has
> completed, as phylink_resume() may result in an immediate call to the
> .mac_link_up method, which will enable the transmitter and receiver,
> and enable the transmit queues.
> 
> This behaviour has been witnessed by Jon Hunter on the Jetson TX2
> platform (Tegra 186).
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

