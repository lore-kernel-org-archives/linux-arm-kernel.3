Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C153DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Egy3EPKBk6oRpiE27WiooTXD/w6easxQxruIYurulus=; b=cQdFzoXMJzprgRqifMwffx0Cz3
	vh/NDywkckzIcZltXIaCR1/TP/3wHPRiL2XSDIdzrpi1HpBPCJMp9f1CoR009LWn4JPvxpjBnVOrA
	4eZRnMYvjhnSXiHRofxUNKeBjM+sotWvFmmBvJzEDbbUepx+JqBTVtUaLibzBvPttRk05qw/AnLh8
	xuTXX6IF+5fkkaAFqKCZdVNnxuQlftsrWZx9hUWB9w3fN+ELPk1w8U9+2yAOOpZT4HJJB5tPNg3RH
	tQylumZh6JIQTBU8/t2HsXs7mBaWm0haOOUyCAKAYY8JdRBjp0Wcr0H3xogL2HNSXzX8DXU1NhssK
	yVk3yo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJaJ-00000002MoN-14Wg;
	Mon, 14 Jul 2025 13:51:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJPm-00000002KqU-120w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6D7E439B0;
	Mon, 14 Jul 2025 13:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC30CC4CEED;
	Mon, 14 Jul 2025 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752500417;
	bh=ZbTnyFu2wdFpma2HJU3wztP0Nr+eewvviXPIjhzHS7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9OMVAFaYpKkEUo00VozeeMaavQOzwZLjAlgLt8ICUjTf1vDJGPmPiVM3dxUiQT8W
	 4VRwcoLQPJ6JrniWAoHeMOl0Y7I99B7kBMzoowssvE7vvbJD99wGH+WqyeduyxvpiE
	 LFyTzOvhFSUSJalcrHQy3+4qT/AwKsvDWEJMVZJ9ttMUJkd+Zn1hL7vUYIym4+A5lG
	 Nbg4PYgM5l/qXtq27N0m06xeSHOQnvTqco088zagti/MB+TNyP4Zi51PU8IHExyzn7
	 /cSLgh9xO92hCf5ggN+Sa9BM4yu/tdDtKQgIgmfTrwZUDTk//QGnPMaS3QdxcHdY74
	 WwgdJjslLUiQg==
Date: Mon, 14 Jul 2025 14:40:12 +0100
From: Simon Horman <horms@kernel.org>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Set CIC bit only for TX queues
 with COE
Message-ID: <20250714134012.GN721198@horms.kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_064018_307633_7D6F72B9 
X-CRM114-Status: GOOD (  13.78  )
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

On Mon, Jul 14, 2025 at 03:59:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Currently, in the AF_XDP transmit paths, the CIC bit of
> TX Desc3 is set for all packets. Setting this bit for
> packets transmitting through queues that don't support
> checksum offloading causes the TX DMA to get stuck after
> transmitting some packets. This patch ensures the CIC bit
> of TX Desc3 is set only if the TX queue supports checksum
> offloading.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Hi Rohan,

I notice that stmmac_xmit() handles a few other cases where
checksum offload should not be requested via stmmac_prepare_tx_desc:

        csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
        /* DWMAC IPs can be synthesized to support tx coe only for a few tx
         * queues. In that case, checksum offloading for those queues that don't
         * support tx coe needs to fallback to software checksum calculation.
         *
         * Packets that won't trigger the COE e.g. most DSA-tagged packets will
         * also have to be checksummed in software.
         */
        if (csum_insertion &&
            (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
             !stmmac_has_ip_ethertype(skb))) {
                if (unlikely(skb_checksum_help(skb)))
                        goto dma_map_err;
                csum_insertion = !csum_insertion;
        }

Do we need to care about them in stmmac_xdp_xmit_zc()
and stmmac_xdp_xmit_xdpf() too?

...

