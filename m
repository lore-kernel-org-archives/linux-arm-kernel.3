Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A675C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ze2u6ogswUGLWexD9dL+Uvbmw1nnxbIQ0UCNZR5y2U=; b=mEDN9xn4O+qkG9gF49F6Jw0d3d
	C0CUWxcYPzos/Fs/2DIxzP+2kH6Fi7qV4ZK5yfU1OMr10+xOvv9gfEBH/cvdWcQbqQ+fN64E6YMB0
	jVjUmFffm6mhvDpmibP7NCOZ6n5Su/FHTyKlOj3tWGivj97o21XMRBzxiLjLv/ZA2efdD1pEqKcmY
	nwl5z7//VsMMZrBtNpJAJMaXwKseFys2sVtCoAR5fcc5cAHjFof5gcgePpyKl3NZMxsjmN0UJhBM2
	TcgMtY9ZswuQ0kDYvB12K0JbPQ2zQHjHSjnsJ1DWi47iRQR5tqHB65gb1Ns8h9Y3DJe9J9ZN5c95g
	nAKOFtig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGEb-0000000DhWv-2Cmt;
	Thu, 16 Jan 2025 03:07:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGDL-0000000DhKl-1pR1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 03:06:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21644aca3a0so8649335ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 19:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736996794; x=1737601594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ze2u6ogswUGLWexD9dL+Uvbmw1nnxbIQ0UCNZR5y2U=;
        b=O6EuRlnk4Ti9pGrhDm663jvk/BvnA8akNB8setegpiQKp7leaBhnzu5wS0LIWCaqda
         SbKdV1g95i0vH9a/nT49UA2MbQ09BmuGKvvcRNax4vm3qm3Zq0J8i3TcT0/HjdZA5fTR
         QQhBIBuv1mAtLMHpTbnGD1UQbJ8SSqSgtuw75pGjAmw+hTtqVwk0VZFq5rmLwQxQA0PL
         jAYuJ5bbRYDiKqOznwqbgPb/HztkBHdQnHYNjvcX2SGrWk+IgWpcBh6UV93lKB8SQvLP
         h1ewh2NIN0jPHn6eECz7at7Yf8meJjpVvu+oHVCmGtpUnlvjN4m+LahQlB+l6o0O6PP/
         XBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736996794; x=1737601594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ze2u6ogswUGLWexD9dL+Uvbmw1nnxbIQ0UCNZR5y2U=;
        b=COraHcm1jMWRNDcKdl/Hz3XUEUNROAs4dSZRpAsFZq3LG834+0DSb8QtdT7QH60WIw
         LC52jJfdAGRRzoyOWkvPRcike5R6Nm4cTzQ9BG6KVniquYYcbUiwt7gTpigyko3Yj/WH
         6w2F0qyb9SCgwhYJGvJgZX1eJe3gRe1wPXQt9HAm24FVWjndfk58j/h6kmVs0jGY3roW
         db0wHwuercIXSaCIzABZfMZnLU+HY4MMsSSsY4dZqM013xCeSr7ELYovnyEzBTZInlIv
         Ga0i1ypa434dm8wDxojJn0xBdlBz1aht3g0kYJk3t6Opm8LMDWBscReyOaSoR4wweb0x
         igBg==
X-Forwarded-Encrypted: i=1; AJvYcCVenHkwoiRnTPZhwe6BcmaLBPMvYtVHZBti+ueOqpQN/CU+eTOBo7PS+DLfWDSf1xNhUMt68ZZAENLtx4ocU5EH@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ+DH65vgC19Dpvg3Pmjvx6ItdlG2REwki8wcS9G+G1a3jOflr
	0av915KAD9S6dVMb8AqCOM1Dam/dfV+nLmwPlbT/vAbqIpgRIRNL
X-Gm-Gg: ASbGnctvRpQ8JuQF4/iM7Y3Zm5CIY3aBy7jQ60RQPq1rablrYi/pTrRoaw1PVg/XFVD
	nennLgjWpNYdZvje0rOU3cIL7D5w4c2ASK6Ya0JQys+sgL33W7Pfplmo0bBgQWH4c2tXN7kfgPP
	hFwzd33uZYvZKbpCO0Wc7jnEQgO2sBPsM9pypgYh/tgIRQH95cxA8Ec5S6U3oMn/G+k40E2ANDQ
	kL6tNM2lfF5BEyJn7v0p6rJ7qEa3uOndXb6sIU9hYe6dP2JO7bcRw==
X-Google-Smtp-Source: AGHT+IG+gbuPhTugQjUyA8q5cqsivSTkcwRWWlQBn8xqPiJT5A4ujHeYMSSbV2ToO+BpK0JupiGTeQ==
X-Received: by 2002:a17:902:e544:b0:216:50c6:6b47 with SMTP id d9443c01a7336-21a8400038bmr503434195ad.46.1736996794005;
        Wed, 15 Jan 2025 19:06:34 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df6dsm89036585ad.5.2025.01.15.19.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 19:06:33 -0800 (PST)
Date: Thu, 16 Jan 2025 11:04:36 +0800
From: Furong Xu <0x1207@gmail.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: stmmac: Limit FIFO size by hardware
 feature value
Message-ID: <20250116105011.00003206@gmail.com>
In-Reply-To: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
References: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_190635_480630_EABC15DC 
X-CRM114-Status: GOOD (  22.05  )
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

On Thu, 16 Jan 2025 11:08:52 +0900, Kunihiko Hayashi <hayashi.kunihiko@socionext.com> wrote:

> Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
> the platform layer.
> 
> However, these values are constrained by upper limits determined by the
> capabilities of each hardware feature. There is a risk that the upper
> bits will be truncated due to the calculation, so it's appropriate to
> limit them to the upper limit values.
> 

Patch is fine, but the Fixes: tag is required here.

And if you like to group this patch and the another patch into one series,
it is better to add a cover letter.

> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7bf275f127c9..2d69c3c4b329 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2375,9 +2375,9 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
>  	u32 chan = 0;
>  	u8 qmode = 0;
>  
> -	if (rxfifosz == 0)
> +	if (!rxfifosz || rxfifosz > priv->dma_cap.rx_fifo_size)
>  		rxfifosz = priv->dma_cap.rx_fifo_size;
> -	if (txfifosz == 0)
> +	if (!txfifosz || txfifosz > priv->dma_cap.tx_fifo_size)
>  		txfifosz = priv->dma_cap.tx_fifo_size;
>  
>  	/* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
> @@ -2851,9 +2851,9 @@ static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
>  	int rxfifosz = priv->plat->rx_fifo_size;
>  	int txfifosz = priv->plat->tx_fifo_size;
>  
> -	if (rxfifosz == 0)
> +	if (!rxfifosz || rxfifosz > priv->dma_cap.rx_fifo_size)
>  		rxfifosz = priv->dma_cap.rx_fifo_size;
> -	if (txfifosz == 0)
> +	if (!txfifosz || txfifosz > priv->dma_cap.tx_fifo_size)
>  		txfifosz = priv->dma_cap.tx_fifo_size;
>  
>  	/* Adjust for real per queue fifo size */

