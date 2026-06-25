Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF6CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G69PCEOlnq92SdyMP8AGIKg5XJgYw5Jrc7HuDLGgvos=; b=3nZKUffHnVIjxkLZwSJxqXN30L
	PuTO7THZyYT+lGr7XBbNx+VMat1aptrf7cuMcC+iRr0vyJShiH3fytnXPznL5X9ZnKY2tAC4hEkWD
	xhnJavPTSPehDG5f46IvtPIpEOKtLLwz2IHkBqxikUgBsi1KADW6pQ7n6hU2wC75Bg9FVJA2egj1+
	kjokSrh00n1tFNH2yn6WSFXFS6Q8SKPrU7bhnR3cOaioMJTCntu0th4L8NR5eJl6E1hLFHK/MEYlT
	MaJs1ydJx4/z1PP7m9lV4wZhKQ5U3+FVnrm6FU6xRHgJJ+17LsF1rckAwq08tHuCFxuZ7DkSA1c2W
	vVkFXjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg7I-00000008srW-1ZCG;
	Thu, 25 Jun 2026 09:11:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg7F-00000008sqP-2vr6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:11:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-46dd46901dbso358750f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378680; x=1782983480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G69PCEOlnq92SdyMP8AGIKg5XJgYw5Jrc7HuDLGgvos=;
        b=D63n17CRyU/oFNKRRfaoCPeUkFulDaNvcv6IP+SCiwdvXyL/iFNqrWfDNg9arQV5WF
         cbI6OFPYo3F29g7LI+mAmpEdWNI0P45qfNflEg0DGA0xfQHL4lqCUvVZqXdFdQojVilG
         BRuBRSrWAkERCxN+wyFilOk1vQky033Uf0FrpxLqVcZTYxEJX9v0bIhoZAo2BJPBqC7q
         OoxbPMoi4sMN6vIbafYeGmCQfDruxTWX8sSoVounjs2LykYffnFVqig+nly7BihcJZ2S
         SRhm0iju14nQ9xR0zIbNMHHw2pCkKrBsTSHI4Zy+m5rNfog7nPPQEnZluD2oNLR9006i
         Y6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378680; x=1782983480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G69PCEOlnq92SdyMP8AGIKg5XJgYw5Jrc7HuDLGgvos=;
        b=kxPO8n4kNSuX2xYBVrJMefi/I2Pzg0neVladqrNflAKecqK01sHJJt8D3tYj/Lk39E
         gASpulJPL1CDYjWDag2pRoHho1du/O3zEkmKKo8rcrLlMHGFd6buaMxoBgqoPaCaLSCE
         Bug6sOH0vBTNhf/6/cimkysRD7VESVRUuTQryKRo+0++Z+TuhxL1xA84sed5X9XH9Szp
         Z8ZDupcVqgu368nODnxNgz/uJ0LSsrJRbUWwrihkXsNiXvJRnIiTf/JCsgck2+m8WSQt
         hNgLxqiIJnbpn1LYr8F8OI/qdql2f+ke8rr17HFsH11dDBrjSQvymNgrzhcIQ59LWnIP
         fwvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIF8XRt05CMTPWDaUSHH4MkO+IibMzZOD8pP7PNKWbbvn/vhFrmY6nALda1YNOOYGixx0uZnkyWn2F9IPTrs9G@lists.infradead.org
X-Gm-Message-State: AOJu0YyZpDt7UWdV7FB8P+bKJj0qRbKgGt5AVUY5tKF9pDIIHTELVwkY
	OXYpMoLBy2U3dRllFw3hmrkfoiIhFVA76/g00TlAMqUbHK+xbOBnjZsL
X-Gm-Gg: AfdE7clNF1CWsG/RyTkZSpyq/iOJN1qKau8poDofTZQLhkY9liGAQX2JRgZR5ZmD7pU
	9Ae4KK7mLuKwGK4nCMBuyiksVDBaXePXbb95ZhJ7bDvwA12bT1f5jFa+Gw4IW8DSFeKiFoGv7hK
	sykEozz3BXxz+JzPLnJNA5c3uDh3R9yiMsiUW5jypTw3rFD5vYvyZKJP7fGTLCSVk8lUgVfci8V
	nTZDHOd7JaiqvaIbvrlDHEz3QjUyq5v3VOwGjP9AqfLRYGqG0E0Hc96KFmnsxbMCHl0h9R/IHQQ
	J7EVPC5QJv8SrnsJFLVgQoAOMOzyscs+jjN7Lxw/D6n8UYhYul8DUVd9BrAJZy5mHsgbfA28G7j
	pmkJWwG5xWD8glE9SsVxOO8tTa0aleKqud2Hn2YrhIoLpTEVyFSyEwwDxurY1zttRTg==
X-Received: by 2002:a05:6000:41fc:b0:46d:47bb:d711 with SMTP id ffacd0b85a97d-46dc0e050d9mr2295206f8f.23.1782378679096;
        Thu, 25 Jun 2026 02:11:19 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46e3d6ba143sm209356f8f.33.2026.06.25.02.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:11:18 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:11:16 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
Message-ID: <ajzwtNbCKXdxQAUA@eichest-laptop>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
 <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_021121_752594_65C76C29 
X-CRM114-Status: GOOD (  25.89  )
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

On Mon, May 25, 2026 at 06:43:16PM +0200, Vincent Jardin wrote:
> SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the
> interrupt-driven block-read state machine rejects it as -EPROTO. Worse,
> it returns without a NACK+STOP: the next receive cycle has already
> started, so the target keeps holding SDA and the bus stays stuck until a
> power cycle of this i2c controller.
> 
> Accept count=0: NACK the in-flight dummy byte (TXAK) and set msg->len to
> 2 so i2c_imx_isr_read_continue() emits STOP via its normal last-byte
> path. The dummy byte is discarded; block-read callers only consume
> buf[0..count-1].
> 
> Reading I2DR has likewise already armed the next byte on the
> count > I2C_SMBUS_BLOCK_MAX error path, so NACK it (TXAK) before aborting
> with -EPROTO; otherwise the failing transfer's STOP cannot complete and
> the bus stays held.
> 
> The atomic path regressed earlier (v3.16) and is fixed separately; this
> patch covers only the v6.13 state-machine rework.
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Cc: <stable@vger.kernel.org> # v6.13+
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  drivers/i2c/busses/i2c-imx.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 14107e1ad413..8db8d2e10f5c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1061,11 +1061,28 @@ static inline enum imx_i2c_state i2c_imx_isr_read_continue(struct imx_i2c_struct
>  static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
>  {
>  	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	unsigned int temp;
>  
>  	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
> +		/*
> +		 * SMBus 3.1 6.5.7: support count byte of 0.
> +		 * I2C_SMBUS_BLOCK_MAX case should not hold the SDA either.
> +		 * So NACK it (TXAK) to not hold the bus.
> +		 */
> +		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +		temp |= I2CR_TXAK;
> +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +		if (len == 0) {
> +			i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = 0;
> +			i2c_imx->msg->len = 2;
> +			return;
> +		}
> +
>  		i2c_imx->isr_result = -EPROTO;
>  		i2c_imx->state = IMX_I2C_STATE_FAILED;
>  		wake_up(&i2c_imx->queue);
> +		return;
>  	}
>  	i2c_imx->msg->len += len;
>  	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
> 
> -- 
> 2.43.0
> 

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

