Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6430CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+45S5njtmiXLeT8cAYJUv1WcvQO6rLaUo0tJbyOMrc=; b=actNRsOulJ0yzj88ABiT1vNrU9
	DXaZRB4ke4EaxAvEc+0ULFKRrwJtyuKZilCL31T0/qQHevXJ1MhhhlT91UPsy4cq0KZk/cHhNeabg
	iBgrXabGzkPvoEuLUvVFbzihRonaXOyqA46uRpEdHbRAtIL2DQd5w58nTkwcFh2w1Xkm1p5mvyg19
	ocsJ7fq4S8ds7criZEYK2UcxAKzanK6mcIeGuQSaeCtL70ipO2BnqkLi9Hit0l03TwON4n8M6dlbQ
	Kvp7p4T7fHtNjulR08I4VAXWeWGkMeDe8jv64F5D48cUeTuseeXIeYZ4JVw/mAmMHrhffG79GJGyh
	hN4wyq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1c-0000000FzOs-3ntK;
	Fri, 05 Sep 2025 02:18:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFGr-0000000DoSw-1WnW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=s+45S5njtmiXLeT8cAYJUv1WcvQO6rLaUo0tJbyOMrc=; b=rETx9uoc5v1A00+e07ah69FdsR
	jsmYcx5P+FjJaBCrki6/o3W+2gcr8SaSzBz4yUkfFlcMhWc8/qqzYqXiyqud3jNmaVilqzE/t7RXL
	VrotVi7plxZnVpsBeZjFSVwjqhe6mOe02UIIdP023fI0J7PXmum6zyMaKfWj+Zjxi7DQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuFGm-007GAd-Aj; Thu, 04 Sep 2025 21:05:16 +0200
Date: Thu, 4 Sep 2025 21:05:16 +0200
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
Subject: Re: [PATCH net-next v2 09/11] net: stmmac: mdio: return clk_csr
 value from stmmac_clk_csr_set()
Message-ID: <27b0579c-ecb3-4deb-9687-ae3237e6111e@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8oW-00000001vpH-46zf@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8oW-00000001vpH-46zf@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_120521_403747_F433A0B7 
X-CRM114-Status: UNSURE (   7.47  )
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

On Thu, Sep 04, 2025 at 01:11:40PM +0100, Russell King (Oracle) wrote:
> Return the clk_csr value from stmmac_clk_csr_set() rather than
> using priv->clk_csr, as this struct member now serves very little
> purpose. This allows us to remove priv->clk_csr.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

