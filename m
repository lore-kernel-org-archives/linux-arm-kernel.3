Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04ADC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 15:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKw2SOCMf2JGxTXIqSAP0tOzr6+c+Tge86dZCU0DFh8=; b=S8U9rul1I9Of3H+yDB6plbaCj6
	ZnC2uFjAg2NYSx8NZpSGuY87XpYclTkmGen7MnxlJT5dIgNkqW/U+7/bzxa/EOtgZqtoTYLuHo/Ov
	GJN5sJAUJOUlSAqiArbiSCAJtdJmOFiKA7TvnwLZt1LmPLVrYslzm4vnfzvtn1kNsCoEX/zFMakse
	oEjJdKowPtxsOilxEIF2blMbMKQPCyA2/OQ0LU2TVBxRl3aP2hJdhoa5i9Hd6Qu7jla3d6+Yed13t
	qu/Dj7bA0108oN3r9sdodczIXuHOhPWa3ca/Q1TxbvwFYrN6gmGhbP/ciBks0zs25OiOUmPa+GlYL
	RqILj7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbhj2-0000000GVsr-3bCn;
	Sat, 25 Jan 2025 15:05:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbhhd-0000000GVjk-13I6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 15:04:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21670dce0a7so63081615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 07:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737817444; x=1738422244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKw2SOCMf2JGxTXIqSAP0tOzr6+c+Tge86dZCU0DFh8=;
        b=PKMNbyceMfYU03sBzk/oCSYQY7ffiWPWpaF1XplLD0CmZUO5leO2dXhfElpEvVAUqm
         F4pK77wZZi6VAvW2sTMvNy6/6BCXkM1RcmKFDWSMeXOVmHK2tAb/u59hoUs+tnM6o3ZL
         gLo315JS45Fzv0PoRht+f552RHEi+Iwb4HAJVmtV09Gs8D+O8v2mH5d4M6IUsSHFv+fi
         Qplw461D+mwVFPLVGFew6ya+s38OXxA7yVWQoNvJLJkexmU54yYdAVpcaaVwH2BjIU27
         wObojDwUP2gaFomkNbNjQgxO4gWKi+U8t4Q+rS5NCE90Rd0v++DbLOHaMJ9CPqWxR7+Y
         PNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737817444; x=1738422244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKw2SOCMf2JGxTXIqSAP0tOzr6+c+Tge86dZCU0DFh8=;
        b=ehZmHjoUFUgMwLWuZpPkwmlkvxYj2I3q6yNknpFT1r1+28hl37BFQJ0cya+Idjg1Ka
         5t4/qtEymG0SLxvOzUFliw3S0Jw3410KLWSYSTYJgcmUpiHypPEAZp9WrUD4wiY5/KQY
         ucG22rbzbQqcJPx0H7I4Rl+f+sFAHqRFLpyFx7Lv+dYu21z/3VkUO2sO3KXgVmBmyIiO
         vLDp8wZwVeE86cWForQsBUT6iMPukMEABAGbXWQtXW9Mr6RZd2lZeLVlXRPwj2UpxKUE
         /fyC52yFKVU4NvOlh21y49azYVPs+aWvJlFj9LcuqM1X6PXr27NGgHuYl61fhuyIizTi
         fSTA==
X-Forwarded-Encrypted: i=1; AJvYcCVcABSIn8Gv76Rio4j2t+C6NE9j+QyO8f14eQMZ2MlrUhnlIQW6ROYTGY6pFOqnucMpXKeXnGma+YdmgmCEttzw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6YmynCny3YL0IG2ATG/Vxm/FksN2AtJeZ8qO/dCr2A04M+LMa
	LQeTa1xpXAsVne+aUGMFVxmtb3+FjPXm6rW17GN4l/Wd3BF7hFTX
X-Gm-Gg: ASbGncu2kt0Lp3iS7xmLLCxcRnbKqxoWJ1QLK0H+fRcTIjxXpHOCDB3x2p6aDL+xPIF
	RG115GpYi+XCmG79V7idCXqYNhhedLzb0Y6VupYvs4vsS4pbIvHEkEt7dYudnfcMB+mTJAAo3hz
	nYzBdBOEe+LDA56ACxTfiBQYTDOvn6LCXV9Cvgz4/fQfedEoKKVX9TkKCZ2T0VXDRISuagB08In
	4mpnN8NgPvX3eThWDJ965ZWE4gCK1MtbRcgNXavqXL4e2q2hhsroZt0/MGzZviTZWpA9BOwFMh9
	FA==
X-Google-Smtp-Source: AGHT+IFVzWzSGBn66Dc2tB9vnmWyHkByC3/61GF44GlshncBb/NN1MnhhqsxwhJuUAHRXdCbEwQ2Dw==
X-Received: by 2002:a05:6a00:92a0:b0:725:df1a:27c with SMTP id d2e1a72fcca58-72dafa4ce00mr48575267b3a.14.1737817444411;
        Sat, 25 Jan 2025 07:04:04 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fde0sm3933161b3a.18.2025.01.25.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 07:04:04 -0800 (PST)
Date: Sat, 25 Jan 2025 23:03:47 +0800
From: Furong Xu <0x1207@gmail.com>
To: Ido Schimmel <idosch@idosch.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Brad Griffis <bgriffis@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
 <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <20250125230347.0000187b@gmail.com>
In-Reply-To: <Z5S69kb7Qz_QZqOh@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	<ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
	<20250124104256.00007d23@gmail.com>
	<Z5S69kb7Qz_QZqOh@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_070405_301363_EBCA2B9F 
X-CRM114-Status: GOOD (  28.74  )
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

Hi Thierry

On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:

> On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> > On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> > wrote: 
> > > > Just to clarify, the patch that you had us try was not intended
> > > > as an actual fix, correct? It was only for diagnostic purposes,
> > > > i.e. to see if there is some kind of cache coherence issue,
> > > > which seems to be the case?  So perhaps the only fix needed is
> > > > to add dma-coherent to our device tree?    
> > > 
> > > That sounds quite error prone. How many other DT blobs are
> > > missing the property? If the memory should be coherent, i would
> > > expect the driver to allocate coherent memory. Or the driver
> > > needs to handle non-coherent memory and add the necessary
> > > flush/invalidates etc.  
> > 
> > stmmac driver does the necessary cache flush/invalidates to
> > maintain cache lines explicitly.  
> 
> Given the problem happens when the kernel performs syncing, is it
> possible that there is a problem with how the syncing is performed?
> 
> I am not familiar with this driver, but it seems to allocate multiple
> buffers per packet when split header is enabled and these buffers are
> allocated from the same page pool (see stmmac_init_rx_buffers()).
> Despite that, the driver is creating the page pool with a non-zero
> offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> headroom, which is only present in the head buffer.
> 
> I asked Thierry to test the following patch [1] and initial testing
> seems OK. He also confirmed that "SPH feature enabled" shows up in the
> kernel log.

It is recommended to disable the "SPH feature" by default unless some
certain cases depend on it. Like Ido said, two large buffers being
allocated from the same page pool for each packet, this is a huge waste
of memory, and brings performance drops for most of general cases.

Our downstream driver and two mainline drivers disable SPH by default:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c#n357
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c#n471

