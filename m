Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06755CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKhOUStc32yyJJh2yPmsAjtT0L8xYwJmDHCV2AfoKVk=; b=YOT0qszslrZkiDRHsJx1YfoSeb
	KIdz1ytl98UqDjfK2e3Y37rI5TdmhLqDeKDktSakCSU4U0n7DP3YdVZQRe9cB+ukxuUMEatHzn3eV
	k+VjuMSpU5reuxn1kJResgb7+GJ0TK446U0e2aehg0TVaoHvnWxjbqrSIxsTB6QKt3fHYq5oyxi53
	zQoHjkdNx3uJg8nUXqPiruLPY9dkIm4Y775VF9fuuZVg+a5pGicr7B7Wed8rw6HjlfyQDQP6dLlLt
	QSUNwHcf1O9PdPo5foKv2W6zYMo27LQpfleEHZbfzZMXRfh1eIk/LTdcG6YKW21BqjwmKil9KoGst
	2hNltkAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjY3-00000003sjr-2ax0;
	Thu, 08 Oct 2026 08:32:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjY0-00000003shr-0rJg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:32:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AD05B4E41176;
	Thu,  8 Oct 2026 08:32:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8189360341;
	Thu,  8 Oct 2026 08:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1E6E10333850;
	Thu,  8 Oct 2026 10:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791448333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DKhOUStc32yyJJh2yPmsAjtT0L8xYwJmDHCV2AfoKVk=;
	b=yyHoI/oxSfdhJNEDv3/CTjikWXWJLcVViQRDKXaycfcuAlZd406+P127DWOfiugd/D3kPT
	es+l7ZPrDzzrxVzEGCjdfBHqn7srcDW5pvXitk5X0S/rgaiyKfa/KIOglKufZH+/7Jcr/1
	iVlNRIJpJJSsJfTI9eA979l45dSzZr5V3SYh7GgA44kO6BrtmjUaBJaLQ+CW6/DU1jaS8l
	4midyiJUTxJjAnIt/t7/7RoKpo8VHigd7tpdij5H1ztJ9DZHdjDjqdsI5py7gbVE8Tf4eF
	2MUU0LmXwD+78xuwBWZ2abmo8JXhrmrhTcsfEXOgsygxxCmHje1udtX2G7+HxA==
Message-ID: <85184f37-32d8-42ce-90db-46cde769ecf5@bootlin.com>
Date: Thu, 8 Oct 2026 10:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 09/10] net: ti: icssm-prueth: Move setting of netops
 to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: MD Danish Anwar <danishanwar@ti.com>, Parvathi Pudi
 <parvathi@couthit.com>, Roger Quadros <rogerq@kernel.org>,
 Mohan Reddy Putluru <pmohan@couthit.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-10-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-10-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013216_409038_166555AF 
X-CRM114-Status: GOOD (  13.41  )
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



On 10/8/26 04:26, David Yang wrote:
> icssm_prueth_netdev_init() calls of_phy_get_and_connect() before
> ndev->netdev_ops is assigned. phy_attach_direct() ->
> phy_link_topo_add_phy() reads dev->netdev_ops through
> netdev_need_ops_lock() since the commit in question, so probing crashes
> with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.
> 
> Assign netdev_ops before the PHY attach, as was done for emac in commit
> 7c9f391ec89c ("net: emac: move setting of netops to fix crash").
> 
> Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
> Signed-off-by: David Yang <mmyangfl@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

> ---
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index b7e94244355a..b42c98e861e0 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> @@ -1563,6 +1563,8 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
>  	}
>  	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
>  
> +	ndev->netdev_ops = &emac_netdev_ops;
> +
>  	/* connect PHY */
>  	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
>  					      icssm_emac_adjust_link);
> @@ -1590,7 +1592,6 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
>  	}
>  
>  	ndev->dev.of_node = eth_node;
> -	ndev->netdev_ops = &emac_netdev_ops;
>  
>  	netif_napi_add(ndev, &emac->napi, icssm_emac_napi_poll);
>  


