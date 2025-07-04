Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EBAC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRrkF+5u2Segu2R8OpXKHPbVgWWv6mdID8dA/YQ2gig=; b=yUHvB/eVjuslTuUrVVaPi0EBVE
	84wFH3cylxJ1BKtxcYliT7U6+vS55xrUALz54YOH/VsytFfR9Pe8Fby1rVYEcaMGme80gS8J1I6Ad
	iE1H1+9rkvxL3IBJn+xpW/VhosEu1t8ODc0eKu0Nj4AdCOFDOzXbJmrES36jLN5w/7w9V6OBxOcM5
	1bVuwayZcg7FE9JaEQoiUFpSYrTPePf/anshlVvc4YJCA0D6Lq0rDpYmEBkMAXOi3ckXUrm95HwCj
	erd/KaIfs0xi7+s7MidrNFNEC+fdSdXYtpqgVY/ms9uLRgIASqp/o4JVgNqO/JW7xTdWJi/u0Fi12
	mt+4Xyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXlIV-0000000FFXw-3cF0;
	Fri, 04 Jul 2025 18:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXlG9-0000000FFJz-2roY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 18:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C95A45C69CD;
	Fri,  4 Jul 2025 18:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB0EC4CEE3;
	Fri,  4 Jul 2025 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751654140;
	bh=U9geYByHsf8enlHJPpCq7QpmK+9AHfjGM5nRLkE02tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGzz2/Y8p6yKxIIBQzuSGWV8tUC8IUNJPRS2gz/LHrY9js/7JdC8k4glofIqp77h+
	 YSDivQepATF5uokXAGpsaPrQMQNYRAg2Ff43bRvt0fx666/2Cc2yY1d9XNbUp1ll66
	 R/DA0QcoAqY9AeVIAm3TAA3NI/JmmMAR1cbhlWScjaM3ayyYBAg6R8tPI+D2vgYDVY
	 LvOoAyF2FnzxKMD0Qb08KGndQVSSKUxAt89fhqlWLyEChOwaUAecHeByOuy+Fbhx4t
	 tpBkrHRSB2vyQf5abCd+iQYhpUcXDUVmvhX0Eg71Dc9Kf22Gh6+GyCxyBhhPZp0vyi
	 YTtWjjNLcqUCw==
Date: Fri, 4 Jul 2025 19:35:34 +0100
From: Simon Horman <horms@kernel.org>
To: EricChan <chenchuangyu@xiaomi.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	xiaojianfeng <xiaojianfeng1@xiaomi.com>,
	xiongliang <xiongliang@xiaomi.com>
Subject: Re: [PATCH v2] net: stmmac: Fix interrupt handling for
 level-triggered mode in DWC_XGMAC2
Message-ID: <20250704183534.GA356576@horms.kernel.org>
References: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_113541_762884_44DDCE52 
X-CRM114-Status: GOOD (  18.20  )
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

On Thu, Jul 03, 2025 at 10:04:49AM +0800, EricChan wrote:
> According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
> v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
> to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
> in level-triggered mode. However, in this configuration, the DMA does not
> assert the XGMAC_NIS status bit for Rx or Tx interrupt events.
> 
> This creates a functional regression where the condition
> if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
> never evaluate to true, preventing proper interrupt handling for
> level-triggered mode. The hardware specification explicitly states that
> "The DMA does not assert the NIS status bit for the Rx or Tx interrupt
> events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).
> 
> The fix ensures correct handling of both edge and level-triggered
> interrupts while maintaining backward compatibility with existing
> configurations. It has been tested on the hardware device (not publicly
> available), and it can properly trigger the RX and TX interrupt handling
> in both the INTM=0 and INTM=2 configurations.
> 
> Fixes: d6ddfacd95c7 ("net: stmmac: Add DMA related callbacks for XGMAC2")
> Tested-by: EricChan <chenchuangyu@xiaomi.com>
> Signed-off-by: EricChan <chenchuangyu@xiaomi.com>
> ---
> Changes from v1:
> - Add a Fixes tag pointing to the commit in which the problem was introduced
> - Add the testing results of this patch
> 
> [v1] https://lore.kernel.org/all/20250625025134.97056-1-chenchuangyu@xiaomi.com/

Thanks,

I note that this addresses the review by Jakub of v1.

Reviewed-by: Simon Horman <horms@kernel.org>


