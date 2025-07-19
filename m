Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968F4C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 01:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJhrYSDglKeDCIphYF+jaa+LpG74hw/ximw+yc4mJDQ=; b=uqJ+rM3ehKimrrCDYmxtBi50me
	VyP0QO0LpxfRb0273X+KJuLoR6ONgdKVYWWR7xrHhqRCbAd35sTChTwL70X1OtZdiQh9Ycx7+hBaf
	nqSEsg7e3nveAIp3zz+mP83GijG/qvaeG5w/FPtNU3yiFqhQcdQlrAiTi/4QpygwKPkYUwjsZmoZW
	V1tXdwN4Tb0il6zVj27Hl7G4B6dQ4ikNEuOVTBA7SAnE4AfQCjbTH8luH65ggOK2XN1bCzUvb5RbR
	LCN5fZsIwbPz/zMVofPo9HbNvyJ+oFrOecQjBmOkwbLiQX3vt8PlSc/ZnJflZ1ag7LHrYlLGrucxb
	T4vInlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucwA1-0000000Dgty-11vR;
	Sat, 19 Jul 2025 01:14:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucw5v-0000000Dgdd-08OC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 01:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 379045C655E;
	Sat, 19 Jul 2025 01:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BD6C4CEEB;
	Sat, 19 Jul 2025 01:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752887429;
	bh=YgyJXRQCWe/ppuZUdi3oQsWjYtd7cJWOV5GRrEP4tkg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eHkrsRYmWJgNnpXYK7n+ARDjeG5/Oj3FXrAhg2YDW/cArhshfmCNBm5T5r1IQYFyI
	 iPwXwaBObc7NTS10OOhd9c2hU8+G4ZNcaylejIHyD747TrCEyXXCK9RQR8tK402OUV
	 TYtEPK/ATn96lvDKTQtRVP1Ano8u08sHx3ykE3uniBh4tpcWDLFJ4r2CN8k4OFmgZ8
	 7RYXEGHp7PAojyPGXWjZEf4NdHBAHsQUCHeKTE+u7EsMISs3NxTyqQfujYlE7NyDJL
	 ADQ5uqMIwjCjNHLE2tYw5czj82xsF6jaRGFuAW5PnGaU3t73ZFVx5VfegVnu6mPYPy
	 PmDIJTUdImfAA==
Date: Fri, 18 Jul 2025 18:10:28 -0700
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
Subject: Re: [net-next v15 04/12] net: mtip: The L2 switch driver for imx287
Message-ID: <20250718181028.00cda754@kernel.org>
In-Reply-To: <20250716214731.3384273-5-lukma@denx.de>
References: <20250716214731.3384273-1-lukma@denx.de>
	<20250716214731.3384273-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_181031_162939_8F26B864 
X-CRM114-Status: GOOD (  18.83  )
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

On Wed, 16 Jul 2025 23:47:23 +0200 Lukasz Majewski wrote:
> +static void mtip_ndev_cleanup(struct switch_enet_private *fep)
> +{
> +	struct mtip_ndev_priv *priv;
> +	int i;
> +
> +	for (i = 0; i < SWITCH_EPORT_NUMBER; i++) {
> +		if (fep->ndev[i]) {

this just checks if netdev is NULL

> +			priv = netdev_priv(fep->ndev[i]);
> +			cancel_work_sync(&priv->tx_timeout_work);
> +
> +			unregister_netdev(fep->ndev[i]);

and if not unregisters

> +			free_netdev(fep->ndev[i]);
> +		}
> +	}
> +}
> +
> +static int mtip_ndev_init(struct switch_enet_private *fep,
> +			  struct platform_device *pdev)
> +{
> +	struct mtip_ndev_priv *priv;
> +	int i, ret = 0;
> +
> +	for (i = 0; i < SWITCH_EPORT_NUMBER; i++) {
> +		fep->ndev[i] = alloc_netdev(sizeof(struct mtip_ndev_priv),

but we assign the pointer immediatelly

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

and don't clear it when register fails

> +		if (ret) {
> +			dev_err(&fep->ndev[i]->dev,
> +				"%s: ndev %s register err: %d\n", __func__,
> +				fep->ndev[i]->name, ret);
> +			break;
> +		}
> +
> +		dev_dbg(&fep->ndev[i]->dev, "%s: MTIP eth L2 switch %pM\n",
> +			fep->ndev[i]->name, fep->ndev[i]->dev_addr);
> +	}
> +
> +	if (ret)
> +		mtip_ndev_cleanup(fep);

You're probably better off handling the unwind on error separately from
the full cleanup function, but I guess that's subjective.

> +	return ret;
> +}

> +static int mtip_sw_probe(struct platform_device *pdev)
> +{

> +	ret = mtip_ndev_init(fep, pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: Failed to create virtual ndev (%d)\n",
> +			__func__, ret);
> +		goto ndev_init_err;
> +	}
> +
> +	ret = mtip_switch_dma_init(fep);

> +	ret = mtip_mii_init(fep, pdev);

Seems like we're registering the netdevs before fully initializing 
the HW? Is it safe if user (or worse, some other kernel subsystem) 
tries to open the netdevs before the driver finished the init?
 

> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: Cannot init phy bus (%d)!\n", __func__,
> +			ret);
> +		goto mii_init_err;
> +	}
> +	/* setup timer for learning aging function */
> +	timer_setup(&fep->timer_mgnt, mtip_mgnt_timer, 0);
> +	mod_timer(&fep->timer_mgnt,
> +		  jiffies + msecs_to_jiffies(LEARNING_AGING_INTERVAL));
> +
> +	return 0;
> +
> + mii_init_err:
> + dma_init_err:
> +	mtip_ndev_cleanup(fep);

Please name the labels after the action they jump to, not the location
where they jump from.

> + ndev_init_err:
> +
> +	return ret;
-- 
pw-bot: cr

