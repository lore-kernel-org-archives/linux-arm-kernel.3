Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E486DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyxR7Bm/Ol+TxP5+zw7WuA3v6FPnTthLLIDlKJiwW3k=; b=IfSOjpVQs9uRuZ/J4TS0ncGxiU
	epF5SVvgORSQ4gJy9sfLY5wrnhEF9GBlas1Z0xNbG4AlF/f0W8gI95J0TD0k8cy/w7VnBuUsT/nq9
	+dc8L7t3m0xvcKJXGXZalyNmWowY98CFV3/bWcvEyxrYzbtS69op4X+MhIdtb0BFphUh3L364lkLj
	r3P30y9FIUz30mNgwFgJ97cBDsSEYmmerNgWEX2KQUl+Agg0XvOEasLwWMUCaAVWm/cFUimqCwchh
	3LxNILuzl31WhKd9VHib38NeQ6OyNU/S2sTxNV0BTHm+vcQtWXcaQyTp80gNVWQq8KqY51ycN5LRf
	r78ul1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS46-0000000F9Gg-2HeG;
	Mon, 28 Jul 2025 17:55:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRe0-0000000F6h7-0yfM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 17:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wyxR7Bm/Ol+TxP5+zw7WuA3v6FPnTthLLIDlKJiwW3k=; b=RnFxB+LwCUculJMLH3xeoOUeSl
	tM9kiv+hTfwz0EqgpMgFdT3WEC3QmX9gRdUlUak1aNHx7BKS8EERTR07EnKj9IDEfL2U+ihFzi0Ie
	jo3VOECQhgEPQqg/2KVWbjU+6il5yRFrd6hWcvCooMNcU4yfzvfWIhE2L5pMfyurQI7xivaqZvPzJ
	3AFYzq3/gaCJ11UXM8KQOGIMC205MdglHeWDBxxvyBMjNKbZOlVpGkJXVjjvg/4oavPSpNkVmeHhu
	21xBxcrOGNE5zzV6kaExRRBscFwdpRR56YAPfRG9tQhm/utTpt7nQUs92aF1FJqUCYRwnKa2FA414
	hPKhfuSg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRdx-0000000CVk7-11TC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wyxR7Bm/Ol+TxP5+zw7WuA3v6FPnTthLLIDlKJiwW3k=; b=1FsNGckeU+WK5cG+tmTzYMRJaQ
	b85pYQyyffBg/suM8jGSCmz/xJG3vVRTHC5qtqyJ3vcJuHsZANzL+2G2xep2cvsSveqrXobVkygWt
	3Bdfcds26/26kypiDfb4fyyoIV1JrZ9hHeX+Zd3cHT/PU0N4weO0L62xVGaXcIiMz1Ak=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugRdp-0037R9-Dh; Mon, 28 Jul 2025 19:28:01 +0200
Date: Mon, 28 Jul 2025 19:28:01 +0200
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
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: add helpers to indicate
 WoL enable status
Message-ID: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_182809_509597_5226A26F 
X-CRM114-Status: GOOD (  11.12  )
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

> +static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
> +{
> +	return priv->plat->pmt && device_may_wakeup(priv->device);
> +}
> +
> +static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
> +{
> +	return !priv->plat->pmt && device_may_wakeup(priv->device);
> +}

I agree this is a direct translation into a helper.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

I'm guessing at some point you want to change these two
helpers. e.g. at some point, you want to try getting the PHY to do the
WoL, independent of !priv->plat->pmt? 

> -	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> +	if (stmmac_wol_enabled_phy(priv))
>  		phylink_speed_down(priv->phylink, false);

This might be related to the next patch. But why only do speed down
when PHY is doing WoL? If the MAC is doing WoL, you could also do a
speed_down.

	Andrew

