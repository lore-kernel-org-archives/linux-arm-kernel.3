Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557C2FD877E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D2bMsro2kEet+e29i4SHAY/L/XBQ03iLza3MROfK/Y=; b=15LF2cwBz0Dtq2GeDeH5gMNXd4
	N32qTGOayOK+a1RvmJRaQNSS5TkiZy4LbcdO0j+VLHszi0duWa8+XiJU00MYG9w/wkICkF1UZLY1j
	mQGTGZVu/E2ayXH5jKxSaVoDDHK5vn2eD4UBVKR6HyJ2MkP89FB1clygxTdpWL13SCLqzzBnHGpms
	btxVtXkzMA1GWjKA/ijJ3HrlhZOldzi7BQzCdPtHX11NKIkZ67TLZ459dhavWiVfpGPEAVhAgFIM8
	W1niyk7hW1ul3mvJqdpIBsyIxfxGXgEbZaSG/WGPm749nsJjq02biD++k4gHzRnma85myJVtgFk5D
	8CwhYCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VSX-00000006cSQ-3m2B;
	Tue, 17 Mar 2026 14:31:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VSV-00000006cRH-00Hj;
	Tue, 17 Mar 2026 14:31:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F366143923;
	Tue, 17 Mar 2026 14:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C06C2BCAF;
	Tue, 17 Mar 2026 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773757905;
	bh=FB0uLOtKw+Ms4Y4cq/DdYMe4SYVdJKlookY5qKPtMyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU9HzRrTPqZ7cl634CR6s0CEwBEj6S6ljyyq/9cWDIpAP7mafFPvyu6MLv0Yjvk4X
	 hH7zRs254F428Isd7Tps7rp0Gdit+XOWkPlNeD36C0WjrRNQOqKrl2+6ba0RDwqy2O
	 autJJ03bhMv1gF5QzXhABFo6xNjQcUltP9KJttLKtgk/tbgjA4tXLekseVbM8nh3Qf
	 WOxfl+VS4vlSuuL/wZuQJmfvibYTCmAKLV7XESCVE56RNGw7nyghnnZJ98CK9roXJK
	 7z/mEXRm5Dzsr3yBMCn2FHvftMLpVHuJlooiGb4O2ldOmGA9XXJ/TbD1GfVmT+SXNq
	 OyJrCOYfBIQjA==
Date: Tue, 17 Mar 2026 14:31:41 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: select QDMA block according
 LAN/WAN configuration
Message-ID: <20260317143141.GA1710951@horms.kernel.org>
References: <20260313-airoha-qdma-lan-wan-mode-v2-1-7d577db6e40c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-airoha-qdma-lan-wan-mode-v2-1-7d577db6e40c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_073147_061450_2E743503 
X-CRM114-Status: GOOD (  17.29  )
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

On Fri, Mar 13, 2026 at 05:28:36PM +0100, Lorenzo Bianconi wrote:
> Before this patch even GDM ports were assigned to QDMA0 while odd GDM
> ports were using QDMA1, so, based on the DTS configuration, both QDMA0
> and QDMA1 can theoretically receive traffic destinated to the host cpu
> from LAN or WAN GDM ports.
> Airoha folks reported the hw design assumes the LAN traffic destinated
> to the host cpu is be forwarded to QDMA0 while traffic received on WAN
> GDM port is managed by QDMA1. For this reason, select QDMA block according
> to the GDM port LAN or WAN configuration:
> - QDMA0 is used for GDM LAN devices
> - QDMA1 is used for GDM WAN device
> 
> Assuming a device with three GDM ports, a typical configuration could be:
> - MT7530 DSA switch -> GDM1 (eth0) -> QDMA0 (LAN traffic)
> - External PHY      -> GDM2 (eth1) -> QDMA1 (WAN traffic)
> - External PHY      -> GDM3 (eth2) -> QDMA0 (LAN traffic)
> 
> We can then bridge eth0 DSA port (lanX) with eth2 since they all tx/rx
> LAN traffic.
> 
> Please note this patch introduces a change not visible to the user since
> airoha_eth driver currently supports just the internal phy available via
> the MT7530 DSA switch and there are no WAN interfaces officially supported
> since PCS/external phy is not merged mainline yet (it will be posted with
> following patches).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Update commit log.
> - Link to v1: https://lore.kernel.org/r/20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>


