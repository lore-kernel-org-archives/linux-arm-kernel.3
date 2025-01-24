Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A44C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAHsYp0wTYQL8fVZ0uN4jN6ow3whTO1/nezsaF3KvFc=; b=fEx/+fM5bMcvoNtLck7TuJM2oN
	eCq90aoeqUPpZ9txfijte4lMtL7Ngcpn3eM5iRd5EyvpsNV27rVGVxqn907upTPHzQYqBgfGTWzJa
	iqwrLcKNzE/yvPts80FiBYSew58xgV8lsPh22d2OXT1RVQsY0r3OsL441VcxlFx/z7VUZ2la00/F3
	+EPA/xz8UyxVo2oJQcUkdG6j5rhX4IE7GWUP3FItyTO4KwvQsycwlOXSGXzCpTwk+E1tdMpp1wlcE
	vSu490cFvkU/ap4DU4sLUPaEYVt4SYSn7wIGQb5W6FoMQLMxtxzBeUBQVeG6V4RbbANv5vyBRMpgQ
	HQ1YK9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIA4-0000000EbJX-0R3m;
	Fri, 24 Jan 2025 11:47:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbI8j-0000000Eawx-1kUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 11:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OAHsYp0wTYQL8fVZ0uN4jN6ow3whTO1/nezsaF3KvFc=; b=oXR7rgebpgu4935TEydF3xSBqU
	tOJgSufLYMloBGJudXro0+qzpU4a22q0X6J0VWnmiijdjrqvktvME4ln8Nj6jv9vcMfpfb7Puae+q
	6FvU3rdisyaQ8DlOYvUh37GxC0dd2N9y8u4kPmmeU/kLNWkmL8bGe2gn6DPvexi3449IrU1wlDYQ1
	NMg35p4aL3Det4ddXikM+kwDhXCHsnpW5cQZdzzo82ZujEKfIQWHn5bHVaCPMoHGtFB1FhKLVP/Ou
	yfcGhcSrevWz7X5GVaU8ur0XMFRYzNOjq3Gw19ngbItequbBQ7e8eBnSvkeATsTA6MWxoj8JPDd0e
	6F1SPPKA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46824)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tbI6S-0002Dr-2j;
	Fri, 24 Jan 2025 11:44:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tbI6N-0006wr-0y;
	Fri, 24 Jan 2025 11:43:55 +0000
Date: Fri, 24 Jan 2025 11:43:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/3] net: stmmac: Limit the number of MTL queues
 to hardware capability
Message-ID: <Z5N8-2XVAFBn1BCY@shell.armlinux.org.uk>
References: <20250124101359.2926906-1-hayashi.kunihiko@socionext.com>
 <20250124101359.2926906-2-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124101359.2926906-2-hayashi.kunihiko@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_034621_454597_A2F9DFBE 
X-CRM114-Status: GOOD (  18.81  )
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

On Fri, Jan 24, 2025 at 07:13:57PM +0900, Kunihiko Hayashi wrote:
> The number of MTL queues to use is specified by the parameter
> "snps,{tx,rx}-queues-to-use" from stmmac_platform layer.
> 
> However, the maximum numbers of queues are constrained by upper limits
> determined by the capability of each hardware feature. It's appropriate
> to limit the values not to exceed the upper limit values and display
> a warning message.
> 
> This only works if the hardware capability has the upper limit values.
> 
> Fixes: d976a525c371 ("net: stmmac: multiple queues dt configuration")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7bf275f127c9..be1e6fa6d557 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7232,6 +7232,21 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  	if (priv->dma_cap.tsoen)
>  		dev_info(priv->device, "TSO supported\n");
>  
> +	if (priv->dma_cap.number_rx_queues &&
> +	    priv->dma_cap.number_rx_queues < priv->plat->rx_queues_to_use) {

While this looks "nicer", which of these two do you think reads better
and is easier to understand:

"If priv->dma_cap.number_rx_queues is set, and
 priv->dma_cap.number_rx_queues is less than
 priv->plat->rx_queues_to_use then print a message about
 priv->plat->rx_queues_to_use exceeding priv->dma_cap.number_rx_queues"

"If priv->dma_cap.number_rx_queues is set, and
 priv->plat->rx_queues_to_use is greater than
 priv->dma_cap.number_rx_queues, then print a message about
 priv->plat->rx_queues_to_use exceeding priv->dma_cap.number_rx_queues"

With the former one has to mentally flip the test around in the if
statement to check that it does indeed match the warning that is
printed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

