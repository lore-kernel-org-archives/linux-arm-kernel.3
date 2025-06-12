Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CD7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+P+sojjLRcmgnA9DaQn0t78DpFrljTsKd9E6p6Gpww=; b=ginIZ9ppZl6E6sM65SR4KMOKmQ
	DcWAPhG4lZsZ3kZokOmpextZS5BIy9K7msj0HW6E6AfinQXIQ3JnxF5my7R8WJi/f/NF743s/yJ2v
	n8kHKCQp3xjIo2wCjBrDV4KCrcI7D6hHvNzK+tmZE7g7e/TpCF1zJnZwDFyXDWqUZfUA/iBNhwzdx
	1R/90qAA0sv8QJtFaapvI0GcVRUKHYTWle1psZtS0GHESX0ktJS2uPj6JjZy2Ppb8tcTQ79NJ0QBd
	Ae5qUC8bGU5UwcK2n2p8OInmGyFKZ2OPWsfAaJtG66rynErd0YhsDQkeY2Z5GI1TOZqeiXRSSDavv
	9iYwZIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnre-0000000EKhY-42rY;
	Thu, 12 Jun 2025 19:45:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk8x-0000000DquM-3Vzi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1+P+sojjLRcmgnA9DaQn0t78DpFrljTsKd9E6p6Gpww=; b=TIMPOeB3bSk5ZvSSmbNkej2lM+
	KzhtwYWgY9H0BOuBUYHfO1zutgGWdyBG5u2W26lEu+FavEFZpeBnnYJLn5+YVMWk/AkOxX5QQuME3
	hUAANh859OHjPPPSADGxoVNwaldlJaWjptlyFuNsDAQofkIT2y21xXvmA8QqR0JVqez4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPk8s-00FZ6s-DV; Thu, 12 Jun 2025 17:47:02 +0200
Date: Thu, 12 Jun 2025 17:47:02 +0200
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
Subject: Re: [PATCH net-next 2/9] net: stmmac: rk: simplify set_*_speed()
Message-ID: <52f1a387-9161-437f-a5b3-95c9308846bb@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk2o-004CFH-Q4@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk2o-004CFH-Q4@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084707_879000_BB900A54 
X-CRM114-Status: UNSURE (   9.85  )
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

On Thu, Jun 12, 2025 at 04:40:46PM +0100, Russell King (Oracle) wrote:
> Rather than having lots of regmap_write()s to the same register but
> with different values depending on the speed, reorganise the
> functions to use a local variable for the value, and then have one
> regmap_write() call to write it to the register. This reduces the
> amount of code and is a step towards further reducing the code size.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

