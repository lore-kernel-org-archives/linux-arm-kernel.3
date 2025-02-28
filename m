Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E5BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boGNm2RHbfdjeQuZKJQLhCH8tI0ZaSHF+L70lDAp7g0=; b=ykebtUV1sRsCytGdvvktSX2W5L
	6nwwSKWPeYqEP1kMZP52/U1mXZ/mVao2/itGMf1tp08bhuunBLk5BhN0VS76d0VvAXVmrTnw85uC3
	sLPyOn5Srfmwrwc1KTyrfUUp3vYgfrjI0SJyk39M4q3RRbxW3XD3KoO7ejQGieBpYGvdh3Dav8jXx
	hVyFc7/4FQxYXvsPCZGG/m6AQh0c53kVsGngr7o9y40qbKgsIsxIKd9K9hYsPRbXfHNMESfa0NgMi
	FMv+gzn8FV9QFTUeU5xdbFnqtfIEqchNhk3+wOqnM5pCuhI57zgduEdC3HZYZP3whqU/SHl0hQFis
	569xLF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqWO-00000009X3L-3N6y;
	Fri, 28 Feb 2025 02:54:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqU0-00000009WtK-2re5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:52:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-223378e2b0dso25343575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740711132; x=1741315932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boGNm2RHbfdjeQuZKJQLhCH8tI0ZaSHF+L70lDAp7g0=;
        b=aVjoCK8MTMyqoCIUPFPCXdSBTZ7jTOkBcYzyxLHePPktqiRc7gpBgq2l8F1Qv/V4as
         Gr4V5eNM4LKI5oh+DPglFYyMyl5ZV6OQQKAnffv4Is1dJNcFkH6M3VHzRFFQiYr2JBei
         eJ4vB8NDvhe7z2YB5gaMuNDiX3kchE9OGiNjxd6hcXwwN0v858qO+dgKpNMZi2nSMWyy
         qVGDLmxcJcPqSo3dFYFc97B7smrB0VgC4iFX2ioza4Dlpob2dUSd2BRdOUmk/DVwQh4G
         emNGNxqditejIL57ki4VA5ssrJufCa2LW/WJ7hL/tXGsmFxbW8ihmiGEKPaTA0tmkrL0
         LGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740711132; x=1741315932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boGNm2RHbfdjeQuZKJQLhCH8tI0ZaSHF+L70lDAp7g0=;
        b=FYOeztkJDFW3v7VJl2q0x1zlnWLWXqCEbYZhqGGliY61B3RgXOs+Df5WxcRu6d7fa2
         NbI2XQyylCgsdu8PkrRLlWPnHlBJd1DiH8Vjx1fBdRu4IMPq7d8dh8TQMUo4zt5Hk/T/
         4+1agDalgpoQ/85LE5u5qaj4mvWMxfEf1HWhhv0Kse2D4TKrq5hLNw9gnFR8PSfwqV6m
         6A+A9Ijh7pGN/IMy+J9wWfKAU9BcHQkOAC3vtBXIM4LP3Dq5QrGp2CPmiWV+LUC22g/V
         /PC4LvYISjyxVfkuYkwf1fkQDDWfHDYCUMdIuZ+JMY6Co53FgkLDVB+muh2zdJ16gndv
         j0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUYxvBPHFVo/+wgqUDhMWisQuFbgnNpLwfuYZmDCgwZCpFZln/nRpEzIbz3tESvDJy4OLOL0D9tXZQu88lkKXmm@lists.infradead.org
X-Gm-Message-State: AOJu0YwVo8jk+3+dTM+emiaOgbWJcb8hVfcOdPoU9T7SnVK7zGf2OIMV
	1OTgadFxnFqDbM0D8MkL/mrXEvuTOpB4S11TUS5Nqi/9HHzp4Uhv
