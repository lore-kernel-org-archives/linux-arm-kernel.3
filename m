Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCC6C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prLTqXdtwS6Vp+/x1a38rz7nfNGj+D9MXfvAyt2XwH4=; b=apGPn88QXismRubXXNULlANhBV
	HJGh/lVumR/oWEkR9tni5+MgDJPdltu6RE+e6a8tphcHYU0dBBxwy5lT+CrI1DzzI9FgdKbwiIXuO
	HpmqKFqGv6iXhcGdN6r5JufYG4ADexhHUXKUHka1oe0dNK4KWC4zNngcKfowx1IjWKrPJMRTdIyx3
	7Sh+ByEm/3FwPoWXiIXlRjpXGo+vANWJLjh9zlTYmR4JH9rIqxSb99B2MBYuzu2T5Y4RsbzhmCcaD
	S3xw4PczRno9dvu2kJ11QDu4d7Bxhg8NbAL4EZ+IWLaQAjOyvi7dRIdXLx8X+LNrlAd4BMJcbJxji
	Le+ZXQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRHV-00000003mG4-1UKc;
	Mon, 27 Jul 2026 19:46:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRHT-00000003mEJ-07XB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=prLTqXdtwS6Vp+/x1a38rz7nfNGj+D9MXfvAyt2XwH4=; b=p6rVgD+cxm/uWiP2AhveEPbU0O
	LisE0LjlqzHs1PR1RPT52p+Gxdkwk54Xr/cNJSNZ0c2S1BQBLKTh+sjl2m28k6cai8Qbz/QmIQZgS
	bLxzzVaBrpnMHNx/HtSdWMRu/nIomBQ2V8P7QiA+yT9BThxBK/McsjBbwfoZmLEzKMck=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1woRHE-00EUk5-7n; Mon, 27 Jul 2026 21:46:16 +0200
Date: Mon, 27 Jul 2026 21:46:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux@armlinux.org.uk,
	hkallweit1@gmail.com, rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bjorn@kernel.org
Subject: Re: [PATCH net-next v2] net: phylink: add phylink_pcs_loopback()
 method for PCS loopback support
Message-ID: <73726b44-42d8-4539-b910-eeeb1650f180@lunn.ch>
References: <20260724085224.3321663-1-zxyan0222@gmail.com>
 <20260727093835.1708262-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727093835.1708262-1-zxyan0222@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_124631_072960_D64317F9 
X-CRM114-Status: GOOD (  11.15  )
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

>  static int stmmac_test_phy_loopback(struct stmmac_priv *priv)
>  {
>  	struct stmmac_packet_attrs attr = { };
> +	struct phylink_pcs *pcs;
>  	int ret;
>  
> -	if (!priv->dev->phydev)
> -		return -EOPNOTSUPP;
> +	if (priv->dev->phydev) {
> +		ret = phy_loopback(priv->dev->phydev, true, 0);
> +		if (ret)
> +			return ret;
>  
> -	ret = phy_loopback(priv->dev->phydev, true, 0);
> -	if (ret)
> +		attr.dst = priv->dev->dev_addr;
> +		ret = __stmmac_test_loopback(priv, &attr);
> +
> +		phy_loopback(priv->dev->phydev, false, 0);
>  		return ret;
> +	}
>  
> -	attr.dst = priv->dev->dev_addr;
> -	ret = __stmmac_test_loopback(priv, &attr);
> +	/* Use PCS loopback for interfaces without an external PHY. */

It should not be an either/or. You can have a PCS and an external PHY.
You might actually want to test both.

So i think you want stmmac_test_phy_loopback() and
stmmac_test_pcs_loopback() with the shared code in a helper.

    Andrew

---
pw-bot: cr

