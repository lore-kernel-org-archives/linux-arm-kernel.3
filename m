Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD5EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5jNatzr9iPOY+macrl5h9nkF1ONt/HKYGdcJTwX8Mw=; b=Yj0uadmbVN7x/ZjpXD9lF0yeAH
	pQi2skoH78tOpfPxb4H8cDlUio+En2FLJjyCUX+pyS9J3QT0DZe1UmxgJDnBBE7IT4J0EfymSD2IM
	hq1eJxD6LYrPq7jiNNIUaNBw/SD/9QEaZR9vJEYj+/DqV95JU6yc1ETzs+Bkyfb4D9zDBFDpGEvSP
	L1hIOCJViDRCVqxMhmv5SbI2x5Obuwsyd5TfmHzEAmfhl5j5Jt0tR6fwbtqnTxnnnPxOLkMQsC554
	Upw8XhyWVlTOHRr5E77GKIARKQRncNlHh4SbtreNO6ZmnMgGmtIW/L6MRJeqY+eZ0ZkVsMuyI2am/
	gZDL+sHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyPa-0000000B34y-1nSg;
	Mon, 04 Aug 2025 16:51:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyN1-0000000B2l6-1hPC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 16:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y5jNatzr9iPOY+macrl5h9nkF1ONt/HKYGdcJTwX8Mw=; b=TQ5hNFWsQAIW1i2Bm5bN3/y9nF
	uPhfKJ8TLeiAZ+FGWplQvWoCRvjDfWuq3dH96ECeYolilN0VDNIzEaaPRxSgFXbafytvwTyY7JXp0
	J5qpapKFZ9R0zv8TkWZDUYUXv5Ch85Xye9a8xoiZ4+zvhRSZXOGW4oxmW1sDZDy0oKUg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uiyMw-003jFL-QO; Mon, 04 Aug 2025 18:49:02 +0200
Date: Mon, 4 Aug 2025 18:49:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Meghana Malladi <m-malladi@ti.com>,
	Himanshu Mittal <h-mittal1@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix emac link speed
 handling
Message-ID: <be848373-4b7f-4205-b1e4-b08fe161d689@lunn.ch>
References: <20250801121948.1492261-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801121948.1492261-1-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_094907_449413_103271A2 
X-CRM114-Status: GOOD (  20.47  )
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

On Fri, Aug 01, 2025 at 05:49:48PM +0530, MD Danish Anwar wrote:
> When link settings are changed emac->speed is populated by
> emac_adjust_link(). The link speed and other settings are then written into
> the DRAM. However if both ports are brought down after this and brought up
> again or if the operating mode is changed and a firmware reload is needed,
> the DRAM is cleared by icssg_config(). As a result the link settings are
> lost.
> 
> Fix this by calling emac_adjust_link() after icssg_config(). This re
> populates the settings in the DRAM after a new firmware load.
> 
> Fixes: 9facce84f406 ("net: ti: icssg-prueth: Fix firmware load sequence.")
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
> v1 - v2: Added phydev lock before calling emac_adjust_link() as suggested
> by Andrew Lunn <andrew@lunn.ch>
> v1 https://lore.kernel.org/all/20250731120812.1606839-1-danishanwar@ti.com/
> 
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 2b973d6e2341..58aec94b7771 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -50,6 +50,8 @@
>  /* CTRLMMR_ICSSG_RGMII_CTRL register bits */
>  #define ICSSG_CTRL_RGMII_ID_MODE                BIT(24)
>  
> +static void emac_adjust_link(struct net_device *ndev);
> +
>  static int emac_get_tx_ts(struct prueth_emac *emac,
>  			  struct emac_tx_ts_response *rsp)
>  {
> @@ -229,6 +231,12 @@ static int prueth_emac_common_start(struct prueth *prueth)
>  		ret = icssg_config(prueth, emac, slice);
>  		if (ret)
>  			goto disable_class;
> +
> +		if (emac->ndev->phydev) {
> +			mutex_lock(&emac->ndev->phydev->lock);
> +			emac_adjust_link(emac->ndev);
> +			mutex_unlock(&emac->ndev->phydev->lock);
> +		}

What about the else case? The link settings are lost, and the MAC does
not work?

	Andrew

