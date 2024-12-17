Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6184E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bj+ACVgblctd82Lp3dspwycdphb6HP2RNNRGhMPntpQ=; b=w/Oc1LipXIAeNlcJ58+xFSOl4C
	FBY6Nz5oKeud1OkTVUpTwXDc6RrRdi3V1PKkvb3w1JfTShYV3HVGVbbck7Pngj8qjimrok6TcqjG8
	L41AF6VWbfHedDP1wFxr9eibBTHzQ5Yh6yEbCAxmrbB2Vvik8NwHfyiCP6tzjLlfAJReA8B/Gn/gV
	RgqNTDsUr4UAeSP+ssHFszDR54ELGqZp7WtmGkglUN42eeXNe1wifB0wIN0dinaU/MjBZFPeBN8FL
	FrLTdBC+Z6Jyk6oiKMmZJLlkQ82iQHmseMUIe0+BN6brggEmYiCE1axB0vUY52LXW7juCjwYpV5u/
	ySGF2xTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXRc-0000000DXOD-3u74;
	Tue, 17 Dec 2024 13:17:00 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXQX-0000000DXFD-1MZi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:15:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 416AE240004;
	Tue, 17 Dec 2024 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734441350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bj+ACVgblctd82Lp3dspwycdphb6HP2RNNRGhMPntpQ=;
	b=idBqgFdV0mScu6bL3/tWYXiGeBR7mWbY3IzrqYH/Fc+6vloVBOEIQO6g6CIJKoNV8hnM/q
	SJkhzwivV3nXMDSugkw9gWMTzzbNSsrWyEwZB+cVUhK3Lfa45fzMMwlQyuln346jNXaclw
	jqG5gDuFw8QJyBb/p5rovRr2UxN7ytfSpyeN37O3Q0SHW/W2coj8kHg7Cmpiy5sFn0S3NB
	St+50ISmlf8N2fr/xzRIqjxyrRezlo87QQwC5ZgrymkEdK8y3sZrlFwi1mZOdv6+JqoKzo
	asgs9IoEIedxxYscVI/i4OaSEZgeJWLXLB4DhMiolyLWDBKHCyv6EpVN7Em4XA==
Date: Tue, 17 Dec 2024 14:15:47 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/5] net: pcs: mtk-lynxi: fill in PCS
 supported_interfaces
Message-ID: <20241217141547.7748b3d3@fedora.home>
In-Reply-To: <E1tMBRF-006vae-WC@rmk-PC.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<E1tMBRF-006vae-WC@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_051553_500570_4C631397 
X-CRM114-Status: GOOD (  13.62  )
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

Hi Russell,

On Fri, 13 Dec 2024 19:35:01 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Fill in the new PCS supported_interfaces member with the interfaces
> that the Mediatek LynxI supports.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/pcs/pcs-mtk-lynxi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> index 7de804535229..1377fb78eaa1 100644
> --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> @@ -306,6 +306,11 @@ struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
>  	mpcs->pcs.poll = true;
>  	mpcs->interface = PHY_INTERFACE_MODE_NA;
>  
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_QSGMII, mpcs->pcs.supported_interfaces);

I'm sorry if I missed something, but I don't find where the QSGMII
support comes from based on the current codebase :/

I didn't spot that in the inband_caps commit, sorry :(

> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs.supported_interfaces);

Thanks,

Maxime


