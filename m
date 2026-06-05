Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3071CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWXGRwd3dgogIG+Bvu9DUV5PG31p4cZwWp/87lf38RU=; b=QgwcgxloGSQSy2SCo7d80WEphX
	nsO8PssZlFXD5Cikv8MFJ695Eqrbt5bF+kNVQ9erkD/T/RhZIdNxJqvZHjmfFPlVhfiRPEG1ee1oE
	qlcn1rccZ5i+gtNv7Sa+xpy7XwaPdovkJrb1JVx+cD7HhgCJdy/M7zyCzOcaTStGkvNkz1UU8sSuS
	CmAqwkEq5RwhHkKddq+cYWj+RrCWKJgG27+9NV6iohxbABbjtXqdHVTNzvD2bGHFk+3D/WxhAft1y
	21kgRe7WYlHhyPJkuJYPUrjjkyoi5A6vteIpTMGe9Rc/7SBbF164FkibYEM4dJmUG3IzHOZE6h6hU
	S8yXCSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVxA-00000000l6e-2Bn6;
	Fri, 05 Jun 2026 14:55:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVx6-00000000l59-0kxJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 14:55:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C5524E408EA;
	Fri,  5 Jun 2026 14:55:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3760F5FED1;
	Fri,  5 Jun 2026 14:55:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2859106A21AF;
	Fri,  5 Jun 2026 16:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780671310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qWXGRwd3dgogIG+Bvu9DUV5PG31p4cZwWp/87lf38RU=;
	b=dz21K3JbykBYP0dGe9k0xmZ+3l5tU+Hx3gj08dAtSVDppefMhtMqpZl4jnL40WxdmZnGt2
	HSn6st3ifIi3VTp8hME8IHDk96OCk+kOeZuQliZaubKA+bU3DNmUKsHuL6+pGPB1US4Ihz
	bsFgKA3S/MBiBB0GjCwPvNT8sW/m3vJrj7Fjh0goXdzmDlsORzno5UJUIJrso+lookTdCn
	jXOIaNFIXugn/xtmJUuqXUAvcBxpByCAXQML7AJJ1LpRuYywMZ7uRTYVmgKEAZANgnS48D
	ti0wFnjaL6MJpvGcO0EAgS+HoImTNqfz9MouwZGZNgMaMvWSKqJM6vSdlp8T6A==
Message-ID: <15d6ff60-cb36-4d61-a4ce-62b72c4429f5@bootlin.com>
Date: Fri, 5 Jun 2026 16:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
To: muhammad.nazim.amirul.nazle.asmade@altera.com, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_075516_359118_2B3EA04D 
X-CRM114-Status: GOOD (  12.09  )
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

Hi,

You're missing the 'net-next' in the Patch subject :(

Besides that,

On 6/4/26 10:30, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Read the L3FM and L4FM bits from the RX descriptor status word (RDES2)
> and increment the corresponding ethtool statistics counters. This allows
> users to observe L3/L4 filter hit rates via ethtool -S.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 51943705a2b0..95fdf3133208 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -429,6 +429,8 @@
>  #define XGMAC_TDES3_VLTV		BIT(16)
>  #define XGMAC_TDES3_VT			GENMASK(15, 0)
>  #define XGMAC_TDES3_FL			GENMASK(14, 0)
> +#define XGMAC_RDES2_L4FM		BIT(28)
> +#define XGMAC_RDES2_L3FM		BIT(27)
>  #define XGMAC_RDES2_HL			GENMASK(9, 0)
>  #define XGMAC_RDES3_OWN			BIT(31)
>  #define XGMAC_RDES3_CTXT		BIT(30)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index b5f200a87484..6719ac6e395b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -27,6 +27,7 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
>  				  struct dma_desc *p)
>  {
>  	u32 rdes3 = le32_to_cpu(p->des3);
> +	u32 rdes2 = le32_to_cpu(p->des2);
>  
>  	if (unlikely(rdes3 & XGMAC_RDES3_OWN))
>  		return dma_own;
> @@ -37,6 +38,11 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
>  	if (unlikely((rdes3 & XGMAC_RDES3_ES) && (rdes3 & XGMAC_RDES3_LD)))
>  		return discard_frame;
>  
> +	if (rdes2 & XGMAC_RDES2_L3FM)
> +		x->l3_filter_match++;
> +	if (rdes2 & XGMAC_RDES2_L4FM)
> +		x->l4_filter_match++;
> +
>  	return good_frame;
>  }
>  


