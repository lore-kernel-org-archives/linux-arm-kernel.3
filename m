Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35FDCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GghAiccn5VGLhBOpxNOj7JW4Jxm7wI8TZCZyhoxmts4=; b=dAnog1GU8qPmSsIFctfhtoCtYD
	OWHezymTo8Iog0DdMkMhtDNJT5gkn9UiXA1qPe/4ibzUmGBjpuZ5bCkOldM/40oM4BlbG8gPcVGMJ
	ZlvYZNkLOx/CL0sEHSTHuI5P0haDoNzoLg9ZrN+Zb8WuxjElYkUpeiyD8vxuW1FaV/HQm9h7oGpy2
	CpK0peZYZM+bS6ySNNZEeb6saIeb8pEk93Ppx9WzU8zNVIs5V91h5vOd6Bis04i8NOPkttNxnq60v
	xvz7SzJI3TpKG/1vLdYm0CM9z9KQZjFeVkG7Lu1zoc5cauQYl/XdfZKJAZAoOROgvCf4NWZpleKVE
	9Lo7CcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYCW-0000000648E-25x6;
	Mon, 10 Nov 2025 20:09:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYCU-00000006487-3919
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 20:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF1636019D;
	Mon, 10 Nov 2025 20:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50174C4CEF5;
	Mon, 10 Nov 2025 20:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762805357;
	bh=0iOhbGLxfSoLRBYgw+mP+RQa87LiNVPt6z/z3LThk5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcpUyVdmcLgbVnPvtvG5sn+9VBwKYizaBkOPJ4X74CZDnGzJtx7BAJ+tIxFT21Fc3
	 kuqmvrJf3ya8gDyeZhjrs97LF4iKzBJX+0qjLU2uDBpRj33RsHW7WQe0f1a6wMULsK
	 MHACPV9+uXAHvFPFb8X1myONhP1kPiEGf/spaX/s4HySFB9r8akxvZuqLJRMmHyzOj
	 WQUq3suhO1/hWXwR5IdxvwzYWwP5s0d0pAsX0p+V74Gc+MZCCi+JLZEkAY6sRJwvNO
	 mRp3nvkU4CihCyV3xqso5fKJMu09coOWxk01X2N2w3NYFxPA5T4LgFDolk3DbjgZ0F
	 1MBO1cOUQqWug==
Date: Mon, 10 Nov 2025 20:09:10 +0000
From: Simon Horman <horms@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <aRJGZjgTgcjZgIqe@horms.kernel.org>
References: <20251107111715.3196746-1-inochiama@gmail.com>
 <20251107111715.3196746-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107111715.3196746-4-inochiama@gmail.com>
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

On Fri, Nov 07, 2025 at 07:17:15PM +0800, Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be removed
> when initializing the mac, otherwise the phy will be misconfigurated.
> 
> Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

...

> @@ -50,11 +56,23 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	data = device_get_match_data(&pdev->dev);
> +	if (data && data->has_internal_rx_delay) {
> +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> +									  false, true);
> +		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
> +			return -EINVAL;

I'm sorry if this is a false positive. Because, more so than Russell [1], I
confused about how about the treatment of phy_interface. But it seems that
there is a miss match between the use of phy_fix_phy_mode_for_mac_delays()
above and the binding.

The call to phy_fix_phy_mode_for_mac_delays() above will return
PHY_INTERFACE_MODE_NA unless phy_interface is PHY_INTERFACE_MODE_RGMII_ID
or PHY_INTERFACE_MODE_RGMII_RXID.

  phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
						bool mac_txid, bool mac_rxid)
  ...
	if (mac_rxid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII_TXID;
		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}
  ...

Looking at phy_modes(), unsurprisingly, the following mappings occur:
* "rgmii" -> PHY_INTERFACE_MODE_RGMII
* "rgmii-id" -> PHY_INTERFACE_MODE_RGMII_ID
* "rgmii-rxid" -> PHY_INTERFACE_MODE_RGMII_RXID
* "rgmii-txid" -> PHY_INTERFACE_MODE_RGMII_TXID

And in the binding, patch 1/3 of this series, only phy-mode rgmii-txid or
rgmii-id is allowed.

But if rgmii-txid is used, PHY_INTERFACE_MODE_RGMII_TXID will be passed to
phy_fix_phy_mode_for_mac_delays(), which will return PHY_INTERFACE_MODE_NA.

Again, I'm confused about the mapping in phy_fix_phy_mode_for_mac_delays().
But there does seem to be some inconsistency between the binding and
the driver implementation here.

Flagged by Claude Code with https://github.com/masoncl/review-prompts/ 

[1] https://lore.kernel.org/all/aPSubO4tJjN_ns-t@shell.armlinux.org.uk/

...

