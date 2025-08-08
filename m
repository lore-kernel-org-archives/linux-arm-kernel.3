Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2084BC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8UTKQD/idYnpyC3AcRppHHyIn/pYImafOsunNE1QQE=; b=xWmriU2qyolnkeX6lbiTl4xZYe
	H1byAoReB42IqNBfYuborfCqs+zZ5A+1/4r2ssDiF8NIHjc7fz6vok3Ofgc1Gb5ejWUFQEO7ifCn8
	d+ZhPlnXlkgu5Stn7eUTvM04wb2715QdK8zhI991N15bXBOmRVHEMWDbCLSfELMAyPq0fAFPzsXpA
	bpX0lDLva82GyD/+EyZZ3bu2AaIC1dMHkyLQxuj5tMYOBRa5yofvRmBHyQjdfdVjSkrfW/BZrAhPn
	jbnXjtNRIx0BCHARMrs0jj+TP3NAXNC7NoTupuGMxhOAQWco6LrHGT0+LCdaKqbJKEx+8TmcAJKhp
	h0nu3Msg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukO2J-000000031XS-2hZj;
	Fri, 08 Aug 2025 14:25:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNzl-000000031Dh-2wTm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1409B5C6852;
	Fri,  8 Aug 2025 14:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3172C4CEF4;
	Fri,  8 Aug 2025 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754662976;
	bh=C2mDBiwbp98LucRDstG30Q8R9qWzgIONvigmiGMmCDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIR9WG8YIiMvBoT/2IOlRZTCD66n0CHJqXz2aC/VtFq/nBAf6oXz7ZccbJWE0Jvm4
	 QEk3o2tYw4YXMLOVJcqN3nr6Afnq8gsOGI1X5jsSpzKaWi57bKeWcWyTJyaF9PeOxM
	 NTlC2B+uplfuNYIfBkEUI4YNbDdWe0XwIfH2MmoGCLHUOxjwJtPLBLfDO5xfLPmfOo
	 GhCjPH2m94x6a7yVqwLnM+9Bgg0N9sVeAOwmiehh/ZiSobGQvGohQu0aMKVIR+Ey9F
	 0x/FryhM+qcRnllO9Yz0xNVcVNsCM/8X2ssENYmOeHk1K1sOvIM+wP1xxtTNWimN4h
	 z2hIhv+FSsBMw==
Date: Fri, 8 Aug 2025 15:22:51 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] net: stmmac: dwc-qos: fix clk prepare/enable leak on
 probe failure
Message-ID: <20250808142251.GF1705@horms.kernel.org>
References: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_072257_779290_24547F47 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 08, 2025 at 01:16:39PM +0100, Russell King (Oracle) wrote:
> dwc_eth_dwmac_probe() gets bulk clocks, and then prepares and enables
> them. Unfortunately, if dwc_eth_dwmac_config_dt() or stmmac_dvr_probe()
> fail, we leave the clocks prepared and enabled. Fix this by using
> devm_clk_bulk_get_all_enabled() to combine the steps and provide devm
> based release of the prepare and enable state.
> 
> This also fixes a similar leakin dwc_eth_dwmac_remove() which wasn't
> correctly retrieving the struct plat_stmmacenet_data. This becomes
> unnecessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks Russell,

Probably this wants:

Fixes: a045e40645df ("net: stmmac: refactor clock management in EQoS driver")

Otherwise looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

