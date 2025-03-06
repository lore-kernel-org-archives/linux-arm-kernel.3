Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D840C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRSDAzfZLY2i8MApo1JUO6NM3IHVWAv/taEIFNyzysc=; b=HcJOxjldlPCih+/BvLvik07+oD
	QwAy+qG7TxDQOpYmijniT70/vz48AbMqeBrZ2dSOcpQsZDer1PPTd1qefM5km2IE11cuVrEMBOHLK
	czuhYQqPVgXBi544LMpt2YyPdnPsAAI9UY9nJGXYaSbJuHDKVU5VFWN5Jn+yU+d8SLhympK1uA8vC
	wUAFBOgfz+NJ08zgJw/ujx89+AG7T1h1mz85hy0MSb+TlE4ZX9x3bFcAmLRxTiD+MYMQr3kdaVzVI
	B0F4yzOyKc9vOusNcdbHTi9nz/xZeIALim3RxqopS4TbPpFVTf6g4Vf5BZ7C/cf5ox2PETjcTFFHI
	iE+LsdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJgq-0000000CN9a-3L9b;
	Thu, 06 Mar 2025 22:27:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJeq-0000000CMv3-0OQz;
	Thu, 06 Mar 2025 22:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bRSDAzfZLY2i8MApo1JUO6NM3IHVWAv/taEIFNyzysc=; b=aEbE1vfv1e3AU8SHMntOcjLfhO
	o4jRVQLRSpwkGCUp9Ka9Ne7bx/lv00Lx+rnidJ1w5Twskz7BRBRgip3wtBDguPkSh4Ttw8HPM4it1
	VbDb6vldTX9eINY76jtGbL99YaW2g9QycS+Br/QGig7TFoO/MSJjV019m3VjwxztKinY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqJeV-002w7o-Cf; Thu, 06 Mar 2025 23:25:15 +0100
Date: Thu, 6 Mar 2025 23:25:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wadim Egorov <w.egorov@phytec.de>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for
 RK3328
Message-ID: <d6b15dc2-f6b2-4703-a4da-07618eaed4db@lunn.ch>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306203858.1677595-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_142536_127874_A2904F6D 
X-CRM114-Status: GOOD (  11.04  )
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

On Thu, Mar 06, 2025 at 08:38:52PM +0000, Jonas Karlman wrote:
> Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
> was merged in the same merge window. This resulted in RK3328 not being
> converted to use the new DELAY_ENABLE macro.
> 
> Change to use the DELAY_ENABLE macro to help disable MAC delay when
> RGMII_ID/RXID/TXID is used.
> 
> Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for RGMII_ID/RXID/TXID")

Please add a description of the broken behaviour. How would i know i
need this fix? What would i see?

We also need to be careful with backwards compatibility. Is there the
potential for double bugs cancelling each other out? A board which has
the wrong phy-mode in DT, but because of this bug, the wrong register
is written and it actually works because of reset defaults?

    Andrew

---
pw-bot: cr

