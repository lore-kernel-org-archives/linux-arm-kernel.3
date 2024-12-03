Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D883E6C5E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 00:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU2hy9sEFcn9zqXCqwnzT2rgECK7e0OcNEISZ4p7Kk0=; b=lfjblIYKCLYu3tGAyqfZGrbssP
	nmNPXu/MARKm8x5HPd7cz0+qsRDy7pF+jAVxQWr9gHM+LBwpe4/9zgxZBMhiYQxg8lVnILo4D2cIe
	GO1vurcm9pm8lGNdN0nd1CZL+aUolXTHV9QrTFP++aP1vlbe1j0I5vN0QIr8bYij2eL9fshuuFeUD
	PF8gR2NPgmFCKhyrfjYWoe1i5hUCyLr+NC2lbCYNAilus+LER2p0sCEeWxGM/rEF46ms7hp6H38PU
	Fmd66UIUSoKt5UAmFdfFqCXmQ9lj/C/7d1SRggcBTIBseqryrpttqarRZsjyHE4NrLkK22h9iSLXU
	QZRtCWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGrn-00000007pOd-1hFf;
	Tue, 03 Dec 2024 00:34:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGqm-00000007pGB-46Ko
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 00:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DF1FA4133F;
	Tue,  3 Dec 2024 00:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0433C4CED1;
	Tue,  3 Dec 2024 00:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733185991;
	bh=P+cKs927/DzHr7RXmSOFRn/pT0qYBrswblnynVURMiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e4NCaqBHn0r9TX+saVe2U42+z147y9cdC8ZqLiVtF1Yo2vKYdm5706b8l6NhTT0lG
	 aCoFRkZo/8LOiRyNpfGg6d2MLfgnzpXSle4VVoH0Uh08Rw2aWjJGEpj+9y9Nh8Dgxh
	 R91ouvGM5u6ylzIkH+YDw6+8qokCxXCn5q9quqtsB/O2Gg5IO/F+Qur+1QBIxpWday
	 QCqmAkoTzyzV3KD3Ts+V0yjuNt1/Ey1sMSQfpSGL4PF5nSNRuL+YLJWo9RDJ6PlzFi
	 tRwGY7Ie+ybLDWjFlRwYe3vOQehxOKL4h/1nEh6w728JU7cPazg3zrEvo77/Iy7BUQ
	 LRKjnQriXpnaA==
Date: Mon, 2 Dec 2024 16:33:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Thierry Reding <treding@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
Message-ID: <20241202163309.05603e96@kernel.org>
In-Reply-To: <20241128144501.0000619b@gmail.com>
References: <20241021061023.2162701-1-0x1207@gmail.com>
	<d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
	<20241128144501.0000619b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_163313_092281_BF5ED5B2 
X-CRM114-Status: GOOD (  14.94  )
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

On Thu, 28 Nov 2024 14:45:01 +0800 Furong Xu wrote:
> > Let me know if you need any more information.
> 
> [  149.986210] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> and
> [  245.571688] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> [  245.575349] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> are reported by stmmac_xmit() obviously, but not stmmac_tso_xmit().
> 
> And these crashes are caused by "Tx DMA map failed", as you can see that
> current driver code does not handle this kind of failure so well. It is clear
> that we need to figure out why Tx DMA map failed.
> 
> This patch corrects the sequence and timing of DMA unmap by waiting all
> DMA transmit descriptors to be closed by DMA engine for one DMA map in
> stmmac_tso_xmit(), it never leaks DMA addresses and never introduces
> other side effect.
> 
> "Tx DMA map failed" is a weird failure, and I cannot reproduce this failure
> on my device with DWMAC CORE 5.10a(Synopsys ID: 0x51) and DWXGMAC CORE 3.20a.

Let me repeat Jon's question - is there any info or test you need from
Jon to make progress with a fix?

If Jon's board worked before and doesn't work with this patch we will
need *a* fix, if no fix is provided our only choice is revert.

