Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0962EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiaXYdqt5Org1TiCYGcnzDH7KgJeA0R3qKvy5iHqC2Y=; b=cMjPYmP9cbo3LLGUzhu19OwEja
	t3MtSQFf19O7OZquGFgUp9dECHmg13KytMYEa/KFhILEnqSLiJFqEA9+Z47CTPaoh1Z/BgEqil/IW
	nNxUjDFECMQgX1KcpeQQpgfgByPzH468T1m4JqDNBpe6BpfKPQ/hJAKuZ5vuk43O3Oue2CkneLtFS
	E49jDBwD8wVwVRrIxec1nmuVCoGwRCfn5HZtfRbNtt0pmBZK+36zvfNT5qY+wOe3AU/4UJb4M7KWn
	mzdBryhhaN0G7pOVZp5azyRvl2znBiBurL88qZw9lCenKXvS5CYz/CRPDixS1Kasjq/LuiA7UvBWt
	luXoxuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taau1-0000000AIla-2VhN;
	Wed, 22 Jan 2025 13:36:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taasi-0000000AIZ5-3a7h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:34:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F435A424ED;
	Wed, 22 Jan 2025 13:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227BBC4CED6;
	Wed, 22 Jan 2025 13:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737552895;
	bh=7DfnBrMHaBayCccsD/q52Q3ilgtaRdWdr/x3Gw0r2XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJpXlEyv7n9CG7ZRDA2nS+LWBnhs1o58kuVfKdat3ym/LC5WJVE5RRiXv4JLyu2DM
	 2PAOPTBFQI/WaUx8B7/CWkSeD1S42ZpsuT5UcxvBdgG7SjhddajSxgZUUCcJIIx6lf
	 ZkBJz7qMlR2Gslw1+daM2Io4wCJK9iYx5WUPfPqNHGtuVHp7Oqjsw+w3cDOxHCH7ly
	 S+q1AoVrZLQ9HamDm9OLRTnnrz6BKzrtI5WOlc4ov5IxxR4xlFA6rIVOsc7LDj8EN3
	 WmJVnW/2F1MuyzHQ++ag89h1Z++m0wlreyPh1/aNvJc4jXqdgdnYonsVvW4u4t4DLd
	 7L7ySImQEMs9w==
Date: Wed, 22 Jan 2025 13:34:50 +0000
From: Simon Horman <horms@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Chong Qiao <qiaochong@loongson.cn>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] net: stmmac: dwmac-loongson: Set correct
 {tx,rx}_fifo_size
Message-ID: <20250122133450.GI390877@kernel.org>
References: <20250121093703.2660482-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121093703.2660482-1-chenhuacai@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_053457_024524_575F918F 
X-CRM114-Status: GOOD (  19.73  )
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

+ Feiyang Chen, Yanteng Si, Alexandre Torgue, Maxime Coquelin, Serge Semin,
  linux-arm-kernel

On Tue, Jan 21, 2025 at 05:37:03PM +0800, Huacai Chen wrote:
> Now for dwmac-loongson {tx,rx}_fifo_size are uninitialised, which means
> zero. This means dwmac-loongson doesn't support changing MTU, so set the
> correct tx_fifo_size and rx_fifo_size for it (16KB multiplied by channel
> counts).
> 
> Note: the Fixes tag is not exactly right, but it is a key commit of the
> dwmac-loongson series.
> 
> Cc: stable@vger.kernel.org
> Fixes: ad72f783de06827a1f ("net: stmmac: Add multi-channel support")
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Thanks, this change looks good to me.
And I agree that MTU setting cannot succeed without it.

Reviewed-by: Simon Horman <horms@kernel.org>

Some process notes regarding Networking patches to keep
in mind for next time.

1. Please set the target tree. In this case, as this is a fix
   for code present in net. In general, otherwise it would be net-next.

   Subject: [PATCH net] ...

2. Please generate a CC list using

   ./scripts/get_maintainer.pl this.patch

   The b4 tool can help with this.

Link: https://docs.kernel.org/process/maintainer-netdev.html

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index bfe6e2d631bd..79acdf38c525 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -574,6 +574,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  	if (ret)
>  		goto err_disable_device;
>  
> +	plat->tx_fifo_size = SZ_16K * plat->tx_queues_to_use;
> +	plat->rx_fifo_size = SZ_16K * plat->rx_queues_to_use;
> +
>  	if (dev_of_node(&pdev->dev))
>  		ret = loongson_dwmac_dt_config(pdev, plat, &res);
>  	else
> -- 
> 2.47.1
> 
> 

