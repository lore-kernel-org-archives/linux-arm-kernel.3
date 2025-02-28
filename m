Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C953C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxfrttinpfziJbmXgIfvT4LSMdxWcEB9U28aIsi8kko=; b=Okiz/iXWt3AXUeqD88qGFiLXNY
	X2IlXlJY858eog8DDh+bet+anqaSPuSQzJwmq5IA1Vwj/rF9HozZ/7rQGsDzdiSXJmBPMMMYXjeC3
	w5vlB9TtdiwJZSXhmCfMauIxvsOyhQjVWaGaZMwT1G6poHrDyjSfhZM3WDLUZDAkC3laXE3h0oYV3
	GQTUFKsB/G90WGlhk93Cc2pL6UQM8Smw5mTn0uk6h3TGJY4LXtACK+UZCtrIN7zojzbAnsPj9/6fF
	r6KEknCB/hB0Qlac9nUoFYuVCy5V4T0HTGe4vs/HrALswIOTZdBvbtxtnbcenx2H2lv4VR/55DRRG
	I0/LxhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqUs-00000009Wwq-0lfk;
	Fri, 28 Feb 2025 02:53:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqTJ-00000009WoP-02UF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:51:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22339936bbfso26078745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740711088; x=1741315888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxfrttinpfziJbmXgIfvT4LSMdxWcEB9U28aIsi8kko=;
        b=gLILnB82UgdwbM+3TG7oh6pAA8z3IjfKZ2MnrQihx7UlfiLSfV1HksaRnNkexL/ZCw
         5igF01T3oAIaTpFxnYYvDfqJ9Qu6AKdxFcyGoR6CqwrfydEGUyAZHl94IfwuhnDxDBRX
         z6RYUzKofwWkjWhpdnsz3lsR8cg9R73vlne3xV5ChiPcthOg+zBY6Qe5JbWqFGNsAtYR
         ogS433C7x+Z+ISKz+IAbYQdlKBTVY0HzbFp4eW44CutT23FZTbTN1n/uqozMXoRZ8u6+
         3NdODVj91iByYXDtYCIGkfEP5AUDPfdFmIwf860gWP7OwR9lJkjKU65NCFNlKMvCr01I
         eegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740711088; x=1741315888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxfrttinpfziJbmXgIfvT4LSMdxWcEB9U28aIsi8kko=;
        b=l15Ch5B1Xfmsrs5xnw2S3Ecf2RBMhyq1RtADIk14GEd68VqL/ocbTYc//Y1bJUhoj8
         WaYgHjrtbWEruuzJidvlExjyM5SHZGfbjnpipj1n1iU2JiJDI64QVak343HmBtIKI47b
         T6RZCazr8FKMEEapnKlIrtYCWzn6wp1ClzURLst6vZ/skuQCDY52zNyWSL7NlNDH/3hc
         MIdMfNa1CsNtKR6FTg6/4YnTeDbMnWE+huKGh0xAQm2jIr/OXlVTJaxD/MxQNnkmSFMg
         UypgtnuZIvpUC8p8fzmCwXOcZ3fOMpKDP9CVGDGRn/r35k0IbZKFYzGxn2VbLmskBzLh
         6Myg==
X-Forwarded-Encrypted: i=1; AJvYcCV+pitY61O3KLIQRvtNdlktBeb5PymQGH4HlS5SAXwQOZHHUPNzSl8KsYhwfJ/VqIhqN20aHYEz1IMZPIuZuNIl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2QN1o4StbBzsAu0OXlK5raY93IDPf2+JrBSRR+WHewdvZ8+bh
	hyRRlW+DgZaPAhojY4LY5OhdY+DDQ8+gxw9OqWb9G/LRPfzSt+r0
X-Gm-Gg: ASbGncsZFyNIuKtgF+u7QpYzFl9UtIEPRxsRghFItF2vIb5zQjchGMeSkD5MH9EPDDj
	cOmgAKc7f6ZpNzLmHBPAPyFhp0wqA4C+DWCJIDHXk7eEVIcDb12VwUSKoiQxolmv5lRfPurnqQE
	fXvbRdKhRfk4F4XQBiUtUqNWyq8KWfiUvih2eAGpZImm0/0nAScGazOJAFKTb9lD8sXbYwD54Bg
	sfXwYANfr61qUFQqf1jwLyIN7lkp3SwjHEJeeW/VVjf53XShxlR7ow3XQiJmRv5K/F+JqJhey0R
	nUmH9y5eBSksvsEFJzb8EKk=
X-Google-Smtp-Source: AGHT+IEKF5Ov9wR3zxBGu/lY9K2QndPcV7vnjEoWJ66hnW/s1gKFCPCGJh1hzPM3pWau6kekz6Qo7Q==
X-Received: by 2002:a17:902:d506:b0:216:3466:7414 with SMTP id d9443c01a7336-2236926a542mr23196615ad.44.1740711087768;
        Thu, 27 Feb 2025 18:51:27 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d3e63sm22964315ad.11.2025.02.27.18.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:51:27 -0800 (PST)
Date: Fri, 28 Feb 2025 10:51:18 +0800
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
Subject: Re: [PATCH RFC net-next 3/5] net: stmmac: remove unnecessary
 stmmac_mac_set() in stmmac_release()
Message-ID: <20250228105118.00002723@gmail.com>
In-Reply-To: <E1tnfRo-0057SL-Dz@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
	<E1tnfRo-0057SL-Dz@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_185129_051813_F18E0F43 
X-CRM114-Status: GOOD (  16.28  )
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

On Thu, 27 Feb 2025 15:05:12 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> stmmac_release() calls phylink_stop() and then goes on to call
> stmmac_mac_set(, false). However, phylink_stop() will call
> stmmac_mac_link_down() before returning, which will do this work.
> Remove this unnecessary call.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9462d05c40c8..e47b702fb9f9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4120,9 +4120,6 @@ static int stmmac_release(struct net_device *dev)
>  	/* Release and free the Rx/Tx resources */
>  	free_dma_desc_resources(priv, &priv->dma_conf);
>  
> -	/* Disable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, false);
> -
>  	/* Powerdown Serdes if there is */
>  	if (priv->plat->serdes_powerdown)
>  		priv->plat->serdes_powerdown(dev, priv->plat->bsp_priv);

Tested-by: Furong Xu <0x1207@gmail.com>

