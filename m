Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31B8CF538E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgEr86OeLs+qLPckKWtoHddsgWSl6fk02nvmP20gJ1s=; b=ScpCj4EZAxxJCvzsaHLbqgFwNO
	p/C4+3xISonGqZTJZjmy05GlY2Wz/ZXBX7Ts6+jBygJUM79PiR8Ksk4Zigg2IRrCPBvNO6IXxcGV0
	ZphTUlCH4WaYpcIh2sQFNhn/uVr+j9wAS/Gyv7HPo187wuJ+1UV0K9iLhSDTGIABVq2B1TMbxhgVn
	TwT3/3DBxVfAl6uFlreIWogg4f/ZdqVllFNeG9zJPsRdRjtoGn/XzZ0XqvvRHq0zIe9z9I2AX/cgH
	F9K600K77Z4rQ4tT09e4IhxpeN8x87MMAA74LggjfHM1KiiyEKkL15Y0O7sV1OT5pOKChLeADOoUb
	M89ZqWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cC9-0000000EffF-3NmG;
	Wed, 23 Oct 2024 14:18:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cAc-0000000EfUU-0fOT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:17:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c940512711so1228376a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 07:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729693024; x=1730297824; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RgEr86OeLs+qLPckKWtoHddsgWSl6fk02nvmP20gJ1s=;
        b=UE73F7OT5V7708SO4Ayxhc073KV88JafuOBCjSyAuH/MaPXgv7ARZI2ZuXQiZRfaVX
         LO9ystpFjxFkQbTk2czkLWV9Sjv8L6SGbtTQGtgyIw1ArxIwRS+1Lf8xrfvnwL9/bq/x
         maRrjbqZAeCBMGT7s4tZJuWs3Br37KtLDP9kRjJWr5fTNN8TwT09x7EcDPlLVBU12dKw
         WIV90IMPuE8J+cqDjoIHyVBM7fCOkSwPA4RR9vdm1tHOEJj2so6XSzgKE4sg1dc1uBG8
         t9dc/mlUuSXLI7RLZLVJjk01cv/wPRAriP+uWMLyPa++Cca70j38Ho7PULoZKQwQS6US
         xAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729693024; x=1730297824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgEr86OeLs+qLPckKWtoHddsgWSl6fk02nvmP20gJ1s=;
        b=WQgjoTOsEf/zd/BL9TcO+s+BHsssviOZL4Ufne+QZt/0AVesnVFdUQy5AK4NXY+quW
         tn685HxVDGRlrs3rnQwY02qEJ8u/H3sa9NP9g4HpC1joChx1cqqC9Ey3yJ3/KpuWbir5
         ch/GfokQRTYiTMLuEkxA2n3RI0e60tKluA5DM/deIBVwORMp/13O1ixB7LGqCRt2gCYo
         C4zQbGb2Miu7zR1ihOAGxmkhz6fTnsm4aD+p1TvYHZzpk02XtHD4BD9mfwlgaezbyL8n
         K+vIPlveDvEWW1i8gsTnGTUGMp204qoDk6jVHBlrNnBcV/NT1Z+Hg3tWamMT5QJ2ANW7
         erGg==
X-Forwarded-Encrypted: i=1; AJvYcCWffqeQKUqZ8zeWR/ipVkfPJPfIDElJKrxP1YV25xZklJ5ArcYxUUNXjiKODAyC7/u+Jpn0TdOiVuVSEeRZe+Lg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw1+qohGK0IgNgLfmUi0eL7p6BBMouTxw4nJQnDM46FxWXfvmM
	br+JPfsxqsez2P89FNs/LOZRzKZzCf0ccjiAkQSU4R5m7YR4qmlv
X-Google-Smtp-Source: AGHT+IEV0YikMikXJEsk3rCrnY1FH/p9IQzfHmP4dSCxt90dLsVCtjcMi6dhpcSlH+cOBzDnw0R7Bw==
X-Received: by 2002:a17:906:f5a7:b0:a9a:5b78:cee5 with SMTP id a640c23a62f3a-a9abf92b233mr112552866b.9.1729693024025;
        Wed, 23 Oct 2024 07:17:04 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9137053csm481018066b.115.2024.10.23.07.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:17:03 -0700 (PDT)
Date: Wed, 23 Oct 2024 17:17:00 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v3 3/6] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <20241023141700.niz3ow2xu6pbgbg4@skbuf>
References: <cover.1729663066.git.0x1207@gmail.com>
 <4949cb6845b8a4e7c79af4165814fad270459f7b.1729663066.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4949cb6845b8a4e7c79af4165814fad270459f7b.1729663066.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_071706_255123_3F3C1FDC 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, Oct 23, 2024 at 03:05:23PM +0800, Furong Xu wrote:
> -void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			  u32 num_txq, u32 num_rxq,
> +void stmmac_fpe_configure(struct stmmac_priv *priv, u32 num_txq, u32 num_rxq,
>  			  bool tx_enable, bool pmac_enable)
>  {
> +	struct stmmac_fpe_cfg *cfg = &priv->fpe_cfg;
> +	const struct stmmac_fpe_reg *reg = cfg->reg;
> +	void __iomem *ioaddr = priv->ioaddr;
>  	u32 value;
>  
> +	if (!reg)
> +		return;

What are all these "if (!reg) return" checks protecting against?
At all call sites you ensure that priv->dma_cap.fpesel is true.
If defense against driver writers is necessary, check only once at boot
time that if priv->dma_cap.fpesel is true, we have a way to handle it
(priv->fpe_cfg.reg is set). Or are there still supported DWMAC variants
with the FPE hardware capability but without driver support?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ab547430a717..7874a955ab60 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5944,8 +5944,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
>  				      &priv->xstats, tx_cnt);
>  
>  	if (priv->dma_cap.fpesel) {
> -		int status = stmmac_fpe_irq_status(priv, priv->ioaddr,
> -						   priv->dev);
> +		int status = stmmac_fpe_irq_status(priv);
>  
>  		stmmac_fpe_event_status(priv, status);
>  	}

I think this coding pattern is illogical, and the code refactoring makes
it more apparent. stmmac_common_interrupt() does nothing with "status",
it just takes it as a return code from stmmac_fpe_irq_status(), and
passes it to stmmac_fpe_event_status(), both of which are in
stmmac_fpe.c. Why isn't there a direct tail call from one function to
the other, to simplify the external API exposed by stmmac_fpe.h?

> -- 
> 2.34.1
> 

