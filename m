Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5040DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lO4SV4fEBS5/b96bWFRJrbo3YeXzbwO/hDMej2RItM=; b=FPAGzSfNElN4Z31OdLHSlU6R0j
	kmjF4qBU8vOZR/d8E6TfgOCo1ELmL0cRybZG4cFbtURP+ArfdNdMegBNjn9hfbiU+Vb+MgahbmKwl
	TokFQuO8JOgfoa8BkwNn0i0Ejya8BlOTXdF9TPykZkkmHb9gaOENs5e7z5weugtqJmez0uChmGsCi
	PPxp4GHjRtSKacE0k4P3Jz/n3pTqk9PEU5fNbNNaNMmnmJecskMexJcSAwQhh6KHtHUvmGE4L+6W+
	MCXParRVGk/zS8jbmpkw0w0/+RyRDZm1HjY2IvHAXkj4e6GZLfR4ylBzSa11/2XN45xtBs/TYKS2F
	QZ+E6+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGas-0000000DjR1-1an3;
	Thu, 16 Jan 2025 03:30:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGZc-0000000DjEn-1ERB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 03:29:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21634338cfdso9358555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 19:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736998175; x=1737602975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lO4SV4fEBS5/b96bWFRJrbo3YeXzbwO/hDMej2RItM=;
        b=Semfby6LErFQIrO+ZoQxngx7veaVhzgeNfBC+dlUUQpqBITG+kPFtNvn13j21BOsBX
         B+C062NQT0OkCZd+if/PLYsm1sS5tF8g61Kgqx3/I1Yl+Bnsh2SSgiRJPnDhFkkLKbW4
         BtCSQ8nBNS8Wm2whG3zgO/e0n4WjtcEW9GfmLTKQWWE60Mo2TOdjdnpSkttjAGeyf1JV
         XE9oFMCSczfBwmECxHQrHYWyeZcfd1bKPPoxzQXTd9BRzqU31A9ri3J6tkErSvSsn2dl
         NZi2oyVrbbpOXj4qc4M1cbMuMkp4TkFqzJL5ugT7p9drEvLkYOUqrTXkn5kEvwHun8vr
         jAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736998175; x=1737602975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lO4SV4fEBS5/b96bWFRJrbo3YeXzbwO/hDMej2RItM=;
        b=v1+z5MhppuHGM3ys29c4zM4KKgO3j4wIok6Oacm+JbWsKDzz0Oe4aAeNljBnl42QcH
         J4O/VCMcwCoo8CVeT4A4dwyTJqBfyScS7/sqYw3JEXXqJlX9EJOW5Pm1mTTnWd0eCYJa
         offNCbCSzLByu8upgZiA5y6mcIj+l5xyBZ3Jkkod4N0FQeWKt/m4uhxNHdPd2LDn+op2
         P1N4+nbbIwmG6/0RIbrt8ithNGToYBfxYDKBKdVAD2OVKuodpMbx7X1g/0VYMIuOp9OR
         RNqpCe0luvubezau4vOwAuB8DN8zq/zp+RYmnh+xgboEUa2LG1TAbJv4R/vNyRILHqLB
         Axbg==
X-Forwarded-Encrypted: i=1; AJvYcCWUvKQ9Lv/J3E4F+RcuWarG0n8sw7gJRm3xxZ+Mih6nYbsjXl1V971DJ70qzEjUdyC8IWgK03JzPh+QnJLeopTY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3fsR1LfWyYiGH7wnxwtvao2QZ9RLobuiC2Co/X5e45k9CYQ0b
	wFEmLFmER5XGrtzSFIAB8yQifb05XU3olo0KYO27cH/XYKbtRipr
X-Gm-Gg: ASbGncusLOwH05hwnMI9FHhdR5jZxPYuQhMQX52DXn8A/U7LRHLbC4m76v3WjuZv3it
	vTUb7GExTBEQfT9UlcyHNypFZMuRt6CFom0WKmIOJq16A/bUQEo9iwz0BGL3zdZ9Kg9JCIQ8XMd
	kDimtrl+/socxTIiI4PBaThXKYCJWRDQhv8Nzh8F7EdP4pNCd8CDNg5uJzhwUXk/nbpTYbn6fUN
	IKo+xBLW2CqecuEu/OYTPuc5eXEJvf0sFx+/OLrHUMMA8njr0K13A==
X-Google-Smtp-Source: AGHT+IFr4zEeT47j2D8gtzZWCg1S+zmWAQ0RIesr8rmwvuje/OY6uHzv86ok/2YKYD+fA6X/sRXqeA==
X-Received: by 2002:a17:902:e5d2:b0:216:591a:8544 with SMTP id d9443c01a7336-21a83f672f6mr499273395ad.34.1736998175008;
        Wed, 15 Jan 2025 19:29:35 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21c49fsm88127385ad.118.2025.01.15.19.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 19:29:34 -0800 (PST)
Date: Thu, 16 Jan 2025 11:28:14 +0800
From: Furong Xu <0x1207@gmail.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: stmmac: Limit the number of MTL queues to
 maximum value
Message-ID: <20250116112814.00005bef@gmail.com>
In-Reply-To: <20250116020853.2835521-2-hayashi.kunihiko@socionext.com>
References: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
	<20250116020853.2835521-2-hayashi.kunihiko@socionext.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_192936_339523_B89F920B 
X-CRM114-Status: GOOD (  19.90  )
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

On Thu, 16 Jan 2025 11:08:53 +0900, Kunihiko Hayashi <hayashi.kunihiko@socionext.com> wrote:

> The number of MTL queues to use is specified by the parameter
> "snps,{tx,rx}-queues-to-use" from the platform layer.
> 
> However, the maximum number of queues is determined by
> the macro MTL_MAX_{TX,RX}_QUEUES. It's appropriate to limit the
> values not to exceed the upper limit values.
> 

The Fixes: tag is required too.

> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..471eb1a99d90 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -165,6 +165,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
>  	if (of_property_read_u32(rx_node, "snps,rx-queues-to-use",
>  				 &plat->rx_queues_to_use))
>  		plat->rx_queues_to_use = 1;
> +	if (plat->rx_queues_to_use > MTL_MAX_RX_QUEUES)
> +		plat->rx_queues_to_use = MTL_MAX_RX_QUEUES;

MTL_MAX_RX_QUEUES, MTL_MAX_TX_QUEUES and STMMAC_CH_MAX are defined to 8,
this is correct for gmac4, but xgmac has 16 channels at most.

Drop these legacy defines and always use
priv->dma_cap.number_rx_queues,
priv->dma_cap.number_tx_queues,
priv->dma_cap.number_tx_channel,
priv->dma_cap.number_rx_channel,
seems like a good option.

>  
>  	if (of_property_read_bool(rx_node, "snps,rx-sched-sp"))
>  		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
> @@ -224,6 +226,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
>  	if (of_property_read_u32(tx_node, "snps,tx-queues-to-use",
>  				 &plat->tx_queues_to_use))
>  		plat->tx_queues_to_use = 1;
> +	if (plat->tx_queues_to_use > MTL_MAX_TX_QUEUES)
> +		plat->tx_queues_to_use = MTL_MAX_TX_QUEUES;
>  
>  	if (of_property_read_bool(tx_node, "snps,tx-sched-wrr"))
>  		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;


