Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A243C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJZNDnvZYJl/v6wAtqRZA40hAuj1eQcDN3vqs62UpXc=; b=vFMVBCB5B7ZSKhvahH6Xn2YBQp
	gmEwMj5QGsRH6fFyx+Rc0FHnPivb6Vu9Ge/r4hsX1/RxgDS5A0ufw3T1OUXcmXhY0l99DnvTojppo
	qYQZWsisy50ziBWWd5QliJS2VzWUqnW2WjNpVBx2JSQUo7TnjE+xOr3wC5Rnk16n47FyZAXRPkp+t
	aZfBfk617kz2mW8nVPkUP7I8MH/PsCYvmmGJiZqi0QcVLRSe57UAqPUsrT9EKPnHsbfcifKRng6Ch
	Zaw0d3z+SmOoEYpl7SkqN40ItU7jRUO5kG/h0iakS7wohZGvmad/pZg51zreY2Pbnea4Bx8j5UEjg
	fdsrHFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01a6-00000006iKU-1UtZ;
	Wed, 02 Apr 2025 17:08:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01YK-00000006i4a-0oFk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 17:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eJZNDnvZYJl/v6wAtqRZA40hAuj1eQcDN3vqs62UpXc=; b=2IkIe0/xrkxwiAKy4t0LpTq6k5
	/rCRyLMMFZZDCwhjeoqr+d+2FBTLgaAXztM7V6t4daPdS3TQHKSxpth3gVcFOELJBkTcTSwwWQmTW
	T04yRrj1rJRB0Tc+AmMqPSfCtTzbbeYq6UXHNYnBaAq/EijIRKJZvG0sJ7nRsNJGU9cs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u01Xx-007pEN-4K; Wed, 02 Apr 2025 19:06:37 +0200
Date: Wed, 2 Apr 2025 19:06:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] net: mtip: The L2 switch driver for imx287
Message-ID: <d48796b3-636b-46d4-8e3b-74913d4f77ab@lunn.ch>
References: <20250331103116.2223899-1-lukma@denx.de>
 <20250331103116.2223899-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331103116.2223899-5-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_100700_229744_7478FEE0 
X-CRM114-Status: GOOD (  10.01  )
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

> +struct switch_enet_private *mtip_netdev_get_priv(const struct net_device *ndev)
> +{
> +	if (ndev->netdev_ops == &mtip_netdev_ops)
> +		return netdev_priv(ndev);
> +
> +	return NULL;
> +}

> +static bool mtip_port_dev_check(const struct net_device *ndev)
> +{
> +	if (!mtip_netdev_get_priv(ndev))
> +		return false;
> +
> +	return true;
> +}

This appears to be the only use of mtip_netdev_get_priv(). It does not
care what priv actually is. In my previous review i said i think you
can simply this. I still think that is true.

    Andrew

