Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7671DF36B9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPACFZ/WrQbpl7zoRENt8HIA/hI75qHkru+84OdV0JQ=; b=2MsRUe9a82Fzu8bLQFVu4BDtB/
	788WLUH/RRawd1cV4ODmzU6wE+lyvtZ18ZXYuF0eQq/nUinYkwA/HZyFG3LXFeDdj5VjyQZr5EuiQ
	lht6Zq/parkK+ZbXTbiV2BQEwRpqonaFNcixJKYxiKSJ+Om0eN4eE+yWp/8AZvMDoMgFphCnUP+5Z
	/RHcfVydog7a1+NDJh5yH9+tDpdPPr3uzs5hPN0bsnoZ1EdHmfpcDoAe15rdLBfRwxoH87/MqYJ1o
	9qCy6XqM3Dr/+XTYphpN8Ayjowg0iBaC9PdtIgODc9CwVYsqZgfCrzCSoepfxkIU3ifj8+KlZwBJ1
	z/dwfGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23i-0000000BUxd-1W21;
	Fri, 10 Apr 2026 02:57:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23g-0000000BUw6-3oF9;
	Fri, 10 Apr 2026 02:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AB9260128;
	Fri, 10 Apr 2026 02:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690A3C4CEF7;
	Fri, 10 Apr 2026 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775789844;
	bh=SOtsO1H4hBhJ7UgGNQF2cWoATJZ7lwtCCm/KkSB8iFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gnFOYfpo9b+bO1fznuRTZ5Iv+akaYDbstDHVouFywHRepUoqYUoE/tDWcklCZeo4j
	 ZfPGDK/tulUNrULmUueq4RLzPIiq6mA8ZIW7sgVtREWz+EXGkqrsF9d8A6RgPwW02I
	 6skMAUB3KXLd7tB71Tuq253H5VmfSapnc/DsPKO9STrfKScrhkTzjEQwz7ng889dZB
	 p9JlE0VCy4qQAei9coPoxl/2Wf/rcz0vrlH9RojTh6+XuGShXDeqjYZEGylfIwgyU6
	 n7qVIcmNJ81sCJReDg+zIFbm4NwXjzTJVPrMWzfpTHh74r0x5ytgnp0xetXNW0e6rn
	 IpG7M3Kr+qW+w==
From: Jakub Kicinski <kuba@kernel.org>
To: lorenzo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 04/12] net: airoha: Rely on net_device pointer in HTB callbacks
Date: Thu,  9 Apr 2026 19:57:22 -0700
Message-ID: <20260410025722.1809973-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-4-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-4-ab6ea49d59ff@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email says "For your consideration."
---
net: airoha: Introduce WAN device flag

This commit introduces a WAN flag to specify whether a device is used to
transmit or receive WAN or LAN traffic. It enables specifying multiple LAN
devices but limits the configuration to a single WAN device.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 5b0cd37b155e4..9988011dca53f 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1796,36 +1796,77 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_dev *dev)

[ ... ]

> +static int airoha_dev_init(struct net_device *netdev)
> +{
> +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> +	struct airoha_gdm_port *port = dev->port;
>  
>  	switch (port->id) {
>  	case AIROHA_GDM3_IDX:
> -	case AIROHA_GDM4_IDX:
> -		/* If GDM2 is active we can't enable loopback */
> -		if (!eth->ports[1]) {
> -			int err;
> +	case AIROHA_GDM4_IDX: {
> +		struct airoha_eth *eth = dev->eth;
>  
> -			err = airoha_set_gdm2_loopback(dev);
> -			if (err)
> -				return err;
> -		}
> +		if (eth->ports[1] || airoha_get_wan_gdm_dev(eth))
> +			break;

If a board's Device Tree enables both GDM3 and GDM4, and GDM2 is not present,
does this sequence permanently assign the WAN role to GDM3 since it is
initialized first? Is there a Device Tree property or fallback configuration
mechanism to allow users to specify GDM4 as the WAN port instead?

> +		fallthrough;
> +	}
> +	case AIROHA_GDM2_IDX:
> +		/* GDM2 is always used as wan */
> +		dev->flags |= PRIV_FLAG_WAN;
>  		break;
>  	default:
>  		break;
>  	}
>  
> -	for (i = 0; i < eth->soc->num_ppe; i++)
> -		airoha_ppe_set_cpu_port(dev, i, airoha_get_fe_port(dev));
> +	airoha_dev_set_qdma(dev);
> +	airoha_set_macaddr(dev, netdev->dev_addr);

Since the commit message notes it is possible to specify multiple LAN
devices, does unconditionally calling airoha_set_macaddr() for each
device overwrite the single shared hardware LAN MAC register?

If so, could this cause only the last initialized LAN device to have its MAC
correctly programmed into the hardware, leading to dropped unicast
packets for the other LAN interfaces?

> +
> +	if (!airoha_is_lan_gdm_dev(dev) &&
> +	    (port->id == AIROHA_GDM3_IDX || port->id == AIROHA_GDM4_IDX)) {
> +		int err;

[ ... ]

