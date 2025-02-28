Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E122C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEo5Ilj/CnKUxlNE5iH4oY22/g/iUpKFoP4fBLWqvpA=; b=WlFrGBb22DNTLAqxNjBoqqiHj0
	yf86houha4tIC24S+9+C9F2aIxeiAWo1qtAo0EZGfKrUu/coigK8gK+OeiWWX0MpUTK58uPazAptg
	tvVdXfCv5KzTBBdMJVO/CgmUkYRj/cfSiS4z/TI/7d/iiwYBOOePDhxDpephKTzgCS9Ql5kuX3Yfh
	FQXkCPTfKgSECHKNzKg5VSxO7kFgvejEBHg9HWThkOmbC8WCNT8RpxdmLUv1NdP33ieeNrezn8x1c
	U6/KvYNadHe81t10WX+EtVyNrAl91Yl7wJr9sGB7S+TRl/CVwXLuheGT+y1Qg747ZAGbpgzZDZTG/
	ZcLNc8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnusC-0000000A0Un-2QBV;
	Fri, 28 Feb 2025 07:33:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuqQ-0000000A07o-2BWD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 07:31:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2234daaf269so47832095ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 23:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740727897; x=1741332697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEo5Ilj/CnKUxlNE5iH4oY22/g/iUpKFoP4fBLWqvpA=;
        b=nciqkrbpu5p5UguGR6jSSYrP+CbLzu7dK5+ffKEFKYwNZUNJDRirS2FjmSIZo63nzN
         vaSTpPhIyxuxRSZZMHhD1j0H9bzq8VOtXN7EETCp1S3VCysfEJg6p8jBcqdTBE3RNfc0
         1cJEq14DT2eFT0nCXLXJRkVRT2+Uqfgq7yg1W6xPRAiEJxfiARaZGBxLhVeSTw2V21E+
         /YzCT2ta0R1DUbokrEisFkzypvEwdxYFMZ6QaM7qqdThbfkjNxEiHQza+ZvUyCp5+4aM
         0PZ366o4BugDLgtl19YaOJOoiUOcCOdIl7xTrW3QI/36yMhlxJ0krLBDgl6F93bhCSUK
         PP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740727897; x=1741332697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEo5Ilj/CnKUxlNE5iH4oY22/g/iUpKFoP4fBLWqvpA=;
        b=sFDwM2ugTsr1Huxj0ccbw8FqUOQCoKDwpLR7icv8uRxlGxQpSZGVVbuhvbrVijuMOx
         xVuT2P9DHy5VxNtsUBT/EYggtAE3OAlWK3kYafDa/1ZXUSEnKXUi3m42JrNTYNTNZ/hL
         lzg6QDdLtvDTbZw65VwLCfhk86j817vy/yuVKM7s+VMSxLBHPvaxVGKlN0GvXDGzR4bs
         0gsfBrFu+9oSFdCbd7/Kc3Klmf/iz/sCjut7RgZcoMU69ULY0KnDpMwnBM2Vb6vT4HMp
         20QGZ144TBIwAXSHfkS9J3DuB201xCjPu5SNsyqUe6xmcGOTJbXE3pZF1HaSgY3uDeF7
         bIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg71O+DHj+0FLcRIwSykX2HERlLRyXN52R4lGnu9jw+pUjb5w0PSCY5RO/pv9E5iNKSSjT+nNISBFFchgB/nGi@lists.infradead.org
X-Gm-Message-State: AOJu0YyL5m/5Lpc7rwklFqTW+IkS0fbiikKWuexC/ZUHERoJ/USMjfIt
	jqj32vgYmR+47XH+N7fw7yLT9dRmcTxV9pZwmobkG+BZpW+bXfVP
