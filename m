Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A71D3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQbHGrEqsKD5aF1OKVKnRulxpzJaf4NY46AhJlO9sJg=; b=B+Qr2afzLjeUTnoepjdlCQ7DN3
	I4/tPAL7LmpEVfimy3tpWJiKj0Wqs/a7afaEOmj5yxNsoKL30PNvxGwmGKYvNQDdAx5tTebh1NLDR
	pmTVsHpYekvADRLgEKUWMgBhxJ/erbKoxwVjjcmUb/fGYUzdDVkWk3jE/I1iII4oClgnpURadCqxx
	9o1A7dECoBU0Z3eUSKkJeiK8WU8e7B7b8hn6udvtIvLbBBSvVPzs90nag89bZ21iFsXUmo/lEtDtM
	5JKXQdg7U1bhEQoVUJ1PaPXASunQ/ECuOVBUA8qNpwXuNmb3kicOG44hNwmLFYhLwfdlePgkahGr6
	YtYz6W8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sOJ-0000000FiGO-13e1;
	Tue, 29 Oct 2024 20:00:35 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rKX-0000000Fa7l-3s8z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 18:52:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d450de14fso518095f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730227955; x=1730832755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cQbHGrEqsKD5aF1OKVKnRulxpzJaf4NY46AhJlO9sJg=;
        b=DJ6TrXk1TP0GJ2XNyGoffFgVg/TGpdE2YXOdNVk96f689YmIns7cMdunK/s/rNfayY
         LTw2XHor5uZqEtlBSKDaXEHCm4P3pLOY10qgoyroxHZ+SaDQl+gy8RSaRV6k6itL962y
         vm8qNddXZYL5O1cWZByafStcFJMgb8nTHQonVUNEVC0bQxyV7DuJl5P/lXYGJQc8Ue+F
         jCmQ0AyX1OeB2WzmMLpsp/K+nFcnniFAGN7IUSJI5eOwxCnQbLC2SYsdmDgjSt5VBHBt
         vheq4FjHGGux8Y1O3MCVjXxk5QrFDBKqAB3MtWe5DqA2zxhPs+vzm0h6Y1EmljzanTlS
         qp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730227955; x=1730832755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQbHGrEqsKD5aF1OKVKnRulxpzJaf4NY46AhJlO9sJg=;
        b=A2kYHKsM2C1Ror4LaMpEppcPsIFw+I+jOZ+Q+lnDPWg4y00J2X+xAzc+HWKrR8D2co
         CxHmTwwiVv4pRmGSqIE/9e0fCzuHMzteZJuh2afzkQkCsHXxvGCwpU+KEHZskOc3DZPr
         WhtVrD5Pdo8MJmz9S/iaQIAOS0ffst8pFdM2v8JTokpNYldY9t/AJvrIjUu5wJ9GC7LC
         a1heKgWee5e6fsLKCoNVe/tLyiTIwMreWwwEPUBGxpsnowRtW4433uwNYq43+uf0TSSi
         jqmXXOd+F2CACXeuZqHxobze5lxIMBMzagz9HVWgSYUXUrrxR/AjT2IM1wvrDqhDmcyP
         Ff1A==
X-Forwarded-Encrypted: i=1; AJvYcCU1HQZvnqWSOstw6qyQiFAIb3zCy+vC4uNYNixWddzyH40Yu3CTIhTWheVFk4cxwiF4dExnhlaQVas1IIfBjtVN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4DfCCq95fQix/vPKFQyKJTX7xvdrV1Svlpbbu4GElq95RhyXc
	68d+BpUCXzadeS7BmmKngfBzzOcC6YRN2yuuNDWwnX3Oldlh/BMw
X-Google-Smtp-Source: AGHT+IF1JuH5GETYzM48l9lfnZfPVRTjPuBUwhpTxF2mnfjmnhq15lSAoKb5oQuP+txb+/2Ssczf8A==
X-Received: by 2002:a05:600c:1c29:b0:431:50b9:fa81 with SMTP id 5b1f17b1804b1-4319ad368f4mr46064815e9.7.1730227955179;
        Tue, 29 Oct 2024 11:52:35 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573e47sm154555825e9.8.2024.10.29.11.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 11:52:34 -0700 (PDT)
Date: Tue, 29 Oct 2024 20:52:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v5 3/6] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <20241029185231.fgy6tofi2uoslp3l@skbuf>
References: <cover.1730084449.git.0x1207@gmail.com>
 <0f13217c5f7a543121286f13b389b5800bde1730.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f13217c5f7a543121286f13b389b5800bde1730.1730084449.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_115237_986877_836314C5 
X-CRM114-Status: GOOD (  18.21  )
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

On Mon, Oct 28, 2024 at 11:07:26AM +0800, Furong Xu wrote:
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
>  	unsigned long flags;
>  
> +	if (!priv->dma_cap.fpesel)
> +		return;
> +

Minor nitpick: all call sites also have this test already.

>  	timer_shutdown_sync(&fpe_cfg->verify_timer);
>  
>  	spin_lock_irqsave(&fpe_cfg->lock, flags);
>  
>  	if (is_up && fpe_cfg->pmac_enabled) {
>  		/* VERIFY process requires pmac enabled when NIC comes up */
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> +		stmmac_fpe_configure(priv, priv->plat->tx_queues_to_use,
>  				     priv->plat->rx_queues_to_use,
>  				     false, true);
>  
> @@ -154,6 +161,11 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
>  	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
>  	timer_setup(&priv->fpe_cfg.verify_timer, stmmac_fpe_verify_timer, 0);
>  	spin_lock_init(&priv->fpe_cfg.lock);
> +
> +	if (priv->dma_cap.fpesel && !priv->fpe_cfg.reg) {
> +		dev_warn(priv->device, "FPE on this MAC is not supported by driver, force disable it.\n");
> +		priv->dma_cap.fpesel = 0;
> +	}

Let's not change the output of stmmac_dma_cap_show() sysfs attribute if
we don't have to. Who knows what depends on that. It's better to
introduce stmmac_fpe_supported(), which tests for both conditions,
and use it throughout (except, of course, for the sysfs, which should
still print the raw DMA capability).

Which devices would those even be, which support FPE but the driver
doesn't deal with them (after your XGMAC addition), do you have any idea?

>  }
>  
>  void stmmac_fpe_apply(struct stmmac_priv *priv)
> @@ -164,8 +176,7 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
>  	 * Otherwise let the timer code do it.
>  	 */
>  	if (!fpe_cfg->verify_enabled) {
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> +		stmmac_fpe_configure(priv, priv->plat->tx_queues_to_use,
>  				     priv->plat->rx_queues_to_use,
>  				     fpe_cfg->tx_enabled,
>  				     fpe_cfg->pmac_enabled);
> @@ -178,50 +189,54 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
>  	}
>  }
>  
> -void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			  u32 num_txq, u32 num_rxq,
> +void stmmac_fpe_configure(struct stmmac_priv *priv, u32 num_txq, u32 num_rxq,
>  			  bool tx_enable, bool pmac_enable)

num_txq? not used anywhere. num_rxq? can be retrieved from the "priv"
pointer already provided.

The rest of the series looks good, I have no other comments.

