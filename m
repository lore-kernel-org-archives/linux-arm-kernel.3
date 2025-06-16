Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A8CC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 23:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVcbYWYXxlHhyK0doa6PNKnr9E0V20/rYQFMEivhkRc=; b=fC/AhvVk5yHsgeas9I1WIYxogK
	YyTRouO8qdCW3pihVvrM5IoCr3VDexASVC40umEJ3NJx9CWkMJTNPG0QPuTrbgGyTo03dmREdehGF
	1r7ay4SOJNSv0qSvcZcdXUDZMYylN1SwtIgtz5jBOG4t/0LL9yUl00N+fLYwE9vOkLjSPcpJucZ/8
	TsUO6h1agWaE83erCiOq+SpUt8ZSYYhmrQnI1gsl2mvfL4aKHcheG4gTFJp2RYUTnl1Osp9uiXkM8
	L2wis10RWWP2Nt3SqlG8+Nw7PeEtIIYM8Rrvonjt9F1ecZjHO87rBjKTqzatprkgcjoKB1WNbihDh
	9B/hyZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJJ7-00000005pDM-17qM;
	Mon, 16 Jun 2025 23:32:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJGu-00000005p8G-0cFF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 23:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FVcbYWYXxlHhyK0doa6PNKnr9E0V20/rYQFMEivhkRc=; b=HkhcwlJ2fE8wFtSTewIMv8l+sT
	JrYCdX4nE3BcpgLXAWZH7wvFic9KEPF+jcyr5Kk8huRJphEoqoctTHEMMeREoYFrA6R1FjdQISldY
	hy4MMkgHX2eOJEzHVPoMkZCTrkURHHAueSF3R/NtPcfNsQiKc8bzM+OYUbuLuLBzTMdc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRJGb-00G6QV-Jt; Tue, 17 Jun 2025 01:29:29 +0200
Date: Tue, 17 Jun 2025 01:29:29 +0200
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
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/4] net: stmmac: visconti: re-arrange speed
 decode
Message-ID: <75bde139-9232-4fd2-9d64-92f8d65f5f1d@lunn.ch>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
 <E1uRH21-004UyG-50@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRH21-004UyG-50@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_162948_184676_4B4DCFCC 
X-CRM114-Status: UNSURE (   7.59  )
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

On Mon, Jun 16, 2025 at 10:06:17PM +0100, Russell King (Oracle) wrote:
> Re-arrange the speed decode in visconti_eth_set_clk_tx_rate() to be
> more readable by first checking to see if we're using RGMII or RMII
> and then decoding the speed, rather than decoding the speed and then
> testing the interface mode.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

