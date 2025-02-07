Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500F7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmmypO5lGpZElJBOwBx5Lqq47jvwTZgB8nZohxAsWnU=; b=XiAqReX8UcTTH/THUlWAQTKr+j
	jr3TiuzBOExV8d0l5kQrMF3GJNfUq0I5iU3aWQEgMj+uO4cHm+LJobV5PyTs0FYrYMOcPLWbm4IqR
	oFgXnH3Oe+4X5ApwQwrTjZQcJlTfNevjT2+UyLNECLnKbbvwsQfSiSM8lfAgCNQ/dUAcqFUpjQHbY
	yZ/Whfjz/UJrxgeVnpTR+XDl80KDthD/xaYWoXoVpvx++50jqtPjNkxWlXs4//m0vcIwNgJpcbzBR
	FanG2YdhtzBa8yWq1C03OLDlYOteCPCdJ+tor6ZXAaBeBGss3/W4TNmQoDHdlqdoR91NjkZI+U37T
	XdAc7UKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSSy-0000000AYce-2WYj;
	Fri, 07 Feb 2025 17:48:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSKi-0000000AWmz-3LG9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Feb 2025 17:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dmmypO5lGpZElJBOwBx5Lqq47jvwTZgB8nZohxAsWnU=; b=bLXvcFuEJtkK89LhnVDOAdBP8w
	52du0Y3ZETeOxWCMqeyx5esiZ8bPVK3+rQQDKCYDw61hhlr/0MeORk9pyphKgZ59by968POlXlUel
	a8WajRHQ3ltWqrjEipn8eUgL+5J8mNPsUtwyH2IBW7D+89Hc99vJhhkUOBTW9gGzUnL9XTmxC46is
	T4bqNP6+EJXCvyrkzl1HSapAbeG0L3Rq51Yp0vnvbYnJpl4CYSKSahGtw4g7O+gKAdHilw4jhoWKu
	mLsSHW6qNF4XcScZn9BpQjt3HxU3zo7U7UV5fxNKW9iMDFim/zWulVNFhpHFEXSHwal0G4am9r64E
	UuPpWfQA==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSKf-0000000HGuD-1uNc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:40:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21f0444b478so35964005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 09:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738949998; x=1739554798; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dmmypO5lGpZElJBOwBx5Lqq47jvwTZgB8nZohxAsWnU=;
        b=zxiKQQJI2HwcV0LajnP+hkt93LLStoEN9h9z8svEMyG/NL3rXxDfuxAb3M0//mvrmM
         1ODp+UM6qfCi8H/1VZX9KjMB+XGaKKJ0S8bEOPKQ7DRwbadGbVL66AMVLekcORnAwJEM
         ixftjxLiSDh+V6QoVKPe8vKH21qTiXMmBWXTzvo6LJmxqCBah2PUYGRCTGO32TvcoizR
         DoRTbPOO9Y+U5QQHZkGkHCjlqM2XDMylaBsISn60XoMVkKkPWD2Mgsrl/Qd5lshpEVeQ
         dvpqxFHWFUTJLXQO7RbUzfv8ce7ymE1hOX2yo3qCGH3FmUFklX/yJJdDrV59LFAdF22y
         98hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949998; x=1739554798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmmypO5lGpZElJBOwBx5Lqq47jvwTZgB8nZohxAsWnU=;
        b=ZZN+sleAmrdOpD6w8E9if3hjs22XVYqnV2mubuV8QoHFMQCVl+dtfWnmbuhemwD9+V
         1yLWAZPauVD7gmctbTYTXrLV0MmRPvnYJB+FFHwluRIzTY5zQSzCY4qLhLJx6N9Yj+B6
         5hWzvbjHpzdaDGy1/rcfno2EdXS7/Zhad1rfsh9I7Mx5FHpjC6MCukhzhyL5ODHwTAdA
         /WU4FrkQ4GmiCixcCmLwmDCibZwaKnPilE63n/Ckm2gwLWUysPXWo2FhuowuhSsR1mh6
         KuMSiufdyjqrhCAW5PXCxmOTTZ/0yTg+96udSdHbjHqbj29slP1JnAUxd0IBk7fZUc/F
         aPzw==
