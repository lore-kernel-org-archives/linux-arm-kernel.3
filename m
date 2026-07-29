Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179EBC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRgRyy4I/iGOdIRbZQjz7pAYVoSvVDRHQXiU6P9/HMs=; b=jxW6CIM6r7MMVg3aFnT+s6EgJo
	scKUfjKlt4txqvNZNEVd6LNsT4i4TqH/lDaOPkNLmxSB28de3xjfGAHcd4AlcutIKyjtx+TwoCNgs
	kdcjiCkve29l4DeURJ0zO0vJr+53csJxxR+MJ+V1Z/DwwetOAPXIPX0Egoohj/w75zITldwBBLA2l
	r9TVBlNOXwJbkI/cZe9Dep9yNadyWR7txlLj+Mfq2lCtmh02UWhbI/+EGV2xqJlcW8vAil1Q57sYB
	seSsolzplBui+DsNkUPw3YCRc5mpZayplhghlQ56NvybwMKiVoZJh+eR7N08yXQQ6B9G8X51vIHDU
	XegcoHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxgU-000000070q6-2jbp;
	Wed, 29 Jul 2026 06:22:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxgP-000000070pW-3hHi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:22:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2C01C1A12EA;
	Wed, 29 Jul 2026 06:22:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D1A6039A;
	Wed, 29 Jul 2026 06:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB9C111C14983;
	Wed, 29 Jul 2026 08:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785306137; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IRgRyy4I/iGOdIRbZQjz7pAYVoSvVDRHQXiU6P9/HMs=;
	b=aSQ8in+9EDU9HVfsYSYQC1fmPobZUJb6cqpsiKBZ8E/wdwbnywx+joCjZiPsoPr7lCgNfM
	lydLiKClnNB4459mda2XWXFrHvy8DXx+xon3sqXNHErGU+M5aMzKmZwSGygvblieneZXkN
	URrtHq6wbuDEBj6g7e9ujbNshdnkqRrNfDOrFWurHXncsqnYT+/SBQFTxZbqmtPNJ2whe0
	WnOp63er7p7aJgQxw774qppUjZgxmlSFL1Z+ZNvjOL2xFvrOLyrHbqYqvJkJ9uWJqOgS0A
	8AWRe5rFmJ6muG0A0uZjk3SMRYvg9XzO/lp4GhZco6Q7e9LtxVnBXT19M8Gybw==
Message-ID: <fb9a8280-4166-43ed-a9e5-b54d7079b222@bootlin.com>
Date: Wed, 29 Jul 2026 08:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Skip PHY attach if custom
 PCS is in use
To: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726132618.3580612-1-zxyan0222@gmail.com>
 <20260726132618.3580612-3-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260726132618.3580612-3-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_232226_561596_4182E647 
X-CRM114-Status: GOOD (  20.46  )
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

Hi,

I think sashiko's are correct that we can err on the safe side and move
the check inside the "if (addr < 0)" check (even though I don't think we
have platforms with a PCS but no fwnode-described PHYs, but just to be
safe).

Also, sashiko reports an issue on patch 1 that this exact patch is solving, so
you may want to re-send but with patches in the reverse order.

Maxime

On 7/26/26 15:26, Zxyan Zhu wrote:
> When a platform provides a custom PCS via the pcs_init callback,
> the MAC's phylink_pcs is already configured. In this case, phylink
> validates against the PCS's supported interfaces and manages link
> state through the PCS, so no traditional PHY device is needed.
> 
> Without this, stmmac_init_phy() falls through to the no-phy-node
> path and errors out with "no phy found" when the DT has no
> phy-handle for such interfaces.
> 
> Skip the PHY attach when priv->hw->phylink_pcs is already set and no
> phy-handle is specified in the device tree.
> 
> Fixes: f0ef433fc264 ("net: stmmac: introduce pcs_init/pcs_exit stmmac operations")
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 562d20830b94..044ed3b89247 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1346,6 +1346,10 @@ static int stmmac_init_phy(struct net_device *dev)
>  		int addr = priv->plat->phy_addr;
>  		struct phy_device *phydev;
>  
> +		/* If a custom PCS is in use, no PHY is needed */
> +		if (priv->hw->phylink_pcs)
> +			return 0;
> +
>  		if (addr < 0) {
>  			netdev_err(priv->dev, "no phy found\n");
>  			return -ENODEV;


