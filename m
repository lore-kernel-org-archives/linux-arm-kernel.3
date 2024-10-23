Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E9FCDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6DHJTSut709W1gvwIcBTYBpQuJJJtP9e3Awce/8V+w=; b=OjS8BZKwlkZbWAaYmapXdfMnRH
	A8tWeNHzeloj8N/Mg608eyc5otNgBqYdWOaV4fd4ix4Cs1vnmaOaU2upfD6zsbyljk8yaPo6x8zNS
	SBgFwFWxG4PBMpsF9BrhQU40P4na6ixTNOz4Q7O76p4P6d5AVlJn/ohHEC56trBgdH+/DhmLJ/LBt
	0igTPEOoC4If401ZDM3fzEoK7Q3HiMKa4ZZFPXxMI2f63gSZh02JNKm0xiGjMFbZuUTA+VYd+6jm4
	ScYaLJ+r/9QUQqTYvrwyyK9yW7q/FBX1Z9BVRva+cX/yxlrujkIjwWrXBylnAwM1W0jgyqrjfWCoZ
	9nF1/2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zq9-0000000ECln-0os2;
	Wed, 23 Oct 2024 11:47:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZDM-0000000E5gl-2MVL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6731E5C5C6B;
	Wed, 23 Oct 2024 11:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF01C4CEC6;
	Wed, 23 Oct 2024 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729681663;
	bh=lVH6MnxKITbbLVTwdZBysRiSQtubnhnYeW4+iV/DjdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3nkyUXpCIUw60Ut1ahkxfsb6ko2wlwoKm8v7ip68Yc9G/pNXB9f5GYPYI+nxDgJB
	 Myycd0ohPbxwgWoYNYuiTI6HXwa7kUnO0MXVz8kx6NiOk3q2xTNv6XfqYEWU/nIhzA
	 KwjW+P0DjmO0t00/ja5zTvi+NyD0WXlygeRP9noMs171EY/zM5p0u/zctG9N4qZfSa
	 oCIt4meSaexNvxxqb5cwZZUUydunkS2Iyn7ue/56NR2hCE++w2kuOdnFZC43Gkfsst
	 WXxWPh+Z8hP0tBFaP9UPc/OcR7IZXPqSgs5xSsg8RABN9bfysnxqJ7vs8tighnobeW
	 JQkCZmiwbttlw==
Date: Wed, 23 Oct 2024 12:07:38 +0100
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	lftan.linux@gmai.com, Corentin Labbe <clabbe.montjoie@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net v3] net: stmmac: dwmac4: Fix high address display by
 updating reg_space[] from register values
Message-ID: <20241023110738.GM402847@kernel.org>
References: <20241021054625.1791965-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021054625.1791965-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040744_729512_56AB7E13 
X-CRM114-Status: GOOD (  18.69  )
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

+ Corentin, Giuseppe, Maxime, Andrew, linux-arm-kernel, linux-stm32

  As per output of get_maintainers.pl FILE.patch
  Please consider doing likewise in future.

On Mon, Oct 21, 2024 at 01:46:25PM +0800, Ley Foon Tan wrote:
> The high address will display as 0 if the driver does not set the
> reg_space[]. To fix this, read the high address registers and
> update the reg_space[] accordingly.
> 
> Fixes: fbf68229ffe7 ("net: stmmac: unify registers dumps methods")
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
> - Split the patch series to net and net-next. Submit this patch for net.
> - Rebased to net https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
> 
> v2: https://patchwork.kernel.org/project/netdevbpf/cover/20241016031832.3701260-1-leyfoon.tan@starfivetech.com/

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 8 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index e0165358c4ac..77b35abc6f6f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -203,8 +203,12 @@ static void _dwmac4_dump_dma_regs(struct stmmac_priv *priv,
>  		readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_RX_CONTROL(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_TX_BASE_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_TX_BASE_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_TX_BASE_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_TX_BASE_ADDR(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_RX_BASE_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_RX_BASE_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_RX_BASE_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_RX_BASE_ADDR(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_TX_END_ADDR(default_addrs, channel) / 4] =
> @@ -225,8 +229,12 @@ static void _dwmac4_dump_dma_regs(struct stmmac_priv *priv,
>  		readl(ioaddr + DMA_CHAN_CUR_TX_DESC(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_CUR_RX_DESC(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_CUR_RX_DESC(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_CUR_TX_BUF_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_CUR_TX_BUF_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_CUR_TX_BUF_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_CUR_TX_BUF_ADDR(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_CUR_RX_BUF_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_CUR_RX_BUF_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_CUR_RX_BUF_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_CUR_RX_BUF_ADDR(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_STATUS(default_addrs, channel) / 4] =
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 17d9120db5fe..4f980dcd3958 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -127,7 +127,9 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  #define DMA_CHAN_SLOT_CTRL_STATUS(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x3c)
>  #define DMA_CHAN_CUR_TX_DESC(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x44)
>  #define DMA_CHAN_CUR_RX_DESC(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x4c)
> +#define DMA_CHAN_CUR_TX_BUF_ADDR_HI(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x50)
>  #define DMA_CHAN_CUR_TX_BUF_ADDR(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x54)
> +#define DMA_CHAN_CUR_RX_BUF_ADDR_HI(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x58)
>  #define DMA_CHAN_CUR_RX_BUF_ADDR(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x5c)
>  #define DMA_CHAN_STATUS(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x60)
>  
> -- 
> 2.34.1
> 
> 

