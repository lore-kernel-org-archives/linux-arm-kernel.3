Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51831C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 22:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/MX9avaogn96WadiZO2Oqso/YPMCh/5um7QBJv0kHw=; b=JI18Ry6BgnLLvST7dSfRXFSNFf
	q0VAp3fjkynIuRI3hiJfzyTKJiDRdxAv1ZYHhViieQQLW2E9j1kUZHB6eMGHH9ymgWMlwCaMQXPrH
	Qgprc8qzrW64SSs8IauqOP1Zxo6VYY4AK2XACqzMlpr4jc4TSrQRG1bS7dGO+1fojfe8k/cmy01iL
	aaD1lryXZnvGgwFed1/ug14m39lz2NpoXRaBFTFvLIDeyGLnKGvlOKlY0D7GfYB5l6xP7ZtIHdwYo
	MUJtcIs0NGfdqmXHc7ZjanKqItAiQ/1wojG5CCY60SzK6L1gezBuZTyu/ZEnmiaxr2axvwCC5WYnX
	DRlVhpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2eMr-00000008j38-0795;
	Wed, 09 Apr 2025 22:58:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cw5-00000008a1q-2wry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 21:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E/MX9avaogn96WadiZO2Oqso/YPMCh/5um7QBJv0kHw=; b=WK7GO7rwpGDxsAOictNGBcT49S
	QMp9vX/ibb/xLjVw8hKqAmC0QTtJRz1I0s9PS0DteFgDvqAT+KUunoRP1mJWNUa+wqyPL7QRVyad1
	YMwdGitlQgnq1kL+JdmSTav2OmngAkPzVPqagj83eIpJJA9OJeCh6NF5CtaGbyNcof+w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2cvw-008b6l-9k; Wed, 09 Apr 2025 23:26:08 +0200
Date: Wed, 9 Apr 2025 23:26:08 +0200
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
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [net-next v4 4/5] net: mtip: The L2 switch driver for imx287
Message-ID: <cab89673-6126-43ff-b7eb-1f311fa4498b@lunn.ch>
References: <20250407145157.3626463-1-lukma@denx.de>
 <20250407145157.3626463-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145157.3626463-5-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_142617_739635_09CEDF98 
X-CRM114-Status: GOOD (  15.13  )
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

> +static int mtip_ndev_port_link(struct net_device *ndev,
> +			       struct net_device *br_ndev,
> +			       struct netlink_ext_ack *extack)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(ndev), *other_priv;
> +	struct switch_enet_private *fep = priv->fep;
> +	struct net_device *other_ndev;
> +
> +	/* Check if one port of MTIP switch is already bridged */
> +	if (fep->br_members && !fep->br_offload) {
> +		/* Get the second bridge ndev */
> +		other_ndev = fep->ndev[fep->br_members - 1];
> +		other_priv = netdev_priv(other_ndev);
> +		if (other_priv->master_dev != br_ndev) {
> +			NL_SET_ERR_MSG_MOD(extack,
> +					   "L2 offloading only possible for the same bridge!");
> +			return notifier_from_errno(-EOPNOTSUPP);

This is not an error condition as such. The switch cannot do it, so
-EOPNOTSUPP is correct, but the Linux software bridge can, and it
will. So there is no need to use NL_SET_ERR_MSG_MOD().


> +		}
> +
> +		fep->br_offload = 1;
> +		mtip_switch_dis_port_separation(fep);
> +		mtip_clear_atable(fep);
> +	}
> +
> +	if (!priv->master_dev)
> +		priv->master_dev = br_ndev;
> +
> +	fep->br_members |= BIT(priv->portnum - 1);
> +
> +	dev_dbg(&ndev->dev,
> +		"%s: ndev: %s br: %s fep: 0x%x members: 0x%x offload: %d\n",
> +		__func__, ndev->name,  br_ndev->name, (unsigned int)fep,
> +		fep->br_members, fep->br_offload);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void mtip_netdevice_port_unlink(struct net_device *ndev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(ndev);
> +	struct switch_enet_private *fep = priv->fep;
> +
> +	dev_dbg(&ndev->dev, "%s: ndev: %s members: 0x%x\n", __func__,
> +		ndev->name, fep->br_members);
> +
> +	fep->br_members &= ~BIT(priv->portnum - 1);
> +	priv->master_dev = NULL;
> +
> +	if (!fep->br_members) {
> +		fep->br_offload = 0;
> +		mtip_switch_en_port_separation(fep);
> +		mtip_clear_atable(fep);
> +	}

This does not look quite correct. So you disable port separation once
both ports are a member of the same bridge. So you should enable port
separation as soon as one leaves. So if fep->br_members has 0 or 1
bits set, you need to enable port separation.

	Andrew

