Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C152C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 22:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWwwVGDxAmSnWGT7Y/VwH9u2cUsOseNdk7xoWs36I54=; b=zIbC7Ywq38flc++nF/fT0pLqaU
	Oi2sQy/MtUTwfCBpQYYMFW/4Ku9G2ybxHGJ2rnMP9iMOR/c501qmKhAEXWnkAuFo4+tEUXL0rszL3
	IAzSkg4qdVZ85wEviqmlLDE5unqPZq/H2ynU+Oj0I9QKA02aaf/UrfFCLl7W85/0ftkyVe+dlMDO/
	9C8Xb7SJuyh16pGeevxOkv5ExBgVIiUyHBdi3kVhSClSdPruiE17KX+nrBxdEp69GfLvEhGKoP6xU
	sryAbelYS7zarDlfTSW1L0DlzP7Mp+Z2ZwBnN4pz4jP5YHNpvzMqPuUiRRWyeUxY8oGF88GP9Lvfx
	vt1Jz4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQn5-0000000Amba-11Tw;
	Fri, 25 Jul 2025 22:21:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQkK-0000000AmOi-3H9X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 22:18:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74BF15C6AF5;
	Fri, 25 Jul 2025 22:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE6DC4CEE7;
	Fri, 25 Jul 2025 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753481911;
	bh=CGiveRG0F4ZRe38E+iuFBLXGZzwDIfze3JyfGxabL28=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WOLR8Ymm6P4gOv/050K6B7gAqqQ522Hc4yVFoRh0Txi/+d6pnHEvinr6VyqQaqiEA
	 bxQnFJuEEnj7oYMsnEMoEErRuOv/lEKf4G8F8o4I8JgGJJe7tQJ7TPu30EPv5TtPmB
	 TgFF13w2d8O/ZVN2wSV1XMPdxfekwZwndLuw7WOmF8YUgK8WGy8nS8+2MoQ3miW9D5
	 h/j0GodhjKDmBrmN9c4cHX3EL7TIzRTUnEBkaEgjEbwvM9pyADb2unstM7FKhhIKCt
	 zPXGo3Ns7XsRtMSkFLuV5KImnLI+gKqqIo0FE0sRPdPOzyoddQDDDdZbcBO92/XWBj
	 9siEB3HNpDhtw==
Date: Fri, 25 Jul 2025 15:18:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v16 04/12] net: mtip: The L2 switch driver for imx287
Message-ID: <20250725151829.40bd5f4e@kernel.org>
In-Reply-To: <20250724223318.3068984-5-lukma@denx.de>
References: <20250724223318.3068984-1-lukma@denx.de>
	<20250724223318.3068984-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_151832_862195_81E3B06A 
X-CRM114-Status: UNSURE (   9.79  )
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

On Fri, 25 Jul 2025 00:33:10 +0200 Lukasz Majewski wrote:
> +	for (i = 0; i < SWITCH_EPORT_NUMBER; i++) {
> +		fep->ndev[i] = alloc_netdev(sizeof(struct mtip_ndev_priv),
> +					    fep->ndev_name[i], NET_NAME_USER,
> +					    ether_setup);
> +		if (!fep->ndev[i]) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +
> +		fep->ndev[i]->ethtool_ops = &mtip_ethtool_ops;
> +		fep->ndev[i]->netdev_ops = &mtip_netdev_ops;
> +		SET_NETDEV_DEV(fep->ndev[i], &pdev->dev);
> +
> +		priv = netdev_priv(fep->ndev[i]);
> +		priv->dev = fep->ndev[i];
> +		priv->fep = fep;
> +		priv->portnum = i + 1;
> +		fep->ndev[i]->irq = fep->irq;
> +
> +		mtip_setup_mac(fep->ndev[i]);
> +
> +		ret = register_netdev(fep->ndev[i]);
> +		if (ret) {
> +			dev_err(&fep->ndev[i]->dev,
> +				"%s: ndev %s register err: %d\n", __func__,
> +				fep->ndev[i]->name, ret);
> +			break;
> +		}

Error handling in case of register_netdev() still buggy, AFAICT.
-- 
pw-bot: cr