X-Forwarded-Encrypted: i=1; AJvYcCV799afwRxdEuW7I0nqp8jnWFGuwK+qeT+WV3JXGZ2usdeYwoEifdKdR52XJAkqH4gzZ38N9VmxpqTBZhXyWRzV@lists.infradead.org
X-Gm-Message-State: AOJu0YzHV66Pu2wAcclIuFd10THWjJ0yMLQlZnwTdyjpQDeDiEl6vKjH
	tNXxYhlh9Wdon/jP9A/wyicc+5H5Q2enBe2SMBRZWA6WCHGCAOqcexKxx4cbhgwhRlNGFo0zN/Y
	=
X-Gm-Gg: ASbGncvqwOTxJBU4mPJqLbpb4KlRSw8PytZ4IxoNoIkYe7Ar6V4KG+iC5+YCU+e5Aaw
	LhFRAOQqmxlIDSaHNTC64D+i/vGQ/mBiYmIpS2W38CSX+2vs0H0kcrNg4hinNrVGbmMu7momkY+
	34lAgYPu76hRhVZayKpjQUqly+C9d4OJ47IvR71RJZt4OrqNE8K26nKLjH+hG/HSMvD/npvA/Of
	4lX54CiUG+1qDCQ8eAjVROUX4ut7FdUFxaEBLdSVVP1dPmbpGTcYeQWT2IdsO35DA19n0Dw4zCB
	ebuq2fQf5hOIp0v+QI5Pd5iELA==
X-Google-Smtp-Source: AGHT+IEHqbioMS1WS0fxuFiPxBnBQRht7nJ0wdLWWq8J6BK7IgFAuo6kNnHsIYM7adDcTJZyHqhf+w==
X-Received: by 2002:a05:6a21:99a6:b0:1ed:a4cd:acfc with SMTP id adf61e73a8af0-1ee03a3cf11mr6657350637.10.1738949998229;
        Fri, 07 Feb 2025 09:39:58 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e20b2esm3324297b3a.179.2025.02.07.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:39:57 -0800 (PST)
Date: Fri, 7 Feb 2025 23:09:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] net: ethernet: actions: Use
 of_get_available_child_by_name()
Message-ID: <20250207173952.lpeazjyxnhfuhwb3@thinkpad>
References: <20250201171530.54612-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201171530.54612-1-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_174001_693413_821DFB9B 
X-CRM114-Status: GOOD (  19.56  )
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

On Sat, Feb 01, 2025 at 05:15:18PM +0000, Biju Das wrote:
> Use the helper of_get_available_child_by_name() to simplify
> owl_emac_mdio_init().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> This patch is only compile tested and depend upon[1]
> [1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/net/ethernet/actions/owl-emac.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
> index 115f48b3342c..3457ce041335 100644
> --- a/drivers/net/ethernet/actions/owl-emac.c
> +++ b/drivers/net/ethernet/actions/owl-emac.c
> @@ -1323,22 +1323,15 @@ static int owl_emac_mdio_init(struct net_device *netdev)
>  	struct owl_emac_priv *priv = netdev_priv(netdev);
>  	struct device *dev = owl_emac_get_dev(priv);
>  	struct device_node *mdio_node;
> -	int ret;
> +	struct device_node *mdio_node _free(device_node) =
> +		of_get_available_child_by_name(dev->of_node, "mdio");
>  
> -	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
>  	if (!mdio_node)
>  		return -ENODEV;
>  
> -	if (!of_device_is_available(mdio_node)) {
> -		ret = -ENODEV;
> -		goto err_put_node;
> -	}
> -
>  	priv->mii = devm_mdiobus_alloc(dev);
> -	if (!priv->mii) {
> -		ret = -ENOMEM;
> -		goto err_put_node;
> -	}
> +	if (!priv->mii)
> +		return -ENOMEM;
>  
>  	snprintf(priv->mii->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
>  	priv->mii->name = "owl-emac-mdio";
> @@ -1348,11 +1341,7 @@ static int owl_emac_mdio_init(struct net_device *netdev)
>  	priv->mii->phy_mask = ~0; /* Mask out all PHYs from auto probing. */
>  	priv->mii->priv = priv;
>  
> -	ret = devm_of_mdiobus_register(dev, priv->mii, mdio_node);
> -
> -err_put_node:
> -	of_node_put(mdio_node);
> -	return ret;
> +	return devm_of_mdiobus_register(dev, priv->mii, mdio_node);
>  }
>  
>  static int owl_emac_phy_init(struct net_device *netdev)
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

