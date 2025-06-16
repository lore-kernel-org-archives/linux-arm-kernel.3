Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16705C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 23:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BePOfiT7npLQIY5e20eiRynStUObeSDrh0xh71pFI4w=; b=JJMJLWrqBL/R99jRSGqETkxfQS
	ZyCeZuZFB0lNx5was8c0ov2Rlq7MZVGGC/yzS7WD/Kt0H+0TQMpkIKsIWONouGfZ7LMrgiIRXCKQv
	RyUPghecrFOq6/+4037XF8cyQyF27tVxsRzKX5/HkKj6scoK+uxQEIeTv9ae+0QfU9PMGhyPbVxT6
	2OHkJ4mYGEURJJfT/2TDhpywomEDbMbP4MK6zqaWX+ENPo/FLzaZrmoxHgLXHddPMgDAiGYQPAN9Q
	aR4QVIvrB7xnFjIUiVokpGSQB983hfNjA2ut74A+tvsdLlPzVzzMU/B5t5Sd57I4pu5EoLVbid2mO
	D2D2JrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJNR-00000005pgp-0Uwh;
	Mon, 16 Jun 2025 23:36:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJLC-00000005pKr-0oKM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 23:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BePOfiT7npLQIY5e20eiRynStUObeSDrh0xh71pFI4w=; b=4K/Qv6b1b3GEbTeV2sQRtrnU2V
	eEsya342v4+qD6FVDHNiwm0z4u8w3j8k5VDSO4wK4gTr7WJDqas1z9HDgeeM21RJS3BrKJTbs9xzw
	CZevoSDzGj6ja+r01OJXsEu3vU82AI+5/2sZZQLnMfQfzyB2rxS18K+hqnGrRsyT0IeY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRJL6-00G6SN-VL; Tue, 17 Jun 2025 01:34:08 +0200
Date: Tue, 17 Jun 2025 01:34:08 +0200
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
Subject: Re: [PATCH net-next 2/4] net: stmmac: visconti: reorganise
 visconti_eth_set_clk_tx_rate()
Message-ID: <48941356-d75a-4fca-88c9-c5925d79a993@lunn.ch>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
 <E1uRH26-004UyM-9G@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRH26-004UyM-9G@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_163414_237272_DD8E1BAA 
X-CRM114-Status: UNSURE (   8.66  )
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

On Mon, Jun 16, 2025 at 10:06:22PM +0100, Russell King (Oracle) wrote:
> Rather than testing dwmac->phy_intf_sel several times for the same
> values in this function, group the code together. The only part
> which was common was stopping the internal clock before programming
> the clock setting.
> 
> This further improves the readability of this function.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

