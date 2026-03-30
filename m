Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D70FFB3CE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dI9UBPpTinsHn+j9mrLngqmTgVwtFLuTnmDiHbIshg=; b=NeMlozUhERshH8vIuj4RhpnjBV
	7YO0FRkGz9vJVdDTbD0QrIjG4zcC2M8F3O2gyfvnJSGTlZ+A5kxONFOyNnF0xo1z4a7LJhTFMJSlT
	UT3TyweGjvKfO8M6zhXK9sGPwUf4HGH24mtS8hsUCF9eYs5uBVZnzhmpYv8MKCQfP/AXe5quDilYQ
	cyFVqpFzNAcjJl6RqRSNSeJU+TcyDeb1DB3pxrbLoP+9RO4P8HKIah8F4KhmP8vlEz3FaXfE8Nk6L
	oW4sQDbcXwmRWiXBCdafJKCZw4YJx/m+wQz0+PIHdjvRFFTqJxEqGtBubXM70UFWSwC9jANWAq6bm
	fSWSCsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79U4-0000000B0kA-1RSG;
	Mon, 30 Mar 2026 10:04:36 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Tz-0000000B0jg-1pYI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1774865067; bh=+CtOxgKYxsJ3uTzGDmi74E4tq7U00KOjS3BRbExPvD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SQyUQ7R3zzQDzXjjIJOxZss+2xKc1KGE4CQW6JMZP/xiKxWsHoa49NihFXTJMA6sf
	 fABwKN+s9kx2jcS9htIN7fKtHfNGyI3Th+MjUPsY7fhNFVIMqsLOHzVnTA4RMZ4Le+
	 uogz39NptGA3koolo4pNRRQVB8YmG7JrI9B7LvNfHhdqU+AbcNkY9xL7isSPf6BFFh
	 FHCtnTlkOzsPw7eOTBsFbFyYXIYxIjwMlo8mlDF4mQY3YWwuMavxXvIDbnu86S5owy
	 XyQ1BY3QAmohyiSvE5s0eS7xPij8jYgz7sCC7OUVADWcoSu2odKcfsqOe8xnb9FgDP
	 XV7O47RJfeneA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 784D9380C00;
	Mon, 30 Mar 2026 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1774865067; bh=+CtOxgKYxsJ3uTzGDmi74E4tq7U00KOjS3BRbExPvD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SQyUQ7R3zzQDzXjjIJOxZss+2xKc1KGE4CQW6JMZP/xiKxWsHoa49NihFXTJMA6sf
	 fABwKN+s9kx2jcS9htIN7fKtHfNGyI3Th+MjUPsY7fhNFVIMqsLOHzVnTA4RMZ4Le+
	 uogz39NptGA3koolo4pNRRQVB8YmG7JrI9B7LvNfHhdqU+AbcNkY9xL7isSPf6BFFh
	 FHCtnTlkOzsPw7eOTBsFbFyYXIYxIjwMlo8mlDF4mQY3YWwuMavxXvIDbnu86S5owy
	 XyQ1BY3QAmohyiSvE5s0eS7xPij8jYgz7sCC7OUVADWcoSu2odKcfsqOe8xnb9FgDP
	 XV7O47RJfeneA==
Message-ID: <b44db9e6-f820-439d-a7ed-c1e2514579a8@mleia.com>
Date: Mon, 30 Mar 2026 13:04:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: lpc_eth: Fix a possible memory leak in
 lpc_mii_probe()
To: Ma Ke <make24@iscas.ac.cn>, piotr.wojtaszczyk@timesys.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, alexandre.belloni@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330081636.2887980-1-make24@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260330081636.2887980-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260330_100427_510496_A481DC0B 
X-CRM114-Status: GOOD (  20.58  )
/bin/ln: failed to access 'reaver_cache/texts/20260330_100427_510496_A481DC0B': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_100427_510496_A481DC0B 
X-CRM114-Status: GOOD (  23.53  )
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

Hello Ma Ke,

On 3/30/26 11:16, Ma Ke wrote:
> lpc_mii_probe() calls of_phy_find_device() to obtain a phy_device
> pointer. of_phy_find_device() increments the refcount of the device.
> The current implementation does not decrement the refcount after using
> the pointer, which leads to a memory leak.

this is correct, there is an actual detected bug.

> 
> Add phy_device_free() to balance the refcount.

But this does not sound right, you shoud use of_node_put(pldat->phy_node).

> 
> Found by code review.
> 
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> Cc: stable@vger.kernel.org
> Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
> ---
>   drivers/net/ethernet/nxp/lpc_eth.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
> index 8b9a3e3bba30..8ce7c9bb6dd6 100644
> --- a/drivers/net/ethernet/nxp/lpc_eth.c
> +++ b/drivers/net/ethernet/nxp/lpc_eth.c
> @@ -751,7 +751,7 @@ static void lpc_handle_link_change(struct net_device *ndev)
>   static int lpc_mii_probe(struct net_device *ndev)
>   {
>   	struct netdata_local *pldat = netdev_priv(ndev);
> -	struct phy_device *phydev;
> +	struct phy_device *phydev, *phydev_tmp;
>   
>   	/* Attach to the PHY */
>   	if (lpc_phy_interface_mode(&pldat->pdev->dev) == PHY_INTERFACE_MODE_MII)
> @@ -760,17 +760,18 @@ static int lpc_mii_probe(struct net_device *ndev)
>   		netdev_info(ndev, "using RMII interface\n");
>   
>   	if (pldat->phy_node)
> -		phydev =  of_phy_find_device(pldat->phy_node);
> +		phydev_tmp =  of_phy_find_device(pldat->phy_node);
>   	else
> -		phydev = phy_find_first(pldat->mii_bus);
> -	if (!phydev) {
> +		phydev_tmp = phy_find_first(pldat->mii_bus);
> +	if (!phydev_tmp) {

I didn't get it, why the new phydev_tmp is needed above, please
restore the original code above.

>   		netdev_err(ndev, "no PHY found\n");
>   		return -ENODEV;
>   	}
>   
> -	phydev = phy_connect(ndev, phydev_name(phydev),
> +	phydev = phy_connect(ndev, phydev_name(phydev_tmp),
>   			     &lpc_handle_link_change,
>   			     lpc_phy_interface_mode(&pldat->pdev->dev));
> +	phy_device_free(phydev_tmp);

This is plainly wrong and has to be dropped or changed to

	if (pldat->phy_node)
		of_node_put(pldat->phy_node);

>   	if (IS_ERR(phydev)) {
>   		netdev_err(ndev, "Could not attach to PHY\n");
>   		return PTR_ERR(phydev);

Is it AI generated fix or what?.. The change looks bad, it introduces
more severe issues than it fixes.

If you think you cannot create a proper change, let me know.

-- 
Best wishes,
Vladimir

