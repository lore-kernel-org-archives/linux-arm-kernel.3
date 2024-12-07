Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3309E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m4W93mYJLzHPiDSNn2VKBwMS0KHXEKg2K2lKwcgsic=; b=mnQU1oAxmLXBccNFyq7ekcicuo
	rJsXxbfT2GtoUVNAgoDFfsLoTtHKaFbb4ZjoXANyJYsIwm55iFVZkMsa+JFSbxaHtuy8Y0M2O0eAI
	7O/lUp1qJXh5vGJpcHkYeDEnUitlC0y0s5p3YMSEVcz6bJW3oK9udb6b3X3PuRMP2N2gf3SrFq2E6
	Wy1SXWIiOODVsA2uUf/3cvboKKqIFZN5nLXR2llXurvgWuxcJdHbMKSB5/hnungEz2MOger7yp4ZH
	AdPH2hiPPwdqZbCoQ4QOQvQg17QkCQ+dumVrKNHHYDwZJDlPEUzeGnE9gwWWEI56f9W8RhJHvkElL
	yfuGWv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJrpb-00000003oaX-2Ngv;
	Sat, 07 Dec 2024 10:14:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJroZ-00000003oV5-1JUl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 10:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9m4W93mYJLzHPiDSNn2VKBwMS0KHXEKg2K2lKwcgsic=; b=hkOlp2GT+CFyuoN3LOa5axR6b/
	gUBV11fEHXr4WfIdXtN7VbNn+IVNk/YuLNGLLJtOSH06P+rGRFlNFa5ggxm0jwQhVxLa1D1O8uSuv
	nrU+Gvk5NwIDU+9H6XFBjCWxPSiFREzlNzKdPrwwQNsAPBP/VYskW7iZWIY9WcjGNyuCkls8GhliI
	f3eNXluxUoHGtGFZfrelPz99UeEZv3RTLN3lagIHt+eW78ZzhQ9yB8tmMGCwbPgS+b316AQWA7y7d
	DwMmgy1mzRt2Z0R2Bvc2EmecR2bTnBOuMLQ0sw6wsUhyI6zupSUTfV0F7hsmJv+KDt1hf3ceQV57g
	c0xrjZ7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45680)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tJroO-0007FL-2B;
	Sat, 07 Dec 2024 10:13:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tJroI-0008RP-2w;
	Sat, 07 Dec 2024 10:13:14 +0000
Date: Sat, 7 Dec 2024 10:13:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v1] net: stmmac: Move extern declarations from
 common.h to hwif.h
Message-ID: <Z1QfupFfg07jTMUc@shell.armlinux.org.uk>
References: <20241207070248.4049877-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207070248.4049877-1-0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_021331_353492_D942E5E9 
X-CRM114-Status: GOOD (  16.12  )
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

On Sat, Dec 07, 2024 at 03:02:48PM +0800, Furong Xu wrote:
> These extern declarations are referenced in hwif.c only.
> Move them to hwif.h just like the other extern declarations.

We normally have declarations in a header file that corresponds to their
definition, rather than where they are used.

> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h | 14 --------------
>  drivers/net/ethernet/stmicro/stmmac/hwif.h   | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 1367fa5c9b8e..fbcf07d201cf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -543,18 +543,8 @@ struct dma_features {
>  #define STMMAC_VLAN_INSERT	0x2
>  #define STMMAC_VLAN_REPLACE	0x3
>  
> -extern const struct stmmac_desc_ops enh_desc_ops;

Defined in enh_desc.c, but no header for it, so either common.h or
hwif.h seems sensible.

> -extern const struct stmmac_desc_ops ndesc_ops;

Defined in norm_desc.c, same situation as previous one.

> -
>  struct mac_device_info;
>  
> -extern const struct stmmac_hwtimestamp stmmac_ptp;

Defined in stmmac_hwtstamp.c, same as above.

> -extern const struct stmmac_hwtimestamp dwmac1000_ptp;

Ditto.

> -extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;

Defined in dwmac4_descs.c, maybe dwmac4_descs.h or dwmac4.h would make
more sense than hwif.c ?

> -
> -extern const struct ptp_clock_info stmmac_ptp_clock_ops;

Defined in stmmac_ptp.c, and there is stmmac_ptp.h which contains a
number of function declarations, so maybe moving that there would
make more sense?

> -extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;

Same as stmmac_ptp_clock_ops.

> -
>  struct mac_link {
>  	u32 caps;
>  	u32 speed_mask;
> @@ -641,8 +631,4 @@ void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable);
>  
>  void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr);
>  
> -extern const struct stmmac_mode_ops ring_mode_ops;

Defined in ring_mode.c, same as enh_desc_ops.

> -extern const struct stmmac_mode_ops chain_mode_ops;

Defined in chain_mode.c, same as enh_desc_ops.

> -extern const struct stmmac_desc_ops dwmac4_desc_ops;

Defined in dwmac4_descs.c, similar situation to dwmac4_ring_mode_ops
above.


So I think rather than bulk moving these to hwif.h, where some of them
remain out of place, maybe placing some in a more appropriate header
would be better.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

