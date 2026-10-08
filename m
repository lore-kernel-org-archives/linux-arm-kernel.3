Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3760CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxECxQ++O9X0OKyJZXgkZtO03GupF5npmg5sevhbrog=; b=14VZkpW6jyOZSKFYTLLU4pvPyl
	XlpOYTkxWYlzhPNO0+/bJwnTUYcf6iDcXSqO3tTEOLzQfngogEff50j6PKQrtFs9h3sPUyfjbofGX
	6TkuI8XIu8fIgyWU6PifR0jUsD8Xdv1YcvYXb9m+cffSivqc2k4vQOO+mCP0uVo4YnkS1Dm+1CLct
	y3jqerzx5WG8dHTMaS7g4fVJnMpWXh2HvzyuZiktmqJT1HVBNuMuGYEpgxWbMCUFjVD7hLsge4vmh
	lo7IWFZIgRy2AF06B2sMpVd+3EKTfILruvVXpF09pzh7M8chYwMxWbK7jtfELj6++qJtP89jUSkhW
	kdc4u9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjWM-00000003s8D-3zUq;
	Thu, 08 Oct 2026 08:30:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjWK-00000003s75-02QB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:30:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F19634E41176;
	Thu,  8 Oct 2026 08:30:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3FEC60341;
	Thu,  8 Oct 2026 08:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0D4810333850;
	Thu,  8 Oct 2026 10:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791448226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xxECxQ++O9X0OKyJZXgkZtO03GupF5npmg5sevhbrog=;
	b=2VH/QRrUho2xFw/tBmEw9RjXx/KeuK4roNPFgZM78+4XHVP4W2OQzheGIGq3728PvD02yt
	C2Gb8SokhmGuvHzU/vj3D+zMCFZWPASBe11zuv36fSDGdjRE2TS/gzxPjO5BnMmZ5OsfWE
	jA2r3Ad2tEPK5yjme2raaU1kZBfJdHUMGj3SJqIHsZFroLdXUeQLWkuPYsWPvO8Ri5BYhn
	Gnh9dED8kgmEjiIMkPX7Zx52ki6WeGTsMPTR8gdk/EuMyGwBDgnVnv8FqWANPelltfgxMq
	rQb7snen7yxmwPmLztfLmullzXxqsrEryAaHzasSoZC423QjI8DhPOkHUeoJ3A==
Message-ID: <b44d36a0-43a1-4399-8c79-29d1f57984cd@bootlin.com>
Date: Thu, 8 Oct 2026 10:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 03/10] net: ethernet: actions: Move setting of netops
 to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Stanislav Fomichev
 <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-4-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-4-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013032_195934_0D22D211 
X-CRM114-Status: GOOD (  15.11  )
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
> owl_emac_probe() calls owl_emac_phy_init(), which connects the PHY,
> before netdev->netdev_ops is assigned. phy_attach_direct() ->
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
>  drivers/net/ethernet/actions/owl-emac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
> index 0a08da799255..2538275a1e57 100644
> --- a/drivers/net/ethernet/actions/owl-emac.c
> +++ b/drivers/net/ethernet/actions/owl-emac.c
> @@ -1552,6 +1552,8 @@ static int owl_emac_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	netdev->netdev_ops = &owl_emac_netdev_ops;
> +
>  	ret = owl_emac_phy_init(netdev);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize PHY\n");
> @@ -1563,7 +1565,6 @@ static int owl_emac_probe(struct platform_device *pdev)
>  	netdev->min_mtu = OWL_EMAC_MTU_MIN;
>  	netdev->max_mtu = OWL_EMAC_MTU_MAX;
>  	netdev->watchdog_timeo = OWL_EMAC_TX_TIMEOUT;
> -	netdev->netdev_ops = &owl_emac_netdev_ops;
>  	netdev->ethtool_ops = &owl_emac_ethtool_ops;
>  	netif_napi_add(netdev, &priv->napi, owl_emac_poll);
>  