X-Gm-Gg: ASbGncue6pg0DGal5XkgVXtofN6LCTj8sqmNGQI5c0YFyMnmoefY2qTIxbqEnvQfcbM
	+9oVNucLvTH+fkf4U0IfARBWXxXuo+ZX3iSP1hHoSjPDr0ZxVnARqS5hdSoaYXFk3e6zhAEcsGa
	WGmylEbtpgmCAfM6Jubkc63sWfYaFU8dsd9kQeS9QUzRLU+RvCJu7JIoesb/Ogy+lvhY+qS09e8
	jkMq64sNpqxyuyM5Idc+OPDlfxsvZH1L8VqEpV/lP/hLlg85T4nbxZkf+IK/lJWiKpNke+JC6m0
	7+E5U3SuAG6EBHzEufNI8Oo=
X-Google-Smtp-Source: AGHT+IGQJlnrpGPiZBb33hDJef87VPOt8uSo1pNSRv/iEORfCM/cnXJBkr2516ecg+lJIS6ML0/RpQ==
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id d9443c01a7336-22368f71b7amr24670965ad.4.1740711131676;
        Thu, 27 Feb 2025 18:52:11 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d287dsm23054945ad.43.2025.02.27.18.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:52:11 -0800 (PST)
Date: Fri, 28 Feb 2025 10:52:02 +0800
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
Subject: Re: [PATCH RFC net-next 4/5] net: stmmac: remove _RE and _TE in
 (start|stop)_(tx|rx)() methods
Message-ID: <20250228105202.0000635f@gmail.com>
In-Reply-To: <E1tnfRt-0057SR-Hx@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
	<E1tnfRt-0057SR-Hx@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_185212_726681_257A600F 
X-CRM114-Status: GOOD (  16.96  )
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

On Thu, 27 Feb 2025 15:05:17 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Remove fiddling with _TE and _RE in the GMAC control register in the
> start_tx/stop_tx/start_rx/stop_rx() methods as this should be handled
> by phylink and not during initialisation.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 --------
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
>  2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index 57c03d491774..61584b569be7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -50,10 +50,6 @@ void dwmac4_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
>  
>  	value |= DMA_CONTROL_ST;
>  	writel(value, ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> -
> -	value = readl(ioaddr + GMAC_CONFIG);
> -	value |= GMAC_CONFIG_TE;
> -	writel(value, ioaddr + GMAC_CONFIG);
>  }
>  
>  void dwmac4_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
> @@ -77,10 +73,6 @@ void dwmac4_dma_start_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	value |= DMA_CONTROL_SR;
>  
>  	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, chan));
> -
> -	value = readl(ioaddr + GMAC_CONFIG);
> -	value |= GMAC_CONFIG_RE;
> -	writel(value, ioaddr + GMAC_CONFIG);
>  }
>  
>  void dwmac4_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 7840bc403788..cba12edc1477 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -288,10 +288,6 @@ static void dwxgmac2_dma_start_tx(struct stmmac_priv *priv,
>  	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
>  	value |= XGMAC_TXST;
>  	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> -
> -	value = readl(ioaddr + XGMAC_TX_CONFIG);
> -	value |= XGMAC_CONFIG_TE;
> -	writel(value, ioaddr + XGMAC_TX_CONFIG);
>  }
>  
>  static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
> @@ -302,10 +298,6 @@ static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
>  	value &= ~XGMAC_TXST;
>  	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> -
> -	value = readl(ioaddr + XGMAC_TX_CONFIG);
> -	value &= ~XGMAC_CONFIG_TE;
> -	writel(value, ioaddr + XGMAC_TX_CONFIG);
>  }
>  
>  static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
> @@ -316,10 +308,6 @@ static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
>  	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
>  	value |= XGMAC_RXST;
>  	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> -
> -	value = readl(ioaddr + XGMAC_RX_CONFIG);
> -	value |= XGMAC_CONFIG_RE;
> -	writel(value, ioaddr + XGMAC_RX_CONFIG);
>  }
>  
>  static void dwxgmac2_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,

Tested-by: Furong Xu <0x1207@gmail.com>

