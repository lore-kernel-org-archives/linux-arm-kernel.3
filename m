Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 06:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXMaxus8XfDIaPk/PrV9R055UFe2h6R0FRKpTuO5XRQ=; b=OUF6pFanUxcvYTOREQAj+8dJnA
	6ZBb64xLBMiq/Jm5OwFRWPVM1PNw+4xKSS4kqW+urBRV+M+5vjQpJ/j/3qyAiPqB51ow+qDvUWXVR
	vwu5rGIqNKyIJSR3Va6yit9DbSFjNqmkiqo+PGI1yyq5BS6aNvB5YwN7TWPFzMnK3XIXJKKykBko2
	HvFDIQVlM0Ss8jsmWd86EweGhrbANexz/a6SBAr+VCbfK2m2nZNr3i1qV+Ob7g3VLs1zwYwpFK8ve
	00jQHJjffAgSioukeRvj/edMZm54pKjn00qy/vRn0GD8pDPob/aqQ/xrNXTPbYVx2r6LFtIDZNcwU
	TI9oXByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIPO-00000009K16-3Jsu;
	Thu, 17 Jul 2025 06:47:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIMy-00000009Jjw-04xu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 06:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nXMaxus8XfDIaPk/PrV9R055UFe2h6R0FRKpTuO5XRQ=; b=DxO1GOMJ+NvrBkIAX8Br+aJ8Q9
	UVSDgZx6yS6GnqdC6mbMhOo+egX/a4ywDvA/Y7MRENl1PBLe/pQSbKvqGO1wW1Xye0TMIWZ1xKeXW
	Tyb16/sYf+YqErU0ebo/9wYDSXu/buZ3YR34wYlFdF9UCZ04yqgmgX6ncL9I8r1YkYbgX0AznLY81
	4IBi2iGczQYKWyluBOEXXUpVUEDpyAUznKrV+5EF14Kyt63iS7bxfsDet6xbKGQ8okRyfv0o0jCY7
	fxvhI2tw8Ryo77AJW3q7eEyoutc1b+IfXnxrG27npSdqvOO9TrbUANgXOgDc7mpjkdp0lFnOtyjSl
	sICQEDMw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49690)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ucIMk-0000fd-1w;
	Thu, 17 Jul 2025 07:45:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ucIMf-0001xN-1N;
	Thu, 17 Jul 2025 07:45:09 +0100
Date: Thu, 17 Jul 2025 07:45:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <aHib9V1_WZfj3S8M@shell.armlinux.org.uk>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_234528_061908_EA01CCFA 
X-CRM114-Status: UNSURE (   8.71  )
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

On Mon, Jul 14, 2025 at 03:59:18PM +0800, Rohan G Thomas via B4 Relay wrote:
> @@ -1532,8 +1542,8 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
>  		mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
>  
>  	mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> -			 MAC_1000FD | MAC_2500FD | MAC_5000FD |
> -			 MAC_10000FD;
> +			 MAC_10FD | MAC_100FD | MAC_1000FD |
> +			 MAC_2500FD | MAC_5000FD | MAC_10000FD;
...
> @@ -405,6 +405,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
>  	dma_cap->sma_mdio = (hw_cap & XGMAC_HWFEAT_SMASEL) >> 5;
>  	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
>  	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
> +	dma_cap->mbps_10_100 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;

What if dma_cap->mbps_10_100 is false? Should MAC_10FD | MAC_100FD
still be set? What if dma_cap->half_duplex is set but
dma_cap->mbps_10_100 is not? Should we avoid setting 10HD and 100HD?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

