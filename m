Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B0C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyIzPYUauH3Qhtv7ngBSIIeQCucxdX5r54KBJoGH2DY=; b=dzNDYM/m5gyjVLaAJowt2H2JMS
	zKH6ioIA6pvjqUJpzpTkGrHTaNSowwYmbCAITSTUMpjC3pdWJD/zcklyJTzQWhnsTPDPyic/Uoh+X
	0ROqNsdC6JnA30PuO77/tRjS8u/Ga9CZ5VN1wFFwbigiD5n5CwoyABe+Bjd3DLe1udryWoaYPFBRf
	b/2OPdQUqyfLF5CbO4qUj9gCrzBHRoLc/sY5H1TCvXg3hsCLiyy5NzMd/iWGbDLultCy9y0RQLymP
	uqDEK18K++5Ze+03CO/S5NfGgLk+O7VaU5B7Mpb9HcSvbuHbMDgNy+KH1MEB8COUfW0wKFNZG9ylO
	9hrb8UBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8crm-0000000214j-2hCz;
	Mon, 21 Sep 2026 12:11:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8crl-0000000214U-2vfO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:11:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0A1B600C8;
	Mon, 21 Sep 2026 12:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D541F000FF;
	Mon, 21 Sep 2026 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992684;
	bh=KyIzPYUauH3Qhtv7ngBSIIeQCucxdX5r54KBJoGH2DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OvoYvLuxrkWMzUmtMrJWdgyuY3V5JYSkgXPFET2ZXCEVwMONVViYf6st9m7LX0DyW
	 SVgOXdYPEbqMpIDFwZr3k0ygfpkjIzGj4d/zIUUHPJNNxjcqA+NZIjK8wH5Ip2mNqU
	 WIfbMlFM9KodAVdmzGQ863kgolIMZYDdBqT9ZbJddwYhv24Tdh/DwASdLwMEhdnrJF
	 FLjfNv/hn9TQZebeShCgOMdzWQY0BbjzZgZW/cAsYFbKElu5niHPDhhkZ0HhXP/lsr
	 NZBuMuqdG/MaxI5RObzlGVOfjW6qyu1jVv2/pSu/a1Cn8BjUjZEr5sc6SKOZ27Rsvz
	 Hv1ogzJE4fqkw==
Date: Mon, 21 Sep 2026 13:11:20 +0100
From: Simon Horman <horms@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, pabeni@redhat.com, treding@nvidia.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Fix MDIO node leak in stmmac_mdio_setup()
Message-ID: <20260921121120.GK13925@horms.kernel.org>
References: <20260917113945.2149361-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917113945.2149361-1-vulab@iscas.ac.cn>
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

On Thu, Sep 17, 2026 at 11:39:45AM +0000, Wentao Liang wrote:
> stmmac_mdio_setup() acquires a reference on the MDIO node through
> stmmac_of_get_mdio() and stores it in plat->mdio_node. If the allocation
> of plat->mdio_bus_data fails, the function returns -ENOMEM and the
> caller takes the error_put_phy path, which only releases plat->phy_node,
> so the MDIO node reference is leaked.
> 
> Release plat->mdio_node on this error path.
> 
> Fixes: 1a981c0586c0 ("net: stmmac: Make MDIO bus reset optional")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 5cae2aa72906..09359ccb32ef 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -356,8 +356,11 @@ static int stmmac_mdio_setup(struct plat_stmmacenet_data *plat,
>  		plat->mdio_bus_data = devm_kzalloc(dev,
>  						   sizeof(*plat->mdio_bus_data),
>  						   GFP_KERNEL);
> -		if (!plat->mdio_bus_data)
> +		if (!plat->mdio_bus_data) {
> +			of_node_put(plat->mdio_node);
> +			plat->mdio_node = NULL;
>  			return -ENOMEM;
> +		}
>  
>  		plat->mdio_bus_data->needs_reset = true;
>  	}

Hi Wentao,

As per my comment on another one of your recent patches, I think this
change would be somewhat more robust against future changes to this
function if it was implemented using a goto-driven unwind ladder, which is
the generally preferred in Networking code.

Something like this (compile tested only!):

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3ea16d618215..ded352afd103 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -356,12 +356,17 @@ static int stmmac_mdio_setup(struct plat_stmmacenet_data *plat,
 						   sizeof(*plat->mdio_bus_data),
 						   GFP_KERNEL);
 		if (!plat->mdio_bus_data)
-			return -ENOMEM;
+			goto err_put_mdio_node;

 		plat->mdio_bus_data->needs_reset = true;
 	}

 	return 0;
+
+err_put_mdio_node:
+	of_node_put(plat->mdio_node);
+	plat->mdio_node = NULL;
+	return -ENOMEM;
 }

 /**

-- 
pw-bot: changes-requested

