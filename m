Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDC1C98329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gDixT1C1g9aXGEdjl/pZkav3MxrZ1blNqQfJLK1BvE=; b=Hwj153pNEEceqHXkk+JSitvj19
	mancRBPy0hNHR9/XyJFFktylm4+KIt4Zl1u0ZvtfgdSfzwlhI5bIT3mWD1GNpSh50yjxcH+Zb+zrr
	0ifvZWdHGbT7yQ8UPD2QHbiF9Db7R22VBLTi2a2ES5Fqt9GLodE4AGrYDxuY958AOuJF+23nD+wlY
	TRyPQdqURcqwwWYaFLur48A6vKan1be/YE3EXVSc10OdJuBKMBJwUQ9jWaUxmLQ907Oo+LX1q87iO
	fk5SP/Npp/txaRkHsOaXWumSkNx+9tIc/TDtLPQ6bKL4/PNsS2f/XZ/nvJTbOrZZCIWM7RRVqY5dR
	EnSlL/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh6jW-0000000FZs3-44MG;
	Sat, 17 Jan 2026 13:52:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh6jT-0000000FZrf-1Fu8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 13:52:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87D20C2030D;
	Sat, 17 Jan 2026 13:52:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40F5B60708;
	Sat, 17 Jan 2026 13:52:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 892EF10B69083;
	Sat, 17 Jan 2026 14:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768657966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5gDixT1C1g9aXGEdjl/pZkav3MxrZ1blNqQfJLK1BvE=;
	b=WKcU6NrvukifFmQkh8Va7m7KICHp61NXtJxizqM8LdcErwoE6rzE6E54u19h1ifDeJPIxI
	4mqKwlC3c0cA+f6Qj6CGlzfvbLaRWhgzLGLjkIE1OT70IQBYXzMzbzzNYGsPmuDrfAXdba
	rAHuSNuxHb3pNuARUDSg2t+VTtm4RwQt4yNc0/cMjTvJA0QgFwLYRRD6EqFtwYacSPXK6M
	02Bbkt09P7mNAA+lKnonX9NqJKinXZzdd6VJyBl3daHersl+UcO3yoTyp5rqI2+ssqU7iF
	KrsYy34nmQRZvReF0srgsRxMadFk9pXF4o7+q9Qkl/FdfmrCfYSn/Hh8iEahsg==
Message-ID: <194679cb-f8e0-4195-b85b-8726b9f5b4f6@bootlin.com>
Date: Sat, 17 Jan 2026 14:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_055251_898068_EB086274 
X-CRM114-Status: GOOD (  16.71  )
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

Hi Russell,

On 17/01/2026 00:25, Russell King (Oracle) wrote:
> Enable receive process stopped and receive buffer unavailable
> interrupts, so that the statistic counters can be updated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> Maxime,
> 
> You may find this patch useful, as it makes the "rx_buf_unav_irq"
> and "rx_process_stopped_irq" ethtool statistic counters functional.
> This means that the lack of receive descriptors can still be detected
> even if the receive side doesn't actually stall.

Nice ! I'll give a test and take a deeper look after the weekend :)

Thanks,

Maxime

> 
> I'm not sure why we publish these statistic counters if we don't
> enable the interrupts to allow them to ever be non-zero.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 9d9077a4ac9f..d7f86b398abe 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -99,6 +99,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  #define DMA_CHAN_INTR_ENA_NIE_4_10	BIT(15)
>  #define DMA_CHAN_INTR_ENA_AIE_4_10	BIT(14)
>  #define DMA_CHAN_INTR_ENA_FBE		BIT(12)
> +#define DMA_CHAN_INTR_ENA_RPS		BIT(8)
> +#define DMA_CHAN_INTR_ENA_RBU		BIT(7)
>  #define DMA_CHAN_INTR_ENA_RIE		BIT(6)
>  #define DMA_CHAN_INTR_ENA_TIE		BIT(0)
>  
> @@ -107,6 +109,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  					 DMA_CHAN_INTR_ENA_TIE)
>  
>  #define DMA_CHAN_INTR_ABNORMAL		(DMA_CHAN_INTR_ENA_AIE | \
> +					 DMA_CHAN_INTR_ENA_RPS | \
> +					 DMA_CHAN_INTR_ENA_RBU | \
>  					 DMA_CHAN_INTR_ENA_FBE)
>  /* DMA default interrupt mask for 4.00 */
>  #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
> @@ -119,6 +123,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  					 DMA_CHAN_INTR_ENA_TIE)
>  
>  #define DMA_CHAN_INTR_ABNORMAL_4_10	(DMA_CHAN_INTR_ENA_AIE_4_10 | \
> +					 DMA_CHAN_INTR_ENA_RPS | \
> +					 DMA_CHAN_INTR_ENA_RBU | \
>  					 DMA_CHAN_INTR_ENA_FBE)
>  /* DMA default interrupt mask for 4.10a */
>  #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \


