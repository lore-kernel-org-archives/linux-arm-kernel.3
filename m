Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4F4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 02:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2hivNpIs9Yw9hGUFhjmLsY68kEzvfhce8DVHWNRyC0=; b=CQRjFEUa40zfoDiCf6L4Ozy2Ff
	9XSRNoF/vQitd58tgeGVBZf2z+T3jclaARSyLIyY9XwBurE48H3WhhDA/dBRn+Sp9VBxTn2lRVfHz
	4GqD0DdhvktY2Yg98rdb9ShwX9rTH8SA0407MYW1c5NxbY8NQ4yMZi53qPCr5lDu7GGEoqHigATES
	YHP1ezkZZVfJfnP1vrBjxAz/Wd6Sgcjp8RND3KcRm+jl+AiJ863WG5pu7GPN3pwb4xZoiNpYJub0H
	821ktbJY9IEU7YfmmemFETKIbGFuWO/hlS0tJZMrur1irsuiwIyXI43WL8ZCUiI1Mjm9Tg0KH9KjX
	J6v/IcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq0sU-00000009qsB-1JI1;
	Thu, 06 Mar 2025 02:22:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq0qt-00000009qiq-0Jzv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 02:20:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2239aa5da08so1464845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 18:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741227646; x=1741832446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2hivNpIs9Yw9hGUFhjmLsY68kEzvfhce8DVHWNRyC0=;
        b=DOqTNmmA0babYwHHJG7GXZKvqkeLGz/sMzsOt07UXJHWTfmnLuZBHk5y3abf6xWeXd
         8QEvqsg9CLAEXqmQlMPJHJwHlO2r4OPPI2B4EwBj4Rndkl32okmrHpDNhIitpk/4c1D4
         gQgosTq38VUcZ3vXCrgaPq9TAYZFP+/AaVmnYUhsceaXjGTeGTPjZ7N4Z+BpMO2+csWn
         TIEq9aDMcrBe5/runuSE6kZ10To6nQ7tjt76dJrNMoad9AL9DinZqzCsvdufF2abe/3J
         NkRi0r17d98HIXFwhS6lUoPAurClJdwXg2x1QCUZLB/JJtO8iisljc7saAL9Gac2xhTU
         49Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741227646; x=1741832446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2hivNpIs9Yw9hGUFhjmLsY68kEzvfhce8DVHWNRyC0=;
        b=ISYUhKnvNXQjMv01buEyQukGwW/Hqg6dhweVS8DcSIuYwq6zTkzVm50ovwGwX+jEBG
         HGHgs+HnYBJB5/Z0oK/HeopeHlKooS+x6/vaogSLgxZf0G/kLl7YNoUrUx092kinNNzZ
         4svccMnmx3QEelRqTWP/z3fEGrNcLvltXNKwjGUAQ+G4YY+BxJslWFjF0ulnmn2P7IjG
         w26EcOs9OIi5Kob1uz07XLMvBd8WlRAtjitye0NyGx35sWraRj2Tmraame4XmAulGmaC
         2SwNHwWpRDHXjG8oK4gdRK3ZQ9MEdtvfmVrIFZJuTQYwDJw1Q7IuDbqrVFT7vK22qSWS
         k3xw==
X-Forwarded-Encrypted: i=1; AJvYcCUv3cPbw9vTvUQn7dufZBYKWesotgYvCgNWUjTwoQKwPt3K+RiToCkgEs2TvOVgdFbV+Cfx9Ukb9A/XFKLNmZpL@lists.infradead.org
X-Gm-Message-State: AOJu0YzYlJ0efBS1zG1lTi4L0RmE+DjJ7JObB22ttuGKR0y2o/28/YAl
	UUr1Fk5fyn2jT7YZo56/XFOWTP/BxHbDj7b1Fow+vcoYFUvbofxt
X-Gm-Gg: ASbGnct/eahpqAc/OtbRo7Oq917cEufmvG8RwS0m0Djf7dKEDGbwk0U+ooETL1ek9n+
	xSMuB3cuDSM4oGqi/LW86rriRpErtp05HQ/0NoTif7j9cBem/9VVLD69M4zZ47HAp8/43wy4SQw
	pnr3YKctH3YSHTf0tUlSx7rkRllvD5Zf4QZt7hMnsNn8DchZUEdn/VsTcqJE95UiP5PMRxRGYM0
	w4tDPK+mAu+wJ3+DURLoeUAuzd0PspoExcJIl4LqMQLW4+j7MTjG3brrMV04A24xJoMXMPZ2UFZ
	YjK+ErJtImMyD9angtygIoNkS693By3bOCjg/A==
X-Google-Smtp-Source: AGHT+IHkLXtXH1Ai+gYOOPrG6bG0WcyyOkT8w2yuVJZyzRqP4bS4nX9Piol8DXMXXfkC08Bx4bmSFQ==
X-Received: by 2002:a05:6a00:1788:b0:730:9502:d564 with SMTP id d2e1a72fcca58-73682be6b5bmr8585186b3a.14.1741227646199;
        Wed, 05 Mar 2025 18:20:46 -0800 (PST)
Received: from localhost ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736985387d3sm147939b3a.172.2025.03.05.18.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 18:20:45 -0800 (PST)
Date: Thu, 6 Mar 2025 10:20:37 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: mostly remove "buf_sz"
Message-ID: <20250306102037.000007ab@gmail.com>
In-Reply-To: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
References: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_182047_128054_30A90EF2 
X-CRM114-Status: GOOD (  22.67  )
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

On Wed, 05 Mar 2025 17:54:21 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> The "buf_sz" parameter is not used in the stmmac driver - there is one
> place where the value of buf_sz is validated, and two places where it
> is written. It is otherwise unused.
> 
> Remove these accesses. However, leave the module parameter in place as
> removing it could cause module load to fail, breaking user setups.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index cb5099caecd0..037039a9a33b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -101,6 +101,7 @@ static int tc = TC_DEFAULT;
>  module_param(tc, int, 0644);
>  MODULE_PARM_DESC(tc, "DMA threshold control value");
>  
> +/* This is unused */
>  #define	DEFAULT_BUFSIZE	1536
>  static int buf_sz = DEFAULT_BUFSIZE;
>  module_param(buf_sz, int, 0644);
> @@ -218,8 +219,6 @@ static void stmmac_verify_args(void)
>  {
>  	if (unlikely(watchdog < 0))
>  		watchdog = TX_TIMEO;
> -	if (unlikely((buf_sz < DEFAULT_BUFSIZE) || (buf_sz > BUF_SIZE_16KiB)))
> -		buf_sz = DEFAULT_BUFSIZE;
>  	if (unlikely((pause < 0) || (pause > 0xffff)))
>  		pause = PAUSE_TIME;
>  
> @@ -4018,7 +4017,6 @@ static int __stmmac_open(struct net_device *dev,
>  		}
>  	}
>  
> -	buf_sz = dma_conf->dma_buf_sz;
>  	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
>  		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
>  			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
> @@ -7973,9 +7971,6 @@ static int __init stmmac_cmdline_opt(char *str)
>  		} else if (!strncmp(opt, "phyaddr:", 8)) {
>  			if (kstrtoint(opt + 8, 0, &phyaddr))
>  				goto err;
> -		} else if (!strncmp(opt, "buf_sz:", 7)) {
> -			if (kstrtoint(opt + 7, 0, &buf_sz))
> -				goto err;
>  		} else if (!strncmp(opt, "tc:", 3)) {
>  			if (kstrtoint(opt + 3, 0, &tc))
>  				goto err;

Reviewed-by: Furong Xu <0x1207@gmail.com>


