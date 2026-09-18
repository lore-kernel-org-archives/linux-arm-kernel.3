Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AECFC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8K01hB9IqojhMRbfuKM/v1NjQHIp8XOxCYzKeUDVEY=; b=aDvwDuzVvMQPbIJEhkOOrpoPMw
	XN9PSDoj9VBB29qSU75vf3V5WPRIUGdg0E5l/r8E+Jfu/KBOhEDECTkYuRMX2G9X/nfe6aa7MWEWe
	uIf1SgSOPhlB71C6e3htZOywQIYlWbOW6n0TWGLfzURrQzmoHDV0qvQ/itfzL1gJMev06HkpuMWzW
	Dld2qg3vRcNRye5dsZZabN9srrWW8rJX7IGYp75yWndgduvX1AtTeKXc6veIg7M57z6qQ4i6LEOXV
	p89FmpY2LU3E8klJiJR7eMl9grnbMMEnnt1vdroJjEbBkmsRa7vM8gzYLacTf2n8WImMZNrACpiXX
	Nv71GVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OIM-0000000DJMT-0RiV;
	Fri, 18 Sep 2026 02:25:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OII-0000000DJLO-3cOe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x8K01hB9IqojhMRbfuKM/v1NjQHIp8XOxCYzKeUDVEY=; b=0I4Od2P71Pb5TnrRdr40GJaEgQ
	TAgGQRxwXvSWBVB5Xoch+LXg5QPggOi0cDcuaaYnS8npdLv8DitZIpqjkRzLrzqOOwR2FyePsqC7K
	mLVxQUn6rGk4svREL2jJZkjdJB+o+2nXWum2iVsP9wl4FTIRyLXBkStFiOb8FwGaSMEA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x7OIA-005mqx-SV; Fri, 18 Sep 2026 04:25:34 +0200
Date: Fri, 18 Sep 2026 04:25:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] net: gemini: Free the shared queue after removing the
 ports
Message-ID: <e544a2bc-79ed-4067-9be8-59453d25acb3@lunn.ch>
References: <20260917192835.58126-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917192835.58126-1-mhun512@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_192542_901112_025AC76B 
X-CRM114-Status: GOOD (  15.81  )
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

> Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/net/ethernet/cortina/gemini.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 4c762229ce42..e493d495f2ef 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -2364,7 +2364,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
>  		unregister_netdev(port->netdev);
>  	}
>  	clk_disable_unprepare(port->pclk);
> -	geth_cleanup_freeq(port->geth);
>  }
>  
>  static void gemini_ethernet_init(struct gemini_ethernet *geth)
> @@ -2656,7 +2655,10 @@ static void gemini_ethernet_remove(struct platform_device *pdev)
>  {
>  	struct gemini_ethernet *geth = platform_get_drvdata(pdev);
>  
> -	geth_cleanup_freeq(geth);
> +	devm_of_platform_depopulate(&pdev->dev);

This seems wrong. If you have to call devm_of_platform_depopulate()
why are you using devm?

> +	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> +	if (geth->freeq_ring)
> +		geth_cleanup_freeq(geth);

gemini_ethernet_remove() is supposed to do the opposite of
gemini_ethernet_probe(). What is the opposite of geth_cleanup_freeq()?
Where is it called in gemini_ethernet_probe()?

	Andrew

