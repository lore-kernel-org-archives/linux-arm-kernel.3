Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F032E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QB7Gju0RIgr9jLJ+t5Q7M0pre/bo/tmwE6J1WO4l68M=; b=Z+ejO/m8hmqnUyKe+I2pavBL69
	KLRNAIrGeQRW04WWSl+vGYfhtTb8Z/xJ6uYNvSesaXD1i91hGW2jDgWwDuYu+g02tpcozZbatREUI
	oRNOp5FfwObcKu//KIVWrN8Pun3zUhIFMd/IoggDkufacH5FsSEo175oZlg0z2tHPNZofsrhUrlEE
	K/fVXOM09UIASkDkTwIJGUWE1CA9wPoP6IHWJQ5rWI5RpZihWSmVHRft0aIYnXgI7tgiAWeaUPCXi
	hLoP+F8nHSlDqDX7GJeODVe8CWpeNXAGSf6rB8Y5Es6ii2xOZBGDcfvd+0fZwAytbBxxUOqa/1z6t
	i+yNz5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqS6-0000000A7gS-1ksx;
	Tue, 14 Jan 2025 23:36:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqNJ-0000000A74i-32eY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:31:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2163dc5155fso111917695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 15:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1736897468; x=1737502268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QB7Gju0RIgr9jLJ+t5Q7M0pre/bo/tmwE6J1WO4l68M=;
        b=fDI8a3P4u3DjtaMBs5GOQqg3GYAAUGU39IjJ3iNNTbveuZ1oN17Ir2IWdbViO4zRbC
         m5XTWBDuByXjYXbD+4b0LcVEWZGsj6YxGT0E9Qb3wEGHHe+Mt3hGXsJtQPurjcd1GDpS
         nS2T//lZHp6BY1/dsIlbZS/Gyk32QPeOKtfSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736897468; x=1737502268;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QB7Gju0RIgr9jLJ+t5Q7M0pre/bo/tmwE6J1WO4l68M=;
        b=vsSDvQEiSH+Qkmgxy9nRI5uFlZxgedEQrxoTraZFkhDdzXrli/C/4UUN27jpRFqDJY
         a7QD6kd1qFKsH4dnv+P6ui3bTzv0keflNcyBCYEnjqVRfcXOIBZUU7aTAXxjRfk8eogV
         qty7xPZii5E+f8kETNWYKUFGrpJN3pneIb3cXcFBCcyfU39iSPozVw8rLCCNNGu2IIns
         hcsBxQUV2bDxeH5+dfheSreYPAGb9rEH9+CfpLm8TPLzBkqHtgqRTkYUZ7BJ1U7eUm6y
         4AyjOaZ0du09t7YUziRtcvZmg6lRyxWfvLDBJx2TD0yuP9XFRMiIEoXRUWRd0ePy0cU9
         BOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCViL1j4xHlWWgDQJDpeE8zy9QhBrQuNqVP9kClaSkamAj0OMVEdR47YvGehSAwPkdvVKTItoI+Nv2Ejb0mxlpsi@lists.infradead.org
X-Gm-Message-State: AOJu0YyDZbYoH7VHKToF4bqKMFg3ZA+904sdqM2YQKr/IDW55JQcZuuk
	yufZYG3COEyDPUpxITuVuIc4hqLeo5NO7+NhrOJpvh1nyZFzm/C5HwaEKGitUKc=
X-Gm-Gg: ASbGncuOtedUUux+v/8RSaYoOt3FLppnIq+6Iobu+KKaVG+baplZSjZHTvufirwtCP7
	wpoD4yS6j4Xpu7fqRtuEgXWrGb+GVOrV+QRmAGycdvEeBk17Q2LbxJ6TCm4zMTH1eANY6DLc345
	Tt3PdCZ+hiZI2aN6o+ALUXuyWFExeKjBbeSdv7IeDN4NuXKHo0Y4j/45WBrV+4sNAJ43QEhe8P1
	4ePgpFkRJjguNigOpG4o0TBepz9d7gTFck07thxOyKZPPRimkPX8e3EriynVk7vULZBkoaXTSny
	CvI8F1a5MVEHV7ZSC49TRC0=
X-Google-Smtp-Source: AGHT+IHovqEE/ZGS2FK/ULFvVF1bTBtDYpXgDWtKvoluSSVf7ExMHwXGJ8cq8SZ8vVf7DFdkQBZM8A==
X-Received: by 2002:a05:6a00:4f88:b0:729:a31:892d with SMTP id d2e1a72fcca58-72d21fa5cecmr42495186b3a.8.1736897468403;
        Tue, 14 Jan 2025 15:31:08 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405943fcsm7955165b3a.78.2025.01.14.15.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 15:31:07 -0800 (PST)
Date: Tue, 14 Jan 2025 15:31:05 -0800
From: Joe Damato <jdamato@fastly.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Optimize cache prefetch in
 RX path
Message-ID: <Z4bzuToquRAMfvvu@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736777576.git.0x1207@gmail.com>
 <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_153109_764254_B32EFD23 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Jan 13, 2025 at 10:20:31PM +0800, Furong Xu wrote:
> Current code prefetches cache lines for the received frame first, and
> then dma_sync_single_for_cpu() against this frame, this is wrong.
> Cache prefetch should be triggered after dma_sync_single_for_cpu().
> 
> This patch brings ~2.8% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca340fd8c937..b60f2f27140c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  		/* Buffer is good. Go on. */
>  
> -		prefetch(page_address(buf->page) + buf->page_offset);
> -		if (buf->sec_page)
> -			prefetch(page_address(buf->sec_page));
> -
>  		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
>  		len += buf1_len;
>  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
> @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  			dma_sync_single_for_cpu(priv->device, buf->addr,
>  						buf1_len, dma_dir);
> +			prefetch(page_address(buf->page) + buf->page_offset);

Minor nit: I've seen in other drivers authors using net_prefetch.
Probably not worth a re-roll just for something this minor.

