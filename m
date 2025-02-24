Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8256FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3T0QWPecLBFnadrKf6BCnAp07nURn0bZOEsXJOfVBWw=; b=ilEIuQ2Ui4d0eO0tTSQ9muSJSx
	PvVsCGMfvbaKzRttBiihx+peNDLsJdaNTk14pTwzH01LC8Fc8J5ZRwwHdO37CCWIZ/sepqrApGN/O
	JT4mE4Zkayo8WYW9FPCr79hBvnV8cXUftU6sqvHmuhhFy9MCyxG5Yf8uG+vaOCO2cqhB6a7FPplnU
	fg7WB1CowJBrNyTR/xdMikJZP2zoWGVm7ieLwSH6dvPjmyjHaTdLjMi2WbQSVibL6GHXKabpANGxw
	a7BuSb/r8RxzOCbTa7QGajWDaZTKCqoOYxy4VXlTdNByohgE63M3ZDdw/XtWIn79/qOM5wCr64ZF7
	veWowjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmenP-0000000F3Fv-3cto;
	Mon, 24 Feb 2025 20:11:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmej1-0000000F2Rv-2zsj;
	Mon, 24 Feb 2025 20:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3T0QWPecLBFnadrKf6BCnAp07nURn0bZOEsXJOfVBWw=; b=v29w+S9ch4+ninnLpX1RhMEKjs
	xLgTRZ6xmzNttYmKiCwJhalnT6ZJpAeN2B2z6HP3JchZ8WbxbjQJaEFZF8OYfW+LWvzAyvpfFs4Ho
	rHQUTiBgU7GJVOclEWEGMFFIJBNxgo1o+aWn81bbPPJsgwyFO3O579WdX28cFdDnxmRw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tmeiw-00HHO7-NE; Mon, 24 Feb 2025 21:06:42 +0100
Date: Mon, 24 Feb 2025 21:06:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>, Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: thead: ensure divisor gives
 proper rate
Message-ID: <57036dad-d9b8-4f06-8083-af7ed8c42035@lunn.ch>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
 <E1tlToD-004W3g-HB@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tlToD-004W3g-HB@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_120647_748652_6C5E91CD 
X-CRM114-Status: UNSURE (   7.40  )
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

On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> thead was checking that the stmmac_clk rate was a multiple of the
> RGMII rates for 1G and 100M, but didn't check for 10M. Rather than
> use this with hard-coded speeds, check that the calculated divisor
> gives the required rate by multplying the transmit clock rate back
> up to the stmmac clock rate and checking that it agrees.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

