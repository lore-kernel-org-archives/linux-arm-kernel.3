Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB3BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0N+ZrcA6krV10K6bTfQdk8wc9i24Hjdh5v0wcjrSLs=; b=WA/QXK6tbyS49O8N0injrJ4VAe
	BVymf0OFxwKBBTrpzJ5SO99hOZz/eK7BPKp1m/5YUg1C+KS5vJ+n6e6Pwlf6QJYW1Zyfl3YDAcXb1
	iStMo91rVKvckHNGNF4nMGuk9KVSBzuuZh02/vP5x5DtwtfHiEB245v6iaTFLz3022Rd7ylIQICj0
	QxyjelJ7dZ2sSDa7hU/eHqMvdWX6WLQIsqDaY3cKd0ap5mpgE7qZaCSSxqbqQ0gxQqj58igQEYkLq
	rV8dKMrSi8juN1f1ZAZC1mCFDhD/nl5TIsFE9cTZrSYPeHGS9yvDXrozUyRZi700NYr3tDA91NxKR
	ZkKuL/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJcj-00000002NDD-2kMo;
	Mon, 14 Jul 2025 13:53:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJSH-00000002LOJ-1eq3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=t0N+ZrcA6krV10K6bTfQdk8wc9i24Hjdh5v0wcjrSLs=; b=o9snk7CRkLQssnn3PEHd9K4Sh+
	C07WQDruJICyhgeokACJ7umEuGahIpsER59n8X89FmzJ7DvTg6BqwjoAzsMGZm6A9TDL9sOdzJSB0
	PvvNXEcbejJlHGLoMcDY7U3mO67GAl1ORZXmeXJ/i9Ss6/4Ki/Qf8D2UUJ3loUBMmftE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubJS7-001Sne-Q2; Mon, 14 Jul 2025 15:42:43 +0200
Date: Mon, 14 Jul 2025 15:42:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
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
Subject: Re: [PATCH net-next 2/3] net: stmmac: xgmac: Correct supported speed
 modes
Message-ID: <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_064253_430096_146757C7 
X-CRM114-Status: GOOD (  13.13  )
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

On Mon, Jul 14, 2025 at 03:59:18PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Correct supported speed modes as per the XGMAC databook.
> Commit 9cb54af214a7 ("net: stmmac: Fix IP-cores specific
> MAC capabilities") removes support for 10M, 100M and
> 1000HD. 1000HD is not supported by XGMAC IP, but it does
> support 10M and 100M FD mode, and it also supports 10M and
> 100M HD mode if the HDSEL bit is set in the MAC_HW_FEATURE0
> reg. This commit adds support for 10M and 100M speed modes
> for XGMAC IP.

> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -405,6 +405,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
>  	dma_cap->sma_mdio = (hw_cap & XGMAC_HWFEAT_SMASEL) >> 5;
>  	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
>  	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
> +	dma_cap->mbps_10_100 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;

The commit message does not mention this change.

What does XGMAC_HWFEAT_GMIISEL mean? That a SERDES style interface is
not being used? Could that be why Serge removed these speeds? He was
looking at systems with a SERDES, and they don't support slower
speeds?

	Andrew

