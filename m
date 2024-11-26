Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A637D65525
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 21:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lx8vdZBD2Yjtb5JOApwawLh1tjrZFtP7efpYFVXksk8=; b=uokJKmM0ovw3N0DLBhWvyqQjoq
	UUTdOQt/JckUd+Mw8/rKY77bAeetNuRmoJMGIV4q94M9rhm5CF37jzI9pCr6i215cpiFpB37VH396
	1TTTBA75i8WU+XAnaxT3kMIa1MnOHjoHFggCjLj1AOL6vhyYqS/V/NK79+SNaAJ04LfQX2PkFLV/5
	fhWXl6v7sbwfX1ZL7W18Sogo5yA49yD+nNikrB/3tO7MaJP8V+4X9UH/U6fkRVq5Iyds8rpkB9COH
	t/jglT3AMEZZMgjuXu0kVgKLNdTEvwMtX4cnBFiWxca6pp/3JY4cB8J0nSHRwmidLbZb9kHXj0rxV
	pX5NlgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2fB-0000000Bhm2-1WDx;
	Tue, 26 Nov 2024 21:00:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2dl-0000000BhUs-3o7R;
	Tue, 26 Nov 2024 20:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lx8vdZBD2Yjtb5JOApwawLh1tjrZFtP7efpYFVXksk8=; b=b5oJKaKV0cPBizpR8xJdfk1BWX
	rEHb7aFvMmaS99O6B4/bDuHwYkCDjuqnbG/htG0lyAvqQ7Y64rqQc3jyUPddzHyPNldFaUkPoDXn+
	nU472aESQQRV/m6yUruoCzzkLAdp08IyrX4zOcTQIH7fdn61OaslppWw3cxZahHb9rv0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG2da-00EZ7D-6k; Tue, 26 Nov 2024 21:58:22 +0100
Date: Tue, 26 Nov 2024 21:58:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 06/16] net: phy: marvell: implement
 phy_inband_caps() method
Message-ID: <1c4c1d14-88cc-46cd-870c-eb7a987c0495@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFroM-005xQ8-6e@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFroM-005xQ8-6e@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_125833_944541_D9B75158 
X-CRM114-Status: UNSURE (   7.34  )
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

On Tue, Nov 26, 2024 at 09:24:46AM +0000, Russell King (Oracle) wrote:
> Provide an implementation for phy_inband_caps() for Marvell PHYs used
> on SFP modules, so that phylink knows the PHYs capabilities.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

