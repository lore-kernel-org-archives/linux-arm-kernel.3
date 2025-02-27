Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187ACC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdBL2ustKED09k8F64jH3NHmgRRmM2pU9xBW2XfZOhI=; b=wba1I4WDXTUSjVEMGIXFoYOeXq
	STkFcAZ/3IRA7XqCZ+V1kCtrp9W8EWqFYyKfP3DtVgJoeMOsecBWb7cJb+6pLUbw4SDb+L307AOPP
	FzHdHSqUNoERVl81dGgBm8s/USHivjuI0zBs1l0abR7VIW3zZ39VkFG7T/ek9SXMwxLXmncUB3AbG
	4OtapEGUjwswzudpmGzdJ0rnA3w+3Gxbqy/m5G2SvSYQLx/P2G5VXTeivaRGsV6Ra99Zgw0O0d00L
	SLMFYhvWTvAoygM0+rVa3+MYb6i0pb3om+r4AGGwR3y9e43fBCogkokYT3kixqRR11+CW0G4WuvNg
	9Je60ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneam-00000007fLi-3Cx1;
	Thu, 27 Feb 2025 14:10:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneRj-00000007dLZ-04HI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zdBL2ustKED09k8F64jH3NHmgRRmM2pU9xBW2XfZOhI=; b=LwaQ2qNBaxRa3eXI35Ka3vVouC
	uUALaAOEVFLmZcRI7O88XOseZElmcbbiQMfs+2TZ3/oVzqgv2Ue5ir00BSqHYC+6c99tPb/6ytVfC
	X+9f+FYYuFmEBlyYzcU80/qGNQy7Qmh//DmvXCmDbzizzWAaH74A6RFKevbxcsYa8VWA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tneRd-000bv7-Kr; Thu, 27 Feb 2025 15:00:57 +0100
Date: Thu, 27 Feb 2025 15:00:57 +0100
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
Subject: Re: [PATCH net-next 06/11] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <fb394b41-f632-43a9-afc0-077fe1a7d9ac@lunn.ch>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0f-0052sw-8r@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tna0f-0052sw-8r@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_060103_057471_4AF9ADA0 
X-CRM114-Status: UNSURE (   9.39  )
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

On Thu, Feb 27, 2025 at 09:16:49AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
> 
> Note that given the current unpatched driver structure,
> plat_dat->fix_mac_speed will always be populated with
> kmb_eth_fix_mac_speed(), even when no clock is present. We preserve
> this behaviour in this patch by always initialising plat_dat->clk_tx_i
> and plat_dat->set_clk_tx_rate.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

