Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0FAC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC1+C2NdYFgBLdpMekNLt5gvPrAXo0lWj4NjN0Vtv8g=; b=yiEAd+XCEx99B2wDhiGuK8T3BV
	93ieTOLn+hPCMYG8BGmtJ2stFzAvC4NoJC6C8yO8hQBJ8Amwf3Xtsi7YXYi6lUThtYn1TBe4VFz7b
	c8aykkyN7tS860biuh0adu6DOeXgyOJTaMrWfvNa5W2LY2lYeRR7CQwCTh6rxtcZz4k3MSTfUlJPA
	/ifwhakUUyQ/MzGDCvn0EmhZhNTtdZ7DfYWI4y3sXtxHiXxr8ropXQTHYevxJfAS/yq3PmYV7ZzAq
	Uil14M8oO0muOCZFaVIFTcdmrrmX/aUly9yZtWeo6KNoskf5MgywAMYmrVAZaIRIFEA9uqyUKeBa0
	GHzyiNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATCl-0000000FiJH-2ZIS;
	Thu, 01 May 2025 12:39:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASpd-0000000FVCd-2LZS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tC1+C2NdYFgBLdpMekNLt5gvPrAXo0lWj4NjN0Vtv8g=; b=PdK4Okro3ouZq6qHChLkwhG/KS
	s3a1eK03Siw86LUKTs6TWWmvZ3b5HcvHtawM5kkPppeBbEPua9D2DdpCL2Pd64KppOo08nPizRwha
	5qBqz+NWR3UEY2jpbyFA62MFNNs6eMXZ+ibBkxEZdB3Q3naImFH618Ju2RB+pLzhUwlk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uASpZ-00BJKc-7v; Thu, 01 May 2025 14:15:57 +0200
Date: Thu, 1 May 2025 14:15:57 +0200
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
Subject: Re: [PATCH net-next 4/6] net: stmmac: intel: move phy_interface init
 to tgl_common_data()
Message-ID: <f9bd9712-60ab-412e-aebe-7d8c1196e3d0@lunn.ch>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
 <E1uASLs-0021Qk-Qt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uASLs-0021Qk-Qt@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_051601_596172_8865FC00 
X-CRM114-Status: UNSURE (   7.67  )
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

On Thu, May 01, 2025 at 12:45:16PM +0100, Russell King (Oracle) wrote:
> Move the initialisation of plat->phy_interface to tgl_common_data()
> as all callers set this same interface mode. This moves it to a
> single location to make the change to get_interfaces() more obvious.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

