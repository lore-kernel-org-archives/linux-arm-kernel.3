Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B3C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnI+a4adx7XLWLUhOvT+B7Uvtg/ithJmiCgPTgSYlsY=; b=0XSMwmoBzQ309K7cAk9h56my16
	i0D5Odv07WkM+uXvdqSvoHsLz2Tj9RRk7nqAThXBsXQjjUBnQ1RsU0Ih41r5yVqOykKSsfthQwkii
	oDxsjJ1rCpj56h92lTlwd8QrH8KU0N7sAdmPVxi2QzrdZw0pHgvC/103OTiFdTskiFR4VqjEeGhK5
	U47IkZ3W98bzObEMxMN3k8Fh/kGJG99nEs8j/trPIpzNk0XXI9QRVWp1CmIM5rvo/7p5DQlnqNTmH
	myMGJiW+LH5k23hFsZY9ieoyVzt/US2IOLhIiDCMtRTmo7GopD854H9nv2d3o7y2xZRy+2Gt4XvYM
	ISONBVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10l5-00000009G7r-3cTx;
	Mon, 31 Aug 2026 12:05:03 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10l2-00000009G5y-1uXb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:05:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3174A39FE;
	Mon, 31 Aug 2026 14:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1788177889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OnI+a4adx7XLWLUhOvT+B7Uvtg/ithJmiCgPTgSYlsY=;
	b=Q9Oqyh6HZW6LILNy7HKDuNs77IF8b9D6vpjeHc6L4w8sxbuKFgeU62wwRZGVI1u6wyjjuj
	/3aPgZ4tTYw3XfgkTuvXxYCMuASoFvgeWPL8gNApiRjKm9XVCjKfXm0uz9TtrmO62spx+w
	ZWu9LQKkAvWopfp/Zw5451zKf8W1pGN9mcc/uh4dw4n2wCz5yd8NTw1ylRCcb3L+fK79cf
	XfSx5qWM22ZZmfRGxDyutDVUgw5M39e5o+VVSsE9mfsqlR5cSj4QHR1Yd7JUuLOtKfeWrr
	Zmb7vbSN3UOGcoCR7rsbKu7gPFuLmfEAtf9s+NTsZjMgKxapyBL+zEkx/nLzhA==
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 14:04:44 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac4: Read the UC filter size
 from hardware capabilities
In-Reply-To: <20260831070121.349778-2-maxime.chevallier@bootlin.com>
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-2-maxime.chevallier@bootlin.com>
Message-ID: <2631c832d5aebc56e152628132494545@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_050500_653673_D3FF34A1 
X-CRM114-Status: GOOD (  14.90  )
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

Hi Maxime

On 31.8.2026 09:01, Maxime Chevallier wrote:
> dwmac4 has multiple banks of perfect filter entries, independently
> configurable during IP integration.
> 
> The multi_addr bank reports a number between 0 and 31 corresponding to
> the actual number of entries in that bank, while the 32 and 64 banks
> are all-or-nothing.
> 
> Expose these caps over debugfs as well.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [...]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> index 6382836828ba..89368e34a388 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> @@ -176,7 +176,9 @@ enum power_event {
> 
>  /* MAC HW features0 bitmap */
>  #define GMAC_HW_FEAT_SAVLANINS		BIT(27)
> -#define GMAC_HW_FEAT_ADDMAC		BIT(18)
> +#define GMAC_HW_FEAT_MACADR64SEL	BIT(24)
> +#define GMAC_HW_FEAT_MACADR32SEL	BIT(23)
> +#define GMAC_HW_FEAT_ADDMAC		GENMASK(22, 18)
>  #define GMAC_HW_FEAT_RXCOESEL		BIT(16)
>  #define GMAC_HW_FEAT_TXCOSEL		BIT(14)
>  #define GMAC_HW_FEAT_EEESEL		BIT(13)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index 23ffe1adcd0d..14ac3f0e51f7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -388,6 +388,8 @@ static int dwmac4_get_hw_feature(void __iomem 
> *ioaddr,
>  	dma_cap->half_duplex = (hw_cap & GMAC_HW_FEAT_HDSEL) >> 2;
>  	dma_cap->vlhash = (hw_cap & GMAC_HW_FEAT_VLHASH) >> 4;
>  	dma_cap->multi_addr = (hw_cap & GMAC_HW_FEAT_ADDMAC) >> 18;

Now that ADDMAC has grown from single bit to a mask, the hardcoded 18 
has to match
dwmac4.h. So IMHO it would make sense to use FIELD_GET() here (like 
actphyif)?

> +	dma_cap->additional_32_addr = (hw_cap & GMAC_HW_FEAT_MACADR32SEL) >> 
> 23;
> +	dma_cap->additional_64_addr = (hw_cap & GMAC_HW_FEAT_MACADR64SEL) >> 
> 24;
>  	dma_cap->pcs = (hw_cap & GMAC_HW_FEAT_PCSSEL) >> 3;
>  	dma_cap->sma_mdio = (hw_cap & GMAC_HW_FEAT_SMASEL) >> 5;
>  	dma_cap->pmt_remote_wake_up = (hw_cap & GMAC_HW_FEAT_RWKSEL) >> 6;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f2fc89176654..a885f8cfef21 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6580,6 +6580,18 @@ static int stmmac_dma_cap_show(struct seq_file 
> *seq, void *v)
>  		seq_printf(seq,
>  			   "\tNumber of Additional MAC address registers: %d\n",
>  			   priv->dma_cap.multi_addr);
> +	} else if (priv->plat->core_type == DWMAC_CORE_GMAC4) {
> +		seq_printf(seq,
> +			   "\tNumber of MAC address registers (1-31): %d\n",
> +			   priv->dma_cap.multi_addr);
> +		seq_printf(seq,
> +			   "\tAdditional 32 MAC address registers (32-63): %s\n",
> +			   priv->dma_cap.additional_32_addr ? "Y" : "N");
> +		seq_printf(seq,
> +			   "\tAdditional 64 MAC address registers (64-127): %s\n",
> +			   priv->dma_cap.additional_64_addr ? "Y" : "N");
> +		seq_printf(seq, "\tHash Filter: %s\n",
> +			   (priv->dma_cap.hash_filter) ? "Y" : "N");

hash_filter seems to be only set in dwmac1000_dma.c? So on dwmac4 it 
would always print N?

>  	} else {
>  		seq_printf(seq, "\tHash Filter: %s\n",
>  			   (priv->dma_cap.hash_filter) ? "Y" : "N");

Thanks,
Nicolai

