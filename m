Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562E1C56207
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glnVZ1vMZv9aWF2wKZdYdswnC52ACNG6S8Ew13Mey4U=; b=AfYhnHLTgrEZ/2hfSHwEO1WbgL
	RqCUKKMI069fJyJw9jujK0ECd99bVLRXEC1b5sa4eVy7i6BLjMKIaxD0b9y+NliBJzwAbB4+v2CtB
	LqwNjmw2eCDqKSnhb1f/T2rEjsKku40D8HBuQ5bXpTN6ii4cl3I+rjrUq2RyFuzJKY5d4GFohjp+T
	bvn3NOgcxbbM/ac4lV00HttVn6XGShyRlVBPjCN4CCtUknSMSjmyrOyIgb8NKhw2rOi4GS2anZdQF
	vNLyMHkw/EjI0WzjpiGutLs9jQOT/s99U9u/UTM7y0rO/4gBrH+bR1je5X+LTY2xdsIyuy7h6XSsf
	tufzMGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSBr-0000000Exv6-0p81;
	Fri, 20 Feb 2026 15:13:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSBo-0000000Exsk-0zvv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=glnVZ1vMZv9aWF2wKZdYdswnC52ACNG6S8Ew13Mey4U=; b=bu7NjwTuqCQKObShYzfB2fAsDD
	yztfSUs+GKhARZ6yLw1yBpDA9f6HpeGy86k+DZhaaN0LQVSvZQ8/A/wEYuMMANgJGD+Tb04Rq0EbP
	jIE8Mo7cpxjuW+oxEQ1F6xU4pZwegPqodjR63cWvWT83ne0i0sQS19U1wfrKr6R8822k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtSBf-0085Nd-SQ; Fri, 20 Feb 2026 16:12:59 +0100
Date: Fri, 20 Feb 2026 16:12:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git@amd.com
Subject: Re: [RFC PATCH 4/8] xilinx: tsn: Add Ethernet MAC (EMAC) and MDIO
 support to the TSN driver
Message-ID: <39ae9c0f-d832-4771-8177-838995fff4da@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-5-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219054911.2017362-5-srinivas.neeli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_071308_292826_2864F0F2 
X-CRM114-Status: GOOD (  12.54  )
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

> +#define TSN_EMMC_LINKSPEED_10		0x0	   /* 10 Mbit */

If the MAC cannot do 10Mbps, why have this?

> +static int emac_open(struct net_device *ndev)
> +{
> +	struct tsn_emac *emac = netdev_priv(ndev);
> +	struct phy_device *phydev = NULL;
> +
> +	if (emac->phy_node) {
> +		phydev = of_phy_connect(emac->ndev, emac->phy_node,
> +					tsn_adjust_link_tsn,
> +					emac->phy_flags,
> +					emac->phy_mode);
> +		if (!phydev)
> +			dev_err(emac->common->dev, "of_phy_connect() failed\n");
> +		else
> +			phy_start(phydev);
> +	}

Somewhere around here, i would expect you to tell phylib the MAC
cannot do 10Mbps. You don't want the PHY offering those speeds for
autoneg, otherwise it might actually negotiate 10Mbps.

I also think you should be using phylink, not phylib. But we first
need to finish the discussion about DSA vs pure switchdev. If this
ends up being a DSA driver, you will be using phylink anywhere. If it
is a pure switchdev driver, i would still recommend using phylink, you
are less likely to get things wrong, because the API is better
designed.

    Andrew

