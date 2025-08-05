Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF06C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 20:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbozQ5eb6PcVUwBolIHH3QT1e0huwx5MzGVQtjAVjFs=; b=NwnrvLQ1QyZCZTABZd4E81rt5U
	IOPgvnBpE0+nrm8oqdRdycVgvBlvEQldtaEq+TJc2g/Z5QjAFD53ubt7ig8QkxGFrjTs8H9HrXOIA
	fEAYL2++Vu6cm4kwQC9I9UA3RqkTfTIi/bTbppQCoBpaBBwN3MorvN9JyssfjpHkKMM7HONvpPvwm
	qMj/jxeBQJhbb4odTEd0PJPdtghOPDI8AviSpNtCU3fbzH+QW/PH0N+j5b0rjxA9TU7Rm9mljpGJf
	0wM2laq9ZRL1e5vSDlZKnfiRfKbLZLRvhPehP+W0MYh6XbjddflLiHWEwwCtpwGTfrEJDPzMXUHYj
	9A5EvuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOTu-0000000DlyR-3apQ;
	Tue, 05 Aug 2025 20:41:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujORK-0000000Dlkb-0lgM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 20:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC95CA5672E;
	Tue,  5 Aug 2025 20:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071A7C4CEF0;
	Tue,  5 Aug 2025 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754426356;
	bh=VC9sMCvyq68QKkGDQO5hx+0ig5esATmGOVbDNnZWolQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ri6Zp74nT46FUbiLR+aaF791iBqAIektiiglVIX3fe2E/4UfAV9nH0toKROhO/swk
	 GQbqDMw6bDNyW/cMs55U8fZaFdSXVneaKyoeneYYe5OECAXd7YUo2m+lppas/4dfH+
	 lNdFXgn/KCiau605XR1FMYrrxdJdWOu3Z6TS3hhOa6/4JhISFXdtxlHARbe4+AOJrI
	 HCXHFo/wzPdQtzClZ1RhC2Vo9VU3aLXN42leZlVAjhcrqfs/uAARMhlNqqKb5LlpWO
	 3ul5jSm5+E4LEmvvVmgrKk4NYJb+PcvRMYHaUuijNFWOHZVU/vPt3xWwcTAX9bevNw
	 LvNJ6P6LlK0Pw==
Date: Tue, 5 Aug 2025 21:39:12 +0100
From: Simon Horman <horms@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH net-next v4 6/7] net: axienet: Rearrange lifetime
 functions
Message-ID: <20250805203912.GE61519@horms.kernel.org>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-7-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-7-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_133918_293948_16B3A412 
X-CRM114-Status: GOOD (  12.27  )
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

On Tue, Aug 05, 2025 at 11:34:55AM -0400, Sean Anderson wrote:
> Rearrange the lifetime functions (probe, remove, etc.) in preparation
> for the next commit. No functional change intended.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

...

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h

...

>  /**
>   * struct axienet_local - axienet private per device data
>   * @ndev:	Pointer for net_device to which it will be attached.
> @@ -549,6 +572,7 @@ struct skbuf_dma_descriptor {
>  struct axienet_local {
>  	struct net_device *ndev;
>  	struct device *dev;
> +	struct axienet_common *cp;

nit: Please add cp to, and remove axi_clk and regs_start from
     the Kernel doc for this structure.

     Flagged by ./scripts/kernel-doc -none

>  
>  	struct phylink *phylink;
>  	struct phylink_config phylink_config;
> @@ -558,13 +582,11 @@ struct axienet_local {
>  
>  	bool switch_x_sgmii;
>  
> -	struct clk *axi_clk;
>  	struct clk_bulk_data misc_clks[XAE_NUM_MISC_CLOCKS];
>  
>  	struct mii_bus *mii_bus;
>  	u8 mii_clk_div;
>  
> -	resource_size_t regs_start;
>  	void __iomem *regs;
>  	void __iomem *dma_regs;
>  

...

