Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B88E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW1kqG7AA7VKuaZuIchhnJLzAYeE13kvfdYICGMAvpA=; b=iOFh5t+1aYhbsJzrp2yVfIEXXl
	KtIsXKTm7CAJaUVyCOI439IUaciTSgaHgksRLIpic0WDAg2/UN1woBOaHHRCbOIq5uk/1UMb74cSH
	CVRQh9iosvQeHjlezPb9u9wDlWn2XrkQfU5OEGBA/klp6WTaeLJ2YXUzG0Z+Rjjv8spZsp7x6wdpa
	I+Z71iIPKxIUmbxOHI4PDT/XB3Rq1CIQwi2Cl7Iq1Z+z+WMancMyTs8c3Eh15qdZX7KFhW6frm0Oh
	Gkosn5w6fhldF09Rr5+V2R2X18ymHsLdISIq7o+5EAtpoTsE7FlXCjMapZPaXIqMoi5A9GhMc1Q7w
	9+UeZs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3Q1-00000003Uvk-21mN;
	Fri, 13 Dec 2024 11:01:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3Ov-00000003UkO-223G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tW1kqG7AA7VKuaZuIchhnJLzAYeE13kvfdYICGMAvpA=; b=BAynvb7wzY0Qw60t6wnpt78/qq
	vFB1MVGBVwIRglh/GEFtMTFb03eloxHgljpyzzDUs2omP3GUblZGcLOIc9evLq0qrEPJfPUQuJgOn
	xDolDmF8a0Ag+MXGKmMfJEkKjpYABzH/x581Dt1BabS44Sbofprj51HoI5P5a622ScSqBlCT1O6yg
	MGUhQmh8uBOBzQbcKrjCJbz9aL22I/+UpbWSzVQ/3GKAjjijlwErDxyH2XgnqjPmz5V0kWQ1Tp/wO
	DpmJnZpgleUDOqghGcZs3+mDQeWuxuzTDS+83fti+X9buWRsGee9bvqHZL5FN3bQGLhto+z1CoCBv
	Kt9Qx8PQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48066)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tM3On-0006ar-0n;
	Fri, 13 Dec 2024 10:59:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tM3Ok-0006Fr-0f;
	Fri, 13 Dec 2024 10:59:54 +0000
Date: Fri, 13 Dec 2024 10:59:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/7] net: stmmac: move tx_lpi_timer tracking to
 phylib
Message-ID: <Z1wTqh-BnvPYLqU8@shell.armlinux.org.uk>
References: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
 <E1tLkSX-006qfS-Rx@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tLkSX-006qfS-Rx@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_030005_522680_81839B20 
X-CRM114-Status: UNSURE (   8.50  )
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

On Thu, Dec 12, 2024 at 02:46:33PM +0000, Russell King (Oracle) wrote:
> @@ -1092,6 +1092,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  			phy_init_eee(phy, !(priv->plat->flags &
>  				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
>  		priv->eee_enabled = stmmac_eee_init(priv);
> +		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
>  		priv->tx_lpi_enabled = priv->eee_enabled;
>  		stmmac_set_eee_pls(priv, priv->hw, true);
>  	}

While looking deeper at stmmac, there's a bug in the above hunk -
stmmac_eee_init() makes use of priv->tx_lpi_timer, so this member
needs to be set before calling this function. I'll post a v2 shortly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