X-Gm-Gg: ASbGncv+0pN2b8RWPQjCMHTlcMyM3jV/QcY3+SVE00Yh+gNoNiuExAWqJKIIyae/KAX
	NeZYQShQXCGM5rpdcuV2q9p8rfRRBV97moTlrwTpp0IB+BByib9WVY/f7/eGzhCveOk3eD4xp5z
	HEdavnN/YYvOfWolyXp1wpbNCpErr9y3CabJxRDYtmy+AVg7RS87wPyTvZMcumETR5u29zjt6zE
	02s9fK7aspGwM7tZC9iQn7b0GimgaT8A8QInmDJjDLt/i2vbCcj/fjyU380hJKBAw6LnvSgqE9t
	V56q52rNZitghFM1JcUsdCI=
X-Google-Smtp-Source: AGHT+IFrEMfFeWVgVjwA/8gquLeiMkDUEwznolmMGr2Xy7GVL3JkNx1UIJph/S+ONtF7kGxuiKo4sQ==
X-Received: by 2002:a17:903:292:b0:21f:7e12:5642 with SMTP id d9443c01a7336-22368fbee43mr34263825ad.18.1740727897464;
        Thu, 27 Feb 2025 23:31:37 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe999a5a1dsm3795470a91.33.2025.02.27.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 23:31:37 -0800 (PST)
Date: Fri, 28 Feb 2025 15:31:22 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jon Hunter
 <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 1/5] net: stmmac: call phylink_start() and
 phylink_stop() in XDP functions
Message-ID: <20250228153122.00007c75@gmail.com>
In-Reply-To: <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
	<E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_233138_563141_58240708 
X-CRM114-Status: GOOD (  23.73  )
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

On Thu, 27 Feb 2025 15:05:02 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Phylink does not permit drivers to mess with the netif carrier, as
> this will de-synchronise phylink with the MAC driver. Moreover,
> setting and clearing the TE and RE bits via stmmac_mac_set() in this
> path is also wrong as the link may not be up.
> 
> Replace the netif_carrier_on(), netif_carrier_off() and
> stmmac_mac_set() calls with the appropriate phylink_start() and
> phylink_stop() calls, thereby allowing phylink to manage the netif
> carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> methods.
> 
> Note that RE should only be set after the DMA is ready to avoid the
> receive FIFO between the MAC and DMA blocks overflowing, so
> phylink_start() needs to be placed after DMA has been started.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 13796b1c8d7c..84d8b1c9f6d4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6887,6 +6887,8 @@ void stmmac_xdp_release(struct net_device *dev)
>  	/* Ensure tx function is not running */
>  	netif_tx_disable(dev);
>  
> +	phylink_stop(priv->phylink);
> +
>  	/* Disable NAPI process */
>  	stmmac_disable_all_queues(priv);
>  
> @@ -6902,14 +6904,10 @@ void stmmac_xdp_release(struct net_device *dev)
>  	/* Release and free the Rx/Tx resources */
>  	free_dma_desc_resources(priv, &priv->dma_conf);
>  
> -	/* Disable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, false);
> -
>  	/* set trans_start so we don't get spurious
>  	 * watchdogs during reset
>  	 */
>  	netif_trans_update(dev);
> -	netif_carrier_off(dev);
>  }
>  
>  int stmmac_xdp_open(struct net_device *dev)
> @@ -6992,25 +6990,25 @@ int stmmac_xdp_open(struct net_device *dev)
>  		tx_q->txtimer.function = stmmac_tx_timer;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Start Rx & Tx DMA Channels */
>  	stmmac_start_all_dma(priv);
>  
> +	phylink_start(priv->phylink);
> +
>  	ret = stmmac_request_irq(dev);
>  	if (ret)
>  		goto irq_error;
>  
>  	/* Enable NAPI process*/
>  	stmmac_enable_all_queues(priv);
> -	netif_carrier_on(dev);
>  	netif_tx_start_all_queues(dev);
>  	stmmac_enable_all_dma_irq(priv);
>  
>  	return 0;
>  
>  irq_error:
> +	phylink_stop(priv->phylink);
> +
>  	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
>  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
>  

XDP programs work like a charm both before and after this patch.

Tested-by: Furong Xu <0x1207@gmail.com>

