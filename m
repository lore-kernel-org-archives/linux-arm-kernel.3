Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C0BC282C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrBR9b6H7tZXfdjF/q6TjeiUJ561S6ADrqTX1DVsg3w=; b=TMKoxwweOkHQL035Wsh/7Y/wo3
	9ij7lhoeuAsSXWx3cK12JTs3lTD0NcwI3gpLc+EbtH/hITr13J+aTzkpKTwAOC+hBBS54bEJi+Nud
	q1IvSHG9bLfQXJMH0ZH1vttzeYBSP8TN4H0uqVVgc2Ib96n1rgEv2fAvKGBUeC4IjPxo929/a2U5D
	C6HSf/zx9AvwtRXb4WX56I1IGka9UgkcE03Yt2PEZ/GXLL/co+e8BZe+DUOzRu80ZJ41aA3h5KIvz
	L73Qdwjf9ia3PZDww7Qq4fchYNWiicR/59QIcQDva/wr3+W3Aq38i0Bm7xTqYcv3COBgHl8U1KsxP
	VP+ueBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjU-00000008YIm-1OKB;
	Thu, 27 Feb 2025 19:39:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnh14-000000087Fp-1DeE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HrBR9b6H7tZXfdjF/q6TjeiUJ561S6ADrqTX1DVsg3w=; b=2qay3PcgwSNUno19N5QZc2XmvW
	WGLOEDlugD42oZkbLK0PGD+G/lakTcGwmlVVHeWWeHL0xoL+yuKRrSBibh5I4ZZ8KBFo+cI7LweAf
	YGUe+YgLSzaP1vRo+v6td3PYbW8/mEotEyqXHzxQOCV+ZEbfx12XlO6oQhqWK08Iv7bA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnh0x-000elu-F6; Thu, 27 Feb 2025 17:45:35 +0100
Date: Thu, 27 Feb 2025 17:45:35 +0100
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
Subject: Re: [PATCH RFC net-next 3/5] net: stmmac: simplify phylink_suspend()
 and phylink_resume() calls
Message-ID: <16e3f674-0267-47c1-8825-7f15a379332c@lunn.ch>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1S-0056LC-6H@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tnf1S-0056LC-6H@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_084542_336280_2F41E67B 
X-CRM114-Status: UNSURE (   8.27  )
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

> @@ -7927,13 +7925,9 @@ int stmmac_resume(struct device *dev)
>  	}
>  
>  	rtnl_lock();
> -	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> -		phylink_resume(priv->phylink);
> -	} else {
> -		phylink_resume(priv->phylink);
> -		if (device_may_wakeup(priv->device))
> -			phylink_speed_up(priv->phylink);
> -	}
> +	phylink_resume(priv->phylink);
> +	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> +		phylink_speed_up(priv->phylink);
>  	rtnl_unlock();
>  
>  	rtnl_lock();

Unrelated to this patch, but unlock() followed by lock()? Seems like
some more code which could be cleaned up?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

