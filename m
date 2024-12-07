Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E7E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 05:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+IwYaynpcQ+9RTCAJedrXXepYT48CIPEoJXkJRmDR8=; b=nkHRfSofeeODekeQPuTdJKJwtc
	S8zaxff4x/rsZ1jGDdaRoAapBCcYQBZcbr3JqIzqtqMnEazVLSJ6jB/5Qv7RaPQlyFLIerU1S6SlR
	X41npeBSp4hApb12eeozRzikHegT1GYRLqRLiibWoAFT39ILCaZJXcyfw0QK9LFW71S+RtU1LXMhh
	HFTc2jg+nZFYDuGP9Pg+1S5y78I8cICrRPstlt/9NSpHXkM/cBUnmNXwJQfL5cDrmtkmYEkLHQtib
	Q5Ztw24tk1FedFfMN0HhOyUPuSfBoR7HeVdzNwJ84spmEXIF6BHZVU1+7eF9RcYkPA5Z7dd3cT0lM
	UPX+xILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJnl4-00000003Swi-21tm;
	Sat, 07 Dec 2024 05:53:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJnk2-00000003SlO-00Z6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 05:52:35 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so1956432a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 21:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733550753; x=1734155553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+IwYaynpcQ+9RTCAJedrXXepYT48CIPEoJXkJRmDR8=;
        b=lvhbvZgtBsCpE7AOVHN7s/WFaNcg0u9J0mBHt0V9zF7CB6JK7bKxUVwP8lXG63U4Nz
         Fs+vEREwNL9Ij+v1MfXCam/Mypd2m3oqm8tfZz9+Hhq3sG86+71I00CV4wEGMCPgGatN
         WWSKx3cbWftKsTvzHIaC6k5ak1DCCn0jpyGur3XLIC3nK6fofjNNLoxg3spWzxeDoUX5
         eAUwJt0c/equokWzNUS3fAafrbFhJ5WeYbm5fSs/aZ3fpPXUZGgEE14AyevB2KPpFQpA
         +Z9H62mlZqSjLMqBDkTzm17ovWRTd+masV2tCddmv67nd9FIHy3Z+acJnwPzrfuTdJlP
         X2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733550753; x=1734155553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+IwYaynpcQ+9RTCAJedrXXepYT48CIPEoJXkJRmDR8=;
        b=w5KcOab4KkFuGhwZDMiPN7IDQc7zPR4PZWhUntuzq64OMeRTI8rPF/EQuP9My2yZAI
         c9MZTYaysU+YwO2dR1CGj1J4Ecq7eE1xhdRfrJfvI9cwtXWm12it8IBPd3a4uQlg8QXb
         aNkTIKnwQfb0uDESCUENuGGqOzWYIPdC0PlLY+YoOW2rLVy20pr/qM2/UyG/2+Qzzt+b
         wkGFr3xz0H2+GX/mCO7OI+ao0kQeSnADKZknq6KdE4IRJwZu0eofZyt/g/HnHqh1x93b
         /3BfRZkdoXTxUq9fNNhWnoMxUr1N+GW4Ts6kTtifVT8Dh/8XZbbMn+U2SlQPxB1+40al
         hc/g==
X-Forwarded-Encrypted: i=1; AJvYcCUmW5pgTJWbULBeA6UImN8VlKOsa0gPJu86OnANaalpgk4nmomchWorEpLB/HspMe3fyplJfDlTh4yZyGV4lErQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCIWj99O9Lr2ZxCIBQckZ4/jk7WdLwDB6yVLQVzJ6e199lQcwT
	5Z83OPPHhtuVBxJ3fo5DAQu0GUBEopUfI8WclSBGugvSOJ1qmIG0
X-Gm-Gg: ASbGnctEWm8oQBdNFSEJSrzbWWMo1BhQwX7VnhHxFItRNYHjRhf6WWVYuCKI1YfYavg
	glOq94Dr5Mt4v4nglRpONTXQ4rnA+Gx2cTJuCJ40aXz1U6m3+XW/4XjquFwUpdrPIQUbyL23gFX
	GNaZU2nnJSoTJ+NU0DhbTrgBE3x6TbjQfSkSb4FqlpW3+zKAyjKqZf9zQFZNmpxCDAoaLSu0VAf
	Hswzt75xqpUmxms0RsVvaRiHtvKCU837JIEYIoMvB6cqsc=
X-Google-Smtp-Source: AGHT+IFd+wuygMRSPeO8wa52NvVHAGLuFfQ5jfbHspHxQMyW7jzkp1weeY7rmM4U0gg8Uv3suuUZQA==
X-Received: by 2002:a05:6a21:3e04:b0:1e0:c3bf:7909 with SMTP id adf61e73a8af0-1e187132cf7mr8429490637.41.1733550752776;
        Fri, 06 Dec 2024 21:52:32 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2a903a3sm3811288b3a.116.2024.12.06.21.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 21:52:32 -0800 (PST)
Date: Sat, 7 Dec 2024 13:52:17 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, MaximeCoquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@gmail.com>, Simon Horman <horms@kernel.org>, Hariprasad
 Kelam <hkelam@marvell.com>
Subject: Re: [PATCH net] net: stmmac: fix TSO DMA API usage causing oops
Message-ID: <20241207135217.00000f0f@gmail.com>
In-Reply-To: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
References: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_215234_076828_78D4C80D 
X-CRM114-Status: GOOD (  16.64  )
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

On Fri, 06 Dec 2024 12:40:11 +0000, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Commit 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap
> for non-paged SKB data") moved the assignment of tx_skbuff_dma[]'s
> members to be later in stmmac_tso_xmit().
> 
> The buf (dma cookie) and len stored in this structure are passed to
> dma_unmap_single() by stmmac_tx_clean(). The DMA API requires that
> the dma cookie passed to dma_unmap_single() is the same as the value
> returned from dma_map_single(). However, by moving the assignment
> later, this is not the case when priv->dma_cap.addr64 > 32 as "des"
> is offset by proto_hdr_len.
> 
> This causes problems such as:
> 
>   dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> 
> and with DMA_API_DEBUG enabled:
> 
>   DMA-API: dwc-eth-dwmac 2490000.ethernet: device driver tries to +free DMA memory it has not allocated [device address=0x000000ffffcf65c0] [size=66 bytes]
> 
> Fix this by maintaining "des" as the original DMA cookie, and use
> tso_des to pass the offset DMA cookie to stmmac_tso_allocator().
> 
> Full details of the crashes can be found at:
> https://lore.kernel.org/all/d8112193-0386-4e14-b516-37c2d838171a@nvidia.com/
> https://lore.kernel.org/all/klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw/
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reported-by: Thierry Reding <thierry.reding@gmail.com>
> Fixes: 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data")

Much appreciated for this fix.

Reviewed-by: Furong Xu <0x1207@gmail.com>


