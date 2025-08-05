Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A4EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ehg7mtVEZG5GkLeNFV5NybHMZ76+3RE7nNoKJBi39vM=; b=DfbP/+18way0bSKEIAsvPuv4J2
	nLZ1eOqJe3iFyxqTIc2+jmLGqC6oiIub2GZL1JQOpwaFcZc4Fdx4QgpR8svhY5Tg5X5L9uFsvpel6
	aNCo1FVPJk7MjbA1SFR24DN4X9FM9MbggFuG87Wx5VAiyLLHJ8hZVCoHFY8fz3jgniny4DsimXjO8
	zAmfyg8rE2C8hZT3ACfikX4RgSH35Dedb+ghe5HhW+zcRnlfC3vVHBqfWcUQnM3q7i9C1IuJejMUr
	swzZwKvHjtXRKHAz1Czwu+C09d0d5Mzmv7SiESnnFMOhIn31xbcU4ztk3NLJDEPDfXqjYM5/xk6nr
	m1DS+0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPJC-0000000Dq4L-3jaV;
	Tue, 05 Aug 2025 21:34:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPGc-0000000Dpoj-1Q6W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ehg7mtVEZG5GkLeNFV5NybHMZ76+3RE7nNoKJBi39vM=; b=UmmtEqGoQCHJCUJD2FPuSpUcxJ
	kEDJzF3QrGcSGTcRZP4Tm21LpfrkrbMshAqMWfQWUDCS3NDRs9oYEDR7cw+uHekZQ/MiQHVsF8B4i
	01H8w1v0bMNseWAHoGcrzkEP7+9yNXGgHyAuJsL8MefLvCR0a0gVr/v8RGNVSOjI77v8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujPGX-003pQr-Ib; Tue, 05 Aug 2025 23:32:13 +0200
Date: Tue, 5 Aug 2025 23:32:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <69b08e90-ae99-43fd-9779-dd5497a26e1f@lunn.ch>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-7-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-7-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_143218_382573_A17537DD 
X-CRM114-Status: GOOD (  14.97  )
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

There is a lot going on in this patch. Can it be broken up a bit more?

The phase "No functional change intended" generally means, its the
same code, just in a different place in the files. This is not true of
this patch.

> +struct axienet_common {
> +	struct platform_device *pdev;
> +
> +	struct clk *axi_clk;
> +
> +	struct mutex reset_lock;

>  static inline void axienet_lock_mii(struct axienet_local *lp)
>  {
> -	if (lp->mii_bus)
> -		mutex_lock(&lp->mii_bus->mdio_lock);
> +	mutex_lock(&lp->cp->reset_lock);

This lock is different to the bus lock. This is definitely not a "no
functional change".

Please make this lock change a patch of its own, with a good commit
message which considers the consequences of this change of lock.

>  		if (!np) {
> -			dev_err(dev, "pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
> -			ret = -EINVAL;
> -			goto cleanup_mdio;
> +			dev_err(dev,
> +				"pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
> +			return -EINVAL;

That looks like a whitespace change. This is a "No functional change
intended" sort of patch. You can collect all such whitespace changes
into one patch.

>  		}
>  		lp->pcs_phy = of_mdio_find_device(np);
> -		np1 = of_find_node_by_name(NULL, "lpu");
> +		np1 = of_find_node_by_name(NULL, "cpu");

Interesting. Maybe you should review your own patches.


    Andrew

---
pw-bot: cr

