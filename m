Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E282CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIWeLwIulws3Q2ewcW5ClR2sFSjA9IBC87qUgUBb91s=; b=Z4yW1gzq/9B/TudEXo3kaDaTsY
	eN2LCY7qLfiKzf8cP+Z+3QeeUM8l4VoucD8w6SBsTl4vfmdogp7m5htdML4zVhSWMHMcu1Eg/dOKC
	J4PDnTmBjDMyiQSiAho4iwKmfn87nYlEBecJD+Fpk45AFuOdmmwqJzXI5xr/WiRjT15OZZQx2oqIu
	uo1fTCgI6BhHMtyvccs8Hlrh7NlNaR5eVpUL1WWFom7OuIk+EvltTcD7cqe8ucosLRqXZb6H0JFg0
	SszpLISDkutdUdLwEyMpiGUZ9tu3vOOif0nIk0GnzitPPF35tuWvMvy8vzUMhYGjUC+CLecO4Onxd
	tJPCXTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlEA-0000000G8qK-46Cx;
	Tue, 28 Oct 2025 15:03:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlE9-0000000G8pZ-12PZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B78F43E68;
	Tue, 28 Oct 2025 15:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A04DC4CEE7;
	Tue, 28 Oct 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761663790;
	bh=Z36D+6ZhfHgGmJy7pQ7Lwnpln/Jx0aH9L4PEgSkS4cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzVMbkK/3Fgb9ijFlyUS4iB1uC23xI0ZWZkIdfJ6RogXnWbv2lzNYqJ5EZfVySMc1
	 SB0DKWP4a80haIV3+eNxvAxMxegcgSl0pH0ouiVYimn7wLLo4q6cG1hg/MJLijGkLn
	 J/keK8Jax3TsCJTpUdStSyMwztf2rGgq0UV3SFX22tlrT0wwT6SssPtzFnN7TjgRm/
	 f99Wn7XzOr3SyxQrGBtScpV+ELzWNeWby/ogLFK9rqL5dN9qSPQUNE+lq8DpjDf0Pz
	 RANtYBei63HupbcZg6lFxV1k15YxeDwEsuPfsutaROIVrcLbDZhBNSXtbGCHw5ZOlB
	 t3v+G2BLEbK8A==
Date: Tue, 28 Oct 2025 15:03:05 +0000
From: Simon Horman <horms@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 net-next] net: stmmac: mdio: fix incorrect phy address
 check
Message-ID: <aQDbKYMtgiQaGgHX@horms.kernel.org>
References: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_080313_303672_1627E6C2 
X-CRM114-Status: GOOD (  12.34  )
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

On Sat, Oct 25, 2025 at 08:35:47PM +0200, Heiner Kallweit wrote:
> max_addr is the max number of addresses, not the highest possible address,
> therefore check phydev->mdio.addr > max_addr isn't correct.
> To fix this change the semantics of max_addr, so that it represents
> the highest possible address. IMO this is also a little bit more intuitive
> wrt name max_addr.
> 
> Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - improve subject

Thanks, this versions looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

...

