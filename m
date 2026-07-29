Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACECC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUu5NqumLRBBsM8cmbA2FL/BiDOsZawATxjJH9KLPTM=; b=HC0BYBysWF2PA8RP3W+C7swo8d
	rZTKFueVKDPiBxhnLeQUo5xrZ9tFnSosSGRz/wW1bSphPdlb/K+St5U/ZjDA9/tMyzhdsPeUlBKEz
	9UUUYBcg3bfOo0paGasDp5PTyeMGX5UZVcsh+V0YvVsQMkkivUSw2FpqQ0VpdEJrog/zHzOYIw0AD
	pZ7o2xrLzujeWHNl2I/5HIFPtiUxx16Gcqzn11IOu6iu6i+EhTcUDatOSVVw/6swPpOyZImJwVtCn
	BN+Dj30IERhLRhpZS0RLEbOF+xPjEM9JkaaOXTqASGHcOwSm4Kef3ov4FTXxqAmDwh7Jz39IRaBfE
	nRujp2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozoK-00000007Flh-3LK5;
	Wed, 29 Jul 2026 08:38:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozoC-00000007Fj6-3F0D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:38:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7DE8D4E40FD9;
	Wed, 29 Jul 2026 08:38:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FC6C6039A;
	Wed, 29 Jul 2026 08:38:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09F0711C11F0C;
	Wed, 29 Jul 2026 10:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785314309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FUu5NqumLRBBsM8cmbA2FL/BiDOsZawATxjJH9KLPTM=;
	b=ORRcB0QWP8F2KSLRl08Cg7G1WcZtx27DTab3iQJvjXstMfo80lsvlXU/f+2gDug23Tru0b
	v8sgzw+eu1SQCHyv8MWMvGJYN4XRDBuHQ8czgk6eIYUg3Ck1OmjhJH/JoDGoqU9Gay9n/S
	EcC//06r/PE3zw3sDYRHGXK/2KLO94ISekCx0v7/Et4/l3E2oQtF7YZp6fC/BCXM8MPjMd
	ChgtQoSpiCcxADq3sqs2ikNpAZWWQZ9Dr1wHLU+nphsnxeE3hFIEat/sDXcgM+3AgeSraw
	/VrUr6fnkGxtVopcH5nZ+P1MXyrEwa9x0kRJ5AsmYiORwM991E/lhvyQT/WdhA==
Message-ID: <ef8823cb-29e4-4892-a9c1-854541312e00@bootlin.com>
Date: Wed, 29 Jul 2026 10:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/2] net: stmmac: Skip PHY attach if custom
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
References: <20260729074237.2624940-1-zxyan0222@gmail.com>
 <20260729074237.2624940-2-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260729074237.2624940-2-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_013836_963310_755CB4D2 
X-CRM114-Status: GOOD (  15.53  )
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

Hi

On 7/29/26 09:42, Zxyan Zhu wrote:
> When a platform provides a custom PCS via the pcs_init callback,
> the MAC's phylink_pcs is already configured. In this case, no
> traditional PHY device is needed.
> 
> Without this, stmmac_init_phy() falls through to the no-phy-node
> path and errors out with "no phy found" when the DT has no
> phy-handle for such interfaces.
> 
> Skip the PHY attach when priv->hw->phylink_pcs is set and
> phy_addr is invalid.
> 
> Fixes: f0ef433fc264 ("net: stmmac: introduce pcs_init/pcs_exit stmmac operations")
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 562d20830b94..575132b9cdbf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1347,6 +1347,10 @@ static int stmmac_init_phy(struct net_device *dev)
>  		struct phy_device *phydev;
>  
>  		if (addr < 0) {
> +			/* If a custom PCS is in use, no PHY is needed */
> +			if (priv->hw->phylink_pcs)
> +				return 0;
> +
>  			netdev_err(priv->dev, "no phy found\n");
>  			return -ENODEV;
>  		}


