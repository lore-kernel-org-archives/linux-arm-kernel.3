Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E57CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1O/aO97nPYYdbzk164KnQEpaZP73kNMXnyNRWyK5vM=; b=b7dzc8f+o6RZSHvaI+bXmHa+6s
	uR4OeT4DklWB+DLxXmlG7on+GqTMIG0fp2wHYF8SA16sTZ1xmzRmApBsacW9MrY0yHgrVmezwYobK
	DioGrqN9xGtIg83QGQfpGonaAWqWS+tarR+aPLw8qRTjp/1H/G+hfbHn8OGff6shkXPZQP8kAeNRA
	HU55YBbK9r5lA5VkDqVu7g+kPGjKFi+fdQoh4M32oZJU37rDSJhAiiN7hTtwlQqcTtqn1uvySPaeJ
	xxFJ5Y6OF65GWIyim2UhoFoVgFu+6Nxr2zDWKVdyQtcp2L5ZeqMIOyrTos72lncoFbkMBAap7lHzr
	aOIXb8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UPD-00000005sHi-1Eg5;
	Thu, 16 Oct 2025 20:16:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UPB-00000005sHJ-0zqt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 20:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w1O/aO97nPYYdbzk164KnQEpaZP73kNMXnyNRWyK5vM=; b=aCkbIvx1D3uGBHmHUciIMOW93P
	JUA/W6ZNCEA/ilmN9PCmPvysq7MJfPOXBSFTl4O2OD1O423w51jbgicHC/cBrpdQPyzkOvsQVfKbR
	pduN1sNyBMmt0rMZd8r+WcNCPGCLzHAq/dkiq1tF1JCXnSS01ufI4/yo5edJxrxUm0vI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9UP5-00BCgD-Fi; Thu, 16 Oct 2025 22:16:51 +0200
Date: Thu, 16 Oct 2025 22:16:51 +0200
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
Subject: Re: [PATCH net-next 3/5] net: stmmac: avoid PHY speed change when
 configuring MTU
Message-ID: <1e231ecd-a4eb-4596-82a2-8c7448287d50@lunn.ch>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_131657_336104_DCE9070F 
X-CRM114-Status: UNSURE (   9.96  )
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

On Wed, Oct 15, 2025 at 05:10:51PM +0100, Russell King (Oracle) wrote:
> There is no need to do the speed-down, speed-up dance when changing
> the MTU as there is little power saving that can be gained from such
> a brief interval between these, and the autonegotiation they cause
> takes much longer.
> 
> Move the calls to phylink_speed_up() and phylink_speed_down() into
> stmmac_open() and stmmac_release() respectively, reducing the work
> done in the __-variants of these functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

