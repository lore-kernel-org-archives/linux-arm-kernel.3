Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFD9CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8X2PsARIwdIFd2v7trMxvVFqgxkuCNINE+Sbyf62to=; b=SumURdpq2hz249B7hwPoMfdaWD
	j7EIPucGW5mMdLM40T20c+BuAbGkkkA86bWwRX7zqHrd91rb+2fU4pmOlQVyJ0dpngdLn4BPWtN3h
	7qhX/nTixhB27y5yz67ys2dEtkOk54k/Z8PBtJGJ1WdsRb4Fbzdc9iL3UF48k+b4lF6mVu+xTlh/8
	K5gRRbJwWvOxp/QC6C288L9hgPdnpOhnAc6lhZQijOOMUf8eUVuqbHMhlymzdZMkU+sHJoEB09/BO
	Im6Oi5faYkYRPsK0u5WrBdfU3XkZFJpcMPetn2SIZ3lNtjlL3GWj27BEz1ediUQl4fVBcMlMrZE/K
	moHOjRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGST0-0000000Cr0w-379O;
	Wed, 05 Nov 2025 01:37:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSSy-0000000Cr08-24gq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 01:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C9D840520;
	Wed,  5 Nov 2025 01:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E869C116B1;
	Wed,  5 Nov 2025 01:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762306659;
	bh=IcyU0Yp3oCClfFclJKfCJuSEiNNqeKLe/tfJ66F7OEE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K9BJyI5E6azayMhVSFx+KbOQ7Wfjay1941Ds+NWc+9bDp+iEis1z5UyMYkZVKT74j
	 jKHBhV/9NKGAw5igjRhf4Gd2+/Y3zWLCpXGvDeHq76mZ5SsqVTPU+UkWc6gdkPbgg3
	 +rqwFSc8IYbVEF6I17/Fs2FinQZ2AjmqU0y3NReXb0Jmql5oySWwoq75lioJZ2xNjP
	 JHmP244Wf9Wg3vepxMjhSyOPPx4qWGELwP33QoUzVQ6OD7f6qC3xFh2K34Pcd+u76S
	 b3ce/A9bKJSoIE1y2mB5Gt5Ztpg09+aWEBDDd9oxu02meA2JgVFg4/7D7RYU/pvTQ3
	 vLFqOEEFiMWzQ==
Date: Tue, 4 Nov 2025 17:37:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Manish Chopra <manishc@marvell.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Kory Maincent
 <kory.maincent@bootlin.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/7] bnx2x: convert to use ndo_hwtstamp
 callbacks
Message-ID: <20251104173737.3f655692@kernel.org>
In-Reply-To: <20251103150952.3538205-2-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
	<20251103150952.3538205-2-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_173740_559436_6B0A76D6 
X-CRM114-Status: GOOD (  12.01  )
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

On Mon,  3 Nov 2025 15:09:46 +0000 Vadim Fedorenko wrote:
> -static int bnx2x_hwtstamp_ioctl(struct bnx2x *bp, struct ifreq *ifr)
> +static int bnx2x_hwtstamp_set(struct net_device *dev,
> +			      struct kernel_hwtstamp_config *config,
> +			      struct netlink_ext_ack *extack)
>  {
> -	struct hwtstamp_config config;
> +	struct bnx2x *bp = netdev_priv(dev);
>  	int rc;
>  
> -	DP(BNX2X_MSG_PTP, "HWTSTAMP IOCTL called\n");
> -
> -	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
> -		return -EFAULT;
> +	DP(BNX2X_MSG_PTP, "HWTSTAMP SET called\n");
>  
>  	DP(BNX2X_MSG_PTP, "Requested tx_type: %d, requested rx_filters = %d\n",
> -	   config.tx_type, config.rx_filter);
> +	   config->tx_type, config->rx_filter);
>  
>  	bp->hwtstamp_ioctl_called = true;
> -	bp->tx_type = config.tx_type;
> -	bp->rx_filter = config.rx_filter;
> +	bp->tx_type = config->tx_type;
> +	bp->rx_filter = config->rx_filter;
>  
>  	rc = bnx2x_configure_ptp_filters(bp);

bnx2x_configure_ptp_filters() may return -ERANGE if settings were not applied.
This may already be semi-broken but with the get in place we will make
it even worse. 

>  	if (rc)
>  		return rc;
>  
> -	config.rx_filter = bp->rx_filter;
> +	config->rx_filter = bp->rx_filter;
> +
> +	return 0;
> +}
>  
> -	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ?
> -		-EFAULT : 0;
> +static int bnx2x_hwtstamp_get(struct net_device *dev,
> +			      struct kernel_hwtstamp_config *config)
> +{
> +	struct bnx2x *bp = netdev_priv(dev);
> +
> +	config->rx_filter = bp->rx_filter;
> +	config->tx_type = bp->tx_type;
> +
> +	return 0;
>  }

