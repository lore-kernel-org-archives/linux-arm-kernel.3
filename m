Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E45BCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0HwF+I+9MzgxOKEBJJMAzBdaphUxSHlTIL2N3hKKZU=; b=PVGl/bgb/zl/XOop1coTG00NUM
	5OCkYoIVHpp/IpDTmKDNKFD39f4LnySGB9DWOVIXN/AgbDAMSfRqP3910DBBpwdvj4+n5PT9UppMh
	t9feySFelYMYMNTn/KgGB+p3f1p2CE8gaZIKt5dG34FKl27FlEDwfYUlrKJHBe13w45/NjfVtdIgF
	adUeEAoPOJwqmsdVm/aO2PlCYlO7utuiw/wmQjaJIxOCGuXSDKVgTs692M18KyHAhQPbKsVRCYRrR
	85vl1YH+Kup240XMsePUcmzM/igZcA/JN8G1DlXWK2JM0niNu++xFX7UAXXVY7tT2rKTaj0PCtXcp
	+onGj4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urM5n-0000000Geut-2pPc;
	Wed, 27 Aug 2025 19:45:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urI1X-0000000Fv1w-3lNR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:25:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 101F9446A3;
	Wed, 27 Aug 2025 15:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE64C4CEF6;
	Wed, 27 Aug 2025 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756308318;
	bh=14L8M25SaW2aPUTqSHRR4gzXBnSAFwq0n1Xg8omLQ0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FJD9ReNmvkx/PjHuiCSIMgnDPw7AGDLXsNC+aNtZfFJOsJNOUGGLs3s+DHjWewFjn
	 MMVjmTgtzZNNIJZ3EOnprAq2nm6161YzsevTliap9sts5eCoUFn7fQdDBtOA+Sz2XT
	 kGBhfYVl7bXOD9jSttCOfNeBOLHe4mktsKiqfQ/onHaiL2owSYFSEhPlAUegNnmrfO
	 /4nJFIwZO9RaLHtz/wkZu6jP8D+0vaDyMWVtzGZ/Vk5JacR6jFaOzay9/MA1Lyfr49
	 YoAIzMVUTjj6eEv+e5bAMvgDa1Dsx+TH2nl0RuhMZI0Qi+7a4qurZSM4ja04MzW8MB
	 OY9ZhtdAjXS9w==
Date: Wed, 27 Aug 2025 08:25:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukasz.majewski@mailbox.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v19 5/7] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
Message-ID: <20250827082517.01a3bdfa@kernel.org>
In-Reply-To: <20250824220736.1760482-6-lukasz.majewski@mailbox.org>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-6-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_082519_964373_7B4824EA 
X-CRM114-Status: GOOD (  10.89  )
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

On Mon, 25 Aug 2025 00:07:34 +0200 Lukasz Majewski wrote:
>  static void mtip_switch_tx(struct net_device *dev)
>  {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;

> +		} else {
> +			dev->stats.tx_packets++;
> +		}
> +
> +		if (status & BD_ENET_TX_READY)
> +			dev_err(&fep->pdev->dev,
> +				"Enet xmit interrupt and TX_READY.\n");

per-pkt print, needs rl

> +		/* Free the sk buffer associated with this last transmit */
> +		dev_consume_skb_irq(skb);

why _irq()? this now runs from NAPI, so it's in BH. Just stick 
to dev_comsume_skb_any(), it's the safest choice..

