Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94779C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvvYX1wP7WXJ32aPqo0eeKzIfSSanTffTs2djJyDZ0U=; b=c6DgOj5EaUwNGBbl+3OfsWnth7
	lKZNuaeh3/Vi3KC8SlMtLmxcviGhxJUcjkutGAm0I3SQpkfdINXYGv2SlZaJw53CEGQnCPmHRebGm
	1nWaxBb9vYJObh0JyXjChABFf2v7ftbDAeYpThpo+RFgpfMz3HG1l0s0W/gZB9n7i4cDnMbmNB2n7
	TNqI5T/I/c0fb+1niTvrTx4nYwyjjQwWIjd1pxzv1S/FkHHLwNHALcJJAGGXBBTnZzwfa9dHFtgdr
	5XC6yJSd2009L/WDejX62E0kLeNbsv4F/8+pKlbPhbGfgq7Mp8IEBlENvG4WDahLYzzxrLQMVTYEx
	MKQfvOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EnX-00000005GNv-2VE4;
	Tue, 08 Apr 2025 19:39:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Elm-00000005FzE-0JFE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 19:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QvvYX1wP7WXJ32aPqo0eeKzIfSSanTffTs2djJyDZ0U=; b=IV2RxmIXf8I1+BCctYuzCw5QD7
	WjYsFD679Efbye4KULBFE++k4MQNCUikZgamk8FTh0Xgn/gPXMLaurKMGcg+xQgbmuZNhJ1tauwWj
	nZFjXKYTgRj9/fxnm6uGnoygDAHKoBfe4ih76v/h9sYwA1WSWBbZu5D24eBPT7wd14HxrzYB+N8Us
	lwnYDRx0cjkq3ZjSdTv9AJAcjqgDrcW0swTZEx6kBkzJFb0eiSTLfaQy/rWiZrYvhe5DPn9ZWn/Bv
	ZvIXOiL3LU7Gxs3TcJOilv4Hz0E+3Yvof8js1vz5WwchNy045uiVp63ZJQ+Mo9R+67+ZbojpVbx/S
	wpRUU5gg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Eli-00000008PU3-37Bg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0AB0A483E0;
	Tue,  8 Apr 2025 19:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60554C4CEE5;
	Tue,  8 Apr 2025 19:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744141077;
	bh=85wIl317j4jiqoJgOO4oESIHzu0abN/wXL9l0EY3Ies=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aVHLsyvOWP+kNWbam7Tzo8XFBXpS13rzOknrm9cfpuvzhC+LIv/jiBJJCBvHhMHJV
	 qkeRQSgZYZIx5ci0Cpz93Qet9TDxTvkxuXp4axZajQeQIsf3skDOvNPpPpZOhOL48I
	 6BlL/FfpNgXaqM4tRvtCmJf4k7HqKBNM8jnZzNy6Ci4oJkZpH1h0+VFOw6Pp4w53Rm
	 R2yVW4TX03ZXeYfhUcQtuR8TQVpXZxrMC2CkPxiqRPMS+Iiz9wURzXqpB/WtbpLYom
	 ZeBd3NnBzmEsHDOtEYxnoiYUCEPr9bqSpZOgrufWVzE1vUbv4nbtPwW49rZXTmGD6q
	 TY535/rH79KRg==
Date: Tue, 8 Apr 2025 12:37:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Prabhakar <prabhakar.csengg@gmail.com>, Thierry Reding
 <treding@nvidia.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwc-qos: use
 stmmac_pltfr_find_clk()
Message-ID: <20250408123755.1077e29b@kernel.org>
In-Reply-To: <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
	<E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_203759_481242_763B6802 
X-CRM114-Status: GOOD (  14.22  )
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

On Mon, 07 Apr 2025 19:38:49 +0100 Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index cd431f84f34f..f5c68e3b4354 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -34,16 +34,6 @@ struct tegra_eqos {
>  	struct gpio_desc *reset;
>  };
>  
> -static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
> -				    const char *name)
> -{
> -	for (int i = 0; i < plat_dat->num_clks; i++)
> -		if (strcmp(plat_dat->clks[i].id, name) == 0)
> -			return plat_dat->clks[i].clk;
> -
> -	return NULL;
> -}

Missed one user?

drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c:355:25: error: call to undeclared function 'dwc_eth_find_clk'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  355 |         plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
      |                                ^
drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c:355:23: error: incompatible integer to pointer conversion assigning to 'struct clk *' from 'int' [-Wint-conversion]
  355 |         plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
      |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
  356 |                                                 data->stmmac_clk_name);
      |                                                 ~~~~~~~~~~~~~~~~~~~~~~
-- 
pw-bot: cr

