Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABC7C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yii92iQAEmxCOP2QDsW+vzITDTXCaT6QnQ8yK7d0FrI=; b=XQJXDFyXzTCR4sMnJBUfXX8kMK
	8EsNCO/9tuxw06OQEfcgwUs2gEzZ5QFcrQpiHRvkJpb4iyAcNl+njLpRgCnrWAmAeTRPNtebTF4m+
	TOOwKThA6vPuk8SZx8wLntL2BU7D/MF6/4UejE2/PvL0QC91ZmM2RvT63Mbb+IkF2C1uQ5XmEApCL
	TRP6S366Kf0LNyeGYtvKwv9rWMZwiN9qISPFBkhN954Gqns/hSJo8d4mOF+ZgvHELsSyAhZW0q+l8
	icB+n8Iu1/HyzzjXtf2y12mWAkTi00fwMJzlQIRjZ7O2rd425BOgAd8hbRX7fMrERlyCtUyyvyj51
	/4LfZYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjX-00000008YOp-0SbB;
	Thu, 27 Feb 2025 19:39:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnh2X-000000087Sm-437t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Yii92iQAEmxCOP2QDsW+vzITDTXCaT6QnQ8yK7d0FrI=; b=ua+UrFDJfdRtQF05ycPAm1iveg
	9inZXR1uacy2V0yfnuGkr5A96MMUNwHsq9QBhDni36Dz3ofDVe+eSUeYHRy/ZHiBxemcH0gI2wk2y
	Pq+v+JyfhQgMQVAqagztNDsrTwm1iscDZj7RlDTrhs71kh2B1o6644S71Jhvqm6jxdL0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnh2T-000eog-0Q; Thu, 27 Feb 2025 17:47:09 +0100
Date: Thu, 27 Feb 2025 17:47:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 5/5] net: stmmac: fix resume when media is
 in low-power mode
Message-ID: <4a1ecc2e-1feb-4d93-9204-218942e20ee1@lunn.ch>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1c-0056LO-DN@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tnf1c-0056LO-DN@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_084713_999632_C7E3D173 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, Feb 27, 2025 at 02:38:08PM +0000, Russell King (Oracle) wrote:
> The Synopsys Designwavre GMAC core databook requires all clocks to be
> active in order to complete software reset.
> 
> This means if the PHY receive clock has been stopped due to the media
> being in EEE low-power state, and the PHY being permitted to stop its
> clock, then software reset will not complete.
> 
> Phylink now provides a way to work around this by calling
> phylink_prepare_resume() before attempting to issue a reset. This will
> prepare any attached PHY by disabling its permission to stop the clock.
> phylink_resume() will restore the receive clock stop setting according
> to the configuration passed from the netdev driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

