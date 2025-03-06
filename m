Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FAEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uf9XkZp6sUpoZuVO6jgJ6hPy2Z9ZctUdmgbqHKgrhA=; b=0HJLCV5c3f0DyvR5D3Ol9nQVMI
	06Nqr5UpM7nKUB3YwwNAEFPZZ4F5HxEWuXozgCt4TA/y5QSuFa6dIRFYgcAexmpSn0NECJAomuAYh
	jWF9E0sxgdUzHyGLPuanSGMdsrUMYL117bJwSK1EACmzvMDpkuTT2roG6HkboUqnuaUaVkM55cx/c
	G8192eyrh9T1uMeMG80MyG9k17XH8JlbG8oJFaNK0JAbP05RZ8pvdo2TFCNNPMjvVrOq9sLsqaJPK
	hc5qm2A3BMqe7DvJvXvNr1JU8qEVFxEGw21Jxk63eQ7nGEKYhO8Yj7SuKUJreCxwE+Tu2/SsryEoL
	gOwLA2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq0u3-00000009qyy-0JJX;
	Thu, 06 Mar 2025 02:24:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq0rN-00000009qmG-2psS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 02:21:18 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ff64550991so300186a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 18:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741227677; x=1741832477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uf9XkZp6sUpoZuVO6jgJ6hPy2Z9ZctUdmgbqHKgrhA=;
        b=au7heqoPJ6szDqHts+hGzk4fbbKRm8OZ+WpmZQl2DZyflvWN79RAr06o/ZbVgoQN7N
         BtKSBH25osT3tmgaS0Fe2HLT9LR3J5YywKhffZQzqe9hlbXWFjlZhVFF6Gt5vA8bk9Tf
         0UDxn3yAJrMBpMqjzI34DyHpkgMRvWRlAQvGZNaqFzF7jMLNFgUV7Vnhv8KZ/nWfbkCP
         OHQytspY8/KX9IwuPQrHj+Zyl4e7TOafS164+YRkBLIJX3nKXdAaFBKX1kIhd68PYsxm
         2B5zgmz445sbllgEzrstb8ujQx2K23wkF/f+QteluIopnLfljhWUBSz/r90vGKjwn+Uv
         ycxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741227677; x=1741832477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uf9XkZp6sUpoZuVO6jgJ6hPy2Z9ZctUdmgbqHKgrhA=;
        b=NMO0lvs6bPovan/BCBvhskvpUJkqJ/e4fKngIvYDnOv10cyYtDugVu7L+McpqTJIfc
         1Nwp9fKqDiUMEpu0RyJ6EJXtpz2sRiw5WZpihE4np3xXHTxaPIst1QHziO3TwMA+dD9H
         QSz7JnhvcfLrXBOQJzOU8pwvSGoEeIqVD/VHrDGKXC1aAcUFv+MBPOJl8J0X3ETVcaqa
         2mhk+lFLYwEHijfELvcajwftamYtbml6jbsMCe8vx4YeqMsiyC2k0IdsL/r5KZG3z2l4
         vTkYCXBv+xqyqO6by/SlYqKl++SEIiP4eDp4jipEkhO4q+v50mJmArTnBXPmcJHNVU9Y
         K+ag==
X-Forwarded-Encrypted: i=1; AJvYcCVwPVyzojE+gngBPfZqShDf8X6u/NFbmCBVLS0e2g3fvFYiq0OBFjJ448eZaQDe9nDNr7SMWAxChKsC1/x/uX0p@lists.infradead.org
X-Gm-Message-State: AOJu0YzXU4o/cl6n/E7k0NxXlMkZye7NYs0Gg3mqOaoUbvq+fzVHpTjS
	wEqH91K6uer06dmWAFzxDjO/usr41DROlwEuLlUeEAeidrU2E80k
X-Gm-Gg: ASbGnctf0jaiQIYq1DVxxq8Iu9+Ar1dwdvqUMneu5eUtYPFJQXGiXNLVbXPeXs42B8C
	axtIQgK89TiVpv5R8k9X2R/J/Y+5MuXYaDG1iczZ2HzVrEyPGZtrE31zSpV8eCPpNWsuEOCF/65
	UhIvkQ0jN688gnCyu1GfMr7FRY1WCJsTJoAIvctAXdjRhwZtStwhNyERjd2OBX1+EH0JoIG7SZ4
	QBK9BWjR6bJr/vVuzqvrSMSrL8BwcNRdHbh6twh8l4Mq25ZWaIdb35S4Ryu0Y49s/STdtaM1Din
	FCky6rACgeEmuS6rfXRwHEwPLtkanhv1JeYpcw==
X-Google-Smtp-Source: AGHT+IHkMiSrpKwGbFAkWOhgsD087E6Gf2q0MWqWgQE8twjmH+Zp7KHIpHrJbDkVmH95oKOIZuwckQ==
X-Received: by 2002:a17:90b:5747:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2ff49717514mr8399175a91.6.1741227676668;
        Wed, 05 Mar 2025 18:21:16 -0800 (PST)
Received: from localhost ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693527f9sm167239a91.11.2025.03.05.18.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 18:21:16 -0800 (PST)
Date: Thu, 6 Mar 2025 10:21:07 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov
 <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: avoid shadowing global buf_sz
Message-ID: <20250306102107.00003c31@gmail.com>
In-Reply-To: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
References: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_182117_752259_ABA4440D 
X-CRM114-Status: GOOD (  18.20  )
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

On Wed, 05 Mar 2025 17:54:16 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> stmmac_rx() declares a local variable named "buf_sz" but there is also
> a global variable for a module parameter which is called the same. To
> avoid confusion, rename the local variable.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 334d41b8fa70..cb5099caecd0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5475,10 +5475,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  	struct sk_buff *skb = NULL;
>  	struct stmmac_xdp_buff ctx;
>  	int xdp_status = 0;
> -	int buf_sz;
> +	int bufsz;
>  
>  	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
> -	buf_sz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
> +	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
>  	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
>  
>  	if (netif_msg_rx_status(priv)) {
> @@ -5591,7 +5591,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			net_prefetch(page_address(buf->page) +
>  				     buf->page_offset);
>  
> -			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
> +			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
>  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
>  					 buf->page_offset, buf1_len, true);
>  

Reviewed-by: Furong Xu <0x1207@gmail.com>


